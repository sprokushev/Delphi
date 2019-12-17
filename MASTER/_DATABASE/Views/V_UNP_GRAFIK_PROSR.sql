--
-- V_UNP_GRAFIK_PROSR  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_UNP_GRAFIK_PROSR
(DOG_ID, DATE_PLAT, SUMMA_PLAT)
AS 
SELECT /* RULE */
  aa.dog_id,
  aa.date_plat,
  SUM(aa.summa_plat) as summa_plat
FROM
(
  SELECT /*+ ORDERED USE_NL (c, a, b, bp, kls_dog) USE_HASH (kls_prod) */ -- ����������� �������
    c.dog_id,
    r.BEGIN_DATE-1 as date_plat, -- ����������� ���� �������
    SUM(-a.SUMMA) AS summa_plat -- ����������� ����� �������
  FROM V_TEMP_UNP_GARFIK_PARAMS r, payments c, payments_on_bills a, bill_pos bp, bills b, kls_dog, kls_prod
  WHERE c.DATE_POST<r.BEGIN_DATE
    AND c.ID=a.PAYMENTS_ID
    AND a.NOM_DOK=bp.nom_dok
 AND a.BILL_POS_ID=bp.BILL_POS_ID
 AND bp.NOM_DOK=b.NOM_DOK
 AND bp.PROD_ID_NPR=KLS_PROD.ID_NPR
    AND kls_prod.ID_GROUP_NPR>=DECODE(r.GRP_ID_NPR,'*','00000',r.GRP_ID_NPR)
    AND kls_prod.ID_GROUP_NPR<=DECODE(r.GRP_ID_NPR,'10100','99999','*','99999',r.GRP_ID_NPR)
    AND b.dog_id=kls_dog.id
    AND kls_dog.predpr_id=DECODE(r.PLAT_ID,0,kls_dog.predpr_id,r.PLAT_ID)
    AND kls_dog.dog_number like r.DOG_NUMBER
 AND bp.IS_LUK+0=1
  GROUP BY
    c.dog_id,
    r.BEGIN_DATE-1
  --
  UNION ALL
  --
  SELECT /*+ ORDERED USE_HASH (kls_dog)  */ -- �� ����������� �������
    b.dog_id,
    r.BEGIN_DATE-1 as date_plat, -- ���� �������
    sum(-a.summa) as summa_plat -- ����� �������
  FROM V_TEMP_UNP_GARFIK_PARAMS r, payments b,
    (
     SELECT
       payments.ID,
       payments.SUMMA
     FROM payments
     UNION ALL
     SELECT
       payments_on_bills.PAYMENTS_ID,
       -payments_on_bills.SUMMA
     FROM payments_on_bills
    ) a, kls_dog
  WHERE b.DATE_POST<r.BEGIN_DATE
    AND r.GRP_ID_NPR='*' -- ����������, ����� ����� �� ���� ���������
    AND a.id=b.id
    AND b.dog_id=kls_dog.id
    AND kls_dog.predpr_id=DECODE(r.PLAT_ID,0,kls_dog.predpr_id,r.PLAT_ID)
    AND kls_dog.dog_number like r.DOG_NUMBER
  GROUP BY b.dog_id,r.BEGIN_DATE-1
  --
  UNION ALL
  --
  SELECT /*+ ORDERED INDEX (b BILLS_DATE_PLAT_I) USE_HASH (kls_prod) */ -- �����-�������
    b.dog_id,
    r.BEGIN_DATE-1 as date_plat, -- ��������� ���� �������
    SUM(bp.summa) AS summa_plat -- ��������� ����� �������
  FROM V_TEMP_UNP_GARFIK_PARAMS r, bills b, bill_pos bp,  kls_dog, kls_prod
  WHERE b.DATE_PLAT >= TO_DATE('01.01.2005','dd.mm.yyyy')
    AND b.DATE_PLAT < r.BEGIN_DATE
 AND bp.NOM_DOK=b.NOM_DOK
 AND bp.PROD_ID_NPR=KLS_PROD.ID_NPR
    AND kls_prod.ID_GROUP_NPR>=r.FROM_GRP_ID
    AND kls_prod.ID_GROUP_NPR<=r.TO_GRP_ID
    AND b.dog_id=kls_dog.id
    AND kls_dog.predpr_id=(CASE WHEN r.PLAT_ID=0 THEN kls_dog.predpr_id ELSE r.PLAT_ID END)
    AND kls_dog.dog_number like r.DOG_NUMBER
 AND bp.IS_LUK+0=1
  GROUP BY
    b.dog_id,
    r.BEGIN_DATE-1
) aa
GROUP BY
  aa.dog_id,
  aa.date_plat
HAVING sum(aa.summa_plat)<>0;


