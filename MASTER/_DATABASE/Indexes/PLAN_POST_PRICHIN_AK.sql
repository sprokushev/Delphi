--
-- PLAN_POST_PRICHIN_AK  (Index) 
--
CREATE UNIQUE INDEX MASTER.PLAN_POST_PRICHIN_AK ON MASTER.PLAN_POST_PRICHIN
(BEG_DATE, END_DATE, PROD_ID_NPR, PLANSTRU_ID, OWNER_ID)
TABLESPACE USERSINDX;


