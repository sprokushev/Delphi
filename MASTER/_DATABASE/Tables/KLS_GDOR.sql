--
-- KLS_GDOR  (Table) 
--
CREATE TABLE MASTER.KLS_GDOR
(
  ID              NUMBER(2)                     NOT NULL,
  GDOR_NAME       VARCHAR2(25 BYTE),
  SHORT_NAME      VARCHAR2(8 BYTE),
  ISU_POSTAV_KOD  VARCHAR2(5 BYTE)
)
TABLESPACE USERS2
NOCOMPRESS ;


