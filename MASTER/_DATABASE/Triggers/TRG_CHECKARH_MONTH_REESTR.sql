--
-- TRG_CHECKARH_MONTH_REESTR  (Trigger) 
--
CREATE OR REPLACE TRIGGER MASTER.TRG_CHECKARH_MONTH_REESTR
BEFORE INSERT OR DELETE OR UPDATE
ON MASTER.MONTH_REESTR
FOR EACH ROW
DECLARE
  v_dat DATE;
  doc_dat DATE;
  TABLE_MUTATING    EXCEPTION;
  PRAGMA EXCEPTION_INIT( TABLE_MUTATING,-04091 );
BEGIN
  /* ������� ������� ��������� �������� ������ */
  
  -- ����������� �������� ����  
  BEGIN
    SELECT ARH_DATE.LAST_DATE INTO v_dat
	  FROM ARH_DATE WHERE ARH_DATE.TABLENAME='MONTH_REESTR';
  EXCEPTION 
    WHEN OTHERS THEN
	  v_dat:=TO_DATE('31.12.1899','dd.mm.yyyy');
  END;	  	  

  -- ����������� ���� ���������
  IF UPDATING() OR DELETING() THEN
    doc_dat:=:OLD.DATE_REE;
    /*BEGIN
      SELECT KVIT.DATE_KVIT INTO doc_dat
	    FROM KVIT WHERE KVIT.ID=:OLD.KVIT_ID;
    EXCEPTION 
      WHEN TABLE_MUTATING THEN
	    doc_dat:=TO_DATE('01.01.2900','dd.mm.yyyy');
      WHEN OTHERS THEN
	    doc_dat:=TO_DATE('01.01.1900','dd.mm.yyyy');
    END;	*/
  ELSE
    doc_dat:=:NEW.DATE_REE;
    /*BEGIN
      SELECT KVIT.DATE_KVIT INTO doc_dat
	    FROM KVIT WHERE KVIT.ID=:NEW.KVIT_ID;
    EXCEPTION 
      WHEN TABLE_MUTATING THEN
	    doc_dat:=TO_DATE('01.01.2900','dd.mm.yyyy');
      WHEN OTHERS THEN
	    doc_dat:=TO_DATE('01.01.1900','dd.mm.yyyy');
    END;*/
  END IF;	  	  
 
  -- ��������
  IF DELETING() AND doc_dat<=v_dat THEN
     raise_application_error( FOR_SCRIPTS.SG$CHANGE_ARCHIVE, FOR_SCRIPTS.SG$CHANGE_ARCHIVE_D);
  END IF;
  IF UPDATING() AND doc_dat<=v_dat THEN
     raise_application_error( FOR_SCRIPTS.SG$CHANGE_ARCHIVE, FOR_SCRIPTS.SG$CHANGE_ARCHIVE_U);
  END IF;
  IF INSERTING() AND doc_dat<=v_dat THEN
     raise_application_error( FOR_SCRIPTS.SG$CHANGE_ARCHIVE, FOR_SCRIPTS.SG$CHANGE_ARCHIVE_I);
  END IF;

END;
/


