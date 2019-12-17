/* This object may not be sorted properly in the script due to cirular references. */
--
-- R3_KVIT2SAP  (Table) 
--
CREATE TABLE MASTER.R3_KVIT2SAP
(
  ID_MS         NUMBER(10)                      NOT NULL,
  VSTEL         VARCHAR2(3 BYTE),
  ID_SAP        VARCHAR2(20 BYTE),
  ID_SAP_PSN    VARCHAR2(10 BYTE),
  BEDNR         NUMBER(10),
  VES           NUMBER(15,6)                    DEFAULT 0,
  KVIT_ID       NUMBER(10),
  VBAK_VBELN    VARCHAR2(30 BYTE),
  VBAP_POSNR    VARCHAR2(10 BYTE),
  NOM_ZD        VARCHAR2(12 BYTE),
  OPER          VARCHAR2(1 BYTE),
  LASTOPER      VARCHAR2(1 BYTE),
  SEND_OPER     NUMBER(1),
  DT_OPER       DATE,
  OF_FILE       VARCHAR2(30 BYTE),
  DT_DEL        DATE,
  SEND_DOC      NUMBER(1),
  DT_DOC        DATE,
  OF_FILE_D     VARCHAR2(30 BYTE),
  OS            VARCHAR2(1 BYTE),
  LASTOS        VARCHAR2(1 BYTE),
  SEND_OS       NUMBER(1),
  DT_OS         DATE,
  OS_FILE       VARCHAR2(30 BYTE),
  SU            VARCHAR2(1 BYTE),
  LASTSU        VARCHAR2(1 BYTE),
  SEND_SU       NUMBER(1),
  DT_SU         DATE,
  SU_FILE       VARCHAR2(30 BYTE),
  QQ            VARCHAR2(1 BYTE),
  LASTQQ        VARCHAR2(1 BYTE),
  SEND_QQ       VARCHAR2(240 BYTE),
  DT_QQ         DATE,
  QQ_FILE       VARCHAR2(30 BYTE),
  LOGFILE       VARCHAR2(30 BYTE),
  IS_EXP        NUMBER(1),
  NP            NUMBER(10),
  NUM_KVIT      NUMBER(10),
  NUM_CIST      VARCHAR2(10 BYTE),
  DATE_OTGR     DATE,
  LOAD_TYPE_ID  NUMBER(2),
  PROD_ID_NPR   VARCHAR2(5 BYTE)
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.ID_MS IS 'ID �������� � KERNEL';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.VSTEL IS 'ID ������ ��������';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.ID_SAP IS 'ID �������� � R3';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.ID_SAP_PSN IS 'ID ������� �������� � R3';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.BEDNR IS 'ID ������ � KERNEL';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.VES IS '��� "�������" �� ������� ��������';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.VBAK_VBELN IS '����� ����������';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.VBAP_POSNR IS '�������';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.OPER IS '�������� � ��������� (OF)';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.LASTOPER IS '���������� ��������';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.SEND_OPER IS '������� �������� ����������� ��������';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.DT_OPER IS '���� ��������';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.OF_FILE IS '����';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.DT_DEL IS '���� ��������';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.SEND_DOC IS '������� �������� ����������������� ��������';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.DT_DOC IS '���� ��������';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.OF_FILE_D IS '����';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.OS IS '������ (OS)';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.LASTOS IS '���������� ��������';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.SEND_OS IS '������� �������� ������';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.DT_OS IS '���� ��������';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.OS_FILE IS '����';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.SU IS '��������� ����� (SU)';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.LASTSU IS '���������� ��������';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.SEND_SU IS '������� �������� ��������� �����';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.DT_SU IS '���� ��������';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.SU_FILE IS '����';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.QQ IS '����������� (QQ)';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.LASTQQ IS '���������� ��������';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.SEND_QQ IS '������� �������� �����������';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.DT_QQ IS '���� ��������';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.QQ_FILE IS '����';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.LOGFILE IS '���� ����';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.IS_EXP IS '1 - �������';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.NP IS 'N ��������';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.NUM_KVIT IS 'N ���������';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.NUM_CIST IS 'N ��.��-��';

COMMENT ON COLUMN MASTER.R3_KVIT2SAP.DATE_OTGR IS '���� ��������';



