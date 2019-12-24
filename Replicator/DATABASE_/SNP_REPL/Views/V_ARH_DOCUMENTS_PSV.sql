--
-- V_ARH_DOCUMENTS_PSV  (View) 
--
CREATE OR REPLACE FORCE VIEW SNP_REPL.V_ARH_DOCUMENTS_PSV
(RN)
AS 
SELECT RN FROM V_ARH_AGREEMENT
UNION
SELECT RN FROM V_ARH_AGREEMENTS
UNION
SELECT RN FROM V_ARH_BANKDOCS
UNION
SELECT RN FROM V_ARH_BILLASSACT
UNION
SELECT RN FROM V_ARH_BILLASSACTDOC
UNION
SELECT RN FROM V_ARH_BILLCARD
UNION
SELECT RN FROM V_ARH_BILLRECPACT
UNION
SELECT RN FROM V_ARH_BILLRECPACTDOC
UNION
SELECT RN FROM V_ARH_BILLMOVEMENT
UNION
SELECT RN FROM V_ARH_CASHDOCS
UNION
SELECT RN FROM V_ARH_CONSUMERORD
UNION
SELECT RN FROM V_ARH_CONSUMERORDS
UNION
SELECT RN FROM V_ARH_CONSUMERORDP
UNION
SELECT RN FROM V_ARH_CONSUMERORDPS
UNION
SELECT RN FROM V_ARH_DICACCFI
UNION
SELECT RN FROM V_ARH_DICLACFI
UNION
SELECT RN FROM V_ARH_DICACCFO
UNION
SELECT RN FROM V_ARH_DICLACFO
UNION
SELECT RN FROM V_ARH_INCOMDOC
UNION
SELECT RN FROM V_ARH_INCOMEFROMDEPS
UNION
SELECT RN FROM V_ARH_INCOMEFROMDEPSSPEC
UNION
SELECT RN FROM V_ARH_INORDERS
UNION
SELECT RN FROM V_ARH_INORDERSPECS
UNION
SELECT RN FROM V_ARH_LIABILITYNOTES
UNION
SELECT RN FROM V_ARH_PAYACC
UNION
SELECT RN FROM V_ARH_PAYACCSPECS
UNION
SELECT RN FROM V_ARH_PAYNOTES
UNION
SELECT RN FROM V_ARH_RESJOURNAL
UNION
SELECT RN FROM V_ARH_RLINVSHEET
UNION
SELECT RN FROM V_ARH_RLINVSHEETSPEC
UNION
SELECT RN FROM V_ARH_RLPRICES
UNION
SELECT RN FROM V_ARH_RLPRICESPECS
UNION
SELECT RN FROM V_ARH_SALESREPORTDETAIL
UNION
SELECT RN FROM V_ARH_SALESREPORTMAIN
UNION
SELECT RN FROM V_ARH_SHEEPDIRSCUST
UNION
SELECT RN FROM V_ARH_SHEEPDIRSCUSTSPECS
UNION
SELECT RN FROM V_ARH_SHEEPDIRSDEPT
UNION
SELECT RN FROM V_ARH_SHEEPDIRSDEPTSPECS
UNION
SELECT RN FROM V_ARH_STOREOPERJOURN
UNION
SELECT RN FROM V_ARH_STRPLRESJRNL
UNION
SELECT RN FROM V_ARH_STRPLOPRJRNL
UNION
SELECT RN FROM V_ARH_TRANSINVCUST
UNION
SELECT RN FROM V_ARH_TRANSINVCUSTSPECS
UNION
SELECT RN FROM V_ARH_TRANSINVDEPT
UNION
SELECT RN FROM V_ARH_TRANSINVDEPTSPECS
UNION
SELECT RN FROM V_ARH_WROFFACTS
UNION
SELECT RN FROM V_ARH_WROFFACTSPECS;

