--
-- R3_CAT_CEN  (Table) 
--
CREATE TABLE MASTER.R3_CAT_CEN
(
  ID            NUMBER(10)                      NOT NULL,
  NUM_ISP       VARCHAR2(10 BYTE),
  CUSTOMERS_ID  VARCHAR2(10 BYTE),
  NAME          VARCHAR2(50 BYTE),
  CAT_CEN_ID    NUMBER(10),
  IS_AUTO_LINK  NUMBER(1)                       DEFAULT 0
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON TABLE MASTER.R3_CAT_CEN IS '���������� ������������� �� R3';

COMMENT ON COLUMN MASTER.R3_CAT_CEN.ID IS '����������� ������������� �� R3';

COMMENT ON COLUMN MASTER.R3_CAT_CEN.NAME IS '������������';

COMMENT ON COLUMN MASTER.R3_CAT_CEN.CAT_CEN_ID IS '��������� ����';

COMMENT ON COLUMN MASTER.R3_CAT_CEN.IS_AUTO_LINK IS '������� �������������� �����';


