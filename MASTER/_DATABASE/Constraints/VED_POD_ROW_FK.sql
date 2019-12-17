-- 
-- Foreign Key Constraints for Table VED_POD_ROW 
-- 
ALTER TABLE MASTER.VED_POD_ROW ADD (
  CONSTRAINT VED_POD_ROW_PROD_FK 
  FOREIGN KEY (PROD_ID_NPR) 
  REFERENCES MASTER.KLS_PROD (ID_NPR)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.VED_POD_ROW ADD (
  CONSTRAINT VED_POD_ROW_VAGOWNER_FK 
  FOREIGN KEY (VAGOWNER_ID) 
  REFERENCES MASTER.KLS_VAGOWNER (ID)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.VED_POD_ROW ADD (
  CONSTRAINT VED_POD_ROW_VED_POD_FK 
  FOREIGN KEY (VED_POD_ID) 
  REFERENCES MASTER.VED_POD (ID)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.VED_POD_ROW ADD (
  CONSTRAINT VED_POD_ROW_VOR_FK 
  FOREIGN KEY (VED_OSMOTR_ROW_ID) 
  REFERENCES MASTER.VED_OSMOTR_ROW (ID)
  ENABLE NOVALIDATE);
