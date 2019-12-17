--
-- FOR_NAKL  (Package) 
--
CREATE OR REPLACE PACKAGE MASTER.FOR_NAKL AS

/* ��������� */

  -- ������������ ����� ������� ���������
  FUNCTION GetMaxNumPos(pNAKL_ID NUMBER) RETURN NUMBER;

  -- ������������ ����� ������� � ������� TEMP_NAKL
  FUNCTION GetTempMaxNumPos RETURN NUMBER;

  /* ������� ������� ��������� */
  PROCEDURE DelRow(pCOMMIT NUMBER, pID NUMBER);

  /* ������� ��������� ��������� */
  PROCEDURE DelTitle(pCOMMIT NUMBER, pID NUMBER);

  /* �������� ��������� ������� TEMP_NAKL */
  PROCEDURE EMPTY_TEMP_NAKL;

  /* �������������� ���������� ��������� ������� TEMP_NAKL */
  PROCEDURE FILL_TEMP_NAKL (pNAKL_ID NUMBER, pSRC_REESTR_ID NUMBER, pMESTO_ID NUMBER, pLOAD_TYPE_ID NUMBER);

  /* �������� ������ � ������� TEMP_NAKL */
  PROCEDURE ADD_TEMP_NAKL (pREESTR_ID NUMBER);

    /* ������� ������ �� ������� TEMP_NAKL */
  PROCEDURE DEL_TEMP_NAKL (pREESTR_ID NUMBER);

  /* ��������� ������� �� TEMP_NAKL � REESTR */
  PROCEDURE SAVE_TEMP_NAKL (pNAKL_ID NUMBER);

  /* ��������/�������� ��������� ��������� */
  FUNCTION AddTitle(pCOMMIT NUMBER, pID NUMBER, pMESTO_ID NUMBER, pLOAD_TYPE_ID NUMBER,
       pNAKL_NUM NUMBER, pNAKL_DATE DATE, pFORMNAKL_ID NUMBER, pNOM_ZD VARCHAR2, pPROD_ID_NPR VARCHAR2,
	   pOPERNALIV_ID NUMBER, pIS_EXP NUMBER, pDOG_ID NUMBER, pSTAN_ID NUMBER, pK_TAR VARCHAR2, pNUM_KVIT VARCHAR2)
    RETURN NUMBER;

  /* ��������/�������� ������� ��������� */
  PROCEDURE AddRow(pCOMMIT NUMBER, pID NUMBER, pNAKL_ID NUMBER, pNAKL_POS NUMBER);

  /* ����������� ������� ��������� � ������ ���������
     ������������ �������� - ID ������� ��������� ��� NULL - ���� ������ �� ������� */
  FUNCTION MoveRow (pCOMMIT NUMBER, pREESTR_ID NUMBER, pNEW_NAKL_ID NUMBER) RETURN NUMBER;

/* �������� ������ �� ������� ���� ����������� ��� ������ ��������� ���������� */
FUNCTION CHECK_REESTR(pREESTR_ID NUMBER) RETURN NUMBER;

/* �/� ������������ �������� � ������ ����.������� */
FUNCTION GET_GD_NAME_NPR(pGD_NAME_NPR VARCHAR2, pT_VSP NUMBER) RETURN VARCHAR2;

/* �/� ��� �������� � ������ ����.������� */
FUNCTION GET_GD_KOD_NPR(pPROD_GU12_ID VARCHAR2, pT_VSP NUMBER) RETURN VARCHAR2;

/* ��������� ����� (������������) */
FUNCTION GET_AV_KART_NAME(pPROD_ID_NPR VARCHAR2, pPROD_AV_KART NUMBER, pT_VSP NUMBER) RETURN VARCHAR2;

/*���������� ������� ���������� ���������*/
FUNCTION AddShabExp(pCommit NUMBER,pId NUMBER,pFlg_dostup NUMBER,pDog_id NUMBER,pProd_id_npr VARCHAR2,
		 			pStan_id NUMBER,pPrim_dog VARCHAR2,
		 			pOsob1 VARCHAR2,pOsob2 VARCHAR2,pOsob3 VARCHAR2,pOsob4 VARCHAR2,pPol1 VARCHAR2,pPol2 VARCHAR2,
					pPol3 VARCHAR2,pPol4 VARCHAR2,pNeob1 VARCHAR2,pNeob2 VARCHAR2,pNeob3 VARCHAR2,pNeob4 VARCHAR2,
					pStan1 VARCHAR2,pStan2 VARCHAR2,pStan3 VARCHAR2,pStan4 VARCHAR2,pDorst1 VARCHAR2,pDorst2 VARCHAR2,
					pNm_gr1 VARCHAR2,pNm_gr2 VARCHAR2,pNm_gr3 VARCHAR2,pNm_gr4 VARCHAR2,pNm_gr5 VARCHAR2,pNm_gr6 VARCHAR2,
					pNm_gr7 VARCHAR2,pNm_gr8 VARCHAR2,pNm_gr9 VARCHAR2,pPlt_ot1 VARCHAR2,pPlt_ot2 VARCHAR2,pPlt_ot3 VARCHAR2,
					pPlt_ot4 VARCHAR2,pDocs1 VARCHAR2,pDocs2 VARCHAR2,pDocs3 VARCHAR2,pDocs4 VARCHAR2,pTam1 VARCHAR2,
					pTam2 VARCHAR2,pPos33 VARCHAR2,pPos34 VARCHAR2,pPos35 VARCHAR2,pPos36 VARCHAR2,pShtamp1 VARCHAR2,
					pShtamp2 VARCHAR2,pShtamp3 VARCHAR2,pShtamp4 VARCHAR2,pShtamp5 VARCHAR2,pGr1_txt_ex VARCHAR2,pGr2_txt_ex VARCHAR2,
					pMesto_pay VARCHAR2,pCnt_ved NUMBER,pTex_pd_id NUMBER) RETURN NUMBER; 


FUNCTION get_next_num RETURN NUMBER;

PROCEDURE DelShabExp(pCommit NUMBER,pId NUMBER);

END;

/

