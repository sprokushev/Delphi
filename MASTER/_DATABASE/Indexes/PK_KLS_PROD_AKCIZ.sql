--
-- PK_KLS_PROD_AKCIZ  (Index) 
--
CREATE UNIQUE INDEX MASTER.PK_KLS_PROD_AKCIZ ON MASTER.KLS_PROD_AKCIZ
(FROM_DATE, TO_DATE, PROD_GROUPS_ID)
TABLESPACE USERSINDX;


