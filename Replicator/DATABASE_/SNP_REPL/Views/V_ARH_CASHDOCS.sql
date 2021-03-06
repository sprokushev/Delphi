--
-- V_ARH_CASHDOCS  (View) 
--
CREATE OR REPLACE FORCE VIEW SNP_REPL.V_ARH_CASHDOCS
(RN, COMPANY, CRN, CASH_DOCTYPE, CASH_DOCPREF, 
 CASH_DOCNUMB, CASH_DOCDATE, VALID_DOCTYPE, VALID_DOCNUMB, VALID_DOCDATE, 
 AGENT_FROM, AGENT_TO, BALUNIT, TYPE_OPER, PAY_INFO, 
 PAY_NOTE, CASH_OPER, PAY_SUM, TAX_SUM, PERCENT_TAX_SUM, 
 CURRENCY, TAX_SAL_SUM, JUR_PERS, UNALLOTTED_SUM)
AS 
SELECT /*+ RULE */ A.*
FROM PARUS.CASHDOCS A
WHERE CASH_DOCDATE>=TO_DATE('01.09.2004','dd.mm.yyyy')
-- ������ �� ��������
--WHERE A.CRN IN (SELECT CRN FROM SNP_REPL.CATALOG_LIST WHERE DOC_TYPE='CASHDOCS')
;


