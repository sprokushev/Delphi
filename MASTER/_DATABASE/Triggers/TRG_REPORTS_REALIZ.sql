--
-- TRG_REPORTS_REALIZ  (Trigger) 
--
CREATE OR REPLACE TRIGGER MASTER.TRG_REPORTS_REALIZ
BEFORE INSERT OR UPDATE
ON MASTER.REPORTS_REALIZ
FOR EACH ROW
DECLARE
tmpVar NUMBER;
BEGIN
    IF :NEW.ID=0 OR :NEW.ID IS NULL THEN
      tmpVar := 0;
      SELECT seq_ID.NEXTVAL INTO tmpVar FROM dual;
     :NEW.ID := tmpVar;
    END IF;
END TRG_REPORTS_REALIZ;
/


