--
-- V_GD_AGENT_2006_MONTH_ALL_1  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_GD_AGENT_2006_MONTH_ALL_1
(FROM_DATE, BEGIN_DATE, END_DATE, RAZN_NUM, RAZN_DATE, 
 INPUT_DATE, STAN_OLD_ID, STAN_OLD_NAME, STAN_ID, STAN_NAME, 
 POLUCH_ID, POLUCH_NAME, PROD_ID, PROD_NAME, KOL, 
 VES, SPEED_KOL, SPEED_VES, PRIM, STATUS_ZAKAZ_ID, 
 MAIN_RAZN_NUM, MAIN_RAZN_DATE, MAIN_INPUT_DATE)
AS 
SELECT "FROM_DATE","BEGIN_DATE","END_DATE","RAZN_NUM","RAZN_DATE","INPUT_DATE","STAN_OLD_ID","STAN_OLD_NAME","STAN_ID","STAN_NAME","POLUCH_ID","POLUCH_NAME","PROD_ID","PROD_NAME","KOL","VES","SPEED_KOL","SPEED_VES","PRIM","STATUS_ZAKAZ_ID","MAIN_RAZN_NUM","MAIN_RAZN_DATE","MAIN_INPUT_DATE" FROM V_GD_AGENT_2006_MONTH_ALL
WHERE FROM_DATE<BEGIN_DATE;


