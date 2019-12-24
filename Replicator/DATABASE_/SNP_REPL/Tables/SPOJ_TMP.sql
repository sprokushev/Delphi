--
-- SPOJ_TMP  (Table) 
--
CREATE TABLE SNP_REPL.SPOJ_TMP
(
  SPOJ_RN        NUMBER(17)                     NOT NULL,
  OPERATION      VARCHAR2(2 BYTE),
  SUPPLY_BEFORE  NUMBER(17),
  SUPPLY_AFTER   NUMBER(17)
);

COMMENT ON TABLE SNP_REPL.SPOJ_TMP IS '������� ��� �������������� �������� ������ �������� ������� (��� ���������)';

COMMENT ON COLUMN SNP_REPL.SPOJ_TMP.SPOJ_RN IS 'STOREOPERJOURN.RN';

COMMENT ON COLUMN SNP_REPL.SPOJ_TMP.OPERATION IS '��������';

COMMENT ON COLUMN SNP_REPL.SPOJ_TMP.SUPPLY_BEFORE IS 'STOREOPERJOURN.GOODSSUPLY �� ����������';

COMMENT ON COLUMN SNP_REPL.SPOJ_TMP.SUPPLY_AFTER IS 'STOREOPERJOURN.GOODSSUPLY �����';

