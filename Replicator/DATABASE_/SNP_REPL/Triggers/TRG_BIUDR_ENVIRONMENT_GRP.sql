--
-- TRG_BIUDR_ENVIRONMENT_GRP  (Trigger) 
--
CREATE OR REPLACE TRIGGER SNP_REPL.TRG_BIUDR_ENVIRONMENT_GRP
 BEFORE DELETE OR INSERT OR UPDATE ON SNP_REPL.ENVIRONMENT_GRP  FOR EACH ROW
/* ---------------------------------------------
  Генератор скриптов для PARUS00
  PSV V1.04
--------------------------------------------- */
DECLARE
  v_old ENVIRONMENT_GRP%ROWTYPE;
  v_new ENVIRONMENT_GRP%ROWTYPE;
  v_tmp NUMBER;
BEGIN

  IF DELETING() OR UPDATING() THEN
    -- Старые значения
    v_old.ID := :OLD.ID;
    v_old.GRP_NAME := :OLD.GRP_NAME;
    v_old.GRP_COMMENT := :OLD.GRP_COMMENT;
  END IF;

  -- До удаления
  IF DELETING() THEN
    NULL;
  END IF;

  IF INSERTING() OR UPDATING() THEN
    -- Новые значения
    v_new.ID := :NEW.ID;
    v_new.GRP_NAME := :NEW.GRP_NAME;
    v_new.GRP_COMMENT := :NEW.GRP_COMMENT;

    IF 1=1 THEN
      -- Уникальный ID
      v_new.ID:=GET_SEQ_LOCAL();
      -- Проверка новых значений
      NULL;
    END IF;

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
    :NEW.GRP_NAME := v_new.GRP_NAME;
    :NEW.GRP_COMMENT := v_new.GRP_COMMENT;
  END IF;
END;
/


