--
-- T_GU12_BR_ID  (Trigger) 
--
CREATE OR REPLACE TRIGGER MASTER.T_GU12_BR_ID
BEFORE INSERT
ON MASTER.GU12_BR
FOR EACH ROW
DECLARE
tmpVar NUMBER;
BEGIN
   tmpVar := 0;

   IF :NEW.ID IS NULL OR :NEW.ID = 0
   THEN
      SELECT seq_gu12_b.NEXTVAL
        INTO tmpvar
        FROM DUAL;

      :NEW.ID := tmpvar;
   END IF;

END T_GU12_BR_ID;
/


