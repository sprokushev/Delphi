--
-- FOR_VES  (Package) 
--
CREATE OR REPLACE PACKAGE MASTER.FOR_VES AS

G_NEW_GOST CONSTANT DATE := TO_DATE('01.10.2005','dd.mm.yyyy');

/* ������ ����.��������� �� ����������� � ��������� ��� ����������� <=-25 */
FUNCTION GET_FACT_PL_MOROZ(pTEMPER NUMBER, pPL NUMBER) RETURN NUMBER;

/* ������ ����.��������� �� ����������� � ��������� ��� 20'C �� ���� 3900-85 */
FUNCTION GET_FACT_PL_390085(pTEMPER NUMBER, pPL20 NUMBER) RETURN NUMBER;

/* ����������� ������������ ��������� ������ �� ASTM D 1250 */
FUNCTION GET_CTLV_ASTMD1250(pTEMPER NUMBER, pPL15 NUMBER, pPROD_ID_NPR VARCHAR2) RETURN NUMBER;

/* ��������� ������� ����� (��������� ������� TEMP_VES) */
PROCEDURE EMPTY_TEMP_VES;

/* ��������� ���������� ��������� � ���� (��������� ������� TEMP_VES) */
PROCEDURE SET_PARAM (pTAG VARCHAR2, pVALUE VARCHAR2, pNORMA VARCHAR2 DEFAULT NULL);

/* ���������� ����������� �������� �� �������� � ���� ���������� ��� ��������� ������� ���� */
PROCEDURE SET_PARAM_VALSVED (pSVED_ID VARCHAR2);

/* ������� ���������� ��������� �� ����� (��������� ������� TEMP_VES) */
FUNCTION GET_PARAM_AS_CHAR (pTAG VARCHAR2) RETURN VARCHAR2;
FUNCTION GET_PARAM_AS_NUM (pTAG VARCHAR2) RETURN NUMBER;
FUNCTION GET_PARAM_NORMA (pTAG VARCHAR2) RETURN NUMBER;

/* ����������� �������� ����� */
FUNCTION GET_DEFAULT_GOST (pLOAD_TYPE_ID NUMBER, pDATE_CALC DATE, pPROD_ID_NPR VARCHAR2,
                           pTEMPER VARCHAR2, pPL15 NUMBER, pPL20 NUMBER, vSLIV NUMBER) RETURN NUMBER;

/* ������ ������ ��� 15'C �� ������������ ������ */
FUNCTION GET_VOLUME15_BY_VOLUME (pDATE_CALC DATE, vVOLUME NUMBER, vTEMPER NUMBER, vCTLV NUMBER, vSLIV NUMBER) RETURN NUMBER;

/* ������ ������������ ������ �� ������ ��� 15'C */
FUNCTION GET_VOLUME_BY_VOLUME15 (pDATE_CALC DATE, vVOLUME15 NUMBER, vTEMPER NUMBER, vCTLV NUMBER) RETURN NUMBER;

/* ���������� ������� ����������� */
FUNCTION CALC_VES(pDATE_CALC DATE, pLOAD_TYPE_ID NUMBER, pVAGONTYPE_ID NUMBER, pMESTO_ID NUMBER,
   pDEFI_MASS_ID NUMBER) RETURN NUMBER;

END;
/

