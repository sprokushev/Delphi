--
-- KLS_ISKL_TAR  (Table) 
--
CREATE TABLE MASTER.KLS_ISKL_TAR
(
  ID         NUMBER(10)                         NOT NULL,
  K_TAR      VARCHAR2(10 BYTE),
  K_TAR_TXT  VARCHAR2(30 BYTE),
  GR3_TXT    VARCHAR2(60 BYTE),
  GR4_TXT    VARCHAR2(60 BYTE),
  VZISK3     VARCHAR2(40 BYTE),
  VZISK4     VARCHAR2(40 BYTE)
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON TABLE MASTER.KLS_ISKL_TAR IS '�������������� ������';



