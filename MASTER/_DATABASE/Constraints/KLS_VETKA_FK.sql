-- 
-- Foreign Key Constraints for Table KLS_VETKA 
-- 
ALTER TABLE MASTER.KLS_VETKA ADD (
  CONSTRAINT VETKA_OWNER_FK 
  FOREIGN KEY (OWNER_ID) 
  REFERENCES MASTER.KLS_PREDPR (ID)
  ENABLE NOVALIDATE);

