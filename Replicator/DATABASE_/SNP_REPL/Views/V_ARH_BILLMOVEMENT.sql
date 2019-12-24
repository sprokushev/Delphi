--
-- V_ARH_BILLMOVEMENT  (View) 
--
CREATE OR REPLACE FORCE VIEW SNP_REPL.V_ARH_BILLMOVEMENT
(RN, COMPANY, CRN, PRN, OPER_TYPE, 
 OPER_DATE, CALC_TYPE, AGENT, ASSIGNMENT_ACT, RECEPTION_ACT, 
 BILL_SUM, BILL_SUM_BASE, PROFIT, DISCOUNT, DISCOUNT_BASE, 
 INCOME, INCOME_BASE, STATE, NOTE, AMOUNT, 
 PERIOD_FROM, PERIOD_TO)
AS 
SELECT /*+ RULE */ "RN","COMPANY","CRN","PRN","OPER_TYPE","OPER_DATE","CALC_TYPE","AGENT","ASSIGNMENT_ACT","RECEPTION_ACT","BILL_SUM","BILL_SUM_BASE","PROFIT","DISCOUNT","DISCOUNT_BASE","INCOME","INCOME_BASE","STATE","NOTE","AMOUNT","PERIOD_FROM","PERIOD_TO"
FROM PARUS.BILLMOVEMENT
WHERE (ASSIGNMENT_ACT IN (SELECT RN FROM V_ARH_BILLASSACT) OR ASSIGNMENT_ACT IS NULL)
  AND PRN IN (SELECT RN FROM V_ARH_BILLCARD)
  AND (RECEPTION_ACT IN (SELECT RN FROM V_ARH_BILLRECPACT) OR RECEPTION_ACT IS NULL);


