--
-- R3_WERKS_LGORT  (Table) 
--
CREATE TABLE MASTER.R3_WERKS_LGORT
(
  VBAP_WERKS  VARCHAR2(3 BYTE)                  NOT NULL,
  LGORT       VARCHAR2(5 BYTE)                  NOT NULL,
  LGOBE       VARCHAR2(100 BYTE)
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON COLUMN MASTER.R3_WERKS_LGORT.VBAP_WERKS IS '�����';

COMMENT ON COLUMN MASTER.R3_WERKS_LGORT.LGORT IS '�����';

COMMENT ON COLUMN MASTER.R3_WERKS_LGORT.LGOBE IS '������������';



