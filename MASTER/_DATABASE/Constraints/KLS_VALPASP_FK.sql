-- 
-- Foreign Key Constraints for Table KLS_VALPASP 
-- 
ALTER TABLE MASTER.KLS_VALPASP ADD (
  CONSTRAINT VALPASP_KODIF_FK 
  FOREIGN KEY (KODIF_ID) 
  REFERENCES MASTER.KLS_KODIF (ID)
  ENABLE NOVALIDATE);

