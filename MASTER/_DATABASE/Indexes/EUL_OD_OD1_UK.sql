--
-- EUL_OD_OD1_UK  (Index) 
--
CREATE UNIQUE INDEX MASTER.EUL_OD_OD1_UK ON MASTER.EUL_OBJ_DEPS
(OD_OBJ_ID_FROM, OD_OBJ_ID_TO)
TABLESPACE USERSINDX;

