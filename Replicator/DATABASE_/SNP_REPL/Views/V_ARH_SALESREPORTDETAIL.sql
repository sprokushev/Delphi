--
-- V_ARH_SALESREPORTDETAIL  (View) 
--
CREATE OR REPLACE FORCE VIEW SNP_REPL.V_ARH_SALESREPORTDETAIL
(RN, PRN, COMPANY, OPER_DATE, OPER_CODE, 
 CONF_DOC_TYPE, CONF_DOC_NUM, CONF_DOC_DATE, PRIM_DOC_TYPE, PRIM_DOC_NUM, 
 PRIM_DOC_DATE, BALUNIT, AGENT, GR_NOMEN, NOMENCLATURE, 
 PAY_TYPE, DISP_TYPE, PR_LIST_CODE, MUNIT_CCOREL, QUANTITY_MAIN, 
 QUANTITY_ADD, QUANTITY_REAL, MUNITS_REAL, NOMEN_PARTNO, NOMEN_INDATE, 
 CURRENCY, CURSUM, EQUALSUM, PRSUMM_CUR, PRSUMM_EQV, 
 TAX_GROUP, UNITCODE, DOCUMENT, TRANS_TYPE, TRANS_NUMBER, 
 FOOD_NAME, CRN, FACEACC, COUNTRY, GTD, 
 SERIES, NOMMODIF, NOMNMODIFPACK, SUBDIV, ESCORT_DOCTYPE, 
 ESCORT_DOCNUMB, ESCORT_DOCDATE)
AS 
select /*+ RULE */ "RN","PRN","COMPANY","OPER_DATE","OPER_CODE","CONF_DOC_TYPE","CONF_DOC_NUM","CONF_DOC_DATE","PRIM_DOC_TYPE","PRIM_DOC_NUM","PRIM_DOC_DATE","BALUNIT","AGENT","GR_NOMEN","NOMENCLATURE","PAY_TYPE","DISP_TYPE","PR_LIST_CODE","MUNIT_CCOREL","QUANTITY_MAIN","QUANTITY_ADD","QUANTITY_REAL","MUNITS_REAL","NOMEN_PARTNO","NOMEN_INDATE","CURRENCY","CURSUM","EQUALSUM","PRSUMM_CUR","PRSUMM_EQV","TAX_GROUP","UNITCODE","DOCUMENT","TRANS_TYPE","TRANS_NUMBER","FOOD_NAME","CRN","FACEACC","COUNTRY","GTD","SERIES","NOMMODIF","NOMNMODIFPACK","SUBDIV","ESCORT_DOCTYPE","ESCORT_DOCNUMB","ESCORT_DOCDATE" from parus.SALESREPORTDETAIL
where prn in (select rn from V_ARH_SALESREPORTMAIN);


