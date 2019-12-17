--
-- V_GU12_REP_SVERKA  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_GU12_REP_SVERKA
(NOM_Z, STAN_NAME, KOL_B, VES_B, KOL_BR, 
 VES_BR)
AS 
SELECT A.NOM_Z,S.STAN_NAME,B.KOL_VAG AS KOL_B,B.VES AS VES_B,R.KOL_BR,R.VES_BR
FROM GU12_A_TEST A,GU12_B_TEST B,V_GU12_STAN_NAZN S,
(SELECT
B.ID
,ROUND(SUM(BR.KOL_VAG)) AS KOL_BR
,ROUND(SUM(BR.VES)) AS VES_BR
,MAX(B.ID_A) AS ID_A
FROM
GU12_B B
,GU12_BR BR
WHERE
B.ID=BR.ID_B(+)
AND BR.DATE_R BETWEEN FOR_TEMP.GET_AS_DATE('DBEG_SVER','MASTER','GU12') AND FOR_TEMP.GET_AS_DATE('DEND_SVER','MASTER','GU12')
--AND BR.DATE_R>=TO_DATE('01.01.2005','DD.MM.YYYY')
--AND BR.DATE_R<=TO_DATE('31.01.2005','DD.MM.YYYY')
GROUP BY B.ID) R
WHERE A.ID=B.ID_A
      AND B.ID=R.ID
	  AND B.STAN_ID=S.ID
	  AND (B.KOL_VAG<>R.KOL_BR OR B.VES<>R.VES_BR);


