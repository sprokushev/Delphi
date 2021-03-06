--
-- V_BILL_POS  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_BILL_POS
(NOM_DOK, BILL_POS_ID, VES, CENA_BN, CENA, 
 SUMMA_BN, SUMMA_AKCIZ, SUMMA_NDS20, SUMMA_GSM25, SUMMA, 
 CENA_POKUP, SUMMA_BN_POKUP, SUMMA_NDS20_POKUP, SUMMA_GSM25_POKUP, DATE_REALIZ, 
 ID_OLD, PROD_ID_NPR, OWNERSHIP_ID, ANALIT_ID, NACENKA)
AS 
SELECT /*+ ALL_ROWS INDEX(BILL_POS BILL_POS_DATE_REALIZ) */
  -- ������� ������-������ �� ��������� �������
  BILL_POS.NOM_DOK,
  BILL_POS.BILL_POS_ID,
  BILL_POS.VES,
  BILL_POS.CENA_BN,
  BILL_POS.CENA,
  BILL_POS.SUMMA_BN,
  BILL_POS.SUMMA_AKCIZ,
  BILL_POS.SUMMA_NDS20,
  BILL_POS.SUMMA_GSM25,
  BILL_POS.SUMMA,
  BILL_POS.CENA_POKUP,
  BILL_POS.SUMMA_BN_POKUP,
  BILL_POS.SUMMA_NDS20_POKUP,
  BILL_POS.SUMMA_GSM25_POKUP,
  BILL_POS.DATE_REALIZ,
  BILL_POS.ID_OLD,
  BILL_POS.PROD_ID_NPR,
  BILL_POS.OWNERSHIP_ID,
  BILL_POS.ANALIT_ID,
  BILL_POS.NACENKA
FROM BILL_POS,BILLS_PRIMARY
WHERE BILL_POS.DATE_REALIZ BETWEEN BILLS_PRIMARY.BEGIN_DATE AND BILLS_PRIMARY.END_DATE
AND BILLS_PRIMARY.PRIMARY_APPL='FIN_SNP'
AND BILL_POS.IS_LUK=1
AND BILL_POS.IS_AGENT<3
UNION ALL
SELECT /*+ ALL_ROWS INDEX(BILL_POS BILL_POS_DATE_REALIZ) */
  -- ������� ������-������ �� ��������� �������
  BILL_POS.NOM_DOK,
  BILL_POS.BILL_POS_ID,
  BILL_POS.VES,
  BILL_POS.CENA_BN,
  BILL_POS.CENA,
  BILL_POS.SUMMA_BN,
  BILL_POS.SUMMA_AKCIZ,
  BILL_POS.SUMMA_NDS20,
  BILL_POS.SUMMA_GSM25,
  BILL_POS.SUMMA,
  BILL_POS.CENA_POKUP,
  BILL_POS.SUMMA_BN_POKUP,
  BILL_POS.SUMMA_NDS20_POKUP,
  BILL_POS.SUMMA_GSM25_POKUP,
  BILL_POS.DATE_REALIZ,
  BILL_POS.ID_OLD,
  BILL_POS.PROD_ID_NPR,
  BILL_POS.OWNERSHIP_ID,
  BILL_POS.ANALIT_ID,
  BILL_POS.NACENKA
FROM BILL_POS,BILLS_PRIMARY
WHERE BILL_POS.DATE_REALIZ BETWEEN BILLS_PRIMARY.BEGIN_DATE AND BILLS_PRIMARY.END_DATE
AND BILLS_PRIMARY.PRIMARY_APPL='FIN_UNP'
--AND BILL_POS.IS_LUK=1
UNION ALL
SELECT /*+ ALL_ROWS INDEX(BILL_POS BILL_POS_DATE_REALIZ) */
  -- ������� ������-������ �� ��������� �������, ������� ��� ��� � R3
  BILL_POS.NOM_DOK,
  BILL_POS.BILL_POS_ID,
  BILL_POS.VES,
  BILL_POS.CENA_BN,
  BILL_POS.CENA,
  BILL_POS.SUMMA_BN,
  BILL_POS.SUMMA_AKCIZ,
  BILL_POS.SUMMA_NDS20,
  BILL_POS.SUMMA_GSM25,
  BILL_POS.SUMMA,
  BILL_POS.CENA_POKUP,
  BILL_POS.SUMMA_BN_POKUP,
  BILL_POS.SUMMA_NDS20_POKUP,
  BILL_POS.SUMMA_GSM25_POKUP,
  BILL_POS.DATE_REALIZ,
  BILL_POS.ID_OLD,
  BILL_POS.PROD_ID_NPR,
  BILL_POS.OWNERSHIP_ID,
  BILL_POS.ANALIT_ID,
  BILL_POS.NACENKA
FROM BILL_POS,BILLS_PRIMARY
WHERE BILL_POS.DATE_REALIZ BETWEEN BILLS_PRIMARY.BEGIN_DATE AND BILLS_PRIMARY.END_DATE
AND BILLS_PRIMARY.PRIMARY_APPL='R3'
AND BILL_POS.IS_LUK=1
AND BILL_POS.IS_AGENT<3
AND NOT EXISTS (SELECT NULL FROM R3_BILLS WHERE R3_BILLS.NOM_DOK=BILL_POS.NOM_DOK)
UNION ALL
SELECT /*+ ALL_ROWS INDEX(R3_BILL_POS R3_BILL_POS_DATE_REALIZ) INDEX(R3_BILLS R3_BILLS_NOM_DOK_I) */
  -- ������� ������-������ �� R3
  R3_BILL_POS.NOM_DOK,
  R3_BILL_POS.R3_BILL_POS_ID,
  R3_BILL_POS.VES,
  R3_BILL_POS.CENA_BN,
  R3_BILL_POS.CENA,
  R3_BILL_POS.SUMMA_BN,
  R3_BILL_POS.SUMMA_AKCIZ,
  R3_BILL_POS.SUMMA_NDS,
  0 AS SUMMA_GSM25,
  R3_BILL_POS.SUMMA,
  0 AS CENA_POKUP,
  0 AS SUMMA_BN_POKUP,
  0 AS SUMMA_NDS20_POKUP,
  0 AS SUMMA_GSM25_POKUP,
  R3_BILL_POS.DATE_REALIZ,
  0 AS ID_OLD,
  R3_BILL_POS.PROD_ID_NPR,
  R3_BILL_POS.OWNERSHIP_ID,
  0 AS ANALIT_ID,
  0 as NACENKA
FROM R3_BILL_POS, R3_BILLS, BILLS_PRIMARY
WHERE R3_BILL_POS.DATE_REALIZ BETWEEN BILLS_PRIMARY.BEGIN_DATE AND BILLS_PRIMARY.END_DATE
AND BILLS_PRIMARY.PRIMARY_APPL='R3'
AND R3_BILL_POS.IS_AGENT<3
AND R3_BILL_POS.NOM_DOK=R3_BILLS.NOM_DOK;


