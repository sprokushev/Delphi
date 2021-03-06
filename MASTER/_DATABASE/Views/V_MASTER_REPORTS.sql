--
-- V_MASTER_REPORTS  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_MASTER_REPORTS
(ID, APP_NAME, REP_ID, REPORT_NAME, REPORT_FILE, 
 REPORT_GROUP, REPORT_TYPE, REPORT_TITLE, BEGIN_DATE, BEGIN_TIME, 
 END_DATE, END_TIME, DATE_REE, DATE_PLAN, FROM_PARUS, 
 VIEW_PROD, VIEW_DAYS, IS_AGENT, DIAGRAM_TYPE, DIAGRAM_KIND, 
 AXES_X_NAME, COUNT_COLS_X, AXES_Y_NAME, COUNT_COLS_Y, FILIAL_ID, 
 GROUP_KIND_ID, AZC_ID, DOG_NUMBER, PLAT_ID, GRP_ID_NPR, 
 PROD_ID_NPR, IS_SNP, IS_UNP)
AS 
SELECT
ID, APP_NAME, REP_ID, REPORT_NAME, REPORT_FILE, REPORT_GROUP, REPORT_TYPE, REPORT_TITLE, BEGIN_DATE,
BEGIN_TIME, END_DATE, END_TIME, DATE_REE, DATE_PLAN, FROM_PARUS, VIEW_PROD, VIEW_DAYS, IS_AGENT,
DIAGRAM_TYPE, DIAGRAM_KIND, AXES_X_NAME, COUNT_COLS_X, AXES_Y_NAME, COUNT_COLS_Y,
FILIAL_ID, GROUP_KIND_ID, AZC_ID, DOG_NUMBER,PLAT_ID, GRP_ID_NPR,PROD_ID_NPR,IS_SNP,IS_UNP
FROM MASTER_REPORTS
WHERE TERMINAL_NAME = For_Init.GetCurrTerm
  AND OSUSER_NAME = For_Init.GetCurrUser;


