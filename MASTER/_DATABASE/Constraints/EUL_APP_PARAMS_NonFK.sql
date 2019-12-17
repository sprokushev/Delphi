-- 
-- Non Foreign Key Constraints for Table EUL_APP_PARAMS 
-- 
ALTER TABLE MASTER.EUL_APP_PARAMS ADD (
  CONSTRAINT EUL_APP_CHECK_1
  CHECK ( app_type IN ( 'PRI' ,  'SP' ) )
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_APP_PARAMS ADD (
  CHECK ("APP_TYPE" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_APP_PARAMS ADD (
  CHECK ("APP_NAME_MN" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_APP_PARAMS ADD (
  CHECK ("APP_DESCRIPTION_MN" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_APP_PARAMS ADD (
  CONSTRAINT EUL_APP_PK
  PRIMARY KEY
  (APP_ID)
  USING INDEX MASTER.EUL_APP_PK
  ENABLE VALIDATE);

ALTER TABLE MASTER.EUL_APP_PARAMS ADD (
  CONSTRAINT EUL_APP_APP2_UK
  UNIQUE (APP_NAME_MN)
  USING INDEX MASTER.EUL_APP_APP2_UK
  ENABLE VALIDATE);
