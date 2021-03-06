--
-- V_ARH_BILLRECPACTDOC  (View) 
--
CREATE OR REPLACE FORCE VIEW SNP_REPL.V_ARH_BILLRECPACTDOC
(RN, PRN, COMPANY, CRN, FACEACC, 
 AGENT, VDOC_TYPE, VDOC_NUMB, VDOC_DATE, VDOC_VALUE, 
 VDOC_VALUE_BASE, BALUNIT)
AS 
SELECT /*+ RULE */ "RN","PRN","COMPANY","CRN","FACEACC","AGENT","VDOC_TYPE","VDOC_NUMB","VDOC_DATE","VDOC_VALUE","VDOC_VALUE_BASE","BALUNIT" FROM PARUS.BILLRECPACTDOC
WHERE PRN IN (SELECT RN FROM PARUS.BILLRECPACT);


