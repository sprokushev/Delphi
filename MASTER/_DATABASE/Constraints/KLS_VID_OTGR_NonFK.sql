-- 
-- Non Foreign Key Constraints for Table KLS_VID_OTGR 
-- 
ALTER TABLE MASTER.KLS_VID_OTGR ADD (
  CHECK ("LOAD_NAME" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.KLS_VID_OTGR ADD (
  CHECK ("LOAD_TYPE_ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.KLS_VID_OTGR ADD (
  CONSTRAINT VID_OTGR_PK
  PRIMARY KEY
  (LOAD_ABBR)
  USING INDEX MASTER.VID_OTGR_PK
  ENABLE VALIDATE);

