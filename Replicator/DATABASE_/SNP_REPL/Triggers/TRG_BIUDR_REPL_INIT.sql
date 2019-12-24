--
-- TRG_BIUDR_REPL_INIT  (Trigger) 
--
CREATE OR REPLACE TRIGGER SNP_REPL.TRG_BIUDR_REPL_INIT
 BEFORE DELETE OR INSERT OR UPDATE ON SNP_REPL.REPL_INIT  FOR EACH ROW
BEGIN
  IF INSERTING() THEN
    IF :NEW.RN=0 OR :NEW.RN IS NULL THEN
      :NEW.RN:=Get_Seq_Global();
    END IF;
  END IF;
END;
/

