-- 
-- Non Foreign Key Constraints for Table KSSS_PROD 
-- 
ALTER TABLE MASTER.KSSS_PROD ADD (
  CHECK ("IS_MAIN" IS NOT NULL)
  DISABLE NOVALIDATE);

