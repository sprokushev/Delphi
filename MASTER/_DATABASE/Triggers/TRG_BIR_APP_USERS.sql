--
-- TRG_BIR_APP_USERS  (Trigger) 
--
CREATE OR REPLACE TRIGGER MASTER.TRG_BIR_APP_USERS
BEFORE INSERT OR UPDATE
ON MASTER.APP_USERS
FOR EACH ROW
BEGIN
  IF NVL(:NEW.ID,0)=0 THEN
    SELECT seq_id.NEXTVAL INTO :NEW.ID FROM DUAL;
  END iF;
  IF :NEW.FULLNAME||' '=' ' THEN
    :NEW.FULLNAME:=:NEW.NAME;
  END IF;	
END trg_bir_app_users;
/


