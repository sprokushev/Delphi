--
-- BILLPOS_PP_PK  (Index) 
--
CREATE UNIQUE INDEX MASTER.BILLPOS_PP_PK ON MASTER.BILL_POS_PREPAY
(NOM_DOK, BILL_POS_PREPAY_ID)
TABLESPACE USERSINDX;

