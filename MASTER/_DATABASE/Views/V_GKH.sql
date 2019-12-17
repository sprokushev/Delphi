--
-- V_GKH  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_GKH
(KVIT_ID, NUM_CIST, SVED_NUM, DATE_OTGR, DATE_KVIT, 
 DATE_OFORML, PLAT_NAME, POLUCH_NAME, NAME_NPR, VES)
AS 
SELECT
  KVIT.ID,
  KVIT.NUM_CIST,
  KVIT.SVED_NUM,
  KVIT.DATE_OTGR,
  KVIT.DATE_KVIT,
  KVIT.DATE_OFORML,
  NPO_PLAT.PREDPR_NAME AS PLAT_NAME,
  POLUCH.PREDPR_NAME AS POLUCH_NAME,
  KLS_PROD.NAME_NPR,
  KVIT.VES_BRUTTO AS VES
FROM KVIT,MONTH,KLS_REGION,KLS_PREDPR NPO_PLAT,KLS_DOG NPO_DOG, KLS_PREDPR POLUCH, KLS_PROD, KLS_DOG LUK_DOG
WHERE KVIT.NOM_ZD=MONTH.NOM_ZD
  AND MONTH.DOG_ID=LUK_DOG.ID
  AND LUK_DOG.IS_AGENT=2
  AND MONTH.GOSPROG_ID=50
  AND MONTH.PLANSTRU_ID<>78
  AND MONTH.NPODOG_ID=NPO_DOG.ID (+)
  AND MONTH.POLUCH_ID=POLUCH.ID
  AND NPO_DOG.PREDPR_ID=NPO_PLAT.ID
  AND NPO_PLAT.REGION_ID=KLS_REGION.ID
  AND KVIT.PROD_ID_NPR=KLS_PROD.ID_NPR;

