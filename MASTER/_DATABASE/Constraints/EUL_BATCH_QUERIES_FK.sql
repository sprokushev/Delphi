-- 
-- Foreign Key Constraints for Table EUL_BATCH_QUERIES 
-- 
ALTER TABLE MASTER.EUL_BATCH_QUERIES ADD (
  CONSTRAINT EUL_BQ_BS_FK 
  FOREIGN KEY (BQ_BS_ID) 
  REFERENCES MASTER.EUL_BATCH_SHEETS (BS_ID)
  ENABLE NOVALIDATE);

