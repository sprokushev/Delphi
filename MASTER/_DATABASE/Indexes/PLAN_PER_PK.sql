--
-- PLAN_PER_PK  (Index) 
--
CREATE UNIQUE INDEX MASTER.PLAN_PER_PK ON MASTER.PLAN_PERIODS
(PLAN_ID, ID)
TABLESPACE USERSINDX;

