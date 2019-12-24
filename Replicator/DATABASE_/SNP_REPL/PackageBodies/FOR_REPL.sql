--
-- FOR_REPL  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY SNP_REPL.For_Repl AS

/* ������� ������ ��������� ������� �� ������� */
FUNCTION ReplaceKav (p_str VARCHAR2) RETURN VARCHAR2 AS
BEGIN
  RETURN REPLACE(p_str,'''','"');
END;

/* ��������� ������� ������ ������ SNP_REPL */
FUNCTION Check_Login(pSessionID NUMBER, pPROC_NAME VARCHAR2) RETURN NUMBER AS
vCnt NUMBER;
BEGIN
  vCnt:=0;

  IF pPROC_NAME='CHECK_INIT' THEN
    -- �������� �� ������ ������������� ��� ���������
    IF USER=gREPL_NAME THEN
      RETURN fr_REPL_OK;
	ELSE
      RETURN fr_REPL_NO_REPL;
	END IF;
  END IF;

  IF pPROC_NAME='CHECK_MAIN' THEN
    -- �������� �� ������ �������� �������������
    IF USER=gREPL_MAIN THEN
      RETURN fr_REPL_OK;
	ELSE
      RETURN fr_REPL_NO_REPL;
	END IF;
  END IF;

  IF pPROC_NAME='CHECK_REPL' THEN
    -- �������� �� ������ �������������� �������������
    IF SUBSTR(USER,1,LENGTH(gREPL_NAME))=gREPL_NAME AND USER<>gREPL_NAME THEN
      RETURN fr_REPL_OK;
	ELSE
      RETURN fr_REPL_NO_REPL;
	END IF;
  END IF;

  IF pPROC_NAME='REFORM_BAD' THEN
    RETURN fr_REPL_OK;
  END IF;

  IF pPROC_NAME IN ('CALL_OUT','RESEND_CALL_OUT') AND
     SUBSTR(USER,1,LENGTH(gREPL_NAME))<>gREPL_NAME AND USER<>gREPL_MAIN THEN
    -- ������� ������� ������������ �������� �� ������������� ����������
    RETURN fr_REPL_NO_REPL;
  END IF;

  IF pPROC_NAME IN ('IMPORT_META','EXPORT_META') AND USER<>gREPL_NAME THEN
    -- ������� ������� �������/�������� ����-���������� �� �������������-����������
    RETURN fr_REPL_NO_REPL;
  END IF;

  IF pPROC_NAME IN ('EXPORT','SEND_DBLINK') AND USER<>gREPL_MAIN THEN
    -- ������� ������� ��������� �������� �������� �� �������� ������������� ����������
    RETURN fr_REPL_NO_REPL;
  END IF;

  IF (SUBSTR(USER,1,LENGTH(gREPL_NAME))<>gREPL_NAME AND USER<>gREPL_MAIN) OR USER=gREPL_NAME THEN
    -- ������ � ������ ���������
    RETURN fr_REPL_VIEW;
  END IF;

  IF gIsTestMode=1 THEN
    -- ���������� �������� � ������ ������������
    RETURN fr_REPL_OK;
  ELSE
    SELECT COUNT(*) INTO vCnt
      FROM V_$SESSION
     WHERE AUDSID<>USERENV('sessionid')
       AND status IN ('ACTIVE','INACTIVE')
       AND username IN (USER,gREPL_NAME);

    IF vCnt=0 THEN
      RETURN fr_REPL_OK;
    ELSE
      RETURN fr_REPL_ACTIVE;
    END IF;
  END IF;
END;

/* ������ � ��� */
PROCEDURE AddLog(pSessionID NUMBER,pSiteRN NUMBER,pCallRN NUMBER,pDateLog DATE,pApplCode NUMBER, pApplMsg VARCHAR2, pProcName VARCHAR2, pSendMail NUMBER) IS
PRAGMA AUTONOMOUS_TRANSACTION;
i NUMBER;
BEGIN
  gErrApplCode:=pApplCode;
  gErrApplMsg:=ReplaceKav(SUBSTR(pApplMsg,1,500));
  gErrOraCode:=SQLCODE;
  gErrOraMsg:=ReplaceKav(SUBSTR(SQLERRM,1,500));
  i:=For_Session.WriteToLog(pSessionId,pApplCode,pApplMsg,pSiteRN,'FOR_REPL',pDateLog,pCallRN,pProcName,pSendMail);
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN ROLLBACK;
END;

/* �������� ������ �� REPL_CALL_OUT */
PROCEDURE DeleteCallOut(pSessionID NUMBER,pCallOutRN NUMBER,
                    pSITE_SOURCE_RN NUMBER ,pSITE_DEST_RN NUMBER, pSTATUS NUMBER, pDATE_EXEC DATE DEFAULT NULL) AS
  vUPDATE_RN NUMBER;
  vALTER_RN NUMBER;
  vOPERATION VARCHAR2(10);
BEGIN
  vALTER_RN:=0;
  IF pSTATUS=fr_CALL_USER_DELETED THEN
    -- ���� �������� ��������� �� ����������, �� ����� �������
	-- ������ �������� �����
	BEGIN
	  -- �������� ����������� �� ��������� ���������
	  SELECT /*+ RULE */ OPERATION,UPDATE_RN INTO vOPERATION,vUPDATE_RN
	    FROM REPL_CALL_OUT
       WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN
         AND SITE_DEST_RN=pSITE_DEST_RN
		 AND RN=pCallOutRN;
	EXCEPTION
	  WHEN OTHERS THEN
	    -- ������� ������
		RETURN;
	END;
    -- ���� ������ ��������
	IF vOPERATION='D' THEN
	  -- � DELETE ��� ������ ����������
      vALTER_RN:=0;
	ELSIF vOPERATION='I' THEN
	  -- � INSERT'� ���� ������ �������� UPDATE
	  vALTER_RN:=vUPDATE_RN;
	ELSIF vOPERATION='U' THEN
	  -- � UPDATE'� ���� ������ �������� INSERT
	  vALTER_RN:=0;
      BEGIN
	    -- ���� INSERT
 	    SELECT /*+ RULE */ RN INTO vALTER_RN
	      FROM REPL_CALL_OUT
         WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN
           AND SITE_DEST_RN=pSITE_DEST_RN
		   AND UPDATE_RN=pCallOutRN;
	  EXCEPTION
	    WHEN OTHERS THEN
		  -- ������� ���
		  vALTER_RN:=0;
	  END;
	END IF;
	vALTER_RN:=NVL(vALTER_RN,0);
  END IF;

--  IF pSTATUS<>fr_CALL_SKIP THEN
    -- ��������� ������
    UPDATE /*+ RULE */ REPL_CALL_OUT SET STATUS=pSTATUS
     WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN
       AND SITE_DEST_RN=pSITE_DEST_RN
       AND (RN=pCallOutRN OR RN=vALTER_RN);
    -- ��������� � �����
--    INSERT INTO REPL_CALL_OUT_HIST (RN, UPDATE_RN, SITE_SOURCE_RN, SITE_DEST_RN, SCHEMA_RN, SCHEMAROW_RN, TABLERN, REPL_RN, OPERATION, MODIFDATE, COUNTER, STATUS, SENDDATE, FILENAME, SQL1_TEXT, SQL2_TEXT, DATE_EXEC, DATE_HIST, DAY_OF_WEEK)
--    SELECT /*+ RULE */ RN, UPDATE_RN, SITE_SOURCE_RN, SITE_DEST_RN, SCHEMA_RN, SCHEMAROW_RN, TABLERN, REPL_RN, OPERATION, MODIFDATE, COUNTER, STATUS, SENDDATE, FILENAME, SQL1_TEXT, SQL2_TEXT, pDATE_EXEC, SYSDATE, TO_NUMBER(TO_CHAR(SYSDATE,'D')) FROM REPL_CALL_OUT
--      WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN
--        AND SITE_DEST_RN=pSITE_DEST_RN
--        AND (RN=pCallOutRN OR RN=vALTER_RN);
--  END IF;

  -- �������
  DELETE /*+ RULE */ FROM REPL_CALL_OUT
   WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN
     AND SITE_DEST_RN=pSITE_DEST_RN
     AND (RN=pCallOutRN OR RN=vALTER_RN);
END;

/* �������������� ������ � REPL_CALL_OUT */
PROCEDURE RestoreCallOut(pSessionID NUMBER,pCallOutRN NUMBER,
                    pSITE_SOURCE_RN NUMBER ,pSITE_DEST_RN NUMBER) AS
  vUPDATE_RN NUMBER;
  vALTER_RN NUMBER;
  vOPERATION VARCHAR2(10);
BEGIN
  vALTER_RN:=0;
  -- ���� �������� ����������������� �� ����������, �� ����� ������������
  -- ������ �������� �����
  BEGIN
	-- �������� ����������� � ����������������� ���������
	SELECT /*+ RULE */ OPERATION,UPDATE_RN INTO vOPERATION,vUPDATE_RN
	    FROM REPL_CALL_OUT_HIST
       WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN
         AND SITE_DEST_RN=pSITE_DEST_RN
		 AND RN=pCallOutRN;
  EXCEPTION
	WHEN OTHERS THEN
	  -- ��������������� ������
	  RETURN;
  END;
  -- ���� ������ ��������
  IF vOPERATION='D' THEN
    -- � DELETE ��� ������ ����������
    vALTER_RN:=0;
  ELSIF vOPERATION='I' THEN
    -- � INSERT'� ���� ������ �������� UPDATE
    vALTER_RN:=vUPDATE_RN;
  ELSIF vOPERATION='U' THEN
    -- � UPDATE'� ���� ������ �������� INSERT
    vALTER_RN:=0;
    BEGIN
	  -- ���� INSERT
 	  SELECT /*+ RULE */ RN INTO vALTER_RN
	      FROM REPL_CALL_OUT_HIST
         WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN
           AND SITE_DEST_RN=pSITE_DEST_RN
		   AND UPDATE_RN=pCallOutRN;
	EXCEPTION
	  WHEN OTHERS THEN
	    -- ������� ���
	    vALTER_RN:=0;
	END;
  END IF;
  vALTER_RN:=NVL(vALTER_RN,0);
  -- ��������� ������
  UPDATE /*+ RULE */ REPL_CALL_OUT_HIST SET STATUS=fr_CALL_USER_RESTORED
   WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN
     AND SITE_DEST_RN=pSITE_DEST_RN
     AND (RN=pCallOutRN OR RN=vALTER_RN);
  -- ��������������� �� ������
  INSERT INTO REPL_CALL_OUT (RN, UPDATE_RN, SITE_SOURCE_RN, SITE_DEST_RN, SCHEMA_RN, SCHEMAROW_RN, TABLERN, REPL_RN, OPERATION, MODIFDATE, COUNTER, STATUS, SENDDATE, FILENAME, SQL1_TEXT, SQL2_TEXT)
   SELECT /*+ RULE */ RN, UPDATE_RN, SITE_SOURCE_RN, SITE_DEST_RN, SCHEMA_RN, SCHEMAROW_RN, TABLERN, REPL_RN, OPERATION, MODIFDATE, COUNTER, STATUS, SENDDATE, FILENAME, SQL1_TEXT, SQL2_TEXT FROM REPL_CALL_OUT_HIST
    WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN
      AND SITE_DEST_RN=pSITE_DEST_RN
      AND (RN=pCallOutRN OR RN=vALTER_RN);
  -- ������� �� ������
  DELETE /*+ RULE */ FROM REPL_CALL_OUT_HIST
   WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN
     AND SITE_DEST_RN=pSITE_DEST_RN
     AND (RN=pCallOutRN OR RN=vALTER_RN);
END;

/* ��������� �������� ������� ����������� �� ���� pSITE_DEST_RN �� ���� pSITE_SOURCE_RN */
FUNCTION Answ_In(pSessionID NUMBER,pSITE_SOURCE_RN NUMBER,pSITE_DEST_RN NUMBER) RETURN NUMBER AS
vResult NUMBER;
vCounter NUMBER;
BEGIN
  vResult:=fr_REPL_OK;

  -- ���������� ������ �� ��������� ������
  FOR lcur IN (
               SELECT /*+ RULE */ A.*
			   FROM REPL_ANSW A
			   WHERE A.SITE_SOURCE_RN=pSITE_SOURCE_RN -- ���� ��������
                 AND A.SITE_DEST_RN=pSITE_DEST_RN -- ���� ����������
			   ORDER BY A.RN
			  )
  LOOP
    IF lcur.STATUS>=fr_CALL_OK THEN
	  -- �������� �������� �������
	  -- �������� ������ �� REPL_CALL_OUT
	  DeleteCallOut(pSessionId,lcur.CALL_OUT_RN,pSITE_SOURCE_RN,pSITE_DEST_RN,lcur.STATUS,lcur.DATE_LOG);
    ELSE
	  vCOUNTER:=0;
	  CASE
	    WHEN lcur.STATUS=fr_CALL_USER_DELETED THEN
		  -- �������� ������ �� ������� ����
		  NULL;
	    WHEN lcur.STATUS=fr_CALL_DEST_USER_DELETED THEN
		  -- �������� ������ �� ����-����������
 	      UPDATE REPL_CALL_OUT SET STATUS=lcur.STATUS
	       WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN
	         AND SITE_DEST_RN=pSITE_DEST_RN
		     AND RN=lcur.CALL_OUT_RN;
	    WHEN lcur.STATUS=fr_CALL_USER_RESTORED THEN
		  -- �������� ������������ �� ������� ����
		  NULL;
	    WHEN lcur.STATUS=fr_CALL_DEST_USER_RESTORED THEN
		  -- �������� ������������ �� ����-����������
		  NULL;
		ELSE
		  -- ���������� ������� ������� ��������
		  BEGIN
 	        SELECT /*+ RULE */ COUNTER INTO vCOUNTER
			  FROM REPL_CALL_OUT
	         WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN
	           AND SITE_DEST_RN=pSITE_DEST_RN
		       AND RN=lcur.CALL_OUT_RN;
		  EXCEPTION
		    WHEN OTHERS THEN
			  vCOUNTER:=0;
		  END;
 	      -- ��������� ������� ��������
	      -- ���������� ���� ����������
 	      UPDATE REPL_CALL_OUT SET COUNTER=COUNTER+1, STATUS=fr_CALL_RESEND
	       WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN
	         AND SITE_DEST_RN=pSITE_DEST_RN
	  	     AND RN=lcur.CALL_OUT_RN;
	  END CASE;
      -- � ������
	  IF vCOUNTER=1 THEN
	    -- ���� ��� ������ ������, �� � ������� ����������� ��� ������ �������� �� ����
        AddLog(pSessionId,pSITE_DEST_RN,lcur.CALL_OUT_RN,lcur.DATE_LOG,lcur.STATUS,lcur.NOTE,'ANSW_IN',0);
	  ELSE
	    -- ���� ��� �� ������ ������ ��� ������������� ������, �� - �������� ������
        AddLog(pSessionId,pSITE_DEST_RN,lcur.CALL_OUT_RN,lcur.DATE_LOG,lcur.STATUS,lcur.NOTE,'ANSW_IN',1);
	  END IF;

      vResult:=fr_REPL_ERROR;
	END IF;

    DELETE FROM REPL_ANSW A
     WHERE A.SITE_SOURCE_RN=pSITE_SOURCE_RN -- ���� ��������
       AND A.SITE_DEST_RN=pSITE_DEST_RN -- ���� ����������
	   AND A.RN=lcur.RN;

  END LOOP;
  RETURN vResult;
END;

/* �������� ����������� ���������� ��������� */
FUNCTION CheckReplMode (pSessionID NUMBER,pREPL_USERNAME VARCHAR2, pREPL_TABLENAME VARCHAR2,
     pREPL_TABLERN NUMBER, pREPL_MODE NUMBER, pREPL_TABLE VARCHAR2,
	 pOPERATION VARCHAR2, pMODIFDATE DATE, pCALL_RN NUMBER) RETURN NUMBER AS
  vSQLText VARCHAR2(4000);
  vCnt NUMBER;
BEGIN
  IF pREPL_MODE=fr_REPL_MODE_NODELETE AND pOPERATION='D' THEN
    -- ��������� �� ����������� ��������
    RETURN fr_CALL_SKIP_MODE_NODELETE;
  END IF;
  IF pREPL_MODE=fr_REPL_MODE_CHECKDATE THEN
    -- ��������� �� ������� ����� ������ ���������
    BEGIN
	  vSQLText:='SELECT COUNT(*) FROM '||pREPL_TABLE||' WHERE REPL_USERNAME='''||pREPL_USERNAME||''''||
	  ' AND REPL_TABLENAME='''||pREPL_TABLENAME||''''||
	  ' AND REPL_TABLERN='||pREPL_TABLERN||
	  ' AND REPL_MODIFDATE>:MODIFDATE '||
      ' AND REPL_AUTHID NOT LIKE '''||gREPL_NAME||'%'''|| -- ��������� �����������, ��������� ������������
	  ' AND ROWNUM=1 ';
	  EXECUTE IMMEDIATE vSQLText INTO vCnt USING pMODIFDATE;
	  IF vCnt>0 THEN
        RETURN fr_CALL_SKIP_MODE_CHECKDATE;
	  END IF;
	EXCEPTION
	  WHEN OTHERS THEN
	    -- ���� ������ - ������ ����� ����������� ������� ����������
		-- ��� � ��� ������������ ���������
		AddLog(pSessionId,gRepl_init.SITE_RN,pCALL_RN,SYSDATE,fr_CALL_ERR,'������ ��� ��������� � ������� '||pREPL_TABLE||': '||SQLERRM,'CALL_IN',1);
	END;
  END IF;
  RETURN fr_CALL_OK;
END;

/* ���������� ��������� */
FUNCTION ExecuteSQL(pEXEC_MODE VARCHAR2,pSessionID NUMBER,pOPERATION VARCHAR2,pUSERNAME VARCHAR2,pTABLENAME VARCHAR2,pSQLText VARCHAR2,pCallRN NUMBER,pCOUNTER NUMBER) RETURN NUMBER AS
  vSQLText VARCHAR2(8000);
  cur INTEGER; -- ������
  vCnt NUMBER;
BEGIN
  IF pOPERATION='I' THEN
    vSQLText:='INSERT INTO '||pUSERNAME||'.'||pTABLENAME;
  ELSE
    IF pOPERATION='U' THEN
      vSQLText:='UPDATE '||pUSERNAME||'.'||pTABLENAME;
	ELSE
      vSQLText:='DELETE FROM '||pUSERNAME||'.'||pTABLENAME;
	END IF;
  END IF;

  SAVEPOINT repl_exec;

  -- ��������� ������
  cur := DBMS_SQL.OPEN_CURSOR;
  -- ������� �������
  DBMS_SQL.PARSE(cur,vSQLText||' '||pSQLText,DBMS_SQL.NATIVE);
  -- ���������� �������
  vCnt := DBMS_SQL.EXECUTE (cur);
  -- ��������� ������
  DBMS_SQL.CLOSE_CURSOR (cur);
  IF vCnt=0 THEN
    RETURN fr_CALL_NO_DATA_FOUND;
  ELSE
    RETURN fr_CALL_OK;
  END IF;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK TO repl_exec;
	IF pEXEC_MODE<>'NO_ERROR' THEN
	  IF pCOUNTER=1 THEN
	    -- ���� ��� ������ ���������� ��������� - �� �������� ������
    	AddLog(pSessionId,gRepl_init.SITE_RN,pCallRN,SYSDATE,fr_CALL_ERR,SQLERRM,'CALL_IN',0);
	  ELSE
	    -- ���� ��� �� ������ ���������� ��������� - �������� ������
    	AddLog(pSessionId,gRepl_init.SITE_RN,pCallRN,SYSDATE,fr_CALL_ERR,SQLERRM,'CALL_IN',1);
	  END IF;
	END IF;
    RETURN fr_CALL_ERR;
END;

/* ���������� ������ � REPL_ANSW */
FUNCTION AddAnswOut(pSessionID NUMBER,pCallOutRN NUMBER,
                    pSITE_SOURCE_RN NUMBER ,pSITE_DEST_RN NUMBER ,
					pSTATUS NUMBER, pNOTE VARCHAR2) RETURN NUMBER AS
  vRN NUMBER;
BEGIN
  vRN:=Get_Seq_Local();
  INSERT INTO REPL_ANSW (RN,SITE_SOURCE_RN,SITE_DEST_RN,CALL_OUT_RN,STATUS,NOTE,DATE_LOG)
	   VALUES(vRN,pSITE_SOURCE_RN,pSITE_DEST_RN,pCallOutRN,pSTATUS,SUBSTR(pNOTE,1,500),SYSDATE);
  RETURN vRN;
END;


/* �������� ������ �� REPL_CALL */
PROCEDURE DeleteCall(pSessionID NUMBER,pCallOutRN NUMBER,
                    pSITE_SOURCE_RN NUMBER ,pSITE_DEST_RN NUMBER, pStatus NUMBER, pDATE_EXEC DATE DEFAULT NULL) AS
  vUPDATE_RN NUMBER;
  vALTER_RN NUMBER;
  vOPERATION VARCHAR2(10);
BEGIN
  vALTER_RN:=0;
  IF pSTATUS=fr_CALL_USER_DELETED THEN
    -- ���� �������� ��������� �� ����������, �� ����� �������
	-- ������ �������� �����
	BEGIN
	  -- �������� ����������� �� ��������� ���������
	  SELECT /*+ RULE */ OPERATION,UPDATE_RN INTO vOPERATION,vUPDATE_RN
	    FROM REPL_CALL
       WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN
         AND SITE_DEST_RN=pSITE_DEST_RN
		 AND RN=pCallOutRN
		 AND ROWNUM=1;
	EXCEPTION
	  WHEN OTHERS THEN
	    -- ������� ������
		RETURN;
	END;
    -- ���� ������ ��������
	IF vOPERATION='D' THEN
	  -- � DELETE ��� ������ ����������
      vALTER_RN:=0;
	ELSIF vOPERATION='I' THEN
	  -- � INSERT'� ���� ������ �������� UPDATE
	  vALTER_RN:=vUPDATE_RN;
	ELSIF vOPERATION='U' THEN
	  -- � UPDATE'� ���� ������ �������� INSERT
	  vALTER_RN:=0;
      BEGIN
	    -- ���� INSERT
 	    SELECT /*+ RULE */ RN INTO vALTER_RN
	      FROM REPL_CALL
         WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN
           AND SITE_DEST_RN=pSITE_DEST_RN
		   AND UPDATE_RN=pCallOutRN
		   AND ROWNUM=1;
	  EXCEPTION
	    WHEN OTHERS THEN
		  -- ������� ���
		  vALTER_RN:=0;
	  END;
	END IF;
	vALTER_RN:=NVL(vALTER_RN,0);
  END IF;

  IF pStatus<fr_CALL_OK THEN
    -- ��������� ������
	UPDATE /*+ RULE*/ REPL_CALL SET STATUS=pStatus
    WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN
	  AND SITE_DEST_RN=pSITE_DEST_RN
      AND RN=pCallOutRN
	  AND ROWNUM=1;
	UPDATE /*+ RULE*/ REPL_CALL SET STATUS=pStatus
    WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN
	  AND SITE_DEST_RN=pSITE_DEST_RN
      AND RN=vALTER_RN
	  AND ROWNUM=1;
    -- ��������� ��������� ��������
    INSERT INTO REPL_CALL_ERR (RN, UPDATE_RN, SITE_SOURCE_RN, SITE_DEST_RN, SCHEMA_RN, SCHEMAROW_RN, TABLERN, REPL_RN, OPERATION, MODIFDATE, COUNTER, STATUS, SENDDATE, FILENAME, SQL1_TEXT, SQL2_TEXT, DATE_EXEC, DATE_HIST)
  	  SELECT /*+ RULE */ RN, UPDATE_RN, SITE_SOURCE_RN, SITE_DEST_RN, SCHEMA_RN, SCHEMAROW_RN, TABLERN, REPL_RN, OPERATION, MODIFDATE, COUNTER, STATUS, SENDDATE, FILENAME, SQL1_TEXT, SQL2_TEXT, pDATE_EXEC, SYSDATE FROM REPL_CALL
    WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN
	  AND SITE_DEST_RN=pSITE_DEST_RN
      AND RN=pCallOutRN
	  AND ROWNUM=1;
    INSERT INTO REPL_CALL_ERR (RN, UPDATE_RN, SITE_SOURCE_RN, SITE_DEST_RN, SCHEMA_RN, SCHEMAROW_RN, TABLERN, REPL_RN, OPERATION, MODIFDATE, COUNTER, STATUS, SENDDATE, FILENAME, SQL1_TEXT, SQL2_TEXT, DATE_EXEC, DATE_HIST)
  	  SELECT /*+ RULE */ RN, UPDATE_RN, SITE_SOURCE_RN, SITE_DEST_RN, SCHEMA_RN, SCHEMAROW_RN, TABLERN, REPL_RN, OPERATION, MODIFDATE, COUNTER, STATUS, SENDDATE, FILENAME, SQL1_TEXT, SQL2_TEXT, pDATE_EXEC, SYSDATE FROM REPL_CALL
    WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN
	  AND SITE_DEST_RN=pSITE_DEST_RN
      AND RN=vALTER_RN
	  AND ROWNUM=1;
  END IF;
  -- ������� ��������
  DELETE /*+ RULE */ FROM REPL_CALL
    WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN
	  AND SITE_DEST_RN=pSITE_DEST_RN
      AND RN=pCallOutRN
	  AND ROWNUM=1;
  DELETE /*+ RULE */ FROM REPL_CALL
    WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN
	  AND SITE_DEST_RN=pSITE_DEST_RN
      AND RN=vALTER_RN
	  AND ROWNUM=1;
END;

/* �������������� ������ � REPL_CALL */
PROCEDURE RestoreCall(pSessionID NUMBER,pCallOutRN NUMBER,
                    pSITE_SOURCE_RN NUMBER ,pSITE_DEST_RN NUMBER) AS
  vUPDATE_RN NUMBER;
  vALTER_RN NUMBER;
  vOPERATION VARCHAR2(10);
BEGIN
  vALTER_RN:=0;
  -- ���� �������� ����������������� �� ����������, �� ����� �������
  -- ������ �������� �����
  BEGIN
	  -- �������� ����������� �� ���������
	  SELECT /*+ RULE */ OPERATION,UPDATE_RN INTO vOPERATION,vUPDATE_RN
	    FROM REPL_CALL_ERR
       WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN
         AND SITE_DEST_RN=pSITE_DEST_RN
		 AND RN=pCallOutRN
		 AND ROWNUM=1;
  EXCEPTION
	  WHEN OTHERS THEN
	    -- ��������������� ������
		RETURN;
  END;
  -- ���� ������ ��������
  IF vOPERATION='D' THEN
	  -- � DELETE ��� ������ ����������
      vALTER_RN:=0;
  ELSIF vOPERATION='I' THEN
	  -- � INSERT'� ���� ������ �������� UPDATE
	  vALTER_RN:=vUPDATE_RN;
  ELSIF vOPERATION='U' THEN
	  -- � UPDATE'� ���� ������ �������� INSERT
    vALTER_RN:=0;
    BEGIN
	    -- ���� INSERT
 	    SELECT /*+ RULE */ RN INTO vALTER_RN
	      FROM REPL_CALL_ERR
         WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN
           AND SITE_DEST_RN=pSITE_DEST_RN
		   AND UPDATE_RN=pCallOutRN
		   AND ROWNUM=1;
	EXCEPTION
	    WHEN OTHERS THEN
		  -- ������� ���
		  vALTER_RN:=0;
    END;
  END IF;
  vALTER_RN:=NVL(vALTER_RN,0);

  -- ��������� ������
  UPDATE /*+ RULE */ REPL_CALL_ERR SET STATUS=fr_CALL_USER_RESTORED
   WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN
     AND SITE_DEST_RN=pSITE_DEST_RN
     AND RN=pCallOutRN
	 AND ROWNUM=1;
  UPDATE /*+ RULE */ REPL_CALL_ERR SET STATUS=fr_CALL_USER_RESTORED
   WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN
     AND SITE_DEST_RN=pSITE_DEST_RN
     AND RN=vALTER_RN
	 AND ROWNUM=1;
  -- ��������� ��������� ��������
  INSERT INTO REPL_CALL (RN, UPDATE_RN, SITE_SOURCE_RN, SITE_DEST_RN, SCHEMA_RN, SCHEMAROW_RN, TABLERN, REPL_RN, OPERATION, MODIFDATE, COUNTER, STATUS, SENDDATE, FILENAME, SQL1_TEXT, SQL2_TEXT)
    SELECT /*+ RULE */ RN, UPDATE_RN, SITE_SOURCE_RN, SITE_DEST_RN, SCHEMA_RN, SCHEMAROW_RN, TABLERN, REPL_RN, OPERATION, MODIFDATE, COUNTER, STATUS, SENDDATE, FILENAME, SQL1_TEXT, SQL2_TEXT FROM REPL_CALL_ERR
    WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN
	  AND SITE_DEST_RN=pSITE_DEST_RN
      AND RN=pCallOutRN
	 AND ROWNUM=1;
  INSERT INTO REPL_CALL (RN, UPDATE_RN, SITE_SOURCE_RN, SITE_DEST_RN, SCHEMA_RN, SCHEMAROW_RN, TABLERN, REPL_RN, OPERATION, MODIFDATE, COUNTER, STATUS, SENDDATE, FILENAME, SQL1_TEXT, SQL2_TEXT)
    SELECT /*+ RULE */ RN, UPDATE_RN, SITE_SOURCE_RN, SITE_DEST_RN, SCHEMA_RN, SCHEMAROW_RN, TABLERN, REPL_RN, OPERATION, MODIFDATE, COUNTER, STATUS, SENDDATE, FILENAME, SQL1_TEXT, SQL2_TEXT FROM REPL_CALL_ERR
    WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN
	  AND SITE_DEST_RN=pSITE_DEST_RN
      AND RN=vALTER_RN
	 AND ROWNUM=1;
  -- ������� ��������
  DELETE /*+ RULE */ FROM REPL_CALL_ERR
    WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN
	  AND SITE_DEST_RN=pSITE_DEST_RN
      AND RN=pCallOutRN
	 AND ROWNUM=1;
  DELETE /*+ RULE */ FROM REPL_CALL_ERR
    WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN
	  AND SITE_DEST_RN=pSITE_DEST_RN
      AND RN=vALTER_RN
	 AND ROWNUM=1;
END;

/* ���������� ���������� ������� */
FUNCTION OneCallIn (pEXEC_MODE VARCHAR2,pSessionId NUMBER,pSITE_SOURCE_RN NUMBER, pSITE_DEST_RN NUMBER,
                    pSQL_TEXT VARCHAR2, pRN NUMBER, pREPL_USERNAME VARCHAR2, pREPL_TABLENAME VARCHAR2,
					pUSERNAME VARCHAR2,pTABLENAME VARCHAR2,
                    pTABLERN NUMBER, pREPL_MODE NUMBER, pREPL_TABLE VARCHAR2,
                    pOPERATION VARCHAR2, pMODIFDATE DATE, pCOUNTER NUMBER) RETURN NUMBER AS
  vSQLText VARCHAR2(8000);
  vInsertSQLText VARCHAR2(8000);
  vStatusANSW NUMBER;
  vInsertRN NUMBER;
  vInsertSQL1 NUMBER;
  vInsertSQL2 NUMBER;
  vRN NUMBER;
  vNote VARCHAR2(500);
  vInsertNote VARCHAR2(500);
  vResult NUMBER;
BEGIN
  vResult:=fr_REPL_OK;
  vStatusANSW:=fr_CALL_OK;
  vInsertRN:=0;
  vNote:='';
  vInsertNote:='';
  IF pOPERATION='U' THEN
    -- ���� ��� UPDATE - ���� ������ INSERT
	BEGIN
	  SELECT /*+ RULE */ A.RN,A.SQL1_TEXT||A.SQL2_TEXT AS SQL_TEXT
		INTO vInsertRN,vInsertSQLText
		FROM REPL_CALL A
        WHERE A.UPDATE_RN=pRN -- �� RN UPDATE'�
		  AND A.SITE_SOURCE_RN=pSITE_SOURCE_RN -- ���� ��������
          AND A.SITE_DEST_RN=pSITE_DEST_RN -- ���� ����������
		  AND A.OPERATION='I';
    EXCEPTION
      WHEN OTHERS THEN
	    vInsertRN:=0;
	END;
  END IF;

  -- ��������� ��������
  vSQLText:=pSQL_TEXT;
  -- ��������� ����������� ����������
  gErrApplMsg:='';
  vStatusANSW:=CheckReplMode (pSessionId,
                    pREPL_USERNAME, pREPL_TABLENAME,
                    pTABLERN, pREPL_MODE, pREPL_TABLE,
                    pOPERATION, pMODIFDATE, pRN);
  vNote:=gErrApplMsg;
  IF vStatusANSW=fr_CALL_OK THEN
	-- ����������
  	gErrApplMsg:='';
	vStatusANSW:=ExecuteSQL(pEXEC_MODE,pSessionId,pOPERATION,pUSERNAME,pTABLENAME,vSQLText,pRN,pCOUNTER);
    vNote:=gErrApplMsg;
	IF pOPERATION='U' AND vStatusANSW=fr_CALL_NO_DATA_FOUND AND vInsertRN<>0 THEN
	  -- ���� UPDDATE �� ������ ��-�� ���������� ������ � ���� INSERT
      -- ��������� �������� INSERT
 	  gErrApplMsg:='';
      vStatusANSW:=ExecuteSQL(pEXEC_MODE,pSessionId,'I',pUSERNAME,pTABLENAME,vInsertSQLText,pRN,pCOUNTER);
	  vInsertNote:=gErrApplMsg;
	END IF;
  END IF;

  -- ��������� ����� �� UPDATE ��� DELETE
  IF vStatusANSW>=fr_CALL_OK THEN
	vNote:='';
	vInsertNote:='';
    IF pEXEC_MODE='NO_ERROR' AND vStatusANSW=fr_CALL_NO_DATA_FOUND THEN
	  vResult:=fr_CALL_NO_DATA_FOUND;
	END IF;
  ELSE
	vResult:=fr_REPL_ERROR;
  END IF;
  -- ���� ����� "��� ������", �� ������������ � ������� ������ ��������
  IF pEXEC_MODE<>'NO_ERROR' OR vResult=fr_REPL_OK /*OR vResult=fr_CALL_NO_DATA_FOUND*/ THEN
    vRN:=AddAnswOut(pSessionId,pRN,pSITE_SOURCE_RN,pSITE_DEST_RN,vStatusANSW,vNote);
    IF vInsertRN<>0 THEN
	  -- ��������� ����� �� INSERT
  	  vRN:=AddAnswOut(pSessionId,vInsertRN,pSITE_SOURCE_RN,pSITE_DEST_RN,vStatusANSW,vInsertNote);
    END IF;
    -- ������� �������� �� ������ REPL_CALL
    DeleteCall(pSessionId,pRN,pSITE_SOURCE_RN,pSITE_DEST_RN,vStatusANSW,SYSDATE);
    IF vInsertRN<>0 THEN
  	  DeleteCall(pSessionId,vInsertRN,pSITE_SOURCE_RN,pSITE_DEST_RN,vStatusANSW,SYSDATE);
    END IF;
  END IF;
--  IF pEXEC_MODE<>'NO_ERROR' THEN
    COMMIT;
--  END IF;
  RETURN vResult;
END;

/* ���������� �������� �������� ����������� �� ���� pSITE_SOURCE_RN �� ���� pSITE_DEST_RN */
FUNCTION Call_In(pSessionID NUMBER,pSITE_SOURCE_RN NUMBER,pSITE_DEST_RN NUMBER,pSCHEMA_RN NUMBER) RETURN NUMBER AS
  vStatus NUMBER;
  vResult NUMBER;
BEGIN
  vResult:=fr_REPL_OK;
  -- 1-�� ������: ��� ����������� ������, ��� �������� ��������� ����������,
  -- ��� ������������� COMMIT'�� � � ��� �������, � ������� ���������
  -- ���������������� �����������
  -- ����, ���� ����-�� 1 �������� ��������
  LOOP
    vResult:=fr_REPL_ERROR; -- ����� �� ���������� ��� ���������� ����������
    FOR lcur IN (
               SELECT /*+ RULE */ A.*, A.SQL1_TEXT ||A.SQL2_TEXT AS SQL_TEXT,
			          C.REPL_MODE, C.REPL_TABLE,
					  D.REPL_USERNAME, D.REPL_TABLENAME,
					  D.USERNAME, D.TABLENAME
			   FROM REPL_CALL A, REPL_SCHEMA B, REPL_SCHEMA_ROW C, REPL_TABLE D
			   WHERE A.SITE_SOURCE_RN=pSITE_SOURCE_RN -- ���� ��������
                 AND A.SITE_DEST_RN=pSITE_DEST_RN -- ���� ����������
			     AND A.SITE_SOURCE_RN=B.SITE_SOURCE_RN
                 AND A.SITE_DEST_RN=B.SITE_DEST_RN
				 AND A.SCHEMA_RN=B.RN
				 AND A.SCHEMAROW_RN=C.RN
				 AND C.TABLE_DEST_RN=D.RN -- ������� �� ����-����������
				 AND A.OPERATION IN ('U','D') -- ������ DELETE � UPDATE
				 AND B.IS_ACTIVE=1 -- �������� �����
				 AND C.IS_ACTIVE=1 -- �������� ������ �����
				 AND A.STATUS>fr_REPL_ERROR -- �������� �������
			   ORDER BY A.MODIFDATE,A.REPL_RN
			  )
    LOOP
      vStatus:=OneCallIn ('NO_ERROR',pSessionId,pSITE_SOURCE_RN,pSITE_DEST_RN,
                    lcur.SQL_TEXT,lcur.RN,lcur.REPL_USERNAME,lcur.REPL_TABLENAME,
                    lcur.USERNAME,lcur.TABLENAME,
                    lcur.TABLERN,lcur.REPL_MODE,lcur.REPL_TABLE,
                    lcur.OPERATION,lcur.MODIFDATE,lcur.COUNTER);
	  IF vStatus>fr_REPL_ERROR AND vStatus<>fr_CALL_NO_DATA_FOUND THEN
	    vResult:=fr_REPL_OK;
	  END IF;
    END LOOP;
    EXIT WHEN vResult=fr_REPL_ERROR;
  END LOOP;
  COMMIT;

  vResult:=fr_REPL_OK;
  -- 2-�� ������: � ������������ ������
  FOR lcur IN (
               SELECT /*+ RULE */ A.*, A.SQL1_TEXT ||A.SQL2_TEXT AS SQL_TEXT,
			          C.REPL_MODE, C.REPL_TABLE,
					  D.REPL_USERNAME, D.REPL_TABLENAME,
					  D.USERNAME, D.TABLENAME
			   FROM REPL_CALL A, REPL_SCHEMA B, REPL_SCHEMA_ROW C, REPL_TABLE D
			   WHERE A.SITE_SOURCE_RN=pSITE_SOURCE_RN -- ���� ��������
                 AND A.SITE_DEST_RN=pSITE_DEST_RN -- ���� ����������
			     AND A.SITE_SOURCE_RN=B.SITE_SOURCE_RN
                 AND A.SITE_DEST_RN=B.SITE_DEST_RN
				 AND A.SCHEMA_RN=B.RN
				 AND A.SCHEMAROW_RN=C.RN
				 AND C.TABLE_DEST_RN=D.RN -- ������� �� ����-����������
				 AND A.OPERATION IN ('D','U') -- ������ DELETE � UPDATE
				 AND B.IS_ACTIVE=1 -- �������� �����
				 AND C.IS_ACTIVE=1 -- �������� ������ �����
				 AND A.STATUS>fr_REPL_ERROR -- �������� �������
			   ORDER BY B.SORTBY,C.SORTBY,A.TABLERN
			  )
  LOOP
    vStatus:=OneCallIn ('FULL',pSessionId,pSITE_SOURCE_RN,pSITE_DEST_RN,
                    lcur.SQL_TEXT,lcur.RN,lcur.REPL_USERNAME,lcur.REPL_TABLENAME,
                    lcur.USERNAME,lcur.TABLENAME,
                    lcur.TABLERN,lcur.REPL_MODE,lcur.REPL_TABLE,
                    lcur.OPERATION,lcur.MODIFDATE,lcur.COUNTER);
	IF vStatus<=fr_REPL_ERROR THEN
	  vResult:=fr_REPL_ERROR;
	END IF;
	COMMIT;
  END LOOP;

  RETURN vResult;
END;

/* ���������� ������ � REPL_CALL_OUT */
FUNCTION AddCallOut(pSessionID NUMBER,pSQLText VARCHAR2,pUpdate_RN NUMBER,
                    pSITE_SOURCE_RN NUMBER ,pSITE_DEST_RN NUMBER ,pSCHEMA_RN NUMBER, pSCHEMAROW_RN NUMBER,
					pTABLERN NUMBER,
			        pReplRN NUMBER,pOperation VARCHAR2,pModifdate DATE) RETURN NUMBER AS
  vRN NUMBER;
  vSQL1 VARCHAR2(4000);
  vSQL2 VARCHAR2(4000);
BEGIN
  vSQL1:=SUBSTR(pSQLText,1,4000);
  vSQL2:=SUBSTR(pSQLText,4001,8000);
  IF vSQL1||' '<>' ' THEN
	-- REPL_CALL_OUT
	vRN:=Get_Seq_Local();
    INSERT INTO REPL_CALL_OUT
	   (RN,UPDATE_RN,SITE_SOURCE_RN,SITE_DEST_RN,SCHEMA_RN,SCHEMAROW_RN,TABLERN,
	    REPL_RN,OPERATION,MODIFDATE,COUNTER,STATUS,SQL1_TEXT,SQL2_TEXT)
	  VALUES(
		vRN,pUpdate_RN,pSITE_SOURCE_RN,pSITE_DEST_RN,pSCHEMA_RN,pSCHEMAROW_RN,pTABLERN,
			pReplRN,pOperation,pModifdate,1,fr_CALL_NOTSEND,vSQL1,vSQL2);
  ELSE
    vRN:=fr_REPL_SQL_EMPTY;
  END IF;
  RETURN vRN;
END;


/* ������������ ��������� �������� � ���� pSITE_SOURCE_RN �� ���� pSITE_DEST_RN �� ����� pSCHEMA_RN */
FUNCTION Call_Out(pSessionID NUMBER,pSITE_SOURCE_RN NUMBER,pSITE_DEST_RN NUMBER,pSCHEMA_RN NUMBER) RETURN NUMBER AS
TYPE ReplCursor_type IS REF CURSOR;
ReplCursor ReplCursor_type;

vReplRN NUMBER; -- RN ������� ����������
vTableRN NUMBER; -- RN ������������� ������� �� ������� ����������
vOrigRN NUMBER; -- RN ������������� ������� �� ����� �������
vOperation VARCHAR2(1); -- ��������
vModifdate DATE;  -- ���� �����������

cur INTEGER; -- ������

f_number NUMBER; -- ���� ���� NUMBER
f_varchar2 VARCHAR2(2000); -- ���� ���� VARCHAR2
f_date DATE; -- ���� ���� DATE

fdbk INTEGER; -- ���������  EXECUTE

vSQLFields VARCHAR2(2000); -- ������ ������������� �����
vSQLFieldsD VARCHAR2(2000); -- ������ ������������� ����� (� ���������� D.)
vSQLText VARCHAR2(4000); -- ������ �� �������� ��� ����������
vSQLTextINS VARCHAR2(4000); -- ������ �� ����������
vStatus NUMBER; -- ������ ��� ������� REPL_STATUS
vResult NUMBER; -- ��������� �������

TYPE Column_rec IS RECORD (
      COLUMN_ID NUMBER,
	  COLUMN_NAME VARCHAR2(30),
      DATA_TYPE VARCHAR2(120),
	  DATA_LENGTH NUMBER
   ); -- ���: �������� ����
TYPE Columns_type IS TABLE OF Column_rec INDEX BY BINARY_INTEGER; -- ���: ������ �����
ColList Columns_type; -- ������ �����
ColListCount NUMBER; -- ���-�� �����
zpt VARCHAR2(1);
i NUMBER;
s VARCHAR2(4000);
vUpdate_RN NUMBER;
vRN NUMBER;
BEGIN

  vResult:=fr_REPL_OK;

  -- ��������� ������
  cur := DBMS_SQL.OPEN_CURSOR;

  -- ���������� �������, ��������� � ����� ����������
  FOR lcur IN (
               SELECT
			     A.RN AS SCHEMAROW_RN,
			     B.REPL_USERNAME, B.REPL_TABLENAME, -- ������� �� ������� ����������
			     B.USERNAME, B.TABLENAME, -- �������/�������������, ��� ������� ����� ����������� ���������
				 B.RNNAME, -- ��� ����������� ID
				 Trim(A.SQL_FIELDS) AS SQL_FIELDS, -- ������ �����
				 Trim(A.SQL_WHERE) AS SQL_WHERE, -- ���. �������
				 Trim(A.REPL_TABLE) AS REPL_TABLE, -- ��������� �������/������������� ����������
				 A.REPL_MODE, -- ����� ����������
				 A.SORTBY -- �������
			   FROM REPL_SCHEMA_ROW A, REPL_TABLE B
			   WHERE A.TABLE_SOURCE_RN=B.RN -- ������� �� ����-���������
			     AND A.IS_ACTIVE=1  -- �������� ������ �����
				 AND A.SITE_SOURCE_RN=pSITE_SOURCE_RN -- ���� ��������
                 AND A.SITE_DEST_RN=pSITE_DEST_RN -- ���� ����������
                 AND A.SCHEMA_RN=pSCHEMA_RN -- ����� ����������
				 AND USER=(CASE
				             WHEN A.REPL_USER||' '=' ' THEN gREPL_MAIN
							 ELSE A.REPL_USER
						   END)
			   ORDER BY A.SORTBY,B.USERNAME,B.TABLENAME
			  )
  LOOP
    EXIT WHEN vResult<=fr_REPL_ERROR;
    ColListCount:=0;
	vSQLFields:=lcur.SQL_FIELDS;
	-- ���� ������ ����� ������
	IF vSQLFields||' ' = ' ' THEN
	  vSQLFields:='*';
	END IF;
	vSQLFields:=','||vSQLFields||',';
	vSQLFields:=NLS_UPPER(REPLACE(vSQLFields,' ',''));
	-- �������� ������� ���� RN (���� ��� - ��������� � ������ �����)
    IF INSTR(vSQLFields,','||lcur.RNNAME||',')<=0 AND vSQLFields<>',*,' THEN
	  vSQLFields:=vSQLFields||lcur.RNNAME||',';
    END IF;

    -- ���������� ������ ����� � ���� �������
	FOR cs IN (SELECT C.COLUMN_ID,C.COLUMN_NAME,C.DATA_TYPE, C.DATA_LENGTH
                      FROM SYS.ALL_TAB_COLUMNS C
					 WHERE C.OWNER=lcur.USERNAME
					   AND C.TABLE_NAME=lcur.TABLENAME
                     ORDER BY C.COLUMN_ID)
    LOOP
	  IF INSTR(vSQLFields,','||cs.COLUMN_NAME||',')>0 OR vSQLFields=',*,' THEN
	    ColListCount:=ColListCount+1;
		ColList(ColListCount):=cs;
	  END IF;
	END LOOP;

    -- ���������� ������ ����� � ���� ������
	vSQLFields:='';
	vSQLFieldsD:='';
	zpt:='';
	FOR i IN 1..ColListCount LOOP
	  vSQLFields:=vSQLFields||zpt||ColList(i).COLUMN_NAME;
	  vSQLFieldsD:=vSQLFieldsD||zpt||'D.'||ColList(i).COLUMN_NAME;
	  zpt:=',';
	END LOOP;

    -- ������ ������ �� ������� ������
    vSQLText:='SELECT ';
    vSQLText:=vSQLText||'/*+ RULE */';
    vSQLText:=vSQLText || ' A.REPL_RN,A.REPL_TABLERN,A.REPL_OPERATION,A.REPL_MODIFDATE, D.' || lcur.RNNAME ||' as REPL_RN_ORIG, '||vSQLFieldsD;
    vSQLText:=vSQLText || ' FROM ' || lcur.REPL_TABLE || ' A, ';
	
	IF lcur.REPL_TABLENAME = 'DOCINPT' THEN
	  vSQLText:=vSQLText || ' (SELECT A.* FROM SNP_REPL.V_ARH_DOCUMENTS B, PARUS.DOCINPT A WHERE A.COMPANY=2 AND A.RN>=500000000 AND A.DOCUMENT=B.RN) ';
	ELSIF lcur.REPL_TABLENAME = 'DOCOUTPT' THEN
	  vSQLText:=vSQLText || ' (SELECT A.* FROM SNP_REPL.V_ARH_DOCUMENTS B, PARUS.DOCOUTPT A WHERE A.COMPANY=2 AND A.RN>=500000000 AND A.DOCUMENT=B.RN) ';
	ELSIF lcur.REPL_TABLENAME = 'DOCLINKS' THEN 
	  vSQLText:=vSQLText || ' (SELECT aa.* FROM PARUS.DOCLINKS aa '||
            'WHERE IN_DOC IN (SELECT A.RN FROM SNP_REPL.V_ARH_DOCUMENTS B, PARUS.DOCINPT A WHERE A.COMPANY=2 AND A.RN>=500000000 AND A.DOCUMENT=B.RN) '||
            '  AND OUT_DOC IN (SELECT A.RN FROM SNP_REPL.V_ARH_DOCUMENTS B, PARUS.DOCOUTPT A WHERE A.COMPANY=2 AND A.RN>=500000000 AND A.DOCUMENT=B.RN) '||
            '  AND aa.RN>=500000000)'; 
	ELSE		
  	  vSQLText:=vSQLText || lcur.USERNAME || '.' || lcur.TABLENAME;
	END IF;   
	
	vSQLText:=vSQLText|| ' D ' ||
        ' WHERE A.REPL_TABLERN=D.' || lcur.RNNAME || '(+)'||
		'   AND NOT EXISTS (SELECT NULL FROM ' || gREPL_NAME|| '.REPL_STATUS B ' ||
        '                    WHERE B.SITE_SOURCE_RN=' || TO_CHAR(pSITE_SOURCE_RN) ||
        '                      AND B.SITE_DEST_RN=' || TO_CHAR(pSITE_DEST_RN) ||
        '                      AND B.SCHEMA_RN=' || TO_CHAR(pSCHEMA_RN) ||
        '                      AND B.SCHEMAROW_RN=' || TO_CHAR(lcur.SCHEMAROW_RN) ||
        '                      AND B.REPL_RN=A.REPL_RN) ' ||
		'   AND A.REPL_USERNAME='''||lcur.REPL_USERNAME||'''' ||
		'   AND A.REPL_TABLENAME='''||lcur.REPL_TABLENAME||'''' ||
	    '   AND (A.REPL_AUTHID='''||gREPL_NAME||'_MANUAL'' OR A.REPL_AUTHID NOT LIKE '''||gREPL_NAME||'%'')' ||-- ��������� �����������, ��������� ������������
        '   AND (D.' || lcur.RNNAME || ' IS NOT NULL OR A.REPL_OPERATION=''D'') ';
	-- ����� ����� ����������
	CASE
	  WHEN lcur.REPL_MODE=0 THEN
	    vSQLText:=vSQLText||'   AND A.REPL_OPERATION IN (''I'',''U'')';  -- ������ IU
	  WHEN lcur.REPL_MODE=3 THEN
	    vSQLText:=vSQLText||'   AND A.REPL_OPERATION = ''D'''; -- ������ D
  	  ELSE
	    vSQLText:=vSQLText||'   AND A.REPL_OPERATION IN (''I'',''U'',''D'')'; -- ������ IUD
	END CASE;
	IF lcur.SQL_WHERE||' '<>' ' THEN
	  vSQLText:=vSQLText||' AND '|| lcur.SQL_Where;
	END IF;
	vSQLText:=vSQLText||' ORDER BY A.REPL_RN ';

    -- ������������� ����� ������
    SAVEPOINT repl_pars;

	BEGIN
  	  -- ������� �������
      DBMS_SQL.PARSE(cur,vSQLText,DBMS_SQL.NATIVE);

	  -- ���������� ����
	  -- ���������
      DBMS_SQL.DEFINE_COLUMN (cur, 1, vReplRN);
      DBMS_SQL.DEFINE_COLUMN (cur, 2, vTableRN);
      DBMS_SQL.DEFINE_COLUMN (cur, 3, vOperation, 1);
      DBMS_SQL.DEFINE_COLUMN (cur, 4, vModifdate);
      DBMS_SQL.DEFINE_COLUMN (cur, 5, vOrigRN);

	  -- ������
	  FOR i IN 1..ColListCount LOOP
	    IF ColList(i).DATA_TYPE='NUMBER' THEN
          DBMS_SQL.DEFINE_COLUMN (cur, i+5, f_number);
	    END IF;
	    IF ColList(i).DATA_TYPE='VARCHAR2' THEN
          DBMS_SQL.DEFINE_COLUMN (cur, i+5, f_varchar2,ColList(i).DATA_LENGTH);
	    END IF;
	    IF ColList(i).DATA_TYPE='DATE' THEN
          DBMS_SQL.DEFINE_COLUMN (cur, i+5, f_date);
	    END IF;
	  END LOOP;

	  -- ������������ ������� ������������� ������� �������
      fdbk := DBMS_SQL.EXECUTE (cur);
      LOOP
        EXIT WHEN DBMS_SQL.FETCH_ROWS (cur) = 0;
        EXIT WHEN vResult<=fr_REPL_ERROR;
	    -- ������ ��������� ����
        DBMS_SQL.COLUMN_VALUE (cur, 1, vReplRN);
        DBMS_SQL.COLUMN_VALUE (cur, 2, vTableRN);
        DBMS_SQL.COLUMN_VALUE (cur, 3, vOperation);
        DBMS_SQL.COLUMN_VALUE (cur, 4, vModifdate);
        DBMS_SQL.COLUMN_VALUE (cur, 5, vOrigRN);

	    vSQLText:='';
	    vStatus:=fr_REPL_OK;
	    -- ������ ���� � ������� � ��������� ��������
	    IF vOperation='D' THEN
	      -- ��������
		  vSQLText:='WHERE '||lcur.RNNAME||'='||TO_CHAR(vTableRN);
 	      IF lcur.SQL_WHERE||' '<>' ' THEN
	        vSQLText:=vSQLText||' AND '|| lcur.SQL_Where;
	      END IF;
		  vSQLTextINS:='';
	    ELSE
	      IF vOrigRN IS NOT NULL THEN
		    vOperation:='U';
  	        -- ���������� ��� ����������
	  	    -- 1. ������ �� ����������
		    vSqlText:='SET ';
		    -- 2. ������ �� ����������
		    vSqlTextINS:='('||vSQLFields||') VALUES (';
		    zpt:=' ';
		    -- ���������� ����
  	        FOR i IN 1..ColListCount LOOP
	          IF ColList(i).DATA_TYPE='NUMBER' THEN
		        DBMS_SQL.COLUMN_VALUE (cur, i+5, f_number);
		  	    IF f_number IS NULL THEN
			      s:='NULL';
			    ELSE
			      s:=TO_CHAR(f_number);
			    END IF;
                vSQLText:=vSQLText||zpt||ColList(i).COLUMN_NAME||'='||s;
                vSQLTextINS:=vSQLTextINS||zpt||s;
			    zpt:=',';
		      END IF;
  	          IF ColList(i).DATA_TYPE='VARCHAR2' THEN
		        DBMS_SQL.COLUMN_VALUE (cur, i+5, f_varchar2);
			    IF f_varchar2 IS NULL THEN
			      s:='NULL';
			    ELSE
			      s:=REPLACE(f_varchar2,'''','''''');
			      s:=''''||s||'''';
			    END IF;
                vSQLText:=vSQLText||zpt||ColList(i).COLUMN_NAME||'='||s;
                vSQLTextINS:=vSQLTextINS||zpt||s;
			    zpt:=',';
  	          END IF;
 	          IF ColList(i).DATA_TYPE='DATE' THEN
		        DBMS_SQL.COLUMN_VALUE (cur, i+5, f_date);
			    IF f_date IS NULL THEN
			      s:='NULL';
			    ELSE
			      s:='TO_DATE('''||TO_CHAR(f_date,'DD.MM.YYYY HH24:MI:SS')||''',''DD.MM.YYYY HH24:MI:SS'')';
			    END IF;
                vSQLText:=vSQLText||zpt||ColList(i).COLUMN_NAME||'='||s;
                vSQLTextINS:=vSQLTextINS||zpt||s;
			    zpt:=',';
	          END IF;
	        END LOOP;
		    -- ��������� ������������ ��������
            vSQLText:=vSQLText||' WHERE '||lcur.RNNAME||'='||TO_CHAR(vTableRN);
		    -- ��������� � UPDATE ���.�������
 	        IF lcur.SQL_WHERE||' '<>' ' THEN
	          vSQLText:=vSQLText||' AND '|| lcur.SQL_Where;
	        END IF;
            vSQLTextINS:=vSQLTextINS||')';
		  ELSE
		    -- U ��� I, � ������ ���
		    vStatus:=fr_REPL_ROW_NOTFOUND;
		  END IF;
  	    END IF;

	    -- ������������� ����� ������
        SAVEPOINT repl_row;

	    -- ��������� ����� ��������� ��������
	    IF vStatus=fr_REPL_OK THEN
	      -- �������� ������
		  vUpdate_RN:=NULL;
		  vUpdate_RN:=AddCallOut(pSessionId,vSQLText,vUpdate_RN,
		                       pSITE_SOURCE_RN,pSITE_DEST_RN,pSCHEMA_RN,lcur.SCHEMAROW_RN,
							   vTableRN,
			                   vReplRN,vOperation,vModifdate);
	      IF vUpdate_RN<0 THEN
		    vStatus:=vUpdate_RN;
		    vUpdate_RN:=NULL;
		  END IF;
	    END IF;

	    IF vStatus=fr_REPL_OK AND vSQLTextINS||' '<>' ' THEN
	      -- ������ �� ����������
		  vRN:=AddCallOut(pSessionId,vSQLTextINS,vUpdate_RN,
		                       pSITE_SOURCE_RN,pSITE_DEST_RN,pSCHEMA_RN,lcur.SCHEMAROW_RN,
							   vTableRN,
			                   vReplRN,'I',vModifdate);
	    END IF;

	    IF vStatus > fr_REPL_ERROR THEN
	      -- ������ ���� ��������������� ������
	      -- ��������� ������ � ������� ��������
		  UPDATE REPL_STATUS SET
		    STATUS=vStatus,TABLERN=vTableRN
		  WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN
		    AND SITE_DEST_RN=pSITE_DEST_RN
			AND SCHEMA_RN=pSCHEMA_RN
			AND SCHEMAROW_RN=lcur.SCHEMAROW_RN
			AND REPL_RN=vReplRN;
		  IF SQL%NOTFOUND THEN
  	        vRN:=Get_Seq_Local();
  		    INSERT INTO REPL_STATUS (RN,SITE_SOURCE_RN,SITE_DEST_RN,SCHEMA_RN,SCHEMAROW_RN,REPL_RN,STATUS,TABLERN)
		      VALUES(vRN,pSITE_SOURCE_RN,pSITE_DEST_RN,pSCHEMA_RN,lcur.SCHEMAROW_RN,vReplRN,vStatus,vTableRN);
		  END IF;
	    ELSE
	      -- ������ ���� ��������������� �������� - ����� ������ ����������
          ROLLBACK TO repl_row;
		  vResult:=fr_REPL_ERROR;
	    END IF;
		-- ����� ��������� ������������ ������� ���������
		COMMIT;
      END LOOP;
    EXCEPTION
	  WHEN OTHERS THEN
		ROLLBACK TO repl_pars;
	    vResult:=fr_REPL_ERROR;
		AddLog(pSessionId,gRepl_init.SITE_RN,NULL,SYSDATE,vResult,'������ ��� ������������ ��������� �������� (REPL_SCHEMA_ROW.RN='||TO_CHAR(lcur.SCHEMAROW_RN)||'): '||SQLERRM,'CALL_OUT',1);
	END;
  END LOOP;
  DBMS_SQL.CLOSE_CURSOR (cur);

  RETURN vResult;
END;


/* ���������� ������ ������ � REPL_CALL_OUT */
PROCEDURE SetCallOutStatus(pSessionID NUMBER,pSITE_SOURCE_RN NUMBER,pSITE_DEST_RN NUMBER,pRN NUMBER,pSTATUS NUMBER) AS
BEGIN
  UPDATE /*+ RULE */ REPL_CALL_OUT SET STATUS=pSTATUS
   WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN
     AND SITE_DEST_RN=pSITE_DEST_RN
	 AND RN=pRN;
END;


/* ������ ��������� �������� � ���� pSITE_SOURCE_RN �� ���� pSITE_DEST_RN �� ������� ������������
   (� ����������� ������������ �� REPL_CALL_OUT � REPL_CALL) */
FUNCTION Analyze_Call_Out(pSessionID NUMBER,pSITE_SOURCE_RN NUMBER,pSITE_DEST_RN NUMBER) RETURN NUMBER AS
  vLastUserName VARCHAR2(30);
  vLastTableName VARCHAR2(50);
  vLastTableRn NUMBER;
  vLastOperation VARCHAR2(1);
BEGIN

  -- ��� ���� ������
  -- ���������� ��������� UPDATE ��� DELETE � REPL_CALL_OUT
  -- � �������� ������� (����� ���������� ������ ��������� ���������)
  vLastUserName:='';
  vLastTableName:='';
  vLastTableRn:=0;
  vLastOperation:='';
  FOR lcur IN (
               SELECT /*+ RULE */ A.RN, A.TABLERN, A.OPERATION, D.USERNAME, D.TABLENAME
			    FROM REPL_CALL_OUT A, REPL_SCHEMA_ROW C, REPL_TABLE D
			   WHERE A.STATUS IN (fr_CALL_NOTSEND,fr_CALL_RESEND,fr_CALL_WAIT,fr_CALL_SEND) -- �� ������������ � ������������
				 AND A.OPERATION IN ('U','D') -- ������ UPDATE ��� DELETE
				 AND A.SCHEMAROW_RN=C.RN
				 AND C.TABLE_SOURCE_RN=D.RN
				 AND A.SITE_SOURCE_RN=pSITE_SOURCE_RN
				 AND A.SITE_DEST_RN=pSITE_DEST_RN
				 AND USER=(CASE
				             WHEN C.REPL_USER||' '=' ' THEN gREPL_MAIN
							 ELSE C.REPL_USER
						   END)
			   ORDER BY D.USERNAME, D.TABLENAME, A.TABLERN, A.MODIFDATE DESC, A.REPL_RN DESC
			  )
  LOOP
    IF lcur.USERNAME=vLastUserName AND
	   lcur.TABLENAME=vLastTableName AND
	   lcur.TABLERN=vLastTableRn THEN
	   -- �� �� ������
	   IF vLastOperation='D' AND lcur.OPERATION='D'  THEN
		 -- ���� ���������� �������� ���� ��������,
         -- � ������� - ���� ��������
	     SetCallOutStatus(pSessionId,pSITE_SOURCE_RN,pSITE_DEST_RN,lcur.RN,fr_CALL_SKIP);
	   ELSE
	     IF vLastOperation = 'U' AND lcur.OPERATION='U' THEN
		   -- ���� ���������� �������� ���� ����������,
           -- � ������� - ���� ����������
	       SetCallOutStatus(pSessionId,pSITE_SOURCE_RN,pSITE_DEST_RN,lcur.RN,fr_CALL_SKIP);
		 ELSE
		   -- ���������� � ������� �������� - ������
	       vLastOperation:=lcur.OPERATION;
		 END IF;
	   END IF;
	ELSE
	   -- ������ ����������
       vLastUserName:=lcur.USERNAME;
       vLastTableName:=lcur.TABLENAME;
       vLastTableRn:=lcur.TABLERN;
       vLastOperation:=lcur.OPERATION;
    END IF;
  END LOOP;

  -- ������ ��� DOCLINKS
  -- ���������� ��������� UPDATE ��� DELETE � REPL_CALL_OUT
  -- � DELETE � ������ ������ (����� ��������� INSERT/UPDATE ����� DELETE)
  vLastUserName:='';
  vLastTableName:='';
  vLastTableRn:=0;
  vLastOperation:='';
  FOR lcur IN (
               SELECT /*+ RULE */ A.RN, A.TABLERN, A.OPERATION,D.USERNAME, D.TABLENAME
			    FROM REPL_CALL_OUT A, REPL_SCHEMA_ROW C, REPL_TABLE D
			   WHERE A.STATUS IN (fr_CALL_NOTSEND,fr_CALL_RESEND,fr_CALL_WAIT,fr_CALL_SEND) -- �� ������������ � ������������
				 AND A.OPERATION IN ('U','D') -- ������ UPDATE ��� DELETE
				 AND A.SCHEMAROW_RN=C.RN
				 AND C.TABLE_SOURCE_RN=D.RN
				 AND A.SITE_SOURCE_RN=pSITE_SOURCE_RN
				 AND A.SITE_DEST_RN=pSITE_DEST_RN
				 AND D.REPL_USERNAME='PARUS'
				 AND D.REPL_TABLENAME='DOCLINKS'
				 AND USER=(CASE
				             WHEN C.REPL_USER||' '=' ' THEN gREPL_MAIN
							 ELSE C.REPL_USER
						   END)
			   ORDER BY D.USERNAME, D.TABLENAME, A.TABLERN, DECODE(A.OPERATION,'D',0,1)
			  )
  LOOP
    IF lcur.USERNAME=vLastUserName AND
	   lcur.TABLENAME=vLastTableName AND
	   lcur.TABLERN=vLastTableRn THEN
	   -- �� �� ������
	   IF vLastOperation='D' THEN
		 -- ���� ���������� �������� ���� ��������,
         -- �� ��� ��������� - �������
	     SetCallOutStatus(pSessionId,pSITE_SOURCE_RN,pSITE_DEST_RN,lcur.RN,fr_CALL_SKIP);
	   ELSE
	     IF vLastOperation = 'U' AND lcur.OPERATION='U' THEN
		   -- ���� ���������� �������� ���� ����������,
           -- � ������� - ���� ����������
	       SetCallOutStatus(pSessionId,pSITE_SOURCE_RN,pSITE_DEST_RN,lcur.RN,fr_CALL_SKIP);
		 ELSE
		   -- ���������� � ������� �������� - ������
	       vLastOperation:=lcur.OPERATION;
		 END IF;
	   END IF;
	ELSE
	   -- ������ ����������
       vLastUserName:=lcur.USERNAME;
       vLastTableName:=lcur.TABLENAME;
       vLastTableRn:=lcur.TABLERN;
       vLastOperation:=lcur.OPERATION;
    END IF;
  END LOOP;

  -- ���������� ��� ���� ���������� ���������� ��������� ��������
  -- (������ ������� �������� - ����� ������ ��� ���������, � ��������� ����� ��� ����������)
  vLastUserName:='';
  vLastTableName:='';
  vLastTableRn:=0;
  vLastOperation:='';
  FOR lcur IN (
               SELECT /*+ RULE */ A.RN, A.TABLERN, A.OPERATION, A.STATUS, D.USERNAME, D.TABLENAME
			    FROM REPL_CALL_OUT A, REPL_SCHEMA_ROW C, REPL_TABLE D
			   WHERE A.STATUS IN (fr_CALL_NOTSEND,fr_CALL_RESEND,fr_CALL_WAIT,fr_CALL_SEND) -- �� ������������ � ������������
				 AND A.OPERATION IN ('U','D') -- ������ UPDATE ��� DELETE
				 AND A.SCHEMAROW_RN=C.RN
				 AND C.TABLE_SOURCE_RN=D.RN
				 AND A.SITE_SOURCE_RN=pSITE_SOURCE_RN
				 AND A.SITE_DEST_RN=pSITE_DEST_RN
				 AND USER=(CASE
				             WHEN C.REPL_USER||' '=' ' THEN gREPL_MAIN
							 ELSE C.REPL_USER
						   END)
			   ORDER BY D.USERNAME, D.TABLENAME, A.TABLERN, A.MODIFDATE, A.REPL_RN
			  )
  LOOP
    IF lcur.USERNAME=vLastUserName AND
	   lcur.TABLENAME=vLastTableName AND
	   lcur.TABLERN=vLastTableRn THEN
       -- ��� ��������� ��������� � ����� �� TABLERN
       -- ��������� � ��������� ��������
       SetCallOutStatus(pSessionId,pSITE_SOURCE_RN,pSITE_DEST_RN,lcur.RN,fr_CALL_WAIT);
	ELSE
	   -- ������ ����������
       vLastUserName:=lcur.USERNAME;
       vLastTableName:=lcur.TABLENAME;
       vLastTableRn:=lcur.TABLERN;
       vLastOperation:=lcur.OPERATION;
	   IF lcur.STATUS=fr_CALL_WAIT THEN
         -- ���� �������� � ��������� ��������
         -- �� ��������� ��� � ��������� - � ��������
         SetCallOutStatus(pSessionId,pSITE_SOURCE_RN,pSITE_DEST_RN,lcur.RN,fr_CALL_NOTSEND);
	   END IF;
    END IF;
  END LOOP;

  -- �������� � ������������ �������
  UPDATE /*+ RULE */ REPL_CALL_OUT A SET STATUS=
    (SELECT MAX(B.STATUS)
	   FROM REPL_CALL_OUT B
	  WHERE B.RN=A.UPDATE_RN
        AND B.SITE_SOURCE_RN=pSITE_SOURCE_RN
        AND B.SITE_DEST_RN=pSITE_DEST_RN
		AND B.OPERATION='U')
   WHERE EXISTS (SELECT NULL
	               FROM REPL_CALL_OUT B, REPL_SCHEMA_ROW C
				  WHERE B.RN=A.UPDATE_RN
                    AND B.SITE_SOURCE_RN=pSITE_SOURCE_RN
	                AND B.SITE_DEST_RN=pSITE_DEST_RN
    	            AND B.OPERATION='U'
					AND B.SCHEMAROW_RN=C.RN
				    AND USER=(CASE
				               WHEN C.REPL_USER||' '=' ' THEN gREPL_MAIN
						  	   ELSE C.REPL_USER
						      END)
					)
     AND A.STATUS IN (fr_CALL_NOTSEND,fr_CALL_RESEND,fr_CALL_WAIT,fr_CALL_SEND) -- �� ������������ � ������������
     AND A.SITE_SOURCE_RN=pSITE_SOURCE_RN
	 AND A.SITE_DEST_RN=pSITE_DEST_RN
	 AND A.OPERATION='I';

  -- �������� �������������� ������ �� REPL_CALL_OUT � REPL_CALL,
--  IF USER=gREPL_MAIN THEN
    -- ������ �������� ������������
    INSERT INTO REPL_CALL
    SELECT /*+ RULE */ A.* FROM REPL_CALL_OUT A, REPL_SCHEMA_ROW C
     WHERE A.STATUS IN (fr_CALL_NOTSEND,fr_CALL_RESEND) --
       AND A.COUNTER<=3 -- �������� ������� 3
       AND A.SITE_SOURCE_RN=pSITE_SOURCE_RN
  	   AND A.SITE_DEST_RN=pSITE_DEST_RN
	   AND A.SCHEMAROW_RN=C.RN
       AND USER=(CASE -- ������ ������������ - ������ ����
	               WHEN C.REPL_USER||' '=' ' THEN gREPL_MAIN
			  	   ELSE C.REPL_USER
	  	         END)
	   AND NOT EXISTS (  -- ������� ��� ��� ���
	      SELECT NULL FROM REPL_CALL B
		   WHERE B.SITE_SOURCE_RN=pSITE_SOURCE_RN
	         AND B.SITE_DEST_RN=pSITE_DEST_RN
		     AND B.RN=A.RN);
--  END IF;

  -- ������� ����������� ������
  FOR lcur IN (SELECT /*+ RULE */ A.RN FROM REPL_CALL_OUT A, REPL_SCHEMA_ROW C
               WHERE A.STATUS IN (fr_CALL_SKIP) -- ���������
                 AND A.SITE_SOURCE_RN=pSITE_SOURCE_RN
            	 AND A.SITE_DEST_RN=pSITE_DEST_RN
				 AND A.SCHEMAROW_RN=C.RN
				 AND USER=(CASE
				             WHEN C.REPL_USER||' '=' ' THEN gREPL_MAIN
							 ELSE C.REPL_USER
						   END)
				 )
  LOOP
--    AddLog(pSessionId,gRepl_init.SITE_RN,lcur.RN,SYSDATE,fr_CALL_SKIP,'�������� �������� ��� ������� � ����� ������','CALL_OUT',0);
    DeleteCallOut(pSessionId,lcur.RN,pSITE_SOURCE_RN,pSITE_DEST_RN,fr_CALL_SKIP,NULL);
  END LOOP;

  RETURN fr_REPL_OK;
END;

/* �������� ����� DBLink � ���� pSITE_SOURCE_RN �� ���� pSITE_DEST_RN ��������� ������� � �������� */
FUNCTION SendDBLink(pSessionID NUMBER,pTYPE VARCHAR2, pSITE_SOURCE_RN NUMBER,pSITE_DEST_RN NUMBER,pREPL_SCHEMANAME VARCHAR2,pDBLINK VARCHAR2) RETURN NUMBER AS
  SQLText VARCHAR2(4000);
  vStatus NUMBER;
BEGIN
  -- �������� REPL_ANSW - ������ �� �������� �������
  IF pTYPE='REPL_ANSW' THEN
    BEGIN
	  -- ���������� � ��������
	  vStatus:=START_EXPORT_ANSW(pSessionID,pSITE_SOURCE_RN,pSITE_DEST_RN);
      -- ��������
	  IF vStatus>fr_REPL_ERROR THEN
        SQLText:='INSERT INTO '||pREPL_SCHEMANAME||'.REPL_ANSW';
        IF pDBLINK||' '<>' ' THEN
          SQLText:=SQLText||'@'||pDBLINK;
        END IF;
  	    SQLText:=SQLText||' (RN,SITE_SOURCE_RN,SITE_DEST_RN,CALL_OUT_RN,SENDDATE,STATUS,NOTE,DATE_LOG) ';
        SQLText:=SQLText||' SELECT RN,SITE_SOURCE_RN,SITE_DEST_RN,CALL_OUT_RN,SYSDATE,STATUS,NOTE,DATE_LOG '||
	    ' FROM REPL_ANSW WHERE SITE_SOURCE_RN='||TO_CHAR(pSITE_SOURCE_RN)||' AND SITE_DEST_RN='||TO_CHAR(pSITE_DEST_RN);
	    EXECUTE IMMEDIATE SQLText;
	    -- ���������� ��������
	    vStatus:=FINISH_EXPORT_ANSW(pSessionID,pSITE_SOURCE_RN,pSITE_DEST_RN);
	  END IF;
	  IF vStatus<=fr_REPL_ERROR THEN
	    ROLLBACK;
	  END IF;
    EXCEPTION
      WHEN OTHERS THEN
	  BEGIN
        ROLLBACK;
		AddLog(pSessionId,gRepl_init.SITE_RN,NULL,SYSDATE,fr_REPL_DBLINK_NOTSEND,'������� �������� �� ���� '||TO_CHAR(pSITE_SOURCE_RN)||' (����� '||pREPL_SCHEMANAME||') ����� DBLINK='||pDBLINK||': '||SQLERRM,'SEND_DBLINK',1);
        RETURN fr_REPL_DBLINK_NOTSEND;
	  END;
    END;
  END IF;

  IF pTYPE='REPL_CALL' THEN
    -- �������� REPL_CALL - ��������� �������
    BEGIN
	  -- ���������� ��������� � REPL_CALL (������� - INSERT)
      FOR lcur IN (SELECT * FROM REPL_CALL
                    WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN
					  AND SITE_DEST_RN=pSITE_DEST_RN
 	 			    ORDER BY UPDATE_RN NULLS FIRST, RN)
	  LOOP
	    -- ���������� � ��������
  	    vStatus:=START_EXPORT_CALL(pSessionID,pSITE_SOURCE_RN,pSITE_DEST_RN,lcur.RN);
        -- ��������
		IF vStatus>fr_REPL_ERROR THEN
  	      SQLText:='INSERT INTO '||pREPL_SCHEMANAME||'.REPL_CALL';
          IF pDBLINK||' '<>' ' THEN
            SQLText:=SQLText||'@'||pDBLINK;
          END IF;
	      SQLText:=SQLText||' (RN,UPDATE_RN,SITE_SOURCE_RN,SITE_DEST_RN,SCHEMA_RN,SCHEMAROW_RN,TABLERN,REPL_RN,OPERATION,MODIFDATE,COUNTER,STATUS,SENDDATE,SQL1_TEXT,SQL2_TEXT) ';
          SQLText:=SQLText||' SELECT /*+ RULE */ RN,UPDATE_RN,SITE_SOURCE_RN,SITE_DEST_RN,SCHEMA_RN,SCHEMAROW_RN,TABLERN,REPL_RN,OPERATION,MODIFDATE,COUNTER,STATUS,SYSDATE,SQL1_TEXT,SQL2_TEXT '||
             ' FROM REPL_CALL WHERE RN='||TO_CHAR(lcur.RN)||' AND SITE_SOURCE_RN='||TO_CHAR(pSITE_SOURCE_RN)||' AND SITE_DEST_RN='||TO_CHAR(pSITE_DEST_RN);
	      EXECUTE IMMEDIATE SQLText;
		  -- ���������� ��������
	      vStatus:=FINISH_EXPORT_CALL(pSessionID,pSITE_SOURCE_RN,pSITE_DEST_RN,lcur.RN);
		END IF;
	    IF vStatus<=fr_REPL_ERROR THEN
	      ROLLBACK;
	    END IF;
	  END LOOP;
    EXCEPTION
      WHEN OTHERS THEN
	  BEGIN
        ROLLBACK;
		AddLog(pSessionId,gRepl_init.SITE_RN,NULL,SYSDATE,fr_REPL_DBLINK_NOTSEND,'������� �������� �� ���� '||TO_CHAR(pSITE_DEST_RN)||' (����� '||pREPL_SCHEMANAME||') ����� DBLINK='||pDBLINK||': '||SQLERRM,'SEND_DBLINK',1);
        RETURN fr_REPL_DBLINK_NOTSEND;
	  END;
    END;
  END IF;
  RETURN fr_REPL_OK;
END;

/* ������� ����������: ��������� �������� ������� */
FUNCTION ExecAnswIn(pSessionID NUMBER) RETURN NUMBER AS
vErr NUMBER;
vResult NUMBER;
BEGIN

  -- �������������� ��� ������������ ����� ��� ��������� � ����� REPL_ANSW
  -- ���� ��� ����� �������� ����� DBLink

  -- ���������� ������� ���� (1 ������)
  BEGIN
    SELECT * INTO gRepl_init FROM REPL_INIT WHERE IS_CURRENT=1 AND ROWNUM=1;
  EXCEPTION
    WHEN OTHERS THEN
 	  AddLog(pSessionId,0,NULL,SYSDATE,fr_REPL_INIT,'������ ��� ������ ���������� � ������� ����:'||SQLERRM,'ANSW_IN',1);
	  ROLLBACK;
	  RETURN fr_REPL_INIT;
  END;

  -- ��������� ����������� ������ (��� ���������� ���� ������������� ����������)
  vResult:=Check_Login(pSessionId,'ANSW_IN');
  IF vResult<>fr_REPL_OK THEN
    IF vResult=fr_REPL_ACTIVE THEN
      AddLog(pSessionId,gRepl_init.SITE_RN,NULL,SYSDATE,vResult,'������ '||USER||' ������������� ��� ��� ��������','ANSW_IN',1);
	ELSE
      IF vResult=fr_REPL_NO_REPL THEN
        AddLog(pSessionId,gRepl_init.SITE_RN,NULL,SYSDATE,vResult,'������ '||USER||' �� ����� ����� ������������ �������� ������','ANSW_IN',1);
      ELSE
        AddLog(pSessionId,gRepl_init.SITE_RN,NULL,SYSDATE,vResult,'������ '||USER||' �� ������ ��������� ��������� �������� �������: ������ ��� ������','ANSW_IN',1);
	  END IF;
	END IF;
	ROLLBACK;
    RETURN vResult;
  END IF;

  vResult:=fr_REPL_OK;

  -- �������� ������
  -- ���������� ����, � �������� � �������� ����
  -- ���� �������� ����� �� ������ (��������� ������ �� ��������� �������)
  FOR lcur IN (
               SELECT DISTINCT B.SORTBY, A.SITE_SOURCE_RN, A.SITE_DEST_RN -- ���� ����������
                 FROM REPL_SCHEMA A,REPL_SITE B
                WHERE A.SITE_DEST_RN=B.RN
				  AND B.IS_ACTIVE=1 -- ���� ��������
				  AND A.SITE_SOURCE_RN=gRepl_init.SITE_RN -- ������� ����: ��������
  			    ORDER BY B.SORTBY
				)
  LOOP
    SET TRANSACTION READ WRITE;
	BEGIN
  	  vErr:=Answ_In(pSessionId,lcur.SITE_SOURCE_RN, lcur.SITE_DEST_RN);
	  IF vErr<=fr_REPL_ERROR THEN
	    vResult:=vErr;
	  END IF;
	  COMMIT;
	EXCEPTION
	  WHEN OTHERS THEN
	    ROLLBACK;
 	    vResult:=fr_REPL_ERROR;
	    AddLog(pSessionId,gRepl_init.SITE_RN,NULL,SYSDATE,vResult,'������ ��� ��������� �������� �������:'||SQLERRM,'ANSW_IN',1);
	END;
  END LOOP;

  COMMIT;
  RETURN vResult;
END;

/* ������� ����������: ���������� � ���������� */
PROCEDURE START_REPL(pSessionID NUMBER) AS
BEGIN
  -- ��������� ����������� ������� ��� ������� ������
  parus.pkg_updatelist.drop_register(NULL,NULL);

  -- ���������� ������ �������� ������� (��� ���������)
  DELETE FROM SOJ_TMP;

  -- ������ �� ������� ��������� �������� (�� �������� ����������)
  INSERT INTO SOJ_TMP (SOJ_RN, OPERATION, SUPPLY_BEFORE)
  SELECT /*+ ORDERED INDEX(A REPL_CALL_PK) */ DISTINCT A.TABLERN,A.OPERATION,E.GOODSSUPPLY
    FROM REPL_CALL A, REPL_SCHEMA B, REPL_SCHEMA_ROW C, REPL_TABLE D, PARUS.STOREOPERJOURN E
   WHERE A.SITE_DEST_RN=gRepl_init.SITE_RN -- �������� �������
     AND A.SITE_SOURCE_RN=B.SITE_SOURCE_RN
     AND A.SITE_DEST_RN=B.SITE_DEST_RN
	 AND A.SCHEMA_RN=B.RN
	 AND A.SCHEMAROW_RN=C.RN
     AND C.TABLE_DEST_RN=D.RN
	 AND B.IS_ACTIVE=1 -- �������� �����
	 AND C.IS_ACTIVE=1 -- �������� ������ �����
	 AND D.REPL_USERNAME='PARUS'
	 AND D.REPL_TABLENAME='STOREOPERJOURN'
	 AND A.TABLERN=E.RN(+);

  -- ������ �� �������� ������� (�� �������� ����������)
  INSERT INTO SOJ_TMP (SOJ_RN, SUPPLY_BEFORE)
  SELECT /*+ ORDERED INDEX(A REPL_CALL_PK) */ 0, A.TABLERN
    FROM REPL_CALL A, REPL_SCHEMA B, REPL_SCHEMA_ROW C, REPL_TABLE D
   WHERE A.SITE_DEST_RN=gRepl_init.SITE_RN -- �������� �������
     AND A.SITE_SOURCE_RN=B.SITE_SOURCE_RN
     AND A.SITE_DEST_RN=B.SITE_DEST_RN
	 AND A.SCHEMA_RN=B.RN
	 AND A.SCHEMAROW_RN=C.RN
     AND C.TABLE_DEST_RN=D.RN
	 AND B.IS_ACTIVE=1 -- �������� �����
	 AND C.IS_ACTIVE=1 -- �������� ������ �����
	 AND D.REPL_USERNAME='PARUS'
	 AND D.REPL_TABLENAME='GOODSSUPPLY';

  -- ���������� ������ �������� ������� (��� ��������� �������� �� ������ ��������)
  DELETE FROM SPOJ_TMP;

  -- ������ �� ������� �������������� �� ������ �������� (�� �������� ����������)
  INSERT INTO SPOJ_TMP (SPOJ_RN, OPERATION, SUPPLY_BEFORE)
  SELECT /*+ ORDERED INDEX(A REPL_CALL_PK) */ DISTINCT A.TABLERN,A.OPERATION,E.GOODSSUPPLY
    FROM REPL_CALL A, REPL_SCHEMA B, REPL_SCHEMA_ROW C, REPL_TABLE D, PARUS.STRPLOPRJRNL E
   WHERE A.SITE_DEST_RN=gRepl_init.SITE_RN -- �������� �������
     AND A.SITE_SOURCE_RN=B.SITE_SOURCE_RN
     AND A.SITE_DEST_RN=B.SITE_DEST_RN
	 AND A.SCHEMA_RN=B.RN
	 AND A.SCHEMAROW_RN=C.RN
     AND C.TABLE_DEST_RN=D.RN
	 AND B.IS_ACTIVE=1 -- �������� �����
	 AND C.IS_ACTIVE=1 -- �������� ������ �����
	 AND D.REPL_USERNAME='PARUS'
	 AND D.REPL_TABLENAME='STRPLOPRJRNL'
	 AND A.TABLERN=E.RN(+);

  -- ������ �� �������� ������� (�� �������� ����������)
  INSERT INTO SPOJ_TMP (SPOJ_RN, SUPPLY_BEFORE)
  SELECT /*+ ORDERED INDEX(A REPL_CALL_PK) */ 0, A.TABLERN
    FROM REPL_CALL A, REPL_SCHEMA B, REPL_SCHEMA_ROW C, REPL_TABLE D
   WHERE A.SITE_DEST_RN=gRepl_init.SITE_RN -- �������� �������
     AND A.SITE_SOURCE_RN=B.SITE_SOURCE_RN
     AND A.SITE_DEST_RN=B.SITE_DEST_RN
	 AND A.SCHEMA_RN=B.RN
	 AND A.SCHEMAROW_RN=C.RN
     AND C.TABLE_DEST_RN=D.RN
	 AND B.IS_ACTIVE=1 -- �������� �����
	 AND C.IS_ACTIVE=1 -- �������� ������ �����
	 AND D.REPL_USERNAME='PARUS'
	 AND D.REPL_TABLENAME='GOODSSUPPLY';

  -- ���������� ������ ������� ������ (��� ���������)
  DELETE FROM LN_TMP;

  -- ������ �� ������� �������� (�� �������� ����������)
  INSERT INTO LN_TMP (LN_RN, OPERATION, FACEACC_BEFORE)
  SELECT /*+ ORDERED INDEX(A REPL_CALL_PK) */ A.TABLERN,A.OPERATION,E.FACEACC
    FROM REPL_CALL A, REPL_SCHEMA B, REPL_SCHEMA_ROW C, REPL_TABLE D, PARUS.LIABILITYNOTES E
   WHERE A.SITE_DEST_RN=gRepl_init.SITE_RN -- �������� �������
     AND A.SITE_SOURCE_RN=B.SITE_SOURCE_RN
     AND A.SITE_DEST_RN=B.SITE_DEST_RN
	 AND A.SCHEMA_RN=B.RN
	 AND A.SCHEMAROW_RN=C.RN
     AND C.TABLE_DEST_RN=D.RN
	 AND B.IS_ACTIVE=1 -- �������� �����
	 AND C.IS_ACTIVE=1 -- �������� ������ �����
	 AND D.REPL_USERNAME='PARUS'
	 AND D.REPL_TABLENAME='LIABILITYNOTES'
	 AND A.TABLERN=E.RN(+);

  -- ������ �� ������� �������� (�� �������� ����������)
  INSERT INTO LN_TMP (LN_RN, OPERATION, FACEACC_BEFORE)
  SELECT /*+ ORDERED INDEX(A REPL_CALL_PK) */ A.TABLERN,A.OPERATION,E.FACEACC
    FROM REPL_CALL A, REPL_SCHEMA B, REPL_SCHEMA_ROW C, REPL_TABLE D, PARUS.PAYNOTES E
   WHERE A.SITE_DEST_RN=gRepl_init.SITE_RN -- �������� �������
     AND A.SITE_SOURCE_RN=B.SITE_SOURCE_RN
     AND A.SITE_DEST_RN=B.SITE_DEST_RN
	 AND A.SCHEMA_RN=B.RN
	 AND A.SCHEMAROW_RN=C.RN
     AND C.TABLE_DEST_RN=D.RN
	 AND B.IS_ACTIVE=1 -- �������� �����
	 AND C.IS_ACTIVE=1 -- �������� ������ �����
	 AND D.REPL_USERNAME='PARUS'
	 AND D.REPL_TABLENAME='PAYNOTES'
	 AND A.TABLERN=E.RN(+);

  -- ������ �� ������� ������ (�� �������� ����������)
  INSERT INTO LN_TMP (LN_RN, FACEACC_BEFORE)
  SELECT /*+ ORDERED INDEX(A REPL_CALL_PK) */ 0,A.TABLERN
    FROM REPL_CALL A, REPL_SCHEMA B, REPL_SCHEMA_ROW C, REPL_TABLE D
   WHERE A.SITE_DEST_RN=gRepl_init.SITE_RN -- �������� �������
     AND A.SITE_SOURCE_RN=B.SITE_SOURCE_RN
     AND A.SITE_DEST_RN=B.SITE_DEST_RN
	 AND A.SCHEMA_RN=B.RN
	 AND A.SCHEMAROW_RN=C.RN
     AND C.TABLE_DEST_RN=D.RN
	 AND B.IS_ACTIVE=1 -- �������� �����
	 AND C.IS_ACTIVE=1 -- �������� ������ �����
	 AND D.REPL_USERNAME='PARUS'
	 AND D.REPL_TABLENAME='FACEACC';

  COMMIT;
END;

/* ������� ����������: ���������� ���������� */
PROCEDURE FINISH_REPL(pSessionID NUMBER) AS
BEGIN
  -- ���������� ������ �������� ������� (��� ���������)
  -- ��������� ������� �������� STOREOPERJOURN.GOODSSUPPLY
  UPDATE SOJ_TMP SET (SUPPLY_AFTER)=
  (
    SELECT DISTINCT E.GOODSSUPPLY
      FROM PARUS.STOREOPERJOURN E
     WHERE E.RN=SOJ_TMP.SOJ_RN
  )
  WHERE EXISTS
  (
    SELECT NULL
      FROM PARUS.STOREOPERJOURN E
     WHERE E.RN=SOJ_TMP.SOJ_RN
  );

  COMMIT;

  -- �������� �������� �������� �������
  FOR lcur IN (
               SELECT SUPPLY_BEFORE AS GOODSSUPPLY_RN
                 FROM SOJ_TMP
				UNION
               SELECT SUPPLY_AFTER
                 FROM SOJ_TMP
				)
  LOOP
    IF lcur.GOODSSUPPLY_RN IS NOT NULL THEN
      snp_repl.Recalc_Supply(lcur.GOODSSUPPLY_RN);
	END IF;
  END LOOP;

  -- ���������� ������ �������� ������� (��� ��������� �������� �� ������ ��������)
  -- ��������� ������� �������� STRPLOPRJRNL.GOODSSUPPLY
  UPDATE SPOJ_TMP SET (SUPPLY_AFTER)=
  (
    SELECT DISTINCT E.GOODSSUPPLY
      FROM PARUS.STRPLOPRJRNL E
     WHERE E.RN=SPOJ_TMP.SPOJ_RN
  )
  WHERE EXISTS
  (
    SELECT NULL
      FROM PARUS.STRPLOPRJRNL E
     WHERE E.RN=SPOJ_TMP.SPOJ_RN
  );

  COMMIT;

  -- �������� �������� �������� ������� �� ������ ��������
  FOR lcur IN (
               SELECT SUPPLY_BEFORE AS GOODSSUPPLY_RN
                 FROM SPOJ_TMP
				UNION
               SELECT SUPPLY_AFTER
                 FROM SPOJ_TMP
				)
  LOOP
    IF lcur.GOODSSUPPLY_RN IS NOT NULL THEN
      snp_repl.Recalc_Supcellvz(lcur.GOODSSUPPLY_RN);
	END IF;
  END LOOP;

  COMMIT;

  -- ���������� ������ ������� ������ (��� ���������)
  -- ��������� ������� �������� LIABILITYNOTES.FACEACC
  UPDATE LN_TMP SET (FACEACC_AFTER)=
  (
    SELECT DISTINCT E.FACEACC
      FROM PARUS.LIABILITYNOTES E
     WHERE E.RN=LN_TMP.LN_RN
  )
  WHERE EXISTS
  (
    SELECT NULL
      FROM PARUS.LIABILITYNOTES E
     WHERE E.RN=LN_TMP.LN_RN
  );

  -- ��������� ������� �������� PAYNOTES.FACEACC
  UPDATE LN_TMP SET (FACEACC_AFTER)=
  (
    SELECT DISTINCT E.FACEACC
      FROM PARUS.PAYNOTES E
     WHERE E.RN=LN_TMP.LN_RN
  )
  WHERE EXISTS
  (
    SELECT NULL
      FROM PARUS.PAYNOTES E
     WHERE E.RN=LN_TMP.LN_RN
  );

  COMMIT;

  -- �������� �������� ������� ������
  FOR lcur IN (
               SELECT FACEACC_BEFORE AS FACEACC_RN
                 FROM LN_TMP
				UNION
               SELECT FACEACC_AFTER
                 FROM LN_TMP
				)
  LOOP
    IF lcur.FACEACC_RN IS NOT NULL THEN
      PARUS.PR_CORR_FACEACC(lcur.FACEACC_RN);
	END IF;
  END LOOP;

  COMMIT;

  -- �������� ����������� ������� ��� ������� ������
  parus.pkg_updatelist.set_register(NULL,NULL);

END;

/* ������� ����������: ��������� �������� ������� */
FUNCTION ExecCallIn(pSessionID NUMBER) RETURN NUMBER AS
vErr NUMBER;
vResult NUMBER;
BEGIN

  -- �������������� ��� ������������ ����� ��� ��������� � ����� REPL_CALL
  -- ���� ���� ����� �������� ����� DBLink

  -- ���������� ������� ���� (1 ������)
  BEGIN
    SELECT * INTO gRepl_init FROM REPL_INIT WHERE IS_CURRENT=1 AND ROWNUM=1;
  EXCEPTION
    WHEN OTHERS THEN
 	  AddLog(pSessionId,0,NULL,SYSDATE,fr_REPL_INIT,'������ ��� ������ ���������� � ������� ����:'||SQLERRM,'CALL_IN',1);
	  ROLLBACK;
	  RETURN fr_REPL_INIT;
  END;

  -- ��������� ����������� ������ (��� ���������� ���� ������������� ����������)
  vResult:=Check_Login(pSessionId,'CALL_IN');
  IF vResult<>fr_REPL_OK THEN
    IF vResult=fr_REPL_ACTIVE THEN
      AddLog(pSessionId,gRepl_init.SITE_RN,NULL,SYSDATE,vResult,'������ '||USER||' ������������� ��� ��� ��������','CALL_IN',1);
	ELSE
      IF vResult=fr_REPL_NO_REPL THEN
        AddLog(pSessionId,gRepl_init.SITE_RN,NULL,SYSDATE,vResult,'������ '||USER||' �� ����� ����� ������������ �������� �������','CALL_IN',1);
      ELSE
        AddLog(pSessionId,gRepl_init.SITE_RN,NULL,SYSDATE,vResult,'������ '||USER||' �� ������ ��������� ��������� �������� ��������: ������ ��� ������','CALL_IN',1);
	  END IF;
	END IF;
	ROLLBACK;
    RETURN vResult;
  END IF;


  -- ���������� � ����������
  START_REPL(pSessionId);

  vResult:=fr_REPL_OK;

  -- �������� ������� / ��������� ������
  -- ���������� ����, � �������� � �������� ����
  -- ���� �������� ����� �� �����
  FOR lcur IN (
               SELECT A.RN AS SCHEMA_RN, A.SITE_SOURCE_RN, A.SITE_DEST_RN -- ���� ���������
                 FROM REPL_SCHEMA A,REPL_SITE B
                WHERE A.SITE_SOURCE_RN=B.RN
				  AND B.IS_ACTIVE=1 -- ���� ��������
				  AND A.SITE_DEST_RN=gRepl_init.SITE_RN -- ������� ����: ����������
				  AND A.IS_ACTIVE=1 -- ����� �������
  			    ORDER BY B.SORTBY,A.SORTBY
				)
  LOOP
    SET TRANSACTION READ WRITE;
    -- ��������� �������� ��������
    BEGIN
  	  vErr:=Call_In(pSessionId,lcur.SITE_SOURCE_RN, lcur.SITE_DEST_RN,lcur.SCHEMA_RN);
	  IF vErr<=fr_REPL_ERROR THEN
	    vResult:=vErr;
	  END IF;
	  COMMIT;
  	EXCEPTION
	  WHEN OTHERS THEN
	    ROLLBACK;
 	    vResult:=fr_REPL_ERROR;
 	    AddLog(pSessionId,gRepl_init.SITE_RN,NULL,SYSDATE,vResult,'������ ��� ��������� �������� �������� (REPL_SCHEMA.RN='||TO_CHAR(lcur.SCHEMA_RN)||'):'||SQLERRM,'CALL_IN',1);
	END;
  END LOOP;

  -- ���������� ����������
  FINISH_REPL(pSessionId);

  COMMIT;
  RETURN vResult;
END;

/* ������� ����������: ������������ ��������� �������� */
FUNCTION ExecCallOut(pSessionID NUMBER) RETURN NUMBER AS
vErr NUMBER;
vResult NUMBER;
BEGIN

  -- ���������� ������� ���� (1 ������)
  BEGIN
    SELECT * INTO gRepl_init FROM REPL_INIT WHERE IS_CURRENT=1 AND ROWNUM=1;
  EXCEPTION
    WHEN OTHERS THEN
 	  AddLog(pSessionId,0,NULL,SYSDATE,fr_REPL_INIT,'������ ��� ������ ���������� � ������� ����:'||SQLERRM,'CALL_OUT',1);
	  ROLLBACK;
	  RETURN fr_REPL_INIT;
  END;

  -- ��������� ����������� ������ (��� ���������� ���� ������������� ����������)
  vResult:=Check_Login(pSessionId,'CALL_OUT');
  IF vResult<>fr_REPL_OK THEN
    IF vResult=fr_REPL_ACTIVE THEN
      AddLog(pSessionId,gRepl_init.SITE_RN,NULL,SYSDATE,vResult,'������ '||USER||' ������������� ��� ��� ��������','CALL_OUT',1);
	ELSE
      IF vResult=fr_REPL_NO_REPL THEN
        AddLog(pSessionId,gRepl_init.SITE_RN,NULL,SYSDATE,vResult,'������ '||USER||' �� ����� ����� ����������� ��������� �������','CALL_OUT',1);
      ELSE
        AddLog(pSessionId,gRepl_init.SITE_RN,NULL,SYSDATE,vResult,'������ '||USER||' �� ������ ��������� ������������ ��������� ��������: ������ ��� ������','CALL_OUT',1);
	  END IF;
	END IF;
	ROLLBACK;
    RETURN vResult;
  END IF;

  vResult:=fr_REPL_OK;

  -- ��������� �������
  -- ���������� ����, � �������� � �������� ����
  -- ���� �������� ����� �� ������
  FOR lcur IN (
               SELECT DISTINCT B.SORTBY, A.SITE_SOURCE_RN, A.SITE_DEST_RN -- ���� ����������
                 FROM REPL_SCHEMA A,REPL_SITE B
                WHERE A.SITE_DEST_RN=B.RN
				  AND B.IS_ACTIVE=1 -- ���� ��������
				  AND A.SITE_SOURCE_RN=gRepl_init.SITE_RN -- ������� ����: ��������
				  AND A.IS_ACTIVE=1 -- ����� �������
  			    ORDER BY B.SORTBY
				)
  LOOP
    -- ������������ ��������� �������� �� ������ ���� - � ����� ����������
    SET TRANSACTION READ WRITE;
    -- ���������� �������� ����� ����������
    FOR lcur2 IN (
               SELECT DISTINCT A.SORTBY, A.RN AS SCHEMA_RN -- ����� ����������
                 FROM REPL_SCHEMA A
                WHERE A.SITE_DEST_RN=lcur.SITE_DEST_RN -- ���� ����������
				  AND A.SITE_SOURCE_RN=lcur.SITE_SOURCE_RN -- ������� ����: ��������
				  AND A.IS_ACTIVE=1 -- ����� �������
  			    ORDER BY A.SORTBY
				)
	LOOP
      SAVEPOINT repl_out; -- ������������� ����� ������
      BEGIN
  	    vErr:=Call_Out(pSessionId,lcur.SITE_SOURCE_RN, lcur.SITE_DEST_RN, lcur2.SCHEMA_RN);
	    IF vErr<=fr_REPL_ERROR THEN
	      vResult:=vErr;
	    END IF;
      EXCEPTION
	    WHEN OTHERS THEN
		  ROLLBACK TO repl_out; -- ��������� �� ������������� �����
 	      vResult:=fr_REPL_ERROR;
 		  AddLog(pSessionId,gRepl_init.SITE_RN,NULL,SYSDATE,vResult,'������ ��� ������������ ��������� �������� (REPL_SCHEMA.RN='||TO_CHAR(lcur2.SCHEMA_RN)||'):'||SQLERRM,'CALL_OUT',1);
      END;
	END LOOP;
	-- ��������� ����������
    COMMIT;

	-- ������ ��������� ��������
    SET TRANSACTION READ WRITE;
    BEGIN
	  vErr:=Analyze_Call_Out(pSessionId,lcur.SITE_SOURCE_RN, lcur.SITE_DEST_RN);
	  IF vErr<=fr_REPL_ERROR THEN
	    vResult:=vErr;
	  END IF;
	  COMMIT;
	EXCEPTION
	  WHEN OTHERS THEN
	    ROLLBACK;
 	    vResult:=fr_REPL_ERROR;
	    AddLog(pSessionId,gRepl_init.SITE_RN,NULL,SYSDATE,vResult,'������ ��� ������� ��������� ��������:'||SQLERRM,'CALL_OUT',1);
    END;
    COMMIT;
  END LOOP;

  COMMIT;
  RETURN vResult;
END;

/* ������� ����������: ��������� �������� �������������� �������� */
FUNCTION ExecReSendCallOut(pSessionID NUMBER)  RETURN NUMBER AS
vErr NUMBER;
vResult NUMBER;
BEGIN

  -- ���������� ������� ���� (1 ������)
  BEGIN
    SELECT * INTO gRepl_init FROM REPL_INIT WHERE IS_CURRENT=1 AND ROWNUM=1;
  EXCEPTION
    WHEN OTHERS THEN
 	  AddLog(pSessionId,0,NULL,SYSDATE,fr_REPL_INIT,'������ ��� ������ ���������� � ������� ����:'||SQLERRM,'RESEND_CALL_OUT',1);
	  ROLLBACK;
	  RETURN fr_REPL_INIT;
  END;

  -- ��������� ����������� ������ (��� ���������� ���� ������������� ����������)
  vResult:=Check_Login(pSessionId,'RESEND_CALL_OUT');
  IF vResult<>fr_REPL_OK THEN
    IF vResult=fr_REPL_ACTIVE THEN
      AddLog(pSessionId,gRepl_init.SITE_RN,NULL,SYSDATE,vResult,'������ '||USER||' ������������� ��� ��� ��������','RESEND_CALL_OUT',1);
	ELSE
      IF vResult=fr_REPL_NO_REPL THEN
        AddLog(pSessionId,gRepl_init.SITE_RN,NULL,SYSDATE,vResult,'������ '||USER||' �� ����� ����� �� ��������� �������� ��������','RESEND_CALL_OUT',1);
      ELSE
        AddLog(pSessionId,gRepl_init.SITE_RN,NULL,SYSDATE,vResult,'������ '||USER||' �� ������ ��������� ��������� �������� ��������: ������ ��� ������','RESEND_CALL_OUT',1);
	  END IF;
	END IF;
	ROLLBACK;
    RETURN vResult;
  END IF;

  vResult:=fr_REPL_OK;

  -- ��������� �������
  -- ���������� ����, � �������� � �������� ����
  -- ���� �������� ����� �� ������
  FOR lcur IN (
               SELECT DISTINCT B.SORTBY, A.SITE_SOURCE_RN, A.SITE_DEST_RN -- ���� ����������
                 FROM REPL_SCHEMA A,REPL_SITE B
                WHERE A.SITE_DEST_RN=B.RN
				  AND B.IS_ACTIVE=1 -- ���� ��������
				  AND A.SITE_SOURCE_RN=gRepl_init.SITE_RN -- ������� ����: ��������
				  AND A.IS_ACTIVE=1 -- ����� �������
  			    ORDER BY B.SORTBY
				)
  LOOP
	-- ������ ��������� ��������
    SET TRANSACTION READ WRITE;
    BEGIN
	  vErr:=Analyze_Call_Out(pSessionId,lcur.SITE_SOURCE_RN, lcur.SITE_DEST_RN);
	  IF vErr<=fr_REPL_ERROR THEN
	    vResult:=vErr;
	  END IF;
	  COMMIT;
	EXCEPTION
	  WHEN OTHERS THEN
	    ROLLBACK;
 	    vResult:=fr_REPL_ERROR;
	    AddLog(pSessionId,gRepl_init.SITE_RN,NULL,SYSDATE,vResult,'������ ��� ������� ��������� ��������:'||SQLERRM,'RESEND_CALL_OUT',1);
    END;
    COMMIT;
  END LOOP;

  COMMIT;
  RETURN vResult;
END;

/* ������� ����������: ��������� ������������ �������� � COUNTER>=4 */
FUNCTION ExecReFormBad(pSessionID NUMBER)  RETURN NUMBER AS
vErr NUMBER;
vResult NUMBER;
BEGIN

  -- ���������� ������� ���� (1 ������)
  BEGIN
    SELECT * INTO gRepl_init FROM REPL_INIT WHERE IS_CURRENT=1 AND ROWNUM=1;
  EXCEPTION
    WHEN OTHERS THEN
 	  AddLog(pSessionId,0,NULL,SYSDATE,fr_REPL_INIT,'������ ��� ������ ���������� � ������� ����:'||SQLERRM,'REFORM_BAD',1);
	  ROLLBACK;
	  RETURN fr_REPL_INIT;
  END;

  -- ��������� ����������� ������ (��� ���������� ���� ������������� ����������)
/*  vResult:=Check_Login(pSessionId,'REFORM_BAD');
  IF vResult<>fr_REPL_OK THEN
    IF vResult=fr_REPL_ACTIVE THEN
      AddLog(pSessionId,gRepl_init.SITE_RN,NULL,SYSDATE,vResult,'������ '||USER||' ������������� ��� ��� ��������','REFORM_BAD',1);
	ELSE
      IF vResult=fr_REPL_NO_REPL THEN
        AddLog(pSessionId,gRepl_init.SITE_RN,NULL,SYSDATE,vResult,'������ '||USER||' �� ����� ����� �� ��������� ���������� ��������� ��������','REFORM_BAD',1);
      ELSE
        AddLog(pSessionId,gRepl_init.SITE_RN,NULL,SYSDATE,vResult,'������ '||USER||' �� ������ ��������� ��������� ���������� ��������� ��������: ������ ��� ������','REFORM_BAD',1);
	  END IF;
	END IF;
	ROLLBACK;
    RETURN vResult;
  END IF;*/

  vResult:=fr_REPL_OK;
  
  -- ���������� �������
  FOR lcur IN (SELECT/*+ RULE */  a.*,c.TABLENAME 
                FROM snp_repl.REPL_CALL_OUT a, snp_repl.REPL_SCHEMA_ROW b , snp_repl.REPL_TABLE c 
                WHERE a.schemarow_rn=b.rn AND b.table_dest_rn=c.rn AND a.counter>=3) 
  LOOP
	-- ��������� ��� ��������
	CASE
	  WHEN lcur.operation='D' AND lcur.TABLENAME='DOCINPT' THEN
   	    -- ���� �������� �� DOCINPT, �� ����������� ������ ��� ���������� ������ � DOCINPT
        INSERT INTO PARUS.updatelist (TABLENAME, TABLERN, AUTHID, MODIFDATE, OPERATION, NOTE)
          SELECT /*+ RULE */ lcur.tablename,lcur.tableRN,'SNP_REPL_MANUAL',SYSDATE,lcur.operation,'?'
            FROM dual WHERE NOT EXISTS (SELECT null FROM DOCINPT WHERE RN=lcur.TABLERN);

	  WHEN lcur.operation='D' AND lcur.TABLENAME='DOCOUTPT' THEN
   	    -- ���� �������� �� DOCOUTPT, �� ����������� ������ ��� ���������� ������ � DOCOUTPT
        INSERT INTO PARUS.updatelist (TABLENAME, TABLERN, AUTHID, MODIFDATE, OPERATION, NOTE)
          SELECT /*+ RULE */ lcur.tablename,lcur.tableRN,'SNP_REPL_MANUAL',SYSDATE,lcur.operation,'?'
            FROM dual WHERE NOT EXISTS (SELECT null FROM DOCOUTPT WHERE RN=lcur.TABLERN);
			
	  WHEN lcur.operation='D' AND lcur.TABLENAME='DOCLINKS' THEN
   	    -- ���� �������� �� DOCLINKS, �� ����������� ������ ��� ���������� ������ � DOCLINKS
        INSERT INTO PARUS.updatelist (TABLENAME, TABLERN, AUTHID, MODIFDATE, OPERATION, NOTE)
          SELECT /*+ RULE */ lcur.tablename,lcur.tableRN,'SNP_REPL_MANUAL',SYSDATE,lcur.operation,'?'
            FROM dual WHERE NOT EXISTS (SELECT null FROM DOCLINKS WHERE RN=lcur.TABLERN);

	  WHEN lcur.operation<>'D' AND lcur.TABLENAME='DOCLINKS' THEN
   	    -- ���� ����������/���������� DOCLINKS
        INSERT INTO PARUS.updatelist (TABLENAME, TABLERN, AUTHID, MODIFDATE, OPERATION, NOTE)
          VALUES (lcur.tablename,lcur.tableRN,'SNP_REPL_MANUAL',SYSDATE,lcur.operation,'?');

        INSERT INTO PARUS.updatelist (TABLENAME, TABLERN, AUTHID, MODIFDATE, OPERATION, NOTE)
          SELECT /*+ RULE */ DISTINCT 'DOCINPT',e.IN_DOC,'SNP_REPL_MANUAL',SYSDATE,lcur.operation,'?'
            FROM parus.doclinks e WHERE e.rn=lcur.tablern;

        INSERT INTO PARUS.updatelist (TABLENAME, TABLERN, AUTHID, MODIFDATE, OPERATION, NOTE)
          SELECT /*+ RULE */ DISTINCT 'DOCOUTPT',e.OUT_DOC,'SNP_REPL_MANUAL',SYSDATE,lcur.operation,'?'
            FROM parus.doclinks e WHERE e.rn=lcur.tablern;
		  
      ELSE
	    -- ����� 
        INSERT INTO PARUS.updatelist (TABLENAME, TABLERN, AUTHID, MODIFDATE, OPERATION, NOTE)
          VALUES (lcur.tablename,lcur.tableRN,'SNP_REPL_MANUAL',SYSDATE,lcur.operation,'?');
    END CASE;

	-- �������
    DELETE /*+ RULE */ FROM snp_repl.REPL_CALL_OUT a WHERE a.SITE_SOURCE_RN=lcur.SITE_SOURCE_RN 
	 AND a.SITE_DEST_RN=lcur.SITE_DEST_RN AND a.RN=lcur.RN;
  END LOOP;
  
  COMMIT;
  RETURN vResult;
END;

/* ������� �������� ����� DBLink */
FUNCTION ExecDBLINK(pSessionID NUMBER, pSITE_DEST_RN NUMBER)  RETURN NUMBER AS
vErr NUMBER;
vResult NUMBER;
BEGIN

  -- �������������� ��� ������������ ����� ��� ��������� � ������ REPL_ANSW � REPL_CALL
  -- ���� ��� ������ ��������� ����� DBLink

  -- ���������� ������� ���� (1 ������)
  BEGIN
    SELECT * INTO gRepl_init FROM REPL_INIT WHERE IS_CURRENT=1 AND ROWNUM=1;
  EXCEPTION
    WHEN OTHERS THEN
 	  AddLog(pSessionId,0,NULL,SYSDATE,fr_REPL_INIT,'������ ��� ������ ���������� � ������� ����:'||SQLERRM,'SEND_DBLINK',1);
	  ROLLBACK;
	  RETURN fr_REPL_INIT;
  END;

  -- ��������� ����������� ������ (��� ���������� ���� ������������� ����������)
  vResult:=Check_Login(pSessionId,'SEND_DBLINK');
  IF vResult<>fr_REPL_OK THEN
    IF vResult=fr_REPL_ACTIVE THEN
      AddLog(pSessionId,gRepl_init.SITE_RN,NULL,SYSDATE,vResult,'������ '||USER||' ������������� ��� ��� ��������','SEND_DBLINK',1);
	ELSE
      IF vResult=fr_REPL_NO_REPL THEN
        AddLog(pSessionId,gRepl_init.SITE_RN,NULL,SYSDATE,vResult,'������ '||USER||' �� ����� ����� �� �������e� ����� DBLINK','SEND_DBLINK',1);
      ELSE
        AddLog(pSessionId,gRepl_init.SITE_RN,NULL,SYSDATE,vResult,'������ '||USER||' �� ������ ��������� �������� ����� DBLINK: ������ ��� ������','SEND_DBLINK',1);
	  END IF;
	END IF;
	ROLLBACK;
    RETURN vResult;
  END IF;

  vResult:=fr_REPL_OK;

  -- �������� ����� DBLINK
  -- ��������� ������
  FOR lcur IN (
               SELECT DISTINCT B.SORTBY, A.SITE_SOURCE_RN, A.SITE_DEST_RN, C.REPL_SCHEMANAME,C.DBLINK -- ���� ���������
                 FROM REPL_SCHEMA A,REPL_SITE B, REPL_INIT C
                WHERE A.SITE_SOURCE_RN=B.RN
				  AND B.IS_ACTIVE=1 -- ���� ��������
				  AND A.SITE_SOURCE_RN=pSITE_DEST_RN -- ���� ��������
				  AND A.SITE_DEST_RN=gRepl_init.SITE_RN -- ������� ����: ����������
				  AND A.IS_ACTIVE=1 -- ����� �������
				  AND A.SITE_SOURCE_RN=C.SITE_RN
				  AND C.USE_DBLINK=1
  			    ORDER BY B.SORTBY
				)
  LOOP
    SET TRANSACTION READ WRITE;
    BEGIN
      vErr:=SendDBLink(pSessionId,'REPL_ANSW',lcur.SITE_SOURCE_RN, lcur.SITE_DEST_RN,lcur.REPL_SCHEMANAME,lcur.DBLINK);
	  IF vErr<=fr_REPL_ERROR THEN
	    vResult:=vErr;
	  END IF;
	  COMMIT;
	EXCEPTION
	  WHEN OTHERS THEN
	    ROLLBACK;
 	    vResult:=fr_REPL_ERROR;
  	    AddLog(pSessionId,gRepl_init.SITE_RN,NULL,SYSDATE,vResult,'������ ��� �������� ����� DBLINK ��������� �������:'||SQLERRM,'SEND_DBLINK',1);
    END;
  END LOOP;

  -- ��������� �������
  FOR lcur IN (
               SELECT DISTINCT B.SORTBY, A.SITE_SOURCE_RN, A.SITE_DEST_RN, C.REPL_SCHEMANAME,C.DBLINK -- ���� ����������
                 FROM REPL_SCHEMA A,REPL_SITE B, REPL_INIT C
                WHERE A.SITE_DEST_RN=B.RN
				  AND B.IS_ACTIVE=1 -- ���� ��������
				  AND A.SITE_SOURCE_RN=gRepl_init.SITE_RN -- ������� ����: ��������
				  AND A.SITE_DEST_RN=pSITE_DEST_RN -- ����-����������
				  AND A.IS_ACTIVE=1 -- ����� �������
				  AND A.SITE_DEST_RN=C.SITE_RN
				  AND C.USE_DBLINK=1
  			    ORDER BY B.SORTBY
				)
  LOOP
    SET TRANSACTION READ WRITE;
    BEGIN
      vErr:=SendDBLink(pSessionId,'REPL_CALL',lcur.SITE_SOURCE_RN, lcur.SITE_DEST_RN,lcur.REPL_SCHEMANAME,lcur.DBLINK);
	  IF vErr<=fr_REPL_ERROR THEN
	    vResult:=vErr;
	  END IF;
	  COMMIT;
    EXCEPTION
	  WHEN OTHERS THEN
	    ROLLBACK;
 	    vResult:=fr_REPL_ERROR;
		AddLog(pSessionId,gRepl_init.SITE_RN,NULL,SYSDATE,VResult,'������ ��� �������� ����� DBLINK ��������� ��������:'||SQLERRM,'SEND_DBLINK',1);
	END;
  END LOOP;

  -- ��������� ����������
  COMMIT;
  RETURN vResult;
END;

/* ���������� ID */
FUNCTION GetFileSeq RETURN NUMBER AS
Res NUMBER;
BEGIN
  SELECT SEQ_FILE_LOCAL.NEXTVAL INTO Res FROM DUAL;
  RETURN Res;
END;

/* ������ �������� �������� ���������� */
FUNCTION START_IMPORT_META(pSessionID NUMBER, pSITE_DEST_RN NUMBER) RETURN NUMBER AS
BEGIN
  -- ���������� ����������� � ���������
  -- REPL_SCHEMA_ROW
  EXECUTE IMMEDIATE 'ALTER TABLE REPL_SCHEMA_ROW DISABLE CONSTRAINT REPL_SCHEMAROW_TABLE_DEST_FK';
  EXECUTE IMMEDIATE 'ALTER TABLE REPL_SCHEMA_ROW DISABLE CONSTRAINT REPL_SCHEMAROW_TABLE_SOURCE_FK';
  EXECUTE IMMEDIATE 'ALTER TABLE REPL_SCHEMA_ROW DISABLE CONSTRAINT SCHEMA_ROW_REPL_SCHEMA_FK';
  EXECUTE IMMEDIATE 'ALTER TRIGGER TRG_BIUDR_REPL_SCHEMA_ROW DISABLE';

  -- REPL_SCHEMA
  EXECUTE IMMEDIATE 'ALTER TABLE REPL_SCHEMA DISABLE CONSTRAINT SCHEMA_REPL_SITE_DEST_FK';
  EXECUTE IMMEDIATE 'ALTER TABLE REPL_SCHEMA DISABLE CONSTRAINT SCHEMA_REPL_SITE_SOURCE_FK';
  EXECUTE IMMEDIATE 'ALTER TRIGGER TRG_BIUDR_REPL_SCHEMA DISABLE';

  -- REPL_SITE
  EXECUTE IMMEDIATE 'ALTER TRIGGER TRG_BIUDR_REPL_SITE DISABLE';

  -- REPL_TABLE
  EXECUTE IMMEDIATE 'ALTER TRIGGER TRG_BIUDR_REPL_TABLE DISABLE';

  -- ������� ������
  DELETE FROM KLS_REPL_MODE;
  DELETE FROM KLS_EVENTS;
  DELETE FROM KLS_STATUS;
  DELETE FROM REPL_SCHEMA_ROW;
  DELETE FROM REPL_SCHEMA;
  DELETE FROM REPL_SITE;
  DELETE FROM REPL_TABLE;
  DELETE FROM CATALOG_LIST;
  DELETE FROM FCACGR_LIST;
  DELETE FROM STORE_LIST;

  COMMIT;
  RETURN fr_REPL_OK;
EXCEPTION
  WHEN OTHERS THEN
    AddLog(pSessionId,gRepl_init.SITE_RN,NULL,SYSDATE,fr_REPL_ERROR,'������ ��� ���������� � �������� �������� ����������: '||SQLERRM,'IMPORT_META',1);
    ROLLBACK;
    RETURN fr_REPL_ERROR;
END;

/* ���������� �������� �������� ���������� */
FUNCTION FINISH_IMPORT_META(pSessionID NUMBER, pSITE_DEST_RN NUMBER) RETURN NUMBER AS
BEGIN
  -- ��������� ����������� � ���������
  -- REPL_SCHEMA_ROW
  EXECUTE IMMEDIATE 'ALTER TABLE REPL_SCHEMA_ROW ENABLE CONSTRAINT REPL_SCHEMAROW_TABLE_DEST_FK';
  EXECUTE IMMEDIATE 'ALTER TABLE REPL_SCHEMA_ROW ENABLE CONSTRAINT REPL_SCHEMAROW_TABLE_SOURCE_FK';
  EXECUTE IMMEDIATE 'ALTER TABLE REPL_SCHEMA_ROW ENABLE CONSTRAINT SCHEMA_ROW_REPL_SCHEMA_FK';
  EXECUTE IMMEDIATE 'ALTER TRIGGER TRG_BIUDR_REPL_SCHEMA_ROW ENABLE';

  -- REPL_SCHEMA
  EXECUTE IMMEDIATE 'ALTER TABLE REPL_SCHEMA ENABLE CONSTRAINT SCHEMA_REPL_SITE_DEST_FK';
  EXECUTE IMMEDIATE 'ALTER TABLE REPL_SCHEMA ENABLE CONSTRAINT SCHEMA_REPL_SITE_SOURCE_FK';
  EXECUTE IMMEDIATE 'ALTER TRIGGER TRG_BIUDR_REPL_SCHEMA ENABLE';

  -- REPL_SITE
  EXECUTE IMMEDIATE 'ALTER TRIGGER TRG_BIUDR_REPL_SITE ENABLE';

  -- REPL_TABLE
  EXECUTE IMMEDIATE 'ALTER TRIGGER TRG_BIUDR_REPL_TABLE ENABLE';

  COMMIT;
  RETURN fr_REPL_OK;
EXCEPTION
  WHEN OTHERS THEN
    AddLog(pSessionId,gRepl_init.SITE_RN,NULL,SYSDATE,fr_REPL_ERROR,'������ ��� ���������� �������� �������� ����������: '||SQLERRM,'IMPORT_META',1);
    ROLLBACK;
    RETURN fr_REPL_ERROR;
END;

/* ������ �������� �������� ���������� */
FUNCTION START_EXPORT_META(pSessionID NUMBER, pSITE_SOURCE_RN NUMBER, pSITE_DEST_RN NUMBER, pRN NUMBER DEFAULT 0, pFILENAME VARCHAR2 DEFAULT NULL) RETURN NUMBER AS
BEGIN
  COMMIT;
  RETURN fr_REPL_OK;
END;

/* ���������� �������� �������� ���������� */
FUNCTION FINISH_EXPORT_META(pSessionID NUMBER, pSITE_SOURCE_RN NUMBER, pSITE_DEST_RN NUMBER, pRN NUMBER DEFAULT 0, pFILENAME VARCHAR2 DEFAULT NULL) RETURN NUMBER AS
BEGIN
  COMMIT;
  RETURN fr_REPL_OK;
END;

/* ������ �������� ������ ���������� */
FUNCTION START_EXPORT_ANSW(pSessionID NUMBER, pSITE_SOURCE_RN NUMBER, pSITE_DEST_RN NUMBER, pRN NUMBER DEFAULT 0, pFILENAME VARCHAR2 DEFAULT NULL) RETURN NUMBER AS
BEGIN
  UPDATE /*+ RULE */ REPL_ANSW SET SENDDATE=SYSDATE, FILENAME=pFILENAME
	 WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN AND SITE_DEST_RN=pSITE_DEST_RN AND (RN=pRN OR pRN=0);
  COMMIT;
  RETURN fr_REPL_OK;
END;

/* ������ �������� ������ ���������� */
FUNCTION START_EXPORT_CALL(pSessionID NUMBER, pSITE_SOURCE_RN NUMBER, pSITE_DEST_RN NUMBER, pRN NUMBER DEFAULT 0, pFILENAME VARCHAR2 DEFAULT NULL) RETURN NUMBER AS
BEGIN
  UPDATE /*+ RULE */ REPL_CALL_OUT SET STATUS=fr_CALL_SEND, SENDDATE=SYSDATE, FILENAME=pFILENAME
   WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN AND SITE_DEST_RN=pSITE_DEST_RN AND (RN=pRN OR pRN=0)
	 AND EXISTS (
           SELECT NULL FROM REPL_CALL
	        WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN AND SITE_DEST_RN=pSITE_DEST_RN AND (RN=pRN OR pRN=0)
			  AND RN=REPL_CALL_OUT.RN
			  );

  UPDATE /*+ RULE */ REPL_CALL SET STATUS=fr_CALL_SEND, SENDDATE=SYSDATE, FILENAME=pFILENAME
	 WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN AND SITE_DEST_RN=pSITE_DEST_RN AND (RN=pRN OR pRN=0);

  COMMIT;
  RETURN fr_REPL_OK;
END;

/* ���������� �������� ������ ���������� */
FUNCTION FINISH_EXPORT_ANSW(pSessionID NUMBER, pSITE_SOURCE_RN NUMBER, pSITE_DEST_RN NUMBER, pRN NUMBER DEFAULT 0, pFILENAME VARCHAR2 DEFAULT NULL) RETURN NUMBER AS
BEGIN
  DELETE FROM /*+ RULE*/ REPL_ANSW
   WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN AND SITE_DEST_RN=pSITE_DEST_RN AND (RN=pRN OR pRN=0);
  COMMIT;
  RETURN fr_REPL_OK;
END;

/* ���������� �������� ������ ���������� */
FUNCTION FINISH_EXPORT_CALL(pSessionID NUMBER, pSITE_SOURCE_RN NUMBER, pSITE_DEST_RN NUMBER, pRN NUMBER DEFAULT 0, pFILENAME VARCHAR2 DEFAULT NULL) RETURN NUMBER AS
BEGIN
  DELETE FROM /*+ RULE*/ REPL_CALL
    WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN AND SITE_DEST_RN=pSITE_DEST_RN AND (RN=pRN OR pRN=0);
  COMMIT;
  RETURN fr_REPL_OK;
END;

/* ������� ������ ��� �������� */
FUNCTION EXPORT_READY_ANSW(pSessionID NUMBER, pSITE_SOURCE_RN NUMBER, pSITE_DEST_RN NUMBER) RETURN NUMBER AS
  vCnt NUMBER;
BEGIN
  vCnt:=0;
  BEGIN
    SELECT /*+ RULE */ COUNT(*) INTO vCnt
	FROM REPL_ANSW
    WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN AND SITE_DEST_RN=pSITE_DEST_RN;
  EXCEPTION
    WHEN OTHERS THEN
      vCnt:=0;
  END;
  IF vCnt=0 THEN
    RETURN fr_REPL_ROW_NOTFOUND;
  ELSE
    RETURN fr_REPL_OK;
  END IF;
END;

/* ������� ������ ��� �������� */
FUNCTION EXPORT_READY_CALL(pSessionID NUMBER, pSITE_SOURCE_RN NUMBER, pSITE_DEST_RN NUMBER) RETURN NUMBER AS
  vCnt NUMBER;
BEGIN
  vCnt:=0;
  BEGIN
    SELECT /*+ RULE */ COUNT(*) INTO vCnt
    FROM REPL_CALL
    WHERE SITE_SOURCE_RN=pSITE_SOURCE_RN AND SITE_DEST_RN=pSITE_DEST_RN
	  AND ROWNUM=1;
  EXCEPTION
    WHEN OTHERS THEN
	  vCnt:=0;
  END;
  IF vCnt=0 THEN
    RETURN fr_REPL_ROW_NOTFOUND;
  ELSE
    RETURN fr_REPL_OK;
  END IF;
END;

/* ������� ������ ��� ���������� */
FUNCTION EXECUTE_READY_CALL(pSessionID NUMBER) RETURN NUMBER AS
vCnt NUMBER;
BEGIN
  vCnt:=0;
  -- ���������� ������� ���� (1 ������)
  BEGIN
    SELECT * INTO gRepl_init FROM REPL_INIT WHERE IS_CURRENT=1 AND ROWNUM=1;
  EXCEPTION
    WHEN OTHERS THEN
 	  AddLog(pSessionId,0,NULL,SYSDATE,fr_REPL_INIT,'������ ��� ������ ���������� � ������� ����:'||SQLERRM,'CALL_IN',1);
	  ROLLBACK;
	  RETURN fr_REPL_INIT;
  END;
  BEGIN
    SELECT /*+ RULE */ COUNT(*) INTO vCnt
    FROM REPL_CALL
    WHERE SITE_DEST_RN=gRepl_init.SITE_RN
	  AND ROWNUM=1;
  EXCEPTION
    WHEN OTHERS THEN
	  vCnt:=0;
  END;
  IF vCnt=0 THEN
    RETURN fr_REPL_ROW_NOTFOUND;
  ELSE
    RETURN fr_REPL_OK;
  END IF;
END;

/* �����-��������� */
FUNCTION GetUserInit RETURN VARCHAR2 AS
BEGIN
  RETURN gREPL_NAME;
END;

END;
/


