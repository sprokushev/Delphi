-- 
-- Foreign Key Constraints for Table EUL_EXPRESSIONS 
-- 
ALTER TABLE MASTER.EUL_EXPRESSIONS ADD (
  CONSTRAINT EUL_CI_IT_FK 
  FOREIGN KEY (CI_IT_ID) 
  REFERENCES MASTER.EUL_EXPRESSIONS (EXP_ID)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_EXPRESSIONS ADD (
  CONSTRAINT EUL_ITE_DOM_FK 
  FOREIGN KEY (ITE_DOM_ID) 
  REFERENCES MASTER.EUL_DOMAINS (DOM_ID)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_EXPRESSIONS ADD (
  CONSTRAINT EUL_ITE_EU_FK 
  FOREIGN KEY (ITE_EU_ID) 
  REFERENCES MASTER.EUL_EUL_USERS (EU_ID)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_EXPRESSIONS ADD (
  CONSTRAINT EUL_ITE_OBJ_FK 
  FOREIGN KEY (ITE_OBJ_ID) 
  REFERENCES MASTER.EUL_OBJS (OBJ_ID)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_EXPRESSIONS ADD (
  CONSTRAINT EUL_IT_FUN_FK 
  FOREIGN KEY (IT_FUN_ID) 
  REFERENCES MASTER.EUL_FUNCTIONS (FUN_ID)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_EXPRESSIONS ADD (
  CONSTRAINT EUL_IT_IT_FK 
  FOREIGN KEY (IT_EXP_ID_DESC_FOR) 
  REFERENCES MASTER.EUL_EXPRESSIONS (EXP_ID)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_EXPRESSIONS ADD (
  CONSTRAINT EUL_IT_KEY_FK 
  FOREIGN KEY (IT_KEY_ID_DESC_FOR) 
  REFERENCES MASTER.EUL_KEY_CONS (KEY_ID)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_EXPRESSIONS ADD (
  CONSTRAINT EUL_JP_FK_FK 
  FOREIGN KEY (JP_KEY_ID) 
  REFERENCES MASTER.EUL_KEY_CONS (KEY_ID)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_EXPRESSIONS ADD (
  CONSTRAINT EUL_NJP_EU_FK 
  FOREIGN KEY (NJP_EU_ID) 
  REFERENCES MASTER.EUL_EUL_USERS (EU_ID)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_EXPRESSIONS ADD (
  CONSTRAINT EUL_NJP_OBJ_FK 
  FOREIGN KEY (NJP_OBJ_ID_OWNER) 
  REFERENCES MASTER.EUL_OBJS (OBJ_ID)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_EXPRESSIONS ADD (
  CONSTRAINT EUL_PAR_IT_FK 
  FOREIGN KEY (PAR_EXP_ID_ASSOC) 
  REFERENCES MASTER.EUL_EXPRESSIONS (EXP_ID)
  ENABLE NOVALIDATE);

