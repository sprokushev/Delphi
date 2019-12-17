--
-- EUL_HI_SEGMENTS  (Table) 
--
CREATE TABLE MASTER.EUL_HI_SEGMENTS
(
  HS_ID              NUMBER(10)                 NOT NULL,
  HS_TYPE            VARCHAR2(10 BYTE),
  DHS_HI_ID          NUMBER(10),
  DHS_DHN_ID_CHILD   NUMBER(10),
  DHS_DHN_ID_PARENT  NUMBER(10),
  IHS_HN_ID_CHILD    NUMBER(10),
  IHS_HN_ID_PARENT   NUMBER(10),
  IHS_HI_ID          NUMBER(10),
  IHS_JC_ID          NUMBER(10),
  NOTM               NUMBER(10)
)
TABLESPACE USERS2
NOCOMPRESS ;

