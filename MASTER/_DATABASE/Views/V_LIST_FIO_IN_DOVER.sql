--
-- V_LIST_FIO_IN_DOVER  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_LIST_FIO_IN_DOVER
(FIO_DOVER, DOLJ_DOVER)
AS 
SELECT UPPER(FIO_DOVER), UPPER(DOLJ_DOVER) FROM KLS_DOVER  
GROUP BY UPPER(FIO_DOVER),UPPER(DOLJ_DOVER)    
ORDER BY UPPER(FIO_DOVER),UPPER(DOLJ_DOVER);


