--
-- V_UNP_BUDJET_NPR  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_UNP_BUDJET_NPR
(BEGIN_DATE, END_DATE, PLAT_NAME, BEGIN_DEB, BEGIN_DEB_PROSR, 
 BEGIN_DEB_CUR, BEGIN_DEB_NEXT, BEGIN_KRED, SUMMA_DOK_CUR, SUMMA_DOK_NEXT, 
 SUMMA_PAYED, SUMMA_TOPAY, END_DEB, END_DEB_PROSR, END_DEB_CUR, 
 END_KRED)
AS 
SELECT
  a.begin_date,
  a.end_date,
  KLS_PREDPR.SF_NAME as PLAT_NAME,
  NVL(SUM(A.begin_deb),0) AS begin_deb, -- ������������� � ���������� �������
  NVL(SUM(A.begin_deb_prosr),0) AS begin_deb_prosr, -- ���������� ������������� � ���������� �������
  NVL(SUM(A.begin_deb_cur),0) AS begin_deb_cur, -- ������������� �������� ������� � ��������� � �������
  NVL(SUM(A.begin_deb_next),0) AS begin_deb_next, -- ������������� �������� ������� � ��������� � �������
  NVL(SUM(A.begin_kred),0) AS begin_kred, -- ���������� � ���������� �������
  NVL(SUM(A.summa_dok_cur),0) AS summa_dok_cur, -- ��������� � ������� �������, � ��������� � ������� �������
  NVL(SUM(A.summa_dok_next),0) AS summa_dok_next, -- ��������� � ������� �������, � ��������� � ��������� �������
  NVL(SUM(A.summa_payed),0) AS summa_payed, -- �������� � ������� �������
  NVL(SUM(A.summa_topay),0) AS summa_topay, -- �� ��������� ������ � ������� �������
  NVL(SUM(A.end_deb),0) AS end_deb, -- ������������� �� ����� �������� ������� (��� ��������)
  NVL(SUM(A.end_deb_prosr),0) AS end_deb_prosr, -- ���������� ������������� �� ����� �������� ������� (��� ��������)
  NVL(SUM(A.end_deb_cur),0) AS end_deb_cur, -- ������� ������������� �� ����� �������� ������� (��� ��������)
  NVL(SUM(A.end_kred),0) AS end_kred -- ���������� �� ����� �������� ������� (��� ��������)
FROM
(
SELECT /*+ ORDERED USE_NL(bills,pay,r) */
  r.begin_date,
  r.end_date,
  bills.DOG_ID,
  (CASE
     WHEN bills.date_kvit<r.begin_date THEN bills.LUK_SUMMA_DOK-NVL(pay.begin_summa,0)
	 ELSE 0
   END) AS begin_deb, -- ������������� ����������� �������
  (CASE
     WHEN bills.date_kvit<r.begin_date AND bills.date_plat<r.begin_date THEN bills.LUK_SUMMA_DOK-NVL(pay.begin_summa,0)
	 ELSE 0
   END) AS begin_deb_prosr, -- ���������� ������������� ����������� �������
  (CASE
     WHEN bills.date_kvit<r.begin_date AND bills.date_plat>=r.begin_date AND bills.date_plat<=LAST_DAY(r.end_date) THEN bills.LUK_SUMMA_DOK-NVL(pay.begin_summa,0)
	 ELSE 0
   END) AS begin_deb_cur, -- ������������� �������� ������� � ��������� � �������
  (CASE
     WHEN bills.date_kvit<r.begin_date AND bills.date_plat>LAST_DAY(r.end_date) THEN bills.LUK_SUMMA_DOK-NVL(pay.begin_summa,0)
	 ELSE 0
   END) AS begin_deb_next, -- ������������� �������� ������� � ��������� � ���������
  0 AS begin_kred, -- ���������� � ���������� �������
  (CASE
     WHEN bills.date_kvit>=r.begin_date AND bills.date_plat<=LAST_DAY(r.end_date) THEN bills.LUK_SUMMA_DOK
	 ELSE 0
   END) AS summa_dok_cur, -- ��������� � ������� �������, � ��������� � ������� �������
  (CASE
     WHEN date_kvit>=r.begin_date AND bills.date_plat>LAST_DAY(r.end_date) THEN bills.LUK_SUMMA_DOK
	 ELSE 0
   END) AS summa_dok_next, -- ��������� � ������� �������, � ��������� � ��������� �������
  NVL(pay.summa,0) AS summa_payed, -- �������� � ������� �������
  0 AS summa_topay, -- �� ��������� ������ � ������� �������
  bills.LUK_SUMMA_DOK-NVL(pay.end_summa,0) AS end_deb, -- ������������� �� ����� �������� ������� (��� ��������)
  (CASE
     WHEN bills.date_plat<=LAST_DAY(r.end_date) THEN bills.LUK_SUMMA_DOK-NVL(pay.end_summa,0)
	 ELSE 0
   END) AS end_deb_prosr, -- ������������ ������������� �� ����� �������� ������� (��� ��������)
  (CASE
     WHEN bills.date_plat>LAST_DAY(r.end_date) THEN bills.LUK_SUMMA_DOK-NVL(pay.end_summa,0)
	 ELSE 0
   END) AS end_deb_cur, -- ������� ������������� �� ����� �������� ������� (��� ��������)
  0 AS end_kred -- ���������� �� ����� �������� ������� (��� ��������)
FROM bills,
	(SELECT
	   payments_on_bills.nom_dok,
	   SUM(CASE
	         WHEN date_realiz<r.begin_date THEN payments_on_bills.summa
			 ELSE 0
		   END) AS begin_summa, -- ���������� ����������� �������
	   SUM(CASE
	         WHEN date_realiz>=r.begin_date THEN payments_on_bills.summa
			 ELSE 0
		   END) AS summa,  -- ���������� �������� �������
	   	SUM(payments_on_bills.summa) as end_summa -- �������� �����
	 FROM payments_on_bills,payments,(SELECT * FROM V_MASTER_REPORTS WHERE NLS_UPPER(REPORT_FILE)='UNP_FIN_BUDGET.XLS') r
     WHERE payments_on_bills.payments_id=payments.id and
		 payments_on_bills.date_realiz<=r.end_date and
		 payments.date_post<=r.end_date
	 GROUP BY nom_dok) pay, -- ����������� ������
	(SELECT * FROM V_MASTER_REPORTS WHERE NLS_UPPER(REPORT_FILE)='UNP_FIN_BUDGET.XLS') r
where
  bills.nom_dok=pay.nom_dok(+) and
  bills.DATE_KVIT>=TO_DATE('01.01.2005','dd.mm.yyyy') and
  bills.date_kvit<=r.end_date
--
UNION ALL
--
SELECT
  r.begin_date,
  r.end_date,
  b.DOG_ID,
  0 AS begin_deb, -- ������������� � ���������� �������
  0 AS begin_deb_prosr, -- ���������� ������������� � ���������� �������
  0 AS begin_deb_cur, -- ������������� �������� ������� � ��������� � �������
  0 AS begin_deb_next, -- ������������� �������� ������� � ��������� � ���������
  a.begin_summa AS begin_kred, -- ���������� � ���������� �������
  0 AS summa_dok_cur, -- ��������� � ������� �������, � ��������� � ������� �������
  0 AS summa_dok_next, -- ��������� � ������� �������, � ��������� � ��������� �������
  0 AS summa_payed, -- �������� � ������� �������
  a.summa AS summa_topay, -- �� ��������� ������ � ������� �������
  0 AS end_deb, -- ������������� �� ����� �������� ������� (��� ��������)
  0 AS end_deb_prosr, -- ���������� ������������� �� ����� �������� ������� (��� ��������)
  0 AS end_deb_cur, -- ������� ������������ �� ����� �������� ������� (��� ��������)
  a.end_summa AS end_kred -- �� ��������� ������ �� ����� �������� ������� (��� ��������)
FROM
  (
    SELECT
       payments.ID,
       (CASE
	      WHEN date_post<r.begin_date THEN payments.SUMMA
		  ELSE 0
	 	END) AS begin_summa, -- ������ �� ����� ����������� �������
	   (CASE
	      WHEN date_post>=r.begin_date AND date_post<=r.end_date THEN payments.SUMMA
	 	  ELSE 0
		 END) AS summa,  -- ������ � ������� �������� �������
	   (CASE
	      WHEN date_post<=r.end_date THEN payments.SUMMA
	 	  ELSE 0
		 END) AS end_summa  -- ������ �� ����� �������� �������
     FROM payments, (SELECT * FROM V_MASTER_REPORTS WHERE NLS_UPPER(REPORT_FILE)='UNP_FIN_BUDGET.XLS') r
     UNION ALL
     SELECT
       pb.PAYMENTS_ID,
       (CASE
	      WHEN p.date_post<r.begin_date AND pb.date_realiz<r.begin_date THEN -pb.SUMMA
		  ELSE 0
	 	END) AS begin_summa, -- ���������� ����������� �������
	   (CASE
	      WHEN p.date_post>=r.begin_date AND p.date_post<=r.end_date THEN -pb.SUMMA
	 	  ELSE 0
		 END) AS summa,  -- ���������� �� ����� �������� �������
	   (CASE
	      WHEN p.date_post<=r.end_date THEN -pb.SUMMA
	 	  ELSE 0
		 END) AS end_summa -- ���������� �� ����� �������� �������
     FROM payments_on_bills pb, payments p, (SELECT * FROM V_MASTER_REPORTS WHERE NLS_UPPER(REPORT_FILE)='UNP_FIN_BUDGET.XLS') r
	 WHERE pb.date_realiz<=r.end_date
	   AND pb.PAYMENTS_ID=p.id
  ) a,payments b, (SELECT * FROM V_MASTER_REPORTS WHERE NLS_UPPER(REPORT_FILE)='UNP_FIN_BUDGET.XLS') r
WHERE a.id=b.id
  AND b.date_post<=r.end_date
) A, KLS_DOG,KLS_PREDPR
WHERE A.DOG_ID=KLS_DOG.ID
  AND KLS_DOG.PREDPR_ID=KLS_PREDPR.ID
GROUP BY
  A.begin_date,
  A.end_date,
  KLS_PREDPR.SF_NAME;


