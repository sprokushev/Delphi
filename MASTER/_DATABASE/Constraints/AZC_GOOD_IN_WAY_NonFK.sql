-- 
-- Non Foreign Key Constraints for Table AZC_GOOD_IN_WAY 
-- 
ALTER TABLE MASTER.AZC_GOOD_IN_WAY ADD (
  CHECK ("DENCITY" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.AZC_GOOD_IN_WAY ADD (
  CHECK ("VES" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.AZC_GOOD_IN_WAY ADD (
  CHECK ("DATE_OPER" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.AZC_GOOD_IN_WAY ADD (
  CHECK ("VOLUME" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.AZC_GOOD_IN_WAY ADD (
  CHECK ("PROD_ID_NPR" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.AZC_GOOD_IN_WAY ADD (
  CHECK ("ORG_STRU_ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.AZC_GOOD_IN_WAY ADD (
  CHECK ("PLACE_SEND_ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.AZC_GOOD_IN_WAY ADD (
  CHECK ("PREDPR_ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.AZC_GOOD_IN_WAY ADD (
  CONSTRAINT IN_WAY_PK
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.IN_WAY_PK
  ENABLE VALIDATE);

