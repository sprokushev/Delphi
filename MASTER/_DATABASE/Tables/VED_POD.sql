--
-- VED_POD  (Table) 
--
CREATE TABLE MASTER.VED_POD
(
  ID              NUMBER(10)                    NOT NULL,
  MESTO_ID        NUMBER(10)                    DEFAULT 1,
  LOAD_TYPE_ID    NUMBER(10)                    DEFAULT 1,
  VETKA_OTP_ID    NUMBER(10),
  POD_NUM         NUMBER(10),
  POD_DATE        DATE,
  TECH_TIME       DATE,
  GOTOV_TIME      DATE,
  BEG_NALIV_TIME  DATE,
  END_NALIV_TIME  DATE,
  KOL             NUMBER(5)                     DEFAULT 0,
  VES_CIST        NUMBER(12,3)                  DEFAULT 0
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON TABLE MASTER.VED_POD IS '��������� ������';

COMMENT ON COLUMN MASTER.VED_POD.ID IS 'ID ��������� ������';

COMMENT ON COLUMN MASTER.VED_POD.MESTO_ID IS '����� ��������';

COMMENT ON COLUMN MASTER.VED_POD.LOAD_TYPE_ID IS '��� ���������������';

COMMENT ON COLUMN MASTER.VED_POD.VETKA_OTP_ID IS '����� �����������';

COMMENT ON COLUMN MASTER.VED_POD.POD_NUM IS '����� ���������';

COMMENT ON COLUMN MASTER.VED_POD.POD_DATE IS '���� ���������';

COMMENT ON COLUMN MASTER.VED_POD.TECH_TIME IS '����������� ��������';

COMMENT ON COLUMN MASTER.VED_POD.GOTOV_TIME IS '���� ������������ ��������';

COMMENT ON COLUMN MASTER.VED_POD.BEG_NALIV_TIME IS '���� ������ ������';

COMMENT ON COLUMN MASTER.VED_POD.END_NALIV_TIME IS '���� ��������� ������';

COMMENT ON COLUMN MASTER.VED_POD.KOL IS '���-�� �������';

COMMENT ON COLUMN MASTER.VED_POD.VES_CIST IS '��� �������';



