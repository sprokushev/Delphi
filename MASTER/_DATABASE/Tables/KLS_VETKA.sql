--
-- KLS_VETKA  (Table) 
--
CREATE TABLE MASTER.KLS_VETKA
(
  VETKA_NAME    VARCHAR2(50 BYTE),
  ID            NUMBER(10)                      NOT NULL,
  OWNER_ID      NUMBER(6),
  IS_AUTO_LINK  NUMBER(10)                      DEFAULT 1
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON TABLE MASTER.KLS_VETKA IS '����� ����������';

COMMENT ON COLUMN MASTER.KLS_VETKA.VETKA_NAME IS '������������';

COMMENT ON COLUMN MASTER.KLS_VETKA.ID IS '����� ����������';

COMMENT ON COLUMN MASTER.KLS_VETKA.OWNER_ID IS '��������';

COMMENT ON COLUMN MASTER.KLS_VETKA.IS_AUTO_LINK IS '�������������� ��������';



