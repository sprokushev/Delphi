--
-- DIS_GRANTS  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.DIS_GRANTS
(DOCUMENT_ID, OWNER, GRANTEE)
AS 
SELECT "DOCUMENT_ID" ,  "OWNER" ,  "GRANTEE" FROM DIS_GRANTS_ WHERE OWNER = USER WITH CHECK OPTION;


