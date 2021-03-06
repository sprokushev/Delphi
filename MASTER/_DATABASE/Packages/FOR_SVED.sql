--
-- FOR_SVED  (Package) 
--
CREATE OR REPLACE PACKAGE MASTER.FOR_SVED AS

  /* �������� �� �������� */

  -- ������������ ����� ������� ���������
  FUNCTION GetMaxNumPos(pSVED_ID VARCHAR2) RETURN NUMBER;

  /* ������� ������� ��������� */
  PROCEDURE DelRow(pCOMMIT NUMBER, pID NUMBER);

  /* ��������/�������� ��������� ���������
     ������������ �������� - ID ��������� */
    FUNCTION AddTitle(pCOMMIT NUMBER, pID VARCHAR2, pMESTO_ID NUMBER, pLOAD_TYPE_ID NUMBER,
       pSVED_NUM NUMBER, pSVED_DATE DATE,
	   pPOD_DATE VARCHAR2, pTECH_TIME VARCHAR2, pGOTOV_TIME VARCHAR2, pBEG_NALIV_TIME VARCHAR2, pEND_NALIV_TIME VARCHAR2, pDATE_OFORML DATE,
	   pDEFI_MASS_ID NUMBER, pPASP_ID VARCHAR2, pPROD_ID_NPR VARCHAR2, pPASP_NUM VARCHAR2, pREZ_NUM VARCHAR2, pPASP_DATE DATE,
	   pCENA NUMBER, pCENA_OTP NUMBER, pDATE_CENA DATE) RETURN VARCHAR2;

  /* �������� ��������� ������� TEMP_VALSVED */
  PROCEDURE EMPTY_TEMP_VALSVED;

  /* ��������� ��������� ������� TEMP_VALSVED */
  PROCEDURE FILL_TEMP_VALSVED (pMode NUMBER,pSVED_ID VARCHAR2, pPASP_ID VARCHAR2, pPROD_ID_NPR VARCHAR2);

  /* ��������� �������� ����������� �������� �� TEMP_VALSVED � KLS_VALSVED */
  PROCEDURE SAVE_TEMP_VALSVED (pSVED_ID VARCHAR2);

  /* ������� �������� ���������� �� TEMP_VALSVED */
  FUNCTION GET_TEMP_VALSVED_AS_CHAR (pKODIF_ID NUMBER, pKODIF_TAG VARCHAR2) RETURN VARCHAR2;
  FUNCTION GET_TEMP_VALSVED_AS_NUM (pKODIF_ID NUMBER, pKODIF_TAG VARCHAR2) RETURN NUMBER;

  /* ��������/�������� ������� ���������
     ������������ �������� - ID ������� ��������� */
  FUNCTION AddRow(pCOMMIT NUMBER, pID NUMBER, pSVED_ID VARCHAR2, pSVED_POS NUMBER,
    pNUM_CIST VARCHAR2, pNCISTDOP NUMBER, pAXES NUMBER, pCAPACITY VARCHAR2, pWES1 VARCHAR2, pVES_CIST NUMBER,
	pVAGONTYPE_ID NUMBER, pKALIBR_ID VARCHAR2, pTIP1 VARCHAR2, pVAGOWNER_ID NUMBER,
	pVETKA_POD_ID NUMBER, pVETKA_OTP_ID NUMBER, pVETKA_NAPR_ID NUMBER, pVAG_STATUS_ID NUMBER,
	pVZLIV NUMBER, pVOLUME NUMBER, pTEMPER NUMBER, pFAKT_PL NUMBER, pVES NUMBER, pKOL_NET NUMBER,
	pVES_ALL NUMBER, pVES_ED NUMBER, pKOL_ED NUMBER, pUPAK_ID NUMBER, pUPAK_VES NUMBER, pUPAK_VES_ED NUMBER,
	pPODDONS NUMBER, pPODDON_VES NUMBER, pSHIELDS NUMBER, pSHIELD_VES NUMBER,
	pZPU_TYPE1 NUMBER, pZPU_TYPE2 NUMBER, pPLOMBA1 VARCHAR2, pPLOMBA2 VARCHAR2, pROSINSPL1 VARCHAR2,
	pROSINSPL2 VARCHAR2, pFORMNAKL_ID NUMBER, pGOST_ID NUMBER, pVOLUME15 NUMBER, pCTLV NUMBER, pIS_AUTO NUMBER) RETURN VARCHAR2;

  /* ����������� ������� ��������� ������ � ��������
     ������������ �������� - ID ������� ��������� */
  FUNCTION CopyVedPodRow (pCOMMIT NUMBER, pVED_POD_ROW_ID NUMBER, pSVED_ID VARCHAR2, pNAR_LINE_ID NUMBER) RETURN NUMBER;

  /* ����������� ������� �������� � ��������
     ������������ �������� - ID ������� ��������� ��� NULL - ���� ������ �� ������� */
  FUNCTION MoveRow (pCOMMIT NUMBER, pREESTR_ID NUMBER, pNEW_SVED_ID VARCHAR2) RETURN NUMBER;

  /* ���������� ������ �� ������� ���������� �� �������� */
  PROCEDURE SetNarLineID (pCOMMIT NUMBER, pSVED_ID VARCHAR2, pREESTR_ID NUMBER, pNAR_LINE_ID NUMBER);

  /* ������� ��������� ��������� */
  PROCEDURE DelTitle(pCOMMIT NUMBER, pID VARCHAR2);

  -- �������� �������� ���������� �������� ��� ��������
  FUNCTION GET_PASP_VALUE_AS_NUM (pSVED_ID VARCHAR2, pKODIF_ID NUMBER, pKODIF_TAG VARCHAR2) RETURN NUMBER;
  FUNCTION GET_PASP_VALUE_AS_CHAR (pSVED_ID VARCHAR2, pKODIF_ID NUMBER, pKODIF_TAG VARCHAR2) RETURN VARCHAR2;

  -- ��������� �������� ���������� �������� ��� ��������
  PROCEDURE SET_PASP_VALUE (pSVED_ID VARCHAR2, pKODIF_ID NUMBER, pKODIF_TAG VARCHAR2, pQUAL VARCHAR2);

  -- ����������� ��� �� ������/����������, ����������� � ��������
  FUNCTION GET_MIN_OSTAT_VES (pLOAD_TYPE_ID NUMBER, pID_GROUP_NPR VARCHAR2) RETURN NUMBER;

  /* �������� ������ �� ������������
     ������������ �������� - ����� ��������, � ������� ������ ����� ��� ���� */
  FUNCTION CHECK_UNIQ (pLOAD_TYPE_ID NUMBER, pNUM_CIST VARCHAR2, pID NUMBER, pDATE DATE) RETURN NUMBER;

END;

/

