--
-- TRG_BIUDR_REPL_SCHEMA_ROW  (Trigger) 
--
CREATE OR REPLACE TRIGGER SNP_REPL.TRG_BIUDR_REPL_SCHEMA_ROW
 BEFORE DELETE OR INSERT OR UPDATE ON SNP_REPL.REPL_SCHEMA_ROW  FOR EACH ROW
BEGIN
  IF INSERTING() THEN
    IF :NEW.RN=0 OR :NEW.RN IS NULL THEN
      :NEW.RN:=Get_Seq_Global();
    END IF;
	IF :NEW.TABLE_DEST_RN IS NULL THEN
	  :NEW.TABLE_DEST_RN:=:NEW.TABLE_SOURCE_RN;
	END IF;  
  END IF;	
  IF INSERTING() OR UPDATING() THEN
	IF :NEW.REPL_TABLE||' '=' ' THEN
	  :NEW.REPL_TABLE:=USER||'.V_REPL';
	END IF;  
  END IF;
END;
/


