--
-- KLS_NAPR_POST  (Table) 
--
CREATE TABLE MASTER.KLS_NAPR_POST
(
  ID       NUMBER(10)                           NOT NULL,
  NAME     VARCHAR2(50 BYTE),
  IS_VIEW  NUMBER(1),
  SORTBY   NUMBER(2)
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON TABLE MASTER.KLS_NAPR_POST IS '����������� ��������';


