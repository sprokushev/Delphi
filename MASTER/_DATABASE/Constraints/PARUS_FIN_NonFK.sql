-- 
-- Non Foreign Key Constraints for Table PARUS_FIN 
-- 
ALTER TABLE MASTER.PARUS_FIN ADD (
  CONSTRAINT I_ID
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.I_ID
  ENABLE VALIDATE);
