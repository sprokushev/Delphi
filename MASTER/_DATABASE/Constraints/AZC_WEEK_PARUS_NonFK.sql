-- 
-- Non Foreign Key Constraints for Table AZC_WEEK_PARUS 
-- 
ALTER TABLE MASTER.AZC_WEEK_PARUS ADD (
  CONSTRAINT PK_AZC_WEEK_PARUS
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.PK_AZC_WEEK_PARUS
  ENABLE VALIDATE);

