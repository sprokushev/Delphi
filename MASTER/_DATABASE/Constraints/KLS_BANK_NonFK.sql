-- 
-- Non Foreign Key Constraints for Table KLS_BANK 
-- 
ALTER TABLE MASTER.KLS_BANK ADD (
  CHECK ("BANK_NAME" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.KLS_BANK ADD (
  CONSTRAINT BANK_PK
  PRIMARY KEY
  (KORS)
  USING INDEX MASTER.BANK_PK
  ENABLE VALIDATE);

