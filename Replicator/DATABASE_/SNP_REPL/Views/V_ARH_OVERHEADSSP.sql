--
-- V_ARH_OVERHEADSSP  (View) 
--
CREATE OR REPLACE FORCE VIEW SNP_REPL.V_ARH_OVERHEADSSP
(RN, PRN, COMPANY, GOODSSUPPLY, COURSE, 
 COURSE_RATE, SUMM, SUMM_DOC, SUMM_SOURCE, SUMM_NDS, 
 SUMM_DOC_NDS, SUMM_SOURCE_NDS)
AS 
SELECT /*+ RULE */ "RN","PRN","COMPANY","GOODSSUPPLY","COURSE","COURSE_RATE","SUMM","SUMM_DOC","SUMM_SOURCE","SUMM_NDS","SUMM_DOC_NDS","SUMM_SOURCE_NDS" FROM PARUS.OVERHEADSSP
WHERE PRN IN (select rn from PARUS.OVERHEADS where stoper =898984245);


