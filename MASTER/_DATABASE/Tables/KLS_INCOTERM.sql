--
-- KLS_INCOTERM  (Table) 
--
CREATE TABLE MASTER.KLS_INCOTERM
(
  ID       NUMBER(10)                           NOT NULL,
  TAG      VARCHAR2(3 BYTE),
  NAME     VARCHAR2(50 BYTE),
  KSSS_ID  NUMBER
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON TABLE MASTER.KLS_INCOTERM IS '������� ��������';


