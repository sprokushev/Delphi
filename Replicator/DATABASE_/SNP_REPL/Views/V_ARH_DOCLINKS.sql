--
-- V_ARH_DOCLINKS  (View) 
--
CREATE OR REPLACE FORCE VIEW SNP_REPL.V_ARH_DOCLINKS
(RN, IN_DOC, OUT_DOC, LINK_TYPE)
AS 
SELECT /*+ RULE */ "RN","IN_DOC","OUT_DOC","LINK_TYPE"  FROM PARUS.DOCLINKS
WHERE IN_DOC IN (SELECT RN FROM V_ARH_DOCINPT)
  AND OUT_DOC IN (SELECT RN FROM V_ARH_DOCOUTPT);


