-- 
-- Non Foreign Key Constraints for Table XX101_MONTH 
-- 
ALTER TABLE MASTER.XX101_MONTH ADD (
  PRIMARY KEY
  (NOM_ZD)
  USING INDEX
    TABLESPACE USERS
  ENABLE VALIDATE);

