--
-- REPL_CHECK_MODES  (Table) 
--
CREATE TABLE MASTER.REPL_CHECK_MODES
(
  ID    NUMBER(10)                              NOT NULL,
  NAME  VARCHAR2(50 BYTE)
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON TABLE MASTER.REPL_CHECK_MODES IS '������ �������� ������������� ������� ����������';

COMMENT ON COLUMN MASTER.REPL_CHECK_MODES.ID IS '����� �������� ������������� �������';

COMMENT ON COLUMN MASTER.REPL_CHECK_MODES.NAME IS '������������';



