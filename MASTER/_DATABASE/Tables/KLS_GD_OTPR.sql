--
-- KLS_GD_OTPR  (Table) 
--
CREATE TABLE MASTER.KLS_GD_OTPR
(
  ID    NUMBER(10)                              NOT NULL,
  TAG   VARCHAR2(10 BYTE),
  NAME  VARCHAR2(50 BYTE)
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON TABLE MASTER.KLS_GD_OTPR IS '�������� ��������';

COMMENT ON COLUMN MASTER.KLS_GD_OTPR.ID IS '������� ��������';

COMMENT ON COLUMN MASTER.KLS_GD_OTPR.TAG IS '���';

COMMENT ON COLUMN MASTER.KLS_GD_OTPR.NAME IS '������������';



