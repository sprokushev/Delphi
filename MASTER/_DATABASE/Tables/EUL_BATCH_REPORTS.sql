--
-- EUL_BATCH_REPORTS  (Table) 
--
CREATE TABLE MASTER.EUL_BATCH_REPORTS
(
  BR_ID               NUMBER(10)                NOT NULL,
  BR_NAME             VARCHAR2(100 BYTE),
  BR_WORKBOOK_NAME    VARCHAR2(240 BYTE),
  BR_DESCRIPTION      VARCHAR2(240 BYTE),
  BR_NEXT_RUN_DATE    DATE,
  BR_JOB_ID           NUMBER(22),
  BR_EXPIRY           NUMBER(22),
  BR_COMPLETION_DATE  DATE,
  BR_NUM_FREQ_UNITS   NUMBER(22),
  BR_EU_ID            NUMBER(10),
  BR_RFU_ID           NUMBER(10),
  BR_AUTO_REFRESH     NUMBER(1),
  BR_REPORT_SCHEMA    VARCHAR2(64 BYTE),
  NOTM                NUMBER(10)
)
TABLESPACE USERS2
NOCOMPRESS ;


