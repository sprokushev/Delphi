--
-- PLAN_FACT_TERMINAL_NAME_I  (Index) 
--
CREATE INDEX MASTER.PLAN_FACT_TERMINAL_NAME_I ON MASTER.PLAN_FACT
(TERMINAL_NAME)
TABLESPACE USERSINDX;

