--
-- ORA_VAL  (Function) 
--
CREATE OR REPLACE FUNCTION MASTER.ORA_VAL(pChar VARCHAR2, pFormat VARCHAR2 DEFAULT NULL) RETURN NUMBER AS
BEGIN
  RETURN  ORA_CHAR_TO_NUM(TRANSLATE(pChar,
   '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz����������������������������������������������������������������', '0123456789')
   ,pFormat);
END;
/

