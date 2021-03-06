-- 
-- Non Foreign Key Constraints for Table ENVIRONMENT 
-- 
ALTER TABLE SNP_REPL.ENVIRONMENT ADD (
  CONSTRAINT ENV_PK
  PRIMARY KEY
  (ID)
  USING INDEX SNP_REPL.ENV_PK);

ALTER TABLE SNP_REPL.ENVIRONMENT ADD (
  CONSTRAINT ENV_ENV_AK_UK
  UNIQUE (APPL_NAME, NETUSER, ENV_NAME)
  USING INDEX SNP_REPL.ENV_ENV_AK_UK);

