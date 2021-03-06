-- 
-- Non Foreign Key Constraints for Table EUL_EXPRESSIONS 
-- 
ALTER TABLE MASTER.EUL_EXPRESSIONS ADD (
  CONSTRAINT EUL_EXP_CHECK_1
  CHECK ( exp_type IN ( 'CI' ,  'CO' ,  'JP' ,  'FIL' ,  'PAR' ) )
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_EXPRESSIONS ADD (
  CONSTRAINT EUL_EXP_CHECK_10
  CHECK ( it_case_display IN ( 1 ,  2 ,  3 ,  4 ) )
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_EXPRESSIONS ADD (
  CONSTRAINT EUL_EXP_CHECK_11
  CHECK ( co_nullable IN ( 1 ,  0 ) )
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_EXPRESSIONS ADD (
  CONSTRAINT EUL_EXP_CHECK_12
  CHECK ( p_case_sensitive IN ( 1 ,  0 ) )
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_EXPRESSIONS ADD (
  CONSTRAINT EUL_EXP_CHECK_13
  CHECK ( fil_mandatory IN ( 1 ,  0 ) )
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_EXPRESSIONS ADD (
  CONSTRAINT EUL_EXP_CHECK_14
  CHECK ( ci_aggregate_item in (1, 0) )
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_EXPRESSIONS ADD (
  CONSTRAINT EUL_EXP_CHECK_2
  CHECK ( exp_data_type IN (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13) )
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_EXPRESSIONS ADD (
  CONSTRAINT EUL_EXP_CHECK_3
  CHECK ( ite_alignment IN ( 1 ,  2 ,  3 ,  4 ) )
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_EXPRESSIONS ADD (
  CONSTRAINT EUL_EXP_CHECK_4
  CHECK ( ite_word_wrap IN ( 1 ,  0 ) )
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_EXPRESSIONS ADD (
  CONSTRAINT EUL_EXP_CHECK_5
  CHECK ( par_multiple_vals IN ( 1 ,  0 ) )
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_EXPRESSIONS ADD (
  CONSTRAINT EUL_EXP_CHECK_6
  CHECK ( it_hidden IN ( 1 ,  0 ) )
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_EXPRESSIONS ADD (
  CONSTRAINT EUL_EXP_CHECK_7
  CHECK ( it_ord_direction IN ( 1 ,  2 ) )
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_EXPRESSIONS ADD (
  CONSTRAINT EUL_EXP_CHECK_8
  CHECK ( it_placement IN ( 0 ,  1 ,  2 ,  3 ,  4 ,  5 ) )
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_EXPRESSIONS ADD (
  CONSTRAINT EUL_EXP_CHECK_9
  CHECK ( it_case_storage IN ( 0 ,  1 ,  2 ,  3 ) )
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_EXPRESSIONS ADD (
  CHECK ("EXP_TYPE" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_EXPRESSIONS ADD (
  CHECK ("EXP_NAME" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_EXPRESSIONS ADD (
  CHECK ("EXP_DATA_TYPE" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE MASTER.EUL_EXPRESSIONS ADD (
  CONSTRAINT EUL_EXP_PK
  PRIMARY KEY
  (EXP_ID)
  USING INDEX MASTER.EUL_EXP_PK
  ENABLE VALIDATE);

ALTER TABLE MASTER.EUL_EXPRESSIONS ADD (
  CONSTRAINT EUL_EXP_EXP1_UK
  UNIQUE (ITE_EU_ID, NJP_EU_ID, JP_KEY_ID, NJP_OBJ_ID_OWNER, ITE_OBJ_ID, EXP_NAME)
  USING INDEX MASTER.EUL_EXP_EXP1_UK
  ENABLE VALIDATE);

