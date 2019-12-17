--
-- V_PLAN_FACT_GD  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_PLAN_FACT_GD
(ID, TIP_ROW, GROUP_ORDER, GROUP_NAME, PROD_ORDER, 
 PROD_ID_NPR, PLANSTRU_ORDER, PLANSTRU_ID, DATE_PLAN, PLAN_MON_C, 
 PLAN_MON_V, PLAN_MON_SOBS_C, PLAN_MON_SOBS_V, PLAN_NAR_C, PLAN_NAR_V, 
 PLAN_NAR_SOBS_C, PLAN_NAR_SOBS_V, DATE_FACT, TIME_FACT, FACT_C, 
 FACT_V, FACT_SOBS_C, FACT_SOBS_V)
AS 
SELECT "ID","TIP_ROW","GROUP_ORDER","GROUP_NAME","PROD_ORDER","PROD_ID_NPR","PLANSTRU_ORDER","PLANSTRU_ID",
"DATE_PLAN",PLAN_MON_C, PLAN_MON_V, PLAN_MON_SOBS_C, PLAN_MON_SOBS_V,PLAN_NAR_C, PLAN_NAR_V, PLAN_NAR_SOBS_C, PLAN_NAR_SOBS_V,
"DATE_FACT","TIME_FACT",FACT_C, FACT_V, FACT_SOBS_C, FACT_SOBS_V FROM PLAN_FACT
WHERE TIP_ROW='���������'
  AND TERMINAL_NAME = For_Init.GetCurrTerm
  AND OSUSER_NAME = For_Init.GetCurrUser;


