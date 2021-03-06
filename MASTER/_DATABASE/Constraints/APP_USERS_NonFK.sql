-- 
-- Non Foreign Key Constraints for Table APP_USERS 
-- 
ALTER TABLE MASTER.APP_USERS ADD (
  CONSTRAINT APP_USERS_SNP_CC
  CHECK (SNP IN (0, 1))
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.APP_USERS ADD (
  CONSTRAINT APP_USERS_UNP_CC
  CHECK (UNP IN (0, 1))
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.APP_USERS ADD (
  CHECK ("NAME" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.APP_USERS ADD (
  CHECK ("NETNAME" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.APP_USERS ADD (
  CHECK ("SNP" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.APP_USERS ADD (
  CHECK ("UNP" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.APP_USERS ADD (
  CHECK ("IS_ADMIN" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.APP_USERS ADD (
  CHECK ("MNOS" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.APP_USERS ADD (
  CONSTRAINT APP_USERS_PK
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.APP_USERS_PK
  ENABLE VALIDATE);

ALTER TABLE MASTER.APP_USERS ADD (
  CONSTRAINT APP_USERS_UK
  UNIQUE (NAME)
  DISABLE NOVALIDATE);

