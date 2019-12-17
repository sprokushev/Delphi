-- 
-- Non Foreign Key Constraints for Table SOOB_EXP 
-- 
ALTER TABLE MASTER.SOOB_EXP ADD (
  CHECK ("REP_DATE" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.SOOB_EXP ADD (
  CHECK ("POS_ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.SOOB_EXP ADD (
  CONSTRAINT SOOB_EXP_PK
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.SOOB_EXP_PK
  ENABLE VALIDATE);

