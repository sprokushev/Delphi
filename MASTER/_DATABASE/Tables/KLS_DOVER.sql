--
-- KLS_DOVER  (Table) 
--
CREATE TABLE MASTER.KLS_DOVER
(
  ID          NUMBER(10)                        NOT NULL,
  NUM_DOVER   VARCHAR2(15 BYTE),
  DATE_DOVER  DATE,
  DATE_END    DATE,
  FIO_DOVER   VARCHAR2(50 BYTE),
  DOLJ_DOVER  VARCHAR2(30 BYTE),
  PREDPR_ID   NUMBER(6),
  IS_LOADED   NUMBER(1)                         DEFAULT 0
)
TABLESPACE USERS2
NOCOMPRESS ;


