--
-- EUL_ODBC_CATALOGS  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.EUL_ODBC_CATALOGS
(OC_CATALOG_NAME)
AS 
SELECT DB_LINK FROM ALL_DB_LINKS;


