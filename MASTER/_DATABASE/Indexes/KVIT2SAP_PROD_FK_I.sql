/* This object may not be sorted properly in the script due to cirular references. */
--
-- KVIT2SAP_PROD_FK_I  (Index) 
--
CREATE INDEX MASTER.KVIT2SAP_PROD_FK_I ON MASTER.R3_KVIT2SAP
(PROD_ID_NPR)
TABLESPACE USERSINDX;


