**************************************************************************
*
*   Формирование отгрузки для передачи
*
**************************************************************************
*DO F:\DBA\MGRSR\DOPRG.VFP\config.prg
IF !FILE(gFlagRaskr + 'fiopr.dbf')
	gInfoStr = [Не найден файл ] + gFlagRaskr + [fiopr.dbf]
	=Wait3Beep(gInfoStr)
	RETURN .F.
ENDIF
m.cntraskred = 0		&& Количество передаваемых записей
SELECT 0
USE (gFlagRaskr + 'fiopr') ALIAS fiopr
IF RECCOUNT() = 0
	gInfoStr = [Файл-идентификатор FIOPR.DBF не содержит учетной записи !]
	=Wait3Beep(gInfoStr)
	RETURN .F.
ENDIF
SCATTER MEMVAR
USE
DO (gDoVFP + 'admpsp.fxp')			&& Справочник паспортов(сертификатов)
DO (gDoVFP + 'adm_rask.fxp')		&& Отгрузка
DO (gDoVFP + 'adm_pack.fxp')		&& Чистка REESTR_D
DO (gDoVFP + 'adm_exp.fxp')			&& БД по экспорту
IF FILE(gNstOut + 'raskred.dbf')
	file = FCREATE(gTMFlags + 'pack_n_o.t-m')
	= FCLOSE(file)
	gInfoStr = [Отправлено ] + ALLTRIM(STR(m.cntraskred)) + [ записей по отгрузке.]
	WAIT CLEAR
	WAIT [Формирование данных для передачи завершено.]+CHR(13);
		+[На передачу записей по отгрузке - ]+ ALLTRIM(STR(m.cntraskred));
		WINDOW TIMEOUT(1)
ELSE
	gInfoStr = [Не найден файл ] + gNstOut + [raskred.dbf&]
	=Wait3Beep(gInfoStr)
ENDIF
DELETE FILE (gFlagRaskr + 'fiopr.dbf')	&& Удаляем файл-идентификатор