--
-- SF_DOVER  (Table) 
--
CREATE TABLE MASTER.SF_DOVER
(
  ID                  NUMBER,
  POST_COMPANY        VARCHAR2(100 BYTE),
  POST_DOLJ           VARCHAR2(100 BYTE),
  POST_FIO            VARCHAR2(100 BYTE),
  POST_DOVER          VARCHAR2(100 BYTE),
  POKUP_COMPANY       VARCHAR2(100 BYTE),
  POKUP_DOLJ          VARCHAR2(100 BYTE),
  POKUP_FIO           VARCHAR2(100 BYTE),
  POKUP_DOVER         VARCHAR2(100 BYTE),
  POST_DOLJ_SIGN      VARCHAR2(100 BYTE),
  POST_FIO_SIGN       VARCHAR2(100 BYTE),
  POKUP_DOLJ_SIGN     VARCHAR2(100 BYTE),
  POKUP_FIO_SIGN      VARCHAR2(100 BYTE),
  POKUP_COMPANY_SIGN  VARCHAR2(100 BYTE)
)
TABLESPACE USERS2
NOCOMPRESS ;


