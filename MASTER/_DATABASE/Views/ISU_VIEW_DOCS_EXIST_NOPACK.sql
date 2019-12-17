--
-- ISU_VIEW_DOCS_EXIST_NOPACK  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.ISU_VIEW_DOCS_EXIST_NOPACK
("����� ���������", "���� ���������", "�������", "��� �����", "�������")
AS 
select ISU_TAX_DOCS.DOC_NUM as "����� ���������",
       ISU_TAX_DOCS.DOC_DATE as "���� ���������",
       ISU_TAX_REASON.reason as "�������",
       ISU_TAX_FILES.file_name as "��� �����",
       ISU_TAX_EXIST.file_pos_num as "�������"
       from ISU_TAX_EXIST 
            JOIN ISU_TAX_DOCS ON ISU_TAX_EXIST.DOC_ID=ISU_TAX_DOCS.ID AND ISU_TAX_DOCS.PACKAGE_ID IS NULL 
            JOIN ISU_TAX_REASON ON ISU_TAX_EXIST.reason_id=ISU_TAX_REASON.id
            JOIN ISU_TAX_FILES ON ISU_TAX_EXIST.file_id=ISU_TAX_FILES.id;


