*:*****************************************************************************
*:
*:	 	Process : ADM_RASK.PRG
*:		Descript: ������������ ����� RASKRED.DBF (��������) ��� ��������
*:		Status  : PRIVATE
*:		Call    : !admrask.prg
*:      Is ready for VFP?  - READY
*:
*:*****************************************************************************
*DO F:\DBA\MGRSR\DOPRG.VFP\config.prg	&& �������
WAIT [Process...] + CHR(13);
	+[������������ ����� RASKRED.DBF ������ �� ��������...] WINDOW NOWAIT
SELECT 0
USE (gTovPrArh + 'ras_ar')

SELECT 0
USE (gTovPrDbf + 'reestr_d')

SELECT 0
USE (gTovPrDbf + 'tmp_rask') EXCLUSIVE
ZAP
**********************
SELECT reestr_d
SET FILTER TO num_kvit > 0;
		AND !tran_ras;
		AND reestr > 0;
		AND error = 0;
		AND !DELETED();
		AND npzout

GO TOP
DO WHILE !EOF()
	IF LOCK()
		SCATTER MEMVAR
		SELECT tmp_rask
		APPEND BLANK
		GATHER MEMVAR
		REPLACE kolmest WITH IIF(m.rodv=2,INT(m.kol_all),0),;
				date_pr WITH m.date_pr0,;
				time_pr WITH m.time_pr0,;
				fio_pr  WITH m.fiopr
		SELECT ras_ar
		APPEND BLANK
		GATHER MEMVAR
		REPLACE date_pr WITH m.date_pr0,;
				time_pr WITH m.time_pr0,;
				fio_pr  WITH m.fiopr
		SELECT reestr_d
		REPLACE date_pr  WITH m.date_pr0,;
				time_pr  WITH m.time_pr0,;
				fio_pr   WITH m.fiopr,;
				tran_ras WITH .T.
		m.cntraskred = m.cntraskred + 1
   ENDIF
   UNLOCK
   SKIP
ENDDO
USE IN reestr_d
USE IN ras_ar
USE IN tmp_rask
IF !EMPTY(m.cntraskred)
	IF !FILE(gNstOut + 'raskred.dbf')
		WAIT [����������� ������ �� �������� � ���� ��� ��������...] WINDOW NOWAIT
		COPY FILE (gTovPrDbf + 'tmp_rask.dbf') TO (gNstOut + 'raskred.dbf')
	ELSE
		WAIT CLEAR
		WAIT [���������� �������� �� ���������� !] + CHR(13);
			+[���������� ������ �� ��������...] WINDOW NOWAIT
		SELECT 0
		USE (gNstOut + 'raskred.dbf')
		APPEND FROM (gTovPrDbf + 'tmp_rask')
		USE
	ENDIF
	WAIT [������������ ����� RASKRED.DBF ���������.] WINDOW TIMEOUT(1)
ELSE
	gInfoStr = [��� ���������������� ������ ��� ��������.]
	=Wait3Beep(gInfoStr)
ENDIF

**** ��������� ������ � ������� �� ������
WAIT [������������ ������ �� ��������� �������] WINDOW NOWAIT
IF FILE(gTovPrDbf+'datenal.dbf')
  SELECT * FROM (gTovPrDbf+'datenal.dbf');
    WHERE DATE()-60<=datenal AND datenal>={01.07.1998};
    INTO TABLE (gPathTemp + 'datenal1.dbf')
  COPY TO (gNstOut + 'datenal.dbf') TYPE FOX2X
  USE
  USE IN datenal
  DELETE FILE (gPathTemp + 'datenal1.dbf')
ENDIF
WAIT CLEAR

RETURN