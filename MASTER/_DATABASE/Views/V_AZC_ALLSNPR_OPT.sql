--
-- V_AZC_ALLSNPR_OPT  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_AZC_ALLSNPR_OPT
(NAME, NAME_NPR, VES, VOL, DATE_OPER)
AS 
SELECT C.NAME, B.NAME_NPR, SUM (A.VES) AS VES, SUM(A.VolUME) AS VOL, a.DATE_OPER
FROM AZC_OPERATION A, KLS_PROD B, AZC_PROD_GROUP C, KLS_ORG_KIND D, ORG_STRUCTURE E
WHERE 
A.PROD_ID_NPR = B.ID_NPR
AND B.AZC_PR_GRP_ID  = C.ID
AND A.TYPE_OPER_ID = 1
AND a.ORG_STRU_ID = E.ID
AND E.ORG_KIND_ID = D.ID
AND D.GROUP_KIND_ID <> 2
GROUP BY C.NAME, B.NAME_NPR,a.DATE_OPER
UNION
--������ �����
SELECT C.NAME, B.NAME_NPR, SUM (A.VES) AS VES, SUM(A.VolUME) AS VOL, a.DATE_OPER  
FROM AZC_OPERATION A, KLS_PROD B, AZC_PROD_GROUP C, KLS_ORG_KIND D, ORG_STRUCTURE E
WHERE 
A.PROD_ID_NPR = B.ID_NPR
AND B.AZC_PR_GRP_ID  = C.ID
AND A.TYPE_OPER_ID = 4
AND a.ORG_STRU_ID = E.ID
AND E.ORG_KIND_ID = D.ID
AND D.GROUP_KIND_ID <> 2
GROUP BY C.NAME, B.NAME_NPR,a.DATE_OPER;


