-- 
-- Non Foreign Key Constraints for Table KLS_UPAK 
-- 
ALTER TABLE MASTER.KLS_UPAK ADD (
  CHECK ("NAME" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.KLS_UPAK ADD (
  CONSTRAINT UPAK_PK
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.UPAK_PK
  ENABLE VALIDATE);

