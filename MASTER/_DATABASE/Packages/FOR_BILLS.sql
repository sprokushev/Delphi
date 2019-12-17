--
-- FOR_BILLS  (Package) 
--
CREATE OR REPLACE PACKAGE MASTER.For_Bills AS

TYPE CURSTYPE IS REF CURSOR;

-- ���������� � ����� ��� � ����� �� ������� 
FUNCTION NPO_SF$BILLS(AIS_AGENT NUMBER, ADATE_KVIT DATE, ANPO_SF VARCHAR2, ANOM_SF NUMBER) RETURN VARCHAR2;

-- ��������� BILLS_SNP 
PROCEDURE FIELDS$BILLS_SNP(DATE_BEG DATE:=TRUNC(SYSDATE,'MONTH') ,DATE_END DATE:=SYSDATE, param1 VARCHAR2:='', param2 VARCHAR2:='', param3 VARCHAR2:='');

-- ��������� BILL_POS_SNP 
PROCEDURE FIELDS$BILL_POS_SNP(DATE_BEG DATE:=TRUNC(SYSDATE,'MONTH') ,DATE_END DATE:=SYSDATE, param1 VARCHAR2:='', param2 VARCHAR2:='', param3 VARCHAR2:='');

-- ������������/���������� ������ �� ����������
PROCEDURE ADD_BILL_PREPAY(ANOM_ZD VARCHAR2, ASVED_NUM NUMBER);

--- ��������� ���������� ������ ��������� ��� ����������� �����
-- PROCEDURE FILL_TEMP_BILL_KVIT (DATE_KVIT# VARCHAR2,NUM_KVIT# VARCHAR2);

--- ����������� �������������� � ����������� �� ����������
--- pKVIT_ID - ID ��������
--- pERR_TXT - ��������� � ������;
--- ������������ ��������:
-- >=0 - ����� �������������� (���/��)
-- <0 - ��� ������
VR$BAD_RAST CONSTANT NUMBER := -1;
VR$BAD_RAST_TXT CONSTANT VARCHAR2(100) := '���������� �� ������� ����� 0';
VR$OLD_ALGORITM CONSTANT NUMBER := -2;
VR$OLD_ALGORITM_TXT CONSTANT VARCHAR2(100) := '�������������� ������� �� ������� (��� �� 01.07.2003)';
VR$VOZN_NOT_FOUND CONSTANT NUMBER := -3;
VR$VOZN_NOT_FOUND_TXT CONSTANT VARCHAR2(100) := '�� ������� �������������� � ������� ��������������';
VR$KVIT_NOT_FOUND CONSTANT NUMBER := -4;
VR$KVIT_NOT_FOUND_TXT CONSTANT VARCHAR2(100) := '�������� �� �������';

VR$OK_0_TXT CONSTANT VARCHAR2(100) := '�������������� �� ����������� ��������������� � ������� ���';
VR$OK_1_TXT CONSTANT VARCHAR2(100) := '�������������� �� ����������� ��������������� � ����������� �������';
VR$OK_2_TXT CONSTANT VARCHAR2(100) := '�������������� �� ����������� ��������������� � ������������ �������';
VR$OK_3_TXT CONSTANT VARCHAR2(100) := '�������������� �� ����������� ��������������� � ������� ������''�';

FUNCTION GET_VOZN_RST(pKVIT_ID NUMBER, pERR_TXT OUT VARCHAR2) RETURN NUMBER;

--- ��������� ���������� ������ ��������� ��� ����������� �����
PROCEDURE FILL_TEMP_BILL_KVIT (DATE_KVIT# VARCHAR2,NUM_KVIT# VARCHAR2,NOM_DOK# NUMBER);

--- ������ ���� � ������ ��������� ��� ����������� �����
PROCEDURE CALC_TEMP_BILL_KVIT (CENA_ID# NUMBER);

--- ����������� ������� ������ ��� �� �������� ���� � %
FUNCTION GetNDSValue(DATE# DATE) RETURN FLOAT;

--- ����������� ������� ������ ��� �� �������� ���� � %
FUNCTION GetNDSValueSTR(pDATE VARCHAR2) RETURN FLOAT;

-- �������� ����� � �������������� �� ��������
FUNCTION GET_VOZN_OLD(pKVIT_ID NUMBER) RETURN VARCHAR2;
-- ����������� �������������� � ������� ��� � �� ��� 
FUNCTION GET_VOZN_FOR_A_KVIT(pKVIT_ID NUMBER,KINDA_VOZN NUMBER) RETURN NUMBER;

-- ����������� ���������
FUNCTION GET_STRH_FOR_A_KVIT(pKVIT_ID NUMBER) RETURN NUMBER;
   
-- ����������� ��������� �� ������� ���������� ���� � ������ �����
FUNCTION GET_STRH_KOEF_FOR_A_KVIT(pKVIT_ID NUMBER) RETURN NUMBER;

-- ������������ ���� �� ��������
PROCEDURE SET_TEMP_BILL_KVIT_PRICE(ID_NPR# VARCHAR2,CENA_ID# NUMBER);

-- ������ ������ �����, ���������� NOM_DOK
FUNCTION NEW_BILL(CDATE_VYP_SF# VARCHAR2,CDATE_BUXG# VARCHAR2,NOM_DOK_ED# NUMBER, STORNO# NUMBER) RETURN NUMBER;

-- �������� �����
FUNCTION DEL_BILL(NOM_DOK# NUMBER) RETURN NUMBER;

-- ���������� ��������� � ����
FUNCTION ADD_KVIT(NUM_KVIT# NUMBER) RETURN NUMBER;

-- �������� ��������� �� �����
FUNCTION DEL_KVIT(NUM_KVIT# NUMBER) RETURN NUMBER;

-- �������� ����� ����� ���� ������� 
FUNCTION GET_NOM_SF(DATE_VYP_SF# DATE) RETURN NUMBER;

FUNCTION Place_Payments_on_Bills (dog_id# NUMBER, nom_dok# NUMBER, 
  payments_id# NUMBER, realiz_d VARCHAR2)
RETURN VARCHAR2;

FUNCTION Del_Payments_from_Bill
 (nom_dok# NUMBER, payment_id# NUMBER)
RETURN VARCHAR2;

FUNCTION Del_Payments_from_Bill_Period
  (date1# VARCHAR2, date2# VARCHAR2)
RETURN VARCHAR2;

-- ������ �����-������� �� ������
FUNCTION NEW_BILL_NO_OTGR(date_vyp_sf# VARCHAR2,dog_id# NUMBER,usl_number# NUMBER,nom_dok_ed# NUMBER, STORNO# NUMBER) RETURN NUMBER; 

-- ������� TEMP_BILL_POS
PROCEDURE CLEAR_TEMP_BILL_POS(ed_nom_dok# NUMBER);

-- ���������� BILL_POS �� ������������ ����������
PROCEDURE FILL_TEMP_BILL_POS(date_vyp_sf# VARCHAR2,dog_id# NUMBER,usl_number# NUMBER,ALG_ID# NUMBER); 
   
END;

/

