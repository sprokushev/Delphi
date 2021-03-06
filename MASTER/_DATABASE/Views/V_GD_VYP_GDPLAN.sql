--
-- V_GD_VYP_GDPLAN  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_GD_VYP_GDPLAN
(TIP_OTGR_1, KOD_NPR_1, EXPORT_1, PLAN_CIST, PLAN_VES, 
 PLAN_CSOB, PLAN_VSOB, N_PL_C, N_PL_V, N_PL_CS, 
 N_PL_VS, D_PL_C, D_PL_V, D_PL_CS, D_PL_VS, 
 NORM_TOT, NORM_MPS, NORM_SOB, KOD_GDPL)
AS 
SELECT /*+ RULE */ 
  1 AS tip_otgr_1, 
  NVL(GU12_BR.ID_NPR,V_GD_VYP_PRODRECODE.ID_NPR) AS kod_npr_1, -- NVL(A,B): if A<>null then Result := A else Result := B  
  DECODE(NVL(gu12_a.EXPED_ID,0),0,1,2) AS export_1, 
  SUM(GU12_BR.KOL_VAG) AS PLAN_CIST, 
  SUM(GU12_BR.VES) AS plan_ves, 
  SUM(CASE WHEN GU12_B.PRINVAG_ID<>207 THEN GU12_BR.KOL_VAG ELSE 0 END) AS PLAN_CSOB, 
  SUM(CASE WHEN GU12_B.PRINVAG_ID<>207 THEN GU12_BR.VES ELSE 0 END) AS PLAN_VSOB, 
  SUM(CASE WHEN gu12_br.DATE_R<=V_TEMP_VYP_GD_PARAMS.END_DATE THEN gu12_br.kol_vag ELSE 0 END) AS n_pl_c, 
  SUM(CASE WHEN gu12_br.DATE_R<=V_TEMP_VYP_GD_PARAMS.END_DATE THEN gu12_br.ves ELSE 0 END) AS n_pl_v, 
  SUM(CASE WHEN gu12_br.DATE_R<=V_TEMP_VYP_GD_PARAMS.END_DATE AND GU12_B.PRINVAG_ID<>207 THEN gu12_br.kol_vag ELSE 0 END) AS n_pl_cs, 
  SUM(CASE WHEN gu12_br.DATE_R<=V_TEMP_VYP_GD_PARAMS.END_DATE AND GU12_B.PRINVAG_ID<>207 THEN gu12_br.ves ELSE 0 END) AS n_pl_vs, 
  SUM(CASE WHEN gu12_br.DATE_R=V_TEMP_VYP_GD_PARAMS.END_DATE THEN gu12_br.kol_vag ELSE 0 END) AS d_pl_c, 
  SUM(CASE WHEN gu12_br.DATE_R=V_TEMP_VYP_GD_PARAMS.END_DATE THEN gu12_br.ves ELSE 0 END) AS d_pl_v, 
  SUM(CASE WHEN gu12_br.DATE_R=V_TEMP_VYP_GD_PARAMS.END_DATE AND GU12_B.PRINVAG_ID<>207 THEN gu12_br.kol_vag ELSE 0 END) AS d_pl_cs, 
  SUM(CASE WHEN gu12_br.DATE_R=V_TEMP_VYP_GD_PARAMS.END_DATE AND GU12_B.PRINVAG_ID<>207 THEN gu12_br.ves ELSE 0 END) AS d_pl_vs, 
  SUM(0) AS norm_tot, 
  SUM(0) AS norm_mps, 
  SUM(0) AS norm_sob, 
  NVL(p1.GD_KOD_NPR,p2.GD_KOD_NPR) AS kod_gdpl 
  FROM gu12_a,gu12_b,GU12_BR,V_GD_VYP_PRODRECODE,V_TEMP_VYP_GD_PARAMS,KLS_PROD p1,KLS_PROD p2 
  WHERE 
    gu12_br.ID_B=gu12_b.ID AND 
    gu12_b.ID_A=gu12_a.ID and 
    gu12_a.PROD_ID=V_GD_VYP_PRODRECODE.PROD_GU12_ID and 
    GU12_BR.DATE_R>=TRUNC(V_TEMP_VYP_GD_PARAMS.END_DATE,'MM') AND 
 GU12_BR.DATE_R<=LAST_DAY(V_TEMP_VYP_GD_PARAMS.END_DATE) AND 
-- GU12_B.ISCOR<>2 AND 
 GU12_BR.ID_NPR=p1.ID_NPR(+) AND 
 V_GD_VYP_PRODRECODE.ID_NPR=p2.ID_NPR(+) 
  GROUP BY 
    NVL(GU12_BR.ID_NPR,V_GD_VYP_PRODRECODE.ID_NPR), 
 NVL(p1.GD_KOD_NPR,p2.GD_KOD_NPR), 
 DECODE(NVL(gu12_a.EXPED_ID,0),0,1,2)
UNION ALL

SELECT /* RULE */ 
  2 AS tip_otgr_1, -- 2  
  P1.ID_NPR AS kod_npr_1, --- P1.ID_NPR
  1 AS export_1, --- 1 EXPED_ID=Null -> 1 else 2 - ����������
  0 AS PLAN_CIST, ---0
  SUM(ZAKAZ.VES) AS PLAN_VES, -- ZAKAZ.VES
  0 AS PLAN_CSOB,   --0
  SUM(ZAKAZ.VES) AS PLAN_VSOB, -- ZAKAZ.VES
  0 AS n_pl_c, --0
  0 AS n_pl_v, --0
  0 AS n_pl_cs,--0 
  SUM(CASE WHEN ZAKAZ.BEGIN_DATE<=V_TEMP_VYP_GD_PARAMS.END_DATE THEN ZAKAZ.VES ELSE 0 END) AS n_pl_vs, --ZAKAZ.VES
  0 AS d_pl_c,--0 
  0 AS d_pl_v,--0 
  0 AS d_pl_cs,--0 
  SUM(CASE WHEN ZAKAZ.BEGIN_DATE<=V_TEMP_VYP_GD_PARAMS.END_DATE THEN ZAKAZ.VES ELSE 0 END) AS d_pl_vs, --ZAKAZ.VES
  0 AS norm_tot, 
  0 AS norm_mps, 
  0 AS norm_sob, 
  '' AS kod_gdpl 
FROM ZAKAZ, V_TEMP_VYP_GD_PARAMS, KLS_PROD P1 
  WHERE 
    zakaz.IS_AGENT=1 AND -- ������ ��� 
--    ZAKAZ.PERIOD_ID=0 AND  -- ������ ������������ - �����
    ZAKAZ.BEGIN_DATE>=TRUNC(V_TEMP_VYP_GD_PARAMS.END_DATE,'MM') AND 
    ZAKAZ.BEGIN_DATE<=LAST_DAY(V_TEMP_VYP_GD_PARAMS.END_DATE) AND 
    ZAKAZ.PROD_ID_NPR=p1.ID_NPR(+) AND
    ZAKAZ.LOAD_ABBR='���'  -- ���������
  GROUP BY 
    P1.ID_NPR;


