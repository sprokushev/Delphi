-- 
-- Foreign Key Constraints for Table ARC_REZ 
-- 
ALTER TABLE MASTER.ARC_REZ ADD (
  CONSTRAINT ARC_REZ_AR_TOV_FK 
  FOREIGN KEY (AR_TOV_ID) 
  REFERENCES MASTER.KLS_AR_TOV (ID)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.ARC_REZ ADD (
  CONSTRAINT ARC_REZ_ORG_STRU_FK 
  FOREIGN KEY (ORG_STRU_ID) 
  REFERENCES MASTER.ORG_STRUCTURE (ID)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.ARC_REZ ADD (
  CONSTRAINT ARC_REZ_PROD_FK 
  FOREIGN KEY (PROD_ID_NPR) 
  REFERENCES MASTER.KLS_PROD (ID_NPR)
  ENABLE NOVALIDATE);

