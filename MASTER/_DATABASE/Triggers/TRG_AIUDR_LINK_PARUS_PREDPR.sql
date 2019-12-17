--
-- TRG_AIUDR_LINK_PARUS_PREDPR  (Trigger) 
--
CREATE OR REPLACE TRIGGER MASTER.TRG_AIUDR_LINK_PARUS_PREDPR
AFTER INSERT OR DELETE OR UPDATE
ON MASTER.LINK_PARUS_PREDPR
FOR EACH ROW
DECLARE
  v_old LINK_PARUS_PREDPR%ROWTYPE;
  v_new LINK_PARUS_PREDPR%ROWTYPE;
  v_tmp NUMBER;
  LogId NUMBER;
  cl_WhatWasDone CLOB;
  WriteStr VARCHAR2(250);
  WritePos NUMBER;
BEGIN

  IF DELETING() OR UPDATING() THEN
    -- ������ ��������
    v_old.ID := :OLD.ID;
    v_old.RN := :OLD.RN;
    v_old.PREDPR_ID := :OLD.PREDPR_ID;
    v_old.IS_AUTO_LINK := :OLD.IS_AUTO_LINK;
  END IF;

  -- ����� ��������
  IF DELETING() THEN
    NULL;
  END IF;

  IF INSERTING() OR UPDATING() THEN
    -- ����� ��������
    v_new.ID := :NEW.ID;
    v_new.RN := :NEW.RN;
    v_new.PREDPR_ID := :NEW.PREDPR_ID;
    v_new.IS_AUTO_LINK := :NEW.IS_AUTO_LINK;

    -- ����� ����������
    IF UPDATING() THEN
      NULL;
    END IF;

    -- ����� ����������
    IF INSERTING() THEN
      NULL;
    END IF;

  END IF;
END;
/


