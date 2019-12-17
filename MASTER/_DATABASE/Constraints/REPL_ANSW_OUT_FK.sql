-- 
-- Foreign Key Constraints for Table REPL_ANSW_OUT 
-- 
ALTER TABLE MASTER.REPL_ANSW_OUT ADD (
  CONSTRAINT R_ANSW_O_DST_SITE_FK 
  FOREIGN KEY (DST_SITE) 
  REFERENCES MASTER.REPL_SITE (ID)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.REPL_ANSW_OUT ADD (
  CONSTRAINT R_ANSW_O_R_FILETYP_FK 
  FOREIGN KEY (FILE_TYPE) 
  REFERENCES MASTER.REPL_FILE_TYPES (ID)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.REPL_ANSW_OUT ADD (
  CONSTRAINT R_ANSW_O_SRC_SITE_FK 
  FOREIGN KEY (SRC_SITE) 
  REFERENCES MASTER.REPL_SITE (ID)
  ENABLE NOVALIDATE);
