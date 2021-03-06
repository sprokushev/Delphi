-- 
-- Non Foreign Key Constraints for Table KLS_CAT_CEN_GROUP 
-- 
ALTER TABLE MASTER.KLS_CAT_CEN_GROUP ADD (
  CHECK ("CAT_CEN_GROUP_NAME" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.KLS_CAT_CEN_GROUP ADD (
  CONSTRAINT CAT_CEN_GR_PK
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.CAT_CEN_GR_PK
  ENABLE VALIDATE);

