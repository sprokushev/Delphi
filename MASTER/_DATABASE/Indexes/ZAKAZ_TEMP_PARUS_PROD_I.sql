--
-- ZAKAZ_TEMP_PARUS_PROD_I  (Index) 
--
CREATE INDEX MASTER.ZAKAZ_TEMP_PARUS_PROD_I ON MASTER.ZAKAZ_TEMP
(TERMINAL_NAME, USER_NAME, IS_AGENT, KIND_VALUE, FILIAL_ID, 
PARUS_NOMEN_TAG, PARUS_AGENT_TAG, PARUS_DOGOVOR)
TABLESPACE LOADERINDX;


