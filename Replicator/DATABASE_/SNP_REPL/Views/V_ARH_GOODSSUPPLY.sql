--
-- V_ARH_GOODSSUPPLY  (View) 
--
CREATE OR REPLACE FORCE VIEW SNP_REPL.V_ARH_GOODSSUPPLY
(RN, COMPANY, PRN, STORE, RESTPLAN, 
 RESTPLANALT, RESTFACT, RESTFACTALT, RESERV, RESERVALT)
AS 
SELECT /*+ RULE */ "RN","COMPANY","PRN","STORE","RESTPLAN","RESTPLANALT","RESTFACT","RESTFACTALT","RESERV","RESERVALT" FROM PARUS.GOODSSUPPLY
-- ������ �� ������� (������� ����������)
WHERE STORE IN (SELECT STORE_RN FROM SNP_REPL.V_STORE_LIST)
/*rn=249603684*/
;


