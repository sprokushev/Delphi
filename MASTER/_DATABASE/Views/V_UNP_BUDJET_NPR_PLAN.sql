--
-- V_UNP_BUDJET_NPR_PLAN  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_UNP_BUDJET_NPR_PLAN
(BEGIN_DATE, END_DATE, GROUP_ORDER, GROUP_NAME, PLAT_NAME, 
 BEGIN_DEB, BEGIN_DEB_PROSR, BEGIN_DEB_CUR, BEGIN_DEB_NEXT, BEGIN_KRED, 
 SUMMA_DOK_CUR, SUMMA_DOK_NEXT, SUMMA_PAYED, SUMMA_TOPAY, END_DEB, 
 END_DEB_PROSR, END_DEB_CUR, END_KRED)
AS 
SELECT /*+ RULE */
--  max(kol_dn) as kol_dn,
  a.begin_date,
  a.end_date,
  KLS_PROD_GROUPS.GROUP_ORDER,
  KLS_PROD_GROUPS.GROUP_NAME,
  KLS_PREDPR.SF_NAME as PLAT_NAME,
  0 AS begin_deb, -- ������������� � ���������� �������
  0 AS begin_deb_prosr, -- ���������� ������������� � ���������� �������
  0 AS begin_deb_cur, -- ������������� �������� ������� � ��������� � �������
  0 AS begin_deb_next, -- ������������� �������� ������� � ��������� � �������
  0 AS begin_kred, -- ���������� � ���������� �������
  SUM(summa) AS summa_dok_cur, -- ����������� ��������� � ������� �������, � ��������� � ������� �������
  0 AS summa_dok_next, -- ��������� � ������� �������, � ��������� � ��������� �������
  0 AS summa_payed, -- �������� � ������� �������
  0 AS summa_topay, -- �� ��������� ������ � ������� �������
  SUM(summa) AS end_deb, -- ������������� �� ����� �������� ������� (��� ��������)
  SUM(summa) AS end_deb_prosr, -- ���������� ������������� �� ����� �������� ������� (��� ��������)
  0 AS end_deb_cur, -- ������� ������������� �� ����� �������� ������� (��� ��������)
  0 AS end_kred -- ���������� �� ����� �������� ������� (��� ��������)
FROM
(
SELECT
  aaaaa.begin_date,
  aaaaa.end_date,
  aaaaa.prod_id_npr,
  aaaaa.DOG_ID,
  kol_dn,
  (CASE
     WHEN KOL_OST>=KOL_DN THEN ROUND(summa * (KOL_OST-KOL_DN+1) / KOL_OST,2)
	 ELSE 0
   END) AS summa -- ����������� ��������� � ������� �������, � ��������� � ������� �������
FROM
(
SELECT /*+ RULE */
  aaaa.begin_date,
  aaaa.end_date,
  aaaa.prod_id_npr,
  aaaa.DOG_ID,
  SUM(aaaa.summa) AS summa, -- �������� ��������� � ������� ������ (���)
  GET_KOL_DN(aaaa.DOG_ID,aaaa.begin_date,aaaa.end_date,aaaa.PROD_ID_NPR) as KOL_DN, -- ���-�� ���� ��������
  LAST_DAY(aaaa.end_date) - aaaa.end_date as KOL_OST -- ���-�� ���� �������� �� ����� ������
FROM
(
SELECT --+ RULE
  -- ���� �������� � ������� (���)
  r.begin_date,
  r.end_date,
  bills.prod_id_npr,
  bills.DOG_ID,
  -bills.LUK_SUMMA_DOK AS summa -- ��������� � ������� ������ (���)
FROM bills,
	(SELECT * FROM V_MASTER_REPORTS WHERE NLS_UPPER(REPORT_FILE)='UNP_FIN_BUDGET.XLS') r
where
  bills.DATE_KVIT>=r.begin_date and
  bills.date_kvit<=r.end_date
UNION ALL
SELECT
  -- ���� �������� � ������ (���)
  aaa.begin_date,
  aaa.end_date,
  aaa.prod_id_npr,
  aaa.DOG_ID,
  ROUND((CASE
     WHEN aaa.CENA_BN=0 THEN NVL(aaa.PLAN_CENA,0)
	 ELSE aaa.CENA_BN
   END) * aaa.NDS * aaa.PLAN_VES,2) as summa -- ������������� � �������� � ������� ������ (���)
FROM
(
SELECT
  aa.begin_date,
  aa.end_date,
  aa.prod_id_npr,
  aa.DOG_ID,
  aa.PLAN_VES,
  aa.PLAN_CENA as PLAN_CENA,
  GET_CENA_BN(aa.DOG_ID,aa.end_date,aa.prod_id_npr) as CENA_BN,
  (100+FOR_BILLS.GetNDSValue(aa.end_date))/100 as NDS
FROM
(
SELECT
  -- ���� �������� � ������ (��)
  r.begin_date,
  r.end_date,
  a.prod_id_npr,
  a.DOG_ID,
  MAX(a.PLAN_CENA) as PLAN_CENA,
  SUM(a.PLAN_VES) as PLAN_VES-- ������������� � �������� � ������� ������ (��)
FROM plan_periods b,plan_post a,
	(SELECT * FROM V_MASTER_REPORTS WHERE NLS_UPPER(REPORT_FILE)='UNP_FIN_BUDGET.XLS') r
where b.PLAN_ID in (2,3) and
  b.DATE_PLAN=TRUNC(r.end_date,'MONTH') and
  a.PLAN_PER_ID=b.ID
GROUP BY
  r.begin_date,
  r.end_date,
  a.prod_id_npr,
  a.DOG_ID
) aa
) aaa
) aaaa
GROUP BY
  aaaa.begin_date,
  aaaa.end_date,
  aaaa.prod_id_npr,
  aaaa.DOG_ID
HAVING sum(summa)<>0
) aaaaa
) A, KLS_DOG,KLS_PREDPR,
	KLS_PROD_GROUPS_DESC,KLS_PROD_GROUPS
WHERE A.DOG_ID=KLS_DOG.ID
  AND KLS_DOG.PREDPR_ID=KLS_PREDPR.ID
  AND KLS_DOG.AGENT_ID in (8,4175) AND KLS_DOG.PREDPR_ID<>8 AND KLS_DOG.PREDPR_ID<>4175
  AND A.PROD_ID_NPR=KLS_PROD_GROUPS_DESC.PROD_ID_NPR and
  KLS_PROD_GROUPS_DESC.PROD_GROUPS_ID=KLS_PROD_GROUPS.ID and
  KLS_PROD_GROUPS.PROD_TYPE_GRP_ID=10
GROUP BY
  A.begin_date,
  A.end_date,
  KLS_PROD_GROUPS.GROUP_ORDER,
  KLS_PROD_GROUPS.GROUP_NAME,
  KLS_PREDPR.SF_NAME
HAVING  SUM(summa)>0;


