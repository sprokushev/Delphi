--
-- GD_DATE  (Function) 
--
CREATE OR REPLACE FUNCTION MASTER.Gd_Date(ADATE DATE) RETURN DATE IS
BEGIN
  IF TO_CHAR(ADATE,'hh24')>='17' THEN
    RETURN ADATE+1;
  ELSE
    RETURN ADATE;
  END IF;
END Gd_Date;

/

