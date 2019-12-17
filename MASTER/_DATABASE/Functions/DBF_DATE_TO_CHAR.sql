--
-- DBF_DATE_TO_CHAR  (Function) 
--
CREATE OR REPLACE FUNCTION MASTER.DBF_DATE_TO_CHAR(pDate DATE) RETURN VARCHAR2 AS
BEGIN
     IF pDate IS NULL THEN
	   RETURN '{  /  /  }';
	 ELSE
	   RETURN TO_CHAR(pDate,'{mm/dd/yyyy}');
	 END IF;
END;
/
