-- 
-- Non Foreign Key Constraints for Table OSTAT_KONS 
-- 
ALTER TABLE MASTER.OSTAT_KONS ADD (
  CHECK ("DATE_OST" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.OSTAT_KONS ADD (
  CHECK ("KOL" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.OSTAT_KONS ADD (
  CHECK ("KG" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.OSTAT_KONS ADD (
  CHECK ("LIT" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.OSTAT_KONS ADD (
  CHECK ("SUMMA_POKUP_BN" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.OSTAT_KONS ADD (
  CHECK ("SUMMA_POKUP_NDS" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.OSTAT_KONS ADD (
  CHECK ("SUMMA_POKUP_AKCIZ" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.OSTAT_KONS ADD (
  CHECK ("SUMMA_POKUP" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.OSTAT_KONS ADD (
  CHECK ("SUMMA_UCHET" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.OSTAT_KONS ADD (
  CHECK ("ORG_STRU_ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.OSTAT_KONS ADD (
  CHECK ("PREDPR_KONS_ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.OSTAT_KONS ADD (
  CHECK ("PROD_KONS_ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.OSTAT_KONS ADD (
  CONSTRAINT OSTAT_PK
  PRIMARY KEY
  (FILIAL_ID, ID_OST)
  USING INDEX MASTER.OSTAT_PK
  ENABLE VALIDATE);

