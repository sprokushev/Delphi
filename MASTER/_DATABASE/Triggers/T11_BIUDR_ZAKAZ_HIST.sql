--
-- T11_BIUDR_ZAKAZ_HIST  (Trigger) 
--
CREATE OR REPLACE TRIGGER MASTER.T11_BIUDR_ZAKAZ_HIST
BEFORE INSERT OR DELETE OR UPDATE
ON MASTER.ZAKAZ_HIST
FOR EACH ROW
DECLARE
  vID NUMBER;
  vPlatId NUMBER;
BEGIN

  IF INSERTING() OR UPDATING() THEN
    IF :NEW.STATUS_ZAKAZ_ID<>20 OR :NEW.NOM_ZD||' '=' ' THEN
  	  -- �������� ���� ��������
	  :new.NOM_ZD:='';
      :new.FACT_KOL:=0;
	  :new.FACT_VES:=0;
    END IF;
  END IF;

  IF UPDATING() THEN
    -- ���������
	IF :OLD.ID<>:NEW.ID THEN
	  raise_application_error( FOR_SCRIPTS.SG$PK_CHANGE,  FOR_SCRIPTS.SG$PK_CHANGE_TXT);
	END IF;
	IF :OLD.ZAKAZ_ID<>:NEW.ZAKAZ_ID THEN
	  raise_application_error( FOR_SCRIPTS.SG$FK_CHANGE,  '������ ������ ZAKAZ_ID!');
      null;
	END IF;
	IF :OLD.STATUS_ZAKAZ_ID<>:NEW.STATUS_ZAKAZ_ID THEN
	  raise_application_error( FOR_SCRIPTS.SG$FK_CHANGE,  '������ ������ ������ ������� ������!');
	END IF;
  END IF;

/* ��������
  IF DELETING() THEN
    IF :OLD.NOM_ZD||' '<>' ' AND :OLD.IS_AUTO=0 THEN
	  -- ���� ������� ������� � ����������� �� ��������
	  raise_application_error( FOR_SCRIPTS.SG$ERROR,'������ ������� �����, ������� ������� "� ��������" ��������� � ����������� � ������''��');
	END IF;
  END IF;
*/

END;
/


