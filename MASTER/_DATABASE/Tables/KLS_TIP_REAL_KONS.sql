--
-- KLS_TIP_REAL_KONS  (Table) 
--
CREATE TABLE MASTER.KLS_TIP_REAL_KONS
(
  ID    NUMBER(10)                              NOT NULL,
  NAME  VARCHAR2(30 BYTE)
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON TABLE MASTER.KLS_TIP_REAL_KONS IS '����.����������: ��� ����������';

COMMENT ON COLUMN MASTER.KLS_TIP_REAL_KONS.ID IS '��� ����������';

COMMENT ON COLUMN MASTER.KLS_TIP_REAL_KONS.NAME IS '������������';



