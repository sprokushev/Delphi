--
-- KLS_ZPU_TYPES  (Table) 
--
CREATE TABLE MASTER.KLS_ZPU_TYPES
(
  ID          NUMBER(10)                        NOT NULL,
  NAME        VARCHAR2(30 BYTE),
  PREFIX      VARCHAR2(30 BYTE),
  PREFIX_NUM  VARCHAR2(10 BYTE)
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON TABLE MASTER.KLS_ZPU_TYPES IS '���������� ����� �����';

COMMENT ON COLUMN MASTER.KLS_ZPU_TYPES.ID IS 'ID ���� ������';

COMMENT ON COLUMN MASTER.KLS_ZPU_TYPES.NAME IS '������������';

COMMENT ON COLUMN MASTER.KLS_ZPU_TYPES.PREFIX IS '��� ������';

COMMENT ON COLUMN MASTER.KLS_ZPU_TYPES.PREFIX_NUM IS '������� ����� �������';



