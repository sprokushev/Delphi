-- 
-- Non Foreign Key Constraints for Table EUL_SUMO_ITEM_USGS 
-- 
ALTER TABLE MASTER.EUL_SUMO_ITEM_USGS ADD (
  CONSTRAINT EUL_SIU_CHECK_1
  CHECK ( siu_type IN ( 'SAIU' ,  'SMIU' ) )
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_SUMO_ITEM_USGS ADD (
  CONSTRAINT EUL_SIU_CHECK_2
  CHECK ( siu_item_modified IN ( 1 ,  0 ) )
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_SUMO_ITEM_USGS ADD (
  CHECK ("SIU_TYPE" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_SUMO_ITEM_USGS ADD (
  CHECK ("SIU_SUMO_ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_SUMO_ITEM_USGS ADD (
  CHECK ("SIU_EXP_ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_SUMO_ITEM_USGS ADD (
  CHECK ("SIU_EXT_COLUMN" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_SUMO_ITEM_USGS ADD (
  CHECK ("SIU_ITEM_MODIFIED" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_SUMO_ITEM_USGS ADD (
  CONSTRAINT EUL_SIU_PK
  PRIMARY KEY
  (SIU_ID)
  USING INDEX MASTER.EUL_SIU_PK
  ENABLE VALIDATE);

ALTER TABLE MASTER.EUL_SUMO_ITEM_USGS ADD (
  CONSTRAINT EUL_SIU_SIU1_UK
  UNIQUE (SIU_TYPE, SIU_SUMO_ID, SIU_EXP_ID, SMIU_FUN_ID, SMIU_MEASURE_SET)
  USING INDEX MASTER.EUL_SIU_SIU1_UK
  ENABLE VALIDATE);
