-- 
-- Non Foreign Key Constraints for Table KLS_GD_GROUP 
-- 
ALTER TABLE MASTER.KLS_GD_GROUP ADD (
  CHECK ("NAME" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.KLS_GD_GROUP ADD (
  CONSTRAINT GD_GROUP_PK
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.GD_GROUP_PK
  ENABLE VALIDATE);

