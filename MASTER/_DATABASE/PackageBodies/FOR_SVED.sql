--
-- FOR_SVED  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY MASTER.FOR_SVED AS

  /* �������� �� �������� */

  -- ������
  PROCEDURE RaiseError (pText VARCHAR2) AS
  BEGIN
    ROLLBACK;
    RAISE_APPLICATION_ERROR(For_Scripts.SG$NO_CORRECT, pText);
  END;


  -- ������������ ����� ������� ���������
  FUNCTION GetMaxNumPos(pSVED_ID VARCHAR2) RETURN NUMBER AS
    MaxNum REESTR.SVED_POS%TYPE;
    CurNum REESTR.SVED_POS%TYPE;
  BEGIN
    CurNum:=0;
    FOR lcur IN (SELECT MAX(REESTR.SVED_POS) as MAX_NUM
                 FROM REESTR
				WHERE SVED_ID=pSVED_ID)
    LOOP
      CurNum:=NVL(lcur.MAX_NUM,0);
	  EXIT;
    END LOOP;
	MaxNum:=CurNum+1;
    RETURN MaxNum;
  END;

  /* ������� ������� ��������� */
  PROCEDURE DelRow(pCOMMIT NUMBER, pID NUMBER) AS
  BEGIN
    DELETE FROM REESTR WHERE ID=pID;
	-- COMMIT
	IF pCOMMIT=1 THEN
	  COMMIT;
	END IF;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
	  NULL;
  END;

  /* ������� ��������� ��������� */
  PROCEDURE DelTitle(pCOMMIT NUMBER, pID VARCHAR2) AS
    vCNT NUMBER;
  BEGIN
    -- ��������� ������� �������
	SELECT COUNT(*) INTO vCNT FROM REESTR WHERE SVED_ID=pID;
	IF vCNT>0 THEN
      RaiseError('�������� ������ ������� - ���� �������!');
	END IF;

    DELETE FROM SVED WHERE ID=pID;
	-- COMMIT
	IF pCOMMIT=1 THEN
	  COMMIT;
	END IF;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
	  NULL;
  END;

  /* �������� ��������� ������� TEMP_VALSVED */
  PROCEDURE EMPTY_TEMP_VALSVED AS
  BEGIN
    DELETE TEMP_VALSVED;
  END;

  /* ��������� ��������� ������� TEMP_VALSVED � ����������� �� ��������� �������� 
    pMode=1 - �������������� ���������� 
	pMode=2 - ����� ��������
	pMode=3 - ����� �������� 
  */
  PROCEDURE FILL_TEMP_VALSVED (pMode NUMBER,pSVED_ID VARCHAR2, pPASP_ID VARCHAR2, pPROD_ID_NPR VARCHAR2) AS
  BEGIN
    UPDATE TEMP_VALSVED SET F_DEL=1;

	IF pSVED_ID IS NOT NULL THEN
      -- ��������� ���������� �� KLS_VALSVED
  	  FOR lcur IN (
        SELECT
  	      KLS_TABLPOK.SORTBY,
          KLS_TABLPOK.KODIF_ID,
          NLS_UPPER(KLS_KODIF.FIELD_SVED) as TAG,
          KLS_KODIF.NAME as NAME,
          sv.QUAL as VALUE,
          KLS_TABLPOK.NORMTU as NORMA,
          KLS_KODIF.FIELD_TYPE,
          KLS_KODIF.FIELD_LEN,
          KLS_KODIF.FIELD_DEC
        FROM KLS_TABLPOK, KLS_KODIF, (SELECT * FROM KLS_VALSVED WHERE SVED_ID=pSVED_ID) sv
        WHERE KLS_TABLPOK.PROD_ID_NPR=pPROD_ID_NPR
          AND KLS_TABLPOK.KODIF_ID=KLS_KODIF.ID
          AND KLS_KODIF.FIELD_SVED||' '<>' '
          AND NLS_UPPER(KLS_KODIF.FIELD_SVED) NOT IN ('PL15','PL20')
          AND KLS_TABLPOK.KODIF_ID=sv.KODIF_ID(+)
        ORDER BY
          SORTBY)
      LOOP
	    UPDATE TEMP_VALSVED SET (SORTBY, KODIF_ID, NAME, NORMA, FIELD_TYPE, FIELD_LEN, FIELD_DEC, F_DEL)=
  	      (SELECT lcur.SORTBY, lcur.KODIF_ID, lcur.NAME, lcur.NORMA, lcur.FIELD_TYPE, lcur.FIELD_LEN, lcur.FIELD_DEC, 0 FROM dual)
 	    WHERE TAG=lcur.TAG;
	    IF SQL%NOTFOUND THEN
	      INSERT INTO TEMP_VALSVED (SORTBY, KODIF_ID, TAG, NAME, VALUE, NORMA, FIELD_TYPE, FIELD_LEN, FIELD_DEC, F_DEL)
		    VALUES (lcur.SORTBY, lcur.KODIF_ID, lcur.TAG, lcur.NAME, lcur.VALUE, lcur.NORMA, lcur.FIELD_TYPE, lcur.FIELD_LEN, lcur.FIELD_DEC, 0);
	    END IF;
		IF pMode=1 THEN
		  -- �������� �������� ���������� ��� �������������� ����������
  	      UPDATE TEMP_VALSVED SET VALUE=lcur.VALUE WHERE TAG=lcur.TAG;
		END IF;
	  END LOOP;
    END IF;
	
	IF pPASP_ID IS NOT NULL THEN
      -- ��������� ���������� �� KLS_VALPASP
  	  FOR lcur IN (
        SELECT
    	  KLS_TABLPOK.SORTBY,
          KLS_TABLPOK.KODIF_ID,
          NLS_UPPER(KLS_KODIF.FIELD_SVED) as TAG,
          KLS_KODIF.NAME as NAME,
          sv.QUAL as VALUE,
          KLS_TABLPOK.NORMTU as NORMA,
          KLS_KODIF.FIELD_TYPE,
          KLS_KODIF.FIELD_LEN,
          KLS_KODIF.FIELD_DEC
        FROM KLS_TABLPOK, KLS_KODIF, (SELECT * FROM KLS_VALPASP WHERE PASP_ID=pPASP_ID) sv
        WHERE KLS_TABLPOK.PROD_ID_NPR=pPROD_ID_NPR
          AND KLS_TABLPOK.KODIF_ID=KLS_KODIF.ID
          AND KLS_KODIF.FIELD_SVED||' '<>' '
          AND NLS_UPPER(KLS_KODIF.FIELD_SVED) NOT IN ('PL15','PL20')
          AND KLS_TABLPOK.KODIF_ID=sv.KODIF_ID(+)
        ORDER BY
          SORTBY)
      LOOP
	    UPDATE TEMP_VALSVED SET (SORTBY, KODIF_ID, NAME, NORMA, FIELD_TYPE, FIELD_LEN, FIELD_DEC, F_DEL)=
  	      (SELECT lcur.SORTBY, lcur.KODIF_ID, lcur.NAME, lcur.NORMA, lcur.FIELD_TYPE, lcur.FIELD_LEN, lcur.FIELD_DEC, 0 FROM dual)
 	    WHERE TAG=lcur.TAG;
	    IF SQL%NOTFOUND THEN
	      INSERT INTO TEMP_VALSVED (SORTBY, KODIF_ID, TAG, NAME, VALUE, NORMA, FIELD_TYPE, FIELD_LEN, FIELD_DEC, F_DEL)
		    VALUES (lcur.SORTBY, lcur.KODIF_ID, lcur.TAG, lcur.NAME, lcur.VALUE, lcur.NORMA, lcur.FIELD_TYPE, lcur.FIELD_LEN, lcur.FIELD_DEC, 0);
	    END IF;
		IF pMode=2 THEN
		  -- �������� �������� ���������� ��� ����� ��������
  	      UPDATE TEMP_VALSVED SET VALUE=lcur.VALUE WHERE TAG=lcur.TAG;
		END IF;
  	  END LOOP;
    END IF;

    -- ��������� ������� ���������� �� KLS_TABLPOK
	FOR lcur IN (
	  SELECT
  	    KLS_TABLPOK.SORTBY,
        KLS_TABLPOK.KODIF_ID,
        NLS_UPPER(KLS_KODIF.FIELD_SVED) as TAG,
        KLS_KODIF.NAME as NAME,
        '' as VALUE,
        KLS_TABLPOK.NORMTU as NORMA,
        KLS_KODIF.FIELD_TYPE,
        KLS_KODIF.FIELD_LEN,
        KLS_KODIF.FIELD_DEC
      FROM KLS_TABLPOK, KLS_KODIF
      WHERE KLS_TABLPOK.PROD_ID_NPR=pPROD_ID_NPR
        AND KLS_TABLPOK.KODIF_ID=KLS_KODIF.ID
        AND KLS_KODIF.FIELD_SVED||' '<>' '
        AND NLS_UPPER(KLS_KODIF.FIELD_SVED) NOT IN ('PL15','PL20')
      ORDER BY
        SORTBY)
    LOOP
	  UPDATE TEMP_VALSVED SET (SORTBY, KODIF_ID, NAME, NORMA, FIELD_TYPE, FIELD_LEN, FIELD_DEC, F_DEL)=
  	    (SELECT lcur.SORTBY, lcur.KODIF_ID, lcur.NAME, lcur.NORMA, lcur.FIELD_TYPE, lcur.FIELD_LEN, lcur.FIELD_DEC, 0 FROM dual)
 	  WHERE TAG=lcur.TAG;
	  IF SQL%NOTFOUND THEN
	    INSERT INTO TEMP_VALSVED (SORTBY, KODIF_ID, TAG, NAME, VALUE, NORMA, FIELD_TYPE, FIELD_LEN, FIELD_DEC, F_DEL)
		  VALUES (lcur.SORTBY, lcur.KODIF_ID, lcur.TAG, lcur.NAME, lcur.VALUE, lcur.NORMA, lcur.FIELD_TYPE, lcur.FIELD_LEN, lcur.FIELD_DEC, 0);
	  END IF;
	END LOOP;

	DELETE FROM TEMP_VALSVED WHERE F_DEL=1;
  END;

  /* ��������� �������� ����������� �������� �� TEMP_VALSVED � KLS_VALSVED */
  PROCEDURE SAVE_TEMP_VALSVED (pSVED_ID VARCHAR2) AS
  BEGIN
    IF pSVED_ID||' '<>' ' THEN
      DELETE FROM KLS_VALSVED WHERE SVED_ID=pSVED_ID;
      FOR lcur IN (SELECT * FROM TEMP_VALSVED)
	  LOOP
  	    INSERT INTO KLS_VALSVED (SVED_ID,KODIF_ID,QUAL)
		VALUES (pSVED_ID,lcur.KODIF_ID,lcur.VALUE);
	  END LOOP;
	END IF;
  END;

  /* ������� �������� ���������� �� TEMP_VALSVED */
  FUNCTION GET_TEMP_VALSVED_AS_CHAR (pKODIF_ID NUMBER, pKODIF_TAG VARCHAR2) RETURN VARCHAR2 AS
    vRes TEMP_VALSVED.VALUE%TYPE;
  BEGIN
    vRes:='';
    IF NVL(pKODIF_ID,0)>0 THEN
	  -- �������� �������� �� ID
      SELECT VALUE INTO vRes
 	  FROM TEMP_VALSVED
	  WHERE KODIF_ID=pKODIF_ID
	    AND ROWNUM=1;
	ELSIF pKODIF_TAG||' '<>' ' THEN
	  -- �������� �������� �� ����
      SELECT a.VALUE INTO vRes
 	  FROM TEMP_VALSVED a, KLS_KODIF b
	  WHERE a.KODIF_ID=b.ID AND NLS_UPPER(b.FIELD_SVED)=NLS_UPPER(pKODIF_TAG)
	    AND ROWNUM=1;
	END IF;
	RETURN vRes;
  EXCEPTION
    WHEN OTHERS THEN
	  RETURN NULL;
  END;

  FUNCTION GET_TEMP_VALSVED_AS_NUM (pKODIF_ID NUMBER, pKODIF_TAG VARCHAR2) RETURN NUMBER AS
  BEGIN
    RETURN ora_char_to_num(GET_TEMP_VALSVED_AS_CHAR(pKODIF_ID,pKODIF_TAG));
  EXCEPTION
    WHEN OTHERS THEN
	  RETURN NULL;
  END;

  /* ��������/�������� ��������� ��������� */
  FUNCTION AddTitle(pCOMMIT NUMBER, pID VARCHAR2, pMESTO_ID NUMBER, pLOAD_TYPE_ID NUMBER,
       pSVED_NUM NUMBER, pSVED_DATE DATE,
	   pPOD_DATE VARCHAR2, pTECH_TIME VARCHAR2, pGOTOV_TIME VARCHAR2, pBEG_NALIV_TIME VARCHAR2, pEND_NALIV_TIME VARCHAR2, pDATE_OFORML DATE,
	   pDEFI_MASS_ID NUMBER, pPASP_ID VARCHAR2, pPROD_ID_NPR VARCHAR2, pPASP_NUM VARCHAR2, pREZ_NUM VARCHAR2, pPASP_DATE DATE,
	   pCENA NUMBER, pCENA_OTP NUMBER, pDATE_CENA DATE)
    RETURN VARCHAR2 AS

	vID SVED.ID%TYPE;
	vADD NUMBER(1);
	vTmp NUMBER;
	vPOD_DATE DATE;
	vTECH_TIME DATE;
	vGOTOV_TIME DATE;
	vBEG_NALIV_TIME DATE;
	vEND_NALIV_TIME DATE;
  BEGIN

    IF pPOD_DATE='' THEN
	  vPOD_DATE:=NULL;
	ELSE
	  vPOD_DATE:=TO_DATE(pPOD_DATE,'dd.mm.yyyy hh24:mi');
	END IF;  
    IF pTECH_TIME='' THEN
	  vTECH_TIME:=NULL;
	ELSE
	  vTECH_TIME:=TO_DATE(pTECH_TIME,'dd.mm.yyyy hh24:mi');
	END IF;  
    IF pGOTOV_TIME='' THEN
	  vGOTOV_TIME:=NULL;
	ELSE
	  vGOTOV_TIME:=TO_DATE(pGOTOV_TIME,'dd.mm.yyyy hh24:mi');
	END IF; 
    IF pBEG_NALIV_TIME='' THEN
	  vBEG_NALIV_TIME:=NULL;
	ELSE
	  vBEG_NALIV_TIME:=TO_DATE(pBEG_NALIV_TIME,'dd.mm.yyyy hh24:mi');
	END IF; 
    IF pEND_NALIV_TIME='' THEN
	  vEND_NALIV_TIME:=NULL;
	ELSE
	  vEND_NALIV_TIME:=TO_DATE(pEND_NALIV_TIME,'dd.mm.yyyy hh24:mi');
	END IF; 

    -- ID
	IF pID||' '=' ' OR pID IS NULL THEN
	  vADD:=1;
      SELECT SEQ_SVED.nextval INTO vTmp FROM DUAL;
	  vID:=SUBSTR(TO_CHAR(vTmp),1,9);
	ELSE
	  vADD:=0;
	  vID:=pID;
	END IF;

	-- �������� �������������
	BEGIN
	  SELECT /*+ RULE */ 1
        INTO vTmp
	 	FROM SVED
	   WHERE ID=vID;
	EXCEPTION
	  WHEN OTHERS THEN
	    IF vAdd=0 THEN
          RaiseError('�������� ������ ��������������� - ��� �������!');
		END IF;
	END;

	-- ��������� ��������
	UPDATE SVED SET (SVED_NUM, SVED_DATE, MESTO_ID, LOAD_TYPE_ID,
	   POD_DATE, TECH_TIME, GOTOV_TIME, BEG_NALIV_TIME, END_NALIV_TIME, DATE_OFORML,
	   DEFI_MASS_ID, PASP_ID, PROD_ID_NPR, PASP_NUM, REZ_NUM, PASP_DATE,
	   CENA, CENA_OTP, DATE_CENA)=
	  (SELECT pSVED_NUM, pSVED_DATE, pMESTO_ID, pLOAD_TYPE_ID,
	   vPOD_DATE, vTECH_TIME, vGOTOV_TIME, vBEG_NALIV_TIME, vEND_NALIV_TIME, pDATE_OFORML,
	   pDEFI_MASS_ID, pPASP_ID, pPROD_ID_NPR, pPASP_NUM, pREZ_NUM, pPASP_DATE,
	   pCENA, pCENA_OTP, pDATE_CENA FROM dual)
	 WHERE ID=vID;

	IF SQL%NOTFOUND THEN
	  -- ��������� ��������
      INSERT INTO SVED (ID,SVED_NUM, SVED_DATE, MESTO_ID, LOAD_TYPE_ID,
	   POD_DATE, TECH_TIME, GOTOV_TIME, BEG_NALIV_TIME, END_NALIV_TIME, DATE_OFORML,
	   DEFI_MASS_ID, PASP_ID, PROD_ID_NPR, PASP_NUM, REZ_NUM, PASP_DATE,
	   CENA, CENA_OTP, DATE_CENA)
	  VALUES (vID, pSVED_NUM, pSVED_DATE, pMESTO_ID, pLOAD_TYPE_ID,
	   vPOD_DATE, vTECH_TIME, vGOTOV_TIME, vBEG_NALIV_TIME, vEND_NALIV_TIME, pDATE_OFORML,
	   pDEFI_MASS_ID, pPASP_ID, pPROD_ID_NPR, pPASP_NUM, pREZ_NUM, pPASP_DATE,
	   pCENA, pCENA_OTP, pDATE_CENA);
	END IF;

	-- ���������� ����������� �������� � ��������
	SAVE_TEMP_VALSVED(vID);

	-- COMMIT
	IF pCOMMIT=1 THEN
	  COMMIT;
	END IF;
	RETURN vID;
  END;

  -- �������� �������� ���������� �������� ��� ��������
  FUNCTION GET_PASP_VALUE_AS_CHAR (pSVED_ID VARCHAR2, pKODIF_ID NUMBER, pKODIF_TAG VARCHAR2) RETURN VARCHAR2 AS
    vRes KLS_VALSVED.QUAL%TYPE;
  BEGIN
    vRes:='';
    IF NVL(pKODIF_ID,0)>0 THEN
	  -- �������� �������� �� ID
      SELECT QUAL INTO vRes
 	  FROM KLS_VALSVED
	  WHERE SVED_ID=pSVED_ID AND KODIF_ID=pKODIF_ID
	    AND ROWNUM=1;
	ELSIF pKODIF_TAG||' '<>' ' THEN
	  -- �������� �������� �� ����
      SELECT a.QUAL INTO vRes
 	  FROM KLS_VALSVED a, KLS_KODIF b
	  WHERE a.SVED_ID=pSVED_ID
	    AND a.KODIF_ID=b.ID AND NLS_UPPER(b.FIELD_SVED)=NLS_UPPER(pKODIF_TAG)
	    AND ROWNUM=1;
	END IF;
	RETURN vRes;
  EXCEPTION
    WHEN OTHERS THEN
	  RETURN NULL;
  END;

  FUNCTION GET_PASP_VALUE_AS_NUM (pSVED_ID VARCHAR2, pKODIF_ID NUMBER, pKODIF_TAG VARCHAR2) RETURN NUMBER AS
  BEGIN
    RETURN ora_char_to_num(GET_PASP_VALUE_AS_CHAR(pSVED_ID,pKODIF_ID,pKODIF_TAG));
  EXCEPTION
    WHEN OTHERS THEN
	  RETURN NULL;
  END;

  -- ��������� �������� ���������� �������� ��� ��������
  PROCEDURE SET_PASP_VALUE (pSVED_ID VARCHAR2, pKODIF_ID NUMBER, pKODIF_TAG VARCHAR2, pQUAL VARCHAR2) AS
  BEGIN
    IF NVL(pKODIF_ID,0)>0 THEN
	  -- ��������� �������� �� ID
	  UPDATE KLS_VALSVED SET QUAL=pQUAL
	  WHERE SVED_ID=pSVED_ID AND KODIF_ID=pKODIF_ID;

	  IF SQL%NOTFOUND THEN
	    INSERT INTO KLS_VALSVED (SVED_ID,KODIF_ID,QUAL)
		  VALUES (pSVED_ID,pKODIF_ID,pQUAL);
	  END IF;
	ELSIF pKODIF_TAG||' '<>' ' THEN
	  -- ��������� �������� �� ����
	  FOR lcur IN (SELECT ID FROM KLS_KODIF WHERE NLS_UPPER(FIELD_SVED)=NLS_UPPER(pKODIF_TAG))
	  LOOP
  	    UPDATE KLS_VALSVED SET QUAL=pQUAL
	    WHERE SVED_ID=pSVED_ID AND KODIF_ID=lcur.ID;

	    IF SQL%NOTFOUND THEN
	      INSERT INTO KLS_VALSVED (SVED_ID,KODIF_ID,QUAL)
		    VALUES (pSVED_ID,lcur.ID,pQUAL);
	    END IF;
		EXIT;
	  END LOOP;
	END IF;
  EXCEPTION
    WHEN OTHERS THEN
	  RETURN;
  END;

  /* ��������/�������� ������� ���������
     ������������ �������� - ID ������� ��������� */
  FUNCTION AddRow(pCOMMIT NUMBER, pID NUMBER, pSVED_ID VARCHAR2, pSVED_POS NUMBER,
    pNUM_CIST VARCHAR2, pNCISTDOP NUMBER, pAXES NUMBER, pCAPACITY VARCHAR2, pWES1 VARCHAR2, pVES_CIST NUMBER,
	pVAGONTYPE_ID NUMBER, pKALIBR_ID VARCHAR2, pTIP1 VARCHAR2, pVAGOWNER_ID NUMBER,
	pVETKA_POD_ID NUMBER, pVETKA_OTP_ID NUMBER, pVETKA_NAPR_ID NUMBER, pVAG_STATUS_ID NUMBER,
	pVZLIV NUMBER, pVOLUME NUMBER, pTEMPER NUMBER, pFAKT_PL NUMBER, pVES NUMBER, pKOL_NET NUMBER,
	pVES_ALL NUMBER, pVES_ED NUMBER, pKOL_ED NUMBER, pUPAK_ID NUMBER, pUPAK_VES NUMBER, pUPAK_VES_ED NUMBER,
	pPODDONS NUMBER, pPODDON_VES NUMBER, pSHIELDS NUMBER, pSHIELD_VES NUMBER,
	pZPU_TYPE1 NUMBER, pZPU_TYPE2 NUMBER, pPLOMBA1 VARCHAR2, pPLOMBA2 VARCHAR2, pROSINSPL1 VARCHAR2,
	pROSINSPL2 VARCHAR2, pFORMNAKL_ID NUMBER, pGOST_ID NUMBER, pVOLUME15 NUMBER, pCTLV NUMBER, pIS_AUTO NUMBER) RETURN VARCHAR2 AS

	vID REESTR.ID%TYPE;
	vADD NUMBER(1);
	vTmp NUMBER;
	vLoadType SVED.LOAD_TYPE_ID%TYPE;
	vPROD_ID_NPR SVED.PROD_ID_NPR%TYPE;
  BEGIN

    -- ID
	IF NVL(pID,0)=0 THEN
	  vADD:=1;
      SELECT SEQ_SVED.nextval INTO vTmp FROM DUAL;
	  vID:=vTmp;
	ELSE
	  vADD:=0;
	  vID:=pID;
	END IF;

	-- �������� ������������� ���������
	BEGIN
	  SELECT /*+ RULE */ LOAD_TYPE_ID,PROD_ID_NPR
        INTO vLoadType,vPROD_ID_NPR
	 	FROM SVED
	   WHERE ID=pSVED_ID;
	EXCEPTION
	  WHEN OTHERS THEN
        RaiseError('�������� �������!');
	END;

	-- �������� ������������� �������
	BEGIN
	  SELECT /*+ RULE */ 1
        INTO vTmp
	 	FROM REESTR
	   WHERE ID=vID;
	EXCEPTION
	  WHEN OTHERS THEN
	    IF vAdd=0 THEN
          RaiseError('������� ������ ��������������� - ��� �������!');
		END IF;
	END;

	-- ��������� �������
	UPDATE REESTR SET (SVED_POS,NUM_CIST,NCISTDOP,AXES,CAPACITY,WES1,VES_CIST,
	  VAGONTYPE_ID,KALIBR_ID,TIP1,VAGOWNER_ID,VETKA_POD_ID,VETKA_OTP_ID,VETKA_NAPR_ID,VAG_STATUS_ID,
	  VZLIV,VOLUME,TEMPER,FAKT_PL,VES,KOL_NET,VES_ALL,VES_ED,KOL_ED,UPAK_ID,UPAK_VES,UPAK_VES_ED,
	  PODDONS,PODDON_VES,SHIELDS,SHIELD_VES,ZPU_TYPE1,ZPU_TYPE2,PLOMBA1,PLOMBA2,ROSINSPL1,
	  ROSINSPL2,FORMNAKL_ID,GOST_ID,VOLUME15,CTLV,IS_AUTO)=
    (SELECT pSVED_POS,pNUM_CIST,pNCISTDOP,pAXES,pCAPACITY,pWES1,pVES_CIST,
	  pVAGONTYPE_ID,pKALIBR_ID,pTIP1,pVAGOWNER_ID,pVETKA_POD_ID,pVETKA_OTP_ID,pVETKA_NAPR_ID,pVAG_STATUS_ID,
	  pVZLIV,pVOLUME,pTEMPER,pFAKT_PL,pVES,pKOL_NET,pVES_ALL,pVES_ED,pKOL_ED,pUPAK_ID,pUPAK_VES,pUPAK_VES_ED,
	  pPODDONS,pPODDON_VES,pSHIELDS,pSHIELD_VES,pZPU_TYPE1,pZPU_TYPE2,pPLOMBA1,pPLOMBA2,pROSINSPL1,
	  pROSINSPL2,pFORMNAKL_ID,pGOST_ID,pVOLUME15,pCTLV,pIS_AUTO FROM dual)
	 WHERE ID=vID;

	IF SQL%NOTFOUND THEN
	  -- ��������� �������
      INSERT INTO REESTR (ID,SVED_ID,SVED_POS,NUM_CIST,NCISTDOP,AXES,CAPACITY,WES1,VES_CIST,
	  VAGONTYPE_ID,KALIBR_ID,TIP1,VAGOWNER_ID,VETKA_POD_ID,VETKA_OTP_ID,VETKA_NAPR_ID,VAG_STATUS_ID,
	  VZLIV,VOLUME,TEMPER,FAKT_PL,VES,KOL_NET,VES_ALL,VES_ED,KOL_ED,UPAK_ID,UPAK_VES,UPAK_VES_ED,
	  PODDONS,PODDON_VES,SHIELDS,SHIELD_VES,ZPU_TYPE1,ZPU_TYPE2,PLOMBA1,PLOMBA2,ROSINSPL1,
	  ROSINSPL2,FORMNAKL_ID,GOST_ID,VOLUME15,CTLV,IS_AUTO)
	  VALUES (vID,pSVED_ID,pSVED_POS,pNUM_CIST,pNCISTDOP,pAXES,pCAPACITY,pWES1,pVES_CIST,
	  pVAGONTYPE_ID,pKALIBR_ID,pTIP1,pVAGOWNER_ID,pVETKA_POD_ID,pVETKA_OTP_ID,pVETKA_NAPR_ID,pVAG_STATUS_ID,
	  pVZLIV,pVOLUME,pTEMPER,pFAKT_PL,pVES,pKOL_NET,pVES_ALL,pVES_ED,pKOL_ED,pUPAK_ID,pUPAK_VES,pUPAK_VES_ED,
	  pPODDONS,pPODDON_VES,pSHIELDS,pSHIELD_VES,pZPU_TYPE1,pZPU_TYPE2,pPLOMBA1,pPLOMBA2,pROSINSPL1,
	  pROSINSPL2,pFORMNAKL_ID,pGOST_ID,pVOLUME15,pCTLV,pIS_AUTO);
	END IF;

    -- ��������� ����� � ���������� ������� - ���������� � �������
--	FOR_CIST.ADD_CIST(0,pNUM_CIST,vLoadType,pVAGONTYPE_ID,pKALIBR_ID,pTIP1,pCAPACITY,pWES1,pNCISTDOP,pAXES,pVES_CIST,pVAGOWNER_ID,vPROD_ID_NPR);

	-- COMMIT
	IF pCOMMIT=1 THEN
	  COMMIT;
	END IF;
	RETURN vID;
  END;

  /* ����������� ������� ��������� ������ � ��������
     ������������ �������� - ID ������� ��������� */
  FUNCTION CopyVedPodRow (pCOMMIT NUMBER, pVED_POD_ROW_ID NUMBER, pSVED_ID VARCHAR2, pNAR_LINE_ID NUMBER) RETURN NUMBER AS
    vID REESTR.ID%TYPE;
	vTitle VED_POD%ROWTYPE;
	vRow VED_POD_ROW%ROWTYPE;
	vTmp NUMBER;
  BEGIN
    vID:=NULL;

    -- ��������� ������� ������ � ��������
	BEGIN
	  SELECT ID INTO vID
	    FROM REESTR
	   WHERE VED_POD_ROW_ID=pVED_POD_ROW_ID;
	EXCEPTION
	  WHEN OTHERS THEN
	    vID:=NULL;
	END;

	IF vID IS NOT NULL THEN
	  -- ����� � �������� ��� ����, ������ ��������� �� ����
	  RETURN vID;
	END IF;

	-- ��������� ������ �� ��������� ������
	BEGIN
	  SELECT * INTO vRow
	    FROM VED_POD_ROW
	   WHERE ID=pVED_POD_ROW_ID;
	EXCEPTION
	  WHEN OTHERS THEN
	    vRow.ID:=NULL;
	END;
	BEGIN
	  SELECT * INTO vTitle
	    FROM VED_POD
	   WHERE ID=vRow.VED_POD_ID;
	EXCEPTION
	  WHEN OTHERS THEN
	    NULL;
	END;

	IF vRow.ID IS NULL OR vTitle.ID IS NULL THEN
	  -- ��������� ������, ����� ������ � �������� ������ ���
	  RETURN NULL;
	END IF;

	-- �������� ������������� ���������
	BEGIN
	  SELECT /*+ RULE */ 1
        INTO vTmp
	 	FROM SVED
	   WHERE ID=pSVED_ID;
	EXCEPTION
	  WHEN OTHERS THEN
        RaiseError('�������� �������!');
	END;

    -- ��������� �����

	IF vRow.VAGONTYPE_ID IS NULL THEN
	  vRow.VAGONTYPE_ID:=FOR_CIST.GET_VAGONTYPE(vRow.NUM_CIST,vTitle.LOAD_TYPE_ID);
    END IF;
	IF vRow.KALIBR_ID IS NULL THEN
	  vRow.KALIBR_ID:=FOR_CIST.GET_KALIBR(vRow.NUM_CIST,vTitle.LOAD_TYPE_ID,vRow.VAGONTYPE_ID);
    END IF;
	IF vRow.NCISTDOP IS NULL THEN
	  vRow.NCISTDOP:=FOR_CIST.GET_NCISTDOP(vRow.NUM_CIST,vTitle.LOAD_TYPE_ID,vRow.VAGONTYPE_ID);
    END IF;
	IF vRow.VES_CIST IS NULL THEN
	  vRow.VES_CIST:=FOR_CIST.GET_VES_CIST(vRow.NUM_CIST,vTitle.LOAD_TYPE_ID,vRow.VAGONTYPE_ID);
    END IF;
	IF vRow.VAGOWNER_ID IS NULL THEN
	  vRow.VAGOWNER_ID:=FOR_CIST.GET_VAGOWNER(vRow.NUM_CIST,vTitle.LOAD_TYPE_ID,vRow.VAGONTYPE_ID);
    END IF;
	IF vRow.CAPACITY IS NULL THEN
	  vRow.CAPACITY:=FOR_CIST.GET_CAPACITY(vRow.NUM_CIST,vRow.KALIBR_ID,vTitle.LOAD_TYPE_ID,vRow.VAGONTYPE_ID);
    END IF;
	IF vRow.AXES IS NULL THEN
	  vRow.AXES:=FOR_CIST.GET_AXES(vRow.NUM_CIST,vRow.KALIBR_ID,0,vTitle.LOAD_TYPE_ID,vRow.VAGONTYPE_ID);
    END IF;

	vID:=AddRow(0,vID,pSVED_ID,FOR_SVED.GetMaxNumPos(pSVED_ID),
	    vRow.NUM_CIST,vRow.NCISTDOP,vRow.AXES,vRow.CAPACITY,NULL,vRow.VES_CIST,vRow.VAGONTYPE_ID,vRow.KALIBR_ID,
		NULL,vRow.VAGOWNER_ID,NVL(vRow.VETKA_POD_ID,100),vTitle.VETKA_OTP_ID,NVL(vRow.VETKA_NAPR_ID,100),NVL(vRow.VAG_STATUS_ID,0),
		NULL,0,NULL,NULL,0,0,0,0,0,NULL,0,0,
		0,FOR_ENVIRONMENT.GET_ENV('MASTER','VARI','PODDON_VES',FOR_INIT.GetCurrUser),
		0,FOR_ENVIRONMENT.GET_ENV('MASTER','VARI','SHIELD_VES',FOR_INIT.GetCurrUser),
		FOR_ENVIRONMENT.GET_ENV('MASTER','VARI','ZPU_TYPE1',FOR_INIT.GetCurrUser),
		FOR_ENVIRONMENT.GET_ENV('MASTER','VARI','ZPU_TYPE2',FOR_INIT.GetCurrUser),
		NULL,NULL,NULL,NULL,2,0,0,0,1);

    -- ����������� ������ �� ������� ��������� ������
	UPDATE REESTR SET VED_POD_ROW_ID=pVED_POD_ROW_ID WHERE ID=vID;

	-- ����������� ��������� ���������
	UPDATE SVED SET POD_DATE=vTitle.POD_DATE WHERE ID=pSVED_ID AND POD_DATE IS NULL;
	UPDATE SVED SET TECH_TIME=vTitle.TECH_TIME WHERE ID=pSVED_ID AND TECH_TIME IS NULL;
	UPDATE SVED SET GOTOV_TIME=vTitle.GOTOV_TIME WHERE ID=pSVED_ID AND GOTOV_TIME IS NULL;
	UPDATE SVED SET BEG_NALIV_TIME=vTitle.BEG_NALIV_TIME WHERE ID=pSVED_ID AND BEG_NALIV_TIME IS NULL;
	UPDATE SVED SET END_NALIV_TIME=vTitle.END_NALIV_TIME WHERE ID=pSVED_ID AND END_NALIV_TIME IS NULL;

	-- COMMIT
	IF pCOMMIT=1 THEN
	  COMMIT;
	END IF;
	
    -- ����������� ������ �� ������� ����������
	SetNarLineID (0, pSVED_ID, vID, pNAR_LINE_ID);

	-- COMMIT
	IF pCOMMIT=1 THEN
	  COMMIT;
	END IF;
	RETURN vID;
  END;

  -- ����������� ��� �� ������/����������, ����������� � ��������
  FUNCTION GET_MIN_OSTAT_VES (pLOAD_TYPE_ID NUMBER, pID_GROUP_NPR VARCHAR2) RETURN NUMBER AS
  BEGIN
    IF pLOAD_TYPE_ID=1 AND pID_GROUP_NPR='13000' THEN
	  RETURN 30;
	END IF;
	IF pLOAD_TYPE_ID=1 AND pID_GROUP_NPR<>'13000' THEN
	  RETURN 40;
	END IF;
    IF pLOAD_TYPE_ID=6 THEN
	  RETURN 1;
	END IF;
    RETURN 5;
  END;

  /* ����������� ������� �������� � ��������
     ������������ �������� - ID ������� ��������� ��� NULL - ���� ������ �� ������� */
  FUNCTION MoveRow (pCOMMIT NUMBER, pREESTR_ID NUMBER, pNEW_SVED_ID VARCHAR2) RETURN NUMBER AS
	vRow REESTR%ROWTYPE;
	vTmp NUMBER;
  BEGIN
    vRow.ID:=NULL;

	-- ��������� ������ �� ��������
	BEGIN
	  SELECT * INTO vRow
	    FROM REESTR
	   WHERE ID=pREESTR_ID;
	EXCEPTION
	  WHEN OTHERS THEN
	    vRow.ID:=NULL;
	END;

	IF vRow.ID IS NULL THEN
	  -- ���������� ������, ����� ������ � �������� ���
	  RETURN NULL;
	END IF;

	-- �������� ������������� ���������-����������
	BEGIN
	  SELECT /*+ RULE */ 1
        INTO vTmp
	 	FROM SVED
	   WHERE ID=pNEW_SVED_ID;
	EXCEPTION
	  WHEN OTHERS THEN
        RaiseError('�������� � ������� ����������� �������� - �������!');
	END;

    -- ��������� ����� �� �������� � ��������
	UPDATE REESTR SET SVED_ID=pNEW_SVED_ID, SVED_POS=FOR_SVED.GetMaxNumPos(pNEW_SVED_ID) WHERE ID=vRow.ID;

	-- COMMIT
	IF pCOMMIT=1 THEN
	  COMMIT;
	END IF;
	RETURN vRow.ID;
  END;

  /* ���������� ������ �� ������� ���������� �� �������� */
  PROCEDURE SetNarLineID (pCOMMIT NUMBER, pSVED_ID VARCHAR2, pREESTR_ID NUMBER, pNAR_LINE_ID NUMBER) AS
    vCnt NUMBER;
	vNAR_LINE_ID NUMBER;
  BEGIN
    IF NVL(pNAR_LINE_ID,0)=0 THEN
	  vNAR_LINE_ID:=NULL;
	ELSE  
	  vNAR_LINE_ID:=pNAR_LINE_ID;
	END IF;  
    UPDATE REESTR SET NAR_LINE_ID=vNAR_LINE_ID WHERE ID=pREESTR_ID;
	-- ���������� ���-�� �������������� ������� � ��������
	BEGIN
  	  SELECT COUNT(*) INTO vCnt
	    FROM REESTR
	   WHERE SVED_ID=pSVED_ID AND NAR_LINE_ID IS NOT NULL;
	EXCEPTION
	  WHEN OTHERS THEN
	    vCnt:=0;
	END;
	IF vCnt=0 THEN
	  -- � �������� �� �������� �� ������ ������ �� ������� �� ���������� ����������
	  -- ���������� ����� ������� � ��������
	  UPDATE SVED SET NOM_ZD='' WHERE ID=pSVED_ID;
	END IF;
	-- COMMIT
	IF pCOMMIT=1 THEN
	  COMMIT;
	END IF;
  END;

  /* �������� ������ �� ������������
     ������������ �������� - ����� ��������, � ������� ������ ����� ��� ���� */
  FUNCTION CHECK_UNIQ (pLOAD_TYPE_ID NUMBER, pNUM_CIST VARCHAR2, pID NUMBER, pDATE DATE) RETURN NUMBER AS
  PRAGMA AUTONOMOUS_TRANSACTION;
    vRes NUMBER;
	vWorklen NUMBER;
  BEGIN
    IF pLOAD_TYPE_ID=1 THEN
	  vWorklen:=FOR_ENVIRONMENT.GET_ENV('MASTER','VARI','WORKLEN#1',FOR_INIT.GetCurrUser);
	ELSE
	  vWorklen:=FOR_ENVIRONMENT.GET_ENV('MASTER','VARI','WORKLEN#2',FOR_INIT.GetCurrUser);
	END IF;
    SELECT /*+ RULE */ a.SVED_NUM INTO vRes
	  FROM REESTR b,SVED a
	 WHERE b.SVED_ID=a.ID
	   AND a.SVED_DATE>=pDATE-2
	   AND b.NUM_CIST=pNUM_CIST
	   AND b.VAG_STATUS_ID IN (0,14)
	   AND b.ID<>NVL(pID,0)
	   AND (TRUNC(a.DATE_OFORML)=TRUNC(pDATE) OR
	        ABS(hours_between(a.DATE_OFORML,pDATE))<vWorklen);
    ROLLBACK;
    RETURN vRes;
  EXCEPTION
    WHEN OTHERS THEN
	  ROLLBACK;
	  RETURN NULL;
  END;

END;

/

