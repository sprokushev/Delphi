--
-- ISU_BILLS  (Table) 
--
CREATE TABLE MASTER.ISU_BILLS
(
  ISU_KOD      VARCHAR2(10 BYTE)                NOT NULL,
  ISU_KOD_OLD  VARCHAR2(10 BYTE),
  NOM_SF       VARCHAR2(10 BYTE),
  DATE_VYP_SF  DATE,
  ISU_KOD_DOG  VARCHAR2(13 BYTE),
  POLUCH_KSSS  VARCHAR2(10 BYTE),
  USL_PLAT     VARCHAR2(6 BYTE),
  GROTP_KSSS   VARCHAR2(10 BYTE),
  PRIM         VARCHAR2(100 BYTE),
  DOPOLN       VARCHAR2(50 BYTE),
  NUMDATEKVIT  VARCHAR2(1024 BYTE),
  DATE_KVIT    DATE,
  STATUS       NUMBER(1),
  LATENT       VARCHAR2(1 BYTE),
  NOM_AVANS    VARCHAR2(200 BYTE)
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON TABLE MASTER.ISU_BILLS IS '��������� ����-������� �� ��� �����������';

COMMENT ON COLUMN MASTER.ISU_BILLS.ISU_KOD IS '��� �����-�������';

COMMENT ON COLUMN MASTER.ISU_BILLS.ISU_KOD_OLD IS '��� ������������� �����-�������';

COMMENT ON COLUMN MASTER.ISU_BILLS.NOM_SF IS '����� �����-�������';

COMMENT ON COLUMN MASTER.ISU_BILLS.DATE_VYP_SF IS '���� �����-�������';

COMMENT ON COLUMN MASTER.ISU_BILLS.ISU_KOD_DOG IS '��� ��������';

COMMENT ON COLUMN MASTER.ISU_BILLS.POLUCH_KSSS IS '��� ���������������';

COMMENT ON COLUMN MASTER.ISU_BILLS.USL_PLAT IS '������� �������';

COMMENT ON COLUMN MASTER.ISU_BILLS.GROTP_KSSS IS '��� ����������������';

COMMENT ON COLUMN MASTER.ISU_BILLS.PRIM IS '����������';

COMMENT ON COLUMN MASTER.ISU_BILLS.STATUS IS '0 - ��������, 1 - ��������������, 2 - ������������, 3 - �������������';

COMMENT ON COLUMN MASTER.ISU_BILLS.LATENT IS '� - �������, ����� - �����������';



