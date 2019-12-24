--
-- REPL_QUERY  (Table) 
--
CREATE TABLE SNP_REPL.REPL_QUERY
(
  FLAG      VARCHAR2(15 BYTE)                   NOT NULL,
  AUTHID    VARCHAR2(30 BYTE)                   NOT NULL,
  ADD_TIME  DATE                                DEFAULT SYSDATE               NOT NULL
);

COMMENT ON TABLE SNP_REPL.REPL_QUERY IS 'Очередь событий репликации';

COMMENT ON COLUMN SNP_REPL.REPL_QUERY.FLAG IS 'Флаг события';

COMMENT ON COLUMN SNP_REPL.REPL_QUERY.AUTHID IS 'Пользователь';

COMMENT ON COLUMN SNP_REPL.REPL_QUERY.ADD_TIME IS 'Время добавления в очередь';


