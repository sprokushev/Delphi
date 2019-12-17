-- 
-- Non Foreign Key Constraints for Table UNP_SPRAV_POKAZATEL 
-- 
ALTER MATERIALIZED VIEW MASTER.UNP_SPRAV_POKAZATEL ADD (
  CONSTRAINT SYS_C008338
  PRIMARY KEY
  (KOD_POKAZATEL)
  USING INDEX
    TABLESPACE USERSINDX
  ENABLE VALIDATE);
