--
-- GD_PLAN_GD_PLAN_AK_UK  (Index) 
--
CREATE UNIQUE INDEX MASTER.GD_PLAN_GD_PLAN_AK_UK ON MASTER.GD_PLAN
(TIP_PLAN, DATE_PLAN, GROTP_ID, NAPR_MOS_ID, PROD_ID_NPR, 
LOAD_TYPE_ID, VAGOWNER_ID, STANOTP_ID)
TABLESPACE USERSINDX;

