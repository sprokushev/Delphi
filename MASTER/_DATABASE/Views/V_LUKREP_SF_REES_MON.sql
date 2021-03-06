--
-- V_LUKREP_SF_REES_MON  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_LUKREP_SF_REES_MON
(NUM_5_DAY, IS_AGENT, SOBSTV, PLAT_ID, PLAT_INN, 
 PLAT_NAME, PLAT_ADDR, DOG_ID, DOG_NUMBER, DOG_DATE, 
 NOM_DOK, NOM_SF, ORIG_NOM_SF, OLD_NOM_SF, NPO_SF, 
 NOM_SCH, DATE_VYP_SF, NOM_AKT, DATE_AKT, PROD_ID_NPR, 
 PROD_NAME, VES, PROD_EDIZ, NUM_KVIT, NUM_DOVER, 
 NUM_KVIT_STR, DATE_KVIT, DATE_MOS, NUM_PASP, NUM_STRAH, 
 CENA_BN, CENA, SUMMA_PROD_BN, SUMMA_PROD_NDS, SUMMA_PROD, 
 SUMMA_AGEN, SUMMA_AGEN_NDS, SUMMA_VOZN_11, SUMMA_VOZN_11_NDS, SUMMA_VOZN_12, 
 SUMMA_VOZN_12_NDS, SUMMA_TARIF, SUMMA_TARIF_NDS, SUMMA_STRAH, SUMMA_DOK, 
 SUMMA_DOK_NDS, PRICE_PROTOKOL, HRAN_ID, HRAN_NAME, KOL_DN)
AS 
SELECT "NUM_5_DAY","IS_AGENT","SOBSTV","PLAT_ID","PLAT_INN","PLAT_NAME","PLAT_ADDR","DOG_ID","DOG_NUMBER","DOG_DATE",
"NOM_DOK","NOM_SF","ORIG_NOM_SF","OLD_NOM_SF","NPO_SF","NOM_SCH","DATE_VYP_SF","NOM_AKT","DATE_AKT","PROD_ID_NPR",
"PROD_NAME","VES","PROD_EDIZ","NUM_KVIT","NUM_DOVER","NUM_KVIT_STR","DATE_KVIT","DATE_MOS","NUM_PASP","NUM_STRAH",
"CENA_BN","CENA","SUMMA_PROD_BN","SUMMA_PROD_NDS","SUMMA_PROD","SUMMA_AGEN","SUMMA_AGEN_NDS",
"SUMMA_VOZN_11", "SUMMA_VOZN_11_NDS", "SUMMA_VOZN_12", "SUMMA_VOZN_12_NDS",
"SUMMA_TARIF","SUMMA_TARIF_NDS","SUMMA_STRAH","SUMMA_DOK","SUMMA_DOK_NDS","PRICE_PROTOKOL","HRAN_ID","HRAN_NAME","KOL_DN" FROM V_LUKREP_SF_REES_NEW;


