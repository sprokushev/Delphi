-- 
-- Non Foreign Key Constraints for Table LOAD_FIL_REP_TYPES 
-- 
ALTER TABLE MASTER.LOAD_FIL_REP_TYPES ADD (
  CONSTRAINT REP_TYPE_PK
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.REP_TYPE_PK
  ENABLE VALIDATE);

