-- 
-- Non Foreign Key Constraints for Table REPL_ANSW 
-- 
ALTER TABLE SNP_REPL.REPL_ANSW ADD (
  CONSTRAINT REPL_ANSW_PK
  PRIMARY KEY
  (SITE_SOURCE_RN, SITE_DEST_RN, RN)
  USING INDEX SNP_REPL.REPL_ANSW_PK);

