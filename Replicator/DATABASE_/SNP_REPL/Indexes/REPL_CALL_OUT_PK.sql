--
-- REPL_CALL_OUT_PK  (Index) 
--
CREATE UNIQUE INDEX SNP_REPL.REPL_CALL_OUT_PK ON SNP_REPL.REPL_CALL_OUT
(SITE_SOURCE_RN, SITE_DEST_RN, RN);

