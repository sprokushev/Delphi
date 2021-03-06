--
-- MONTH_REESTR  (Table) 
--
CREATE TABLE MASTER.MONTH_REESTR
(
  ID                NUMBER(10)                  NOT NULL,
  NUM_REE           NUMBER(10),
  DATE_REE          DATE,
  DATE_TO           DATE,
  DATE_PLAN         DATE,
  USE_GRAFIK        NUMBER(1),
  GRAFIK_DATE_FROM  DATE,
  GRAFIK_DATE_TO    DATE,
  STATUS            NUMBER(10),
  DOP_REE           NUMBER(10),
  UHTA_XLS_NAME     VARCHAR2(50 BYTE),
  MOS_DBF_NAME      VARCHAR2(50 BYTE),
  MOS_XLS_NAME      VARCHAR2(50 BYTE)
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON TABLE MASTER.MONTH_REESTR IS '�������� ������� �������';

COMMENT ON COLUMN MASTER.MONTH_REESTR.ID IS 'ID �������';

COMMENT ON COLUMN MASTER.MONTH_REESTR.NUM_REE IS '����� �������';

COMMENT ON COLUMN MASTER.MONTH_REESTR.DATE_REE IS '���� �������';

COMMENT ON COLUMN MASTER.MONTH_REESTR.DATE_TO IS '�������� �� ����';

COMMENT ON COLUMN MASTER.MONTH_REESTR.DATE_PLAN IS '���� �����';

COMMENT ON COLUMN MASTER.MONTH_REESTR.USE_GRAFIK IS '1-������������ ������';

COMMENT ON COLUMN MASTER.MONTH_REESTR.GRAFIK_DATE_FROM IS '� ����';

COMMENT ON COLUMN MASTER.MONTH_REESTR.GRAFIK_DATE_TO IS '�� ����';

COMMENT ON COLUMN MASTER.MONTH_REESTR.STATUS IS '������ �������';

COMMENT ON COLUMN MASTER.MONTH_REESTR.DOP_REE IS '� ���.�������';

COMMENT ON COLUMN MASTER.MONTH_REESTR.UHTA_XLS_NAME IS '��������� ������ (XLS)';

COMMENT ON COLUMN MASTER.MONTH_REESTR.MOS_DBF_NAME IS '���������� ������ (DBF)';



