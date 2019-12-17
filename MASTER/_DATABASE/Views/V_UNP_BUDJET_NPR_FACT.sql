--
-- V_UNP_BUDJET_NPR_FACT  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_UNP_BUDJET_NPR_FACT
(BEGIN_DATE, END_DATE, GROUP_ORDER, GROUP_NAME, PLAT_NAME, 
 BEGIN_DEB, BEGIN_DEB_PROSR, BEGIN_DEB_CUR, BEGIN_DEB_NEXT, BEGIN_KRED, 
 SUMMA_DOK_CUR, SUMMA_DOK_NEXT, SUMMA_PAYED, SUMMA_TOPAY, END_DEB, 
 END_DEB_PROSR, END_DEB_CUR, END_KRED)
AS 
SELECT
  a.begin_date,
  a.end_date,
  a.GROUP_ORDER,
  a.GROUP_NAME,
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
SELECT 
  r.begin_date,
  r.end_date,
  KLS_PROD_GROUPS.GROUP_ORDER,
  KLS_PROD_GROUPS.GROUP_NAME,
  bills.DOG_ID,
  SUM(CASE
     WHEN bills.date_kvit<r.begin_date THEN bills.LUK_SUMMA_DOK-NVL(pay.begin_summa,0)
  ELSE 0
   END) AS begin_deb, -- ������������� ����������� �������
  SUM(CASE
     WHEN bills.date_kvit<r.begin_date AND bills.date_plat<r.begin_date THEN bills.LUK_SUMMA_DOK-NVL(pay.begin_summa,0)
  ELSE 0
   END) AS begin_deb_prosr, -- ���������� ������������� ����������� �������
  SUM(CASE
     WHEN bills.date_kvit<r.begin_date AND bills.date_plat>=r.begin_date AND bills.date_plat<=LAST_DAY(r.end_date) THEN bills.LUK_SUMMA_DOK-NVL(pay.begin_summa,0)
  ELSE 0
   END) AS begin_deb_cur, -- ������������� �������� ������� � ��������� � �������
  SUM(CASE
     WHEN bills.date_kvit<r.begin_date AND bills.date_plat>LAST_DAY(r.end_date) THEN bills.LUK_SUMMA_DOK-NVL(pay.begin_summa,0)
  ELSE 0
   END) AS begin_deb_next, -- ������������� �������� ������� � ��������� � ���������
  0 AS begin_kred, -- ���������� � ���������� �������
  SUM(CASE
     WHEN bills.date_kvit>=r.begin_date AND bills.date_plat<=LAST_DAY(r.end_date) THEN bills.LUK_SUMMA_DOK
  ELSE 0
   END) AS summa_dok_cur, -- ��������� � ������� �������, � ��������� � ������� �������
  SUM(CASE
     WHEN date_kvit>=r.begin_date AND bills.date_plat>LAST_DAY(r.end_date) THEN bills.LUK_SUMMA_DOK
  ELSE 0
   END) AS summa_dok_next, -- ��������� � ������� �������, � ��������� � ��������� �������
  SUM(NVL(pay.summa,0)) AS summa_payed, -- �������� � ������� �������
  0 AS summa_topay, -- �� ��������� ������ � ������� �������
  SUM(bills.LUK_SUMMA_DOK-NVL(pay.end_summa,0)) AS end_deb, -- ������������� �� ����� �������� ������� (��� ��������)
  SUM(CASE
     WHEN bills.date_plat<=LAST_DAY(r.end_date) THEN bills.LUK_SUMMA_DOK-NVL(pay.end_summa,0)
  ELSE 0
   END) AS end_deb_prosr, -- ������������ ������������� �� ����� �������� ������� (��� ��������)
  SUM(CASE
     WHEN bills.date_plat>LAST_DAY(r.end_date) THEN bills.LUK_SUMMA_DOK-NVL(pay.end_summa,0)
  ELSE 0
   END) AS end_deb_cur, -- ������� ������������� �� ����� �������� ������� (��� ��������)
  0 AS end_kred -- ���������� �� ����� �������� ������� (��� ��������)
FROM bills,
 (SELECT   /*+ ORDERED INDEX (payments PAYMENTS_DATE_POST_I) INDEX (payments_on_bills PAYMENTS_ON_BILLS_PAY_ID) USE_NL (payments_on_bills) */
         payments_on_bills.nom_dok,
         SUM
            (CASE
                WHEN payments_on_bills.date_realiz <
                                      master_reports_master_reports.begin_date
                   THEN payments_on_bills.summa
                ELSE 0
             END
            ) AS begin_summa,                -- ���������� ����������� �������
         SUM
            (CASE
                WHEN payments_on_bills.date_realiz >=
                                      master_reports_master_reports.begin_date
                   THEN payments_on_bills.summa
                ELSE 0
             END
            ) AS summa,                         -- ���������� �������� �������
         SUM (payments_on_bills.summa) AS end_summa
    FROM master_reports master_reports_master_reports,
         payments,
         payments_on_bills
   WHERE payments_on_bills.payments_id = payments.ID
     AND payments_on_bills.date_realiz <=
                                        master_reports_master_reports.end_date
     AND payments.date_post <= master_reports_master_reports.end_date
     AND NLS_UPPER (master_reports_master_reports.report_file) =
                                                          'UNP_FIN_BUDGET.XLS'
     AND master_reports_master_reports.terminal_name =
                                                   MASTER.for_init.getcurrterm
     AND master_reports_master_reports.osuser_name =
                                                   MASTER.for_init.getcurruser
GROUP BY payments_on_bills.nom_dok) pay, -- ����������� ������
 (SELECT * FROM V_MASTER_REPORTS WHERE NLS_UPPER(REPORT_FILE)='UNP_FIN_BUDGET.XLS') r,
 KLS_PROD_GROUPS_DESC,KLS_PROD_GROUPS
where
  bills.nom_dok=pay.nom_dok(+) and
  bills.DATE_KVIT>=TO_DATE('01.01.2005','dd.mm.yyyy') and
  bills.date_kvit<=r.end_date and
  bills.PROD_ID_NPR=KLS_PROD_GROUPS_DESC.PROD_ID_NPR and
  KLS_PROD_GROUPS_DESC.PROD_GROUPS_ID=KLS_PROD_GROUPS.ID and
  KLS_PROD_GROUPS.PROD_TYPE_GRP_ID=10
GROUP BY
  r.begin_date,
  r.end_date,
  KLS_PROD_GROUPS.GROUP_ORDER,
  KLS_PROD_GROUPS.GROUP_NAME,
  bills.DOG_ID
--
UNION ALL
--
SELECT   master_reports_master_reports.begin_date,
         master_reports_master_reports.end_date, 2 AS group_order,
         '������� �� �����- � ������������' AS group_name, b.dog_id,
         0 AS begin_deb,                 -- ������������� � ���������� �������
                        0 AS begin_deb_prosr,
-- ���������� ������������� � ���������� �������
         0 AS begin_deb_cur,
-- ������������� �������� ������� � ��������� � �������
         0 AS begin_deb_next,
-- ������������� �������� ������� � ��������� � ���������
                             SUM (a.begin_summa) AS begin_kred,
         
-- ���������� � ���������� �������
         0 AS summa_dok_cur,
-- ��������� � ������� �������, � ��������� � ������� �������
         0 AS summa_dok_next,
-- ��������� � ������� �������, � ��������� � ��������� �������
         0 AS summa_payed,
-- �������� � ������� �������
                          SUM (a.summa) AS summa_topay,
-- �� ��������� ������ � ������� �������
         0 AS end_deb,
-- ������������� �� ����� �������� ������� (��� ��������)
         0 AS end_deb_prosr,
-- ���������� ������������� �� ����� �������� ������� (��� ��������)
         0 AS end_deb_cur,
-- ������� ������������ �� ����� �������� ������� (��� ��������)
                          SUM (a.end_summa) AS end_kred
    FROM (SELECT payments.ID,
                 (CASE
                     WHEN payments.date_post <
                                      master_reports_master_reports.begin_date
                        THEN payments.summa
                     ELSE 0
                  END
                 ) AS begin_summa,
                 
-- ������ �� ����� ����������� �������
                 (CASE
                     WHEN payments.date_post >=
                                      master_reports_master_reports.begin_date
                     AND payments.date_post <=
                                        master_reports_master_reports.end_date
                        THEN payments.summa
                     ELSE 0
                  END
                 ) AS summa,
                 
-- ������ � ������� �������� �������
                 (CASE
                     WHEN payments.date_post <=
                                        master_reports_master_reports.end_date
                        THEN payments.summa
                     ELSE 0
                  END
                 ) AS end_summa
            FROM payments, master_reports master_reports_master_reports
           WHERE NLS_UPPER (master_reports_master_reports.report_file) =
                                                          'UNP_FIN_BUDGET.XLS'
             AND master_reports_master_reports.terminal_name =
                                                   MASTER.for_init.getcurrterm
             AND master_reports_master_reports.osuser_name =
                                                   MASTER.for_init.getcurruser
          UNION ALL
          SELECT /*+
ORDERED */
                 pb.payments_id,
                 (CASE
                     WHEN p.date_post <
                                      master_reports_master_reports.begin_date
                     AND pb.date_realiz <
                                      master_reports_master_reports.begin_date
                        THEN -pb.summa
                     ELSE 0
                  END
                 ) AS begin_summa,           -- ���������� ����������� �������
                 (CASE
                     WHEN p.date_post >=
                                      master_reports_master_reports.begin_date
                     AND p.date_post <= master_reports_master_reports.end_date
                        THEN -pb.summa
                     ELSE 0
                  END
                 ) AS summa,           -- ���������� �� ����� �������� �������
                 (CASE
                     WHEN p.date_post <=
                                        master_reports_master_reports.end_date
                        THEN -pb.summa
                     ELSE 0
                  END
                 ) AS end_summa
            FROM master_reports master_reports_master_reports,
                 payments_on_bills pb,
                 payments p
           WHERE pb.date_realiz <= master_reports_master_reports.end_date
             AND pb.payments_id = p.ID
             AND NLS_UPPER (master_reports_master_reports.report_file) =
                                                          'UNP_FIN_BUDGET.XLS'
             AND master_reports_master_reports.terminal_name =
                                                   MASTER.for_init.getcurrterm
             AND master_reports_master_reports.osuser_name =
                                                   MASTER.for_init.getcurruser) a,
         payments b,
         master_reports master_reports_master_reports
   WHERE a.ID = b.ID
     AND b.date_post <= master_reports_master_reports.end_date
     AND NLS_UPPER (master_reports_master_reports.report_file) =
                                                          'UNP_FIN_BUDGET.XLS'
     AND master_reports_master_reports.terminal_name =
                                                   MASTER.for_init.getcurrterm
     AND master_reports_master_reports.osuser_name =
                                                   MASTER.for_init.getcurruser
GROUP BY master_reports_master_reports.begin_date,
         master_reports_master_reports.end_date,
         b.dog_id
  HAVING SUM (a.begin_summa) > 0 OR SUM (a.summa) > 0 OR SUM (a.end_summa) > 0) A, KLS_DOG,KLS_PREDPR
WHERE A.DOG_ID=KLS_DOG.ID
  AND KLS_DOG.PREDPR_ID=KLS_PREDPR.ID
GROUP BY
  A.begin_date,
  A.end_date,
  a.GROUP_ORDER,
  a.GROUP_NAME,
  KLS_PREDPR.SF_NAME;


