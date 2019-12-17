-- 
-- Non Foreign Key Constraints for Table VOZVRAT 
-- 
ALTER TABLE MASTER.VOZVRAT ADD (
  CHECK ("NUM_CIST" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.VOZVRAT ADD (
  CHECK ("NUM_KVIT" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.VOZVRAT ADD (
  CONSTRAINT VOZVRAT_PK
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.VOZVRAT_PK
  ENABLE VALIDATE);
