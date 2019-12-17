--
-- TRG_BIR_INF2PB_SCH  (Trigger) 
--
CREATE OR REPLACE TRIGGER MASTER.TRG_BIR_INF2PB_SCH
BEFORE INSERT
ON MASTER.INF2PB_SCH
FOR EACH ROW
DECLARE
tmpVar NUMBER;
BEGIN

  IF :NEW.ID=0 OR :NEW.ID is NULL THEN
    tmpVar := 0;
    Select seq_INF2PB_SCH.NextVal into tmpVar from dual;
   :NEW.ID := tmpVar;
  END IF;
END TRG_BIR_INF2PB_SCH;
/

