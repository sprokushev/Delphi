--
-- V_UNP_GRAFIK_NEW  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_UNP_GRAFIK_NEW
(PROD_NAME, BEGIN_DATE, END_DATE, PREDPR_NAME, DOG_NUMBER, 
 DOG_ID, KOL_DN, DATE_PLAT, SUMMA_PRED, SUMMA_PLAN, 
 SUMMA_FACT)
AS 
SELECT
  KLS_PROD.LONG_NAME_NPR as PROD_NAME,
  r.BEGIN_DATE,
  LAST_DAY(r.END_DATE) as END_DATE,
  KLS_PREDPR.SF_NAME as  PREDPR_NAME,
  a.DOG_NUMBER,
  a.DOG_ID,
  GET_KOL_DN(a.DOG_ID,r.BEGIN_DATE,r.END_DATE,r.PROD_ID_NPR) as KOL_DN,
  a.DATE_PLAT,
  a.SUMMA_PRED,
  a.SUMMA_PLAN,
  a.SUMMA_FACT
FROM
  (
    SELECT
	  KLS_DOG.PREDPR_ID,
	  KLS_DOG.DOG_NUMBER,
	  a.DOG_ID,
	  DATE_PLAT,
	  SUM(SUMMA_PRED) as SUMMA_PRED,
	  SUM(SUMMA_PLAN) as SUMMA_PLAN,
	  SUM(SUMMA_FACT) as SUMMA_FACT
	FROM
      (
	   -- ������������ ������������� 
       SELECT
         plan.DOG_ID,
         plan.DATE_PLAT as DATE_PLAT,
         0 as SUMMA_PRED,
         plan.SUMMA_PLAT as SUMMA_PLAN,
         0 as SUMMA_FACT
       FROM MASTER.V_UNP_GRAFIK_PROSR plan
       --
       UNION ALL
	   -- �����������
       SELECT
         sf.DOG_ID,
         sf.DATE_PRED as DATE_PLAT,
         sf.SUMMA_PRED as SUMMA_PRED,
         0 as SUMMA_PLAN,
         0 as SUMMA_FACT
       FROM MASTER.V_UNP_GRAFIK_PRED_SF sf
	   --
       UNION ALL
       -- ����������� ��������
       SELECT
         sf.DOG_ID,
         sf.DATE_PRED as DATE_PLAT,
         sf.SUMMA_PRED as SUMMA_PRED,
         0 as SUMMA_PLAN,
         0 as SUMMA_FACT
       FROM MASTER.V_UNP_GRAFIK_PLAN_SF sf
	   --
       UNION ALL
       -- ����������� ������ ����������� ��������
       SELECT
         sf.DOG_ID,
         sf.DATE_PRED+sf.KOL_DN as DATE_PLAT,
         0 as SUMMA_PRED,
         sf.SUMMA_PRED as SUMMA_PLAN,
         0 as SUMMA_FACT
       FROM MASTER.V_UNP_GRAFIK_PLAN_SF sf
	   --
       UNION ALL
       -- ����������� ������
       SELECT
         plan.DOG_ID,
         plan.DATE_PLAT as DATE_PLAT,
         0 as SUMMA_PRED,
         plan.SUMMA_PLAT as SUMMA_PLAN,
         0 as SUMMA_FACT
       FROM MASTER.V_UNP_GRAFIK_PLAN_PAY plan
       --
       UNION ALL
       -- ��������
       SELECT
         fact.DOG_ID,
         fact.DATE_PLAT as DATE_PLAT,
         0 as SUMMA_PRED,
         0 as SUMMA_PLAN,
         fact.SUMMA_PLAT as SUMMA_FACT
       FROM MASTER.V_UNP_GRAFIK_FACT_PAY fact
      ) a, KLS_DOG
	WHERE a.DOG_ID=KLS_DOG.ID
	  AND kls_dog.AGENT_ID in (8,4175)
	GROUP BY
	  KLS_DOG.PREDPR_ID,
	  KLS_DOG.DOG_NUMBER,
	  a.DOG_ID,
	  DATE_PLAT
	) a,V_TEMP_UNP_GARFIK_PARAMS r,KLS_PROD,KLS_PREDPR
WHERE r.GRP_ID_NPR=KLS_PROD.ID_NPR(+)
  AND a.PREDPR_ID=KLS_PREDPR.ID
ORDER BY
  KLS_PREDPR.SF_NAME,
  a.DOG_NUMBER,
  a.DOG_ID,
  a.DATE_PLAT;


