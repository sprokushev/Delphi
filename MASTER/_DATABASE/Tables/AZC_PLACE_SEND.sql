--
-- AZC_PLACE_SEND  (Table) 
--
CREATE TABLE MASTER.AZC_PLACE_SEND
(
  ID           NUMBER(10)                       NOT NULL,
  NAME         VARCHAR2(50 BYTE),
  ORG_STRU_ID  NUMBER(10)
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON COLUMN MASTER.AZC_PLACE_SEND.NAME IS '����� �������� (����� � �.�.)';


