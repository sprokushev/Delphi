--
-- T11_BIR_TEMP_PAYMENTS_PROD  (Trigger) 
--
CREATE OR REPLACE TRIGGER MASTER.T11_BIR_TEMP_PAYMENTS_PROD
BEFORE INSERT
ON MASTER.TEMP_PAYMENTS_PROD
FOR EACH ROW
BEGIN
  IF INSERTING() THEN
    :NEW.TERMINAL_NAME:=For_Init.GetCurrTerm;
    :NEW.OSUSER_NAME:=For_Init.GetCurrUser;
  END IF;
END;
/

