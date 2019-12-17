-- 
-- Non Foreign Key Constraints for Table FORMULA 
-- 
ALTER TABLE MASTER.FORMULA ADD (
  CHECK ("TAG" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.FORMULA ADD (
  CHECK ("FORMULA_KIND" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.FORMULA ADD (
  CONSTRAINT PK_FORMULA
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.PK_FORMULA
  ENABLE VALIDATE);

