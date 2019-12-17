-- 
-- Non Foreign Key Constraints for Table KLS_USER 
-- 
ALTER TABLE MASTER.KLS_USER ADD (
  CHECK ("USER_NAME" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.KLS_USER ADD (
  CONSTRAINT KLS_USER_PK
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.KLS_USER_PK
  ENABLE VALIDATE);

