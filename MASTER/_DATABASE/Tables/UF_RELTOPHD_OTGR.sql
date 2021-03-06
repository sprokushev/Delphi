--
-- UF_RELTOPHD_OTGR  (Table) 
--
CREATE TABLE MASTER.UF_RELTOPHD_OTGR
(
  BEDAT            DATE                         NOT NULL,
  MFRPN            VARCHAR2(10 BYTE),
  ZZNETTO          FLOAT(3),
  ZZKOL            INTEGER,
  ZZWEU            VARCHAR2(30 BYTE),
  ZEVD101          DATE,
  ZEVT101          VARCHAR2(10 BYTE),
  ZEVD102          DATE,
  ZEVT102          VARCHAR2(10 BYTE),
  ZEVD103          DATE,
  ZEVT103          VARCHAR2(10 BYTE),
  ZEVD104          DATE,
  ZEVT104          VARCHAR2(10 BYTE),
  ZEVD113          DATE,
  ZEVT113          VARCHAR2(10 BYTE),
  ZEVD117          DATE,
  ZEVT117          VARCHAR2(10 BYTE),
  ZNAME            VARCHAR2(60 BYTE),
  ZZPROD           VARCHAR2(10 BYTE),
  FILENAME         VARCHAR2(20 BYTE),
  PARSEDATETIME    DATE,
  PROPAGATESTATUS  NUMBER
)
TABLESPACE USERS
NOCOMPRESS ;


