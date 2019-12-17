--
-- USL_DOG  (Table) 
--
CREATE TABLE MASTER.USL_DOG
(
  DOG_ID            NUMBER(5)                   NOT NULL,
  USL_NUMBER        NUMBER(3)                   NOT NULL,
  USL_NAME          VARCHAR2(75 BYTE),
  USL_BEGIN_DATE    DATE,
  USL_END_DATE      DATE,
  VID_USL_ID        NUMBER(2),
  PAYDELAY_ID       NUMBER(2),
  PAYDELAY_DATE     DATE,
  KOL_DN            NUMBER(4),
  USL_AKT           NUMBER(1),
  USL_UTV           NUMBER(1),
  USL_BAZ           NUMBER(1),
  PROC_PRED         NUMBER(3),
  PROC_PENI         NUMBER(5,2),
  PROC_INSURE       NUMBER(5,2),
  NEUST             NUMBER(4,1),
  USL_SUM           NUMBER(6,2),
  PAYFORM_ID        NUMBER(2),
  CAT_CEN_ID        NUMBER(3),
  ID                NUMBER(10),
  NPOCAT_CEN_ID     NUMBER(3),
  R3_NUM_ISP        VARCHAR2(10 BYTE),
  USL_SUM_AREND     NUMBER(6,2),
  ISU_KOD_DOG_TEST  VARCHAR2(13 BYTE),
  ISU_KOD_DOG       VARCHAR2(13 BYTE)
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON COLUMN MASTER.USL_DOG.DOG_ID IS '�������';

COMMENT ON COLUMN MASTER.USL_DOG.USL_NUMBER IS '�������';

COMMENT ON COLUMN MASTER.USL_DOG.USL_NAME IS '������������';

COMMENT ON COLUMN MASTER.USL_DOG.USL_BEGIN_DATE IS '� ����';

COMMENT ON COLUMN MASTER.USL_DOG.USL_END_DATE IS '�� ����';

COMMENT ON COLUMN MASTER.USL_DOG.VID_USL_ID IS '��� �������';

COMMENT ON COLUMN MASTER.USL_DOG.PAYDELAY_ID IS '��� ��������';

COMMENT ON COLUMN MASTER.USL_DOG.PAYDELAY_DATE IS '�������� �� ������������ ����';

COMMENT ON COLUMN MASTER.USL_DOG.KOL_DN IS '����� ���� ��������';

COMMENT ON COLUMN MASTER.USL_DOG.USL_AKT IS '���������';

COMMENT ON COLUMN MASTER.USL_DOG.USL_UTV IS '����������';

COMMENT ON COLUMN MASTER.USL_DOG.USL_BAZ IS '�������';

COMMENT ON COLUMN MASTER.USL_DOG.PROC_PRED IS '������� ����������';

COMMENT ON COLUMN MASTER.USL_DOG.PROC_PENI IS '������� ����';

COMMENT ON COLUMN MASTER.USL_DOG.PROC_INSURE IS '������� ���������';

COMMENT ON COLUMN MASTER.USL_DOG.NEUST IS '������ ���������';

COMMENT ON COLUMN MASTER.USL_DOG.USL_SUM IS '���. � �����';

COMMENT ON COLUMN MASTER.USL_DOG.PAYFORM_ID IS '��� ������';

COMMENT ON COLUMN MASTER.USL_DOG.CAT_CEN_ID IS '��������� ����';

COMMENT ON COLUMN MASTER.USL_DOG.ID IS 'ID';

COMMENT ON COLUMN MASTER.USL_DOG.NPOCAT_CEN_ID IS '��������� ���� ��� �������';

COMMENT ON COLUMN MASTER.USL_DOG.R3_NUM_ISP IS '����������� R3';

COMMENT ON COLUMN MASTER.USL_DOG.USL_SUM_AREND IS '���. � ����� �� �����.������';

COMMENT ON COLUMN MASTER.USL_DOG.ISU_KOD_DOG_TEST IS '��� �������� �� ��� ����������� (�������� ����)';

COMMENT ON COLUMN MASTER.USL_DOG.ISU_KOD_DOG IS '��� �������� �� ��� ����������� (���������)';



