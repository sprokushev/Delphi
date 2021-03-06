--
-- ISU_VIEW_DOCS_NOPACK  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.ISU_VIEW_DOCS_NOPACK
(ID, PACKAGE_ID, EXT_DOC_NUM, DOC_NUM, DOC_DATE, 
 DOC_SOURCE_ID, CREATION_DATE, DOC_REL_ID, PARENT_DOC_NUM, PARENT_DOC_DATE, 
 PARENT_DOC_REL_ID, PARENT_DOC_ID, CONTRAGENT)
AS 
select "ID","PACKAGE_ID","EXT_DOC_NUM","DOC_NUM","DOC_DATE","DOC_SOURCE_ID","CREATION_DATE","DOC_REL_ID","PARENT_DOC_NUM","PARENT_DOC_DATE","PARENT_DOC_REL_ID","PARENT_DOC_ID","CONTRAGENT" from ISU_TAX_DOCS WHERE PACKAGE_ID IS NULL;


