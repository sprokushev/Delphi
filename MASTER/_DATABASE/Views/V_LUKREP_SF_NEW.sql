--
-- V_LUKREP_SF_NEW  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_LUKREP_SF_NEW
(NEW_NOM_DOK, NUM_5_DAY, IS_KORR, IS_AGENT, IS_SILOV, 
 SOBSTV, PLAT_ID, PLAT_INN, PLAT_NAME, PLAT_ADDR, 
 DOG_ID, DOG_NUMBER, DOG_DATE, DATE_KVIT, DATE_MOS, 
 DATE_CHN_SOB, NOM_DOK, NOM_SF, ORIG_NOM_SF, OLD_NOM_DOK, 
 OLD_NOM_SF, NPO_SF, DATE_VYP_SF, GR_NPR_ID, GR_NPR_NAME, 
 PROD_ID_NPR, PROD_NAME, PROD_EDIZ, KVIT_ID, VES, 
 VES_KVIT, CNT_KVIT, SVED_NUM, NUM_KVIT, NOM_AKT, 
 NUM_CIST, STANOTP_ID, STAN_NAME, HRAN_ID, HRAN_NAME, 
 POLUCH_ID, POLUCH_NAME, POLUCH_ADDR, IS_SF, CENA_BN, 
 CENA, SUMMA_PROD_BN, SUMMA_PROD_NDS, SUMMA_PROD, SUMMA_AGEN, 
 SUMMA_AGEN_NDS, SUMMA_VOZN_BN, SUMMA_TARIF, SUMMA_TARIF_NDS, SUMMA_OHRANA, 
 SUMMA_OHRANA_NDS, TARIF_MPS, TARIF_KVIT, SUMMA_RAZN_BN, NACENKA, 
 SUMMA_STRAH, SUMMA_DOK, SUMMA_DOK_NDS, PRICE_PROTOKOL, KOL_DN, 
 NAZN_OTG_ID, SNP_PLAT_ID, SNP_PLAT_NAME, RAST, NUM_STRAH, 
 USL_SUM, VAGOWN_TYP_ID, KORR_PROD, STRAH_NOM_SF, STRAH_SUMMA_DOK, 
 VID_USL_ID)
AS 
SELECT /*+ ALL_ROWS */
 TO_CHAR(NOM_DOK) as NEW_NOM_DOK,
 NUM_5_DAY,
 IS_KORR,
 IS_AGENT,
 IS_SILOV,
 SOBSTV,
 PLAT_ID,
 PLAT_INN,
 PLAT_NAME,
 PLAT_ADDR,
 DOG_ID,
 DOG_NUMBER,
 DOG_DATE,
 DATE_KVIT,
 DATE_MOS,
 DATE_CHN_SOB,
 NOM_DOK,
 NOM_SF,
 ORIG_NOM_SF,
 OLD_NOM_DOK,
 OLD_NOM_SF,
 NPO_SF,
 DATE_VYP_SF,
 GR_NPR_ID,
 GR_NPR_NAME,
 PROD_ID_NPR,
 PROD_NAME,
 PROD_EDIZ,
 KVIT_ID,
 VES,
 VES_KVIT,
 CNT_KVIT,
 SVED_NUM,
 NUM_KVIT,
 NOM_AKT,
 NUM_CIST,
 STANOTP_ID,
 STAN_NAME,
 HRAN_ID,
 HRAN_NAME,
 POLUCH_ID,
 POLUCH_NAME,
 POLUCH_ADDR,
 IS_SF,
 CENA_BN,
 CENA,
 SUMMA_PROD_BN,
 SUMMA_PROD_NDS,
 SUMMA_PROD,
 SUMMA_AGEN,
 SUMMA_AGEN_NDS,
 SUMMA_VOZN_BN,
 SUMMA_TARIF,
 SUMMA_TARIF_NDS,
 SUMMA_OHRANA,
 SUMMA_OHRANA_NDS,
 TARIF_MPS,
 TARIF_KVIT,
 SUMMA_RAZN_BN,
 NACENKA,
 SUMMA_STRAH,
 SUMMA_DOK,
 SUMMA_DOK_NDS,
 PRICE_PROTOKOL,
 KOL_DN,
 NAZN_OTG_ID,
 SNP_PLAT_ID,
 SNP_PLAT_NAME,
 RAST,
 NUM_STRAH,
 DECODE(SUMMA_VOZN_11_BN,0,DECODE(SUMMA_VOZN_12_BN,0,0,DECODE(NVL(VES_KVIT,0),0,0,ROUND(SUMMA_VOZN_BN/VES_KVIT,0))),USL_SUM) as USL_SUM,
 VAGOWN_TYP_ID,
 KORR_PROD, STRAH_NOM_SF, STRAH_SUMMA_DOK,VID_USL_ID
FROM MASTER.V_LUKREP_SF_NEW_BEFORE
--where nom_dok=6111317 or nom_dok=6111304 or nom_dok=6111307 or nom_dok=6111426
;

