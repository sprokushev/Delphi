-- 
-- Non Foreign Key Constraints for Table VED_OSMOTR_SMENA 
-- 
ALTER TABLE MASTER.VED_OSMOTR_SMENA ADD (
  CONSTRAINT VED_OSMOTR_SMENA_PK
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.VED_OSMOTR_SMENA_PK
  ENABLE VALIDATE);

