--
-- TRG_BIUDR_TAX_FILES  (Trigger) 
--
CREATE OR REPLACE TRIGGER MASTER.TRG_BIUDR_TAX_FILES
BEFORE INSERT OR DELETE OR UPDATE
ON MASTER.ISU_TAX_FILES FOR EACH ROW
DECLARE
  v_tmp NUMBER;
BEGIN

  IF INSERTING() OR UPDATING() THEN
    -- ���������� ID
    IF :new.ID||' '=' ' OR :new.ID IS NULL THEN
      SELECT SEQ_TAX_ID.nextval INTO :new.ID FROM DUAL;
    END IF;
  END IF;
  
END;
/


