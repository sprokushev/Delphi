--
-- MONTH_USL_DOG_FK_I  (Index) 
--
CREATE INDEX MASTER.MONTH_USL_DOG_FK_I ON MASTER.MONTH
(DOG_ID, USL_NUMBER)
TABLESPACE USERSINDX;

