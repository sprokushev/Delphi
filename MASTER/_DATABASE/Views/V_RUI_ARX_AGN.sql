--
-- V_RUI_ARX_AGN  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_RUI_ARX_AGN
(AGN_ID, AGN_ABBR, AGN_NAME, AGN_POST, AGN_INN, 
 AGN_KPP, AGN_PARUS_FACC, AGN_PARUS_AGNABBR, IS_AUTO_LINK)
AS 
SELECT "AGN_ID","AGN_ABBR","AGN_NAME","AGN_POST","AGN_INN","AGN_KPP","AGN_PARUS_FACC","AGN_PARUS_AGNABBR", "IS_AUTO_LINK" FROM Pvz.RUI_ARX_AGN@Oracle.world;


