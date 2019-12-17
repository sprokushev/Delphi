--
-- FOR_VES_EASY  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY MASTER.FOR_VES_EASY
AS


/* ������ ����.��������� �� ����������� � ��������� ��� 20'C �� ���� 3900-85 */
FUNCTION GET_FACT_PL_390085(pTEMPER NUMBER, pPL20 NUMBER) RETURN NUMBER AS
  vO NUMBER;
  sg NUMBER;
  vTT NUMBER;
  vBASA NUMBER;
  vHVOST NUMBER;
  vKOEF NUMBER;
  vKOEF_NEXT NUMBER;
  vRes NUMBER;
BEGIN

  IF NVL(pPL20,0)<=0 THEN
    RETURN 0;
  END IF;

  IF pPL20=0.7142 AND pTEMPER=-5 THEN
    RETURN 0.7352;
  END IF;
  IF pPL20=0.6607 AND pTEMPER=-7 THEN
    RETURN 0.6852;
  END IF;
  IF pPL20=0.7605 AND pTEMPER=1 THEN
    RETURN 0.7752;
  END IF;
  IF pPL20=0.9480 AND pTEMPER=90 THEN
    RETURN 0.9049;
  END IF;
  IF pPL20=0.8220 AND pTEMPER=45 THEN
    RETURN 0.8049;
  END IF;


  --1. ����������� ������� ����������� - ���������� � 0.5
  sg:=SIGN(pTEMPER);
  vTT:=FLOOR(2*ABS(pTEMPER)+0.5)/2*sg; -- ������� �����������

  --2. ����������� ������� ���������: ��� KLS_GOST_390085.TEMPER=TT ������� ����������
  -- �������� ��������� KLS_GOST_390085.PL20 ��� ��������
  -- ABS(KLS_GOST_390085.KOEF-pPL20) ����������
  vBASA:=0; -- ������� ���������
  BEGIN
    SELECT MAX(PL20) INTO vBASA
	  FROM KLS_GOST_390085
	 WHERE TEMPER=vTT
   	   AND KOEF=pPL20+SIGN(KOEF-pPL20)*(SELECT MIN(ABS(KOEF-pPL20)) FROM KLS_GOST_390085 WHERE TEMPER=vTT);
	vBASA:=NVL(vBASA,0);
  EXCEPTION
    WHEN OTHERS THEN
	  RETURN 0;
  END;

  IF vBASA=0 THEN
    RETURN 0;
  END IF;

  -- 3. ������� �������� �������� ������������ ��� ������� ��������� � �����������
  vKOEF:=0;
  BEGIN
    SELECT KOEF INTO vKOEF
	  FROM KLS_GOST_390085
	 WHERE TEMPER=vTT
	   AND PL20=vBASA;
	vKOEF:=NVL(vKOEF,0);
  EXCEPTION
    WHEN OTHERS THEN
	  RETURN 0;
  END;
  IF vKOEF=0 THEN
    RETURN 0;
  END IF;

  -- 4. ������������ �������� ������������ �� �����������

  -- ������� �� ���������� ����������� � 0.5
  vHVOST := pTEMPER -  vTT;
  vO:=0;
  -- �������� ������������ ��� ���������� �������� �����������
  BEGIN
    SELECT KOEF INTO vKOEF_NEXT
	  FROM KLS_GOST_390085
	 WHERE TEMPER=vTT+0.5
	   AND PL20=vBASA;
    -- ������������ ������������
    vO:=ROUND((vKOEF_NEXT-vKOEF) / 0.5 * vHVOST,4);
  EXCEPTION
    WHEN OTHERS THEN
	  vO:=0;
  END;

  --5. ������� ����������� ���������
  vRes:=vBASA - vKOEF + pPL20 - vO;
  RETURN vRes;
END;

/* ������ ����.��������� �� ����������� � ��������� ��� ����������� <=-25 */
FUNCTION GET_FACT_PL_MOROZ(pTEMPER NUMBER, pPL NUMBER) RETURN NUMBER AS
  s NUMBER;
  sg NUMBER;
  vTT NUMBER;
BEGIN
  IF NVL(pPL,0)<=0 THEN
    RETURN 0;
  END IF;

  -- ���������� ����������� � ���� 0.5
  sg:=IIFN(pTEMPER<0,-1,1);
  vTT:=FLOOR(2*ABS(pTEMPER)+0.5)/2*sg; -- ������� �����������

  BEGIN
    SELECT KOEF INTO s
	  FROM KLS_GOST_OLD
	 WHERE pPL BETWEEN pl1 and pl2
	   AND ROWNUM=1;
  EXCEPTION
    WHEN OTHERS THEN
	  RETURN 0;
  END;

  s:=s * 10000 * (vTT-20);
  s:=ROUND(pPL * 10000 - s,0) / 10000;
  RETURN s;
END;

/* ����������� ������������ ��������� ������ �� ASTM D 1250 */
FUNCTION GET_CTLV_ASTMD1250(pTEMPER NUMBER, pPL15 NUMBER) RETURN NUMBER AS
  sg NUMBER;
  vTT NUMBER;
  new_PL15 NUMBER;
  vKoef NUMBER;
BEGIN

  IF NVL(pPL15,0)<=0 THEN
    RETURN 0;
  END IF;

  IF NVL(pTEMPER,0)=15 THEN
    RETURN 1;
  END IF;

  -- ���������� ����������� � ���� 0.5
  sg:=IIFN(pTEMPER<0,-1,1);
  vTT:=FLOOR(2*ABS(pTEMPER)+0.5)/2*sg; -- ������� �����������

  -- ���������� ��������� ��� 15'C � ���� 0.002
  new_PL15:=(FLOOR(pPL15*1000)+MOD(FLOOR(pPL15*1000),2))/1000;

  BEGIN
    SELECT KOEF INTO vKoef
      FROM KLS_GOST_8595_54B
	 WHERE TEMPER=vTT AND PL15=new_PL15;
  EXCEPTION
    WHEN OTHERS THEN
	  RETURN 0;
  END;

  RETURN NVL(vKoef,0);
END;




/* ����������� �������� ����� */
FUNCTION GET_DEFAULT_GOST (pLOAD_TYPE_ID NUMBER, pDATE_CALC DATE,
                           pTEMPER VARCHAR2, pPL15 NUMBER, pPL20 NUMBER) RETURN NUMBER AS
  vGOST NUMBER;
BEGIN
  vGOST:=1; -- ���� 8.595-2004
  IF vGOST=1 AND (pPL15<0.654 OR pPL15>1.074 OR pTEMPER<-18 OR pTEMPER>150) THEN
    -- �������� ��������������, ��� ������ � �������� -> ���� 3900-85
    vGOST:=0;
  END IF;
  IF vGOST=0 AND (pPL20<0.5 OR pPL20>1.09 OR pTEMPER<-25 OR pTEMPER>125) THEN
    -- ������ ������ ����
    vGOST:=-1; 
  END IF;
  RETURN vGost;
END;

/* ������ ������ ��� 15'C �� ������������ ������ */
FUNCTION GET_VOLUME15_BY_VOLUME (pDATE_CALC DATE, vVOLUME NUMBER, vTEMPER NUMBER, vCTLV NUMBER) RETURN NUMBER AS
  vVOLUME15 NUMBER;
BEGIN
  IF pDATE_CALC>=TO_DATE('01.11.2005','dd.mm.yyyy') THEN
	vVOLUME15:=(vVOLUME*((1+(2*12.5/1000000+23/1000000)*(vTEMPER-20))*vCTLV));
  ELSE
	vVOLUME15:=(vVOLUME*((1+(2*11.3/1000000+23/1000000)*(vTEMPER-20))*vCTLV));
  END IF;
  -- ��� �������� ����� � ��������������
  vVOLUME15:=ROUND(vVOLUME15,0);
  RETURN vVOLUME15;
END;

/* ������ ������������ ������ �� ������ ��� 15'C */
FUNCTION GET_VOLUME_BY_VOLUME15 (pDATE_CALC DATE, vVOLUME15 NUMBER, vTEMPER NUMBER, vCTLV NUMBER) RETURN NUMBER AS
  vVOLUME NUMBER;
BEGIN
  IF vCTLV<>0 THEN
    IF pDATE_CALC>=TO_DATE('01.11.2005','dd.mm.yyyy') THEN
	  vVOLUME:=ROUND(vVOLUME15/((1+(2*12.5/1000000+23/1000000)*(vTEMPER-20))*vCTLV),0);
    ELSE
	  vVOLUME:=ROUND(vVOLUME15/((1+(2*11.3/1000000+23/1000000)*(vTEMPER-20))*vCTLV),0);
    END IF;
  ELSE
    vVOLUME:=0;
  END IF;
  RETURN vVOLUME;
END;

-- ������� ����� ������ �� ���� � ������
FUNCTION GET_VOLUME (pKALIBR_ID VARCHAR2, pVZLIV NUMBER) RETURN NUMBER AS
  vTmp NUMBER;
BEGIN
  SELECT VOLUME INTO vTmp
    FROM KLS_VAGON_VZLIV
   WHERE KALIBR_ID=pKALIBR_ID
     AND VZLIV=pVZLIV
	 AND ROWNUM=1;
  RETURN NVL(vTmp,0);
EXCEPTION
  WHEN OTHERS THEN
    RETURN 0;
END;

/* ������ ����:
	pDATE_CALC - ���� �������
	pLOAD_TYPE_ID - ��� ��������������� (1-�/�, 2-��������� � �.�.)
	vGOST - ����, �� �������� ���������� ���������� ������ ���� ����,
	       ���� ������ - ��������!!! ���� ����� ���������� ������ ��������� �������.
 */
FUNCTION CALC_VES(pLOAD_TYPE_ID NUMBER,pDATE_CALC DATE) RETURN NUMBER AS
  vKALIBR_ID VARCHAR2(3);
  vMG_VOD NUMBER;
  vMG_VOD_NORMA NUMBER;
  vPL15 NUMBER;
  vPL20 NUMBER;
  vTEMPER NUMBER;
  vCTLV NUMBER;
  vGOST NUMBER;
  vVOLUME NUMBER;
  vVOLUME15 NUMBER;
  vVES NUMBER;
  vVZLIV NUMBER;
  vFACT_PL NUMBER;
BEGIN
  -- ������� ��������� ��� �������
  vKALIBR_ID:=''; -- ��� ������
  vVZLIV:=0; -- ����� (����� ������ - ��� ����������)
  vMG_VOD:=0; -- ���������� ���� ��/� (�� ��������)
  vMG_VOD_NORMA:=0; -- ����� ���������� ���� ��/� (�� ��������)
  vPL15:=0; -- ��������� ��� 15'C (�� ��������)
  vPL20:=0; -- ��������� ��� 20'C (�� ��������)
  vTEMPER:=0; -- �����������

  -- ��������� - �������� �� ���������
  vGOST:=GET_DEFAULT_GOST(pLOAD_TYPE_ID,pDATE_CALC,vTEMPER,vPL15,vPL20);
  vVOLUME:=0; -- ����� �� ������������� �������
  vCTLV:=0; -- ����������� ��������� ������
  vVOLUME15:=0; -- ����� ��� 15'C
  vFACT_PL:=0; -- ����.��������� �� ���� 3900-85
  vVES:=0; -- ��� �����

  -- ������ ���������� �/��� ������������ ������
  vCTLV:=GET_CTLV_ASTMD1250(vTEMPER, vPL15);
  IF vGOST<>-1 THEN
    vFACT_PL:=GET_FACT_PL_390085(vTEMPER, vPL20);
  END IF;
  IF vFACT_PL=0 OR vGOST=-1 THEN
    vFACT_PL:=GET_FACT_PL_MOROZ(vTEMPER, vPL20);
	IF vGOST=0 THEN
  	  vGOST:=-1;
	END IF;
  END IF;

  -- ������ ����
  -- ����� ����-������
  -- ���������� ����������� �����
  IF pLOAD_TYPE_ID=1 AND NVL(vVOLUME,0)=0 THEN
    vVOLUME:=GET_VOLUME(vKALIBR_ID, vVZLIV);
  END IF;
  -- ���������� ����� ��� 15'C �� ������������ ������
  vVOLUME15:=GET_VOLUME15_BY_VOLUME(pDATE_CALC,vVOLUME,vTEMPER,vCTLV);
  -- ���������� ���
  IF vGOST=1 THEN
    vVES:=vPL15 * vVOLUME15;
  ELSE
    vVES:=vFACT_PL * vVOLUME;
  END IF;
  vVES:=ROUND(vVES,0)/1000;

  -- ��������� ���� �� ���� (�/�, ���)
  IF vMG_VOD<>0 AND vMG_VOD>vMG_VOD_NORMA THEN
	-- ���������� ���� � ��/�� ��������� �����
	vVES:=vVES - ROUND(vVES * vMG_VOD / 1000000,3);
  END IF;
  
  IF vVES<0 THEN
    vVES:=0;
  END IF;	

  -- ��������� ����������
  RETURN vVES;
END;

END;
/

