--
-- EUL_HIERARCHIES  (Table) 
--
CREATE TABLE MASTER.EUL_HIERARCHIES
(
  HI_ID             NUMBER(10)                  NOT NULL,
  HI_TYPE           VARCHAR2(10 BYTE),
  HI_NAME           VARCHAR2(100 BYTE),
  HI_DESCRIPTION    VARCHAR2(240 BYTE),
  HI_SYS_GENERATED  NUMBER(1),
  HI_EXT_HIERARCHY  VARCHAR2(64 BYTE),
  DBH_DEFAULT       NUMBER(1),
  IBH_DBH_ID        NUMBER(10),
  NOTM              NUMBER(10)
)
TABLESPACE USERS2
NOCOMPRESS ;


