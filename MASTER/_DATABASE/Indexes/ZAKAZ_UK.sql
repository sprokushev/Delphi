--
-- ZAKAZ_UK  (Index) 
--
CREATE INDEX MASTER.ZAKAZ_UK ON MASTER.ZAKAZ
(PLAT_ID, DOG_ID, PROD_ID_NPR, STAN_ID, POLUCH_ID, 
POTREB_ID, POTREB_NAME)
TABLESPACE USERSINDX;


