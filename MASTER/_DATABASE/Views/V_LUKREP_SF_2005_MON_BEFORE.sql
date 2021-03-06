--
-- V_LUKREP_SF_2005_MON_BEFORE  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_LUKREP_SF_2005_MON_BEFORE
(NUM_5_DAY, IS_KORR, IS_AGENT, SOBSTV, PLAT_ID, 
 PLAT_INN, PLAT_NAME, PLAT_ADDR, DOG_ID, DOG_NUMBER, 
 DOG_DATE, DATE_KVIT, DATE_MOS, DATE_CHN_SOB, NOM_DOK, 
 NOM_SF, ORIG_NOM_SF, OLD_NOM_DOK, OLD_NOM_SF, NPO_SF, 
 DATE_VYP_SF, GR_NPR_ID, GR_NPR_NAME, PROD_ID_NPR, PROD_NAME, 
 PROD_EDIZ, KVIT_ID, VES, VES_KVIT, CNT_KVIT, 
 SVED_NUM, NUM_KVIT, NOM_AKT, NUM_CIST, STANOTP_ID, 
 STAN_NAME, HRAN_ID, HRAN_NAME, POLUCH_ID, POLUCH_NAME, 
 POLUCH_ADDR, IS_SF, CENA_BN, CENA, SUMMA_PROD_BN, 
 SUMMA_PROD_NDS, SUMMA_PROD, SUMMA_AGEN, SUMMA_AGEN_NDS, SUMMA_VOZN_11_BN, 
 SUMMA_VOZN_12_BN, SUMMA_VOZN_BN, SUMMA_TARIF, SUMMA_TARIF_NDS, SUMMA_OHRANA, 
 SUMMA_OHRANA_NDS, TARIF_MPS, TARIF_KVIT, SUMMA_RAZN_BN, NACENKA, 
 SUMMA_STRAH, SUMMA_DOK, SUMMA_DOK_NDS, PRICE_PROTOKOL, KOL_DN, 
 NAZN_OTG_ID, RAST, NUM_STRAH, USL_SUM, VAGOWN_TYP_ID, 
 KORR_PROD, VID_USL_ID, DATE_VIR)
AS 
SELECT /*  */ 
  TO_NUMBER(TO_CHAR(bills.date_mos,'MM'))*100+bills.NUM_5_DAY as NUM_5_DAY, 
  DECODE(TRUNC(bills.DATE_KVIT,'MONTH'),TRUNC(bills.DATE_MOS,'MONTH'),0,TO_NUMBER(TO_CHAR(bills.date_kvit,'MM'))*100+bills.KORR_5_DAY) AS IS_KORR, 
  bills.IS_AGENT, 
  (CASE 
  WHEN bills.PROD_ID_NPR<'10100' AND bills.PROD_ID_NPR<>'10080' THEN 5 
  ELSE NVL(KV.SOBSTV,1) 
   END) AS SOBSTV, 
  KLS_DOG.PREDPR_ID AS PLAT_ID, 
  PLAT.INN AS PLAT_INN, 
  PLAT.SF_NAME AS PLAT_NAME, 
  PLAT.CITY_J || ',' || PLAT.ADDRESS_J AS PLAT_ADDR, 
  bills.DOG_ID as DOG_ID, 
  KLS_DOG.DOG_NUMBER as DOG_NUMBER, 
  KLS_DOG.DOG_DATE as DOG_DATE, 
  bills.DATE_KVIT, 
  bills.DATE_MOS, 
  bills.DATE_KVIT AS DATE_CHN_SOB, 
  bills.NOM_DOK, 
  bills.NOM_SF, 
  bills.NOM_SF AS ORIG_NOM_SF, 
  NVL(bills.OLD_NOM_DOK,0) as OLD_NOM_DOK, 
  Get_Old_sf(bills.NOM_DOK,bills.NOM_SF,bills.OLD_NOM_DOK,bills.OLD_NOM_SF) as OLD_NOM_SF, 
  bills.NPO_SF, 
  bills.DATE_VYP_SF AS DATE_VYP_SF, 
  gr_prod.ID_NPR AS gr_npr_id, 
  gr_prod.NAME_NPR AS gr_npr_name, 
  KLS_PROD.ID_NPR as PROD_ID_NPR, 
  KLS_PROD.SF_NAME AS PROD_NAME, 
  KLS_PROD.ED_IZ AS PROD_EDIZ, 
  KVIT.ID, 
  KVIT.VES_BRUTTO AS VES, 
  KVIT.VES_BRUTTO AS VES_KVIT, 
  1 as CNT_KVIT, 
  KVIT.SVED_NUM, 
  KVIT.NUM_KVIT, 
  (CASE 
 WHEN bills.IS_AGENT=4 THEN TO_CHAR(KVIT.NUM_AKT) 
 ELSE '' 
   END) AS NOM_AKT, 
  DECODE(MONTH.LOAD_ABBR,'���',KVIT.NUM_DOVER,KVIT.NUM_CIST) AS NUM_CIST, 
  MONTH.STANOTP_ID, 
  DECODE(MONTH.LOAD_ABBR,'���','���������',DECODE(STANOTP.ID,1,'���������',STANOTP.STAN_NAME)) as STAN_NAME, 
  DECODE(MONTH.LOAD_ABBR,'���',DECODE(MONTH.NAZN_OTG_ID,9,POLUCH.ID,8),8) AS HRAN_ID, 
  DECODE(MONTH.LOAD_ABBR,'���',DECODE(MONTH.NAZN_OTG_ID,9,POLUCH.SF_NAME,'��� "������-��������������������"'),'��� "������-��������������������"') AS HRAN_NAME, 
  MONTH.POLUCH_ID, 
  POLUCH.SF_NAME AS POLUCH_NAME, 
  POLUCH.CITY_P || ',' || POLUCH.ADDRESS_P AS POLUCH_ADDR, 
  0 AS IS_SF, 
  NVL(KVIT.CENA,0) AS CENA_BN, 
  ROUND(NVL(KVIT.CENA,0)*(100+FOR_BILLS.GetNDSValue(bills.date_kvit))/100,2) as CENA, 
  NVL(KVIT.SUM_PROD,0) AS SUMMA_PROD_BN, 
  NVL(KVIT.SUM_PROD_NDS,0) AS SUMMA_PROD_NDS, 
  NVL(KVIT.SUM_PROD_NDS,0)+NVL(KVIT.SUM_PROD,0) AS SUMMA_PROD, 
  NVL(KVIT.SUM_VOZN11,0)+NVL(KVIT.SUM_VOZN12,0)+NVL(KVIT.SUM_VOZN11_NDS,0)+NVL(KVIT.SUM_VOZN12_NDS,0) AS SUMMA_AGEN, 
  NVL(KVIT.SUM_VOZN11_NDS,0)+NVL(KVIT.SUM_VOZN12_NDS,0) AS SUMMA_AGEN_NDS, 
  NVL(KVIT.SUM_VOZN11,0) AS SUMMA_VOZN_11_BN, 
  NVL(KVIT.SUM_VOZN12,0) AS SUMMA_VOZN_12_BN, 
  (CASE 
     WHEN NVL(KVIT.sum_vozn11,0)=0 AND NVL(KVIT.sum_vozn12,0)=0 THEN 0 
     WHEN NVL(KVIT.sum_vozn11,0)=0 AND NVL(KVIT.sum_vozn12,0)<>0 THEN NVL(KVIT.sum_vozn12,0)-(NVL(KVIT.TARIF_ALT,0)+NVL(KVIT.TARIF,0)) 
  ELSE NVL(KVIT.sum_vozn11,0) 
   END) as SUMMA_VOZN_BN, 
  NVL(KVIT.TARIF,0)+NVL(KVIT.TARIF_NDS,0) AS SUMMA_TARIF, 
  NVL(KVIT.TARIF_NDS,0) AS SUMMA_TARIF_NDS, 
  NVL(KVIT.TARIF_GUARD,0)+NVL(KVIT.TARIF_GUARD_NDS,0) AS SUMMA_OHRANA, 
  NVL(KVIT.TARIF_GUARD_NDS,0) AS SUMMA_OHRANA_NDS, 
  NVL(KVIT.TARIF_ALT,0) as TARIF_MPS, 
  NVL(KVIT.TARIF,0) AS TARIF_KVIT, 
  DECODE(NVL(KVIT.sum_vozn12,0),0,0,NVL(KVIT.TARIF_ALT,0)-NVL(KVIT.TARIF,0)) as SUMMA_RAZN_BN, 
  NVL(KVIT.NACENKA,0) as NACENKA, 
  NVL(KVIT.SUM_STRAH,0) AS SUMMA_STRAH, 
  NVL(KVIT.SUM_PROD_NDS,0)+NVL(KVIT.SUM_PROD,0)+ 
    NVL(KVIT.SUM_VOZN11,0)+NVL(KVIT.SUM_VOZN12,0)+NVL(KVIT.SUM_VOZN11_NDS,0)+NVL(KVIT.SUM_VOZN12_NDS,0)+ 
 NVL(KVIT.TARIF,0)+NVL(KVIT.TARIF_NDS,0)+ 
 NVL(KVIT.TARIF_GUARD,0)+NVL(KVIT.TARIF_GUARD_NDS,0)+ 
 NVL(KVIT.SUM_STRAH,0) AS SUMMA_DOK, 
  NVL(KVIT.SUM_PROD_NDS,0)+ 
    NVL(KVIT.SUM_VOZN11_NDS,0)+NVL(KVIT.SUM_VOZN12_NDS,0)+ 
 NVL(KVIT.TARIF_NDS,0)+ 
 NVL(KVIT.TARIF_GUARD_NDS,0) AS SUMMA_DOK_NDS, 
  DECODE(bills.PROD_ID_NPR,'10080',KV.PROTO_NUM,bills.PROTO_NUM) || ' �� ' || TO_CHAR(DECODE(bills.PROD_ID_NPR,'10080',KV.PROTO_DATE,bills.PROTO_DATE),'dd.mm.yy') || '�.' as PROTO_NUM, 
  bills.KOL_DN, 
  MONTH.NAZN_OTG_ID, 
  STAN.RAST, 
  DECODE(NVL(KVIT.SUM_STRAH,0),0,' ',TO_CHAR(bills.NOM_SF-100000)) as NUM_STRAH, 
  NVL(DECODE(bills.IS_AGENT,2,USL_DOG.USL_SUM_AREND,USL_DOG.USL_SUM),0) as USL_SUM, 
--  TO_NUMBER(DECODE(MONTH.LOAD_ABBR,'���',NULL,'���',NULL,'���',NULL,KLS_VAGOWNER.VAGOWN_TYP_ID)) as VAGOWN_TYP_ID, 
  TO_NUMBER(CASE 
              WHEN MONTH.LOAD_ABBR In ('���','���','���') THEN NULL 
     WHEN KLS_VAGOWNER.VAGOWN_TYP_ID=0 THEN KLS_VAGOWNER.VAGOWN_TYP_ID 
     WHEN KLS_VAGOWNER.OWNER_ID IN (2,33) THEN 1 
     ELSE 2 
   END) AS VAGOWN_TYP_ID, 
  bills.KORR_PROD, 
  USL_DOG.VID_USL_ID, 
--  KVIT.DATE_VIR 
  bills.DATE_KVIT as DATE_VIR 
FROM bills, KLS_DOG, KLS_PREDPR PLAT, 
  ( 
   SELECT 
       a.BILL_ID, 
    a.PROD_ID_NPR, 
--    a.DATE_VIR, 
      DECODE(a.OWNERSHIP_ID,1,1,3) AS SOBSTV, 
    MAX(a.PROTO_NUM) as PROTO_NUM, 
    MAX(a.PROTO_DATE) as PROTO_DATE, 
    COUNT(*) AS CNT, 
    SUM(VES_BRUTTO) as VES 
     FROM V_KVIT_DATE_VIR_ALL a 
 WHERE a.DATE_KVIT>=TO_DATE('01.01.2006','dd.mm.yyyy') 
    GROUP BY a.BILL_ID,a.PROD_ID_NPR,/*a.DATE_VIR,*/DECODE(a.OWNERSHIP_ID,1,1,3) 
 HAVING COUNT(*)>1 AND SUM(VES_BRUTTO)<>0 
  ) KV, 
  V_KVIT_DATE_VIR_ALL kvit, KLS_PROD, KLS_PROD gr_prod, MONTH, KLS_PREDPR POLUCH, KLS_STAN STANOTP, KLS_STAN STAN, KLS_PREDPR POTREB, USL_DOG, KLS_VAGOWNER 
WHERE bills.DATE_KVIT>=TO_DATE('01.01.2006','dd.mm.yyyy') 
  AND BILLS.PROD_ID_NPR not IN ('10041') 
  AND BILLS.DOG_ID = KLS_DOG.ID 
  AND KLS_DOG.PREDPR_ID = PLAT.ID 
  AND BILLS.NOM_DOK = KV.BILL_ID 
  AND KV.BILL_ID = KVIT.BILL_ID 
  AND KV.PROD_ID_NPR = KVIT.PROD_ID_NPR 
--  AND KV.DATE_VIR=KVIT.DATE_VIR 
  AND KV.SOBSTV=DECODE(KVIT.OWNERSHIP_ID,1,1,3) 
  AND KV.PROD_ID_NPR = KLS_PROD.ID_NPR 
  AND KV.CNT<>1 
  AND KLS_PROD.ID_GROUP_NPR = gr_prod.ID_NPR 
  AND KVIT.VAGOWNER_ID=KLS_VAGOWNER.ID(+) 
  AND BILLS.NOM_ZD = MONTH.NOM_ZD 
  AND MONTH.POLUCH_ID = POLUCH.ID 
  AND NVL(MONTH.POTREB_ID,MONTH.POLUCH_ID) = POTREB.ID 
  AND MONTH.STANOTP_ID = STANOTP.ID 
  AND MONTH.STAN_ID = STAN.ID 
  AND MONTH.DOG_ID=USL_DOG.DOG_ID (+) 
  AND MONTH.USL_NUMBER=USL_DOG.USL_NUMBER (+) 
--  and kvit.bill_id=6124876 
--  and bills.nom_sf='100129' 
-- 
UNION ALL 
-- 
SELECT /*+ ORDERED USE_NL(b_p,KV,bills,PLAT, POLUCH, KLS_DOG, KLS_PROD, gr_prod, MONTH,STANOTP,STAN,POTREB, USL_DOG) */ 
  TO_NUMBER(TO_CHAR(bills.date_mos,'MM'))*100+bills.NUM_5_DAY as NUM_5_DAY, 
  DECODE(TRUNC(bills.DATE_KVIT,'MONTH'),TRUNC(bills.DATE_MOS,'MONTH'),0,TO_NUMBER(TO_CHAR(bills.date_kvit,'MM'))*100+bills.KORR_5_DAY) AS IS_KORR, 
  bills.IS_AGENT, 
  (CASE 
  WHEN bills.PROD_ID_NPR<'10100' AND bills.PROD_ID_NPR<>'10080' THEN 5 
  ELSE NVL(KV.SOBSTV,1) 
   END) AS SOBSTV, 
  KLS_DOG.PREDPR_ID AS PLAT_ID, 
  PLAT.INN AS PLAT_INN, 
  PLAT.SF_NAME AS PLAT_NAME, 
  PLAT.CITY_J || ',' || PLAT.ADDRESS_J AS PLAT_ADDR, 
  bills.DOG_ID as DOG_ID, 
  KLS_DOG.DOG_NUMBER as DOG_NUMBER, 
  KLS_DOG.DOG_DATE as DOG_DATE, 
  bills.DATE_KVIT, 
  bills.DATE_MOS, 
  bills.DATE_KVIT AS DATE_CHN_SOB, 
  bills.NOM_DOK, 
  bills.NOM_SF, 
  bills.NOM_SF as ORIG_NOM_SF, 
  NVL(bills.OLD_NOM_DOK,0) as OLD_NOM_DOK, 
  Get_Old_sf(bills.NOM_DOK,bills.NOM_SF,bills.OLD_NOM_DOK,bills.OLD_NOM_SF) as OLD_NOM_SF, 
  bills.NPO_SF, 
  bills.DATE_VYP_SF, 
  NVL(gr_prod.ID_NPR,' ') AS gr_npr_id, 
  NVL(gr_prod.NAME_NPR,' ') AS gr_npr_name, 
  KLS_PROD.ID_NPR as PROD_ID_NPR, 
  KLS_PROD.SF_NAME AS PROD_NAME, 
  KLS_PROD.ED_IZ, 
  NVL(DECODE(NVL(KV.CNT,0),1,KV.ID,0),0) as ID, 
  NVL(KV.VES,NVL(b_p.ves,0)) as VES, 
  NVL(KV.VES,0) AS VES_KVIT, 
  NVL(KV.CNT,0) as CNT_KVIT, 
  NVL(DECODE(NVL(KV.CNT,0),1,KV.SVED_NUM,0),0) as SVED_NUM, 
  NVL(DECODE(NVL(KV.CNT,0),1,KV.NUM_KVIT,0),0) as NUM_KVIT, 
  (CASE 
 WHEN bills.IS_AGENT=4 THEN TO_CHAR(KV.NUM_AKT) 
 ELSE '' 
   END) AS NOM_AKT, 
  NVL(DECODE(NVL(KV.CNT,0),1,DECODE(MONTH.LOAD_ABBR,'���',KV.NUM_DOVER,KV.NUM_CIST),' '),' ') as NUM_CIST, 
  NVL(MONTH.STANOTP_ID,0) as STANOTP_ID, 
  NVL(DECODE(MONTH.LOAD_ABBR,'���','���������',DECODE(STANOTP.ID,1,'���������',STANOTP.STAN_NAME)),' ') as STAN_NAME, 
  DECODE(MONTH.LOAD_ABBR,'���',DECODE(MONTH.NAZN_OTG_ID,9,POLUCH.ID,8),8) AS HRAN_ID, 
  DECODE(MONTH.LOAD_ABBR,'���',DECODE(MONTH.NAZN_OTG_ID,9,POLUCH.SF_NAME,'��� "������-��������������������"'),'��� "������-��������������������"') AS HRAN_NAME, 
  NVL(MONTH.POLUCH_ID,0) as POLUCH_ID, 
  NVL(POLUCH.SF_NAME,' ') as POLUCH_NAME, 
  DECODE(NVL(MONTH.POLUCH_ID,0),0,' ',POLUCH.CITY_P || ',' || POLUCH.ADDRESS_P) AS POLUCH_ADDR, 
  1 AS IS_SF, 
  NVL(b_p.cena_bn,0) as CENA_BN, 
  ROUND(NVL(b_p.cena_bn,0)*(100+FOR_BILLS.GetNDSValue(bills.date_kvit))/100,2) as CENA, 
  NVL(KV.SUMMA_PROD_BN,NVL(b_p.summa_prod_bn,0)) as SUMMA_PROD_BN, 
  NVL(KV.SUMMA_PROD_NDS,NVL(b_p.summa_prod_nds,0)) as SUMMA_PROD_NDS, 
  NVL(KV.SUMMA_PROD,NVL(b_p.summa_prod,0)) as SUMMA_PROD, 
  NVL(KV.SUMMA_AGEN,NVL(b_p.summa_agen,0)) as SUMMA_AGEN, 
  NVL(KV.SUMMA_AGEN_NDS,NVL(b_p.summa_agen_nds,0)) as SUMMA_AGEN_NDS, 
  NVL(KV.summa_vozn_11_bn,0) as SUMMA_VOZN_11_BN, 
  NVL(KV.summa_vozn_12_bn,0) as SUMMA_VOZN_12_BN, 
  (CASE 
     WHEN NVL(KV.summa_vozn_11_bn,0)=0 AND NVL(KV.summa_vozn_12_bn,0)=0 THEN 0 
  WHEN NVL(KV.summa_vozn_11_bn,0)=0 AND NVL(KV.summa_vozn_12_bn,0)<>0 THEN NVL(KV.summa_vozn_12_bn,0)-(NVL(kv.TARIF_MPS,0)+NVL(kv.TARIF_KVIT,0)) 
  ELSE NVL(KV.summa_vozn_11_bn,0) 
   END) as SUMMA_VOZN_BN, 
  NVL(KV.summa_tarif,NVL(b_p.summa_tarif,0)) AS SUMMA_TARIF, 
  NVL(KV.summa_tarif_nds,NVL(b_p.summa_tarif_nds,0)) AS SUMMA_TARIF_NDS, 
  NVL(KV.summa_ohrana,NVL(b_p.summa_ohrana,0)) AS SUMMA_OHRANA, 
  NVL(KV.summa_ohrana_nds,NVL(b_p.summa_ohrana_nds,0)) AS SUMMA_OHRANA_NDS, 
  NVL(kv.TARIF_MPS,0) as TARIF_MPS, 
  NVL(kv.TARIF_KVIT,0) as TARIF_KVIT, 
  DECODE(NVL(KV.summa_vozn_12_bn,0),0,0,NVL(kv.TARIF_MPS,0)-NVL(kv.TARIF_KVIT,0)) as SUMMA_RAZN_BN, 
  NVL(b_p.NACENKA,0) as NACENKA, 
  NVL(KV.summa_strah,NVL(b_p.summa_strah,0)) AS SUMMA_STRAH, 
  NVL(KV.summa_dok,NVL(b_p.summa_dok,0)) as SUMMA_DOK, 
  NVL(KV.summa_dok_nds,NVL(b_p.summa_dok_nds,0)) as SUMMA_DOK_NDS, 
  DECODE(bills.PROD_ID_NPR,'10080',KV.PROTO_NUM,bills.PROTO_NUM) || ' �� ' || TO_CHAR(DECODE(bills.PROD_ID_NPR,'10080',KV.PROTO_DATE,bills.PROTO_DATE),'dd.mm.yy') || '�.' as PROTO_NUM, 
  bills.kol_dn, 
  MONTH.NAZN_OTG_ID, 
  STAN.RAST, 
  DECODE(NVL(b_p.summa_strah,0),0,' ',TO_CHAR(bills.NOM_SF-100000)) as NUM_STRAH, 
  NVL(DECODE(bills.IS_AGENT,2,USL_DOG.USL_SUM_AREND,USL_DOG.USL_SUM),0) as USL_SUM, 
--  TO_NUMBER(DECODE(MONTH.LOAD_ABBR,'���',NULL,'���',NULL,'���',NULL,KV.VAGOWN_TYP_ID)) as VAGOWN_TYP_ID, 
  TO_NUMBER(CASE 
              WHEN MONTH.LOAD_ABBR In ('���','���','���') THEN NULL 
     WHEN KV.VAGOWN_TYP_ID=0 THEN KV.VAGOWN_TYP_ID 
     WHEN KV.OWNER_ID IN (2,33) THEN 1 
     ELSE 2 
   END) AS VAGOWN_TYP_ID, 
  bills.KORR_PROD, 
  USL_DOG.VID_USL_ID, 
--  KV.DATE_VIR 
  bills.DATE_KVIT as DATE_VIR 
FROM 
  ( 
  SELECT /*+ ORDERED INDEX(bill_pos) USE_NL(bill_pos,bills) */ 
     bill_pos.NOM_DOK, 
  DECODE(SIGN(bill_pos.BILL_POS_ID-10),-1,bill_pos.PROD_ID_NPR,bills.PROD_ID_NPR) AS PROD_ID_NPR, 
  DECODE(SIGN(bill_pos.BILL_POS_ID-10),-1,DECODE(bill_pos.OWNERSHIP_ID,1,1,3),1) AS SOBSTV, 
  MAX(bill_pos.NACENKA) as NACENKA, 
  MAX(DECODE(SIGN(bill_pos.BILL_POS_ID-10),-1,bill_pos.CENA_BN,0)) AS cena_bn, 
  SUM(DECODE(SIGN(bill_pos.BILL_POS_ID-10),-1,bill_pos.SUMMA-bill_pos.SUMMA_NDS20,0)) AS summa_prod_bn, 
  SUM(DECODE(SIGN(bill_pos.BILL_POS_ID-10),-1,bill_pos.SUMMA_NDS20,0)) AS summa_prod_nds, 
  SUM(DECODE(SIGN(bill_pos.BILL_POS_ID-10),-1,bill_pos.SUMMA,0)) AS summa_prod, 
  SUM(DECODE(SIGN(bill_pos.BILL_POS_ID-10),-1,bill_pos.VES,0)) AS ves, 
  SUM(DECODE(bill_pos.BILL_POS_ID,11,bill_pos.SUMMA,12,bill_pos.SUMMA,0)) AS summa_agen, 
  SUM(DECODE(bill_pos.BILL_POS_ID,11,bill_pos.SUMMA_NDS20,12,bill_pos.SUMMA_NDS20,0)) AS summa_agen_nds, 
  SUM(DECODE(bill_pos.BILL_POS_ID,11,bill_pos.SUMMA-bill_pos.SUMMA_NDS20,0)) AS summa_vozn_11_bn, 
  SUM(DECODE(bill_pos.BILL_POS_ID,11,bill_pos.SUMMA,0)) AS summa_vozn_11, 
  SUM(DECODE(bill_pos.BILL_POS_ID,11,bill_pos.SUMMA_NDS20,0)) AS summa_vozn_11_nds, 
  SUM(DECODE(bill_pos.BILL_POS_ID,12,bill_pos.SUMMA-bill_pos.SUMMA_NDS20,0)) AS summa_vozn_12_bn, 
  SUM(DECODE(bill_pos.BILL_POS_ID,12,bill_pos.SUMMA,0)) AS summa_vozn_12, 
  SUM(DECODE(bill_pos.BILL_POS_ID,12,bill_pos.SUMMA_NDS20,0)) AS summa_vozn_12_nds, 
  SUM(DECODE(bill_pos.BILL_POS_ID,10,bill_pos.SUMMA,0)) AS summa_tarif, 
  SUM(DECODE(bill_pos.BILL_POS_ID,10,bill_pos.SUMMA_NDS20,0)) AS summa_tarif_nds, 
  SUM(DECODE(bill_pos.BILL_POS_ID,13,bill_pos.SUMMA,0)) AS summa_ohrana, 
  SUM(DECODE(bill_pos.BILL_POS_ID,13,bill_pos.SUMMA_NDS20,0)) AS summa_ohrana_nds, 
  SUM(DECODE(bill_pos.BILL_POS_ID,20,bill_pos.SUMMA,0)) AS summa_strah, 
  SUM(bill_pos.SUMMA_NDS20) AS summa_dok_nds, 
  SUM(bill_pos.SUMMA) AS summa_dok 
    FROM bill_pos,bills 
    WHERE bill_pos.NOM_DOK=bills.nom_dok 
   AND bill_pos.DATE_REALIZ>=TO_DATE('01.01.2006','dd.mm.yyyy') 
 GROUP BY 
   bill_pos.NOM_DOK, 
   DECODE(SIGN(bill_pos.BILL_POS_ID-10),-1,bill_pos.PROD_ID_NPR,bills.PROD_ID_NPR), 
   DECODE(SIGN(bill_pos.BILL_POS_ID-10),-1,DECODE(bill_pos.OWNERSHIP_ID,1,1,3),1) 
    ) b_p, 
    ( 
  SELECT 
    a.BILL_ID, 
    a.PROD_ID_NPR, 
--    a.DATE_VIR, 
      DECODE(a.OWNERSHIP_ID,1,1,3) AS SOBSTV, 
    MIN(KLS_VAGOWNER.VAGOWN_TYP_ID) as VAGOWN_TYP_ID, 
    MIN(KLS_VAGOWNER.OWNER_ID) as OWNER_ID, 
    COUNT(*) AS CNT, 
    SUM(a.VES_BRUTTO) AS VES, 
       SUM(NVL(a.SUM_PROD,0)) AS SUMMA_PROD_BN, 
       SUM(NVL(a.SUM_PROD_NDS,0)) AS SUMMA_PROD_NDS, 
       SUM(NVL(a.SUM_PROD_NDS,0)+NVL(a.SUM_PROD,0)) AS SUMMA_PROD, 
       SUM(NVL(a.SUM_VOZN11,0)+NVL(a.SUM_VOZN12,0)+NVL(a.SUM_VOZN11_NDS,0)+NVL(a.SUM_VOZN12_NDS,0)) AS SUMMA_AGEN, 
       SUM(NVL(a.SUM_VOZN11_NDS,0)+NVL(a.SUM_VOZN12_NDS,0)) AS SUMMA_AGEN_NDS, 
       SUM(NVL(a.SUM_VOZN11,0)) AS SUMMA_VOZN_11_BN, 
       SUM(NVL(a.SUM_VOZN12,0)) AS SUMMA_VOZN_12_BN, 
       SUM(NVL(a.TARIF,0)+NVL(a.TARIF_NDS,0)) AS SUMMA_TARIF, 
       SUM(NVL(a.TARIF_NDS,0)) AS SUMMA_TARIF_NDS, 
       SUM(NVL(a.TARIF_GUARD,0)+NVL(a.TARIF_GUARD_NDS,0)) AS SUMMA_OHRANA, 
       SUM(NVL(a.TARIF_GUARD_NDS,0)) AS SUMMA_OHRANA_NDS, 
       SUM(NVL(a.TARIF_ALT,0)) as TARIF_MPS, 
       SUM(NVL(a.TARIF,0)) AS TARIF_KVIT, 
       SUM(NVL(a.SUM_STRAH,0)) AS SUMMA_STRAH, 
       SUM(NVL(a.SUM_PROD_NDS,0)+NVL(a.SUM_PROD,0)+ 
           NVL(a.SUM_VOZN11,0)+NVL(a.SUM_VOZN12,0)+NVL(a.SUM_VOZN11_NDS,0)+NVL(a.SUM_VOZN12_NDS,0)+ 
        NVL(a.TARIF,0)+NVL(a.TARIF_NDS,0)+ 
        NVL(a.TARIF_GUARD,0)+NVL(a.TARIF_GUARD_NDS,0)+ 
        NVL(a.SUM_STRAH,0)) AS SUMMA_DOK, 
       SUM(NVL(a.SUM_PROD_NDS,0)+ 
           NVL(a.SUM_VOZN11_NDS,0)+NVL(a.SUM_VOZN12_NDS,0)+ 
           NVL(a.TARIF_NDS,0)+ 
           NVL(a.TARIF_GUARD_NDS,0)) AS SUMMA_DOK_NDS, 
    MAX(a.ID) AS ID, 
       MAX(a.SVED_NUM) AS SVED_NUM, 
    MAX(a.NUM_KVIT) AS NUM_KVIT, 
    MAX(a.NUM_DOVER) AS NUM_DOVER, 
    MAX(a.NUM_CIST) AS NUM_CIST, 
    MAX(a.PROTO_NUM) as PROTO_NUM, 
    MAX(a.PROTO_DATE) as PROTO_DATE, 
    MAX(a.NUM_AKT) AS NUM_AKT 
     FROM V_KVIT_DATE_VIR_ALL a ,KLS_VAGOWNER 
  WHERE a.DATE_KVIT>=TO_DATE('01.01.2006','dd.mm.yyyy') 
    AND a.VAGOWNER_ID=KLS_VAGOWNER.ID(+) 
  GROUP BY a.BILL_ID,a.PROD_ID_NPR,/*a.DATE_VIR,*/DECODE(a.OWNERSHIP_ID,1,1,3) 
    ) KV, 
    bills, KLS_PROD, KLS_PROD gr_prod, KLS_DOG, KLS_PREDPR PLAT, MONTH, KLS_PREDPR POLUCH, KLS_STAN STANOTP, KLS_STAN STAN, KLS_PREDPR POTREB, USL_DOG 
WHERE b_p.nom_dok=KV.BILL_ID(+) 
  AND b_p.PROD_ID_NPR=KV.PROD_ID_NPR(+) 
  AND b_p.SOBSTV=KV.SOBSTV(+) 
  AND b_p.NOM_DOK=bills.NOM_DOK 
  AND b_p.PROD_ID_NPR = KLS_PROD.ID_NPR 
  AND KLS_PROD.ID_GROUP_NPR = gr_prod.ID_NPR (+) 
  AND bills.DATE_KVIT>=TO_DATE('01.01.2006','dd.mm.yyyy') 
  AND BILLS.PROD_ID_NPR not IN ('10041') 
  AND bills.DOG_ID = KLS_DOG.ID 
  AND KLS_DOG.PREDPR_ID = PLAT.ID 
  AND bills.NOM_ZD = MONTH.NOM_ZD(+) 
  AND NVL(MONTH.POLUCH_ID,KLS_DOG.PREDPR_ID) = POLUCH.ID 
  AND NVL(MONTH.POTREB_ID,NVL(MONTH.POLUCH_ID,KLS_DOG.PREDPR_ID)) = POTREB.ID 
  AND MONTH.STANOTP_ID = STANOTP.ID(+) 
  AND MONTH.STAN_ID = STAN.ID(+) 
  AND MONTH.DOG_ID=USL_DOG.DOG_ID (+) 
  AND MONTH.USL_NUMBER=USL_DOG.USL_NUMBER (+) 
--  and bills.nom_dok=6124876 
  --  and bills.nom_sf='100129'
;


