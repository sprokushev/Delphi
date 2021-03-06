-- 
-- Foreign Key Constraints for Table ORG_RELATIONS 
-- 
ALTER TABLE MASTER.ORG_RELATIONS ADD (
  CONSTRAINT ORG_REL_KIND_RELA_FK 
  FOREIGN KEY (KIND_RELA_ID) 
  REFERENCES MASTER.KLS_ORG_KIND_RELATIONS (ID)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.ORG_RELATIONS ADD (
  CONSTRAINT ORG_REL_ORG_STRU_1_FK 
  FOREIGN KEY (ORG_STRU_1_ID) 
  REFERENCES MASTER.ORG_STRUCTURE (ID)
  ON DELETE CASCADE
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.ORG_RELATIONS ADD (
  CONSTRAINT ORG_REL_ORG_STRU_2_FK 
  FOREIGN KEY (ORG_STRU_2_ID) 
  REFERENCES MASTER.ORG_STRUCTURE (ID)
  ON DELETE CASCADE
  ENABLE NOVALIDATE);

