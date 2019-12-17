-- 
-- Non Foreign Key Constraints for Table KLS_DOC_RESERV 
-- 
ALTER TABLE MASTER.KLS_DOC_RESERV ADD (
  CHECK ("NEXT_DOC_NUM" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.KLS_DOC_RESERV ADD (
  CONSTRAINT KLS_DOC_RESERV_PK
  PRIMARY KEY
  (TERMINAL_NAME, OSUSER_NAME, DOC_TYPE_ID, MESTO_ID)
  USING INDEX MASTER.KLS_DOC_RESERV_PK
  ENABLE VALIDATE);

