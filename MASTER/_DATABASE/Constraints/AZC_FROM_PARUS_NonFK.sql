-- 
-- Non Foreign Key Constraints for Table AZC_FROM_PARUS 
-- 
ALTER TABLE MASTER.AZC_FROM_PARUS ADD (
  CHECK ("OSUSER_NAME" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.AZC_FROM_PARUS ADD (
  CHECK ("TERMINAL_NAME" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.AZC_FROM_PARUS ADD (
  CHECK ("REALIZ_ALL" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.AZC_FROM_PARUS ADD (
  CHECK ("REALIZ_AZC" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.AZC_FROM_PARUS ADD (
  CHECK ("OSTATOK" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.AZC_FROM_PARUS ADD (
  CHECK ("IS_AZC" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.AZC_FROM_PARUS ADD (
  CONSTRAINT PK_AZC_FROM_PARUS
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.PK_AZC_FROM_PARUS
  ENABLE VALIDATE);

