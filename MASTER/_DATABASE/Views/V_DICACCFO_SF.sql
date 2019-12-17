--
-- V_DICACCFO_SF  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_DICACCFO_SF
(NOM_DOK, PREF_SF, NPO_SF, ACC_DATE, BASE_NUMB, 
 NUM_DOG, BASE_DATE, CONF_NUMB, SVED_NUM, CONF_DATE, 
 SENDER, PRIM, NUM_KVIT, SUM_WOUT, SUM_NDS, 
 SUM_GSM, SUM_TOTAL, KOL_DN, NOM_ZD)
AS 
SELECT
  RN,
  PREF_SF,
  NPO_SF,
  ACC_DATE,
  BASE_NUMB,
  NUM_DOG,
  BASE_DATE,
  CONF_NUMB,
  SVED_NUM,
  CONF_DATE,
  SENDER,
  PRIM,
  NUM_KVIT,
  SUM_WOUT,
  SUM_NDS,
  SUM_GSM,
  SUM_TOTAL,
  KOL_DN,
  NOM_ZD
FROM load_buffer.v_dicaccfo;


