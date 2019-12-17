-- 
-- Non Foreign Key Constraints for Table DOC_STREAM_STAGES 
-- 
ALTER TABLE MASTER.DOC_STREAM_STAGES ADD (
  CHECK ("STREAM_ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.DOC_STREAM_STAGES ADD (
  CHECK ("TABLE_TAG" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.DOC_STREAM_STAGES ADD (
  CONSTRAINT DOC_STREAM_STAGES_PK
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.DOC_STREAM_STAGES_PK
  ENABLE VALIDATE);
