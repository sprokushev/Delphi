--
-- V_TARIF_NO_RAIL_SF  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_TARIF_NO_RAIL_SF
(BEG_DATE, END_DATE, IS_AGENT, PLAT_ID, PLAT_NAME, 
 DOG_ID, DOG_NUMBER, DOG_DATE, DATE_KVIT, ORIG_NOM_SF, 
 DATE_VYP_SF, PROD_ID_NPR, PROD_NAME, PROD_EDIZ, NOM_ZD, 
 NUM_KVIT, VES, SUMMA_TARIF, SUMMA_TARIF_NDS, SUMMA_OHRANA, 
 SUMMA_OHRANA_NDS)
AS 
SELECT /*+ RULE */
  -- ��������������� ����� (��� ����� �� ���)
  TRUNC(KVIT.DATE_KVIT,'MONTH') AS BEG_DATE, -- ������� ������
  LAST_DAY(KVIT.DATE_KVIT) AS END_DATE, -- �������� ������
  BILLS.IS_AGENT,
  KLS_DOG.PREDPR_ID AS PLAT_ID,
  PLAT.SF_NAME AS PLAT_NAME,
  BILLS.DOG_ID AS DOG_ID,
  KLS_DOG.DOG_NUMBER AS DOG_NUMBER,
  KLS_DOG.DOG_DATE AS DOG_DATE,
  BILLS.DATE_KVIT,
  BILLS.NOM_SF AS ORIG_NOM_SF,
  BILLS.DATE_VYP_SF AS DATE_VYP_SF,
  KLS_PROD.ID_NPR AS PROD_ID_NPR,
  KLS_PROD.SF_NAME AS PROD_NAME,
  KLS_PROD.ED_IZ AS PROD_EDIZ,
  KVIT.NOM_ZD,
  KVIT.NUM_KVIT,
  SUM(KVIT.VES_BRUTTO) AS VES,
  SUM(NVL(KVIT.TARIF,0)+NVL(KVIT.TARIF_NDS,0)) AS SUMMA_TARIF,
  SUM(NVL(KVIT.TARIF_NDS,0)) AS SUMMA_TARIF_NDS,
  SUM(NVL(KVIT.TARIF_GUARD,0)+NVL(KVIT.TARIF_GUARD_NDS,0)) AS SUMMA_OHRANA,
  SUM(NVL(KVIT.TARIF_GUARD_NDS,0)) AS SUMMA_OHRANA_NDS
FROM (select * from V_MASTER_REPORTS where UPPER(REPORT_FILE)='TARIF_NO_RAIL_SF.XLS') r,
  BILLS, KVIT, SVED, KLS_DOG, KLS_PREDPR PLAT, KLS_PROD 
WHERE BILLS.DOG_ID = KLS_DOG.ID
  AND KLS_DOG.PREDPR_ID = PLAT.ID
  AND BILLS.NOM_DOK = KVIT.BILL_ID
  AND KVIT.PROD_ID_NPR = KLS_PROD.ID_NPR
  AND KVIT.DATE_KVIT BETWEEN r.BEGIN_DATE AND r.END_DATE
  AND KVIT.SVED_ID=SVED.ID(+)  
  -- ������� ������
  AND NOT EXISTS (SELECT NULL FROM REESTR_RAIL_RGD_SF rail_sf 
               WHERE kvit.PERECH_TEXPD_DATE=rail_sf.dat_perech
                 AND KVIT.PERECH_TEXPD_NUM=rail_sf.nom_perech
                 AND r21=95)  
  AND BILLS.IS_AGENT IN (2,4,5)
GROUP BY
  TRUNC(KVIT.DATE_KVIT,'MONTH'), -- ������� ������
  LAST_DAY(KVIT.DATE_KVIT), -- �������� ������
  BILLS.IS_AGENT,
  KLS_DOG.PREDPR_ID,
  PLAT.SF_NAME,
  BILLS.DOG_ID,
  KLS_DOG.DOG_NUMBER,
  KLS_DOG.DOG_DATE,
  BILLS.DATE_KVIT,
  BILLS.NOM_SF,
  BILLS.DATE_VYP_SF,
  KLS_PROD.ID_NPR,
  KLS_PROD.SF_NAME,
  KLS_PROD.ED_IZ,
  KVIT.NOM_ZD,
  SVED.SVED_NUM,
  KVIT.DATE_OTGR,
  KVIT.NUM_KVIT
HAVING SUM(NVL(KVIT.TARIF,0)+NVL(KVIT.TARIF_NDS,0))>0;


