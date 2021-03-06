--
-- V_SNP_DISP_AZS_PSV  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_SNP_DISP_AZS_PSV
(BEG_DATE, END_DATE, STORE_RN, NOMEN_RN, OUT_O_PREV_VOL, 
 OUT_O_PREV_MAS, OUT_O_PREV_SUM, IN_VOL, IN_MAS, IN_SUM, 
 IN_HR_VOL, IN_HR_MAS, IN_HR_SUM, IN_I_VOL, IN_I_MAS, 
 IN_I_SUM, IN_O_VOL, IN_O_MAS, IN_O_SUM, OUT_VOL, 
 OUT_MAS, OUT_SUM, OUT_HR_VOL, OUT_HR_MAS, OUT_HR_SUM, 
 OUT_I_VOL, OUT_I_MAS, OUT_I_SUM, OUT_O_VOL, OUT_O_MAS, 
 OUT_O_SUM, OUT_O_VED_VOL, OUT_O_VED_MAS, OUT_O_VED_SUM, OUT_O_BK_VOL, 
 OUT_O_BK_MAS, OUT_O_BK_SUM, OUT_O_KR_VOL, OUT_O_KR_MAS, OUT_O_KR_SUM, 
 OUT_O_NAL_VOL, OUT_O_NAL_MAS, OUT_O_NAL_SUM, OUT_O_FIL_VOL, OUT_O_FIL_MAS, 
 OUT_O_FIL_SUM, OUT_O_LIC_VOL, OUT_O_LIC_MAS, OUT_O_LIC_SUM, END_VOLUME, 
 END_MASSA, END_FULL, END_WATER, IN_TTN_VOL, IN_TTN_MAS, 
 IN_TTN_SUM, OUT_O_1_VOL, OUT_O_1_MAS, OUT_O_2_VOL, OUT_O_2_MAS, 
 OUT_O_3_VOL, OUT_O_3_MAS, OUT_O_4_VOL, OUT_O_4_MAS, OUT_O_5_VOL, 
 OUT_O_5_MAS, OUT_O_6_VOL, OUT_O_6_MAS, OUT_O_7_VOL, OUT_O_7_MAS, 
 IN_LAST_VOL, IN_LAST_MAS, IN_LAST_SUM, IN_WAY_VOL, IN_WAY_MAS, 
 IN_WAY_SUM, STORE_CRN, STORE_CODE, STORE_NAME, STORE_DEP, 
 IS_TRANSIT, NOMEN_CODE, NOMEN_NAME, LAST_DAY, SM_NUMBER, 
 SM_BEGIN, SM_END)
AS 
SELECT /*+ RULE */
  A.BEG_DATE,
  A.END_DATE,
  C."STORE_RN",C."NOMEN_RN",C."OUT_O_PREV_VOL",C."OUT_O_PREV_MAS",C."OUT_O_PREV_SUM",C."IN_VOL",C."IN_MAS",C."IN_SUM",C."IN_HR_VOL",C."IN_HR_MAS",C."IN_HR_SUM",C."IN_I_VOL",C."IN_I_MAS",C."IN_I_SUM",C."IN_O_VOL",C."IN_O_MAS",C."IN_O_SUM",C."OUT_VOL",C."OUT_MAS",C."OUT_SUM",C."OUT_HR_VOL",C."OUT_HR_MAS",C."OUT_HR_SUM",C."OUT_I_VOL",C."OUT_I_MAS",C."OUT_I_SUM",C."OUT_O_VOL",C."OUT_O_MAS",C."OUT_O_SUM",C."OUT_O_VED_VOL",C."OUT_O_VED_MAS",C."OUT_O_VED_SUM",C."OUT_O_BK_VOL",C."OUT_O_BK_MAS",C."OUT_O_BK_SUM",C."OUT_O_KR_VOL",C."OUT_O_KR_MAS",C."OUT_O_KR_SUM",C."OUT_O_NAL_VOL",C."OUT_O_NAL_MAS",C."OUT_O_NAL_SUM",C."OUT_O_FIL_VOL",C."OUT_O_FIL_MAS",C."OUT_O_FIL_SUM",C."OUT_O_LIC_VOL",C."OUT_O_LIC_MAS",C."OUT_O_LIC_SUM",C."END_VOLUME",C."END_MASSA",C."END_FULL",C."END_WATER",C."IN_TTN_VOL",C."IN_TTN_MAS",C."IN_TTN_SUM",C."OUT_O_1_VOL",C."OUT_O_1_MAS",C."OUT_O_2_VOL",C."OUT_O_2_MAS",C."OUT_O_3_VOL",C."OUT_O_3_MAS",C."OUT_O_4_VOL",C."OUT_O_4_MAS",C."OUT_O_5_VOL",C."OUT_O_5_MAS",C."OUT_O_6_VOL",C."OUT_O_6_MAS",C."OUT_O_7_VOL",C."OUT_O_7_MAS",C."IN_LAST_VOL",C."IN_LAST_MAS",C."IN_LAST_SUM",C."IN_WAY_VOL",C."IN_WAY_MAS",C."IN_WAY_SUM",
  ds.nCRN as STORE_CRN,
  ds.sNUMB as STORE_CODE,
  ds.sNAME as STORE_NAME,
  ds.sDEP_READY as STORE_DEP,
  ds.IS_TRANSIT,
--  replace(NLS_UPPER(nom.NOMEN_CODE),'_��','') as NOMEN_CODE,
--  replace(NLS_UPPER(nom.NOMEN_NAME),'_��','') as NOMEN_NAME,
  nom.NOMEN_CODE,
  nom.NOMEN_NAME,
  B.LAST_DAY,
  B.SM_NUMBER,
  B.SM_BEGIN,
  B.SM_END
FROM
  vaneev.v_dicstore_psv@oracle.world ds,
  PARUS.DICNOMNS@oracle.world nom,
  MASTER.V_SNP_DISP_AZS_OPER_OST_PSV C,
  (
   SELECT /*+ RULE ���� ��������� ����� */
      STORE_RN,
      MAX(LAST_DAY) as LAST_DAY,
      MAX(SM_NUMBER) as SM_NUMBER,
      MAX(SM_BEGIN) as SM_BEGIN,
         MAX(SM_END) as SM_END
    FROM PARUS.TB_SNP_STORE_OST_PSV@oracle.world
    WHERE USER_ID=NLS_UPPER(SYS_CONTEXT('USERENV','OS_USER'))
      AND SOURCE_ID=0
    GROUP BY STORE_RN
  ) B,
  PARUS.TB_SNP_STORE_COND_PSV@oracle.world A
WHERE A.USER_ID=NLS_UPPER(SYS_CONTEXT('USERENV','OS_USER'))
  AND ds.NRN=C.STORE_RN
  AND ds.NRN=B.STORE_RN(+)
  AND C.NOMEN_RN=nom.RN;


