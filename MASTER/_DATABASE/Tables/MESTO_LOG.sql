--
-- MESTO_LOG  (Table) 
--
CREATE TABLE MASTER.MESTO_LOG
(
  ID         NUMBER(10),
  LOG_ID     VARCHAR2(10 BYTE),
  DATE_LOG   DATE,
  PROG_NAME  CLOB,
  LOG_INFO   CLOB,
  MESTO_ID   NUMBER(2),
  EVENT_ID   NUMBER(2),
  USER_ID    NUMBER(3)
)
TABLESPACE USERS2
NOCOMPRESS ;


