--
-- KLS_VAGON_VZLIV  (Table) 
--
CREATE TABLE MASTER.KLS_VAGON_VZLIV
(
  KALIBR_ID  VARCHAR2(5 BYTE)                   NOT NULL,
  VZLIV      NUMBER(6)                          NOT NULL,
  VOLUME     NUMBER(6)                          DEFAULT 0
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON TABLE MASTER.KLS_VAGON_VZLIV IS '������������� ������� �������';

COMMENT ON COLUMN MASTER.KLS_VAGON_VZLIV.KALIBR_ID IS '��� ������';

COMMENT ON COLUMN MASTER.KLS_VAGON_VZLIV.VZLIV IS '�����';

COMMENT ON COLUMN MASTER.KLS_VAGON_VZLIV.VOLUME IS '�����';



