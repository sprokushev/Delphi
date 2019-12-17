-- 
-- Non Foreign Key Constraints for Table EUL_IG_EXP_LINKS 
-- 
ALTER TABLE MASTER.EUL_IG_EXP_LINKS ADD (
  CONSTRAINT EUL_IEL_CHECK_1
  CHECK ( iel_type in ('HIL',  'KIL') )
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_IG_EXP_LINKS ADD (
  CHECK ("IEL_TYPE" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_IG_EXP_LINKS ADD (
  CONSTRAINT EUL_IEL_PK
  PRIMARY KEY
  (IEL_ID)
  USING INDEX MASTER.EUL_IEL_PK
  ENABLE VALIDATE);

ALTER TABLE MASTER.EUL_IG_EXP_LINKS ADD (
  CONSTRAINT EUL_IEL_IEL1_UK
  UNIQUE (KIL_EXP_ID, KIL_KEY_ID, HIL_EXP_ID, HIL_HN_ID)
  USING INDEX MASTER.EUL_IEL_IEL1_UK
  ENABLE VALIDATE);

