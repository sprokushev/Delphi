--
-- REPORT_TIP_DATES  (Table) 
--
CREATE TABLE MASTER.REPORT_TIP_DATES
(
  ID           NUMBER,
  REP_KIND     VARCHAR2(30 BYTE),
  SORTBY       NUMBER(10),
  TIP_DATE     VARCHAR2(30 BYTE),
  DEF_TIP      NUMBER(1)                        DEFAULT 0,
  DEF_BEG_VAL  VARCHAR2(30 BYTE),
  DEF_END_VAL  VARCHAR2(30 BYTE),
  VIEW_TIME    NUMBER(1)                        DEFAULT 0
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON TABLE MASTER.REPORT_TIP_DATES IS '������: ���� ���';

COMMENT ON COLUMN MASTER.REPORT_TIP_DATES.REP_KIND IS '��� ������';

COMMENT ON COLUMN MASTER.REPORT_TIP_DATES.SORTBY IS '�������';

COMMENT ON COLUMN MASTER.REPORT_TIP_DATES.TIP_DATE IS '������������ ���� ����';

COMMENT ON COLUMN MASTER.REPORT_TIP_DATES.DEF_TIP IS '��� �� ���������';

COMMENT ON COLUMN MASTER.REPORT_TIP_DATES.DEF_BEG_VAL IS '�������� �� ���������';

COMMENT ON COLUMN MASTER.REPORT_TIP_DATES.DEF_END_VAL IS '�������� �� ���������';



