--
-- FOR_INIT  (Package) 
--
CREATE OR REPLACE PACKAGE SNP_REPL.For_Init AS

--- ������������� ���������� MASTER
PROCEDURE Init_MASTER;

-- ������� ������������
FUNCTION GetCurrUser RETURN VARCHAR2;

-- ������� ������
FUNCTION GetCurrTerm RETURN VARCHAR2;

END;
/


