--
-- ARH_DATE  (Table) 
--
CREATE TABLE MASTER.ARH_DATE
(
  TABLENAME  VARCHAR2(30 BYTE)                  NOT NULL,
  LAST_DATE  DATE
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON TABLE MASTER.ARH_DATE IS '���� ������� �� ��������� ������';

COMMENT ON COLUMN MASTER.ARH_DATE.TABLENAME IS '�������';

COMMENT ON COLUMN MASTER.ARH_DATE.LAST_DATE IS '����';



