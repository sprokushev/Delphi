--
-- REPL_SESSION  (Table) 
--
CREATE TABLE SNP_REPL.REPL_SESSION
(
  ID             NUMBER(10)                     NOT NULL,
  STATUS         NUMBER(10)                     DEFAULT 0                     NOT NULL,
  DATE_START     DATE                           DEFAULT SYSDATE               NOT NULL,
  DATE_FINISH    DATE,
  DESCRIPT       VARCHAR2(100 BYTE),
  OSUSER_NAME    VARCHAR2(30 BYTE)              NOT NULL,
  TERMINAL_NAME  VARCHAR2(30 BYTE)              NOT NULL,
  APPL_NAME      VARCHAR2(30 BYTE)
);

COMMENT ON TABLE SNP_REPL.REPL_SESSION IS '������ ����������';

COMMENT ON COLUMN SNP_REPL.REPL_SESSION.ID IS '������';

COMMENT ON COLUMN SNP_REPL.REPL_SESSION.STATUS IS '������';

COMMENT ON COLUMN SNP_REPL.REPL_SESSION.DATE_START IS '�����';

COMMENT ON COLUMN SNP_REPL.REPL_SESSION.DATE_FINISH IS '�����';

COMMENT ON COLUMN SNP_REPL.REPL_SESSION.DESCRIPT IS '���.�����';

COMMENT ON COLUMN SNP_REPL.REPL_SESSION.OSUSER_NAME IS '������������';

COMMENT ON COLUMN SNP_REPL.REPL_SESSION.TERMINAL_NAME IS '������';

COMMENT ON COLUMN SNP_REPL.REPL_SESSION.APPL_NAME IS '����������';

