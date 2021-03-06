--
-- REPL_CALL_IN  (Table) 
--
CREATE TABLE MASTER.REPL_CALL_IN
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

COMMENT ON TABLE MASTER.REPL_CALL_IN IS '������� �������� ��������';

COMMENT ON COLUMN MASTER.REPL_CALL_IN.REPL_ID IS '������ � �������������� �������';

COMMENT ON COLUMN MASTER.REPL_CALL_IN.REPL_LIST IS '����������';

COMMENT ON COLUMN MASTER.REPL_CALL_IN.SRC_SITE IS '����-��������';

COMMENT ON COLUMN MASTER.REPL_CALL_IN.DST_SITE IS '����-����������';

COMMENT ON COLUMN MASTER.REPL_CALL_IN.REPL_DATE IS '���� ���������';

COMMENT ON COLUMN MASTER.REPL_CALL_IN.REPL_SQL1 IS '������';

COMMENT ON COLUMN MASTER.REPL_CALL_IN.REPL_SQL2 IS '������';

COMMENT ON COLUMN MASTER.REPL_CALL_IN.REPL_SQL3 IS '������';

COMMENT ON COLUMN MASTER.REPL_CALL_IN.OSUSER IS '������������';

COMMENT ON COLUMN MASTER.REPL_CALL_IN.FILE_TYPE IS '��� ������������� �����';



