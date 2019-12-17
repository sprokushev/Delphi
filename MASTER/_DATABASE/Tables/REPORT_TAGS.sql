--
-- REPORT_TAGS  (Table) 
--
CREATE TABLE MASTER.REPORT_TAGS
(
  NAME        VARCHAR2(30 BYTE),
  INFO        VARCHAR2(30 BYTE),
  OWNER_TAB   VARCHAR2(15 BYTE),
  QUERY_NAME  VARCHAR2(30 BYTE)
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON TABLE MASTER.REPORT_TAGS IS '���� ����� ����� ���������� �������';

COMMENT ON COLUMN MASTER.REPORT_TAGS.NAME IS '��������';

COMMENT ON COLUMN MASTER.REPORT_TAGS.INFO IS '���������';

COMMENT ON COLUMN MASTER.REPORT_TAGS.OWNER_TAB IS '��������-�������� (� ����� AllRep)';

COMMENT ON COLUMN MASTER.REPORT_TAGS.QUERY_NAME IS '�������� ������� � ����� AllRep ��� ����� ���������';


