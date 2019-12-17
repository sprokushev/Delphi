--
-- FOR_VED_OSMOTR  (Package) 
--
CREATE OR REPLACE PACKAGE MASTER.FOR_VED_OSMOTR AS


  -- ������������ ����� ������� "��������� ���������������� �������"
  FUNCTION GetMaxNumPos(pVED_ID NUMBER) RETURN NUMBER;

  /* ������� ������� "��������� ���������������� �������" */
  PROCEDURE DelRow(pCOMMIT NUMBER, pID NUMBER);

  /* ��������/�������� ��������� "��������� ���������������� �������" */
  FUNCTION AddTitle(pCOMMIT NUMBER, pID NUMBER, pMESTO_ID NUMBER, pLOAD_TYPE_ID NUMBER,
     pVED_NUM NUMBER, pVED_DATE DATE, pFROM_DATE DATE, pTO_DATE DATE, 
	 pFIO1 VARCHAR2, pFIO2 VARCHAR2, pFIO3 VARCHAR2, pSIGN1 VARCHAR2) RETURN NUMBER;

  /* ������� ��������� "��������� ���������������� �������" */
  PROCEDURE DelTitle(pCOMMIT NUMBER, pID NUMBER);

  /* ����������� ������� �� ��������� � ��������
     ������������ �������� - ID ������� ��������� ��� NULL - ���� ������ �� ������� */
  FUNCTION MoveRow (pCOMMIT NUMBER, pROW_ID NUMBER, pNEW_TITLE_ID NUMBER) RETURN NUMBER;

  /* �������� ������ �� ������������
     ������������ �������� - ����� ���������, � ������� ������ ����� ��� ���� */
  FUNCTION CHECK_UNIQ (pLOAD_TYPE_ID NUMBER, pNUM_CIST VARCHAR2, pID NUMBER, pDATE DATE) RETURN NUMBER;
  
END;

/

