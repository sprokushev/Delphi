--
-- R3_ROUTE_FULL  (Table) 
--
CREATE TABLE MASTER.R3_ROUTE_FULL
(
  ROUTE        VARCHAR2(10 BYTE)                NOT NULL,
  ANFRF        VARCHAR2(4 BYTE)                 NOT NULL,
  KNANF        VARCHAR2(10 BYTE),
  KNEND        VARCHAR2(10 BYTE),
  ZZZZ_STATUS  VARCHAR2(1 BYTE),
  ZZZZ_FILE    VARCHAR2(50 BYTE),
  ZZZZ_DATE    DATE
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON COLUMN MASTER.R3_ROUTE_FULL.ROUTE IS '�������';

COMMENT ON COLUMN MASTER.R3_ROUTE_FULL.ANFRF IS '����� ��������';

COMMENT ON COLUMN MASTER.R3_ROUTE_FULL.KNANF IS '���� ��������';

COMMENT ON COLUMN MASTER.R3_ROUTE_FULL.KNEND IS '���� ��������';

COMMENT ON COLUMN MASTER.R3_ROUTE_FULL.ZZZZ_STATUS IS '������� ��������';

COMMENT ON COLUMN MASTER.R3_ROUTE_FULL.ZZZZ_FILE IS '����';

COMMENT ON COLUMN MASTER.R3_ROUTE_FULL.ZZZZ_DATE IS '���� ��������';


