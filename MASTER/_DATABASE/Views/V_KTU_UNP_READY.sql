--
-- V_KTU_UNP_READY  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_KTU_UNP_READY
(YY, MM, KOD_PLAT, NAME_PLAT, KOD_PROD, 
 NAME_PROD, TIP_ERROR, NOM_ZD_KTU, NARIAD_KTU, DOVEREN_KTU, 
 VES_KTU, NOM_ZD_UNP, NARIAD_UNP, DOVEREN_UNP, VES_UNP, 
 DATE_END, MAX_DATE_NAR, CHECK_DATE)
AS 
SELECT YY, MM, kod_plat, name_plat, kod_prod, name_prod, TIP_ERROR, NOM_ZD_KTU, NARIAD_KTU, DOVEREN_KTU, VES_KTU, 
  NOM_ZD_UNP, NARIAD_UNP, DOVEREN_UNP, VES_UNP, date_end, MAX_DATE_NAR, CHECK_DATE
FROM V_KTU_UNP 
ORDER BY YY,MM,NAME_PLAT,NAME_PROD,NOM_ZD_KTU,DOVEREN_KTU,NARIAD_KTU,NOM_ZD_UNP,DOVEREN_UNP,NARIAD_UNP;


