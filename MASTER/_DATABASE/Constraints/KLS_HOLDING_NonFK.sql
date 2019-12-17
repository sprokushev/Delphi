-- 
-- Non Foreign Key Constraints for Table KLS_HOLDING 
-- 
ALTER TABLE MASTER.KLS_HOLDING ADD (
  CHECK ("HOLDING_NAME" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.KLS_HOLDING ADD (
  CHECK ("BOSS" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.KLS_HOLDING ADD (
  CHECK ("SORTBY" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.KLS_HOLDING ADD (
  CONSTRAINT HOLDING_PK
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.HOLDING_PK
  ENABLE VALIDATE);
