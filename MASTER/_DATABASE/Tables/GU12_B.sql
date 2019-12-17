--
-- GU12_B  (Table) 
--
CREATE TABLE MASTER.GU12_B
(
  PDATE         DATE,
  SOBSTVVAG_ID  NUMBER(8),
  STAN_ID       NUMBER(8),
  STAN_PER_ID   NUMBER(8),
  GRUZPOL_ID    NUMBER(8),
  KOL_VAG       NUMBER(8)                       DEFAULT 0,
  VES           NUMBER(8)                       DEFAULT 0,
  VIDOTPR_ID    NUMBER(8),
  MRK           CHAR(1 BYTE),
  ID_A          NUMBER(10),
  ID            NUMBER,
  PLAT_ID       NUMBER(8),
  FOX_KOD       VARCHAR2(10 BYTE),
  ISCOR         NUMBER,
  DATE_LETTER   DATE,
  NOM_LETTER    VARCHAR2(20 BYTE),
  DATE_VHOD     DATE,
  NOM_VHOD      VARCHAR2(20 BYTE),
  PRINVAG_ID    NUMBER(8),
  OLD_ID        NUMBER,
  STATES_ID     NUMBER(10)
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON COLUMN MASTER.GU12_B.PRINVAG_ID IS 'Принадлежность вагона';



