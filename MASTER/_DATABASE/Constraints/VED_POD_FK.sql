-- 
-- Foreign Key Constraints for Table VED_POD 
-- 
ALTER TABLE MASTER.VED_POD ADD (
  CONSTRAINT VED_POD_LOAD_TYPE_FK 
  FOREIGN KEY (LOAD_TYPE_ID) 
  REFERENCES MASTER.KLS_LOAD_TYPE (ID)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.VED_POD ADD (
  CONSTRAINT VED_POD_MESTO_FK 
  FOREIGN KEY (MESTO_ID) 
  REFERENCES MASTER.KLS_MESTO (ID)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.VED_POD ADD (
  CONSTRAINT VED_POD_VETKA_OTP_FK 
  FOREIGN KEY (VETKA_OTP_ID) 
  REFERENCES MASTER.KLS_VETKA_OTP (ID)
  ENABLE NOVALIDATE);
