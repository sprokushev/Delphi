-- 
-- Foreign Key Constraints for Table EUL_SUB_QUERIES 
-- 
ALTER TABLE MASTER.EUL_SUB_QUERIES ADD (
  CONSTRAINT EUL_SQ_FIL_FK 
  FOREIGN KEY (SQ_FIL_ID) 
  REFERENCES MASTER.EUL_EXPRESSIONS (EXP_ID)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_SUB_QUERIES ADD (
  CONSTRAINT EUL_SQ_IT_FK 
  FOREIGN KEY (SQ_IT_ID) 
  REFERENCES MASTER.EUL_EXPRESSIONS (EXP_ID)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_SUB_QUERIES ADD (
  CONSTRAINT EUL_SQ_OBJ_FK 
  FOREIGN KEY (SQ_OBJ_ID) 
  REFERENCES MASTER.EUL_OBJS (OBJ_ID)
  ENABLE NOVALIDATE);

