--
-- R3_BILLPOS_PK  (Index) 
--
CREATE UNIQUE INDEX MASTER.R3_BILLPOS_PK ON MASTER.R3_BILL_POS
(VBELN, R3_BILL_POS_ID)
TABLESPACE USERSINDX;


