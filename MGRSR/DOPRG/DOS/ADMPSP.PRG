*:*******************************************************************
*:
*:		Process : admpsp.prg
*:		Descript : ��ନ஢���� �ࠢ�筨�� ��ᯮ�⮢(���䨪�⮢)
*:			��� ��।��
*:		Status  : PRIVATE
*:		Call    : !admrask.prg
*:
*:*******************************************************************
*** ����� ��।�� "⠪ ��� ����", �.�. �ᥣ� ᮤ�ন����
WAIT [Process...] + CHR(13);
	+ [��ନ஢���� �ࠢ�筨�� ��ᯮ�⮢(NEW) ��� ��।��...] WINDOW NOWAIT
USE (gTovPrDbf + 'zagsert') ALIAS zagsert IN 0
SELECT zagsert
COPY TO (gNstOut + 'zagsert.dbf')
USE (gTovPrDbf + 'qualsert') ALIAS qualsert IN 0
SELECT qualsert
COPY TO (gNstOut + 'qualsert.dbf')
USE IN zagsert
USE IN qualsert

WAIT [��ନ஢���� �ࠢ�筨�� ��ᯮ�⮢(NEW) �����襭�.] WINDOW TIMEOUT(1)
RETURN

*** ����� "��।�� ������ � ������饩"(������ ��᫥����� �㡫����;
		�।����� + ���� �����)
PRIVATE m.month, m.date
WAIT [���� - �ନ஢���� �ࠢ�筨�� ��ᯮ�⮢...] WINDOW NOWAIT
m.month = IIF(MONTH(DATE())=1,12,MONTH(DATE()))
m.date = CTOD('1/' + ALLTRIM(STR(m.month))+'/'+ALLTRIM(STR(YEAR(DATE()))))
USE (gTovPrDbf + 'tmpsert') ALIAS tmpsert EXCLUSIVE IN 0
SELECT tmpsert
ZAP
USE IN tmpsert
USE (gTovPrDbf + 'zagsert') ALIAS zagsert IN 0
SELECT zagsert
COPY TO (gTovPrDbf + 'tmpsert.dbf');
	FOR CTOD(dins) >= m.date AND CTOD(dins) <= DATE()
USE IN zagsert
SELECT 0
USE (gTovPrDbf + 'tmpqual') ALIAS tmpqual EXCLUSIVE
ZAP
USE (gTovPrDbf + 'tmpsert') ALIAS tmpsert EXCLUSIVE IN 0
SELECT tmpsert
m.barblk = 0
SCAN
	= barprcnt(20, '���������� �ࠢ�筨�� ��ᯮ�⮢...')
	m.kodser = tmpsert.kodser
	SELECT tmpqual
	APPEND FROM (gTovPrDbf + 'qualsert.dbf') FOR kod = m.kodser	
	SELECT tmpsert
ENDSCAN
USE IN tmpqual
USE IN tmpsert
WAIT [���� - �����⮢�� ��� ��।��...] WINDOW NOWAIT
IF !FILE(gNstOut + 'zagsert.dbf')
	COPY FILE (gTovPrDbf + 'tmpsert.dbf') TO (gNstOut + 'zagsert.dbf')
ELSE
	SELECT 0
	USE (gNstOut + 'zagsert.dbf') EXCLUSIVE
	APPEND FROM (gTovPrDbf + 'tmpsert.dbf')
	USE
ENDIF
IF !FILE(gNstOut + 'qualsert.dbf')
	SELECT 0
	USE (gTovPrDbf + 'tmpqual')
	COPY TO (gNstOut + 'qualsert.dbf')
	USE
ELSE
	SELECT 0
	USE (gNstOut + 'qualsert.dbf') EXCLUSIVE
	APPEND FROM (gTovPrDbf + 'tmpqual.dbf')
	USE
ENDIF
WAIT [��ନ஢���� �ࠢ�筨�� ��ᯮ�⮢(NEW) �����襭�.] WINDOW TIMEOUT(1)
RETURN

*** ����� "��।�� ����������� ������"
SELECT kodser;
	FROM (gTovPrDbf + 'reestr_d');
	INTO CURSOR kodser;
	WHERE !EMPTY(kodser);
		AND num_kvit > 0;
		AND !DELETED();
		AND !tran_ras;
		AND reestr > 0;
		AND error = 0;
	GROUP BY kodser
IF _TALLY <= 0
	WAIT CLEAR
	USE IN reestr_d
	USE IN kodser
	WAIT [��� ����������� ������ � �ࠢ�筨�� ��ᯮ�⮢(NEW).] WINDOW TIMEOUT(1)
	RETURN
ENDIF

USE (gTovPrDbf + 'zagsert') ALIAS zagsert ORDER kodser IN 0
USE (gTovPrDbf + 'qualsert') ALIAS qualsert IN 0
USE (gTovPrDbf + 'tmpsert') ALIAS tmpsert EXCLUSIVE IN 0
SELECT tmpsert
ZAP
USE (gTovPrDbf + 'tmpqual') ALIAS tmpqual EXCLUSIVE IN 0
SELECT tmpqual
ZAP

SELECT kodser
SCAN
	IF SEEK(kodser, 'zagsert') AND !zagsert.dokum
		SELECT zagsert
		SCATTER MEMVAR
		REPLACE dokum WITH .T.
		SELECT tmpsert
		APPEND BLANK
		GATHER MEMVAR
		SELECT tmpqual
		APPEND FROM (gTovPrDbf + 'qualsert.dbf') FOR kod = m.kodser
		SELECT kodser
	ENDIF
ENDSCAN

USE IN reestr_d
USE IN kodser
USE IN qualsert
USE IN zagsert
USE IN tmpsert
USE IN tmpqual

IF !FILE(gNstOut + 'zagsert.dbf')
	COPY FILE (gTovPrDbf + 'tmpsert.dbf') TO (gNstOut + 'zagsert.dbf')
ELSE
	SELECT 0
	USE (gNstOut + 'zagsert.dbf') EXCLUSIVE
	APPEND FROM (gTovPrDbf + 'tmpsert.dbf')
	USE
ENDIF
IF !FILE(gNstOut + 'qualsert.dbf')
	COPY FILE (gTovPrDbf + 'tmpqual.dbf') TO (gNstOut + 'qualsert.dbf')
ELSE
	SELECT 0
	USE (gNstOut + 'qualsert.dbf') EXCLUSIVE
	APPEND FROM (gTovPrDbf + 'tmpqual.dbf')
	USE
ENDIF
WAIT [��ନ஢���� �ࠢ�筨�� ��ᯮ�⮢(NEW) �����襭�.] WINDOW TIMEOUT(1)