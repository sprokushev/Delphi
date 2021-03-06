--
-- R3_BILLS  (Table) 
--
CREATE TABLE MASTER.R3_BILLS
(
  VBELN            NUMBER(15)                   NOT NULL,
  NOM_R3           NUMBER(15),
  NOM_DOK          NUMBER(15),
  NOM_SF           NUMBER(15),
  DATE_VYP_SF      DATE,
  SUMMA_DOK        NUMBER(15,2)                 DEFAULT 0,
  SUMMA_PROD       NUMBER(15,2)                 DEFAULT 0,
  SUMMA_PROD_NDS   NUMBER(15,2)                 DEFAULT 0,
  SUMMA_AKCIZ      NUMBER(15,2)                 DEFAULT 0,
  SUMMA_TARIF      NUMBER(15,2)                 DEFAULT 0,
  SUMMA_TARIF_NDS  NUMBER(15,2)                 DEFAULT 0,
  SUMMA_VOZN       NUMBER(15,2)                 DEFAULT 0,
  SUMMA_VOZN_NDS   NUMBER(15,2)                 DEFAULT 0,
  SUMMA_STRAH      NUMBER(15,2)                 DEFAULT 0,
  VBAP_MATNR       VARCHAR2(10 BYTE),
  IS_AGENT         NUMBER(1),
  VES              NUMBER(15,6)                 DEFAULT 0
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON COLUMN MASTER.R3_BILLS.VBELN IS '���� �� R3';

COMMENT ON COLUMN MASTER.R3_BILLS.NOM_R3 IS 'N ����� R3';

COMMENT ON COLUMN MASTER.R3_BILLS.NOM_DOK IS 'N ����� ���';

COMMENT ON COLUMN MASTER.R3_BILLS.NOM_SF IS 'N ����� ���';

COMMENT ON COLUMN MASTER.R3_BILLS.DATE_VYP_SF IS '���� �����';

COMMENT ON COLUMN MASTER.R3_BILLS.SUMMA_DOK IS '����� ����-�������';

COMMENT ON COLUMN MASTER.R3_BILLS.SUMMA_PROD IS '����� �� ������� (���.��� � �����)';

COMMENT ON COLUMN MASTER.R3_BILLS.SUMMA_PROD_NDS IS '��� �� �������';

COMMENT ON COLUMN MASTER.R3_BILLS.SUMMA_AKCIZ IS '�����';

COMMENT ON COLUMN MASTER.R3_BILLS.SUMMA_TARIF IS '����� (���.���)';

COMMENT ON COLUMN MASTER.R3_BILLS.SUMMA_TARIF_NDS IS '��� �� �����';

COMMENT ON COLUMN MASTER.R3_BILLS.SUMMA_VOZN IS '�������������� (���.���)';

COMMENT ON COLUMN MASTER.R3_BILLS.SUMMA_VOZN_NDS IS '��� �� ��������������';

COMMENT ON COLUMN MASTER.R3_BILLS.SUMMA_STRAH IS '���������';

COMMENT ON COLUMN MASTER.R3_BILLS.VBAP_MATNR IS '��������';

COMMENT ON COLUMN MASTER.R3_BILLS.VES IS '���';



