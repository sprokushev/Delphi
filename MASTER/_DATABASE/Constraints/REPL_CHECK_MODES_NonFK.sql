-- 
-- Non Foreign Key Constraints for Table REPL_CHECK_MODES 
-- 
ALTER TABLE MASTER.REPL_CHECK_MODES ADD (
  CHECK ("NAME" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.REPL_CHECK_MODES ADD (
  CONSTRAINT R_CHK_M_PK
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.R_CHK_M_PK
  ENABLE VALIDATE);

