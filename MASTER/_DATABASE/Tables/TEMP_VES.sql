--
-- TEMP_VES  (Table) 
--
CREATE GLOBAL TEMPORARY TABLE MASTER.TEMP_VES
(
  TAG    VARCHAR2(20 BYTE),
  VALUE  VARCHAR2(20 BYTE),
  NORMA  VARCHAR2(20 BYTE)
)
ON COMMIT PRESERVE ROWS;

COMMENT ON TABLE MASTER.TEMP_VES IS '���� �������� ���������� ��� ��������� ������� ����';



