-- 
-- Non Foreign Key Constraints for Table BILL_POS_PARUS 
-- 
ALTER TABLE MASTER.BILL_POS_PARUS ADD (
  CHECK ("DATE_VYP_SF" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.BILL_POS_PARUS ADD (
  CHECK ("DATE_OTGR" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.BILL_POS_PARUS ADD (
  CHECK ("VES" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.BILL_POS_PARUS ADD (
  CHECK ("CENA_BN" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.BILL_POS_PARUS ADD (
  CHECK ("CENA" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.BILL_POS_PARUS ADD (
  CHECK ("SUMMA_BN" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.BILL_POS_PARUS ADD (
  CHECK ("SUMMA_AKCIZ" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.BILL_POS_PARUS ADD (
  CHECK ("SUMMA_NDS20" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.BILL_POS_PARUS ADD (
  CHECK ("SUMMA_GSM25" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.BILL_POS_PARUS ADD (
  CHECK ("SUMMA" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.BILL_POS_PARUS ADD (
  CHECK ("FOOD_RN" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.BILL_POS_PARUS ADD (
  CHECK ("FOOD_PRN" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.BILL_POS_PARUS ADD (
  CHECK ("FOOD_CODE" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.BILL_POS_PARUS ADD (
  CONSTRAINT BILL_POS_P_PK
  PRIMARY KEY
  (NOM_DOK, PARUS_RN, BILL_POS_PARUS_ID)
  USING INDEX MASTER.BILL_POS_P_PK
  ENABLE VALIDATE);

