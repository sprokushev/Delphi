--
-- KLS_VID_OTGR  (Table) 
--
CREATE TABLE MASTER.KLS_VID_OTGR
(
  LOAD_ABBR     VARCHAR2(3 BYTE)                NOT NULL,
  LOAD_NAME     VARCHAR2(45 BYTE),
  LOAD_TYPE_ID  NUMBER(2),
  VAGOWNER_ID   NUMBER(10)
)
TABLESPACE USERS2
NOCOMPRESS ;

