-- 
-- Non Foreign Key Constraints for Table REPL_CALL 
-- 
ALTER TABLE SNP_REPL.REPL_CALL ADD (
  CONSTRAINT REPL_CALL_PK
  PRIMARY KEY
  (SITE_SOURCE_RN, SITE_DEST_RN, RN)
  USING INDEX SNP_REPL.REPL_CALL_PK);

