--
-- TRG_AIUDR_VED_POD_ROW  (Trigger) 
--
CREATE OR REPLACE TRIGGER MASTER.TRG_AIUDR_VED_POD_ROW
AFTER INSERT OR DELETE OR UPDATE
ON MASTER.VED_POD_ROW
FOR EACH ROW
DECLARE
 vLOAD_TYPE_ID NUMBER;
 vREESTR_ID NUMBER;
 vDEFI_MASS_ID NUMBER;
BEGIN
  -- ��������� ���-�� � ���� � ��������� ���������
  IF INSERTING() THEN
    UPDATE VED_POD
	   SET KOL=NVL(KOL,0)+1,
	       VES_CIST=NVL(VES_CIST,0)+NVL(:NEW.VES_CIST,0)
 	 WHERE ID=:NEW.VED_POD_ID;
  END IF;
  IF DELETING() THEN
    UPDATE VED_POD
	   SET KOL=NVL(KOL,0)-1,
	       VES_CIST=NVL(VES_CIST,0)-NVL(:OLD.VES_CIST,0)
	 WHERE ID=:OLD.VED_POD_ID;
  END IF;
  IF UPDATING('VES_CIST') OR UPDATING('VED_POD_ID') THEN
    -- "�����" �� �������
    UPDATE VED_POD
	   SET KOL=NVL(KOL,0)-1,
	       VES_CIST=NVL(VES_CIST,0)-NVL(:OLD.VES_CIST,0)
	 WHERE ID=:OLD.VED_POD_ID;
    -- "����" �� �����
    UPDATE VED_POD
	   SET KOL=NVL(KOL,0)+1,
	       VES_CIST=NVL(VES_CIST,0)+NVL(:NEW.VES_CIST,0)
	 WHERE ID=:NEW.VED_POD_ID;
  END IF;

  IF UPDATING('TEMPER') OR UPDATING('VZLIV') OR UPDATING('ZPU_TYPE1') OR UPDATING('ZPU_TYPE2') OR
     UPDATING('PLOMBA1') OR UPDATING('PLOMBA2') OR UPDATING('ROSINSPL1') OR UPDATING('ROSINSPL2') THEN
    -- ��������� ��������� �� ��������
    BEGIN
	  -- ���� ������� ��������
      SELECT REESTR.ID,SVED.DEFI_MASS_ID INTO vREESTR_ID,vDEFI_MASS_ID
	    FROM REESTR,SVED
	   WHERE REESTR.VED_POD_ROW_ID=:NEW.ID
	     AND REESTR.NAKL_ID IS NULL -- ��� �� ���������� ��������� 
	     AND REESTR.SVED_ID=SVED.ID;

      IF NVL(:NEW.TEMPER,0)<>NVL(:OLD.TEMPER,0) THEN
        UPDATE REESTR SET TEMPER=:NEW.TEMPER WHERE ID=vREESTR_ID;
		IF vDEFI_MASS_ID=1 THEN
          UPDATE REESTR SET VES=0 WHERE ID=vREESTR_ID;
		END IF;  
	  END IF;	
      IF NVL(:NEW.VZLIV,0)<>NVL(:OLD.VZLIV,0) THEN
        UPDATE REESTR SET VZLIV=:NEW.VZLIV WHERE ID=vREESTR_ID;
		IF vDEFI_MASS_ID=1 THEN
          UPDATE REESTR SET VES=0 WHERE ID=vREESTR_ID;
		END IF;  
      END IF;
      IF NVL(:NEW.ZPU_TYPE1,0)<>NVL(:OLD.ZPU_TYPE1,0) THEN
        UPDATE REESTR SET ZPU_TYPE1=:NEW.ZPU_TYPE1 WHERE ID=vREESTR_ID;
      END IF;
      IF  NVL(:NEW.ZPU_TYPE2,0)<>NVL(:OLD.ZPU_TYPE2,0) THEN
        UPDATE REESTR SET ZPU_TYPE2=:NEW.ZPU_TYPE2 WHERE ID=vREESTR_ID;
      END IF;
      IF :NEW.PLOMBA1||' '<>:OLD.PLOMBA1||' ' THEN
        UPDATE REESTR SET PLOMBA1=:NEW.PLOMBA1 WHERE ID=vREESTR_ID;
      END IF;
      IF :NEW.PLOMBA2||' '<>:OLD.PLOMBA2||' ' THEN
        UPDATE REESTR SET PLOMBA2=:NEW.PLOMBA2 WHERE ID=vREESTR_ID;
      END IF;
      IF :NEW.ROSINSPL1||' '<>:OLD.ROSINSPL1||' ' THEN
        UPDATE REESTR SET ROSINSPL1=:NEW.ROSINSPL1 WHERE ID=vREESTR_ID;
      END IF;
      IF :NEW.ROSINSPL2||' '<>:OLD.ROSINSPL2||' ' THEN
        UPDATE REESTR SET ROSINSPL2=:NEW.ROSINSPL2 WHERE ID=vREESTR_ID;
      END IF;
    EXCEPTION
	  WHEN OTHERS THEN
	    NULL;
	END;
  END IF;
  		  
  -- ��������� ��������� � ����������� �������
  BEGIN
	SELECT LOAD_TYPE_ID INTO vLOAD_TYPE_ID
	  FROM VED_POD
	 WHERE ID=:NEW.VED_POD_ID;
  EXCEPTION
    WHEN OTHERS THEN
	  vLOAD_TYPE_ID:=NULL;
  END;

  IF INSERTING() OR UPDATING('NUM_CIST') OR UPDATING('NCISTDOP') OR UPDATING('AXES') OR UPDATING('CAPACITY') OR 
     UPDATING('VES_CIST') OR UPDATING('VAGONTYPE_ID') OR UPDATING('KALIBR_ID') OR UPDATING('VAGOWNER_ID') OR UPDATING('PROD_ID_NPR') THEN
	FOR_CIST.ADD_CIST(0,:NEW.NUM_CIST,vLOAD_TYPE_ID,:NEW.VAGONTYPE_ID,:NEW.KALIBR_ID,'',:NEW.CAPACITY,'',:NEW.NCISTDOP,:NEW.AXES,:NEW.VES_CIST,:NEW.VAGOWNER_ID,:NEW.PROD_ID_NPR);
  END IF;

  IF INSERTING() OR UPDATING('ZPU_TYPE1') THEN
    IF NVL(:NEW.ZPU_TYPE1,0)<>0 THEN
      FOR_ENVIRONMENT.SET_ENV('MASTER','VARI','ZPU_TYPE1',:NEW.ZPU_TYPE1,FOR_INIT.GetCurrUser);
	END IF;  
  END IF;
  IF INSERTING() OR UPDATING('ZPU_TYPE2') THEN
    IF NVL(:NEW.ZPU_TYPE2,0)<>0 THEN
      FOR_ENVIRONMENT.SET_ENV('MASTER','VARI','ZPU_TYPE2',:NEW.ZPU_TYPE2,FOR_INIT.GetCurrUser);
	END IF;  
  END IF;

END;
/


