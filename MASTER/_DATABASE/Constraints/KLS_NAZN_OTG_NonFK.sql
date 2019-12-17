-- 
-- Non Foreign Key Constraints for Table KLS_NAZN_OTG 
-- 
ALTER TABLE MASTER.KLS_NAZN_OTG ADD (
  CHECK ("NAZN_OTG_NAME" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.KLS_NAZN_OTG ADD (
  CONSTRAINT NAZN_OTG_PK
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.NAZN_OTG_PK
  ENABLE VALIDATE);

