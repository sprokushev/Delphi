--
-- GD_RAZN_PATH  (Table) 
--
CREATE TABLE MASTER.GD_RAZN_PATH
(
  ID             NUMBER(10)                     NOT NULL,
  GD_RAZNPOS_ID  NUMBER(10),
  SORTBY         NUMBER(10),
  TIP_PATH_ID    NUMBER(10),
  STAN_ID        NUMBER(10),
  VETKA_ID       NUMBER(4),
  PREDPR_ID      NUMBER(6),
  STATES_ID      NUMBER(3)
)
TABLESPACE USERS2
NOCOMPRESS ;

COMMENT ON TABLE MASTER.GD_RAZN_PATH IS '������� ������� �������� ������';

COMMENT ON COLUMN MASTER.GD_RAZN_PATH.ID IS '�������';

COMMENT ON COLUMN MASTER.GD_RAZN_PATH.GD_RAZNPOS_ID IS '������� ������';

COMMENT ON COLUMN MASTER.GD_RAZN_PATH.SORTBY IS '������� �����������';

COMMENT ON COLUMN MASTER.GD_RAZN_PATH.TIP_PATH_ID IS '��� ������ ��������';

COMMENT ON COLUMN MASTER.GD_RAZN_PATH.STAN_ID IS '�������';

COMMENT ON COLUMN MASTER.GD_RAZN_PATH.VETKA_ID IS '�����';

COMMENT ON COLUMN MASTER.GD_RAZN_PATH.PREDPR_ID IS '�����������';

COMMENT ON COLUMN MASTER.GD_RAZN_PATH.STATES_ID IS '������';



