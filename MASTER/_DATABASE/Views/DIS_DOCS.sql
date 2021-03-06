--
-- DIS_DOCS  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.DIS_DOCS
(DOCUMENT_ID, OWNER, DOCUMENT_NAME, COMMENTS, CREATE_DATE, 
 MODIFIED_DATE, MODIFIED_BY, DOC_LENGTH, DOCUMENT, BATCH)
AS 
SELECT "DOCUMENT_ID" ,  "OWNER" ,  "DOCUMENT_NAME" ,  "COMMENTS" ,  "CREATE_DATE" ,  "MODIFIED_DATE" ,  "MODIFIED_BY" ,  "DOC_LENGTH" ,  "DOCUMENT" ,  "BATCH" FROM DIS_DOCS_ WHERE OWNER = USER WITH CHECK OPTION;


