--
-- ENV_ENV_AK_UK  (Index) 
--
CREATE UNIQUE INDEX SNP_REPL.ENV_ENV_AK_UK ON SNP_REPL.ENVIRONMENT
(APPL_NAME, NETUSER, ENV_NAME);

