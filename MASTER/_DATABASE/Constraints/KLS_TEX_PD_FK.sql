-- 
-- Foreign Key Constraints for Table KLS_TEX_PD 
-- 
ALTER TABLE MASTER.KLS_TEX_PD ADD (
  CONSTRAINT TEX_PD_GROTP_FK 
  FOREIGN KEY (GROTP_ID) 
  REFERENCES MASTER.KLS_PREDPR (ID)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.KLS_TEX_PD ADD (
  CONSTRAINT TEX_PD_PLATTARIF_FK 
  FOREIGN KEY (PLATTARIF_ID) 
  REFERENCES MASTER.KLS_PREDPR (ID)
  ENABLE NOVALIDATE);
