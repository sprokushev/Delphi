-- 
-- Non Foreign Key Constraints for Table ZAKAZ_GRAFIK 
-- 
ALTER TABLE MASTER.ZAKAZ_GRAFIK ADD (
  CHECK ("ZAKAZ_HIST_ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.ZAKAZ_GRAFIK ADD (
  CHECK ("DATE_LOAD" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.ZAKAZ_GRAFIK ADD (
  CHECK ("TONN_LOAD" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.ZAKAZ_GRAFIK ADD (
  CHECK ("CIST_LOAD" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.ZAKAZ_GRAFIK ADD (
  CONSTRAINT PK_ZAKAZ_GRAFIK
  PRIMARY KEY
  (ID)
  USING INDEX MASTER.PK_ZAKAZ_GRAFIK
  ENABLE VALIDATE);

ALTER TABLE MASTER.ZAKAZ_GRAFIK ADD (
  CONSTRAINT ZAKAZ_GRAFIK_UK
  UNIQUE (ZAKAZ_HIST_ID, DATE_LOAD)
  USING INDEX MASTER.ZAKAZ_GRAFIK_UK
  ENABLE VALIDATE);

