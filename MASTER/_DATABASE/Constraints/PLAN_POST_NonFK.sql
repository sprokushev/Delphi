-- 
-- Non Foreign Key Constraints for Table PLAN_POST 
-- 
ALTER TABLE MASTER.PLAN_POST ADD (
  CHECK ("PLAN_CENA" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.PLAN_POST ADD (
  CHECK ("PLAN_VES" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.PLAN_POST ADD (
  CHECK ("PLAN_SUM" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.PLAN_POST ADD (
  CHECK ("PLAN_ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.PLAN_POST ADD (
  CHECK ("PLAN_PER_ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.PLAN_POST ADD (
  CHECK ("PLANSTRU_ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.PLAN_POST ADD (
  CHECK ("DOG_ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.PLAN_POST ADD (
  CHECK ("PROD_ID_NPR" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.PLAN_POST ADD (
  CHECK ("PAYFORM_ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.PLAN_POST ADD (
  CONSTRAINT PLAN_POST_PK
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.PLAN_POST_PK
  ENABLE VALIDATE);

