-- 
-- Non Foreign Key Constraints for Table MONTH_REESTR_POS 
-- 
ALTER TABLE MASTER.MONTH_REESTR_POS ADD (
  CHECK ("TONN_REE" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.MONTH_REESTR_POS ADD (
  CHECK ("TONN_MOS" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.MONTH_REESTR_POS ADD (
  CONSTRAINT PK_MONTH_REESTR_POS
  PRIMARY KEY
  (MONTH_REESTR_ID, NOM_ZD)
  USING INDEX MASTER.PK_MONTH_REESTR_POS
  ENABLE VALIDATE);

