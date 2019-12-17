-- 
-- Foreign Key Constraints for Table KLS_PREDPR_RS 
-- 
ALTER TABLE MASTER.KLS_PREDPR_RS ADD (
  CONSTRAINT PREDPR_RS_PREDPR_FK 
  FOREIGN KEY (PREDPR_ID) 
  REFERENCES MASTER.KLS_PREDPR (ID)
  ENABLE NOVALIDATE);

