--
-- V_NEW_MONTH_SPECIF  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_NEW_MONTH_SPECIF
(ID, VBELN, NOM_ZD, DATE_RAZN, DATE_PLAN, 
 LOCK_STATUS, IS_EXP_NAME, IS_EXP, VBAK_VSBED, LOAD_NAME, 
 VBKD_TRATY, VAGONTYPE_NAME, LOAD_ABBR, LOAD_TYPE_ID, TYPE_OTGR_NAME, 
 VBAP_MATNR, PROD_NAME_NPR, PROD_ID_NPR, LUK_DOG_NUMBER, LUK_DOG_ID, 
 NPO_DOG_NUMBER, NPO_DOG_ID, DOG_NUMBER, DOG_ID, USL_NUMBER, 
 VBPA_KUNNR, PLAT_NAME, PLAT_ID, OT_LIFNR, GROTP_NAME, 
 GROTP_ID, TEX_PD_ID, VBAP_ROUTE, ROUTE_NAME, KNANF, 
 STANOTP_KOD, STANOTP_ID, STANOTP_NAME, KNEND, STAN_KOD, 
 STAN_ID, STAN_NAME, SH_KUNNR, POLUCH_NAME, POLUCH_ID, 
 POLUCH_GD_KOD, POTREB_NAME, POTREB_ID, VETKA_NAME, VETKA_ID, 
 OWNERSHIP_ID, VBAK_AUART, CONTRACTOR_ATTR, NAZN_OTG_ID, NAZN_OTG_NAME, 
 NP_OWNER, OWNER_NAME, OWNER_ID, NP_PRODR, PRODR_NAME, 
 PRODR_ID, SUPPLIER_ID, SUPPLIER_NAME, LGOBE, TARIF_CODE, 
 TRANSP_NUM, FORMA_2, FORMA_2_NAME, PRIM, GR4, 
 OSN_8, SLIV_V, DOP_CIST, OBOGR, VBKD_VSART, 
 VAGOWNER_NAME, TONN_DECLARED, CIST_DECLARED, TONN_ALLOW, CIST_ALLOW, 
 TONN_MIN, CIST_MIN, TONN_R, CIST_R, TONN_LOADED, 
 CIST_LOADED, GOSPROG_ID, GOSPROG_NAME, GP_NAPR_ID, GP_NAPR_NAME, 
 DATE_CEN, CENA, CENA_OTP, SUM_ZD, TARIF1TONN, 
 PLANSTRU_ID, PLANSTRU_NAME, UPDATE_DATE, UPDATE_FILE)
AS 
SELECT
  TO_CHAR(A.ID) AS ID, -- ID
  '' AS VBELN, -- ����� ���������� R3
  '' AS NOM_ZD, -- ����� ���������� ���
  TRUNC(SYSDATE) AS DATE_RAZN, -- ���� ����������
  TRUNC(SYSDATE,'MONTH') AS DATE_PLAN, -- �������� ����
  '0010' AS LOCK_STATUS, -- ������ ���������� ����������
  DECODE(dog.VIDDOG_ID,41,'�������',42,'�������','���������� �����') AS IS_EXP_NAME, DECODE(dog.VIDDOG_ID,41,1,42,1,0) AS IS_EXP, -- �����������
  '' AS VBAK_VSBED, NVL(C.LOAD_NAME,'') AS LOAD_NAME, '' AS VBKD_TRATY, '' AS VAGONTYPE_NAME, NVL(A.LOAD_ABBR,'') AS LOAD_ABBR, NVL(C.LOAD_TYPE_ID,1) AS LOAD_TYPE_ID, NVL(KLS_LOAD_TYPE.TYPE_OTGR_NAME,''), -- ��� ���������������
  '' AS VBAP_MATNR, KLS_PROD.NAME_NPR AS PROD_NAME_NPR, A.PROD_ID_NPR, -- �������
  DECODE(NVL(dog.MAINDOG_ID,0),0,'',DECODE(NVL(dog.LUKDOG_ID,0),0,dog.DOG_NUMBER,luk_dog.DOG_NUMBER)) AS LUK_DOG_NUMBER, DECODE(NVL(dog.MAINDOG_ID,0),0,0,DECODE(NVL(dog.LUKDOG_ID,0),0,dog.ID,dog.LUKDOG_ID)) AS LUK_DOG_ID, -- ������� ������-������
  DECODE(NVL(dog.MAINDOG_ID,0),0,dog.DOG_NUMBER,DECODE(NVL(dog.LUKDOG_ID,0),0,'',dog.DOG_NUMBER)) AS NPO_DOG_NUMBER, DECODE(NVL(dog.MAINDOG_ID,0),0,dog.ID,DECODE(NVL(dog.LUKDOG_ID,0),0,0,dog.ID)) AS NPO_DOG_ID, -- ������� ���-������
  DECODE(NVL(dog.LUKDOG_ID,0),0,DOG.DOG_NUMBER,DECODE(B.IS_AGENT,2,luk_dog.DOG_NUMBER,DOG.DOG_NUMBER)) AS DOG_NUMBER, DECODE(NVL(dog.LUKDOG_ID,0),0,DOG.ID,DECODE(B.IS_AGENT,2,dog.LUKDOG_ID,DOG.ID)) AS DOG_ID, -- ������� ����������
  0 AS USL_NUMBER, -- ����� �������
  '' AS VBPA_KUNNR, DECODE(NVL(dog.LUKDOG_ID,0),0,plat.PREDPR_NAME,DECODE(B.IS_AGENT,2,MAIN_PLAT.PREDPR_NAME,plat.PREDPR_NAME)) AS plat_name, DECODE(NVL(dog.LUKDOG_ID,0),0,dog.PREDPR_ID,DECODE(B.IS_AGENT,2,MAIN_DOG.PREDPR_ID,dog.PREDPR_ID)) AS plat_ID, -- ���������� �� �������� ����������
  '' AS OT_LIFNR, '��� "������-�����������������"' AS grotp_name, 2641 AS grotp_ID, -- ����������������
  0 AS TEX_PD_ID, -- ���������� ������
  '' AS VBAP_ROUTE, '' AS ROUTE_NAME, '' AS KNANF, STANOTP.STAN_KOD AS STANOTP_KOD, NVL(STANOTP.ID,0) AS STANOTP_ID, STANOTP.STAN_NAME AS STANOTP_NAME, '' AS KNEND, STAN.STAN_KOD, NVL(STAN.ID,0) AS STAN_ID, STAN.STAN_NAME, -- �������
  '' AS SH_KUNNR, poluch.PREDPR_NAME AS poluch_name, NVL(A.poluch_ID,0) AS poluch_ID, -- ���������������
  poluch.GD_KOD AS POLUCH_GD_KOD,
  potreb.PREDPR_NAME AS POTREB_NAME, NVL(A.potreb_ID,0) AS potreb_ID, -- �����������
  KLS_VETKA.VETKA_NAME AS VETKA_NAME, NVL(A.vetka_id,0) AS VETKA_ID, -- ����� ����������
  DECODE(NVL(dog.MAINDOG_ID,0),0,2,0) AS OWNERSHIP_ID, -- ��������� ������������� (0-����.�������,1-��������,2-�����)
  '' AS VBAK_AUART,
  0 AS CONTRACTOR_ATTR,
  DECODE(dog.VIDDOG_ID,41,5,42,5,DECODE(NVL(dog.MAINDOG_ID,0),0,4,1)) AS NAZN_OTG_ID, DECODE(dog.VIDDOG_ID,41,'������� (����������� ������� �������� ��������)',42,'������� (����������� ������� �������� ��������)',DECODE(NVL(dog.MAINDOG_ID,0),0,'������ �� ���������� ������������ ��������','����������� ������� �������� ��������')) AS NAZN_OTG_NAME, -- ���������� ��������
  '' AS NP_OWNER, DECODE(NVL(dog.MAINDOG_ID,0),0,plat.PREDPR_NAME,'�������� �������� "������"') AS owner_name, DECODE(NVL(dog.MAINDOG_ID,0),0,dog.PREDPR_ID,1) AS owner_ID, -- ����������� �/�
  '' AS NP_PRODR, '' AS prodr_name, 0 AS prodr_ID, -- ������������� �/�
  DECODE(NVL(dog.MAINDOG_ID,0),0,0,1) AS SUPPLIER_ID, DECODE(NVL(dog.MAINDOG_ID,0),0,'','�������� �������� "������"') AS SUPPLIER_NAME,
  '' AS LGOBE,
  '' AS TARIF_CODE, -- ��� ����.������
  '' AS TRANSP_NUM, -- N ����������
  0 AS FORMA_2, '' AS FORMA_2_NAME, -- ������ �� �.2
  A.PRIM, -- ����������
  A.GR4, -- ����� 4
  0 AS osn_8, -- ����� � 8-�����
  0 AS sliv_v, -- ������� ����
  0 AS dop_cist, -- �/�
  0 AS obogr, -- �������
  '' AS VBKD_VSART,
  '' AS VAGOWNER_NAME,
  A.VES_ALL AS TONN_DECLARED, -- ��������
  CEIL(A.VES_ALL/60) AS CIST_DECLARED, -- �������� ����.
  A.VES_ALL AS TONN_ALLOW, -- ���������
  CEIL(A.VES_ALL/60) AS CIST_ALLOW, -- ��������� ����.
  0 AS TONN_MIN, -- ����������
  0 AS CIST_MIN, -- ���������� ����.
  0 AS TONN_R,
  0 AS CIST_R,
  0 AS TONN_LOADED,
  0 AS CIST_LOADED,
  -1 AS GOSPROG_ID, '' AS GOSPROG_NAME, -- ������������
  0 AS GP_NAPR_ID, '' AS GP_NAPR_NAME, -- ���������� �� ��
  TRUNC(SYSDATE) AS DATE_CEN, -- ���� ����
  0 AS CENA, -- ���� ��� ���
  0 AS CENA_OTP, -- ��������� ����
  0 AS SUM_ZD, -- ����� �� �������
  0 AS TARIF1TONN, -- ����� �� 1 �����
  0 AS PLANSTRU_ID, '' AS PLANSTRU_NAME, -- ������� ����� ��������
  A.UPDATE_DATE,
  '' AS UPDATE_FILE
FROM SPECIF A, KLS_DOG dog, KLS_STAN stan, KLS_STAN stanotp, KLS_VIDDOG B, KLS_DOG MAIN_DOG, KLS_VID_OTGR C,
     KLS_LOAD_TYPE, KLS_PROD, KLS_DOG LUK_DOG, KLS_PREDPR plat, KLS_PREDPR main_plat, KLS_PREDPR poluch,
	 KLS_PREDPR potreb, KLS_VETKA
WHERE A.DOG_ID=dog.ID
  AND A.STANOTP_ID=stanotp.ID(+)
  AND A.STAN_ID=stan.ID(+)
  AND dog.MAINDOG_ID=MAIN_DOG.ID(+)
  AND MAIN_DOG.VIDDOG_ID=B.ID(+)
  AND A.LOAD_ABBR=C.LOAD_ABBR (+)
  AND C.LOAD_TYPE_ID=KLS_LOAD_TYPE.ID(+)
  AND A.PROD_ID_NPR=KLS_PROD.ID_NPR(+)
  AND dog.LUKDOG_ID=luk_dog.ID(+)
  AND dog.PREDPR_ID=plat.ID
  AND main_dog.PREDPR_ID=main_plat.ID(+)
  AND A.POLUCH_ID=poluch.ID(+)
  AND A.POTREB_ID=potreb.ID(+)
  AND A.VETKA_ID=KLS_VETKA.ID(+);


