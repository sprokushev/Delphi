--
-- V_ARH_TRANSINVDEPT  (View) 
--
CREATE OR REPLACE FORCE VIEW SNP_REPL.V_ARH_TRANSINVDEPT
(RN, COMPANY, CRN, DOCTYPE, PREF, 
 NUMB, DOCDATE, STATUS, IN_STATUS, WORK_DATE, 
 IN_WORK_DATE, DIRDOC, DIRNUMB, DIRDATE, STOPER, 
 FACEACC, GRAPHPOINT, STORE, MOL, SHEEPVIEW, 
 SUBDIV, CURRENCY, CURCOURS, CURBASE, SUMMWITHNDS, 
 SERV_SUMM_NDS, FA_CURCOURS, FA_CURBASE, IN_STORE, IN_MOL, 
 IN_STOPER, IN_CURCOURS, IN_CURBASE, VALID_DOCTYPE, VALID_DOCNUMB, 
 VALID_DOCDATE, RECIPDOC, RECIPNUMB, RECIPDATE, FERRYMAN, 
 GETCONFIRM, WAYBLADENUMB, DRIVER, CAR, ROUTE, 
 TRAILER1, TRAILER2, COMMENTS, RESERVDATE, JUR_PERS)
AS 
SELECT /*+ RULE */ "RN","COMPANY","CRN","DOCTYPE","PREF","NUMB","DOCDATE","STATUS","IN_STATUS","WORK_DATE","IN_WORK_DATE","DIRDOC","DIRNUMB","DIRDATE","STOPER","FACEACC","GRAPHPOINT","STORE","MOL","SHEEPVIEW","SUBDIV","CURRENCY","CURCOURS","CURBASE","SUMMWITHNDS","SERV_SUMM_NDS","FA_CURCOURS","FA_CURBASE","IN_STORE","IN_MOL","IN_STOPER","IN_CURCOURS","IN_CURBASE","VALID_DOCTYPE","VALID_DOCNUMB","VALID_DOCDATE","RECIPDOC","RECIPNUMB","RECIPDATE","FERRYMAN","GETCONFIRM","WAYBLADENUMB","DRIVER","CAR","ROUTE","TRAILER1","TRAILER2","COMMENTS","RESERVDATE","JUR_PERS" FROM PARUS.TRANSINVDEPT
-- ������ �� �������-����������� (��� ����������)
WHERE IN_STORE IN (SELECT STORE_RN FROM SNP_REPL.V_STORE_LIST)
-- ������ �� �������-������������ (������� ����������)
   OR STORE IN (SELECT STORE_RN FROM SNP_REPL.V_STORE_LIST);

