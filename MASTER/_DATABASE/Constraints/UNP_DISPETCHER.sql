-- 
-- Non Foreign Key Constraints for Table UNP_DISPETCHER 
-- 
ALTER MATERIALIZED VIEW MASTER.UNP_DISPETCHER ADD (
  CONSTRAINT PRIM
  PRIMARY KEY
  (USERNAME)
  USING INDEX MASTER.PRIM
  ENABLE VALIDATE);