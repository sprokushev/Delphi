--
-- TRG_BIR_AZC_WEEK_PARUS  (Trigger) 
--
CREATE OR REPLACE TRIGGER MASTER.TRG_BIR_AZC_WEEK_PARUS
BEFORE INSERT
ON MASTER.AZC_WEEK_PARUS
FOR EACH ROW
DECLARE
tmpVar NUMBER;
BEGIN
   tmpVar := 0;
IF :NEW.id IS NULL OR :NEW.id=0 THEN
   SELECT seq_azc_week_parus.NEXTVAL INTO tmpVar FROM dual;
   :NEW.id := tmpVar;
END IF;
END trg_bir_azc_week_parus;
/


