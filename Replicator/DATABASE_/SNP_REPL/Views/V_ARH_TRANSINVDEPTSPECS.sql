--
-- V_ARH_TRANSINVDEPTSPECS  (View) 
--
CREATE OR REPLACE FORCE VIEW SNP_REPL.V_ARH_TRANSINVDEPTSPECS
(RN, COMPANY, CRN, PRN, GOODSPARTY, 
 NOMNMODIFPACK, NOMMODIF, ARTICLE, PRICE, QUANT, 
 QUANTALT, PRICEMEAS, SUMMWITHNDS, BEGINDATE, ENDDATE, 
 NOTE, CELL)
AS 
SELECT /*+ RULE */ "RN","COMPANY","CRN","PRN","GOODSPARTY","NOMNMODIFPACK","NOMMODIF","ARTICLE","PRICE","QUANT","QUANTALT","PRICEMEAS","SUMMWITHNDS","BEGINDATE","ENDDATE","NOTE","CELL" FROM PARUS.TRANSINVDEPTSPECS
WHERE PRN IN (SELECT RN FROM SNP_REPL.V_ARH_TRANSINVDEPT);


