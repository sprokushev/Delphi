--
-- TRG_BIUDR_PLAN_PERIODS  (Trigger) 
--
CREATE OR REPLACE TRIGGER MASTER.TRG_BIUDR_PLAN_PERIODS
BEFORE INSERT OR DELETE OR UPDATE OF ID, BEGIN_DATE, DATE_PLAN, END_DATE, PLAN_ID, NUM_IZM_POST, NUM_IZM_RESU
ON MASTER.PLAN_PERIODS
FOR EACH ROW
DECLARE
  v_old PLAN_PERIODS%ROWTYPE;
  v_new PLAN_PERIODS%ROWTYPE;
  v_tmp NUMBER;
BEGIN

  IF DELETING() OR UPDATING() THEN
    -- ������ ��������
    v_old.ID := :OLD.ID;
    v_old.PLAN_ID := :OLD.PLAN_ID;
    v_old.DATE_PLAN := :OLD.DATE_PLAN;
    v_old.NUM_IZM_POST := :OLD.NUM_IZM_POST;
    v_old.NUM_IZM_RESU := :OLD.NUM_IZM_RESU;
    v_old.BEGIN_DATE := :OLD.BEGIN_DATE;
    v_old.END_DATE := :OLD.END_DATE;
  END IF;

  -- �� ��������
  IF DELETING() THEN
    NULL;
  END IF;

  IF INSERTING() OR UPDATING() THEN
    -- ����� ��������
    v_new.ID := :NEW.ID;
    v_new.PLAN_ID := :NEW.PLAN_ID;
    v_new.DATE_PLAN := :NEW.DATE_PLAN;
    v_new.NUM_IZM_POST := :NEW.NUM_IZM_POST;
    v_new.NUM_IZM_RESU := :NEW.NUM_IZM_RESU;
    v_new.BEGIN_DATE := :NEW.BEGIN_DATE;
    v_new.END_DATE := :NEW.END_DATE;

    -- ���������� ID
    IF v_new.ID=0 OR v_new.ID IS NULL THEN
      SELECT SEQ_PLAN_PERIODS.NEXTVAL INTO v_new.ID FROM DUAL;
    END IF;

	For_Planpost.PLAN_PERIODS_ID := v_new.ID;

    -- �������� ����� ��������
    IF UPDATING() THEN
      NULL;
      IF v_old.ID<>v_new.ID OR v_old.PLAN_ID<>v_new.PLAN_ID THEN
        RAISE_APPLICATION_ERROR(For_Scripts.SG$PK_CHANGE, '������ ������ PRIMARY KEY');
      END IF;
    END IF;
    IF v_new.DATE_PLAN IS NULL THEN
      v_new.DATE_PLAN := TRUNC(SYSDATE,'MONTH');
	ELSE
      v_new.DATE_PLAN := TRUNC(v_new.DATE_PLAN,'MONTH');
	END IF;
	IF v_new.BEGIN_DATE IS NULL THEN
      v_new.BEGIN_DATE := v_new.DATE_PLAN;
	ELSE
      v_new.BEGIN_DATE := TRUNC(v_new.BEGIN_DATE);
	END IF;
	IF TRUNC(v_new.DATE_PLAN,'MONTH')<>TRUNC(v_new.BEGIN_DATE,'MONTH') THEN
      RAISE_APPLICATION_ERROR(For_Scripts.SG$NO_CORRECT, '�������� ������ �� ������������� ��������� ������!');
	END IF;
    IF v_new.END_DATE IS NULL THEN
      v_new.END_DATE := TRUNC(ADD_MONTHS(v_new.BEGIN_DATE,1),'MONTH')-1;
    ELSE
      v_new.END_DATE := TRUNC(v_new.END_DATE);
    END IF;
	IF TRUNC(v_new.DATE_PLAN,'MONTH')<>TRUNC(v_new.END_DATE,'MONTH') THEN
      RAISE_APPLICATION_ERROR(For_Scripts.SG$NO_CORRECT, '�������� ������ �� ������������� ��������� ������!');
	END IF;
	IF v_new.BEGIN_DATE>v_new.END_DATE THEN
      RAISE_APPLICATION_ERROR(For_Scripts.SG$NO_CORRECT, '�������� ������ ����� ��������!');
	END IF;

    -- ����� � ������� �������
    BEGIN
      SELECT NULL
      INTO v_tmp
      FROM MASTER_SHADOW.PLAN_PERIODS_SHADOW
      WHERE ID<>v_new.ID
	    AND PLAN_ID=v_new.PLAN_ID
		AND DATE_PLAN=v_new.DATE_PLAN
        AND NOT (v_new.END_DATE < BEGIN_DATE OR END_DATE < v_new.BEGIN_DATE);
      RAISE_APPLICATION_ERROR(For_Scripts.SG$ROW_EXIST, '�������� ������ ��� ������');
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        NULL;
      WHEN TOO_MANY_ROWS THEN
        RAISE_APPLICATION_ERROR(For_Scripts.SG$ROW_EXIST, '�������� ������ ��� ������');
    END;

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
    :NEW.PLAN_ID := v_new.PLAN_ID;
    :NEW.DATE_PLAN := v_new.DATE_PLAN;
    :NEW.NUM_IZM_POST := v_new.NUM_IZM_POST;
    :NEW.NUM_IZM_RESU := v_new.NUM_IZM_RESU;
    :NEW.BEGIN_DATE := v_new.BEGIN_DATE;
    :NEW.END_DATE := v_new.END_DATE;
  END IF;
END;
/


