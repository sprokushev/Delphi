--
-- XX101_KVIT  (Table) 
--
CREATE TABLE MASTER.XX101_KVIT
(
  ID                 NUMBER(7),
  FLG_OPERDATA       NUMBER(1),
  MESTO_ID           NUMBER(2),
  NOM_ZD             VARCHAR2(12 BYTE),
  PROD_ID_NPR        VARCHAR2(5 BYTE),
  TEX_PD_ID          NUMBER(7),
  NUM_CIST           VARCHAR2(10 BYTE),
  DATE_OTGR          DATE,
  VES                NUMBER(10,3),
  VES_BRUTTO         NUMBER(10,3),
  VES_ED             NUMBER(10,3),
  KOL_ED             NUMBER(6),
  TARIF              NUMBER(12,2),
  TARIF19            NUMBER(12,2),
  TARIF_ORIG         NUMBER(12,2),
  NUM_KVIT           NUMBER(10),
  DATE_KVIT          DATE,
  NUM_MILITARY       VARCHAR2(20 BYTE),
  FLG_DOP_CIST       NUMBER(1),
  FLG_VAG_KLIENT     NUMBER(1),
  VAGOWNER_ID        NUMBER(3),
  VAGONTYPE_ID       NUMBER(2),
  KALIBR_ID          VARCHAR2(5 BYTE),
  VES_CIST           NUMBER(10,3),
  DATE_VOZ           DATE,
  KVIT_VOZ           VARCHAR2(12 BYTE),
  SUM_VOZ            NUMBER(12,2),
  DATE_OTV           DATE,
  PLOMBA1            VARCHAR2(15 BYTE),
  PLOMBA2            VARCHAR2(15 BYTE),
  ROSINSPL1          VARCHAR2(6 BYTE),
  ROSINSPL2          VARCHAR2(6 BYTE),
  VZLIV              NUMBER(6),
  TEMPER             NUMBER(10,1),
  FAKT_PL            NUMBER(10,4),
  FORMNAKL_ID        NUMBER(2),
  SHABEXP_ID         NUMBER(10),
  GTD                VARCHAR2(23 BYTE),
  EXPED_ID           NUMBER(6),
  VETKA_OTP_ID       NUMBER(10),
  NUM_EXP_MAR        VARCHAR2(10 BYTE),
  BILL_ID            NUMBER(10)                 DEFAULT 0,
  SVED_ID            VARCHAR2(9 BYTE),
  DATE_OFORML        DATE,
  SVED_NUM           NUMBER(6)                  DEFAULT 0,
  PASP_ID            VARCHAR2(10 BYTE),
  NUM_NAR            VARCHAR2(15 BYTE),
  NUM_DOVER          VARCHAR2(15 BYTE),
  PERER_ID           NUMBER(6),
  DATE_EDIT          DATE,
  JKCOMMIT           NUMBER(1),
  GROTP_ID           NUMBER(6)                  DEFAULT 0,
  PERECH_TEXPD_DATE  DATE,
  PERECH_TEXPD_NUM   VARCHAR2(10 BYTE),
  SUM_PROD           NUMBER(15,2)               DEFAULT 0,
  SUM_AKCIZ          NUMBER(15,2)               DEFAULT 0,
  SUM_PROD_NDS       NUMBER(15,2)               DEFAULT 0,
  TARIF_NDS          NUMBER(15,2)               DEFAULT 0,
  SUM_VOZN11         NUMBER(15,2)               DEFAULT 0,
  SUM_VOZN11_NDS     NUMBER(15,2)               DEFAULT 0,
  SUM_VOZN12         NUMBER(15,2)               DEFAULT 0,
  SUM_VOZN12_NDS     NUMBER(15,2)               DEFAULT 0,
  SUM_STRAH          NUMBER(15,2)               DEFAULT 0,
  CENA               NUMBER(10,2),
  CENA_OTP           NUMBER(10,2),
  DATE_CENA          DATE,
  CENA_VOZN          NUMBER(10,2)               DEFAULT 0,
  CAPACITY           VARCHAR2(10 BYTE),
  TARIF_GUARD        NUMBER(12,2)               DEFAULT 0,
  TARIF_GUARD_NDS    NUMBER(12,2)               DEFAULT 0,
  TARIF_ALT          NUMBER(12,2),
  NACENKA            NUMBER(10,2)               DEFAULT 0,
  PODDONS            NUMBER(5),
  SHIELDS            NUMBER(5),
  UPAK_ID            NUMBER(10),
  UPAK_VES           NUMBER(15,6),
  KOL_NET            NUMBER(19,5),
  UPAK_VES_ED        NUMBER(7,2),
  SHIELD_VES         NUMBER(7,2),
  PODDON_VES         NUMBER(7,2),
  PL                 NUMBER(10,4),
  NUM_AKT            NUMBER(10),
  BILL_POS_ID        NUMBER(10),
  PROTO_NUM          VARCHAR2(15 BYTE),
  PROTO_DATE         DATE,
  NO_AKCIZ           NUMBER(1),
  PERECH_GUARD_DATE  DATE,
  PERECH_GUARD_NUM   VARCHAR2(10 BYTE),
  TTN_ID             NUMBER(15),
  DATE_DOVER         DATE,
  FIO_DRIVER         VARCHAR2(30 BYTE),
  IS_LOADED          NUMBER(1)                  DEFAULT 0,
  AXES               NUMBER(3),
  CTLV               NUMBER(6,4),
  DEFI_MASS_ID       NUMBER(2),
  VOLUME             NUMBER(10),
  VOLUME15           NUMBER(10),
  ZPU_TYPE1          NUMBER(5),
  ZPU_TYPE2          NUMBER(5),
  PL15               NUMBER(6,4),
  DATE_IN            DATE,
  WAYBILLROWID       VARCHAR2(6 BYTE),
  WAYBILLID          VARCHAR2(10 BYTE)
)
TABLESPACE USERS
NOCOMPRESS ;


