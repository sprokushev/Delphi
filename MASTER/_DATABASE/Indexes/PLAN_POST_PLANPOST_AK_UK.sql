--
-- PLAN_POST_PLANPOST_AK_UK  (Index) 
--
CREATE UNIQUE INDEX MASTER.PLAN_POST_PLANPOST_AK_UK ON MASTER.PLAN_POST
(PLAN_PER_ID, PLAN_ID, PROD_ID_NPR, DOG_ID, PLANSTRU_ID, 
PAYFORM_ID, REFINERY_ID, ORGSTRU_ID)
TABLESPACE USERSINDX;


