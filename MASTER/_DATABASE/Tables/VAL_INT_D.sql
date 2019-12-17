--
-- VAL_INT_D  (Table) 
--
CREATE TABLE MASTER.VAL_INT_D
(
  DD_MM_YYYY   DATE,
  SYB_RNK      NUMBER(5),
  N_OB         NUMBER(8),
  N_GR_INTEGR  NUMBER(4),
  KOL_DB       NUMBER(7),
  KOL          NUMBER(7),
  NET_INT      NUMBER(4),
  VAL          NUMBER,
  STAT         VARCHAR2(1 BYTE),
  KOL_DB_BP    NUMBER(7),
  KOL_BP       NUMBER(7),
  VAL_BP       NUMBER,
  RS           VARCHAR2(1 BYTE),
  VAL_PR       NUMBER,
  R            NUMBER,
  IS_COPYED    INTEGER
)
TABLESPACE USERS2
NOCOMPRESS ;


