--
-- ISU_TAX_EXIST  (Table) 
--
CREATE GLOBAL TEMPORARY TABLE MASTER.ISU_TAX_EXIST
(
  DOC_ID        NUMBER                          NOT NULL,
  REASON_ID     NUMBER,
  FILE_ID       NUMBER,
  FILE_POS_NUM  NUMBER
)
ON COMMIT DELETE ROWS;


