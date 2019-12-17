*:********************************************************************
*:
*:		Process : !admrees.prg
*:		Descript: Заполнение архива REESTR.DBF
*:      Is ready for VFP?  - READY
*:
*:********************************************************************
*DO F:\DBA\MGRSR\DOPRG.VFP\config.prg
WAIT CLEAR
WAIT [ Process...] + CHR(13);
	+ [ Архивация REESTR.DBF ] WINDOW NOWAIT
IF !USED('reestr_d')
	USE (gTovPrDbf + 'reestr_d') IN 0 ALIAS reestr_d
ENDIF
IF !USED('reestr')
	USE (gTovPrArh + 'reestr') IN 0 ALIAS reestr
ENDIF
SELECT reestr_d
SET FILTER TO num_kvit > 0 AND error = 0;
        AND tran_ras;
		AND !arh;
		AND !DELETED()
GO TOP
DO WHILE !EOF()
	SCATTER MEMVAR
	SELECT reestr
	APPEND BLANK
	GATHER MEMVAR
	SELECT reestr_d
	REPLACE arh WITH .T.
	SKIP
ENDDO
USE IN reestr
USE IN reestr_d
WAIT 'Архивация завершена.' WINDOW TIMEOUT(1)