-- 
-- Non Foreign Key Constraints for Table R3_MATERIALS 
-- 
ALTER TABLE MASTER.R3_MATERIALS ADD (
  CHECK ("IS_AUTO_LINK" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.R3_MATERIALS ADD (
  CONSTRAINT MATERIALS_PK
  PRIMARY KEY
  (VBAP_MATNR)
  USING INDEX MASTER.MATERIALS_PK
  ENABLE VALIDATE);

