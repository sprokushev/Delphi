-- 
-- Non Foreign Key Constraints for Table R3_KONV 
-- 
ALTER TABLE MASTER.R3_KONV ADD (
  CONSTRAINT KONV_PK
  PRIMARY KEY
  (KSCHL)
  USING INDEX MASTER.KONV_PK
  ENABLE VALIDATE);
