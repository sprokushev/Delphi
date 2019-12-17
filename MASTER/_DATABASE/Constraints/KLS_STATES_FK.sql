-- 
-- Foreign Key Constraints for Table KLS_STATES 
-- 
ALTER TABLE MASTER.KLS_STATES ADD (
  CONSTRAINT STATES_NAPR_FK 
  FOREIGN KEY (NAPR_ID) 
  REFERENCES MASTER.KLS_NAPR (ID)
  ENABLE NOVALIDATE);

