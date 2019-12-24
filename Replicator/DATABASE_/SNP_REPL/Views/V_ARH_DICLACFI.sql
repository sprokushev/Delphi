--
-- V_ARH_DICLACFI  (View) 
--
CREATE OR REPLACE FORCE VIEW SNP_REPL.V_ARH_DICLACFI
(RN, COMPANY, PRN, PAY_DATE, FOOD_CODE, 
 FOOD_NAME, AMOUNT, MES_UNITS, TAX_GROUP, ONE_PRICE, 
 SUM_PRICE, ONE_EXCISE, ONE_EXCISE_SUM, EXCISE, ONE_GSM_TAX, 
 ONE_GSM_TAX_SUM, GSM_TAX, ONE_WOUT_SUM, SUM_WOUT, RATE_NDS, 
 ONE_SUM_NDS, SUM_NDS, ONE_SUM_TOTAL, SUM_TOTAL, RATE_NDS_OUT, 
 NDS_PR, TYPE, FOODMODIF_CODE, FOODPACK_CODE, AUTO_CALC_SIGN, 
 INCLUDE_DATE, COUNTRY, GTD, ONE_NSP, NSP, 
 ONE_NSP_SUM, STORN_PAY_RN)
AS 
SELECT /*+ RULE */ "RN","COMPANY","PRN","PAY_DATE","FOOD_CODE","FOOD_NAME","AMOUNT","MES_UNITS","TAX_GROUP","ONE_PRICE","SUM_PRICE","ONE_EXCISE","ONE_EXCISE_SUM","EXCISE","ONE_GSM_TAX","ONE_GSM_TAX_SUM","GSM_TAX","ONE_WOUT_SUM","SUM_WOUT","RATE_NDS","ONE_SUM_NDS","SUM_NDS","ONE_SUM_TOTAL","SUM_TOTAL","RATE_NDS_OUT","NDS_PR","TYPE","FOODMODIF_CODE","FOODPACK_CODE","AUTO_CALC_SIGN","INCLUDE_DATE","COUNTRY","GTD","ONE_NSP","NSP","ONE_NSP_SUM","STORN_PAY_RN"
FROM PARUS.DICLACFI
WHERE PRN IN (SELECT RN FROM V_ARH_DICACCFI);


