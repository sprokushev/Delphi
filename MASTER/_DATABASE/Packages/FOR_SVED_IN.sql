--
-- FOR_SVED_IN  (Package) 
--
CREATE OR REPLACE PACKAGE MASTER.FOR_SVED_IN AS

  /* �������� � ��������� */ 

  -- ������������ ����� ������� ���������
  FUNCTION GetMaxNumPos(pSVED_IN_ID VARCHAR2) RETURN NUMBER;

  /* ������� ������� ��������� */
  PROCEDURE DelRow(pCOMMIT NUMBER, pID NUMBER);

  /* ��������/�������� ��������� ��������� */
  FUNCTION AddTitle(pCOMMIT NUMBER, pID VARCHAR2, pMESTO_ID NUMBER, 
     pSVED_NUM NUMBER, pSVED_DATE DATE, pGOTOV_TIME VARCHAR2, pBEG_NALIV_TIME VARCHAR2, 
	 pEND_NALIV_TIME VARCHAR2, pDATE_OFORML DATE, pPROD_ID_NPR VARCHAR2, pPASP_NUM VARCHAR2, 
	 pREZ_NUM VARCHAR2, pPASP_DATE DATE, pPL20 NUMBER, pPL15 NUMBER, pP_VOD NUMBER, pP_DIRT NUMBER, 
	 pMG_SOL NUMBER, pP_SOL NUMBER) RETURN VARCHAR2;

  /* ������� ��������� ��������� */
  PROCEDURE DelTitle(pCOMMIT NUMBER, pID VARCHAR2);

  /* �������� ������ �� ������������
     ������������ �������� - ����� ��������, � ������� ������ ����� ��� ���� */
  FUNCTION CHECK_UNIQ (pLOAD_TYPE_ID NUMBER, pNUM_CIST VARCHAR2, pID NUMBER, pDATE DATE) RETURN NUMBER;

  /* ����������� ������� �������� */
  PROCEDURE CopySvedRow (pCOMMIT NUMBER, pSVED_OLD_ID VARCHAR2, pSVED_ID VARCHAR2);
  
END;
/

