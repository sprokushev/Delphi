-- 
-- Non Foreign Key Constraints for Table PLAN_REALIZ 
-- 
ALTER TABLE MASTER.PLAN_REALIZ ADD (
  CHECK ("DATE_PLAN" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.PLAN_REALIZ ADD (
  CHECK ("VES" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.PLAN_REALIZ ADD (
  CHECK ("SUPPLIER_ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.PLAN_REALIZ ADD (
  CHECK ("TIP_REAL_ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.PLAN_REALIZ ADD (
  CHECK ("ORG_STRU_ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.PLAN_REALIZ ADD (
  CHECK ("SUMMA" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.PLAN_REALIZ ADD (
  CHECK ("IS_SIGN1" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.PLAN_REALIZ ADD (
  CHECK ("IS_SIGN2" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.PLAN_REALIZ ADD (
  CHECK ("FIRST_PLAN" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.PLAN_REALIZ ADD (
  CONSTRAINT PLAN_REAL_PK
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.PLAN_REAL_PK
  ENABLE VALIDATE);
