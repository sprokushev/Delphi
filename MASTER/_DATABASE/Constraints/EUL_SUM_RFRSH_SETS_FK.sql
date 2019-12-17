-- 
-- Foreign Key Constraints for Table EUL_SUM_RFRSH_SETS 
-- 
ALTER TABLE MASTER.EUL_SUM_RFRSH_SETS ADD (
  CONSTRAINT EUL_SRS_EU_FK 
  FOREIGN KEY (SRS_EU_ID) 
  REFERENCES MASTER.EUL_EUL_USERS (EU_ID)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_SUM_RFRSH_SETS ADD (
  CONSTRAINT EUL_SRS_RFU_FK 
  FOREIGN KEY (SRS_RFU_ID) 
  REFERENCES MASTER.EUL_FREQ_UNITS (RFU_ID)
  ENABLE NOVALIDATE);
