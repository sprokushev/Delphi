--
-- V_DOV_SUM  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_DOV_SUM
(DOVER_ID, VES)
AS 
SELECT DOVER_ID,SUM(VES) FROM KLS_DOV_LINE   
GROUP BY DOVER_ID   
ORDER BY DOVER_ID;


