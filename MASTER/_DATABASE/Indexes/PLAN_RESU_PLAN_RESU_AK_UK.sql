--
-- PLAN_RESU_PLAN_RESU_AK_UK  (Index) 
--
CREATE UNIQUE INDEX MASTER.PLAN_RESU_PLAN_RESU_AK_UK ON MASTER.PLAN_RESU
(PLAN_ID, PLAN_PER_ID, PROD_ID_NPR, REFINER_ID, SOBSTV_ID)
TABLESPACE USERSINDX;


