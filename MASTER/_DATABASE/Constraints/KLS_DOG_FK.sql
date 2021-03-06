-- 
-- Foreign Key Constraints for Table KLS_DOG 
-- 
ALTER TABLE MASTER.KLS_DOG ADD (
  CONSTRAINT DOG_GOSPROG_FK 
  FOREIGN KEY (GOSPROG_ID) 
  REFERENCES MASTER.KLS_GOSPROG (ID)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.KLS_DOG ADD (
  CONSTRAINT DOG_GROUPDOG_FK 
  FOREIGN KEY (GROUPDOG_ID) 
  REFERENCES MASTER.KLS_GROUPDOG (ID)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.KLS_DOG ADD (
  CONSTRAINT DOG_PREDPR_FK 
  FOREIGN KEY (PREDPR_ID) 
  REFERENCES MASTER.KLS_PREDPR (ID)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.KLS_DOG ADD (
  CONSTRAINT DOG_USL_OPL_FK 
  FOREIGN KEY (USL_OPL_ID) 
  REFERENCES MASTER.KLS_USL_OPL (ID)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.KLS_DOG ADD (
  CONSTRAINT DOG_VIDDOG_FK 
  FOREIGN KEY (VIDDOG_ID) 
  REFERENCES MASTER.KLS_VIDDOG (ID)
  ENABLE NOVALIDATE);

