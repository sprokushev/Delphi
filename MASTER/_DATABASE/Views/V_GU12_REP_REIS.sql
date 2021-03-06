--
-- V_GU12_REP_REIS  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_GU12_REP_REIS
(ID, ID_A, PDATE, SOBSTVVAG_ID, SOBSTVVAG_NAME, 
 STAN_ID, STANNAZN, STANNAZN_KOD, STATES_NAME, STATES_KOD, 
 STAN_PER_ID, STANPER, STANPER_KOD, GRUZPOL_ID, GRUZPOL_OKPO, 
 GRUZPOL, VIDOTPR_ID, VIDOTPR_NAME, VIDOTPR, KOL_VAG, 
 VES, MRK, PLAT_ID, PLAT_NAME, PRINVAG_ID, 
 PRINVAG_NAME)
AS 
SELECT
R.ID,
R.ID_A,
R.PDATE,
R.SOBSTVVAG_ID,
SV.NAME AS SOBSTVVAG_NAME,
R.STAN_ID,
SN.STAN_NAME AS STANNAZN ,
SN.STAN_KOD AS STANNAZN_KOD,
SN.STATES_NAME,
SN.STATES_KOD,
R.STAN_PER_ID,
SP.STAN_NAME AS STANPER,
SP.STANPER_KOD,
R.GRUZPOL_ID,
GP.OKPO AS GRUZPOL_OKPO,
GP.PREDPR_NAME AS GRUZPOL,
R.VIDOTPR_ID,
VO.NAME AS VIDOTPR_NAME,
VO.TAG AS VIDOTPR,
R.KOL_VAG,
R.VES,
R.MRK,
R.PLAT_ID,
PL.PLAT_NAME,
R.PRINVAG_ID,
PV.ABBR AS PRINVAG_NAME
FROM
GU12_B R,
KLS_GD_SOBSTVVAG SV,
V_GU12_STAN_NAZN SN,
V_GU12_STAN_PER SP,
V_GU12_GRUZ_POL GP,
V_GU12_PLAT PL,
KLS_GD_VID_OTPR VO,
KLS_GD_PRINVAG PV
WHERE
R.ID_A=FOR_TEMP.GET_AS_NUM('ID_ZAYAV','MASTER','GU12')
AND R.SOBSTVVAG_ID=SV.ID(+)
AND R.STAN_ID=SN.ID(+)
AND R.GRUZPOL_ID=GP.ID(+)
AND R.VIDOTPR_ID=VO.ID(+)
AND R.STAN_PER_ID=SP.ID(+)
AND R.PLAT_ID=PL.PLAT_ID(+)
AND R.PRINVAG_ID=PV.ID(+)
ORDER BY ID;


