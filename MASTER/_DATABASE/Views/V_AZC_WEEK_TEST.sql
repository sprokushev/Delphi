--
-- V_AZC_WEEK_TEST  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_AZC_WEEK_TEST
(STORE, NOMEN, REALIZ, REAL_ALL, QUANT, 
 DDATE, NSTORE, NNOMEN, RN)
AS 
SELECT "STORE","NOMEN","REALIZ","REAL_ALL","QUANT","DDATE","NSTORE","NNOMEN","RN" FROM parus.tb_snp_stat_osv@oracle.world;


