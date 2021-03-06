-- 
-- Non Foreign Key Constraints for Table REPL_ANSW_IN 
-- 
ALTER TABLE MASTER.REPL_ANSW_IN ADD (
  CHECK ("REPL_LIST" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.REPL_ANSW_IN ADD (
  CHECK ("SRC_SITE" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.REPL_ANSW_IN ADD (
  CHECK ("DST_SITE" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.REPL_ANSW_IN ADD (
  CHECK ("REPL_ANSW" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.REPL_ANSW_IN ADD (
  CHECK ("REPLSTATUS" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.REPL_ANSW_IN ADD (
  CHECK ("OSUSER" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.REPL_ANSW_IN ADD (
  CHECK ("FILE_TYPE" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.REPL_ANSW_IN ADD (
  CONSTRAINT R_ANSW_I_PK
  PRIMARY KEY
  (REPL_ID)
  USING INDEX MASTER.R_ANSW_I_PK
  ENABLE VALIDATE);

