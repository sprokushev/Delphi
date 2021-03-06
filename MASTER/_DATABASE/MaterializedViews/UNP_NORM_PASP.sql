--
-- UNP_NORM_PASP  (Materialized View) 
--
CREATE MATERIALIZED VIEW MASTER.UNP_NORM_PASP 
TABLESPACE USERS2
NOCOMPRESS
BUILD IMMEDIATE
USING INDEX
            TABLESPACE USERSINDX
REFRESH FORCE ON DEMAND
WITH PRIMARY KEY
AS 
SELECT "NORM_PASP"."ID_NORM" "ID_NORM","NORM_PASP"."KOD_OIL_PRODUCT" "KOD_OIL_PRODUCT","NORM_PASP"."KOD_POKAZATEL" "KOD_POKAZATEL","NORM_PASP"."UPPER_LIMIT" "UPPER_LIMIT","NORM_PASP"."LOWER_LIMIT" "LOWER_LIMIT","NORM_PASP"."NORM_POKAZATEL" "NORM_POKAZATEL","NORM_PASP"."NOMER_PP" "NOMER_PP","NORM_PASP"."TITLE" "TITLE","NORM_PASP"."NOMER_INSIDE" "NOMER_INSIDE","NORM_PASP"."GARANT" "GARANT" FROM "PASP"."NORM_PASP"@ORA.LUNP.RU "NORM_PASP"
;


COMMENT ON MATERIALIZED VIEW MASTER.UNP_NORM_PASP IS 'snapshot table for snapshot MASTER.UNP_NORM_PASP';
