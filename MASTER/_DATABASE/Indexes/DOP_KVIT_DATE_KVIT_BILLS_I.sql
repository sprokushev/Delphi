--
-- DOP_KVIT_DATE_KVIT_BILLS_I  (Index) 
--
CREATE INDEX MASTER.DOP_KVIT_DATE_KVIT_BILLS_I ON MASTER.DOP_KVIT
(DATE_KVIT, BILL_ID, ID)
TABLESPACE USERSINDX;


