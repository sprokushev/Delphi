-- 
-- Non Foreign Key Constraints for Table KLS_GDOR 
-- 
ALTER TABLE MASTER.KLS_GDOR ADD (
  CHECK ("GDOR_NAME" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.KLS_GDOR ADD (
  CHECK ("SHORT_NAME" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.KLS_GDOR ADD (
  CONSTRAINT GDOR_PK
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.GDOR_PK
  ENABLE VALIDATE);

