--
-- VED_OSMOTR_MT_DATE_I  (Index) 
--
CREATE INDEX MASTER.VED_OSMOTR_MT_DATE_I ON MASTER.VED_OSMOTR
(MESTO_ID, LOAD_TYPE_ID, VED_DATE, VED_NUM)
TABLESPACE USERSINDX;


