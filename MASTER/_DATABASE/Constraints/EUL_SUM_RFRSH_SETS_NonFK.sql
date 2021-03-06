-- 
-- Non Foreign Key Constraints for Table EUL_SUM_RFRSH_SETS 
-- 
ALTER TABLE MASTER.EUL_SUM_RFRSH_SETS ADD (
  CONSTRAINT EUL_SRS_CHECK_1
  CHECK ( srs_state IN (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15) )
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_SUM_RFRSH_SETS ADD (
  CONSTRAINT EUL_SRS_CHECK_2
  CHECK ( srs_online IN ( 1 ,  0 ) )
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_SUM_RFRSH_SETS ADD (
  CONSTRAINT EUL_SRS_CHECK_3
  CHECK ( srs_auto_refresh IN ( 1 ,  0 ) )
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_SUM_RFRSH_SETS ADD (
  CONSTRAINT EUL_SRS_CHECK_4
  CHECK ( srs_upgrade_reqd IN ( 1 ,  0 ) )
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_SUM_RFRSH_SETS ADD (
  CHECK ("SRS_NAME" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_SUM_RFRSH_SETS ADD (
  CHECK ("SRS_STATE" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_SUM_RFRSH_SETS ADD (
  CHECK ("SRS_ONLINE" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_SUM_RFRSH_SETS ADD (
  CHECK ("SRS_AUTO_REFRESH" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_SUM_RFRSH_SETS ADD (
  CHECK ("SRS_EU_ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_SUM_RFRSH_SETS ADD (
  CHECK ("SRS_UPGRADE_REQD" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_SUM_RFRSH_SETS ADD (
  CONSTRAINT EUL_SRS_PK
  PRIMARY KEY
  (SRS_ID)
  USING INDEX MASTER.EUL_SRS_PK
  ENABLE VALIDATE);

ALTER TABLE MASTER.EUL_SUM_RFRSH_SETS ADD (
  CONSTRAINT EUL_SRS_SRS2_UK
  UNIQUE (SRS_NAME)
  USING INDEX MASTER.EUL_SRS_SRS2_UK
  ENABLE VALIDATE);

