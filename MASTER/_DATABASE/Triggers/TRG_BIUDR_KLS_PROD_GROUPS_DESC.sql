--
-- TRG_BIUDR_KLS_PROD_GROUPS_DESC  (Trigger) 
--
CREATE OR REPLACE TRIGGER MASTER.TRG_BIUDR_KLS_PROD_GROUPS_DESC
BEFORE INSERT OR DELETE OR UPDATE
ON MASTER.KLS_PROD_GROUPS_DESC
FOR EACH ROW
DECLARE
  v_old KLS_PROD_GROUPS_DESC%ROWTYPE;
  v_new KLS_PROD_GROUPS_DESC%ROWTYPE;
  v_tmp NUMBER;
BEGIN

  IF DELETING() OR UPDATING() THEN
    -- ������ ��������
    v_old.ID := :OLD.ID;
    v_old.PROD_ID_NPR := :OLD.PROD_ID_NPR;
    v_old.PROD_GROUPS_ID := :OLD.PROD_GROUPS_ID;
	v_old.PROD_TYPE_GRP_ID := :OLD.PROD_TYPE_GRP_ID;
  END IF;

  -- �� ��������
  IF DELETING() THEN
    NULL;
  END IF;

  IF INSERTING() OR UPDATING() THEN
    -- ����� ��������
    v_new.ID := :NEW.ID;
    v_new.PROD_ID_NPR := :NEW.PROD_ID_NPR;
    v_new.PROD_GROUPS_ID := :NEW.PROD_GROUPS_ID;
	BEGIN
	  SELECT prod_type_grp_id INTO v_new.prod_type_grp_id
	    FROM KLS_PROD_GROUPS
 	   WHERE id=v_new.PROD_GROUPS_ID;
	EXCEPTION
	  WHEN OTHERS THEN
        v_new.PROD_TYPE_GRP_ID := NULL;
	END;      	

    IF 1=1 THEN
      -- ���������� ID
      IF v_new.ID=0 OR v_new.ID IS NULL THEN
        SELECT SEQ_KLS_PROD_GROUPS_DESC.NEXTVAL INTO v_new.ID FROM DUAL;
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
    :NEW.PROD_ID_NPR := v_new.PROD_ID_NPR;
    :NEW.PROD_GROUPS_ID := v_new.PROD_GROUPS_ID;
    :NEW.PROD_TYPE_GRP_ID := v_new.PROD_TYPE_GRP_ID;
  END IF;
END;
/


