--
-- V_GD_AGENT_2008_GU12  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_GD_AGENT_2008_GU12
(GU12_A_ID, ZAYV_NUM, ZAYV_DATE, FROM_DATE, TO_DATE, 
 BEGIN_DATE, END_DATE, RAZN_NUM, RAZN_DATE, STAN_ID, 
 STAN_NAME, PROD_ID, PROD_NAME, KOL, VES, 
 IS_KORR, FOX_KOD)
AS 
SELECT /*+ RULE */ 
  /* ��� ������, ����������� � �������� ������ */ 
  gu12_a.ID as GU12_A_ID, 
  gu12_a.NOM_Z as ZAYV_NUM, 
  gu12_a.REG_DATE as ZAYV_DATE, 
  gu12_a.FROM_DATE, 
  gu12_a.TO_DATE, 
  C.BEGIN_DATE, 
  C.END_DATE, 
  gu12_b.NOM_LETTER as RAZN_NUM, 
  gu12_b.DATE_LETTER as RAZN_DATE, 
  gu12_b.STAN_ID, 
  KLS_STAN.STAN_NAME, 
  KLS_PROD_GU12.ID as PROD_ID, 
  kls_prod_gu12.NAME_GU12 as PROD_NAME, 
  gu12_b.KOL_VAG as KOL, 
  gu12_b.VES as VES, 
  NVL(gu12_b.ISCOR,0) as IS_KORR, 
  GU12_B.FOX_KOD 
FROM gu12_a,gu12_b,v_master_reports C,kls_stan,kls_prod_gu12,KLS_DOG 
WHERE gu12_b.ID_A=gu12_a.id 
  AND gu12_b.PLAT_ID=KLS_DOG.PREDPR_ID
--  AND KLS_DOG.PREDPR_ID=FOR_TEMP.GET_AS_NUM('LC_PLAT','MASTER','GD_AGENT.XLS')
  AND KLS_DOG.DOG_NUMBER LIKE C.DOG_NUMBER
  --FOR_TEMP.GET_AS_NUM('LC_PLAT','MASTER','GD_AGENT.XLS') 
  AND gu12_a.from_date<=C.END_DATE 
  AND gu12_a.to_date>=C.BEGIN_DATE 
  AND NLS_UPPER(C.REPORT_FILE)='GD_AGENT_2008.XLS' 
  and gu12_a.PROD_ID=kls_prod_gu12.ID 
  AND gu12_a.PROD_ID<>201005 -- ��� �����
  AND gu12_a.PROD_ID<>213337 -- ��� ����� ���������
  AND gu12_b.STAN_ID=KLS_STAN.ID;


