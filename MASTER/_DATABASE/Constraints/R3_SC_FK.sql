-- 
-- Foreign Key Constraints for Table R3_SC 
-- 
ALTER TABLE MASTER.R3_SC ADD (
  CONSTRAINT SC_CC_FK 
  FOREIGN KEY (EKKO_ZZ021) 
  REFERENCES MASTER.R3_CC (EKKO_ZZ021)
  ENABLE NOVALIDATE);

