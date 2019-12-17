--
-- TRG_AIUDR_ENVIRONMENT_GRP  (Trigger) 
--
CREATE OR REPLACE TRIGGER MASTER.TRG_AIUDR_ENVIRONMENT_GRP
AFTER INSERT OR DELETE OR UPDATE
ON MASTER.ENVIRONMENT_GRP
FOR EACH ROW
DECLARE
  v_old ENVIRONMENT_GRP%ROWTYPE;
  v_new ENVIRONMENT_GRP%ROWTYPE;
  v_tmp NUMBER;
  LogId NUMBER;
  cl_WhatWasDone CLOB;
  WriteStr VARCHAR2(250);
  WritePos NUMBER;
BEGIN

  IF DELETING() OR UPDATING() THEN
    -- ������ ��������
    v_old.ID := :OLD.ID;
    v_old.GRP_NAME := :OLD.GRP_NAME;
    v_old.GRP_COMMENT := :OLD.GRP_COMMENT;
  END IF;

  -- ����� ��������
  IF DELETING() THEN
    NULL;
  END IF;

  IF INSERTING() OR UPDATING() THEN
    -- ����� ��������
    v_new.ID := :NEW.ID;
    v_new.GRP_NAME := :NEW.GRP_NAME;
    v_new.GRP_COMMENT := :NEW.GRP_COMMENT;

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


