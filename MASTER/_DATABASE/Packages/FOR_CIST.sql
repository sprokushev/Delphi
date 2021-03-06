--
-- FOR_CIST  (Package) 
--
CREATE OR REPLACE PACKAGE MASTER.For_CIST AS

/* ���������� ������� */

-- ���������� ������� ������ � �����������
FUNCTION CIST_EXIST (pNUM_CIST VARCHAR2, pLOAD_TYPE_ID NUMBER DEFAULT 1) RETURN NUMBER;

-- ������� ��������� �������
FUNCTION GET_ID_NPR (pNUM_CIST VARCHAR2, pLOAD_TYPE_ID NUMBER DEFAULT 1) RETURN VARCHAR2;

-- ������� ��� ������
FUNCTION GET_VAGONTYPE (pNUM_CIST VARCHAR2, pLOAD_TYPE_ID NUMBER DEFAULT 1) RETURN NUMBER;

-- ��������� ����� ������
FUNCTION CHECK_NUM_CIST(pNUM_CIST VARCHAR2, pLOAD_TYPE_ID NUMBER DEFAULT 1, pVAGONTYPE_ID NUMBER DEFAULT 6) RETURN NUMBER;

-- ������� ��� �� ���� ������
FUNCTION GET_KALIBR_BY_VAGONTYPE (pLOAD_TYPE_ID NUMBER DEFAULT 1, pVAGONTYPE_ID NUMBER DEFAULT 6) RETURN VARCHAR2;

-- ������� ���
FUNCTION GET_KALIBR (pNUM_CIST VARCHAR2, pLOAD_TYPE_ID NUMBER DEFAULT 1, pVAGONTYPE_ID NUMBER DEFAULT 6) RETURN VARCHAR2;

-- ������� �������������� � ������� ���
FUNCTION GET_NCISTDOP (pNUM_CIST VARCHAR2, pLOAD_TYPE_ID NUMBER DEFAULT 1, pVAGONTYPE_ID NUMBER DEFAULT 6) RETURN NUMBER;

-- ������� ��� ������
FUNCTION GET_VES_CIST (pNUM_CIST VARCHAR2, pLOAD_TYPE_ID NUMBER DEFAULT 1, pVAGONTYPE_ID NUMBER DEFAULT 6) RETURN NUMBER;

-- ������� ��������� ������
FUNCTION GET_VAGOWNER (pNUM_CIST VARCHAR2, pLOAD_TYPE_ID NUMBER DEFAULT 1, pVAGONTYPE_ID NUMBER DEFAULT 6) RETURN NUMBER;

-- ������� ����������������
FUNCTION GET_CAPACITY (pNUM_CIST VARCHAR2, pKALIBR_ID VARCHAR2 DEFAULT NULL, pLOAD_TYPE_ID NUMBER DEFAULT 1, pVAGONTYPE_ID NUMBER DEFAULT 6) RETURN VARCHAR2;

FUNCTION GET_CAPACITY_BY_KALIBR (pKALIBR_ID VARCHAR2, pLOAD_TYPE_ID NUMBER, pVAGONTYPE_ID NUMBER) RETURN VARCHAR2;

-- ������� ���-�� ����
FUNCTION GET_AXES (pNUM_CIST VARCHAR2, pKALIBR_ID VARCHAR2 DEFAULT NULL, pVES NUMBER DEFAULT 0, pLOAD_TYPE_ID NUMBER DEFAULT 1, pVAGONTYPE_ID NUMBER DEFAULT 6) RETURN NUMBER;

-- ������� ���-�� ���� �� ���� ������
FUNCTION GET_AXES_BY_KALIBR (pKALIBR_ID VARCHAR2, pLOAD_TYPE_ID NUMBER, pVAGONTYPE_ID NUMBER) RETURN NUMBER;

-- ������� ���-�� ���� �� ����
FUNCTION GET_AXES_BY_VES (pVES NUMBER, pLOAD_TYPE_ID NUMBER, pVAGONTYPE_ID NUMBER) RETURN NUMBER;

-- ������� ����� ������ �� ���� � ������
FUNCTION GET_VOLUME (pKALIBR_ID VARCHAR2, pVZLIV NUMBER, pLOAD_TYPE_ID NUMBER DEFAULT 1, pVAGONTYPE_ID NUMBER DEFAULT 6) RETURN NUMBER;

-- ������� �������������� �� ������
FUNCTION GET_DENI_TXT(pNUM_CIST VARCHAR2, pLOAD_TYPE_ID NUMBER DEFAULT 1, pVAGONTYPE_ID NUMBER DEFAULT 6) RETURN NUMBER;

-- ��������� �������� ������ � ����������� �������
PROCEDURE SET_CIST_PROPERTY(pCOMMIT NUMBER, pNUM_CIST VARCHAR2, pLOAD_TYPE_ID NUMBER, pFIELD VARCHAR2, pVALUE VARCHAR2);

-- �������� ����� � ���������� �������
PROCEDURE ADD_CIST (pCOMMIT NUMBER, pNUM_CIST VARCHAR2, pLOAD_TYPE_ID NUMBER, pVAGONTYPE_ID NUMBER, pKALIBR_ID VARCHAR2, pTIP1 VARCHAR2, pCAPACITY VARCHAR2,pWES1 VARCHAR2,
                    pNCISTDOP NUMBER, pAXES NUMBER, pVES_CIST NUMBER, pVAGOWNER_ID NUMBER, pPROD_ID_NPR VARCHAR2 DEFAULT NULL);

-- ���������� � ��������� �����
FUNCTION LAST_PROD_ID_NPR (pDATE DATE,pNUM_CIST VARCHAR2,pMESTO_ID NUMBER, pLOAD_TYPE_ID NUMBER) RETURN VARCHAR2;
FUNCTION LAST_PROD_NAME (pDATE DATE,pNUM_CIST VARCHAR2,pMESTO_ID NUMBER, pLOAD_TYPE_ID NUMBER) RETURN VARCHAR2;
FUNCTION LAST_GRUZ (pDATE DATE,pNUM_CIST VARCHAR2,pMESTO_ID NUMBER, pLOAD_TYPE_ID NUMBER) RETURN VARCHAR2;
FUNCTION LAST_PROD_DATE (pDATE DATE,pNUM_CIST VARCHAR2,pMESTO_ID NUMBER, pLOAD_TYPE_ID NUMBER) RETURN VARCHAR2;

END;

/

