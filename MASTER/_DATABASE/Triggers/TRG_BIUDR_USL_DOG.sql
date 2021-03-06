--
-- TRG_BIUDR_USL_DOG  (Trigger) 
--
CREATE OR REPLACE TRIGGER MASTER.TRG_BIUDR_USL_DOG
BEFORE INSERT OR DELETE OR UPDATE
ON MASTER.USL_DOG FOR EACH ROW
DECLARE
  vAGENT_ID NUMBER;
  vPREDPR_ID NUMBER;
  vNUM VARCHAR2(30);
BEGIN
  IF INSERTING() OR UPDATING() THEN
    -- ���������� - ��� �������
    BEGIN
      SELECT AGENT_ID,PREDPR_ID,DOG_NUMBER INTO vAGENT_ID,vPREDPR_ID,vNum
	    FROM KLS_DOG WHERE ID=:NEW.DOG_ID;
    EXCEPTION
      WHEN OTHERS THEN
	    vAGENT_ID:=0;
		vPREDPR_ID:=0;
    END;	

--    IF (vAGENT_ID=8 or vAGENT_ID=4175) AND vPREDPR_ID<>8 AND vPREDPR_ID<>4175 AND :NEW.USL_NUMBER=1 AND :NEW.ID>=500000 THEN
--	  raise_application_error( FOR_SCRIPTS.SG$ERROR,  '� �������� ������-��� '||vNum||' ������� ������� ������ ����� ID<500000!');
--	END IF;	
  END IF;
END;
/


