-- 
-- Non Foreign Key Constraints for Table KLS_PROD_AKCIZ 
-- 
ALTER TABLE MASTER.KLS_PROD_AKCIZ ADD (
  CHECK ("VALUE" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.KLS_PROD_AKCIZ ADD (
  CONSTRAINT PK_KLS_PROD_AKCIZ
  PRIMARY KEY
  (FROM_DATE, TO_DATE, PROD_GROUPS_ID)
  USING INDEX MASTER.PK_KLS_PROD_AKCIZ
  ENABLE VALIDATE);
