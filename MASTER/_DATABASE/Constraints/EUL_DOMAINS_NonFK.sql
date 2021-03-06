-- 
-- Non Foreign Key Constraints for Table EUL_DOMAINS 
-- 
ALTER TABLE MASTER.EUL_DOMAINS ADD (
  CONSTRAINT EUL_DOM_CHECK_2
  CHECK ( dom_data_type IN (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13) )
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_DOMAINS ADD (
  CONSTRAINT EUL_DOM_CHECK_3
  CHECK ( dom_logical_item IN ( 1 ,  0 ) )
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_DOMAINS ADD (
  CONSTRAINT EUL_DOM_CHECK_4
  CHECK ( dom_sys_generated IN ( 1 ,  0 ) )
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_DOMAINS ADD (
  CHECK ("DOM_NAME" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_DOMAINS ADD (
  CHECK ("DOM_DATA_TYPE" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_DOMAINS ADD (
  CHECK ("DOM_LOGICAL_ITEM" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_DOMAINS ADD (
  CHECK ("DOM_SYS_GENERATED" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_DOMAINS ADD (
  CONSTRAINT EUL_DOM_PK
  PRIMARY KEY
  (DOM_ID)
  USING INDEX MASTER.EUL_DOM_PK
  ENABLE VALIDATE);

ALTER TABLE MASTER.EUL_DOMAINS ADD (
  CONSTRAINT EUL_DOM_DOM2_UK
  UNIQUE (DOM_NAME)
  USING INDEX MASTER.EUL_DOM_DOM2_UK
  ENABLE VALIDATE);

