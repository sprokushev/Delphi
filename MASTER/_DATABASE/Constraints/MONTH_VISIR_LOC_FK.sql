-- 
-- Foreign Key Constraints for Table MONTH_VISIR_LOC 
-- 
ALTER TABLE MASTER.MONTH_VISIR_LOC ADD (
  CONSTRAINT MON_VISIR_LOC_APP_USERS_FK 
  FOREIGN KEY (APP_USERS_ID) 
  REFERENCES MASTER.APP_USERS (ID)
  ENABLE NOVALIDATE);

