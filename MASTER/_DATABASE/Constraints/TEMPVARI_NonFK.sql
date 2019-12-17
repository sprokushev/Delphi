-- 
-- Non Foreign Key Constraints for Table TEMPVARI 
-- 
ALTER TABLE MASTER.TEMPVARI ADD (
  CHECK ("TERMINAL_NAME" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.TEMPVARI ADD (
  CHECK ("OSUSER_NAME" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.TEMPVARI ADD (
  CHECK ("BEGIN_DATE" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.TEMPVARI ADD (
  CHECK ("END_DATE" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.TEMPVARI ADD (
  CHECK ("VARI_NAME" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.TEMPVARI ADD (
  CONSTRAINT PK_TEMPVARI
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.PK_TEMPVARI
  ENABLE VALIDATE);

