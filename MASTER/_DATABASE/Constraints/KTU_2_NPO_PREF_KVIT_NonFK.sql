-- 
-- Non Foreign Key Constraints for Table KTU_2_NPO_PREF_KVIT 
-- 
ALTER TABLE MASTER.KTU_2_NPO_PREF_KVIT ADD (
  CONSTRAINT PK_KTU_2_NPO_PREF_KVIT
  PRIMARY KEY
  (PREF_NAME)
  USING INDEX MASTER.PK_KTU_2_NPO_PREF_KVIT
  ENABLE VALIDATE);

