--
-- EUL_BQ_BQ1_UK  (Index) 
--
CREATE UNIQUE INDEX MASTER.EUL_BQ_BQ1_UK ON MASTER.EUL_BATCH_QUERIES
(BQ_BS_ID, BQ_QUERY_ID)
TABLESPACE USERSINDX;

