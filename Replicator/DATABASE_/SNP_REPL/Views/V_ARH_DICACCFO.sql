--
-- V_ARH_DICACCFO  (View) 
--
CREATE OR REPLACE FORCE VIEW SNP_REPL.V_ARH_DICACCFO
(RN, COMPANY, PREF_NUMB, REG_NUMB, DIR_RULE, 
 ACC_DATE, PR_CODE, PR_BANK_CODE, PR_SENDER_CODE, CS_CODE, 
 CS_BANK_CODE, CS_RECEIVER_CODE, BASE_TYPE, BASE_NUMB, BASE_DATE, 
 CONF_TYPE, CONF_NUMB, CONF_DATE, COMMEN, INCLUDE_DATE, 
 STORN_DATE, SIGN_EXPORT, TYPE_ACC_FO, CRN, PAY_DATE, 
 ONCOME_DATE, WORK_DATE, WORK_STATE, ALL_SUM_WOUT, ALL_SUM_NDS, 
 ALL_GSM_TAX, ALL_SUM_TOTAL, ALL_YES_SUM_WOUT, ALL_YES_SUM_NDS, ALL_YES_GSM_TAX, 
 ALL_YES_SUM_TOTAL, ALL_SUM_NSP, ALL_YES_SUM_NSP, JUR_PERS, WORK_STATE_TAX, 
 INC_LIST_DATE)
AS 
SELECT /*+ RULE */ A.*
FROM PARUS.DICACCFO A
-- ������ �� ��������
WHERE A.CRN IN (SELECT CRN FROM SNP_REPL.V_CATALOG_LIST WHERE DOC_TYPE='AccountFactOutput');


