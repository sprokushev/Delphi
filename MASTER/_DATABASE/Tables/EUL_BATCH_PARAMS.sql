--
-- EUL_BATCH_PARAMS  (Table) 
--
CREATE TABLE MASTER.EUL_BATCH_PARAMS
(
  BP_ID      NUMBER(10)                         NOT NULL,
  BP_NAME    VARCHAR2(100 BYTE),
  BP_VALUE1  VARCHAR2(250 BYTE),
  BP_VALUE2  VARCHAR2(250 BYTE),
  BP_VALUE3  VARCHAR2(250 BYTE),
  BP_VALUE4  VARCHAR2(250 BYTE),
  BP_VALUE5  VARCHAR2(250 BYTE),
  BP_VALUE6  VARCHAR2(250 BYTE),
  BP_VALUE7  VARCHAR2(250 BYTE),
  BP_BS_ID   NUMBER(10),
  NOTM       NUMBER(10)
)
TABLESPACE USERS2
NOCOMPRESS ;


