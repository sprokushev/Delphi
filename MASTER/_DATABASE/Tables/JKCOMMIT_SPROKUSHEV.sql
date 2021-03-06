--
-- JKCOMMIT_SPROKUSHEV  (Table) 
--
CREATE TABLE MASTER.JKCOMMIT_SPROKUSHEV
(
  MESTO_ID       NUMBER(2),
  FLG_COMMIT     NUMBER(1),
  SVED_NUM       NUMBER(6),
  SVED_DATE      DATE,
  DATE_OFORML    DATE,
  DATE_EDIT      DATE,
  SVED_CNT       NUMBER(4),
  SVED_VES       NUMBER(15,6),
  SVED_ID        VARCHAR2(9 BYTE),
  NOM_ZD         VARCHAR2(12 BYTE),
  PROD_NAME      VARCHAR2(30 BYTE),
  NOM_ZD_COMMIT  NUMBER(1)
)
TABLESPACE USERS2
NOCOMPRESS ;


