--
-- TRG_BIR_DOVER  (Trigger) 
--
CREATE OR REPLACE TRIGGER MASTER.TRG_BIR_DOVER
BEFORE INSERT
ON MASTER.KLS_DOVER
FOR EACH ROW
DECLARE
tmpVar NUMBER;
BEGIN

  IF :NEW.ID=0 OR :NEW.ID is NULL THEN
    tmpVar := 0;
    Select seq_DOVER.NextVal into tmpVar from dual;
   :NEW.ID := tmpVar;
  END IF;
END TRG_BIR_DOVER;
/


