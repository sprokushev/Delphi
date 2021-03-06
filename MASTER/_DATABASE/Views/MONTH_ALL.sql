--
-- MONTH_ALL  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.MONTH_ALL
(KLS_PREDPR_ID, KLS_DOG_ID, KLS_PROD_ID, DATE_DOG, REQUEST, 
 DATE_PLAN, STAN_ID, ID, INPUT_DATE, IS_WORK, 
 PRICH, INPUT_NUMBER, PAYFORM_ID, LOAD_ABBR, VETKA_ID, 
 GR4, POLUCH_ID, POTREB_ID, USL_OPL_ID, ORGSTRU_ID, 
 PRICE, POLUCH_NAME, POTREB_NAME, PARUS_RN, PRICE_POK, 
 PRICE_REAL, PARUS_AGENT_RN, PARUS_AGENT_TAG, PARUS_AGENT_NAME, PARUS_DOGOVOR, 
 PARUS_NOMEN_RN, PARUS_NOMEN_TAG, PARUS_NOMEN_NAME, PARUS_MODIF_RN, PARUS_MODIF_TAG, 
 PARUS_MODIF_NAME, APPL_TAG, IS_REQUESTED, EXECUTED, KLS_PLANSTRUID, 
 STORE_NAME, NOM_ZD, IS_AGENT, TYPE_ZAKAZ_ID, CLIENT_NUMBER, 
 CLIENT_DATE, STATUS_ZAKAZ_ID, KOL, SPEED_VES, SPEED_KOL, 
 MON_VES, MON_KOL, BEGIN_DATE, ZAKAZ_OLD_ID)
AS 
select 
  PLAT_ID as KLS_PREDPR_ID, 
  DOG_ID as KLS_DOG_ID, 
  TO_NUMBER(PROD_ID_NPR) as KLS_PROD_ID, 
  NULL as DATE_DOG, 
  VES as REQUEST, 
  DATE_PLAN, 
  STAN_ID, 
  ID, 
  INPUT_DATE, 
  1 as IS_WORK, 
  PRIM as PRICH, 
  INPUT_NUMBER, 
  PAYFORM_ID, 
  LOAD_ABBR, 
  VETKA_ID, 
  GR4, 
  POLUCH_ID, 
  POTREB_ID, 
  USL_OPL_ID, 
  FILIAL_ID as ORGSTRU_ID, 
  PRICE, 
  POTREB_NAME as POLUCH_NAME, 
  POTREB_NAME, 
  NULL as PARUS_RN, 
  0 as PRICE_POK, 
  0 as PRICE_REAL, 
  NULL as PARUS_AGENT_RN, 
  NULL as PARUS_AGENT_TAG, 
  NULL as PARUS_AGENT_NAME, 
  NULL as PARUS_DOGOVOR, 
  NULL as PARUS_NOMEN_RN, 
  NULL as PARUS_NOMEN_TAG, 
  NULL as PARUS_NOMEN_NAME, 
  NULL as PARUS_MODIF_RN, 
  NULL as PARUS_MODIF_TAG, 
  NULL as PARUS_MODIF_NAME, 
  'MASTER' as APPL_TAG, 
  IS_ACCEPT as IS_REQUESTED, 
  FACT_VES as EXECUTED, 
  PLANSTRU_ID as KLS_PLANSTRUID, 
  NEFTEBASA as STORE_NAME, 
  NOM_ZD_LIST as NOM_ZD, 
  IS_AGENT, 
  NULL as TYPE_ZAKAZ_ID, 
  CLIENT_NUMBER, 
  CLIENT_DATE, 
  10 as STATUS_ZAKAZ_ID, 
  KOL, 
  SPEED_VES, 
  SPEED_KOL, 
  LOAD_VES as MON_VES, 
  LOAD_KOL as MON_KOL, 
  BEGIN_DATE, 
  ZAKAZ_PREV_ID as ZAKAZ_OLD_ID 
from zakaz;


