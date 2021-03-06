--
-- V_NPR_PRICES  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_NPR_PRICES
(ID, CAT_CEN_ID, PROD_ID_NPR, CENA, NDS20, 
 NGSM25, AKCIZ, CENA_OTP, BEGIN_DATE, END_DATE, 
 INPUT_DATE, OWNERSHIP_ID, SUPPLIER_ID, PROTOKOL_DATE, PROTOKOL_NUM, 
 IS_ORIGINAL, PROTOKOL_BEGIN_DATE, CENA_NPO, NDS20_NPO, CENA_OTP_NPO)
AS 
SELECT 
  ID, 
  CAT_CEN_ID, 
  PROD_ID_NPR, 
  CENA      , 
  NDS20     , 
  NGSM25    , 
  AKCIZ     , 
  CENA_OTP  , 
  BEGIN_DATE , 
  TRUNC(DECODE(END_DATE,NULL,TO_DATE('31.12.2200','dd.mm.yyyy'),END_DATE),'DD') AS NEW_END_DATE  , 
  INPUT_DATE , 
  OWNERSHIP_ID  , 
  SUPPLIER_ID   , 
  PROTOKOL_DATE , 
  PROTOKOL_NUM  , 
  IS_ORIGINAL   , 
  PROTOKOL_BEGIN_DATE, 
  CENA_NPO, 
  NDS20_NPO, 
  CENA_OTP_NPO 
FROM NPR_PRICES 
WHERE IS_ORIGINAL=1 
ORDER BY CAT_CEN_ID,PROD_ID_NPR,BEGIN_DATE,NEW_END_DATE;


