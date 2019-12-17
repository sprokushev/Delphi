--
-- DIAGRAM  (Table) 
--
CREATE TABLE MASTER.DIAGRAM
(
  TERMINAL_NAME  VARCHAR2(30 BYTE),
  OSUSER_NAME    VARCHAR2(30 BYTE),
  COL_X1_NAME    VARCHAR2(100 BYTE),
  COL_X1_VALUE   VARCHAR2(100 BYTE),
  COL_X2_NAME    VARCHAR2(100 BYTE),
  COL_X2_VALUE   VARCHAR2(100 BYTE),
  COL_X3_NAME    VARCHAR2(100 BYTE),
  COL_X3_VALUE   VARCHAR2(100 BYTE),
  COL_Y1_NAME    VARCHAR2(100 BYTE),
  COL_Y1_VALUE   VARCHAR2(100 BYTE),
  COL_Y2_NAME    VARCHAR2(100 BYTE),
  COL_Y2_VALUE   VARCHAR2(100 BYTE),
  COL_Y3_NAME    VARCHAR2(100 BYTE),
  COL_Y3_VALUE   VARCHAR2(100 BYTE),
  COL_Y4_NAME    VARCHAR2(100 BYTE),
  COL_Y4_VALUE   VARCHAR2(100 BYTE),
  COL_Y5_NAME    VARCHAR2(100 BYTE),
  COL_Y5_VALUE   VARCHAR2(100 BYTE),
  COL_Y6_NAME    VARCHAR2(100 BYTE),
  COL_Y6_VALUE   VARCHAR2(100 BYTE),
  COL_Y7_NAME    VARCHAR2(100 BYTE),
  COL_Y7_VALUE   VARCHAR2(100 BYTE),
  COL_Y8_NAME    VARCHAR2(100 BYTE),
  COL_Y8_VALUE   VARCHAR2(100 BYTE),
  COL_Y9_NAME    VARCHAR2(100 BYTE),
  COL_Y9_VALUE   VARCHAR2(100 BYTE),
  COL_SORT       VARCHAR2(50 BYTE),
  PRIM           VARCHAR2(200 BYTE),
  TITLE          VARCHAR2(50 BYTE),
  COL_Y10_NAME   VARCHAR2(100 BYTE),
  COL_Y10_VALUE  VARCHAR2(100 BYTE),
  COL_Y11_NAME   VARCHAR2(100 BYTE),
  COL_Y11_VALUE  VARCHAR2(100 BYTE),
  COL_Y12_NAME   VARCHAR2(100 BYTE),
  COL_Y12_VALUE  VARCHAR2(100 BYTE),
  COL_Y13_NAME   VARCHAR2(100 BYTE),
  COL_Y13_VALUE  VARCHAR2(100 BYTE),
  COL_Y14_NAME   VARCHAR2(100 BYTE),
  COL_Y14_VALUE  VARCHAR2(100 BYTE),
  COL_Y15_NAME   VARCHAR2(100 BYTE),
  COL_Y15_VALUE  VARCHAR2(100 BYTE),
  COL_Y16_NAME   VARCHAR2(100 BYTE),
  COL_Y16_VALUE  VARCHAR2(100 BYTE),
  COL_Y17_NAME   VARCHAR2(100 BYTE),
  COL_Y17_VALUE  VARCHAR2(100 BYTE),
  COL_Y18_NAME   VARCHAR2(100 BYTE),
  COL_Y18_VALUE  VARCHAR2(100 BYTE),
  COL_Y19_NAME   VARCHAR2(100 BYTE),
  COL_Y19_VALUE  VARCHAR2(100 BYTE),
  COL_Y20_NAME   VARCHAR2(100 BYTE),
  COL_Y20_VALUE  VARCHAR2(100 BYTE),
  VIEW_ROW       NUMBER(1)
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON COLUMN MASTER.DIAGRAM.PRIM IS '���������� � ������';

COMMENT ON COLUMN MASTER.DIAGRAM.TITLE IS '�������� � ��������� ������';

COMMENT ON COLUMN MASTER.DIAGRAM.VIEW_ROW IS '1-���������� ������ � ������';



