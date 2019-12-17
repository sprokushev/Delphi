--
-- FOR_AZC  (Package) 
--
CREATE OR REPLACE PACKAGE MASTER.For_Azc AS

  -- ������� ���� �� ���, ��������, ������������ �� ������������ ����
  FUNCTION GET_AZC_OST_VES(pORG_STRU_ID NUMBER, pPROD_ID_NPR VARCHAR2, pSOBSTV_ID NUMBER, pDATE_OPER DATE DEFAULT SYSDATE, FIRST_DAY NUMBER DEFAULT 1) RETURN NUMBER;
  FUNCTION GET_AZC_OST_VES_ex(pORG_STRU_ID NUMBER, pPROD_ID_NPR VARCHAR2, pSOBSTV_ID NUMBER, pDATE_OPER DATE DEFAULT SYSDATE, FIRST_DAY NUMBER DEFAULT 1) RETURN NUMBER;

  -- ������� ������ �� ���, ��������, ������������ �� ������������ ����
  FUNCTION GET_AZC_OST_VOL(pORG_STRU_ID NUMBER, pPROD_ID_NPR VARCHAR2, pSOBSTV_ID NUMBER, pDATE_OPER DATE DEFAULT SYSDATE,FIRST_DAY NUMBER DEFAULT 1) RETURN NUMBER;
  FUNCTION GET_AZC_OST_VOL_ex(pORG_STRU_ID NUMBER, pPROD_ID_NPR VARCHAR2, pSOBSTV_ID NUMBER, pDATE_OPER DATE DEFAULT SYSDATE,FIRST_DAY NUMBER DEFAULT 1) RETURN NUMBER;

  -- ������� ���� �� �������� �� ���, ��������, ������������ �� ������������ ����
  FUNCTION GET_AZC_HRAN_VES(pORG_STRU_ID NUMBER, pPROD_ID_NPR VARCHAR2, pSOBSTV_ID NUMBER, pDATE_OPER DATE DEFAULT SYSDATE, FIRST_DAY NUMBER DEFAULT 1) RETURN NUMBER;

  -- ������� ������ �� �������� �� ���, ��������, ������������ �� ������������ ����
  FUNCTION GET_AZC_HRAN_VOL(pORG_STRU_ID NUMBER, pPROD_ID_NPR VARCHAR2, pSOBSTV_ID NUMBER, pDATE_OPER DATE DEFAULT SYSDATE, FIRST_DAY NUMBER DEFAULT 1) RETURN NUMBER;
  -- ������� ������ �������� �� ������� �� ���� �������������
  FUNCTION GET_AZC_OST_VOL_all(pORG_STRU_ID NUMBER, pPROD_ID_NPR VARCHAR2, pDATE_OPER DATE DEFAULT SYSDATE) RETURN NUMBER;
  -- ������� ���� �������� �� ������� �� ���� �������������
  FUNCTION GET_AZC_OST_VES_all(pORG_STRU_ID NUMBER, pPROD_ID_NPR VARCHAR2, pDATE_OPER DATE DEFAULT SYSDATE) RETURN NUMBER;
  -- ������� ���� �� �������� � ������������
  FUNCTION get_azc_ost_allv(pPROD_ID VARCHAR2, pID_KIND_ORG NUMBER, pID_SOBSTV NUMBER, pTYPE VARCHAR2,  pDATE_OPER DATE DEFAULT SYSDATE) RETURN NUMBER;
  -- ����� ������� ������� �� �������� 
  FUNCTION get_vol_rez(pID_ORG VARCHAR2, pID_PROD NUMBER, pTYPE VARCHAR2 DEFAULT 'DEAD', pDATE DATE DEFAULT SYSDATE) RETURN NUMBER;
  
  -- ������� ������ ���� ��������� ������ �� ������������,�������, ��������
  FUNCTION get_ves_last(pID_SOBSTV NUMBER, pID_ORG NUMBER, pID_PROD NUMBER,pDATE DATE DEFAULT SYSDATE) RETURN NUMBER;
  
  -- ��������� ������������ �������� �� �����
  -- date_from - ���� �� ����� �������� , date_to  -  ���� �� ������, ���� ������� ���� �����������  
  PROCEDURE for_rec_ostatki(DATE_FROM DATE, DATE_TO DATE);
  
  PROCEDURE for_rec_catalog(date_to DATE);


 --������� ���������� ����� �� ���� �� ������ ������ (���, �������, ��������,���� ������, ���� �����) 
  FUNCTION GET_AZC_WEEK_PARUS(pORG_STRU_ID NUMBER, pPROD_ID_NPR VARCHAR2, pID_OPERATION NUMBER,pDateFirst DATE, pDateLast DATE DEFAULT SYSDATE) RETURN NUMBER;
  
 --������� ���� �� �������� � �������� 
  PROCEDURE for_week_parus (DATE_FROM VARCHAR2, DATE_TO VARCHAR2);
-- ������� �������� � ����������� � ������ ��������
   PROCEDURE for_rec_ostatki_rename(DATE_FROM DATE, DATE_TO DATE);
  
    
END;

/

