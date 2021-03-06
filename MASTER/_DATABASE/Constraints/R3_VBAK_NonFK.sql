-- 
-- Non Foreign Key Constraints for Table R3_VBAK 
-- 
ALTER TABLE MASTER.R3_VBAK ADD (
  CHECK ("IS_AUTO_LINK" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.R3_VBAK ADD (
  CHECK ("VBAP_KBMENG" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.R3_VBAK ADD (
  CHECK ("VBAP_KWMENG" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.R3_VBAK ADD (
  CONSTRAINT VBAK_PK
  PRIMARY KEY
  (VBELN)
  USING INDEX MASTER.VBAK_PK
  ENABLE VALIDATE);

