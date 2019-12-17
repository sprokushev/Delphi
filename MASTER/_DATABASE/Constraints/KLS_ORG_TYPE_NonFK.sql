-- 
-- Non Foreign Key Constraints for Table KLS_ORG_TYPE 
-- 
ALTER TABLE MASTER.KLS_ORG_TYPE ADD (
  CHECK ("NAME" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.KLS_ORG_TYPE ADD (
  CONSTRAINT ORG_TYPE_PK
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.ORG_TYPE_PK
  ENABLE VALIDATE);
