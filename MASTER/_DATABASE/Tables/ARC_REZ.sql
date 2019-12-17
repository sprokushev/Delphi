--
-- ARC_REZ  (Table) 
--
CREATE TABLE MASTER.ARC_REZ
(
  DATEUPLOAD   DATE,
  REZ_NUM      VARCHAR2(15 BYTE),
  REZ_NUM_UNP  VARCHAR2(15 BYTE),
  VOL          NUMBER(15,3),
  DEAD_VOL     NUMBER(15,3),
  MAX_VOL      NUMBER(15,3),
  PRIM         VARCHAR2(50 BYTE),
  DISP_NAME    VARCHAR2(50 BYTE),
  AR_TOV_ID    NUMBER(2),
  PROD_ID_NPR  VARCHAR2(5 BYTE),
  ORG_STRU_ID  NUMBER(10),
  STATUS       NUMBER(1),
  MAX_VOL_M3   NUMBER(15,3),
  DEAD_VOL_M3  NUMBER(15,3),
  TRK_COUNT    NUMBER(15),
  FOR_AND      NUMBER(1),
  KOL_LKREZ    NUMBER(15,3)
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON COLUMN MASTER.ARC_REZ.DATEUPLOAD IS '���� ������������';

COMMENT ON COLUMN MASTER.ARC_REZ.REZ_NUM IS 'N ����������';

COMMENT ON COLUMN MASTER.ARC_REZ.VOL IS '������� ������� (�.)';

COMMENT ON COLUMN MASTER.ARC_REZ.DEAD_VOL IS '������ �������';

COMMENT ON COLUMN MASTER.ARC_REZ.MAX_VOL IS '������������ �����';

COMMENT ON COLUMN MASTER.ARC_REZ.AR_TOV_ID IS '��� �������� ������� (1-������������)';

COMMENT ON COLUMN MASTER.ARC_REZ.PROD_ID_NPR IS '������� (KLS_PROD)';

COMMENT ON COLUMN MASTER.ARC_REZ.ORG_STRU_ID IS '������������� (ORG_STRUCTURE)';

COMMENT ON COLUMN MASTER.ARC_REZ.STATUS IS '��������� ����������: 0-� ������, 1-�� �����������, 2-�� �������';

COMMENT ON COLUMN MASTER.ARC_REZ.MAX_VOL_M3 IS '������������ ������� � �3';

COMMENT ON COLUMN MASTER.ARC_REZ.DEAD_VOL_M3 IS '������� ������� � �3';

COMMENT ON COLUMN MASTER.ARC_REZ.TRK_COUNT IS '���������� �������';

COMMENT ON COLUMN MASTER.ARC_REZ.FOR_AND IS '��� ���';



