--
-- FOR_SESSION  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY SNP_REPL.For_Session AS

-- ������� ������ ������� �������
FUNCTION StartSession(pDESCRIPT VARCHAR2, pAPPL_NAME VARCHAR2, pMODULE_NAME VARCHAR2) RETURN NUMBER AS
  vId NUMBER;
  vLogID NUMBER;
BEGIN
  -- ��������� ������
  vID:=GET_SEQ_LOCAL();
  INSERT INTO REPL_SESSION (ID, STATUS, DATE_START, DESCRIPT, APPL_NAME)
     VALUES (vID, 1, SYSDATE, SUBSTR(pDESCRIPT,1,100), pAPPL_NAME);
  COMMIT;
  -- ������ �������
  vLogID:=WriteToLog(vID,1,'����� ������', NULL, pMODULE_NAME);
  RETURN vID;
END;

-- ������� ������ ������� �������
PROCEDURE FinishSession(pSessionId NUMBER,pMODULE_NAME VARCHAR2) AS
  vLogID NUMBER;
  vStatus NUMBER;
BEGIN
  -- ���������� ��������� ������ ������
  BEGIN
    SELECT SIGN(MIN(STATUS)) INTO vStatus FROM REPL_SESSION_LOG WHERE SESSION_ID=pSessionId;
  EXCEPTION
    WHEN OTHERS THEN
	  vStatus:=0;
  END;
  --
  vLogID:=WriteToLog(pSessionId,1,'���������� ������', NULL, pMODULE_NAME);
  -- ��������� ������ � ����������� ������ ������ (���� ��� ����)
  UPDATE REPL_SESSION SET STATUS=vStatus, DATE_FINISH=SYSDATE
    WHERE ID=pSessionId;
  COMMIT;
END;

-- �������� �������
FUNCTION WriteToLog(pSessionId NUMBER, pSTATUS NUMBER, pDESCRIPT VARCHAR2, pSITE_RN NUMBER, pMODULE_NAME VARCHAR2, pLOG_TIME DATE DEFAULT SYSDATE, pCALL_RN NUMBER DEFAULT NULL, pProcName VARCHAR2 DEFAULT NULL, pSendMail NUMBER DEFAULT 0) RETURN NUMBER AS
  vLogID NUMBER;
  vStatus NUMBER;
BEGIN
  vLogID:=GET_SEQ_LOCAL();
  INSERT INTO REPL_SESSION_LOG (ID, SESSION_ID, STATUS, DESCRIPT, LOG_TIME, SITE_RN, MODULE_NAME, CALL_RN, PROC_NAME, SEND_MAIL)
    VALUES (vLogId,pSessionId, pSTATUS, SUBSTR(pDESCRIPT,1,500), pLOG_TIME, pSITE_RN, pMODULE_NAME, pCALL_RN, pProcName, pSendMail);
  COMMIT;
  -- ������� ������ ������ (�� ������ ����������� ������)
  IF pStatus<0 THEN
    UPDATE REPL_SESSION SET STATUS=-1 WHERE ID=pSessionId;
    COMMIT;
  END IF;
  RETURN vLogId;
END;




END;
/


