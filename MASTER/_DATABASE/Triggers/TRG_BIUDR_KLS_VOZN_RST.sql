--
-- TRG_BIUDR_KLS_VOZN_RST  (Trigger) 
--
CREATE OR REPLACE TRIGGER MASTER.TRG_BIUDR_KLS_VOZN_RST
BEFORE INSERT OR DELETE OR UPDATE
ON MASTER.KLS_VOZN_RST
FOR EACH ROW
DECLARE
  v_old KLS_VOZN_RST%ROWTYPE;
  v_new KLS_VOZN_RST%ROWTYPE;
  v_tmp NUMBER;
BEGIN

  IF DELETING() OR UPDATING() THEN
    -- ������ ��������
    v_old.ID := :OLD.ID;
    v_old.IS_AGENT := :OLD.IS_AGENT;
    v_old.BEGIN_DATE := :OLD.BEGIN_DATE;
    v_old.END_DATE := :OLD.END_DATE;
    v_old.ID_GROUP_NPR := :OLD.ID_GROUP_NPR;
    v_old.PROD_ID_NPR := :OLD.PROD_ID_NPR;
    v_old.VAGOWN_TYP_ID := :OLD.VAGOWN_TYP_ID;
    v_old.RAST_MIN := :OLD.RAST_MIN;
    v_old.RAST_MAX := :OLD.RAST_MAX;
    v_old.CENA_VOZN := :OLD.CENA_VOZN;
  END IF;

  -- �� ��������
  IF DELETING() THEN
    NULL;
  END IF;

  IF INSERTING() OR UPDATING() THEN
    -- ����� ��������
    v_new.ID := :NEW.ID;
    v_new.IS_AGENT := :NEW.IS_AGENT;
    v_new.BEGIN_DATE := :NEW.BEGIN_DATE;
    v_new.END_DATE := :NEW.END_DATE;
    v_new.ID_GROUP_NPR := :NEW.ID_GROUP_NPR;
    v_new.PROD_ID_NPR := :NEW.PROD_ID_NPR;
    v_new.VAGOWN_TYP_ID := :NEW.VAGOWN_TYP_ID;
    v_new.RAST_MIN := :NEW.RAST_MIN;
    v_new.RAST_MAX := :NEW.RAST_MAX;
    v_new.CENA_VOZN := :NEW.CENA_VOZN;

    IF 1=1 THEN
      -- ���������� ID
      IF v_new.ID=0 OR v_new.ID IS NULL THEN
        SELECT SEQ_KLS_VOZN_RST.NEXTVAL INTO v_new.ID FROM DUAL;
      END IF;
      -- �������� ����� ��������
      NULL;
    END IF;

    IF UPDATING() THEN
      NULL;
    END IF;

    -- �� ����������
    IF UPDATING() THEN
      NULL;
    END IF;

    -- �� ����������
    IF INSERTING() THEN
      NULL;
    END IF;

    -- ���������� ����� ��������
    :NEW.ID := v_new.ID;
    :NEW.IS_AGENT := v_new.IS_AGENT;
    :NEW.BEGIN_DATE := v_new.BEGIN_DATE;
    :NEW.END_DATE := v_new.END_DATE;
    :NEW.ID_GROUP_NPR := v_new.ID_GROUP_NPR;
    :NEW.PROD_ID_NPR := v_new.PROD_ID_NPR;
    :NEW.VAGOWN_TYP_ID := v_new.VAGOWN_TYP_ID;
    :NEW.RAST_MIN := v_new.RAST_MIN;
    :NEW.RAST_MAX := v_new.RAST_MAX;
    :NEW.CENA_VOZN := v_new.CENA_VOZN;
  END IF;
END;
/


