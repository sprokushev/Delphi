-- 
-- Non Foreign Key Constraints for Table ZAKAZ 
-- 
ALTER TABLE MASTER.ZAKAZ ADD (
  CHECK ("IS_AGENT" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.ZAKAZ ADD (
  CHECK ("DATE_PLAN" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.ZAKAZ ADD (
  CHECK ("INPUT_NUMBER" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.ZAKAZ ADD (
  CHECK ("INPUT_DATE" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.ZAKAZ ADD (
  CHECK ("IS_ACCEPT" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.ZAKAZ ADD (
  CHECK ("FILIAL_ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.ZAKAZ ADD (
  CHECK ("PLAT_ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.ZAKAZ ADD (
  CHECK ("PROD_ID_NPR" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.ZAKAZ ADD (
  CHECK ("VES" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.ZAKAZ ADD (
  CHECK ("KOL" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.ZAKAZ ADD (
  CHECK ("SPEED_VES" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.ZAKAZ ADD (
  CHECK ("SPEED_KOL" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.ZAKAZ ADD (
  CHECK ("FACT_VES" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.ZAKAZ ADD (
  CHECK ("FACT_KOL" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.ZAKAZ ADD (
  CHECK ("LOAD_VES" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.ZAKAZ ADD (
  CHECK ("LOAD_KOL" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.ZAKAZ ADD (
  CHECK ("PERIOD_ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.ZAKAZ ADD (
  CHECK ("TIP_CORP_ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.ZAKAZ ADD (
  CONSTRAINT ZAKAZ_PK
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.ZAKAZ_PK
  ENABLE VALIDATE);

