-- 
-- Non Foreign Key Constraints for Table KLS_VALPASP 
-- 
ALTER TABLE MASTER.KLS_VALPASP ADD (
  CONSTRAINT VALPASP_PK
  PRIMARY KEY
  (PASP_ID, KODIF_ID)
  USING INDEX MASTER.VALPASP_PK
  ENABLE VALIDATE);

