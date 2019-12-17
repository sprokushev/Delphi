--
-- FOR_INIT  (Package) 
--
CREATE OR REPLACE PACKAGE MASTER.For_Init AS
  
--- ������������� ���������� MASTER 
PROCEDURE Init_MASTER;

-- ������� ������������
FUNCTION GetCurrUser RETURN VARCHAR2;

-- ������� ������
FUNCTION GetCurrTerm RETURN VARCHAR2;

-- ������� ������
FUNCTION GetCurrSessionId RETURN NUMBER;

-- ������� ������������ ����������
FUNCTION AppUserId RETURN NUMBER;
FUNCTION AppUserName RETURN VARCHAR2;
FUNCTION AppUserPost RETURN VARCHAR2;
FUNCTION AppUserUNP RETURN NUMBER;
FUNCTION AppUserSNP RETURN NUMBER;
FUNCTION AppUserMNOS RETURN NUMBER;

-- ���� ����������
PROCEDURE UPDATE_STAT;
    
END; 
/

