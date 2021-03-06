-- 
-- Non Foreign Key Constraints for Table RAZNAR 
-- 
ALTER TABLE MASTER.RAZNAR ADD (
  CHECK ("NOM_ZD" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.RAZNAR ADD (
  CHECK ("DATE_RAZN" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.RAZNAR ADD (
  CHECK ("MESTO_ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.RAZNAR ADD (
  CHECK ("FLAG_SEND" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.RAZNAR ADD (
  CHECK ("TONN_RAZNAR" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.RAZNAR ADD (
  CHECK ("CIST_RAZNAR" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.RAZNAR ADD (
  CONSTRAINT RAZNAR_PK
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.RAZNAR_PK
  ENABLE VALIDATE);

