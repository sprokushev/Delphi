--
-- PROGRAM_USERS  (Table) 
--
CREATE TABLE MASTER.PROGRAM_USERS
(
  ORGANIZATION  VARCHAR2(15 BYTE)               NOT NULL,
  APPLICATION   VARCHAR2(30 BYTE)               NOT NULL,
  FIO           VARCHAR2(50 BYTE)               NOT NULL,
  DEPARTMENT    VARCHAR2(100 BYTE)              NOT NULL,
  SL            VARCHAR2(3 BYTE)                DEFAULT 'SL2'                 NOT NULL
)
TABLESPACE USERS
NOCOMPRESS ;


