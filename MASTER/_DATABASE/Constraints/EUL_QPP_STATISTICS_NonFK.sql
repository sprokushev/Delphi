-- 
-- Non Foreign Key Constraints for Table EUL_QPP_STATISTICS 
-- 
ALTER TABLE MASTER.EUL_QPP_STATISTICS ADD (
  CONSTRAINT EUL_QS_CHECK_1
  CHECK ( nvl(qs_cost,  0) >= 0 and nvl(qs_act_cpu_time,  0) >= 0 and qs_act_elap_time >= 0 and qs_est_elap_time >= 0 )
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_QPP_STATISTICS ADD (
  CONSTRAINT EUL_QS_CHECK_2
  CHECK ( qs_summary_fit IN ( 0 ,  1 ,  2 ,  3 ,  4 ,  5 ,  6 ) )
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_QPP_STATISTICS ADD (
  CHECK ("QS_ACT_ELAP_TIME" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_QPP_STATISTICS ADD (
  CHECK ("QS_EST_ELAP_TIME" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_QPP_STATISTICS ADD (
  CHECK ("QS_DATE_STAMP" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_QPP_STATISTICS ADD (
  CHECK ("QS_OBJECT_USE_KEY" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_QPP_STATISTICS ADD (
  CHECK ("QS_USERNAME" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_QPP_STATISTICS ADD (
  CONSTRAINT EUL_QS_PK
  PRIMARY KEY
  (QS_ID)
  USING INDEX MASTER.EUL_QS_PK
  ENABLE VALIDATE);

