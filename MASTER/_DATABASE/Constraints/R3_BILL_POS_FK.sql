-- 
-- Foreign Key Constraints for Table R3_BILL_POS 
-- 
ALTER TABLE MASTER.R3_BILL_POS ADD (
  CONSTRAINT R3_BILLPOS_MATERIALS_FK 
  FOREIGN KEY (VBAP_MATNR) 
  REFERENCES MASTER.R3_MATERIALS (VBAP_MATNR)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.R3_BILL_POS ADD (
  CONSTRAINT R3_BILLPOS_R3_BILLS_FK 
  FOREIGN KEY (VBELN) 
  REFERENCES MASTER.R3_BILLS (VBELN)
  ENABLE NOVALIDATE);
