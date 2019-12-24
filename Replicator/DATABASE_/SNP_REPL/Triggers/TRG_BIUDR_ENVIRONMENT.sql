--
-- TRG_BIUDR_ENVIRONMENT  (Trigger) 
--
CREATE OR REPLACE TRIGGER SNP_REPL.TRG_BIUDR_ENVIRONMENT
 BEFORE DELETE OR INSERT OR UPDATE ON SNP_REPL.ENVIRONMENT  FOR EACH ROW
/* ---------------------------------------------
  Генератор скриптов для PARUS00
  PSV V1.04
  PSV - модифицирован 21.07.2003
--------------------------------------------- */
DECLARE
  v_old ENVIRONMENT%ROWTYPE;
  v_new ENVIRONMENT%ROWTYPE;
  v_tmp NUMBER;
BEGIN

  IF DELETING() OR UPDATING() THEN
    -- Старые значения
    v_old.ID := :OLD.ID;
    v_old.ENV_NAME := :OLD.ENV_NAME;
    v_old.ENV_VALUE := :OLD.ENV_VALUE;
    v_old.ENV_COMMENT := :OLD.ENV_COMMENT;
    v_old.SOURCESQL := :OLD.SOURCESQL;
    v_old.ENV_TYPES_ID := :OLD.ENV_TYPES_ID;
    v_old.ENV_GRP_ID := :OLD.ENV_GRP_ID;
    v_old.MASTER_ID := :OLD.MASTER_ID;
    v_old.NETUSER := :OLD.NETUSER;
  END IF;

  -- До удаления
  IF DELETING() THEN
    NULL;
  END IF;

  IF INSERTING() OR UPDATING() THEN
    -- Новые значения
    v_new.ID := :NEW.ID;
    v_new.ENV_NAME := :NEW.ENV_NAME;
    v_new.ENV_VALUE := :NEW.ENV_VALUE;
    v_new.ENV_COMMENT := :NEW.ENV_COMMENT;
    v_new.SOURCESQL := :NEW.SOURCESQL;
    v_new.ENV_TYPES_ID := :NEW.ENV_TYPES_ID;
    v_new.ENV_GRP_ID := :NEW.ENV_GRP_ID;
    v_new.MASTER_ID := :NEW.MASTER_ID;
    v_new.NETUSER := NLS_UPPER(:NEW.NETUSER);

    -- Уникальный ID
    v_new.ID:=GET_SEQ_LOCAL();

    IF UPDATING() THEN
      NULL;
    END IF;

    -- До обновления
    IF UPDATING() THEN
      NULL;
    END IF;

    -- До добавления
    IF INSERTING() THEN
      NULL;
    END IF;

    -- Сохранение новых значений
    :NEW.ID := v_new.ID;
    :NEW.ENV_NAME := v_new.ENV_NAME;
    :NEW.ENV_VALUE := v_new.ENV_VALUE;
    :NEW.ENV_COMMENT := v_new.ENV_COMMENT;
    :NEW.SOURCESQL := v_new.SOURCESQL;
    :NEW.ENV_TYPES_ID := v_new.ENV_TYPES_ID;
    :NEW.ENV_GRP_ID := v_new.ENV_GRP_ID;
    :NEW.MASTER_ID := v_new.MASTER_ID;
    :NEW.NETUSER := v_new.NETUSER;
  END IF;
END;
/


