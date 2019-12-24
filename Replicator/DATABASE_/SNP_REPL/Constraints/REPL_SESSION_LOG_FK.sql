-- 
-- Foreign Key Constraints for Table REPL_SESSION_LOG 
-- 
ALTER TABLE SNP_REPL.REPL_SESSION_LOG ADD (
  CONSTRAINT R_SESS_L_R_SESS_FK 
  FOREIGN KEY (SESSION_ID) 
  REFERENCES SNP_REPL.REPL_SESSION (ID));

