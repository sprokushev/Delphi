--
-- REPL_SESSION  (Table) 
--
CREATE TABLE MASTER.REPL_SESSION
(
  ID             NUMBER(10)                     NOT NULL,
  STATUS         NUMBER(10)                     DEFAULT 0,
  DATE_START     DATE,
  DATE_FINISH    DATE,
  DESCRIPT       VARCHAR2(100 BYTE),
  OSUSER_NAME    VARCHAR2(30 BYTE),
  TERMINAL_NAME  VARCHAR2(30 BYTE),
  APPL_NAME      VARCHAR2(30 BYTE),
  SESSIONID      NUMBER
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON TABLE MASTER.REPL_SESSION IS '������ ����������';

COMMENT ON COLUMN MASTER.REPL_SESSION.ID IS '������';

COMMENT ON COLUMN MASTER.REPL_SESSION.STATUS IS '������';

COMMENT ON COLUMN MASTER.REPL_SESSION.DATE_START IS '�����';

COMMENT ON COLUMN MASTER.REPL_SESSION.DATE_FINISH IS '�����';

COMMENT ON COLUMN MASTER.REPL_SESSION.DESCRIPT IS '���.�����';

COMMENT ON COLUMN MASTER.REPL_SESSION.OSUSER_NAME IS '������������';

COMMENT ON COLUMN MASTER.REPL_SESSION.TERMINAL_NAME IS '������';

COMMENT ON COLUMN MASTER.REPL_SESSION.APPL_NAME IS '����������';



