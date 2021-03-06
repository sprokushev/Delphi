-- 
-- Non Foreign Key Constraints for Table DAYLY_FACT 
-- 
ALTER TABLE MASTER.DAYLY_FACT ADD (
  CHECK ("KOD_PLAN" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.DAYLY_FACT ADD (
  CHECK ("KOD_DEC" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.DAYLY_FACT ADD (
  CHECK ("PERER" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.DAYLY_FACT ADD (
  CHECK ("DATA" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.DAYLY_FACT ADD (
  CHECK ("PROD" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.DAYLY_FACT ADD (
  CHECK ("SOBSTV" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.DAYLY_FACT ADD (
  CONSTRAINT D_FACT_PK
  PRIMARY KEY
  (KOD)
  USING INDEX MASTER.D_FACT_PK
  ENABLE VALIDATE);

