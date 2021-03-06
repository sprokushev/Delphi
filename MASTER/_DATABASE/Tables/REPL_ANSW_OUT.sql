--
-- REPL_ANSW_OUT  (Table) 
--
CREATE TABLE MASTER.REPL_ANSW_OUT
(
  REPL_ID     NUMBER(17)                        NOT NULL,
  REPL_LIST   NUMBER(10),
  SRC_SITE    NUMBER(10),
  DST_SITE    NUMBER(10),
  REPL_ANSW   DATE,
  REPLSTATUS  NUMBER(1)                         DEFAULT 0,
  REPL_ERROR  VARCHAR2(100 BYTE),
  OSUSER      VARCHAR2(30 BYTE),
  FILE_TYPE   NUMBER(10),
  REPL_SQL1   VARCHAR2(250 BYTE),
  REPL_SQL2   VARCHAR2(250 BYTE),
  REPL_SQL3   VARCHAR2(250 BYTE)
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON TABLE MASTER.REPL_ANSW_OUT IS '������� ��������� �������';

COMMENT ON COLUMN MASTER.REPL_ANSW_OUT.REPL_ID IS '������ � �������������� �������';

COMMENT ON COLUMN MASTER.REPL_ANSW_OUT.REPL_LIST IS '����������';

COMMENT ON COLUMN MASTER.REPL_ANSW_OUT.SRC_SITE IS '����-��������';

COMMENT ON COLUMN MASTER.REPL_ANSW_OUT.DST_SITE IS '����-����������';

COMMENT ON COLUMN MASTER.REPL_ANSW_OUT.REPL_ANSW IS '���� ������';

COMMENT ON COLUMN MASTER.REPL_ANSW_OUT.REPLSTATUS IS '������';

COMMENT ON COLUMN MASTER.REPL_ANSW_OUT.REPL_ERROR IS '������';

COMMENT ON COLUMN MASTER.REPL_ANSW_OUT.OSUSER IS '������������';

COMMENT ON COLUMN MASTER.REPL_ANSW_OUT.FILE_TYPE IS '��� ������������� �����';

COMMENT ON COLUMN MASTER.REPL_ANSW_OUT.REPL_SQL1 IS '�������� ������';

COMMENT ON COLUMN MASTER.REPL_ANSW_OUT.REPL_SQL2 IS '�������� ������';

COMMENT ON COLUMN MASTER.REPL_ANSW_OUT.REPL_SQL3 IS '�������� ������';



