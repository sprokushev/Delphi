-- 
-- Foreign Key Constraints for Table ENVIRONMENT 
-- 
ALTER TABLE SNP_REPL.ENVIRONMENT ADD (
  CONSTRAINT ENV_ENV_FK 
  FOREIGN KEY (MASTER_ID) 
  REFERENCES SNP_REPL.ENVIRONMENT (ID));

