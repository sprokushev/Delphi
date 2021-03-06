--
-- REPL_CALL_OUT  (Table) 
--
CREATE TABLE MASTER.REPL_CALL_OUT
(
  REPL_ID    NUMBER(17)                         NOT NULL,
  REPL_LIST  NUMBER(10),
  SRC_SITE   NUMBER(10),
  DST_SITE   NUMBER(10),
  REPL_DATE  DATE,
  REPL_SQL1  VARCHAR2(250 BYTE),
  REPL_SQL2  VARCHAR2(250 BYTE),
  REPL_SQL3  VARCHAR2(250 BYTE),
  OSUSER     VARCHAR2(30 BYTE),
  FILE_TYPE  NUMBER(10)
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON TABLE MASTER.REPL_CALL_OUT IS '������� ��������� ��������';

COMMENT ON COLUMN MASTER.REPL_CALL_OUT.REPL_ID IS '������ � �������������� �������';

COMMENT ON COLUMN MASTER.REPL_CALL_OUT.REPL_LIST IS '����������';

COMMENT ON COLUMN MASTER.REPL_CALL_OUT.SRC_SITE IS '����-��������';

COMMENT ON COLUMN MASTER.REPL_CALL_OUT.DST_SITE IS '����-����������';

COMMENT ON COLUMN MASTER.REPL_CALL_OUT.REPL_DATE IS '���� ���������';

COMMENT ON COLUMN MASTER.REPL_CALL_OUT.REPL_SQL1 IS '������';

COMMENT ON COLUMN MASTER.REPL_CALL_OUT.REPL_SQL2 IS '������';

COMMENT ON COLUMN MASTER.REPL_CALL_OUT.REPL_SQL3 IS '������';

COMMENT ON COLUMN MASTER.REPL_CALL_OUT.OSUSER IS '������������';

COMMENT ON COLUMN MASTER.REPL_CALL_OUT.FILE_TYPE IS '��� ������������� �����';



