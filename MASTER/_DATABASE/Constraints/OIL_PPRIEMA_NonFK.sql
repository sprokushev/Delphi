-- 
-- Non Foreign Key Constraints for Table OIL_PPRIEMA 
-- 
ALTER TABLE MASTER.OIL_PPRIEMA ADD (
  CONSTRAINT OIL_PPRIEMA_PK
  PRIMARY KEY
  (KOD)
  USING INDEX MASTER.OIL_PPRIEMA_PK
  ENABLE VALIDATE);

