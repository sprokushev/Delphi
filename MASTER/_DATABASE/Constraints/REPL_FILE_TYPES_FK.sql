-- 
-- Foreign Key Constraints for Table REPL_FILE_TYPES 
-- 
ALTER TABLE MASTER.REPL_FILE_TYPES ADD (
  CONSTRAINT R_FILETYP_R_FILKND_FK 
  FOREIGN KEY (FILE_KIND) 
  REFERENCES MASTER.REPL_FILE_KINDS (ID)
  ENABLE NOVALIDATE);

