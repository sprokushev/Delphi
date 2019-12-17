--
-- FOR_RASPOR  (Package) 
--
CREATE OR REPLACE PACKAGE MASTER.FOR_RASPOR AS

  /* ���������� �� �������� */


  /* ������� ������� ��������� */
  PROCEDURE DelRow(pCOMMIT NUMBER, pID NUMBER);

  /* ��������/�������� ��������� ���������
     ������������ �������� - ID ��������� */
  FUNCTION AddTitle(pCOMMIT NUMBER, pID NUMBER, pMESTO_ID NUMBER, pLOAD_TYPE_ID NUMBER,
       pNUM_NAR NUMBER, pDATE_NAR DATE,
	   pDATE_BEG DATE, pDATE_END DATE, pDOVER_ID NUMBER DEFAULT NULL)
    RETURN VARCHAR2;

  /* ��������� ��������� ������� TEMP_NAR_LINE */
  PROCEDURE FILL_TEMPNL (pNARIAD_ID NUMBER, pDATE_BEG DATE, pDATE_END DATE, pLOAD_TYPE_ID NUMBER);

  /* ��������� �������� �� TEMP_NAR_LINE � KLS_NAR_LINE */
  PROCEDURE SAVE_TEMPNL (pNARIAD_ID NUMBER);

  /* ������� ��������� ��������� */
  PROCEDURE DelTitle(pCOMMIT NUMBER, pID VARCHAR2);

  /* ���������� ���� ������ �������� ������������ */
  FUNCTION GetDATE_BEG (pDATE DATE, pMESTO_ID NUMBER, pLOAD_TYPE_ID NUMBER) RETURN DATE;

  /* ���������� ���� ��������� �������� ������������ */
  FUNCTION GetDATE_END (pDATE_BEG DATE, pMESTO_ID NUMBER, pLOAD_TYPE_ID NUMBER) RETURN DATE;
END;

/

