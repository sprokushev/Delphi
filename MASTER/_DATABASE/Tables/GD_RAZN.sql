--
-- GD_RAZN  (Table) 
--
CREATE TABLE MASTER.GD_RAZN
(
  ID              NUMBER(10)                    NOT NULL,
  TRANSPORTER_ID  NUMBER(6),
  NUM_ZAYV        VARCHAR2(15 BYTE),
  DATE_PLAN       DATE,
  FROM_DATE       DATE,
  TO_DATE         DATE,
  DATE_SOGL       DATE,
  DATE_REG        DATE,
  DATE_UTV        DATE,
  GD_DOGOVOR      VARCHAR2(10 BYTE),
  STAN_OTP_ID     NUMBER(10),
  VETKA_OTP_ID    NUMBER(10),
  GD_OTPR_ID      NUMBER(10),
  GROTP_ID        NUMBER(6),
  TEX_PD_ID       NUMBER(10),
  LOAD_TYPE_ID    NUMBER(2),
  EXPED_ID        NUMBER(6),
  GD_GROUP_ID     NUMBER(10),
  GD_SOOB_ID      NUMBER(10),
  GD_PODACH_ID    NUMBER(10),
  NAPR_MOS_ID     NUMBER(10),
  SOGL            INTEGER
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON TABLE MASTER.GD_RAZN IS '�������� ����������';

COMMENT ON COLUMN MASTER.GD_RAZN.ID IS '�������� ������';

COMMENT ON COLUMN MASTER.GD_RAZN.TRANSPORTER_ID IS '����������';

COMMENT ON COLUMN MASTER.GD_RAZN.NUM_ZAYV IS '����� ������';

COMMENT ON COLUMN MASTER.GD_RAZN.DATE_PLAN IS '���� �����';

COMMENT ON COLUMN MASTER.GD_RAZN.FROM_DATE IS '� ����';

COMMENT ON COLUMN MASTER.GD_RAZN.TO_DATE IS '�� ����';

COMMENT ON COLUMN MASTER.GD_RAZN.DATE_SOGL IS '���� ������������';

COMMENT ON COLUMN MASTER.GD_RAZN.DATE_REG IS '���� �����������';

COMMENT ON COLUMN MASTER.GD_RAZN.DATE_UTV IS '���� �����������';

COMMENT ON COLUMN MASTER.GD_RAZN.GD_DOGOVOR IS '� �������� �� ����������� ���������';

COMMENT ON COLUMN MASTER.GD_RAZN.STAN_OTP_ID IS '������� �����������';

COMMENT ON COLUMN MASTER.GD_RAZN.VETKA_OTP_ID IS '����� �����������';

COMMENT ON COLUMN MASTER.GD_RAZN.GD_OTPR_ID IS '������� ��������';

COMMENT ON COLUMN MASTER.GD_RAZN.GROTP_ID IS '�����������';

COMMENT ON COLUMN MASTER.GD_RAZN.TEX_PD_ID IS '���������� ������';

COMMENT ON COLUMN MASTER.GD_RAZN.LOAD_TYPE_ID IS '��� ���������������';

COMMENT ON COLUMN MASTER.GD_RAZN.EXPED_ID IS '����������';

COMMENT ON COLUMN MASTER.GD_RAZN.GD_GROUP_ID IS '������ �����';

COMMENT ON COLUMN MASTER.GD_RAZN.GD_SOOB_ID IS '��� ���������';

COMMENT ON COLUMN MASTER.GD_RAZN.GD_PODACH_ID IS '��� ������';

COMMENT ON COLUMN MASTER.GD_RAZN.NAPR_MOS_ID IS '����������� �������_����� �����';

COMMENT ON COLUMN MASTER.GD_RAZN.SOGL IS '������� � ������������';



