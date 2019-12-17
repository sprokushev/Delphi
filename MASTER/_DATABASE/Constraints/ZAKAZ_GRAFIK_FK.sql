-- 
-- Foreign Key Constraints for Table ZAKAZ_GRAFIK 
-- 
ALTER TABLE MASTER.ZAKAZ_GRAFIK ADD (
  CONSTRAINT ZAKAZ_GRAFIK_ZAKAZ_HIST_FK 
  FOREIGN KEY (ZAKAZ_HIST_ID) 
  REFERENCES MASTER.ZAKAZ_HIST (ID)
  ON DELETE CASCADE
  ENABLE NOVALIDATE);

