--
-- FOR_TEMP  (Package) 
--
CREATE OR REPLACE PACKAGE MASTER.For_Temp AS

  /* �������� ��������� ���������� 
     pVariName - ��� ����������
     pVariValue - �������� ����������
	 pAppName - ���������� (����� �� ���������)
	 pUnitName - ������ (����� �� ���������)
  */	   
  FUNCTION SET_VARI(pVariName VARCHAR2, PVariValue NUMBER, pAppName VARCHAR2:='', pUnitName VARCHAR2:='', pTime NUMBER := 1) RETURN NUMBER;
  FUNCTION SET_VARI(pVariName VARCHAR2, PVariValue DATE, pAppName VARCHAR2:='', pUnitName VARCHAR2:='', pTime NUMBER := 1) RETURN NUMBER;
  FUNCTION SET_VARI(pVariName VARCHAR2, PVariValue VARCHAR2, pAppName VARCHAR2:='', pUnitName VARCHAR2:='', pTime NUMBER := 1) RETURN NUMBER;

  /* ��������� �������� ��������� ����������
     pVariName - ��� ����������
	 pAppName - ���������� (����� �� ���������)
	 pUnitName - ������ (����� �� ���������)
	 pVariId - ID ���������� (��������� ���� pVariName=NULL)
  */	   
  FUNCTION GET_AS_NUM(pVariName VARCHAR2, pAppName VARCHAR2:='', PUnitName VARCHAR2:='', PVariId NUMBER:=NULL) RETURN NUMBER;
  FUNCTION GET_AS_DATE(pVariName VARCHAR2, pAppName VARCHAR2:='', PUnitName VARCHAR2:='', PVariId NUMBER:=NULL, pFormat VARCHAR2:='dd.mm.yyyy hh24:mi:ss') RETURN DATE;
  FUNCTION GET_AS_CHAR(pVariName VARCHAR2, pAppName VARCHAR2:='', PUnitName VARCHAR2:='', PVariId NUMBER:=NULL, pFormat VARCHAR2:='dd.mm.yyyy hh24:mi:ss') RETURN VARCHAR2;

  /* ��������� ��������� ���������� */
  PROCEDURE CLEAR_TEMP_VARI;
  
  /* ��������� ������ */
  PROCEDURE SET_REPORT_PARAM_VALUE (pREP_ID NUMBER);

  /* �������� ��������� ������ */
  PROCEDURE EMPTY_REPORT_PARAM_VALUE (pREP_ID NUMBER);
    
END;

/

