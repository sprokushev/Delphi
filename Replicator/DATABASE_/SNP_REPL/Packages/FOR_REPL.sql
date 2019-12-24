--
-- FOR_REPL  (Package) 
--
CREATE OR REPLACE PACKAGE SNP_REPL.For_Repl AS


gREPL_NAME CONSTANT VARCHAR2(20):='SNP_REPL'; -- ��������� ������ ����������; ������������ ��� ���������
gREPL_MAIN CONSTANT VARCHAR2(20):='SNP_REPL_1'; -- �������� ������������ - ����������


gRepl_init REPL_INIT%ROWTYPE; -- ��������� ���������� �������� ����
gErrApplCode NUMBER;
gErrApplMsg VARCHAR2(500);
gErrOraCode NUMBER;
gErrOraMsg VARCHAR2(500);

gIsTestMode NUMBER; -- ����� ������������

/* ������� �� �������� >-100 - �� ����������� */

fr_REPL_OK CONSTANT NUMBER:=1; -- ������ ���
fr_REPL_INFO CONSTANT NUMBER:=2; -- ������ ���, �� ����� �������� � ���
fr_REPL_ERROR CONSTANT NUMBER:=-100; -- ����������� ������
fr_REPL_ERROR_NON_CRITICAL CONSTANT NUMBER:=-2; -- �� ����������� ������
fr_REPL_ACTIVE CONSTANT NUMBER:=-101; -- ������ ��� ������ ������������� SNP_REPL - ����� ������������ ��� ������������
fr_REPL_INIT CONSTANT NUMBER:=-102;		 -- ������ ��� ������ �������� ����������
fr_REPL_ROW_NOTFOUND CONSTANT NUMBER:=-3; -- ������ ��� ���������� ���������: � ������� ���������� ���� ������, ��� ������� ��� ������ � ������������� �������
fr_REPL_DBLINK_NOTSEND CONSTANT NUMBER:=-104; -- ������ �������� ���������� ����� DBLINK
fr_REPL_SQL_EMPTY CONSTANT NUMBER:=-105; -- �������������� �������� - ������
fr_REPL_NO_REPL CONSTANT NUMBER:=-106; -- ������� ������� ��������� ���������� �� �� ����� �����������
fr_REPL_VIEW CONSTANT NUMBER:=-99; -- ����� � ������ ���������

fr_CALL_ERR CONSTANT NUMBER:=-110; -- ������ ���������� ���������: ������
fr_CALL_NOTSEND CONSTANT NUMBER:=0; -- ������ ���������: �����������
fr_CALL_RESEND CONSTANT NUMBER:=1; -- ������ ���������: ������
fr_CALL_SEND CONSTANT NUMBER:=2; -- ������ ���������: �������
fr_CALL_WAIT CONSTANT NUMBER:=3; -- ������ ���������: ���� ���������� ����������� ���������
fr_CALL_SKIP CONSTANT NUMBER:=100; -- ������ ���������: �������� �� ����� ������� (������������)
fr_CALL_OK CONSTANT NUMBER:=101; -- ������ ���������: ������� ��������
fr_CALL_SKIP_MODE_NODELETE CONSTANT NUMBER:=102; -- ������ ���������: �������� - ����� ��� �������� (REPL_MODE=0)
fr_CALL_SKIP_MODE_CHECKDATE CONSTANT NUMBER:=103; -- ������ ���������: �������� - ������� (REPL_MODE=2)
fr_CALL_NO_DATA_FOUND CONSTANT NUMBER:=104; -- ��� ���������� ��������� UPDATE ��� DELETE - ������ �� �������
fr_CALL_USER_DELETED CONSTANT NUMBER:=-111; -- �������� ������ ������������� �� ������� ����
fr_CALL_DEST_USER_DELETED CONSTANT NUMBER:=-112; -- �������� ������ ������������� �� ����-����������
fr_CALL_USER_RESTORED CONSTANT NUMBER:=-11; -- �������� ������������ ������������� �� ������� ����
fr_CALL_DEST_USER_RESTORED CONSTANT NUMBER:=-113; -- �������� ������������ ������������� �� ����-����������

fr_REPL_MODE_NODELETE CONSTANT NUMBER:=0; -- ����� ���������� - ��� ��������
fr_REPL_MODE_FULL CONSTANT NUMBER:=1; -- ����� ���������� - ������
fr_REPL_MODE_CHECKDATE CONSTANT NUMBER:=2; -- ����� ���������� - �������� ���� �����������

/* ��������� ������� ������ ������ SNP_REPL */
FUNCTION Check_Login(pSessionID NUMBER, pPROC_NAME VARCHAR2) RETURN NUMBER ;

/* �������� ������ �� REPL_CALL_OUT */
PROCEDURE DeleteCallOut(pSessionID NUMBER,pCallOutRN NUMBER,
                    pSITE_SOURCE_RN NUMBER ,pSITE_DEST_RN NUMBER, pSTATUS NUMBER, pDATE_EXEC DATE DEFAULT NULL);

/* �������������� �� ������ ������ � REPL_CALL_OUT */
PROCEDURE RestoreCallOut(pSessionID NUMBER,pCallOutRN NUMBER,
                    pSITE_SOURCE_RN NUMBER ,pSITE_DEST_RN NUMBER);

/* ���������� ������ � REPL_ANSW */
FUNCTION AddAnswOut(pSessionID NUMBER,pCallOutRN NUMBER,
                    pSITE_SOURCE_RN NUMBER ,pSITE_DEST_RN NUMBER ,
					pSTATUS NUMBER, pNOTE VARCHAR2) RETURN NUMBER;

/* �������� ������ �� REPL_CALL */
PROCEDURE DeleteCall(pSessionID NUMBER,pCallOutRN NUMBER,
                    pSITE_SOURCE_RN NUMBER ,pSITE_DEST_RN NUMBER, pStatus NUMBER, pDATE_EXEC DATE DEFAULT NULL);

/* �������������� ������ � REPL_CALL */
PROCEDURE RestoreCall(pSessionID NUMBER,pCallOutRN NUMBER,
                    pSITE_SOURCE_RN NUMBER ,pSITE_DEST_RN NUMBER);

/* ��������� �������� ������� ����������� �� ���� pSITE_DEST_RN �� ���� pSITE_SOURCE_RN */
FUNCTION Answ_In(pSessionID NUMBER,pSITE_SOURCE_RN NUMBER,pSITE_DEST_RN NUMBER) RETURN NUMBER;

/* ���������� �������� �������� ����������� �� ���� pSITE_SOURCE_RN �� ���� pSITE_DEST_RN */
FUNCTION Call_In(pSessionID NUMBER,pSITE_SOURCE_RN NUMBER,pSITE_DEST_RN NUMBER,pSCHEMA_RN NUMBER) RETURN NUMBER;

/* ������������ ��������� �������� � ���� pSITE_SOURCE_RN �� ���� pSITE_DEST_RN �� ����� pSCHEMA_RN */
FUNCTION Call_Out(pSessionID NUMBER,pSITE_SOURCE_RN NUMBER,pSITE_DEST_RN NUMBER,pSCHEMA_RN NUMBER) RETURN NUMBER;

/* ������ ��������� �������� � ���� pSITE_SOURCE_RN �� ���� pSITE_DEST_RN �� ������� ������������
   (� ����������� ��������� �� REPL_CALL_OUT � REPL_CALL) */
FUNCTION Analyze_Call_Out(pSessionID NUMBER,pSITE_SOURCE_RN NUMBER,pSITE_DEST_RN NUMBER) RETURN NUMBER;

/* �������� ����� DBLink � ���� pSITE_SOURCE_RN �� ���� pSITE_DEST_RN ��������� ������� � �������� */
FUNCTION SendDBLink(pSessionID NUMBER,pTYPE VARCHAR2,pSITE_SOURCE_RN NUMBER,pSITE_DEST_RN NUMBER,pREPL_SCHEMANAME VARCHAR2,pDBLINK VARCHAR2) RETURN NUMBER;

/* ������� ����������: ��������� �������� ������� */
FUNCTION ExecAnswIn(pSessionID NUMBER) RETURN NUMBER;

/* ������� ����������: ��������� �������� �������� */
FUNCTION ExecCallIn(pSessionID NUMBER) RETURN NUMBER;

/* ������� ����������: ������������ ��������� �������� */
FUNCTION ExecCallOut(pSessionID NUMBER)  RETURN NUMBER;

/* ������� ����������: ��������� �������� �������������� �������� */
FUNCTION ExecReSendCallOut(pSessionID NUMBER)  RETURN NUMBER;

/* ������� ����������: ��������� ������������ �������� � COUNTER>=3 */
FUNCTION ExecReFormBad(pSessionID NUMBER)  RETURN NUMBER;

/* ������� �������� ����� DBLink */
FUNCTION ExecDBLINK(pSessionID NUMBER, pSITE_DEST_RN NUMBER) RETURN NUMBER;

/* ���������� ID */
FUNCTION GetFileSeq RETURN NUMBER;

/* ������ �������� �������� ���������� */
FUNCTION START_IMPORT_META(pSessionID NUMBER, pSITE_DEST_RN NUMBER) RETURN NUMBER;

/* ���������� �������� �������� ���������� */
FUNCTION FINISH_IMPORT_META(pSessionID NUMBER, pSITE_DEST_RN NUMBER) RETURN NUMBER;

/* ������ �������� �������� ���������� */
FUNCTION START_EXPORT_META(pSessionID NUMBER, pSITE_SOURCE_RN NUMBER, pSITE_DEST_RN NUMBER, pRN NUMBER DEFAULT 0, pFILENAME VARCHAR2 DEFAULT NULL) RETURN NUMBER;

/* ���������� �������� �������� ���������� */
FUNCTION FINISH_EXPORT_META(pSessionID NUMBER, pSITE_SOURCE_RN NUMBER, pSITE_DEST_RN NUMBER, pRN NUMBER DEFAULT 0, pFILENAME VARCHAR2 DEFAULT NULL) RETURN NUMBER;

/* ������ �������� ������ ���������� */
FUNCTION START_EXPORT_ANSW(pSessionID NUMBER, pSITE_SOURCE_RN NUMBER, pSITE_DEST_RN NUMBER, pRN NUMBER DEFAULT 0, pFILENAME VARCHAR2 DEFAULT NULL) RETURN NUMBER;

/* ������ �������� ������ ���������� */
FUNCTION START_EXPORT_CALL(pSessionID NUMBER, pSITE_SOURCE_RN NUMBER, pSITE_DEST_RN NUMBER, pRN NUMBER DEFAULT 0, pFILENAME VARCHAR2 DEFAULT NULL) RETURN NUMBER;

/* ���������� �������� ������ ���������� */
FUNCTION FINISH_EXPORT_ANSW(pSessionID NUMBER, pSITE_SOURCE_RN NUMBER, pSITE_DEST_RN NUMBER, pRN NUMBER DEFAULT 0, pFILENAME VARCHAR2 DEFAULT NULL) RETURN NUMBER;

/* ���������� �������� ������ ���������� */
FUNCTION FINISH_EXPORT_CALL(pSessionID NUMBER, pSITE_SOURCE_RN NUMBER, pSITE_DEST_RN NUMBER, pRN NUMBER DEFAULT 0, pFILENAME VARCHAR2 DEFAULT NULL) RETURN NUMBER;

/* ������� ������ ��� �������� */
FUNCTION EXPORT_READY_ANSW(pSessionID NUMBER, pSITE_SOURCE_RN NUMBER, pSITE_DEST_RN NUMBER) RETURN NUMBER;

/* ������� ������ ��� �������� */
FUNCTION EXPORT_READY_CALL(pSessionID NUMBER, pSITE_SOURCE_RN NUMBER, pSITE_DEST_RN NUMBER) RETURN NUMBER;

/* ������� ������ ��� ���������� */
FUNCTION EXECUTE_READY_CALL(pSessionID NUMBER) RETURN NUMBER;

/* �����-��������� */
FUNCTION GetUserInit RETURN VARCHAR2;

END;
/


