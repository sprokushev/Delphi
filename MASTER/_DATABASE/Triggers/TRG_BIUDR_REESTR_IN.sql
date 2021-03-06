--
-- TRG_BIUDR_REESTR_IN  (Trigger) 
--
CREATE OR REPLACE TRIGGER MASTER.TRG_BIUDR_REESTR_IN
BEFORE INSERT OR DELETE OR UPDATE
ON MASTER.REESTR_IN
FOR EACH ROW
DECLARE
 vOTHER_SVED_NUM SVED_IN.SVED_NUM%TYPE;
 vSVED_DATE SVED_IN.SVED_DATE%TYPE;
 vPROD_ID_NPR SVED_IN.PROD_ID_NPR%TYPE;
BEGIN

  -- ��������� �������� �� ������ ������
  BEGIN
	SELECT SVED_DATE,PROD_ID_NPR INTO vSVED_DATE,vPROD_ID_NPR
	  FROM SVED_IN
	 WHERE ID=:NEW.SVED_IN_ID;
  EXCEPTION
    WHEN OTHERS THEN
	  vSVED_DATE:=NULL;
  END;

  -- ������������ �������� �����
  IF INSERTING() OR (UPDATING('CAPACITY') AND :NEW.CAPACITY||' '<>:OLD.CAPACITY||' ') THEN
	BEGIN
      :NEW.CAPACITY:=ORA_NUM_TO_CHAR(ora_char_to_num(:NEW.CAPACITY,'999.999'));
	EXCEPTION
	  WHEN OTHERS THEN
	    RAISE_APPLICATION_ERROR(For_Scripts.SG$NO_CORRECT, '�������� �������� ����������������!');
	END;
  END IF;

  IF INSERTING() OR UPDATING('VES_CIST') THEN
    :NEW.VES_CIST:=NVL(:NEW.VES_CIST,0);
  END IF;

  IF INSERTING() OR (UPDATING('NUM_CIST') AND :NEW.NUM_CIST||' '<>:OLD.NUM_CIST||' ') THEN
    IF FOR_CIST.CHECK_NUM_CIST(:NEW.NUM_CIST, 1, NVL(:NEW.VAGONTYPE_ID,0))=0 THEN
      :NEW.BAD_NUM:=1;
	ELSE
	  :NEW.BAD_NUM:=0;
	END IF;
	vOTHER_SVED_NUM:=FOR_SVED_IN.CHECK_UNIQ(1,:NEW.NUM_CIST,:NEW.ID,vSVED_DATE);
	IF NVL(vOTHER_SVED_NUM,0)<>0 THEN
--      RAISE_APPLICATION_ERROR(For_Scripts.SG$NO_CORRECT, '����� '||:NEW.NUM_CIST||' ��� ���� � �������� N '||TO_CHAR(vOTHER_SVED_NUM));
      NULL;
	END IF;
  END IF;

  IF INSERTING() OR (UPDATING('KALIBR_ID') AND :NEW.KALIBR_ID||' '<>:OLD.KALIBR_ID||' ') THEN
    :NEW.KALIBR_ID:=NLS_UPPER(:NEW.KALIBR_ID);
	IF :NEW.KALIBR_ID='25A' THEN
	  :NEW.KALIBR_ID:='25�';
	END IF;
  END IF;	

  IF INSERTING() OR (UPDATING('VAGONTYPE_ID') AND NVL(:NEW.VAGONTYPE_ID,0)<>NVL(:OLD.VAGONTYPE_ID,0)) THEN
	IF NVL(:NEW.VAGONTYPE_ID,0) IN (1,2,5,9) THEN
	  :NEW.KALIBR_ID:=FOR_CIST.GET_KALIBR_BY_VAGONTYPE(1, NVL(:NEW.VAGONTYPE_ID,0));
	END IF;
  END IF;

  IF INSERTING() OR 
     (UPDATING('KALIBR_ID') AND :NEW.KALIBR_ID||' '<>:OLD.KALIBR_ID||' ') OR 
	 (UPDATING('VZLIV') AND NVL(:NEW.VZLIV,0)<>NVL(:OLD.VZLIV,0)) THEN
    :NEW.VOLUME:=FOR_CIST.GET_VOLUME(:NEW.KALIBR_ID, NVL(:NEW.VZLIV,0), 1, NVL(:NEW.VAGONTYPE_ID,0));
  END IF;
  
  IF INSERTING() OR UPDATING('VES') THEN
	IF NVL(:NEW.VES,0)=0 THEN
	  :NEW.VES_NETTO:=0;
	END IF;  
  END IF;

  IF INSERTING() OR UPDATING('VES_KVIT')  OR UPDATING('P_VOD_KVIT') OR UPDATING('P_SOL_KVIT') OR UPDATING('P_DIRT_KVIT') THEN
	:NEW.VES_NETTO_KVIT:=ROUND((NVL(:NEW.VES_KVIT,0)*(1-NVL(:NEW.P_SOL_KVIT,0)/100-NVL(:NEW.P_DIRT_KVIT,0)/100-NVL(:NEW.P_VOD_KVIT,0)/100)),4);
  END IF;
  
  IF INSERTING() THEN
	IF :NEW.NUM_KVIT_TXT||' '<>' ' THEN
	  :NEW.NUM_KVIT:=ORA_VAL(:NEW.NUM_KVIT_TXT);
	ELSE  
	  :NEW.NUM_KVIT_TXT:=ORA_CHAR_TO_NUM(:NEW.NUM_KVIT);
	  IF :NEW.NUM_KVIT_TXT='0' THEN
	    :NEW.NUM_KVIT_TXT:=NULL;
	  END IF;	
	END IF;  
  END IF;
    
  IF UPDATING('NUM_KVIT_TXT') THEN
    :NEW.NUM_KVIT:=ORA_VAL(:NEW.NUM_KVIT_TXT);
  END IF;

  IF UPDATING('NUM_KVIT') THEN
    :NEW.NUM_KVIT_TXT:=TO_CHAR(:NEW.NUM_KVIT);
  END IF;

/*  IF INSERTING() OR UPDATING() THEN
	IF NVL(:NEW.VAGOWNER_ID,0)=0 AND vPROD_ID_NPR='90002' THEN
	  :NEW.VAGOWNER_ID:=33;
	END IF;  
  END IF;*/
  
  IF INSERTING() OR UPDATING('ZPU_TYPE1') THEN
    :NEW.ZPU_TYPE1:=NVL(:NEW.ZPU_TYPE1,FOR_ENVIRONMENT.GET_ENV('MASTER','VARI','ZPU_TYPE1',FOR_INIT.GetCurrUser));
  END IF;
  IF INSERTING() OR UPDATING('ZPU_TYPE2') THEN
    :NEW.ZPU_TYPE2:=NVL(:NEW.ZPU_TYPE2,FOR_ENVIRONMENT.GET_ENV('MASTER','VARI','ZPU_TYPE2',FOR_INIT.GetCurrUser));
  END IF;
  
  IF INSERTING() OR UPDATING() THEN
    -- ���������� ID
    IF :new.ID=0 OR :new.ID IS NULL THEN
      SELECT SEQ_ID.nextval INTO :new.ID FROM DUAL;
    END IF;
  END IF;	
END;
/


