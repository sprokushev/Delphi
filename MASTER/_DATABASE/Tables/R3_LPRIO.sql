--
-- R3_LPRIO  (Table) 
--
CREATE TABLE MASTER.R3_LPRIO
(
  VBAP_LPRIO  NUMBER(2)                         NOT NULL,
  BEZEI       VARCHAR2(100 BYTE),
  KERNEL_ID   NUMBER(18)
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON COLUMN MASTER.R3_LPRIO.VBAP_LPRIO IS '���������';

COMMENT ON COLUMN MASTER.R3_LPRIO.BEZEI IS '������������';

COMMENT ON COLUMN MASTER.R3_LPRIO.KERNEL_ID IS 'ID � KERNEL';



