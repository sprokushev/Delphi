-- 
-- Non Foreign Key Constraints for Table KLS_STATUS_MONTH_REESTR 
-- 
ALTER TABLE MASTER.KLS_STATUS_MONTH_REESTR ADD (
  CHECK ("NAME" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.KLS_STATUS_MONTH_REESTR ADD (
  CONSTRAINT PK_KLS_STATUS_MONTH_REESTR
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.PK_KLS_STATUS_MONTH_REESTR
  ENABLE VALIDATE);

