-- 
-- Non Foreign Key Constraints for Table EUL_EXP_DEPS 
-- 
ALTER TABLE MASTER.EUL_EXP_DEPS ADD (
  CONSTRAINT EUL_ED_CHECK_1
  CHECK ( ed_type IN ( 'PSD' ,  'PFD' ,  'CFD' ,  'CPD' ,  'CID' ,  'PED' ) )
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_EXP_DEPS ADD (
  CHECK ("ED_TYPE" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_EXP_DEPS ADD (
  CONSTRAINT EUL_ED_PK
  PRIMARY KEY
  (ED_ID)
  USING INDEX MASTER.EUL_ED_PK
  ENABLE VALIDATE);

ALTER TABLE MASTER.EUL_EXP_DEPS ADD (
  CONSTRAINT EUL_ED_ED1_UK
  UNIQUE (PSD_SQ_ID, PFD_FUN_ID, CD_EXP_ID, PED_EXP_ID, PD_P_ID, CFD_FUN_ID, CPD_EXP_ID, CID_EXP_ID)
  USING INDEX MASTER.EUL_ED_ED1_UK
  ENABLE VALIDATE);

