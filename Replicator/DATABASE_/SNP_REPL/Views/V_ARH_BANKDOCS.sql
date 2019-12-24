--
-- V_ARH_BANKDOCS  (View) 
--
CREATE OR REPLACE FORCE VIEW SNP_REPL.V_ARH_BANKDOCS
(RN, COMPANY, CRN, BANK_DOCTYPE, BANK_DOCPREF, 
 BANK_DOCNUMB, BANK_DOCDATE, VALID_DOCTYPE, VALID_DOCNUMB, VALID_DOCDATE, 
 AGENT_FROM, AGENT_TO, AGENT_FROM_ACC, AGENT_TO_ACC, BALUNIT, 
 TYPE_OPER, PAY_SEQ, PAY_DATA, PAY_INFO, PAY_NOTE, 
 BANK_OPER, PAY_SUM, TAX_SUM, PERCENT_TAX_SUM, CURRENCY, 
 PAY_TYPE, PAY_KIND, FROM_NUMB, FROM_DATE, JUR_PERS, 
 UNALLOTTED_SUM, CBS_STATE, CBS_DATE, INCOMECLASS, TRANSREASON, 
 TRANSPERIOD, TRANSNUMBER, TRANSDATE, TRANSTYPE)
AS 
SELECT /*+ RULE */ A.*
FROM PARUS.BANKDOCS A
-- ������ �� ��������
WHERE A.CRN IN (SELECT CRN FROM SNP_REPL.V_CATALOG_LIST WHERE DOC_TYPE='BankDocuments')
/* rn in (280847200,218238314,248980727,263618314,276553574,276553577,278942812,296869167,312975075,312975229,313767751,313767785,313767789,314117435,314117469,314117593,314650207,314650221,322199159,323640738,324318037,324991797)*/
;


