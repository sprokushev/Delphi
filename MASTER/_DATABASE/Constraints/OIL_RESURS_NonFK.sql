-- 
-- Non Foreign Key Constraints for Table OIL_RESURS 
-- 
ALTER TABLE MASTER.OIL_RESURS ADD (
  CONSTRAINT OIL_RESURS_PK
  PRIMARY KEY
  (KOD)
  USING INDEX MASTER.OIL_RESURS_PK
  ENABLE VALIDATE);

