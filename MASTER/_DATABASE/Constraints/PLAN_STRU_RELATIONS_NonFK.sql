-- 
-- Non Foreign Key Constraints for Table PLAN_STRU_RELATIONS 
-- 
ALTER TABLE MASTER.PLAN_STRU_RELATIONS ADD (
  CONSTRAINT PLAN_RELA_PK
  PRIMARY KEY
  (PLAN_FROM_ID, PLANSTRU_FROM_ID, PLAN_TO_ID, PLANSTRU_TO_ID)
  USING INDEX MASTER.PLAN_RELA_PK
  ENABLE VALIDATE);

