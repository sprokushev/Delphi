-- 
-- Non Foreign Key Constraints for Table R3_CC 
-- 
ALTER TABLE MASTER.R3_CC ADD (
  CHECK ("IS_AUTO_LINK" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.R3_CC ADD (
  CONSTRAINT CC_PK
  PRIMARY KEY
  (EKKO_ZZ021)
  USING INDEX MASTER.CC_PK
  ENABLE VALIDATE);

