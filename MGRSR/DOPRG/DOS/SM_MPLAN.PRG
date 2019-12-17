*** Переменные d_pak, t_pak определены в головном модуле (re_msk.prg)

WAIT 'Приём файла суммарных позиций заданий по реестрам SM_MPLAN.DBF... ' WINDOW NOWAIT
IF !FILE(gInRe_Msk+'SM_MPLAN.DBF')
	WAIT 'Нет файла суммарных позиций заданий по реестрам SM_MPLAN.DBF' WINDOW TIMEOUT 1
	RETURN
ENDIF

SELECT 0
USE (gInRe_Msk+'SM_MPLAN.DBF') ALIAS source
USE (gTovPrArh+'SM_MPLAN.DBF') ALIAS arh IN 0
USE (gTovPrDbf+'SM_MPLAN.DBF') ALIAS cur IN 0

* Удаляем все записи, для которых пришло обновление

SELECT date_beg, date_end FROM source GROUP BY date_beg, date_end;
  	INTO CURSOR oldpos
SCAN
	SELECT cur
	DELETE FOR date_beg=oldpos.date_beg AND date_end=oldpos.date_end
	APPEND FROM (gInRe_Msk+'SM_MPLAN.DBF')
	REPLACE FOR date_beg=oldpos.date_beg AND date_end=oldpos.date_end;
		dreceive WITH d_pak, treceive WITH t_pak
	SELECT arh
	APPEND FROM (gInRe_Msk+'SM_MPLAN.DBF')
	REPLACE FOR date_beg=oldpos.date_beg AND date_end=oldpos.date_end;
		dreceive WITH d_pak, treceive WITH t_pak
  	SELECT oldpos
ENDSCAN
USE IN oldpos
USE IN source
USE IN arh
USE IN cur

DELETE FILE(gInRe_Msk+'SM_MPLAN.DBF')
WAIT 'Файл суммарных позиций заданий по реестрам SM_MPLAN.DBF принят.' WINDOW TIMEOUT 1

RETURN
