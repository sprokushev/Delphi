-- 
-- Foreign Key Constraints for Table EUL_DOMAINS 
-- 
ALTER TABLE MASTER.EUL_DOMAINS ADD (
  CONSTRAINT EUL_DOM_IT_L_FK 
  FOREIGN KEY (DOM_IT_ID_LOV) 
  REFERENCES MASTER.EUL_EXPRESSIONS (EXP_ID)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_DOMAINS ADD (
  CONSTRAINT EUL_DOM_IT_R_FK 
  FOREIGN KEY (DOM_IT_ID_RANK) 
  REFERENCES MASTER.EUL_EXPRESSIONS (EXP_ID)
  ENABLE NOVALIDATE);
