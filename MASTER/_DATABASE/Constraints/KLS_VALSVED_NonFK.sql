-- 
-- Non Foreign Key Constraints for Table KLS_VALSVED 
-- 
ALTER TABLE MASTER.KLS_VALSVED ADD (
  CHECK ("DATEUPLOAD" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.KLS_VALSVED ADD (
  CHECK ("FROM_DBF" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.KLS_VALSVED ADD (
  CONSTRAINT VALSVED_PK
  PRIMARY KEY
  (SVED_ID, KODIF_ID, SVED_FLG_OPERDATA)
  USING INDEX MASTER.VALSVED_PK
  ENABLE VALIDATE);

