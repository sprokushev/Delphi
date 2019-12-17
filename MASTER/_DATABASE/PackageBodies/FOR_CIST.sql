--
-- FOR_CIST  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY MASTER.For_cist AS

/* ���������� ������� */

  -- ������
  PROCEDURE RaiseError (pText VARCHAR2) AS
  BEGIN
    ROLLBACK;
    RAISE_APPLICATION_ERROR(For_Scripts.SG$NO_CORRECT, pText);
  END;

-- ���������� ������� ������ � �����������
FUNCTION CIST_EXIST (pNUM_CIST VARCHAR2, pLOAD_TYPE_ID NUMBER DEFAULT 1) RETURN NUMBER AS
  vRes NUMBER(1);
  vNum KLS_CIST.NUM_CIST%TYPE;
BEGIN  
  IF pLOAD_TYPE_ID IN (1,6) THEN
    -- ���� �������� �/� �����������
	vRes:=0;
	vNum:=0;
	-- ����������� ����� ������ � �����
	BEGIN
	  vNum:=TO_NUMBER(pNUM_CIST);
	EXCEPTION
	  WHEN OTHERS THEN
	    vNum:=0;
	END;
	-- ���� ���������� � �����������
	IF vNum<>0 THEN
	  BEGIN
	    SELECT 1 INTO vRes
	      FROM KLS_CIST
	     WHERE NUM_CIST=vNum
	       AND ROWNUM=1;
	  EXCEPTION
	    WHEN OTHERS THEN
	      vRes:=0;
	  END;
	END IF;
    RETURN vRes;
  ELSE
    -- ���� ������ ���� ����������;
	RETURN 0;
  END IF;
END;
  
-- ������� ��������� �������
FUNCTION GET_ID_NPR (pNUM_CIST VARCHAR2, pLOAD_TYPE_ID NUMBER DEFAULT 1) RETURN VARCHAR2 AS
  vRes KLS_CIST.PROD_ID_NPR%TYPE;
  vNum KLS_CIST.NUM_CIST%TYPE;
  vCode NUMBER;
BEGIN
  IF pLOAD_TYPE_ID IN (1,6) THEN
    -- ���� �������� �/� �����������
	vRes:='';
	vNum:=0;
	-- ����������� ����� ������ � �����
	BEGIN
	  vNum:=TO_NUMBER(pNUM_CIST);
	EXCEPTION
	  WHEN OTHERS THEN
	    vNum:=0;
	END;
	-- ���� ���������� � �����������
	IF vNum<>0 THEN
	  BEGIN
	    SELECT PROD_ID_NPR INTO vRes
	      FROM KLS_CIST
	     WHERE NUM_CIST=vNum
	       AND ROWNUM=1;
	  EXCEPTION
	    WHEN OTHERS THEN
	      vRes:='';
	  END;
	END IF;
    RETURN vRes;
  ELSE
    -- ���� ������ ���� ���������� - �� ������� �����������;
	RETURN '';
  END IF;
END;

-- ������� ��� ������
FUNCTION GET_VAGONTYPE (pNUM_CIST VARCHAR2, pLOAD_TYPE_ID NUMBER DEFAULT 1) RETURN NUMBER AS
  vRes KLS_CIST.VAGONTYPE_ID%TYPE;
  vNum KLS_CIST.NUM_CIST%TYPE;
  vCode NUMBER;
BEGIN
  IF pLOAD_TYPE_ID=6 THEN
    -- ���� �������� ������������, �� ���������� ���: ���������
    RETURN 9;
  ELSIF pLOAD_TYPE_ID=1 THEN
    -- ���� �������� �/� �����������
	vRes:=0;
	vNum:=0;
	-- ����������� ����� ������ � �����
	BEGIN
	  vNum:=TO_NUMBER(pNUM_CIST);
	EXCEPTION
	  WHEN OTHERS THEN
	    vNum:=0;
	END;
	-- ���� ���������� � �����������
	IF vNum<>0 THEN
	  BEGIN
	    SELECT VAGONTYPE_ID INTO vRes
	      FROM KLS_CIST
	     WHERE NUM_CIST=vNum
	       AND ROWNUM=1;
	    vRes:=NVL(vRes,0);
	  EXCEPTION
	    WHEN OTHERS THEN
	      vRes:=0;
	  END;
	  IF vRes=0 THEN
	    -- ���� ����� � ����������� �� ������
        -- ���������� ��� ������ �� ������
        vCode := FLOOR(vNum/10000000);
        CASE
	      WHEN vCode=7 THEN RETURN 6; -- ��������
  	      WHEN vCode=6 THEN RETURN 5; -- ���������
	      WHEN vCode=5 THEN RETURN 6; -- ��������
	      WHEN vCode=2 THEN RETURN 2; -- ������ �����
	      WHEN vCode>=50 THEN RETURN 9; -- ���������
	      ELSE RETURN 6; -- �������� (� ���� �������)
		END CASE;
	  END IF;
	END IF;
	IF vRes=0 THEN
	  -- �� ���������: ��������
	  vRes:=6;
	END IF;
    RETURN vRes;
  ELSE
    -- ���� ������ ���� ���������� - �� ��� �����������;
	RETURN 0;
  END IF;
END;

-- ��������� ����� ������
FUNCTION CHECK_NUM_CIST(pNUM_CIST VARCHAR2, pLOAD_TYPE_ID NUMBER DEFAULT 1, pVAGONTYPE_ID NUMBER DEFAULT 6) RETURN NUMBER AS
  b VARCHAR2(8);
  b1 NUMBER(1);
  c NUMBER;
  d NUMBER;
BEGIN
  IF pLOAD_TYPE_ID=6 THEN
    -- ���� �������� ������������, �� �������� �� ����������
    RETURN 1;
  ELSIF pLOAD_TYPE_ID=1 THEN
    -- ���� �������� �/� �����������
    b:=SUBSTR(pNUM_CIST,1,8);
    c:=0;
    d:=0;
    FOR i IN 1..8 LOOP
	  BEGIN
	    b1:=TO_NUMBER(SUBSTR(b,9-i,1));
	  EXCEPTION
	    WHEN OTHERS THEN
		  b1:=0;
	  END;
      c:=b1*IIFN(MOD(i,2)=1,1,2);
      d:=d+FLOOR(c/10)+MOD(c,10);
    END LOOP;
    RETURN IIFN(MOD(d,10)=0,1,0);
  ELSE
    -- ���� ������ ���� ���������� - �� �������� �� �����������;
	RETURN 1;
  END IF;
END;

-- ������� ��� ������ �� ���� ������
FUNCTION GET_KALIBR_BY_VAGONTYPE (pLOAD_TYPE_ID NUMBER DEFAULT 1, pVAGONTYPE_ID NUMBER DEFAULT 6) RETURN VARCHAR2 AS
  vRes KLS_CIST.KALIBR_ID%TYPE;
  vNum KLS_CIST.NUM_CIST%TYPE;
BEGIN
  IF pLOAD_TYPE_ID=6 THEN
    -- ���� �������� ������������, �� ���������� ���: ���
    RETURN '���';
  ELSIF pLOAD_TYPE_ID=1 THEN
    -- ���������� ��� ������ �� ���� ������
    CASE
	  WHEN pVAGONTYPE_ID=1 THEN RETURN '���'; -- ������
	  WHEN pVAGONTYPE_ID=2 THEN RETURN '��'; -- ������ �����
	  WHEN pVAGONTYPE_ID=5 THEN RETURN '��'; -- ���������
	  WHEN pVAGONTYPE_ID=9 THEN RETURN '���'; -- ���������
	  ELSE RETURN NULL;
    END CASE;
    RETURN vRes;
  ELSE
    -- ���� ������ ���� ���������� - �� ��� �����������;
	RETURN NULL;
  END IF;
END;

-- ������� ��� ������
FUNCTION GET_KALIBR (pNUM_CIST VARCHAR2, pLOAD_TYPE_ID NUMBER DEFAULT 1, pVAGONTYPE_ID NUMBER DEFAULT 6) RETURN VARCHAR2 AS
  vRes KLS_CIST.KALIBR_ID%TYPE;
  vNum KLS_CIST.NUM_CIST%TYPE;
BEGIN
  IF pLOAD_TYPE_ID=6 THEN
    -- ���� �������� ������������, �� ���������� ���: ���
    RETURN '���';
  ELSIF pLOAD_TYPE_ID=1 THEN
    -- ���� �������� �/� �����������
	vRes:=NULL;
	vNum:=0;
	-- ����������� ����� ������ � �����
	BEGIN
	  vNum:=TO_NUMBER(pNUM_CIST);
	EXCEPTION
	  WHEN OTHERS THEN
	    vNum:=0;
	END;
	-- ���� ���������� � �����������
	IF vNum<>0 THEN
	  BEGIN
	    SELECT KALIBR_ID INTO vRes
	      FROM KLS_CIST
	     WHERE NUM_CIST=vNum
	       AND ROWNUM=1;
	  EXCEPTION
	    WHEN OTHERS THEN
	      vRes:=NULL;
	  END;
	END IF;
    IF vRes||' '=' ' THEN
	  -- ���� ����� � ����������� �� ������
      -- ���������� ��� ������ �� ���� ������
	  vRes:=GET_KALIBR_BY_VAGONTYPE(pLOAD_TYPE_ID, pVAGONTYPE_ID);
	END IF;
    RETURN vRes;
  ELSE
    -- ���� ������ ���� ���������� - �� ��� �����������;
	RETURN NULL;
  END IF;
END;

-- ������� �������������� � ������� ���
FUNCTION GET_NCISTDOP (pNUM_CIST VARCHAR2, pLOAD_TYPE_ID NUMBER DEFAULT 1, pVAGONTYPE_ID NUMBER DEFAULT 6) RETURN NUMBER AS
BEGIN
  RETURN 20;
END;

-- ������� ��� ������
FUNCTION GET_VES_CIST (pNUM_CIST VARCHAR2, pLOAD_TYPE_ID NUMBER DEFAULT 1, pVAGONTYPE_ID NUMBER DEFAULT 6) RETURN NUMBER AS
  vRes KLS_CIST.VES_CIST%TYPE;
  vNum KLS_CIST.NUM_CIST%TYPE;
BEGIN
  IF pLOAD_TYPE_ID=1 OR pLOAD_TYPE_ID=6 THEN
    -- ���� �������� �/� ����������� ��� ������������
	vRes:=0;
	vNum:=0;
	-- ����������� ����� ������ � �����
	BEGIN
	  vNum:=TO_NUMBER(pNUM_CIST);
	EXCEPTION
	  WHEN OTHERS THEN
	    vNum:=0;
	END;
	-- ���� ���������� � �����������
	IF vNum<>0 THEN
	  BEGIN
	    SELECT VES_CIST INTO vRes
	      FROM KLS_CIST
	     WHERE NUM_CIST=vNum
	       AND ROWNUM=1;
	    vRes:=NVL(vRes,0);
	  EXCEPTION
	    WHEN OTHERS THEN
	      vRes:=0;
	  END;
	END IF;
    RETURN vRes;
  ELSE
    -- ���� ������ ���� ���������� - �� ���=0
	RETURN 0;
  END IF;
END;

-- ������� ��������� ������
FUNCTION GET_VAGOWNER (pNUM_CIST VARCHAR2, pLOAD_TYPE_ID NUMBER DEFAULT 1, pVAGONTYPE_ID NUMBER DEFAULT 6) RETURN NUMBER AS
  vRes KLS_CIST.VAGOWNER_ID%TYPE;
  vNum KLS_CIST.NUM_CIST%TYPE;
BEGIN
  IF pLOAD_TYPE_ID=1 OR pLOAD_TYPE_ID=6 THEN
    -- ���� �������� �/� ����������� ��� ������������
	vRes:=NULL;
	vNum:=0;
	-- ����������� ����� ������ � �����
	BEGIN
	  vNum:=TO_NUMBER(pNUM_CIST);
	EXCEPTION
	  WHEN OTHERS THEN
	    vNum:=0;
	END;
	-- ���� ���������� � �����������
	IF vNum<>0 THEN
	  BEGIN
	    SELECT VAGOWNER_ID INTO vRes
	      FROM KLS_CIST
	     WHERE NUM_CIST=vNum
	       AND ROWNUM=1;
	    vRes:=NVL(vRes,0);
	  EXCEPTION
	    WHEN OTHERS THEN
	      vRes:=0;
	  END;
      IF vRes=0 THEN
        -- ���� ����� � ����������� �� ������
        -- ���������� ��������� �� ������ ������
	    IF vNum>=50000000 AND vNum<=59999999 THEN
		  RETURN NULL; -- �����-�� ����������� �����
		ELSE
		  RETURN 3; -- ����� ��� "���" (���)
		END IF;
	  END IF;
	END IF;
    RETURN vRes;
  ELSE
    -- ���� ������ ���� ���������� - �� �������� ������ �����������
	RETURN NULL;
  END IF;
END;

-- ������� ����������������
FUNCTION GET_CAPACITY (pNUM_CIST VARCHAR2, pKALIBR_ID VARCHAR2 DEFAULT NULL, pLOAD_TYPE_ID NUMBER DEFAULT 1, pVAGONTYPE_ID NUMBER DEFAULT 6) RETURN VARCHAR2 AS
  vRes KLS_CIST.CAPACITY%TYPE;
  vNum KLS_CIST.NUM_CIST%TYPE;
BEGIN
  IF pLOAD_TYPE_ID=1 OR pLOAD_TYPE_ID=6 THEN
    -- ���� �������� �/� ����������� ��� ������������
	vRes:=NULL;
	vNum:=0;
	-- ����������� ����� ������ � �����
	BEGIN
	  vNum:=TO_NUMBER(pNUM_CIST);
	EXCEPTION
	  WHEN OTHERS THEN
	    vNum:=0;
	END;
	-- ���� ���������� � �����������
	IF vNum<>0 THEN
	  BEGIN
	    SELECT CAPACITY INTO vRes
	      FROM KLS_CIST
	     WHERE NUM_CIST=vNum
	       AND ROWNUM=1;
	  EXCEPTION
	    WHEN OTHERS THEN
	      vRes:=NULL;
	  END;
	END IF;
    IF vRes||' '=' ' THEN
	  -- ���� ����� � ����������� �� ������
      -- ���������� ���������������� �� ���� ������
	  vRes:=GET_CAPACITY_BY_KALIBR(pKALIBR_ID,pLOAD_TYPE_ID,pVAGONTYPE_ID);
	END IF;
    RETURN vRes;
  ELSE
    -- ���� ������ ���� ���������� - �� ���������������� �� ����������;
	RETURN NULL;
  END IF;
END;

-- ������� ���������������� �� ���� ������
FUNCTION GET_CAPACITY_BY_KALIBR (pKALIBR_ID VARCHAR2, pLOAD_TYPE_ID NUMBER, pVAGONTYPE_ID NUMBER) RETURN VARCHAR2 AS
  vTmp NUMBER;
BEGIN
  SELECT VAGON_MAX_VES INTO vTmp
    FROM KLS_KALIBR
   WHERE ID=pKALIBR_ID
     AND ROWNUM=1;
  RETURN TO_CHAR(NVL(vTmp,0));
EXCEPTION
  WHEN OTHERS THEN
    RETURN '';
END;

-- ������� ���-�� ����
FUNCTION GET_AXES (pNUM_CIST VARCHAR2, pKALIBR_ID VARCHAR2 DEFAULT NULL, pVES NUMBER DEFAULT 0, pLOAD_TYPE_ID NUMBER DEFAULT 1, pVAGONTYPE_ID NUMBER DEFAULT 6) RETURN NUMBER AS
  vRes KLS_CIST.AXES%TYPE;
  vNum KLS_CIST.NUM_CIST%TYPE;
BEGIN
  IF pLOAD_TYPE_ID=6 THEN
    -- ���� �������� ������������, �� ���������� ����: 0
    RETURN 0;
  ELSIF pLOAD_TYPE_ID=1 THEN
    -- ���� �������� �/� �����������
    IF NVL(pVES,0)>0 THEN
	  -- ���� ���� ���
      -- ���������� ���-�� ���� �� ����
	  RETURN GET_AXES_BY_VES(pVES,pLOAD_TYPE_ID,pVAGONTYPE_ID);
	END IF;
	vRes:=0;
	vNum:=0;
	-- ����������� ����� ������ � �����
	BEGIN
	  vNum:=TO_NUMBER(pNUM_CIST);
	EXCEPTION
	  WHEN OTHERS THEN
	    vNum:=0;
	END;
	-- ���� ���������� � �����������
	IF vNum<>0 THEN
	  BEGIN
	    SELECT AXES INTO vRes
	      FROM KLS_CIST
	     WHERE NUM_CIST=vNum
	       AND ROWNUM=1;
		vRes:=NVL(vRes,0);
	  EXCEPTION
	    WHEN OTHERS THEN
	      vRes:=0;
	  END;
	END IF;
    IF vRes=0 THEN
	  -- ���� ����� � ����������� �� ������
      -- ���������� ���-�� ���� �� ���� ������
	  vRes:=GET_AXES_BY_KALIBR(pKALIBR_ID,pLOAD_TYPE_ID,pVAGONTYPE_ID);
	END IF;
    RETURN vRes;
  ELSE
    -- ���� ������ ���� ���������� - �� ���� 2;
	RETURN 2;
  END IF;
END;

-- ������� ���-�� ���� �� ���� ������
FUNCTION GET_AXES_BY_KALIBR (pKALIBR_ID VARCHAR2, pLOAD_TYPE_ID NUMBER, pVAGONTYPE_ID NUMBER) RETURN NUMBER AS
  vTmp NUMBER;
BEGIN
  SELECT VAGON_AXES INTO vTmp
    FROM KLS_KALIBR
   WHERE ID=pKALIBR_ID
     AND ROWNUM=1;
  RETURN NVL(vTmp,4);
EXCEPTION
  WHEN OTHERS THEN
    RETURN 4;
END;

-- ������� ���-�� ���� �� ����
FUNCTION GET_AXES_BY_VES (pVES NUMBER, pLOAD_TYPE_ID NUMBER, pVAGONTYPE_ID NUMBER) RETURN NUMBER AS
BEGIN
  IF NVL(pVES,0)>100 THEN
    RETURN 8;
  ELSE
    RETURN 4;
  END IF;
END;

-- ������� ����� ������ �� ���� � ������
FUNCTION GET_VOLUME (pKALIBR_ID VARCHAR2, pVZLIV NUMBER, pLOAD_TYPE_ID NUMBER DEFAULT 1, pVAGONTYPE_ID NUMBER DEFAULT 6) RETURN NUMBER AS
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



-- ������� �������������� �� ������
FUNCTION GET_DENI_TXT(pNUM_CIST VARCHAR2, pLOAD_TYPE_ID NUMBER DEFAULT 1, pVAGONTYPE_ID NUMBER DEFAULT 6) RETURN NUMBER AS
BEGIN
/*   PRIVATE deni_txt
  deni_txt=IsDeni(m.num_otgr)
  IF deni_txt<>''
    =mes_dial(7,'��������','�� �������� '+ALLT(m.num_otgr)+;
      ' ���� ��������������:'+deni_txt,1)
  ENDIF

  SELECT deni_otg
  SCAN FOR num_cist=VAL(m_num_otgr) AND beg_deni<=DATE() AND (EMPTY(end_deni) OR end_deni>=DATE())
    deni_txt=deni_txt+'\r  '+DTOC(deni_otg.beg_deni)+': '+ALLT(deni_otg.prim)
  ENDSCAN

  */
  RETURN '';
END;


-- ��������� �������� ������ � ����������� �������
PROCEDURE SET_CIST_PROPERTY(pCOMMIT NUMBER, pNUM_CIST VARCHAR2, pLOAD_TYPE_ID NUMBER, pFIELD VARCHAR2, pVALUE VARCHAR2) AS
  vNum KLS_CIST.NUM_CIST%TYPE;
  vRow KLS_CIST%ROWTYPE;
  vAdd BOOLEAN;
BEGIN
  IF pLOAD_TYPE_ID=1 OR pLOAD_TYPE_ID=6 THEN
    -- ���� �������� �/� ����������� ��� ������������
    vNum:=0;
    -- ����������� ����� ������ � �����
    BEGIN
	  vNum:=TO_NUMBER(pNUM_CIST);
    EXCEPTION
	  WHEN OTHERS THEN
	    vNum:=0;
    END;
    IF vNum<>0 THEN
	BEGIN
	  vAdd:=FALSE;
	  -- �������� �� ���������
	  vRow.NUM_CIST:=vNum;
	  vRow.VAGONTYPE_ID:=6;
	  vRow.NCISTDOP:=20;
	  vRow.AXES:=4;
      -- ��������� �����
	  IF pFIELD='VAGONTYPE_ID' THEN
		vRow.VAGONTYPE_ID:=TO_NUMBER(pVALUE);
	    UPDATE KLS_CIST SET VAGONTYPE_ID=vRow.VAGONTYPE_ID WHERE NUM_CIST=vRow.NUM_CIST;
		vAdd:=SQL%NOTFOUND;
	  ELSIF	pFIELD='KALIBR_ID' THEN
		vRow.KALIBR_ID:=pVALUE;
	    UPDATE KLS_CIST SET KALIBR_ID=vRow.KALIBR_ID WHERE NUM_CIST=vRow.NUM_CIST;
		vAdd:=SQL%NOTFOUND;
	  ELSIF	pFIELD='TIP1' THEN
		vRow.TIP1:=pVALUE;
	    UPDATE KLS_CIST SET TIP1=vRow.TIP1 WHERE NUM_CIST=vRow.NUM_CIST;
		vAdd:=SQL%NOTFOUND;
	  ELSIF	pFIELD='CAPACITY' THEN
		vRow.CAPACITY:=pVALUE;
	    UPDATE KLS_CIST SET CAPACITY=vRow.CAPACITY WHERE NUM_CIST=vRow.NUM_CIST;
		vAdd:=SQL%NOTFOUND;
	  ELSIF	pFIELD='WES1' THEN
		vRow.WES1:=pVALUE;
	    UPDATE KLS_CIST SET WES1=vRow.WES1 WHERE NUM_CIST=vRow.NUM_CIST;
		vAdd:=SQL%NOTFOUND;
	  ELSIF	pFIELD='NCISTDOP' THEN
		vRow.NCISTDOP:=TO_NUMBER(pVALUE);
	    UPDATE KLS_CIST SET NCISTDOP=vRow.NCISTDOP WHERE NUM_CIST=vRow.NUM_CIST;
		vAdd:=SQL%NOTFOUND;
	  ELSIF	pFIELD='AXES' THEN
		vRow.AXES:=TO_NUMBER(pVALUE);
	    UPDATE KLS_CIST SET AXES=vRow.AXES WHERE NUM_CIST=vRow.NUM_CIST;
		vAdd:=SQL%NOTFOUND;
	  ELSIF	pFIELD='VES_CIST' THEN
		vRow.VES_CIST:=TO_NUMBER(pVALUE);
	    UPDATE KLS_CIST SET VES_CIST=vRow.VES_CIST WHERE NUM_CIST=vRow.NUM_CIST;
		vAdd:=SQL%NOTFOUND;
	  ELSIF	pFIELD='VAGOWNER_ID' THEN
		vRow.VAGOWNER_ID:=TO_NUMBER(pVALUE);
	    UPDATE KLS_CIST SET VAGOWNER_ID=vRow.VAGOWNER_ID WHERE NUM_CIST=vRow.NUM_CIST;
		vAdd:=SQL%NOTFOUND;
	  ELSIF	pFIELD='PROD_ID_NPR' THEN
		vRow.PROD_ID_NPR:=pVALUE;
	    UPDATE KLS_CIST SET PROD_ID_NPR=vRow.PROD_ID_NPR WHERE NUM_CIST=vRow.NUM_CIST;
		vAdd:=SQL%NOTFOUND;
	  ELSE
	    NULL;
	  END IF;
	  IF vAdd THEN
	    -- ��������� �����
        INSERT INTO KLS_CIST (NUM_CIST,NCISTDOP,AXES,CAPACITY,WES1,VES_CIST,
	      VAGONTYPE_ID,KALIBR_ID,TIP1,VAGOWNER_ID,PROD_ID_NPR)
	    VALUES (vRow.NUM_CIST,vRow.NCISTDOP,vRow.AXES,vRow.CAPACITY,vRow.WES1,vRow.VES_CIST,
	      vRow.VAGONTYPE_ID,vRow.KALIBR_ID,vRow.TIP1,vRow.VAGOWNER_ID,vRow.PROD_ID_NPR);
	  END IF;
    EXCEPTION
	  WHEN OTHERS THEN
	    NULL;
	END;
	END IF;
  ELSE
    -- ���� ������ ���� ���������� - ������ �� ������;
	NULL;
  END IF;
  -- COMMIT
  IF pCOMMIT=1 THEN
	COMMIT;
  END IF;
END;


-- �������� ����� � ���������� �������
PROCEDURE ADD_CIST (pCOMMIT NUMBER, pNUM_CIST VARCHAR2, pLOAD_TYPE_ID NUMBER, pVAGONTYPE_ID NUMBER, pKALIBR_ID VARCHAR2, pTIP1 VARCHAR2, pCAPACITY VARCHAR2,pWES1 VARCHAR2,
                    pNCISTDOP NUMBER, pAXES NUMBER, pVES_CIST NUMBER, pVAGOWNER_ID NUMBER, pPROD_ID_NPR VARCHAR2 DEFAULT NULL) AS
  vNum KLS_CIST.NUM_CIST%TYPE;
BEGIN
  IF pLOAD_TYPE_ID=1 OR pLOAD_TYPE_ID=6 THEN
    -- ���� �������� �/� ����������� ��� ������������
    vNum:=0;
    -- ����������� ����� ������ � �����
    BEGIN
  	  vNum:=TO_NUMBER(pNUM_CIST);
    EXCEPTION
	  WHEN OTHERS THEN
	    vNum:=0;
    END;
    IF vNum<>0 THEN
      -- ��������� �����
      UPDATE KLS_CIST SET (NCISTDOP,AXES,CAPACITY,WES1,VES_CIST,
	    VAGONTYPE_ID,KALIBR_ID,TIP1,VAGOWNER_ID,PROD_ID_NPR)=
        (SELECT pNCISTDOP,pAXES,pCAPACITY,pWES1,pVES_CIST,
	      pVAGONTYPE_ID,pKALIBR_ID,pTIP1,pVAGOWNER_ID,pPROD_ID_NPR FROM dual)
	   WHERE NUM_CIST=vNum;

	  IF SQL%NOTFOUND THEN
	    -- ��������� �����
        INSERT INTO KLS_CIST (NUM_CIST,NCISTDOP,AXES,CAPACITY,WES1,VES_CIST,
	      VAGONTYPE_ID,KALIBR_ID,TIP1,VAGOWNER_ID,PROD_ID_NPR)
	    VALUES (pNUM_CIST,pNCISTDOP,pAXES,pCAPACITY,pWES1,pVES_CIST,
	      pVAGONTYPE_ID,pKALIBR_ID,pTIP1,pVAGOWNER_ID,pPROD_ID_NPR);
	  END IF;
    END IF;
  ELSE
    -- ���� ������ ���� ���������� - ������ �� ������;
	NULL;
  END IF;
  -- COMMIT
  IF pCOMMIT=1 THEN
    COMMIT;
  END IF;
END;

-- ���������� � ��������� �����
FUNCTION LAST_PROD_ID_NPR (pDATE DATE,pNUM_CIST VARCHAR2,pMESTO_ID NUMBER, pLOAD_TYPE_ID NUMBER) RETURN VARCHAR2
AS
  vRes KVIT.PROD_ID_NPR%TYPE;
BEGIN
  vRes:='';
    
  -- ���������� ������� �� ��������� ��������
  FOR lcur IN (SELECT /*+ RULE */ k.PROD_ID_NPR FROM KVIT k
               WHERE k.NUM_CIST=pNUM_CIST
			     AND k.DATE_OFORML<pDATE
			  ORDER BY k.DATE_OFORML DESC) LOOP
    vRes:=lcur.PROD_ID_NPR;
	EXIT;
  END LOOP;
  
  
  RETURN vRes;
END;

-- ���������� � ��������� ��������
FUNCTION LAST_PROD_DATE (pDATE DATE,pNUM_CIST VARCHAR2,pMESTO_ID NUMBER, pLOAD_TYPE_ID NUMBER) RETURN VARCHAR2
AS
  vRes VARCHAR2(15);
BEGIN
  vRes:='';
    
  -- ���������� ������� �� ��������� ��������
  FOR lcur IN (SELECT /*+ RULE */ k.DATE_OTGR FROM KVIT k
               WHERE k.NUM_CIST=pNUM_CIST
			     AND k.DATE_OFORML<pDATE
			  ORDER BY k.DATE_OFORML DESC) LOOP
    vRes:=TO_CHAR(lcur.DATE_OTGR,'dd.mm.yyyy');
	EXIT;
  END LOOP;
  
  
  RETURN vRes;
END;

FUNCTION LAST_PROD_NAME (pDATE DATE,pNUM_CIST VARCHAR2,pMESTO_ID NUMBER, pLOAD_TYPE_ID NUMBER) RETURN VARCHAR2
AS
  vRes KLS_PROD.ABBR_NPR%TYPE;
  vIdNpr KLS_PROD.ID_NPR%TYPE;
BEGIN
  vIdNpr:=LAST_PROD_ID_NPR(pDATE,pNUM_CIST,pMESTO_ID,pLOAD_TYPE_ID);
  SELECT KLS_PROD.ABBR_NPR INTO vRes
    FROM KLS_PROD WHERE ID_NPR=vIdNpr;
  RETURN vRes;	
EXCEPTION 
  WHEN OTHERS THEN
    RETURN '';
END;

FUNCTION LAST_GRUZ (pDATE DATE,pNUM_CIST VARCHAR2,pMESTO_ID NUMBER, pLOAD_TYPE_ID NUMBER) RETURN VARCHAR2
AS
  vRes KLS_PROD.ABBR_NPR%TYPE;
  vIdNpr KLS_PROD.ID_NPR%TYPE;
BEGIN
  vIdNpr:=LAST_PROD_ID_NPR(pDATE,pNUM_CIST,pMESTO_ID,pLOAD_TYPE_ID);
  SELECT KLS_PROD.ABBR_NPR INTO vRes
    FROM KLS_PROD WHERE ID_NPR=vIdNpr;
  RETURN vRes;	
EXCEPTION 
  WHEN OTHERS THEN
    RETURN '';
END;

END;

/

