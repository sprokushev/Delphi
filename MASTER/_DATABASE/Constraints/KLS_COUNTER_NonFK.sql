-- 
-- Non Foreign Key Constraints for Table KLS_COUNTER 
-- 
ALTER TABLE MASTER.KLS_COUNTER ADD (
  CONSTRAINT PK_KLS_COUNTER
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.PK_KLS_COUNTER
  ENABLE VALIDATE);

