--
-- XX101_ZVZAV_PENDING_ACTION  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.XX101_ZVZAV_PENDING_ACTION
(FILENAME, PARSEDATETIME, FILEROWNUM, PROPAGATESTATUS, ORDERNUM, 
 ACTIONCODE)
AS 
SELECT C.FILENAME,C.PARSEDATETIME,C.FILEROWNUM,C.PROPAGATESTATUS,C.ORDERNUM,C.ACTIONCODE 
     FROM XX101_ZVZAV_DATA C JOIN  
     (SELECT A.ORDERNUM,A.FILENAME,max(A.FILEROWNUM) as FILEROWNUM FROM XX101_ZVZAV_DATA A 
           JOIN 
          (SELECT ORDERNUM,MAX(FILENAME) AS FILENAME FROM XX101_ZVZAV_DATA GROUP BY ORDERNUM) B
           ON A.ORDERNUM=B.ORDERNUM AND A.FILENAME=B.FILENAME
     GROUP BY A.ORDERNUM,A.FILENAME) D
     ON C.FILENAME=D.FILENAME AND C.FILEROWNUM=D.FILEROWNUM 
     WHERE C.PROPAGATESTATUS IS NULL;


