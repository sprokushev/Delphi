--
-- T_GU12_BR_ID_TEST  (Trigger) 
--
CREATE OR REPLACE TRIGGER MASTER.T_GU12_BR_ID_TEST
BEFORE INSERT
ON MASTER.GU12_BR_TEST
FOR EACH ROW
DECLARE
tmpVar NUMBER;
BEGIN
   tmpVar := 0;

   IF :NEW.ID IS NULL OR :NEW.ID = 0
   THEN
      SELECT seq_gu12_B_TEST.NEXTVAL
        INTO tmpvar
        FROM DUAL;

      :NEW.ID := tmpvar;
   END IF;

END T_GU12_BR_ID_TEST;
/


