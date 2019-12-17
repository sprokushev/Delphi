--
-- TRG_BIUDR_KLS_PASP  (Trigger) 
--
CREATE OR REPLACE TRIGGER MASTER.TRG_BIUDR_KLS_PASP
BEFORE INSERT OR DELETE OR UPDATE
ON MASTER.KLS_PASP
FOR EACH ROW
DECLARE
  v_tmp NUMBER;
BEGIN
  IF UPDATING() OR INSERTING() THEN
    -- ���������� ID
    IF :new.ID||' '=' ' OR :new.ID IS NULL THEN
      SELECT SEQ_KLS_PASP.nextval INTO v_tmp FROM DUAL;
      :new.ID:=TRIM(TO_CHAR(:new.MESTO_ID))||'_'||SUBSTR(TRIM(TO_CHAR(v_tmp,'0999999')),1,7);
    END IF;
  END IF;	
END;
/

