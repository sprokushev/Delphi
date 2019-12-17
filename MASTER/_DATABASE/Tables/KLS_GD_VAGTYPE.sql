--
-- KLS_GD_VAGTYPE  (Table) 
--
CREATE TABLE MASTER.KLS_GD_VAGTYPE
(
  ID            NUMBER(10)                      NOT NULL,
  ABBR          VARCHAR2(3 BYTE),
  NAME          VARCHAR2(30 BYTE),
  COLOR_GDPL    NUMBER(1),
  COLOR_NAME    VARCHAR2(20 BYTE),
  PLAN_NAME     VARCHAR2(30 BYTE),
  VAGONTYPE_ID  NUMBER(2)
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON TABLE MASTER.KLS_GD_VAGTYPE IS '���� ������� (��� ��-12)';

COMMENT ON COLUMN MASTER.KLS_GD_VAGTYPE.ID IS '��� ������ (��� ��-12)';

COMMENT ON COLUMN MASTER.KLS_GD_VAGTYPE.ABBR IS '���';

COMMENT ON COLUMN MASTER.KLS_GD_VAGTYPE.NAME IS '������������';

COMMENT ON COLUMN MASTER.KLS_GD_VAGTYPE.COLOR_GDPL IS '������� � ��������� �����';

COMMENT ON COLUMN MASTER.KLS_GD_VAGTYPE.COLOR_NAME IS '������������ � ���������� �����';

COMMENT ON COLUMN MASTER.KLS_GD_VAGTYPE.PLAN_NAME IS '������������ (��� ������������)';



