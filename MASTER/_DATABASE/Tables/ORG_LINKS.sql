--
-- ORG_LINKS  (Table) 
--
CREATE TABLE MASTER.ORG_LINKS
(
  ORG_STRU_1_ID  NUMBER(10),
  ORG_STRU_2_ID  NUMBER(10)                     DEFAULT 0,
  KIND_RELA_ID   NUMBER(10),
  IS_ROOT        NUMBER(1)                      DEFAULT 0
)
TABLESPACE USERS2
NOCOMPRESS ;


