--
-- KLS_NAR_LINE  (Table) 
--
CREATE TABLE MASTER.KLS_NAR_LINE
(
  ID         NUMBER(10)                         NOT NULL,
  NARIAD_ID  NUMBER(10),
  NOM_ZD     VARCHAR2(12 BYTE),
  IS_LOADED  NUMBER(1)                          DEFAULT 0,
  VES        NUMBER(14,3)                       DEFAULT 0,
  KOL        NUMBER(5)                          DEFAULT 0,
  FACT_VES   NUMBER(14,3)                       DEFAULT 0,
  FACT_KOL   NUMBER(5)                          DEFAULT 0
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON TABLE MASTER.KLS_NAR_LINE IS '������� ������ / ���������� �� ��������';

COMMENT ON COLUMN MASTER.KLS_NAR_LINE.NARIAD_ID IS 'ID ������';

COMMENT ON COLUMN MASTER.KLS_NAR_LINE.NOM_ZD IS '� �������';

COMMENT ON COLUMN MASTER.KLS_NAR_LINE.VES IS '��� � ��������, ��';

COMMENT ON COLUMN MASTER.KLS_NAR_LINE.KOL IS '���-�� � ��������';

COMMENT ON COLUMN MASTER.KLS_NAR_LINE.FACT_VES IS '���������� ���������, ��';

COMMENT ON COLUMN MASTER.KLS_NAR_LINE.FACT_KOL IS '���������� ���������, ���-��';



