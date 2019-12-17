-- 
-- Non Foreign Key Constraints for Table UNP_NORM_PASP 
-- 
ALTER MATERIALIZED VIEW MASTER.UNP_NORM_PASP ADD (
  CONSTRAINT SYS_C008333
  PRIMARY KEY
  (ID_NORM)
  USING INDEX
    TABLESPACE USERSINDX
  ENABLE VALIDATE);