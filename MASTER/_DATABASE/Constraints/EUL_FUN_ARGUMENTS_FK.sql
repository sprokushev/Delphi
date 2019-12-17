-- 
-- Foreign Key Constraints for Table EUL_FUN_ARGUMENTS 
-- 
ALTER TABLE MASTER.EUL_FUN_ARGUMENTS ADD (
  CONSTRAINT EUL_FA_FUN_FK 
  FOREIGN KEY (FA_FUN_ID) 
  REFERENCES MASTER.EUL_FUNCTIONS (FUN_ID)
  ENABLE NOVALIDATE);

