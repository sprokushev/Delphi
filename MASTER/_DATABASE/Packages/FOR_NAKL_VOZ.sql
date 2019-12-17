--
-- FOR_NAKL_VOZ  (Package) 
--
CREATE OR REPLACE PACKAGE MASTER.FOR_NAKL_VOZ AS

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
       pNAKL_NUM NUMBER, pNAKL_DATE DATE, pFORMNAKL_ID NUMBER,pSHABVOZ_ID NUMBER, pOPERNALIV_ID NUMBER, pPROD_ID_NPR VARCHAR2 DEFAULT NULL)
    RETURN NUMBER;

  /* ��������/�������� ������� ��������� */
  PROCEDURE AddRow(pCOMMIT NUMBER, pID NUMBER, pNAKL_ID NUMBER, pNAKL_POS NUMBER);

  /* ����������� ������� ��������� � ������ ���������
     ������������ �������� - ID ������� ��������� ��� NULL - ���� ������ �� ������� */
  FUNCTION MoveRow (pCOMMIT NUMBER, pREESTR_ID NUMBER, pNEW_NAKL_ID NUMBER) RETURN NUMBER;
/* ��������/�������� ������ ��������� �� �������*/
  FUNCTION AddShabVoz(pCommit NUMBER,pId NUMBER,pStanotp_id NUMBER,pTex_pd_id NUMBER,pGrotp_id NUMBER,
		  			 pStan_id NUMBER,pVetka_id NUMBER,pPoluch_id NUMBER,pFlg_forma_2 NUMBER,
		   			 pProd_id_npr VARCHAR2,pPrim VARCHAR2,pGr4 VARCHAR2,pK_tar VARCHAR2,pInput_date DATE,
					 pTransport VARCHAR2,pIs_exp NUMBER,pExped_id NUMBER,pGu12_a_id NUMBER,pVzisk_id NUMBER,
					 pGrotp_bank VARCHAR2,pGrotp_rs VARCHAR2,pTex_pd_bank VARCHAR2,pTtex_pd_rs VARCHAR2,
					 pShab_num NUMBER,pShab_date DATE) RETURN NUMBER;
  FUNCTION get_next_num RETURN NUMBER;					 
END;
/

