-- 
-- Non Foreign Key Constraints for Table EUL_NMSDO_JC_USGS 
-- 
ALTER TABLE MASTER.EUL_NMSDO_JC_USGS ADD (
  CHECK ("NJU_JC_ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_NMSDO_JC_USGS ADD (
  CHECK ("NJU_NMSDO_ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_NMSDO_JC_USGS ADD (
  CONSTRAINT EUL_NJU_PK
  PRIMARY KEY
  (NJU_ID)
  USING INDEX MASTER.EUL_NJU_PK
  ENABLE VALIDATE);

ALTER TABLE MASTER.EUL_NMSDO_JC_USGS ADD (
  CONSTRAINT EUL_NJU_NJU1_UK
  UNIQUE (NJU_JC_ID, NJU_NMSDO_ID)
  USING INDEX MASTER.EUL_NJU_NJU1_UK
  ENABLE VALIDATE);

