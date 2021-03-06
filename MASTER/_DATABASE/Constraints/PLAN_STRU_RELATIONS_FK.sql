-- 
-- Foreign Key Constraints for Table PLAN_STRU_RELATIONS 
-- 
ALTER TABLE MASTER.PLAN_STRU_RELATIONS ADD (
  CONSTRAINT PLAN_RELA_PLAN_FROM_FK 
  FOREIGN KEY (PLAN_FROM_ID) 
  REFERENCES MASTER.KLS_PLAN (ID)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.PLAN_STRU_RELATIONS ADD (
  CONSTRAINT PLAN_RELA_PLANSTRU_FROM_FK 
  FOREIGN KEY (PLANSTRU_FROM_ID) 
  REFERENCES MASTER.KLS_PLANSTRU (ID)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.PLAN_STRU_RELATIONS ADD (
  CONSTRAINT PLAN_RELA_PLANSTRU_TO_FK 
  FOREIGN KEY (PLANSTRU_TO_ID) 
  REFERENCES MASTER.KLS_PLANSTRU (ID)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.PLAN_STRU_RELATIONS ADD (
  CONSTRAINT PLAN_RELA_PLAN_TO_FK 
  FOREIGN KEY (PLAN_TO_ID) 
  REFERENCES MASTER.KLS_PLAN (ID)
  ENABLE NOVALIDATE);

