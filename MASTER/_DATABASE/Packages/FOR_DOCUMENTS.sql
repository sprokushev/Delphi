--
-- FOR_DOCUMENTS  (Package) 
--
CREATE OR REPLACE PACKAGE MASTER.For_Documents AS

-- ����� �������� �� ���������� (ID<>pDocId)
-- ������������ ��������:
-- 				>0 - ����� ���������� ���������
--				0 - �� ����������
-- 				<0 - ������
FUNCTION CHECK_EXIST(pDocType NUMBER, pMestoId NUMBER, pDocId VARCHAR2, pDocPrefix VARCHAR2, pDocNum NUMBER, pDocDate DATE) RETURN NUMBER;

-- ��������� ����� ��������� � ������� �� �������������� ������ �������������
-- ������������ ��������:
-- 				1 - ��� ����������
--				0 - �� ����������
-- 				<0 - ������
FUNCTION CHECK_RESERV(pDocType NUMBER, pMestoId NUMBER, pDocPrefix VARCHAR2, pDocNum NUMBER, pDocDate DATE) RETURN NUMBER;

-- �������� ������ ����������������� ������� ��� ������� ���� ���������
-- �������� ������������
PROCEDURE CLEAR_RESERV (pDocType NUMBER, pMestoId NUMBER);

-- ���������� ��������� ����� ���������
-- ������������ �������� - ����� ���������
FUNCTION GET_NEXT_NUM(pDocType NUMBER, pMestoId NUMBER, pDocPrefix VARCHAR2, pDocDate DATE) RETURN NUMBER;

-- ��������� ����� ���������
PROCEDURE SET_NUM(pDocType NUMBER, pMestoId NUMBER, pDocId VARCHAR2, pDocPrefix VARCHAR2, pDocNum NUMBER, pDocDate DATE);

END;

/

