-- 
-- Non Foreign Key Constraints for Table LOAD_FIL_PROD 
-- 
ALTER TABLE MASTER.LOAD_FIL_PROD ADD (
  CHECK ("TAG" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.LOAD_FIL_PROD ADD (
  CHECK ("IS_AUTO_LINK" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.LOAD_FIL_PROD ADD (
  CONSTRAINT FIL_PROD_PK
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.FIL_PROD_PK
  ENABLE VALIDATE);

ALTER TABLE MASTER.LOAD_FIL_PROD ADD (
  CONSTRAINT FIL_PROD_FIL_PROD_AK_UK
  UNIQUE (TAG)
  USING INDEX MASTER.FIL_PROD_FIL_PROD_AK_UK
  ENABLE VALIDATE);
