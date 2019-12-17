-- 
-- Non Foreign Key Constraints for Table PODACHA 
-- 
ALTER TABLE MASTER.PODACHA ADD (
  CHECK ("POD_NUM" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.PODACHA ADD (
  CHECK ("POD_DATE" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.PODACHA ADD (
  CHECK ("LOAD_TYPE_ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.PODACHA ADD (
  CHECK ("VETKA_OTP_ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.PODACHA ADD (
  CHECK ("MESTO_ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.PODACHA ADD (
  CONSTRAINT PODACHA_PK
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.PODACHA_PK
  ENABLE VALIDATE);

