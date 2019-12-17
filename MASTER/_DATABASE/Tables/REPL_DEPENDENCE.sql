--
-- REPL_DEPENDENCE  (Table) 
--
CREATE TABLE MASTER.REPL_DEPENDENCE
(
  ID           NUMBER(10)                       NOT NULL,
  SORTBY       NUMBER(10)                       DEFAULT 1,
  REPL_PARENT  NUMBER(10),
  REPL_CHILD   NUMBER(10)
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON TABLE MASTER.REPL_DEPENDENCE IS '������ ��������� ����������';

COMMENT ON COLUMN MASTER.REPL_DEPENDENCE.ID IS '�����������';

COMMENT ON COLUMN MASTER.REPL_DEPENDENCE.SORTBY IS '������� ������';

COMMENT ON COLUMN MASTER.REPL_DEPENDENCE.REPL_PARENT IS '����������-�������� (��� �������)';

COMMENT ON COLUMN MASTER.REPL_DEPENDENCE.REPL_CHILD IS '����������-����� (�� ���� �������)';



