--
-- V_PRIL_CIST_ALL  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_PRIL_CIST_ALL
(BEG_DATE, END_DATE, MON_KVIT, NUM_5_DAY, IS_KORR, 
 IS_AGENT, PLAT_ID, PLAT_NAME, DOG_ID, DOG_NUMBER, 
 DOG_DATE, DATE_KVIT, DATE_MOS, NOM_DOK, ORIG_NOM_SF, 
 OLD_NOM_DOK, OLD_NOM_SF, DATE_VYP_SF, PROD_ID_NPR, PROD_NAME, 
 PROD_EDIZ, KVIT_ID, VES, NUM_KVIT, NUM_CIST, 
 CENA_BN, CENA, SUMMA_PROD_BN, SUMMA_PROD_NDS, SUMMA_PROD, 
 SUMMA_AGEN, SUMMA_AGEN_NDS, SUMMA_VOZN_BN, SUMMA_TARIF, SUMMA_TARIF_NDS, 
 SUMMA_OHRANA, SUMMA_OHRANA_NDS, TARIF_MPS, TARIF_KVIT, SUMMA_RAZN_BN, 
 NACENKA, SUMMA_STRAH, SUMMA_DOK, SUMMA_DOK_NDS, NUM_STRAH, 
 USL_SUM, VAGOWN_TYP_ID, VID_USL_ID)
AS 
SELECT
 BEG_DATE,
 END_DATE,
 MON_KVIT,
 NUM_5_DAY,
 IS_KORR,
 IS_AGENT,
 PLAT_ID,
 PLAT_NAME,
 DOG_ID,
 DOG_NUMBER,
 DOG_DATE,
 DATE_KVIT,
 DATE_MOS,
 NOM_DOK,
 ORIG_NOM_SF,
 OLD_NOM_DOK,
 OLD_NOM_SF,
 DATE_VYP_SF,
 PROD_ID_NPR,
 PROD_NAME,
 PROD_EDIZ,
 KVIT_ID,
 MAX(VES) as VES,
 NUM_KVIT,
 NUM_CIST,
 MAX(CENA_BN) as CENA_BN,
 MAX(CENA) as CENA,
 SUM(SUMMA_PROD_BN) as SUMMA_PROD_BN,
 SUM(SUMMA_PROD_NDS) as SUMMA_PROD_NDS,
 SUM(SUMMA_PROD) as SUMMA_PROD,
 SUM(SUMMA_AGEN) as SUMMA_AGEN,
 SUM(SUMMA_AGEN_NDS) as SUMMA_AGEN_NDS,
 SUM(SUMMA_VOZN_BN) as SUMMA_VOZN_BN,
 SUM(SUMMA_TARIF) as SUMMA_TARIF,
 SUM(SUMMA_TARIF_NDS) as SUMMA_TARIF_NDS,
 SUM(SUMMA_OHRANA) as SUMMA_OHRANA,
 SUM(SUMMA_OHRANA_NDS) as SUMMA_OHRANA_NDS,
 SUM(TARIF_MPS) as TARIF_MPS,
 SUM(TARIF_KVIT) as TARIF_KVIT,
 SUM(SUMMA_RAZN_BN) as SUMMA_RAZN_BN,
 MAX(NACENKA) as NACENKA,
 SUM(SUMMA_STRAH) as SUMMA_STRAH,
 SUM(SUMMA_DOK) as SUMMA_DOK,
 SUM(SUMMA_DOK_NDS) as SUMMA_DOK_NDS,
 NUM_STRAH,
 MAX(DECODE(SUMMA_VOZN_11_BN,0,DECODE(SUMMA_VOZN_12_BN,0,0,DECODE(NVL(VES,0),0,0,ROUND(SUMMA_VOZN_BN/VES,0))),USL_SUM)) as USL_SUM,
 VAGOWN_TYP_ID,
 VID_USL_ID
FROM MASTER.V_PRIL_CIST_ALL_BEFORE
GROUP BY
 BEG_DATE,
 END_DATE,
 MON_KVIT,
 NUM_5_DAY,
 IS_KORR,
 IS_AGENT,
 PLAT_ID,
 PLAT_NAME,
 DOG_ID,
 DOG_NUMBER,
 DOG_DATE,
 DATE_KVIT,
 DATE_MOS,
 NOM_DOK,
 ORIG_NOM_SF,
 OLD_NOM_DOK,
 OLD_NOM_SF,
 DATE_VYP_SF,
 PROD_ID_NPR,
 PROD_NAME,
 PROD_EDIZ,
 KVIT_ID,
 NUM_KVIT,
 NUM_CIST,
 NUM_STRAH,
 VAGOWN_TYP_ID,
 VID_USL_ID
--HAVING SUM(SUMMA_DOK)<>0
;


