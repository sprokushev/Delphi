--
-- V_USER_MONTH  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_USER_MONTH
(NOM_ZD, STANOTP_ID, NPR_SOBSTV_ID, STAN_ID, VETKA_ID, 
 POLUCH_ID, TEX_PD_ID, NAZN_OTG_ID, LOAD_ABBR, DOG_ID, 
 USL_NUMBER, GOSPROG_ID, PROD_ID_NPR, TONN_DECLARED, TONN_LOADED, 
 CIST_DECLARED, CIST_LOADED, FLG_ALLOW_8_AXES, FLG_UPPER_SLIV, FLG_DOP_CIST, 
 FLG_FORMA_2, FLG_OBOGR, DATE_PLAN, PRIM, CENA, 
 CENA_OTP, SUM_ZD, GR4, K_TAR, INPUT_DATE, 
 UPDATE_DATE, TARIF1TONN, POTREB_ID, PLANSTRU_ID, NPODOG_ID, 
 GROTP_ID, DATE_CEN, GP_NAPR_ID, TONN_R, CIST_R, 
 TRANSPORT, IS_EXP, SUPPLIER_ID, APPL_TAG, CENA_NPO, 
 CENA_OTP_NPO, KOL_DN_NPO, TONN_RAZNAR, CIST_RAZNAR, ZAKAZ_ID, 
 EXPED_ID, GU12_A_ID, ZAKAZ_HIST_ID, POKUP_DOG_ID, POKUP_USL_NUMBER, 
 NAPR_POST_ID, CIST_FACT, TONN_FACT, AFTER_2005, IS_AGENT)
AS 
SELECT MONTH.NOM_ZD, MONTH.STANOTP_ID, MONTH.NPR_SOBSTV_ID, MONTH.STAN_ID, MONTH.VETKA_ID,
 MONTH.POLUCH_ID, MONTH.TEX_PD_ID, MONTH.NAZN_OTG_ID, MONTH.LOAD_ABBR, MONTH.DOG_ID,
 MONTH.USL_NUMBER, MONTH.GOSPROG_ID, MONTH.PROD_ID_NPR, MONTH.TONN_DECLARED, MONTH.TONN_LOADED,
 MONTH.CIST_DECLARED, MONTH.CIST_LOADED, MONTH.FLG_ALLOW_8_AXES, MONTH.FLG_UPPER_SLIV, MONTH.FLG_DOP_CIST,
 MONTH.FLG_FORMA_2, MONTH.FLG_OBOGR, MONTH.DATE_PLAN, MONTH.PRIM, MONTH.CENA,
 MONTH.CENA_OTP, MONTH.SUM_ZD, MONTH.GR4, MONTH.K_TAR, MONTH.INPUT_DATE,
 MONTH.UPDATE_DATE, MONTH.TARIF1TONN, MONTH.POTREB_ID, MONTH.PLANSTRU_ID, MONTH.NPODOG_ID,
 MONTH.GROTP_ID, MONTH.DATE_CEN, MONTH.GP_NAPR_ID, MONTH.TONN_R, MONTH.CIST_R,
 MONTH.TRANSPORT, MONTH.IS_EXP, MONTH.SUPPLIER_ID, MONTH.APPL_TAG, MONTH.CENA_NPO,
 MONTH.CENA_OTP_NPO, MONTH.KOL_DN_NPO, MONTH.TONN_RAZNAR, MONTH.CIST_RAZNAR, MONTH.ZAKAZ_ID,
 MONTH.EXPED_ID, MONTH.GU12_A_ID, MONTH.ZAKAZ_HIST_ID, MONTH.POKUP_DOG_ID, MONTH.POKUP_USL_NUMBER,
 MONTH.NAPR_POST_ID, MONTH.CIST_FACT, MONTH.TONN_FACT,0 as AFTER_2005,KLS_DOG.IS_AGENT
FROM MONTH,KLS_DOG
WHERE MONTH.DOG_ID=KLS_DOG.ID
  AND DATE_PLAN<TO_DATE('01.01.2005','dd.mm.yyyy')
UNION ALL
SELECT MONTH.NOM_ZD, MONTH.STANOTP_ID, MONTH.NPR_SOBSTV_ID, MONTH.STAN_ID, MONTH.VETKA_ID,
 MONTH.POLUCH_ID, MONTH.TEX_PD_ID, MONTH.NAZN_OTG_ID, MONTH.LOAD_ABBR, MONTH.DOG_ID,
 MONTH.USL_NUMBER, MONTH.GOSPROG_ID, MONTH.PROD_ID_NPR, MONTH.TONN_DECLARED, MONTH.TONN_LOADED,
 MONTH.CIST_DECLARED, MONTH.CIST_LOADED, MONTH.FLG_ALLOW_8_AXES, MONTH.FLG_UPPER_SLIV, MONTH.FLG_DOP_CIST,
 MONTH.FLG_FORMA_2, MONTH.FLG_OBOGR, MONTH.DATE_PLAN, MONTH.PRIM, MONTH.CENA,
 MONTH.CENA_OTP, MONTH.SUM_ZD, MONTH.GR4, MONTH.K_TAR, MONTH.INPUT_DATE,
 MONTH.UPDATE_DATE, MONTH.TARIF1TONN, MONTH.POTREB_ID, MONTH.PLANSTRU_ID, MONTH.NPODOG_ID,
 MONTH.GROTP_ID, MONTH.DATE_CEN, MONTH.GP_NAPR_ID, MONTH.TONN_R, MONTH.CIST_R,
 MONTH.TRANSPORT, MONTH.IS_EXP, MONTH.SUPPLIER_ID, MONTH.APPL_TAG, MONTH.CENA_NPO,
 MONTH.CENA_OTP_NPO, MONTH.KOL_DN_NPO, MONTH.TONN_RAZNAR, MONTH.CIST_RAZNAR, MONTH.ZAKAZ_ID,
 MONTH.EXPED_ID, MONTH.GU12_A_ID, MONTH.ZAKAZ_HIST_ID, MONTH.POKUP_DOG_ID, MONTH.POKUP_USL_NUMBER,
 MONTH.NAPR_POST_ID, MONTH.CIST_FACT, MONTH.TONN_FACT,1 as AFTER_2005,KLS_DOG.IS_AGENT
FROM MONTH,KLS_DOG
WHERE MONTH.DOG_ID=KLS_DOG.ID
  AND DATE_PLAN>=TO_DATE('01.01.2005','dd.mm.yyyy')
  AND (FOR_INIT.AppUserUnp=1 OR KLS_DOG.PREDPR_ID=2641);


