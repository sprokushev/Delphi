-- 
-- Foreign Key Constraints for Table T_SNPORDEXP_UPLOADORD_KSE 
-- 
ALTER TABLE MASTER.T_SNPORDEXP_UPLOADORD_KSE ADD (
  CONSTRAINT T_SNPORDEXP_UPLOADORD_FK1_KSE 
  FOREIGN KEY (UPLOADID) 
  REFERENCES MASTER.T_SNPORDEXP_UPLOAD_KSE (UPLOADID)
  ON DELETE SET NULL
  ENABLE VALIDATE);

ALTER TABLE MASTER.T_SNPORDEXP_UPLOADORD_KSE ADD (
  CONSTRAINT T_SNPORDEXP_UPLOADORD_FK2_KSE 
  FOREIGN KEY (ORDERID) 
  REFERENCES MASTER.ZAKAZ_HIST (ID)
  ON DELETE SET NULL
  ENABLE VALIDATE);
