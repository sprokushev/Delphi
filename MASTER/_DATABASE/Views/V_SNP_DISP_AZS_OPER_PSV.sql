--
-- V_SNP_DISP_AZS_OPER_PSV  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_SNP_DISP_AZS_OPER_PSV
(OPER_ID, STORE_RN, NOMEN_RN, MIN_DAY, MAX_DAY, 
 VOLUME, MASSA, SUMMA)
AS 
SELECT /*+ RULE ����� ������ �� ��� �� ������� ������� */
  'IN' as OPER_ID, -- ��� ��������
  STORE_RN, -- �����
  NOMEN_RN, -- �/��
  MIN(MIN_DAY) as MIN_DAY,
  MAX(MAX_DAY) as MAX_DAY,
  SUM(VOLUME) as VOLUME,
  SUM(MASSA) as MASSA,
  SUM(SUMMA) as SUMMA
FROM parus.TB_SNP_STORE_OPER_PSV@oracle.world AA
WHERE USER_ID=NLS_UPPER(SYS_CONTEXT('USERENV','OS_USER'))
  AND SOURCE_ID=1
GROUP BY STORE_RN,NOMEN_RN
--UNION ALL
--SELECT /*+ RULE ������ �� �������� �� ��� �� ������� ������� */
--  'IN_HR' as OPER_ID, -- ��� ��������
--  STORE_RN, -- �����
--  NOMEN_RN, -- �/��
--  MIN(MIN_DAY) as MIN_DAY,
--  MAX(MAX_DAY) as MAX_DAY,
--  SUM(VOLUME) as VOLUME,
--  SUM(MASSA) as MASSA,
--  SUM(SUMMA) as SUMMA
--FROM TB_SNP_STORE_OPER_PSV AA, AZSGSMWAYSTYPES way
--WHERE USER_ID=NLS_UPPER(SYS_CONTEXT('USERENV','OS_USER'))
--  AND SOURCE_ID=1
--  AND AA.STOPER_RN = way.RN
--  AND way.KEEP_SIGN=1
--GROUP BY STORE_RN,NOMEN_RN
--UNION ALL
--SELECT /*+ RULE ���������� �����������-������ �� ��� �� ������� ������� */
--  'IN_I' as OPER_ID, -- ��� ��������
--  STORE_RN, -- �����
--  NOMEN_RN, -- �/��
--  MIN(MIN_DAY) as MIN_DAY,
--  MAX(MAX_DAY) as MAX_DAY,
--  SUM(VOLUME) as VOLUME,
--  SUM(MASSA) as MASSA,
--  SUM(SUMMA) as SUMMA
--FROM TB_SNP_STORE_OPER_PSV AA, AZSGSMWAYSTYPES way
--WHERE USER_ID=NLS_UPPER(SYS_CONTEXT('USERENV','OS_USER'))
--  AND SOURCE_ID=1
--  AND AA.STOPER_RN = way.RN
--  AND way.KEEP_SIGN=0
--  AND (way.GSMWAYS_MNEMO = '��������' OR way.GSMWAYS_MNEMO = '�������')
--GROUP BY STORE_RN,NOMEN_RN
UNION ALL
SELECT /*+ RULE ������� ������ �� ��� �� ������� ������� */
  'IN_O' as OPER_ID, -- ��� ��������
  STORE_RN, -- �����
  NOMEN_RN, -- �/��
  MIN(MIN_DAY) as MIN_DAY,
  MAX(MAX_DAY) as MAX_DAY,
  SUM(VOLUME) as VOLUME,
  SUM(MASSA) as MASSA,
  SUM(SUMMA) as SUMMA
FROM parus.TB_SNP_STORE_OPER_PSV@oracle.world AA, parus.AZSGSMWAYSTYPES@oracle.world way
WHERE USER_ID=NLS_UPPER(SYS_CONTEXT('USERENV','OS_USER'))
  AND SOURCE_ID=1
  AND AA.STOPER_RN = way.RN
  AND way.KEEP_SIGN=0
  AND NOT (way.GSMWAYS_MNEMO = '��������' OR way.GSMWAYS_MNEMO = '�������')
GROUP BY STORE_RN,NOMEN_RN
UNION ALL
SELECT /*+ RULE ������ �� ��� �� ��� �� ������ � ������������� */
  'IN_TTN' as OPER_ID,
  STORE_RN,
  NOMEN_RN,
  MIN(MIN_DAY) as MIN_DAY,
  MAX(MAX_DAY) as MAX_DAY,
  SUM(VOLUME) as VOLUME,
  SUM(MASSA) as MASSA,
  SUM(SUMMA) as SUMMA
FROM parus.TB_SNP_STORE_OPER_PSV@oracle.world AA
WHERE USER_ID=NLS_UPPER(SYS_CONTEXT('USERENV','OS_USER'))
  AND SOURCE_ID=3
GROUP BY STORE_RN,NOMEN_RN
UNION ALL
SELECT /*+ RULE ����� ������ � ��� �� ������� ������� */
  'OUT' as OPER_ID, -- ��� ��������
  STORE_RN, -- �����
  NOMEN_RN, -- �/��
  MIN(MIN_DAY) as MIN_DAY,
  MAX(MAX_DAY) as MAX_DAY,
  SUM(VOLUME) as VOLUME,
  SUM(MASSA) as MASSA,
  SUM(SUMMA) as SUMMA
FROM parus.TB_SNP_STORE_OPER_PSV@oracle.world AA
WHERE USER_ID=NLS_UPPER(SYS_CONTEXT('USERENV','OS_USER'))
  AND SOURCE_ID=2
GROUP BY STORE_RN,NOMEN_RN
--UNION ALL
--SELECT /*+ RULE ������ � �������� �� ��� �� ������� ������� */
--  'OUT_HR' as OPER_ID, -- ��� ��������
--  STORE_RN, -- �����
--  NOMEN_RN, -- �/��
--  MIN(MIN_DAY) as MIN_DAY,
--  MAX(MAX_DAY) as MAX_DAY,
--  SUM(VOLUME) as VOLUME,
--  SUM(MASSA) as MASSA,
--  SUM(SUMMA) as SUMMA
--FROM TB_SNP_STORE_OPER_PSV AA, AZSGSMWAYSTYPES way
--WHERE USER_ID=NLS_UPPER(SYS_CONTEXT('USERENV','OS_USER'))
--  AND SOURCE_ID=2
--  AND AA.STOPER_RN = way.RN
--  AND way.KEEP_SIGN=1
--GROUP BY STORE_RN,NOMEN_RN
--UNION ALL
--SELECT /*+ RULE ���������� �����������-������ � ��� �� ������� ������� */
--  'OUT_I' as OPER_ID, -- ��� ��������
--  STORE_RN, -- �����
--  NOMEN_RN, -- �/��
--  MIN(MIN_DAY) as MIN_DAY,
--  MAX(MAX_DAY) as MAX_DAY,
--  SUM(VOLUME) as VOLUME,
--  SUM(MASSA) as MASSA,
--  SUM(SUMMA) as SUMMA
--FROM TB_SNP_STORE_OPER_PSV AA, AZSGSMWAYSTYPES way
--WHERE USER_ID=NLS_UPPER(SYS_CONTEXT('USERENV','OS_USER'))
--  AND SOURCE_ID=2
--  AND AA.STOPER_RN = way.RN
--  AND (way.GSMWAYS_MNEMO LIKE '��������%' OR way.GSMWAYS_MNEMO = '�������' OR way.GSMWAYS_MNEMO LIKE '������_�����%')
--GROUP BY STORE_RN,NOMEN_RN
UNION ALL
SELECT /*+ RULE ������� ������ �� ��� �� ������� ������� */
  'OUT_O' as OPER_ID, -- ��� ��������
  STORE_RN, -- �����
  NOMEN_RN, -- �/��
  MIN(MIN_DAY) as MIN_DAY,
  MAX(MAX_DAY) as MAX_DAY,
  SUM(VOLUME) as VOLUME,
  SUM(MASSA) as MASSA,
  SUM(SUMMA) as SUMMA
FROM parus.TB_SNP_STORE_OPER_PSV@oracle.world AA, PARUS.AZSGSMWAYSTYPES@oracle.world way
WHERE  USER_ID=NLS_UPPER(SYS_CONTEXT('USERENV','OS_USER'))
  AND SOURCE_ID=2
  AND AA.STOPER_RN = way.RN
  AND NOT (way.GSMWAYS_MNEMO LIKE '��������%' OR way.GSMWAYS_MNEMO = '�������' OR way.GSMWAYS_MNEMO LIKE '������_�����%')
GROUP BY STORE_RN,NOMEN_RN;


