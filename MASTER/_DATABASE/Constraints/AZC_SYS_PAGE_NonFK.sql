-- 
-- Non Foreign Key Constraints for Table AZC_SYS_PAGE 
-- 
ALTER TABLE MASTER.AZC_SYS_PAGE ADD (
  CHECK ("NAME" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.AZC_SYS_PAGE ADD (
  CONSTRAINT PK_AZC_SYS_PAGE
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.PK_AZC_SYS_PAGE
  ENABLE VALIDATE);

