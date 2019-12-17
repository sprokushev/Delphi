-- 
-- Non Foreign Key Constraints for Table MONTH_REESTR 
-- 
ALTER TABLE MASTER.MONTH_REESTR ADD (
  CHECK ("NUM_REE" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.MONTH_REESTR ADD (
  CHECK ("DATE_REE" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.MONTH_REESTR ADD (
  CHECK ("DATE_TO" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.MONTH_REESTR ADD (
  CHECK ("DATE_PLAN" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.MONTH_REESTR ADD (
  CHECK ("USE_GRAFIK" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.MONTH_REESTR ADD (
  CHECK ("STATUS" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.MONTH_REESTR ADD (
  CHECK ("DOP_REE" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.MONTH_REESTR ADD (
  CONSTRAINT PK_MONTH_REESTR
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.PK_MONTH_REESTR
  ENABLE VALIDATE);

