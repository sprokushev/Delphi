--
-- V_ARH_SHEEPDIRSCUSTSPECS  (View) 
--
CREATE OR REPLACE FORCE VIEW SNP_REPL.V_ARH_SHEEPDIRSCUSTSPECS
(RN, COMPANY, CRN, PRN, TAXGR, 
 GOODSPARTY, NOMNMODIFPACK, NOMMODIF, ARTICLE, PRICE, 
 DISCOUNT, QUANT, QUANTALT, PRICEMEAS, SUMM, 
 SUMMWITHNDS, BEGINDATE, ENDDATE, NOTE)
AS 
SELECT /*+ RULE */ "RN","COMPANY","CRN","PRN","TAXGR","GOODSPARTY","NOMNMODIFPACK","NOMMODIF","ARTICLE","PRICE","DISCOUNT","QUANT","QUANTALT","PRICEMEAS","SUMM","SUMMWITHNDS","BEGINDATE","ENDDATE","NOTE" FROM PARUS.SHEEPDIRSCUSTSPECS
WHERE PRN IN (SELECT RN FROM V_ARH_SHEEPDIRSCUST);

