--
-- AZC_PROD_GROUP  (Table) 
--
CREATE TABLE MASTER.AZC_PROD_GROUP
(
  ID      NUMBER(10)                            NOT NULL,
  NAME    VARCHAR2(70 BYTE),
  NOTE_   VARCHAR2(15 BYTE),
  GRP_ID  NUMBER(2)
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON COLUMN MASTER.AZC_PROD_GROUP.NAME IS '������ ���������';



