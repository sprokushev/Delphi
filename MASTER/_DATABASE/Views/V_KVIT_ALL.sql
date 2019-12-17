--
-- V_KVIT_ALL  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_KVIT_ALL
(ID, FLG_OPERDATA, MESTO_ID, NOM_ZD, PROD_ID_NPR, 
 TEX_PD_ID, NUM_CIST, DATE_OTGR, VES, VES_BRUTTO, 
 VES_ED, KOL_ED, TARIF, TARIF19, TARIF_ORIG, 
 NUM_KVIT, DATE_KVIT, NUM_MILITARY, FLG_DOP_CIST, FLG_VAG_KLIENT, 
 VAGOWNER_ID, VAGONTYPE_ID, KALIBR_ID, VES_CIST, DATE_VOZ, 
 KVIT_VOZ, SUM_VOZ, DATE_OTV, PLOMBA1, PLOMBA2, 
 ROSINSPL1, ROSINSPL2, VZLIV, TEMPER, FAKT_PL, 
 FORMNAKL_ID, SHABEXP_ID, GTD, EXPED_ID, VETKA_OTP_ID, 
 NUM_EXP_MAR, BILL_ID, SVED_ID, DATE_OFORML, SVED_NUM, 
 PASP_ID, NUM_NAR, NUM_DOVER, PERER_ID, DATE_EDIT, 
 JKCOMMIT, GROTP_ID, PERECH_TEXPD_DATE, PERECH_TEXPD_NUM, SUM_PROD, 
 SUM_AKCIZ, SUM_PROD_NDS, TARIF_NDS, SUM_VOZN11, SUM_VOZN11_NDS, 
 SUM_VOZN12, SUM_VOZN12_NDS, NACENKA, SUM_STRAH, CENA_VOZN, 
 TARIF_GUARD, TARIF_GUARD_NDS, TARIF_ALT, CENA, CENA_OTP, 
 NUM_AKT, BILL_POS_ID, PROTO_NUM, PROTO_DATE, NO_AKCIZ, 
 PERECH_GUARD_DATE, PERECH_GUARD_NUM, KOL_NET)
AS 
SELECT /*+  */
ID, FLG_OPERDATA, MESTO_ID, NOM_ZD, PROD_ID_NPR,
 TEX_PD_ID, NUM_CIST, DATE_OTGR, VES, VES_BRUTTO,
 VES_ED, KOL_ED, TARIF, TARIF19, TARIF_ORIG,
 NUM_KVIT, DATE_KVIT, NUM_MILITARY, FLG_DOP_CIST, FLG_VAG_KLIENT,
 VAGOWNER_ID, VAGONTYPE_ID, KALIBR_ID, VES_CIST, DATE_VOZ,
 KVIT_VOZ, SUM_VOZ, DATE_OTV, PLOMBA1, PLOMBA2,
 ROSINSPL1, ROSINSPL2, VZLIV, TEMPER, FAKT_PL,
 FORMNAKL_ID, SHABEXP_ID, GTD, EXPED_ID, VETKA_OTP_ID,
 NUM_EXP_MAR, BILL_ID, SVED_ID, DATE_OFORML, SVED_NUM,
 PASP_ID, NUM_NAR, NUM_DOVER, PERER_ID, DATE_EDIT,
 JKCOMMIT, GROTP_ID, PERECH_TEXPD_DATE, PERECH_TEXPD_NUM, SUM_PROD,
 SUM_AKCIZ, SUM_PROD_NDS, TARIF_NDS, SUM_VOZN11, SUM_VOZN11_NDS,
 SUM_VOZN12, SUM_VOZN12_NDS, NACENKA, SUM_STRAH, CENA_VOZN,
 TARIF_GUARD, TARIF_GUARD_NDS, TARIF_ALT, CENA, CENA_OTP,
 NUM_AKT, BILL_POS_ID, PROTO_NUM, PROTO_DATE, NO_AKCIZ, PERECH_GUARD_DATE,PERECH_GUARD_NUM,KOL_NET FROM KVIT
UNION ALL
SELECT /*+  */
ID, FLG_OPERDATA, MESTO_ID, NOM_ZD, PROD_ID_NPR,
 TEX_PD_ID, NUM_CIST, DATE_OTGR, VES, VES_BRUTTO,
 VES_ED, KOL_ED, TARIF, TARIF19, TARIF_ORIG,
 NUM_KVIT, DATE_KVIT, NUM_MILITARY, FLG_DOP_CIST, FLG_VAG_KLIENT,
 VAGOWNER_ID, VAGONTYPE_ID, KALIBR_ID, VES_CIST, DATE_VOZ,
 KVIT_VOZ, SUM_VOZ, DATE_OTV, PLOMBA1, PLOMBA2,
 ROSINSPL1, ROSINSPL2, VZLIV, TEMPER, FAKT_PL,
 FORMNAKL_ID, SHABEXP_ID, GTD, EXPED_ID, VETKA_OTP_ID,
 NUM_EXP_MAR, BILL_ID, SVED_ID, DATE_OFORML, SVED_NUM,
 PASP_ID, NUM_NAR, NUM_DOVER, PERER_ID, DATE_EDIT,
 JKCOMMIT, GROTP_ID, PERECH_TEXPD_DATE, PERECH_TEXPD_NUM, SUM_PROD,
 SUM_AKCIZ, SUM_PROD_NDS, TARIF_NDS, SUM_VOZN11, SUM_VOZN11_NDS,
 SUM_VOZN12, SUM_VOZN12_NDS, NACENKA, SUM_STRAH, CENA_VOZN,
 TARIF_GUARD, TARIF_GUARD_NDS, TARIF_ALT, CENA, CENA_OTP,
 NUM_AKT, BILL_POS_ID, PROTO_NUM, PROTO_DATE, NO_AKCIZ, PERECH_GUARD_DATE,PERECH_GUARD_NUM,KOL_NET FROM DOP_KVIT;

