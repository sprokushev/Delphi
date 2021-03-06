-- 
-- Non Foreign Key Constraints for Table KLS_VAGONTYPE 
-- 
ALTER TABLE MASTER.KLS_VAGONTYPE ADD (
  CHECK ("VAGONTYPE_NAME" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.KLS_VAGONTYPE ADD (
  CONSTRAINT VAGONTYPE_PK
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.VAGONTYPE_PK
  ENABLE VALIDATE);

