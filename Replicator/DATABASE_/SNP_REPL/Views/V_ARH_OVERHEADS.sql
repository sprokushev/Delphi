--
-- V_ARH_OVERHEADS  (View) 
--
CREATE OR REPLACE FORCE VIEW SNP_REPL.V_ARH_OVERHEADS
(RN, COMPANY, UNITCODE, NOMEN, NOMMODIF, 
 DOC_TYPE, DOC_NUMB, DOC_DATE, SUMM, SPREAD_SUM, 
 CURRENCY, CURCOURSE, CURBASECOURS, SIGNSPREAD, WORK_DATE, 
 STOPER, SIGNGOODSREP, GROUP_CODE_COND, NOMEN_COND, TAX_GROUP_COND, 
 FORMULA, NOTE, SUMM_NDS, SPREAD_SUM_NDS, BASE_OVERHEAD)
AS 
select /*+ RULE */ "RN","COMPANY","UNITCODE","NOMEN","NOMMODIF","DOC_TYPE","DOC_NUMB","DOC_DATE","SUMM","SPREAD_SUM","CURRENCY","CURCOURSE","CURBASECOURS","SIGNSPREAD","WORK_DATE","STOPER","SIGNGOODSREP","GROUP_CODE_COND","NOMEN_COND","TAX_GROUP_COND","FORMULA","NOTE","SUMM_NDS","SPREAD_SUM_NDS","BASE_OVERHEAD"  from PARUS.OVERHEADS where stoper =898984245;


