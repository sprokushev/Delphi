--
-- R3_GD  (Table) 
--
CREATE TABLE MASTER.R3_GD
(
  BAHNR   VARCHAR2(3 BYTE)                      NOT NULL,
  STREKL  VARCHAR2(100 BYTE)
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON COLUMN MASTER.R3_GD.BAHNR IS '�������� ������';

COMMENT ON COLUMN MASTER.R3_GD.STREKL IS '������������';


