--
-- REPL_STATUS  (Table) 
--
CREATE TABLE SNP_REPL.REPL_STATUS
(
  RN              NUMBER(17)                    NOT NULL,
  SITE_SOURCE_RN  NUMBER(17)                    NOT NULL,
  SITE_DEST_RN    NUMBER(17)                    NOT NULL,
  SCHEMA_RN       NUMBER(17)                    NOT NULL,
  REPL_RN         NUMBER(17)                    NOT NULL,
  STATUS          NUMBER(5)                     DEFAULT 1                     NOT NULL,
  SCHEMAROW_RN    NUMBER(17)                    NOT NULL,
  TABLERN         NUMBER(17),
  TIME_ADD        DATE                          DEFAULT SYSDATE               NOT NULL
);

COMMENT ON TABLE SNP_REPL.REPL_STATUS IS '������� ������� ����������';

COMMENT ON COLUMN SNP_REPL.REPL_STATUS.RN IS 'SNP_REPL_STATUS_RN';

COMMENT ON COLUMN SNP_REPL.REPL_STATUS.SITE_SOURCE_RN IS 'SNP_REPL_SITE_RN';

COMMENT ON COLUMN SNP_REPL.REPL_STATUS.SITE_DEST_RN IS 'SNP_REPL_SITE_RN';

COMMENT ON COLUMN SNP_REPL.REPL_STATUS.SCHEMA_RN IS 'SNP_REPL_SCHEMA_RN';

COMMENT ON COLUMN SNP_REPL.REPL_STATUS.REPL_RN IS '������ �� ������ �� UPDATELIST';

COMMENT ON COLUMN SNP_REPL.REPL_STATUS.STATUS IS '������';

COMMENT ON COLUMN SNP_REPL.REPL_STATUS.SCHEMAROW_RN IS '������ ����� ����������';

COMMENT ON COLUMN SNP_REPL.REPL_STATUS.TABLERN IS 'RN ������������� �������';

COMMENT ON COLUMN SNP_REPL.REPL_STATUS.TIME_ADD IS '����/����� ���������� �������';

