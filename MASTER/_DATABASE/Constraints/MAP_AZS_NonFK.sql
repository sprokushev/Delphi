-- 
-- Non Foreign Key Constraints for Table MAP_AZS 
-- 
ALTER TABLE MASTER.MAP_AZS ADD (
  CONSTRAINT MAP_AZS
  PRIMARY KEY
  (AZS_ID)
  USING INDEX MASTER.MAP_AZS
  ENABLE VALIDATE);

