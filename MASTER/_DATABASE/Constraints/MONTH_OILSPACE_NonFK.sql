-- 
-- Non Foreign Key Constraints for Table MONTH_OILSPACE 
-- 
ALTER TABLE MASTER.MONTH_OILSPACE ADD (
  CONSTRAINT PK_MONTH_OILSPACE
  PRIMARY KEY
  (LUKOIL_ID)
  USING INDEX MASTER.PK_MONTH_OILSPACE
  ENABLE VALIDATE);

