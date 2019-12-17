-- 
-- Non Foreign Key Constraints for Table SF_NUMBERS 
-- 
ALTER TABLE MASTER.SF_NUMBERS ADD (
  CHECK ("FROM_DATE" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.SF_NUMBERS ADD (
  CHECK ("TO_DATE" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.SF_NUMBERS ADD (
  CHECK ("START_NUM" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.SF_NUMBERS ADD (
  CHECK ("CURR_NUM" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.SF_NUMBERS ADD (
  CHECK ("RANGE" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.SF_NUMBERS ADD (
  UNIQUE (FROM_DATE)
  USING INDEX
    TABLESPACE USERSINDX
  ENABLE VALIDATE);

ALTER TABLE MASTER.SF_NUMBERS ADD (
  UNIQUE (TO_DATE)
  USING INDEX
    TABLESPACE USERSINDX
  ENABLE VALIDATE);
