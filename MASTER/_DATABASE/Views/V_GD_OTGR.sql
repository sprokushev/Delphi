--
-- V_GD_OTGR  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_GD_OTGR
(IS_AGENT, IS_AGENT_NAME, LUK_DOG_ID, LUK_DOG_NUMBER, LOAD_TYPE_ID, 
 DATE_OFORML, DATE_OTGR, DATE_KVIT, PROD_ID_NPR, IS_EXP, 
 CIST, VES)
AS 
SELECT
  KLS_DOG.IS_AGENT,
  KLS_DOG_MAIN.NAME as IS_AGENT_NAME,
  NVL(KLS_DOG_MAIN.DOG_ID,0) as LUK_DOG_ID,
  NVL(MAIN_DOG.DOG_NUMBER,'����������� ��������') as LUK_DOG_NUMBER,
  KLS_VID_OTGR.LOAD_TYPE_ID,
  KVIT.DATE_OFORML,
  KVIT.DATE_OTGR,
  KVIT.DATE_KVIT,
  KVIT.PROD_ID_NPR,
  MONTH.IS_EXP,
  1 AS CIST,
  DECODE(KVIT.VES,0,KVIT.VES_BRUTTO,KVIT.VES) AS VES
FROM KVIT,MONTH,KLS_VID_OTGR,KLS_DOG,KLS_DOG_MAIN, KLS_DOG MAIN_DOG
WHERE KVIT.NOM_ZD=MONTH.NOM_ZD
  AND MONTH.LOAD_ABBR=KLS_VID_OTGR.LOAD_ABBR
  AND MONTH.DOG_ID=KLS_DOG.ID
  AND KVIT.DATE_OTGR>=TO_DATE('01.04.2002','dd.mm.yyyy')
  AND KLS_DOG.IS_AGENT=KLS_DOG_MAIN.IS_AGENT
  AND KVIT.DATE_KVIT BETWEEN KLS_DOG_MAIN.FROM_DATE AND KLS_DOG_MAIN.TO_DATE
  AND KLS_DOG_MAIN.DOG_ID=MAIN_DOG.ID;


