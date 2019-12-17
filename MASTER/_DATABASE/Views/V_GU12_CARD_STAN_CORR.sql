--
-- V_GU12_CARD_STAN_CORR  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_GU12_CARD_STAN_CORR
(STAN_ID, SOBVAG, STANNAZN, KOL_CORR, VES_CORR, 
 KOL_PLAN, VES_PLAN, KOL_FAKT, VES_FAKT)
AS 
SELECT
A.STAN_ID
,A.SOBVAG
,MAX(S.STAN_NAME) AS STANNAZN
,SUM(A.KOL_CORR) AS KOL_CORR
,SUM(A.VES_CORR) AS VES_CORR
,SUM(A.KOL_PLAN) AS KOL_PLAN
,SUM(A.VES_PLAN) AS VES_PLAN
,SUM(A.KOL_FAKT) AS KOL_FAKT
,SUM(A.VES_FAKT) AS VES_FAKT
FROM V_GU12_CARD_N A, V_GU12_STAN_NAZN S
WHERE A.STAN_ID=S.ID 
GROUP BY STAN_ID,SOBVAG
ORDER BY STANNAZN,SOBVAG;

