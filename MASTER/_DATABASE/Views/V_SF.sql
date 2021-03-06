--
-- V_SF  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_SF
(NOM_SF, NOM_DOK, DATE_VYP_SF, VES, VES_BRUTTO, 
 KOL, DOG_NUMBER, SHORT_NAME, NAME_STAN, NAME_POLUCH, 
 ABBR_NPR, NOM_ZD, LOAD_TYPE_ID, SUMMA_DOK, PROD_SUM, 
 ID_NPR, ID_GROUP_NPR, DOG_ID, PLAT_ID, POLUCH_ID, 
 STAN_KOD, GROTP_ID, NPR_SOBSTV_ID, DATE_KVIT, KOL_DN, 
 DATE_PLAT)
AS 
SELECT /*+ ORDERED USE_NL(KVIT,POLUCH,MONTH,KLS_DOG,PLAT,KLS_STAN,KLS_GDOR,KLS_PROD,KLS_VID_OTGR,BILLS) */
       /* RULE */
  BILLS.NOM_SF,
  BILLS.NOM_DOK,
  BILLS.DATE_VYP_SF,
  SUM(KVIT.VES) AS ves,
  SUM(KVIT.VES_BRUTTO) AS ves_brutto,
  COUNT(KVIT.VES) AS kol,
  KLS_DOG.DOG_NUMBER,
  PLAT.SHORT_NAME,
  KLS_STAN.STAN_NAME || ' ' || KLS_GDOR.SHORT_NAME AS name_stan,
  poluch.PREDPR_NAME || ' ' || MONTH.gr4 AS name_poluch,
  KLS_PROD.ABBR_NPR,
  BILLS.nom_zd,
  KLS_VID_OTGR.load_type_id,
  BILLS.SUMMA_DOK,
  BILLS.PROD_SUM,
  KLS_PROD.ID_NPR,
  KLS_PROD.ID_GROUP_NPR,
  KLS_DOG.ID,
  plat.ID AS plat_id,
  poluch.ID AS poluch_id,
  KLS_STAN.STAN_KOD,
  MONTH.GROTP_ID,
  MONTH.NPR_SOBSTV_ID,
  BILLS.DATE_KVIT,
  BILLS.KOL_DN,
  BILLS.DATE_PLAT
FROM
  KVIT,/*V_USER_BILLS*/ BILLS,MONTH,KLS_DOG,KLS_PREDPR PLAT,KLS_PREDPR POLUCH,
  KLS_STAN,KLS_GDOR,KLS_PROD,KLS_VID_OTGR
WHERE
  (POLUCH.ID(+) = MONTH.POLUCH_ID) AND
  (MONTH.NOM_ZD(+) = BILLS.NOM_ZD) AND
  (KLS_DOG.ID = BILLS.DOG_ID) AND
  (PLAT.ID = KLS_DOG.PREDPR_ID) AND
  (KLS_STAN.ID(+) = MONTH.STAN_ID) AND
  (KLS_GDOR.ID(+) = KLS_STAN.GDOR_ID) AND
  (KLS_PROD.ID_NPR=BILLS.PROD_ID_NPR) AND
  (KLS_VID_OTGR.load_abbr(+)=MONTH.load_abbr) AND
  (BILLS.nom_dok=KVIT.bill_id(+) /*AND BILLS.PROD_ID_NPR=KVIT.PROD_ID_NPR(+)*/)
GROUP BY
  BILLS.NOM_SF,
  BILLS.NOM_DOK,
  BILLS.DATE_VYP_SF,
  KLS_DOG.DOG_NUMBER,
  PLAT.SHORT_NAME,
  KLS_STAN.STAN_NAME || ' ' || KLS_GDOR.SHORT_NAME,
  poluch.PREDPR_NAME || ' ' || MONTH.gr4,
  KLS_PROD.ABBR_NPR,
  BILLS.nom_zd,
  KLS_VID_OTGR.load_type_id,
  BILLS.SUMMA_DOK,
  BILLS.PROD_SUM,
  KLS_PROD.ID_NPR,
  KLS_PROD.ID_GROUP_NPR,
  KLS_DOG.ID,
  plat.ID,
  poluch.ID,
  KLS_STAN.STAN_KOD,
  MONTH.GROTP_ID,
  MONTH.NPR_SOBSTV_ID,
  BILLS.DATE_KVIT,
  BILLS.KOL_DN,
  BILLS.DATE_PLAT;


