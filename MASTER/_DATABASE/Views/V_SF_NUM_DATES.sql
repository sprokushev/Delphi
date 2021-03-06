--
-- V_SF_NUM_DATES  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_SF_NUM_DATES
(SCHETF, DATA_VYP_SF, NUM_5, DATE_OTGR)
AS 
SELECT "SCHETF","DATA_VYP_SF","NUM_5","DATE_OTGR" FROM
(
SELECT ASF.SCHETF,ASF.DATA_VYP_SF,MAX(AP.NUM_5) AS NUM_5, MAX(AP.DATE_OTGR) AS DATE_OTGR
FROM SVETA.SF_POZ_PROD AP,SVETA.SF_SFAK_PROD ASF
WHERE AP.KOD_PROD=ASF.KOD_PROD
GROUP BY ASF.DATA_VYP_SF,ASF.schetf
)
ORDER BY DATA_VYP_SF,NUM_5,schetf;


