-- 
-- Non Foreign Key Constraints for Table KLS_NAPR 
-- 
ALTER TABLE MASTER.KLS_NAPR ADD (
  CONSTRAINT NAPR_PK
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.NAPR_PK
  ENABLE VALIDATE);

