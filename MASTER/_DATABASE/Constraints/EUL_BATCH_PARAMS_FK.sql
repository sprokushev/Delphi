-- 
-- Foreign Key Constraints for Table EUL_BATCH_PARAMS 
-- 
ALTER TABLE MASTER.EUL_BATCH_PARAMS ADD (
  CONSTRAINT EUL_BP_BS_FK 
  FOREIGN KEY (BP_BS_ID) 
  REFERENCES MASTER.EUL_BATCH_SHEETS (BS_ID)
  ENABLE NOVALIDATE);

