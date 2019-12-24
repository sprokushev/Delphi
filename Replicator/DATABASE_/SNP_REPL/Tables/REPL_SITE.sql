--
-- REPL_SITE  (Table) 
--
CREATE TABLE SNP_REPL.REPL_SITE
(
  RN         NUMBER(17)                         NOT NULL,
  NAME       VARCHAR2(100 BYTE)                 NOT NULL,
  SORTBY     NUMBER(10)                         NOT NULL,
  IS_ACTIVE  NUMBER(1)                          DEFAULT 0                     NOT NULL
);

COMMENT ON TABLE SNP_REPL.REPL_SITE IS 'Узлы репликации';

COMMENT ON COLUMN SNP_REPL.REPL_SITE.RN IS 'REPL_SITE_RN';

COMMENT ON COLUMN SNP_REPL.REPL_SITE.NAME IS 'Наименование узла';

COMMENT ON COLUMN SNP_REPL.REPL_SITE.SORTBY IS 'Порядок репликации';

COMMENT ON COLUMN SNP_REPL.REPL_SITE.IS_ACTIVE IS 'Активный узел';


