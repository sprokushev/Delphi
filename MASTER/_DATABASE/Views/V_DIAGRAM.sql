--
-- V_DIAGRAM  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_DIAGRAM
(COL_X1_NAME, COL_X1_VALUE, COL_X2_NAME, COL_X2_VALUE, COL_X3_NAME, 
 COL_X3_VALUE, COL_Y1_NAME, COL_Y1_VALUE, COL_Y2_NAME, COL_Y2_VALUE, 
 COL_Y3_NAME, COL_Y3_VALUE, COL_Y4_NAME, COL_Y4_VALUE, COL_Y5_NAME, 
 COL_Y5_VALUE, COL_Y6_NAME, COL_Y6_VALUE, COL_Y7_NAME, COL_Y7_VALUE, 
 COL_Y8_NAME, COL_Y8_VALUE, COL_Y9_NAME, COL_Y9_VALUE, COL_Y10_NAME, 
 COL_Y10_VALUE, COL_Y11_NAME, COL_Y11_VALUE, COL_Y12_NAME, COL_Y12_VALUE, 
 COL_Y13_NAME, COL_Y13_VALUE, COL_Y14_NAME, COL_Y14_VALUE, COL_Y15_NAME, 
 COL_Y15_VALUE, COL_Y16_NAME, COL_Y16_VALUE, COL_Y17_NAME, COL_Y17_VALUE, 
 COL_Y18_NAME, COL_Y18_VALUE, COL_Y19_NAME, COL_Y19_VALUE, COL_Y20_NAME, 
 COL_Y20_VALUE, COL_SORT, PRIM, TITLE, VIEW_ROW)
AS 
SELECT "COL_X1_NAME","COL_X1_VALUE","COL_X2_NAME","COL_X2_VALUE","COL_X3_NAME","COL_X3_VALUE","COL_Y1_NAME","COL_Y1_VALUE","COL_Y2_NAME","COL_Y2_VALUE","COL_Y3_NAME","COL_Y3_VALUE","COL_Y4_NAME","COL_Y4_VALUE","COL_Y5_NAME","COL_Y5_VALUE","COL_Y6_NAME","COL_Y6_VALUE","COL_Y7_NAME","COL_Y7_VALUE","COL_Y8_NAME","COL_Y8_VALUE","COL_Y9_NAME","COL_Y9_VALUE","COL_Y10_NAME","COL_Y10_VALUE","COL_Y11_NAME","COL_Y11_VALUE","COL_Y12_NAME","COL_Y12_VALUE","COL_Y13_NAME","COL_Y13_VALUE","COL_Y14_NAME","COL_Y14_VALUE","COL_Y15_NAME","COL_Y15_VALUE","COL_Y16_NAME","COL_Y16_VALUE","COL_Y17_NAME","COL_Y17_VALUE","COL_Y18_NAME","COL_Y18_VALUE","COL_Y19_NAME","COL_Y19_VALUE","COL_Y20_NAME","COL_Y20_VALUE","COL_SORT","PRIM","TITLE","VIEW_ROW" FROM DIAGRAM 
WHERE TERMINAL_NAME = For_Init.GetCurrTerm 
  AND OSUSER_NAME = For_Init.GetCurrUser 
ORDER BY COL_SORT;


