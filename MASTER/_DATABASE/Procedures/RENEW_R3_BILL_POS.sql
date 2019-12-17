--
-- RENEW_R3_BILL_POS  (Procedure) 
--
CREATE OR REPLACE PROCEDURE MASTER.Renew_R3_Bill_Pos (DATE_BEG DATE:=TRUNC(SYSDATE,'MONTH') ,DATE_END DATE:=SYSDATE, param1 VARCHAR2:='', param2 VARCHAR2:='', param3 VARCHAR2:='') IS
  IsFull NUMBER(1);
BEGIN
  RETURN;

  IF param1 || ' ' = ' ' THEN
    IsFull:=1;
  ELSE
    IsFull:=0;
  END IF;

  -- ��������� �������� � ���������� 
  INSERT INTO R3_MATERIALS (VBAP_MATNR, MAKTX)
    (SELECT DISTINCT A.VBAP_MATNR, NVL(M.NAME,'') FROM load_buffer.V_R3_BILL_POS A, load_buffer.r3_makt M
	 WHERE A.VBAP_MATNR=M.MATNR(+)
	   AND NOT EXISTS
	   (SELECT NULL FROM R3_MATERIALS B WHERE B.VBAP_MATNR=A.VBAP_MATNR));
  COMMIT;
  	   
  -- ���������� ������� 
  UPDATE R3_BILL_POS
    SET (VES, CENA_BN, CENA, SUMMA_BN, SUMMA_NDS, SUMMA_AKCIZ, SUMMA, VBAP_MATNR, PROD_ID_NPR, OWNERSHIP_ID) =
	(SELECT a.VES, a.CENA_BN, a.CENA, a.SUMMA_BN, a.SUMMA_NDS20, a.SUMMA_AKCIZ,
            a.SUMMA, a.VBAP_MATNR, TO_CHAR(10000+A.BILL_POS_ID), DECODE(A.BILL_POS_ID,1,1,11,13,12,13,0)
  	   FROM load_buffer.v_r3_bill_pos A 
  	  WHERE A.VBELN=R3_BILL_POS.VBELN 
		AND a.bill_pos_id=R3_BILL_POS.R3_BILL_POS_ID)
    WHERE EXISTS 
	(SELECT NULL
  	   FROM load_buffer.v_r3_bill_pos A 
  	  WHERE A.VBELN=R3_BILL_POS.VBELN 
		AND a.bill_pos_id=R3_BILL_POS.R3_BILL_POS_ID);
  COMMIT;

  -- ��������� �������  
  INSERT INTO R3_BILL_POS
    (VBELN, R3_BILL_POS_ID, VES, CENA_BN, CENA, SUMMA_BN, SUMMA_NDS, SUMMA_AKCIZ, SUMMA, VBAP_MATNR, PROD_ID_NPR,OWNERSHIP_ID)
	(SELECT a.VBELN,a.BILL_POS_ID, a.VES,a.CENA_BN, a.CENA, a.SUMMA_BN, a.SUMMA_NDS20, a.SUMMA_AKCIZ,
            a.SUMMA, a.VBAP_MATNR, TO_CHAR(10000+A.BILL_POS_ID), DECODE(A.BILL_POS_ID,1,1,11,13,12,13,0)
  	   FROM load_buffer.v_r3_bill_pos A
     WHERE NOT EXISTS 
      (SELECT NULL FROM R3_BILL_POS C WHERE C.VBELN=A.VBELN AND C.R3_BILL_POS_ID=A.BILL_POS_ID)
	   AND EXISTS
      (SELECT NULL FROM R3_BILLS C WHERE C.VBELN=A.VBELN));
  COMMIT;

  -- ���������� NOM_DOK  
  UPDATE R3_BILL_POS B
    SET (NOM_DOK,IS_AGENT,DATE_REALIZ) =
	(SELECT A.NOM_DOK,A.IS_AGENT,A.DATE_VYP_SF FROM R3_BILLS A WHERE A.VBELN=B.VBELN)
   WHERE EXISTS 
	(SELECT NULL FROM R3_BILLS A WHERE A.VBELN=B.VBELN);
  COMMIT;
  
  -- ��������� ������� R3_BILL_POS_ID=1
  UPDATE R3_BILL_POS A 
    SET (PROD_ID_NPR,CENA_BN,CENA)=
	(SELECT B.PROD_ID_NPR,B.CENA_BN,B.CENA
	 FROM BILL_POS B WHERE B.NOM_DOK=A.NOM_DOK AND B.BILL_POS_ID=1) 
  WHERE A.R3_BILL_POS_ID=1
    AND EXISTS (SELECT NULL FROM BILL_POS B WHERE B.NOM_DOK=A.NOM_DOK AND B.BILL_POS_ID=1); 
  COMMIT;
  	
  -- ������� �������
  IF IsFull=1 THEN
    DELETE FROM R3_BILL_POS WHERE NOT EXISTS
      (SELECT NULL FROM load_buffer.v_r3_bills a WHERE a.VBELN=R3_BILL_POS.VBELN);
    COMMIT;
    DELETE FROM R3_BILL_POS WHERE NOT EXISTS
      (SELECT NULL FROM load_buffer.v_r3_bill_pos a WHERE a.VBELN=R3_BILL_POS.VBELN AND a.bill_pos_id=R3_BILL_POS.R3_BILL_POS_ID);
    COMMIT;
    NULL; 
  END IF;
  COMMIT;	

END Renew_R3_Bill_Pos;

/

