--
-- REPL_SITE_DESC  (Table) 
--
CREATE TABLE MASTER.REPL_SITE_DESC
(
  ID            NUMBER(10)                      NOT NULL,
  REPL_SITE     NUMBER(10),
  REPL_LIST     NUMBER(10),
  ACTIVE        NUMBER(1)                       DEFAULT 0,
  IS_AUTO_LINK  NUMBER(1)                       DEFAULT 0
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON TABLE MASTER.REPL_SITE_DESC IS '������������ ����-����������';

COMMENT ON COLUMN MASTER.REPL_SITE_DESC.ID IS '������������ ����-����������';

COMMENT ON COLUMN MASTER.REPL_SITE_DESC.REPL_SITE IS '���� ����������';

COMMENT ON COLUMN MASTER.REPL_SITE_DESC.REPL_LIST IS '����������';

COMMENT ON COLUMN MASTER.REPL_SITE_DESC.ACTIVE IS '�������';

COMMENT ON COLUMN MASTER.REPL_SITE_DESC.IS_AUTO_LINK IS '������� �������������� ��������';



