--
-- FOR_INIT  (Package) 
--
CREATE OR REPLACE PACKAGE SNP_REPL.For_Init AS

--- Инициализация приложения MASTER
PROCEDURE Init_MASTER;

-- Текущий пользователь
FUNCTION GetCurrUser RETURN VARCHAR2;

-- Текущая машина
FUNCTION GetCurrTerm RETURN VARCHAR2;

END;
/


