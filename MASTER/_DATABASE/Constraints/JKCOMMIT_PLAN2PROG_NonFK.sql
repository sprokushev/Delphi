-- 
-- Non Foreign Key Constraints for Table JKCOMMIT_PLAN2PROG 
-- 
ALTER TABLE MASTER.JKCOMMIT_PLAN2PROG ADD (
  CHECK ("PLANSTRU_ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.JKCOMMIT_PLAN2PROG ADD (
  CHECK ("GOSPROG_ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.JKCOMMIT_PLAN2PROG ADD (
  CONSTRAINT PLAN2PROG_PLAN2PROG_UK
  UNIQUE (GOSPROG_ID, PLANSTRU_ID)
  USING INDEX MASTER.PLAN2PROG_PLAN2PROG_UK
  ENABLE VALIDATE);

