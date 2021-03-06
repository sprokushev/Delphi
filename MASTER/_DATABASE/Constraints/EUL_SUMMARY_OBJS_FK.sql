-- 
-- Foreign Key Constraints for Table EUL_SUMMARY_OBJS 
-- 
ALTER TABLE MASTER.EUL_SUMMARY_OBJS ADD (
  CONSTRAINT EUL_NMSDO_SDO_FK 
  FOREIGN KEY (NMSDO_SDO_ID) 
  REFERENCES MASTER.EUL_SUMMARY_OBJS (SUMO_ID)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_SUMMARY_OBJS ADD (
  CONSTRAINT EUL_SBO_SRS_FK 
  FOREIGN KEY (SBO_SRS_ID) 
  REFERENCES MASTER.EUL_SUM_RFRSH_SETS (SRS_ID)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_SUMMARY_OBJS ADD (
  CONSTRAINT EUL_SDO_SBO_FK 
  FOREIGN KEY (SDO_SBO_ID) 
  REFERENCES MASTER.EUL_SUMMARY_OBJS (SUMO_ID)
  ENABLE NOVALIDATE);

