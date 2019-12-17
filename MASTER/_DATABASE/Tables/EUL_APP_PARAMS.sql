--
-- EUL_APP_PARAMS  (Table) 
--
CREATE TABLE MASTER.EUL_APP_PARAMS
(
  APP_ID              NUMBER(10)                NOT NULL,
  APP_TYPE            VARCHAR2(10 BYTE),
  APP_NAME_MN         NUMBER(10),
  APP_DESCRIPTION_MN  NUMBER(10),
  SP_DEFAULT_VALUE    VARCHAR2(240 BYTE),
  SP_VALUE            VARCHAR2(240 BYTE),
  NOTM                NUMBER(10)
)
TABLESPACE USERS2
NOCOMPRESS ;


