--
-- V_ARH_DAYTURNJOURNAL  (View) 
--
CREATE OR REPLACE FORCE VIEW SNP_REPL.V_ARH_DAYTURNJOURNAL
(RN, COMPANY, JURPERSONS, TURN_DATE, NOMEN, 
 CURRENCY, STORE, QUANT_IN, QUANTALT_IN, SUMM_IN, 
 QUANT_OUT, QUANTALT_OUT, SUMM_OUT, REMN_QUANT_BEG, REMN_QUANTALT_BEG, 
 REMN_SUMM_BEG, REMN_QUANT_END, REMN_QUANTALT_END, REMN_SUMM_END)
AS 
SELECT /*+ RULE */ "RN","COMPANY","JURPERSONS","TURN_DATE","NOMEN","CURRENCY","STORE","QUANT_IN","QUANTALT_IN","SUMM_IN","QUANT_OUT","QUANTALT_OUT","SUMM_OUT","REMN_QUANT_BEG","REMN_QUANTALT_BEG","REMN_SUMM_BEG","REMN_QUANT_END","REMN_QUANTALT_END","REMN_SUMM_END" FROM PARUS.DAYTURNJOURNAL
-- ������ �� ������� (������� ����������)
WHERE STORE IN (SELECT STORE_RN FROM SNP_REPL.V_STORE_LIST);

