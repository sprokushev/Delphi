--
-- KLS_UPAK  (Table) 
--
CREATE TABLE MASTER.KLS_UPAK
(
  ID        NUMBER(10)                          NOT NULL,
  NAME      VARCHAR2(30 BYTE),
  ABBR      VARCHAR2(10 BYTE),
  VOL_FAS   NUMBER(10,3),
  KOD_MOSC  VARCHAR2(5 BYTE),
  BAG_ID    NUMBER(3)
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON COLUMN MASTER.KLS_UPAK.ID IS '��������';

COMMENT ON COLUMN MASTER.KLS_UPAK.NAME IS '������������';

COMMENT ON COLUMN MASTER.KLS_UPAK.ABBR IS '������� ������������';

COMMENT ON COLUMN MASTER.KLS_UPAK.VOL_FAS IS '�����';

COMMENT ON COLUMN MASTER.KLS_UPAK.KOD_MOSC IS '��� ��� ������';

COMMENT ON COLUMN MASTER.KLS_UPAK.BAG_ID IS '�������� (�� ��������)';



