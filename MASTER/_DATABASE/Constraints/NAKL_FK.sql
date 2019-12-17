-- 
-- Foreign Key Constraints for Table NAKL 
-- 
ALTER TABLE MASTER.NAKL ADD (
  CONSTRAINT NAKL_FORMNAKL_FK 
  FOREIGN KEY (FORMNAKL_ID) 
  REFERENCES MASTER.KLS_FORMNAKL (ID)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.NAKL ADD (
  CONSTRAINT NAKL_MESTO_FK 
  FOREIGN KEY (MESTO_ID) 
  REFERENCES MASTER.KLS_MESTO (ID)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.NAKL ADD (
  CONSTRAINT NAKL_SHABEXP_FK 
  FOREIGN KEY (SHABEXP_ID) 
  REFERENCES MASTER.KLS_SHABEXP (ID)
  ENABLE NOVALIDATE);

