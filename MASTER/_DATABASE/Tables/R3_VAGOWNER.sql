/* This object may not be sorted properly in the script due to cirular references. */
--
-- R3_VAGOWNER  (Table) 
--
CREATE TABLE MASTER.R3_VAGOWNER
(
  R3_VENDORS_ID  VARCHAR2(10 BYTE)              NOT NULL,
  VAGOWNER_ID    NUMBER(10)                     NOT NULL,
  IS_AUTO_LINK   NUMBER(1)                      DEFAULT 1
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON TABLE MASTER.R3_VAGOWNER IS '������ ����������/������������� ��.��-�';

COMMENT ON COLUMN MASTER.R3_VAGOWNER.R3_VENDORS_ID IS '����������� ��. ��-�� �� R3';

COMMENT ON COLUMN MASTER.R3_VAGOWNER.VAGOWNER_ID IS '����������� ��. ��-�� �� ���';

COMMENT ON COLUMN MASTER.R3_VAGOWNER.IS_AUTO_LINK IS '������� �������������� ��������';



