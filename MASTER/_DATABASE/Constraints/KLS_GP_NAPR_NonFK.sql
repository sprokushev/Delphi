-- 
-- Non Foreign Key Constraints for Table KLS_GP_NAPR 
-- 
ALTER TABLE MASTER.KLS_GP_NAPR ADD (
  CHECK ("GOSPROG_ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.KLS_GP_NAPR ADD (
  CONSTRAINT GP_NAPR_PK
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.GP_NAPR_PK
  ENABLE VALIDATE);
