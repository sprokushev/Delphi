--
-- TRG_AIUDR_VED_POD  (Trigger) 
--
CREATE OR REPLACE TRIGGER MASTER.TRG_AIUDR_VED_POD
AFTER INSERT OR DELETE OR UPDATE
ON MASTER.VED_POD
FOR EACH ROW
BEGIN
  -- ��������� ���� �������� � "���������" ������� ��������
  IF UPDATING('VETKA_OTP_ID') THEN
    FOR lcur IN (SELECT ID FROM VED_POD_ROW WHERE VED_POD_ID=:NEW.ID)
	LOOP
      UPDATE REESTR SET VETKA_OTP_ID=:NEW.VETKA_OTP_ID WHERE VED_POD_ROW_ID=lcur.ID;
	END LOOP;
  END IF;
END;
/

