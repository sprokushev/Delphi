-- 
-- Non Foreign Key Constraints for Table EXPORT2INFIN 
-- 
ALTER TABLE MASTER.EXPORT2INFIN ADD (
  CHECK ("KLS_NAME" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.EXPORT2INFIN ADD (
  CHECK ("QUERY_TEXT" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.EXPORT2INFIN ADD (
  CHECK ("FNAME" IS NOT NULL)
  DISABLE NOVALIDATE);

