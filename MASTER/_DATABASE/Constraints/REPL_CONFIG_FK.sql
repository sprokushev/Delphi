-- 
-- Foreign Key Constraints for Table REPL_CONFIG 
-- 
ALTER TABLE MASTER.REPL_CONFIG ADD (
  CONSTRAINT R_CONFIG_R_SITE_FK 
  FOREIGN KEY (REPL_SITE) 
  REFERENCES MASTER.REPL_SITE (ID)
  ENABLE NOVALIDATE);

