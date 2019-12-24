--
-- V_ARH_STOREOPERJOURN  (View) 
--
CREATE OR REPLACE FORCE VIEW SNP_REPL.V_ARH_STOREOPERJOURN
(RN, COMPANY, UNITCODE, GOODSSUPPLY, ARTICLE, 
 STOPER, DOCTYPE, DOCPREF, DOCNUMB, DOCDATE, 
 OPERDATE, SIGNPLAN, FACEACC, QUANT, QUANTALT, 
 OPER_TYPE)
AS 
SELECT /*+ RULE */ "RN","COMPANY","UNITCODE","GOODSSUPPLY","ARTICLE","STOPER","DOCTYPE","DOCPREF","DOCNUMB","DOCDATE","OPERDATE","SIGNPLAN","FACEACC","QUANT","QUANTALT","OPER_TYPE" FROM PARUS.STOREOPERJOURN
WHERE GOODSSUPPLY IN (SELECT RN FROM SNP_REPL.V_ARH_GOODSSUPPLY);


