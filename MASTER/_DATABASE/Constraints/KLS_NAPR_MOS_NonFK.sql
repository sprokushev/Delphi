-- 
-- Non Foreign Key Constraints for Table KLS_NAPR_MOS 
-- 
ALTER TABLE MASTER.KLS_NAPR_MOS ADD (
  CHECK ("NAME" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.KLS_NAPR_MOS ADD (
  CONSTRAINT NAPR_MOS_PK
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.NAPR_MOS_PK
  ENABLE VALIDATE);

