--
-- KLS_VAGOWNER_MOS  (Table) 
--
CREATE TABLE MASTER.KLS_VAGOWNER_MOS
(
  ID    NUMBER(10)                              NOT NULL,
  ABBR  VARCHAR2(10 BYTE),
  NAME  VARCHAR2(30 BYTE)
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON TABLE MASTER.KLS_VAGOWNER_MOS IS '��������� ������� (��-12)';

COMMENT ON COLUMN MASTER.KLS_VAGOWNER_MOS.ABBR IS '������';



