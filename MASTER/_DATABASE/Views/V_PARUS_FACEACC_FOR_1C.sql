--
-- V_PARUS_FACEACC_FOR_1C  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_PARUS_FACEACC_FOR_1C
(NRN, SAGENT, SNUMBER, SVALID_DOCNUMB, SAGNACC, 
 AGNABBR, AGNNAME, AGNIDNUMB, GEOGRAFY_RN, GEOGRAFY_CODE, 
 ADDR_COUNTRY, ADDR_REG, ADDR_DISTRICT, ADDR_CITY, NADDR_MUNIC_DIST, 
 SADDR_MUNIC_DIST, NADDR_ADMIN_DIST, SADDR_ADMIN_DIST, ADDR_STREET, ADDR_HOUSE, 
 ADDR_BLOCK, ADDR_FLAT, ADDR_POST, PHONE, PHONE2, 
 FAX, TELEX, MAIL, AGN_COMMENT)
AS 
SELECT
NRN, SAGENT, SNUMBER, SVALID_DOCNUMB, SAGNACC, AGNABBR, AGNNAME, AGNIDNUMB,
 GEOGRAFY_RN, GEOGRAFY_CODE, ADDR_COUNTRY, ADDR_REG, ADDR_DISTRICT,
 ADDR_CITY, NADDR_MUNIC_DIST, SADDR_MUNIC_DIST, NADDR_ADMIN_DIST, SADDR_ADMIN_DIST,
 ADDR_STREET, ADDR_HOUSE, ADDR_BLOCK, ADDR_FLAT, ADDR_POST,
 PHONE, PHONE2, FAX, TELEX, MAIL,
 AGN_COMMENT
 FROM Parus.V_FACEACC@Oracle.world;

