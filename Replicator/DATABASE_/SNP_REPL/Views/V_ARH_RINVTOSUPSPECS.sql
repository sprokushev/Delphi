--
-- V_ARH_RINVTOSUPSPECS  (View) 
--
CREATE OR REPLACE FORCE VIEW SNP_REPL.V_ARH_RINVTOSUPSPECS
(RN, PRN, COMPANY, CRN, TAXGR, 
 GOODSSUPPLY, NOMMODIF, NOMNMODIFPACK, ARTICLE, PRICE, 
 PRICEMEAS, QUANT, QUANTALT, SUMMTAX, SUMM, 
 BEGINDATE, ENDDATE, NOTE, CELL)
AS 
SELECT /*+ RULE */ "RN","PRN","COMPANY","CRN","TAXGR","GOODSSUPPLY","NOMMODIF","NOMNMODIFPACK","ARTICLE","PRICE","PRICEMEAS","QUANT","QUANTALT","SUMMTAX","SUMM","BEGINDATE","ENDDATE","NOTE","CELL" FROM PARUS.RINVTOSUPSPECS
WHERE PRN IN (SELECT RN FROM V_ARH_RINVTOSUP);


