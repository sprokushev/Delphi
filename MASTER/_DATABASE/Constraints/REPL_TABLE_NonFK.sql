-- 
-- Non Foreign Key Constraints for Table REPL_TABLE 
-- 
ALTER TABLE MASTER.REPL_TABLE ADD (
  CHECK ("ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.REPL_TABLE ADD (
  CHECK ("REPL_OPER" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.REPL_TABLE ADD (
  CHECK ("REPL_DATE" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.REPL_TABLE ADD (
  CHECK ("REPL_LIST" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.REPL_TABLE ADD (
  CONSTRAINT R_TABLE_PK
  PRIMARY KEY
  (REPL_ID)
  USING INDEX MASTER.R_TABLE_PK
  ENABLE VALIDATE);

