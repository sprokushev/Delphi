--
-- KLS_ORG_TYPE  (Table) 
--
CREATE TABLE MASTER.KLS_ORG_TYPE
(
  ID    NUMBER(10)                              NOT NULL,
  NAME  VARCHAR2(70 BYTE)
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON COLUMN MASTER.KLS_ORG_TYPE.NAME IS '��� ���';


