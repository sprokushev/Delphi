-- 
-- Non Foreign Key Constraints for Table KLS_DOVER_DATES 
-- 
ALTER TABLE MASTER.KLS_DOVER_DATES ADD (
  CHECK ("BEGIN_DATE" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.KLS_DOVER_DATES ADD (
  CHECK ("END_DATE" IS NOT NULL)
  DISABLE NOVALIDATE);

