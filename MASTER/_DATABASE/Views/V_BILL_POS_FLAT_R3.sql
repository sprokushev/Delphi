--
-- V_BILL_POS_FLAT_R3  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_BILL_POS_FLAT_R3
(NOM_DOK, IS_AGENT, DATE_REALIZ, VES, CENA_BN, 
 SUMMA_BN, SUMMA_AKCIZ, SUMMA_PROD_BN, SUMMA_PROD_NDS, CENA, 
 SUMMA_PROD, TARIF_BN, TARIF_NDS, TARIF, TARIF_GUARD_BN, 
 TARIF_GUARD_NDS, TARIF_GUARD, VOZN11_BN, VOZN11_NDS, VOZN11, 
 VOZN12_BN, VOZN12_NDS, VOZN12, STRAH, NACENKA)
AS 
SELECT /*+ ALL_ROWS INDEX(BILL_POS BILL_POS_DATE_REALIZ) */
  -- ����� �� ��������� �������, ������� ��� � R3
  NOM_DOK,
  IS_AGENT,
  DATE_REALIZ,
  SUM(DECODE(SIGN(BILL_POS_ID-10),-1,VES,0)) AS VES,
  MAX(DECODE(SIGN(BILL_POS_ID-10),-1,CENA_BN,0)) AS CENA_BN,
  SUM(DECODE(SIGN(BILL_POS_ID-10),-1,SUMMA_BN,0)) AS SUMMA_BN,
  SUM(DECODE(SIGN(BILL_POS_ID-10),-1,SUMMA_AKCIZ,0)) AS SUMMA_AKCIZ,
  SUM(DECODE(SIGN(BILL_POS_ID-10),-1,SUMMA_BN+SUMMA_AKCIZ,0)) AS SUMMA_PROD_BN,
  SUM(DECODE(SIGN(BILL_POS_ID-10),-1,SUMMA_NDS20,0)) AS SUMMA_PROD_NDS,
  MAX(DECODE(SIGN(BILL_POS_ID-10),-1,CENA,0)) AS CENA,
  SUM(DECODE(SIGN(BILL_POS_ID-10),-1,SUMMA,0)) AS SUMMA_PROD,
  SUM(DECODE(BILL_POS_ID,10,SUMMA_BN,0)) AS TARIF_BN,
  SUM(DECODE(BILL_POS_ID,10,SUMMA_NDS20,0)) AS TARIF_NDS,
  SUM(DECODE(BILL_POS_ID,10,SUMMA,0)) AS TARIF,
  SUM(DECODE(BILL_POS_ID,13,SUMMA_BN,0)) AS TARIF_GUARD_BN,
  SUM(DECODE(BILL_POS_ID,13,SUMMA_NDS20,0)) AS TARIF_GUARD_NDS,
  SUM(DECODE(BILL_POS_ID,13,SUMMA,0)) AS TARIF_GUARD,
  SUM(DECODE(BILL_POS_ID,11,SUMMA_BN,0)) AS VOZN11_BN,
  SUM(DECODE(BILL_POS_ID,11,SUMMA_NDS20,0)) AS VOZN11_NDS,
  SUM(DECODE(BILL_POS_ID,11,SUMMA,0)) AS VOZN11,
  SUM(DECODE(BILL_POS_ID,12,SUMMA_BN,0)) AS VOZN12_BN,
  SUM(DECODE(BILL_POS_ID,12,SUMMA_NDS20,0)) AS VOZN12_NDS,
  SUM(DECODE(BILL_POS_ID,12,SUMMA,0)) AS VOZN12,
  SUM(DECODE(BILL_POS_ID,20,SUMMA,0)) AS STRAH,
  MAX(DECODE(BILL_POS_ID,20,NACENKA,0)) AS NACENKA
FROM BILL_POS,BILLS_PRIMARY
WHERE BILL_POS.DATE_REALIZ BETWEEN BILLS_PRIMARY.BEGIN_DATE AND BILLS_PRIMARY.END_DATE
AND BILLS_PRIMARY.PRIMARY_APPL='R3'
AND BILL_POS.IS_LUK=1
AND BILL_POS.IS_AGENT<3
AND NOT EXISTS (SELECT NULL FROM R3_BILLS WHERE R3_BILLS.NOM_DOK=BILL_POS.NOM_DOK)
GROUP BY
  NOM_DOK,
  IS_AGENT,
  DATE_REALIZ
UNION ALL
SELECT /*+ ALL_ROWS INDEX(R3_BILL_POS R3_BILL_POS_DATE_REALIZ)*/
  -- ����� �� R3
  R3_BILL_POS.NOM_DOK,
  R3_BILL_POS.IS_AGENT,
  R3_BILL_POS.DATE_REALIZ,
  SUM(DECODE(SIGN(R3_BILL_POS_ID-10),-1,R3_BILL_POS.VES,0)) AS VES,
  MAX(DECODE(SIGN(R3_BILL_POS_ID-10),-1,CENA_BN,0)) AS CENA_BN,
  SUM(DECODE(SIGN(R3_BILL_POS_ID-10),-1,SUMMA_BN,0)) AS SUMMA_BN,
  SUM(DECODE(SIGN(R3_BILL_POS_ID-10),-1,R3_BILL_POS.SUMMA_AKCIZ,0)) AS SUMMA_AKCIZ,
  SUM(DECODE(SIGN(R3_BILL_POS_ID-10),-1,SUMMA_BN+R3_BILL_POS.SUMMA_AKCIZ,0)) AS SUMMA_PROD_BN,
  SUM(DECODE(SIGN(R3_BILL_POS_ID-10),-1,SUMMA_NDS,0)) AS SUMMA_PROD_NDS,
  MAX(DECODE(SIGN(R3_BILL_POS_ID-10),-1,CENA,0)) AS CENA,
  SUM(DECODE(SIGN(R3_BILL_POS_ID-10),-1,SUMMA,0)) AS SUMMA_PROD,
  SUM(DECODE(R3_BILL_POS_ID,10,SUMMA_BN,0)) AS TARIF_BN,
  SUM(DECODE(R3_BILL_POS_ID,10,SUMMA_NDS,0)) AS TARIF_NDS,
  SUM(DECODE(R3_BILL_POS_ID,10,SUMMA,0)) AS TARIF,
  SUM(DECODE(R3_BILL_POS_ID,13,SUMMA_BN,0)) AS TARIF_GUARD_BN,
  SUM(DECODE(R3_BILL_POS_ID,13,SUMMA_NDS,0)) AS TARIF_GUARD_NDS,
  SUM(DECODE(R3_BILL_POS_ID,13,SUMMA,0)) AS TARIF_GUARD,
  SUM(DECODE(R3_BILL_POS_ID,11,SUMMA_BN,0)) AS VOZN11_BN,
  SUM(DECODE(R3_BILL_POS_ID,11,SUMMA_NDS,0)) AS VOZN11_NDS,
  SUM(DECODE(R3_BILL_POS_ID,11,SUMMA,0)) AS VOZN11,
  SUM(DECODE(R3_BILL_POS_ID,12,SUMMA_BN,0)) AS VOZN12_BN,
  SUM(DECODE(R3_BILL_POS_ID,12,SUMMA_NDS,0)) AS VOZN12_NDS,
  SUM(DECODE(R3_BILL_POS_ID,12,SUMMA,0)) AS VOZN12,
  SUM(DECODE(R3_BILL_POS_ID,20,SUMMA,0)) AS STRAH,
  0 AS NACENKA
FROM R3_BILL_POS,R3_BILLS,BILLS_PRIMARY
WHERE R3_BILL_POS.DATE_REALIZ BETWEEN BILLS_PRIMARY.BEGIN_DATE AND BILLS_PRIMARY.END_DATE
AND BILLS_PRIMARY.PRIMARY_APPL='R3'
AND R3_BILL_POS.IS_AGENT<3
AND R3_BILL_POS.NOM_DOK=R3_BILLS.NOM_DOK
GROUP BY
  R3_BILL_POS.NOM_DOK,
  R3_BILL_POS.IS_AGENT,
  R3_BILL_POS.DATE_REALIZ;


