--
-- ROLE_PR_ROLE_PR_UK  (Index) 
--
CREATE UNIQUE INDEX MASTER.ROLE_PR_ROLE_PR_UK ON MASTER.PREDPR_ROLE
(PREDPR_ID, KLS_ROLE_ID)
TABLESPACE USERSINDX;


