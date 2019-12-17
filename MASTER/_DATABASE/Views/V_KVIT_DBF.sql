--
-- V_KVIT_DBF  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_KVIT_DBF
(ID, KOD_PLAT, KOD_POLUCH, KOD_POTREB, KST, 
 KOD_NPR, N_DOG, DATE_DOG, KATEG_CEN, KOL_CIST, 
 DATE_RAZN, DOP_CIST, NUM_CIST, DATE_OTGR, VES, 
 TARIF, TARIF19, DOP_TARIF, NUM_KVIT, DATE_KVIT, 
 N_PLAT, DATA_BUXG, REESTR, RODV, TIP_OTGR, 
 ERROR, VAG_KLIENT, PRIZN_MPS, TRANSP, POSRED, 
 TIP, VZLIV, MESTO, TIPV, USL_PPZT, 
 DATE_CEN, CENA, CENA_OTP, KOD_OTGR, VAR_POST, 
 NOM_ZD, GTD, EXPED, PRV, NSER, 
 DATE_VOZ, KVIT_VOZ, SUM_VOZ, P_O, OSC, 
 KOD_OPB, DATE_B, TIME_B, KOD_OPE, DATE_E, 
 TIME_E, KOD_NAPR, OLD_PLAT, ZPU, VOZVRAT, 
 MOSC_OUT, DATE_REMOV, NFP_OWNER, VES_PRIOBR, POKUP_DAYS, 
 DATE_OTV, DATE_PRIB, KST_O, AUTO_USL, PLN_CHANGE, 
 PASP, PLAT_TARIF, NALIV, VES_BRUTTO, NP, 
 ID_NP, DATE_NP, ID_NP_C, KOD_GROTP, NUM_PERECH, 
 DAT_PERECH, TARIF_ORIG, NP_DATA_O, NP_TIMEP, DATE_REE, 
 PATH, WRITE, KST_VOZ, RAS_V, KV_VOZ, 
 N_STAN, PT, CNT_CIST, N_VOZ_SCH, D_VOZ_SCH, 
 PROSR_DN, D_NAL_VOZ, PLOMBA1, PLOMBA2, ROSINPL1, 
 ROSINPL2, N_MAR, N_REZ, PL, TEMPER, 
 XPL, DOVEREN, NARIAD, REXP, KOD_PERER, 
 KOL_ED, VES_ED, TARA_ALL, SVED_ID, KODPASP, 
 DRIVER, GD_TRACK, DATE_PRIH, UPAK_ID, IS_DOC_R3, 
 D_41, SUM_AKCIZ, D_191, D_194, SUM_NALIV, 
 NDC_NAL20, D_442, NDC_TR20, NACENKA, SUM_NACEN, 
 CENA_VOZN, BAG_VES, TNVED, NDC_DOPTAR, TARIF_ALT, 
 WES, BAG_ID, SHIELDS, PODDONS, NOM_ETRAN, 
 TARIF_AREN, KOL_NET, BAG1_VES, SHLD_VES, PODD_VES, 
 N_PER_OHR, D_PER_OHR, PROTO_NUM, PROTO_DATE, NO_AKCIZ, 
 DEFI_MASS, NAKL_NUM, FIO_DOVER, DATE_DOVER, CTLV, 
 VOLUME, VOLUME15, PL15)
AS 
SELECT /*+ RULE */ 
  KVIT.ID, 
  KLS_DOG.PREDPR_ID as KOD_PLAT, 
  MONTH.POLUCH_ID as KOD_POLUCH, 
  MONTH.POTREB_ID as KOD_POTREB, 
  KLS_STAN.STAN_KOD as KST, 
  KVIT.PROD_ID_NPR as KOD_NPR, 
  KLS_DOG.SHORT_NUMBER as N_DOG, 
  KLS_DOG.DOG_DATE as DATE_DOG, 
  USL_DOG.CAT_CEN_ID as kateg_cen, 
  0 as kol_cist, 
  MONTH.INPUT_DATE as DATE_RAZN, 
  KVIT.FLG_DOP_CIST as DOP_CIST, 
  (CASE 
     WHEN KLS_VID_OTGR.LOAD_TYPE_ID=2 THEN 0 
	 ELSE ora_char_to_num(KVIT.NUM_CIST) 
   END) NUM_CIST, 
  KVIT.DATE_OTGR, 
  KVIT.VES_BRUTTO as VES, 
  KVIT.TARIF, 
  KVIT.TARIF19, 
  KVIT.TARIF_GUARD as DOP_TARIF, 
  KVIT.NUM_KVIT, 
  KVIT.DATE_KVIT, 
  KVIT.BILL_ID as N_PLAT, 
  BILLS.DATE_BUXG as DATA_BUXG, 
  (CASE 
     WHEN BILLS.PROD_ID_NPR='10080' THEN KVIT.NUM_AKT 
	 ELSE 0 
   END) as REESTR, 
  KVIT.VAGONTYPE_ID as rodv, 
  KLS_VID_OTGR.LOAD_TYPE_ID as tip_otgr, 
  0 as error, 
  KVIT.FLG_VAG_KLIENT as vag_klient, 
  DECODE(MONTH.IS_EXP,1,3,1) as prizn_mps, 
  NVL(KVIT.NUM_MILITARY,' ') as transp, 
  10 as posred, 
  KVIT.KALIBR_ID as tip, 
  KVIT.VZLIV, 
  KVIT.MESTO_ID as MESTO, 
  KVIT.VAGOWNER_ID as tipv, 
  0 as usl_ppzt, 
  KVIT.DATE_CENA as DATE_CEN, 
  KVIT.CENA, 
  KVIT.CENA_OTP, 
  MONTH.NAZN_OTG_ID as kod_otgr, 
  13 as var_post, 
  MONTH.NOM_ZD, 
  NVL(KVIT.GTD,' ') as GTD, 
  NVL(exped.KOD_MOSCOW,0) as exped, 
  0 as prv, 
  ' ' as nser, 
  KVIT.DATE_VOZ, 
  NVL(KVIT.KVIT_VOZ,' ') as KVIT_VOZ, 
  KVIT.SUM_VOZ, 
  0 as p_o, 
  KVIT.AXES as osc, 
  0 as kod_opb, 
  TRUNC(KVIT.DATE_OFORML) as date_b, 
  TO_CHAR(KVIT.DATE_OFORML,'hh24:mi:ss') as time_b, 
  0 as kod_ope, 
  TRUNC(KVIT.DATE_EDIT) as date_e, 
  TO_CHAR(KVIT.DATE_EDIT,'hh24:mi:ss') as time_e, 
  0 as KOD_NAPR, 
  0 as OLD_PLAT, 
  0 as ZPU, 
  0 as vozvrat, 
  ' ' as mosc_out, 
  TO_DATE(NULL) as date_remov, 
  decode(month.is_exp,1,4,3) as nfp_owner, 
  0 as ves_priobr, 
  0 as pokup_days, 
  KVIT.DATE_OTV, 
  TO_DATE(NULL) as date_prib, 
  0 as kst_o, 
  0 as auto_usl, 
  0 as pln_change, 
  ora_char_to_num(kls_pasp.PASP_NUM) as pasp, 
  MONTH.TEX_PD_ID as plat_tarif, 
  1 as naliv, 
  KVIT.VES_BRUTTO, 
  KVIT.SVED_NUM as NP, 
  0 as id_np, 
  KVIT.DATE_OTGR as date_np, 
  0 as id_np_c, 
  MONTH.GROTP_ID as kod_grotp, 
  NVL(KVIT.PERECH_TEXPD_NUM,' ') as num_perech, 
  KVIT.PERECH_TEXPD_DATE as dat_perech, 
  KVIT.TARIF_ORIG, 
  TRUNC(KVIT.DATE_OFORML) as np_data_o, 
  TO_CHAR(KVIT.DATE_OFORML,'hh24:mi:ss') as np_timep, 
  kvit.date_otgr as date_ree, 
  ' ' as path, 
  0 as write, 
  0 as kst_voz, 
  0 as ras_v, 
  ' ' as kv_voz, 
  ' ' as n_stan, 
  0 as pt, 
  0 as cnt_cist, 
  ' ' as n_voz_sch, 
  TO_DATE(NULL) as d_voz_sch, 
  0 as prosr_dn, 
  TO_DATE(NULL) as d_nal_voz, 
  NVL(KVIT.PLOMBA1,' ') as PLOMBA1, 
  NVL(KVIT.PLOMBA2,' ') as PLOMBA2, 
  NVL(KVIT.ROSINSPL1,' ') as ROSINPL1, 
  NVL(KVIT.ROSINSPL2,' ') as ROSINPL2, 
  NVL(KVIT.NUM_NAR,' ') as N_MAR, 
  ora_char_to_num(kls_pasp.REZ_NUM) as n_rez, 
  kvit.PL, 
  NVL(kvit.temper,0) as temper, 
  NVL(kvit.FAKT_PL,0) as xpl, 
  NVL(kvit.NUM_DOVER,' ') as DOVEREN, 
  NVL(kvit.NUM_NAR,' ') as NARIAD, 
  NVL(kvit.SHABEXP_ID,0) as rexp, 
  1 as kod_perer, 
  NVL(kvit.kol_ed,0) as kol_ed, 
  NVL(kvit.VES_ED,0) as ves_ed, 
  NVL(kvit.VES_CIST,0) as tara_all, 
  nvl(kvit.SVED_ID,' ') as sved_id, 
  nvl(kvit.pasp_id,' ') as kodpasp, 
  (CASE 
     WHEN KLS_VID_OTGR.LOAD_TYPE_ID=2 THEN kvit.num_cist 
	 ELSE ' ' 
   END) DRIVER, 
  kvit.VETKA_OTP_ID as gd_track, 
  TO_DATE(NULL) as date_prih, 
  NVL(kvit.UPAK_ID,0) as UPAK_ID, 
  0 as is_doc_r3, 
  nvl(kvit.SUM_PROD,0) as d_41, 
  nvl(kvit.SUM_AKCIZ,0) as sum_akciz, 
  nvl(kvit.SUM_PROD_NDS,0) as d_191, 
  nvl(kvit.TARIF_NDS,0) as d_194, 
  nvl(kvit.SUM_VOZN11,0) as sum_naliv, 
  nvl(kvit.SUM_VOZN11_NDS,0) as ndc_nal20, 
  nvl(kvit.SUM_VOZN12,0) as d_442, 
  nvl(kvit.SUM_VOZN12_NDS,0) as ndc_tr20, 
  nvl(kvit.NACENKA,0) as nacenka, 
  nvl(kvit.SUM_STRAH,0) as SUM_NACEN, 
  nvl(kvit.CENA_VOZN,0) as cena_vozn, 
  nvl(kvit.UPAK_VES,0) as bag_ves, 
  ' ' as tnved, 
  nvl(KVIT.TARIF_GUARD_NDS,0) as NDC_DOPTAR, 
  nvl(KVIT.TARIF_ALT,0) as tarif_alt, 
  ora_char_to_num(kvit.CAPACITY) as wes, 
  NVL(kvit.UPAK_ID,0) as bag_id, 
  kvit.SHIELDS, 
  kvit.PODDONS, 
  NVL(GU12_A.NOM_Z,' ') as nom_etran, 
  0 as tarif_aren, 
  kvit.KOL_NET, 
  kvit.UPAK_VES_ED as bag1_ves, 
  kvit.SHIELD_VES as SHLD_VES, 
  kvit.PODDON_VES as PODD_VES, 
  NVL(kvit.PERECH_GUARD_NUM,' ') as n_per_ohr, 
  kvit.PERECH_GUARD_DATE as d_per_ohr, 
  NVL(kvit.proto_num,' ') as proto_num, 
  kvit.proto_date, 
  NVL(kvit.no_akciz,0) as no_akciz, 
  kvit.defi_mass_id as defi_mass, 
  0 as nakl_num, 
  NVL(kvit.FIO_DRIVER,' ') as FIO_DOVER, 
  kvit.DATE_DOVER, 
  NVL(kvit.CTLV,0) as ctlv, 
  NVL(kvit.VOLUME,0) as volume, 
  NVL(kvit.volume15,0) as volume15, 
  NVL(kvit.pl15,0) as pl15 
FROM KVIT,MONTH,BILLS,KLS_DOG,KLS_STAN,USL_DOG,KLS_VID_OTGR,GU12_A,KLS_PASP, 
     (select * from predpr_role where kls_role_id=3) exped 
WHERE KVIT.DATE_KVIT>=TO_DATE('01.01.2006','dd.mm.yyyy') 
  AND KVIT.BILL_ID=BILLS.NOM_DOK(+) 
  AND KVIT.NOM_ZD=MONTH.NOM_ZD 
  AND MONTH.DOG_ID=KLS_DOG.ID 
  AND MONTH.STAN_ID=KLS_STAN.ID 
  AND MONTH.DOG_ID=USL_DOG.DOG_ID 
  AND MONTH.USL_NUMBER=USL_DOG.USL_NUMBER 
  AND MONTH.LOAD_ABBR=KLS_VID_OTGR.LOAD_ABBR 
  AND MONTH.GU12_A_ID=GU12_A.ID(+) 
  AND KVIT.PASP_ID=KLS_PASP.ID(+) 
  AND kvit.exped_id=exped.predpr_id(+);


