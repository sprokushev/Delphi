--
-- V_PAYMENTS_TO_BILLS  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_PAYMENTS_TO_BILLS
(NOM_DOK, PAYMENTS_ID)
AS 
SELECT "NOM_DOK","PAYMENTS_ID" FROM
  (
  SELECT
    BILLS.nom_dok,
    PAYMENTS_ON_BILLS.PAYMENTS_ID
    FROM BILLS,PAYMENTS_ON_BILLS
	  WHERE old_nom_dok=PAYMENTS_ON_BILLS.nom_dok
		UNION ALL
	    SELECT nom_dok,payments_id FROM PAYMENTS_TO_BILLS
);


