-- 
-- Non Foreign Key Constraints for Table R3_VAGOWNER 
-- 
ALTER TABLE MASTER.R3_VAGOWNER ADD (
  CHECK ("IS_AUTO_LINK" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.R3_VAGOWNER ADD (
  CONSTRAINT PK_R3_VAGOWNER
  PRIMARY KEY
  (R3_VENDORS_ID, VAGOWNER_ID)
  USING INDEX MASTER.PK_R3_VAGOWNER
  ENABLE VALIDATE);

