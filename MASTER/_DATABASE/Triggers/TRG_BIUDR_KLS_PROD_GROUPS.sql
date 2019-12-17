--
-- TRG_BIUDR_KLS_PROD_GROUPS  (Trigger) 
--
CREATE OR REPLACE TRIGGER MASTER.TRG_BIUDR_KLS_PROD_GROUPS
BEFORE INSERT OR DELETE OR UPDATE
ON MASTER.KLS_PROD_GROUPS
FOR EACH ROW
DECLARE
  v_old KLS_PROD_GROUPS%ROWTYPE;
  v_new KLS_PROD_GROUPS%ROWTYPE;
  v_tmp NUMBER;
BEGIN

  IF DELETING() OR UPDATING() THEN
    -- ������ ��������
    v_old.ID := :OLD.ID;
    v_old.PROD_TYPE_GRP_ID := :OLD.PROD_TYPE_GRP_ID;
    v_old.GROUP_ORDER := :OLD.GROUP_ORDER;
    v_old.GROUP_NAME := :OLD.GROUP_NAME;
  END IF;

  -- �� ��������
  IF DELETING() THEN
    NULL;
  END IF;

  IF INSERTING() OR UPDATING() THEN
    -- ����� ��������
    v_new.ID := :NEW.ID;
    v_new.PROD_TYPE_GRP_ID := :NEW.PROD_TYPE_GRP_ID;
    v_new.GROUP_ORDER := :NEW.GROUP_ORDER;
    v_new.GROUP_NAME := :NEW.GROUP_NAME;

    IF 1=1 THEN
      -- ���������� ID
      IF v_new.ID=0 OR v_new.ID IS NULL THEN
        SELECT SEQ_KLS_PROD_GROUPS.NEXTVAL INTO v_new.ID FROM DUAL;
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
    :NEW.PROD_TYPE_GRP_ID := v_new.PROD_TYPE_GRP_ID;
    :NEW.GROUP_ORDER := v_new.GROUP_ORDER;
    :NEW.GROUP_NAME := v_new.GROUP_NAME;
  END IF;
END;
/


