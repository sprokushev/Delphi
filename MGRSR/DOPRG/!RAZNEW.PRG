*:******************************************************************
*:
*:		Process : !raznew.prg
*:		Descript: Прием разнарядки из ВТУ
*:		Flag    : F:\NST\BOX_TOV\recieve.t-m
*:
*:******************************************************************
PUBLIC m.packetkod, m.date_operation, m.time_operation

m.packetkod = '000'
m.date_operation = DATE()	&& Дата приема
m.time_operation = TIME()	&& Время приема
m.kod_nalich_packet = 1		&& Код пакета NALICH;
						 - изменить в случае модификации в PACKETS.DBF !!!

FOR i = 1 TO 5
	=SoundRaznar()
ENDFOR
RELEASE i
IF CheckPacket()
	DO (gPathDoPrg + 'adm_spr.prg')		&& Обработка справочников
	DO (gPathDoPrg + 'razn_npo.prg')	&& Обработка RAZN_NPO.DBF
	DO (gPathDoPrg + 'adm_razn.prg')	&& Прием разнарядки
	IF !FILE(gPathFlag + 'nalich.run')
		USE (gPathDbf + 'packets') ORDER kod_packet IN 0 ALIAS packets0 NOUPDATE AGAIN
		IF SEEK(m.kod_nalich_packet,'packets0')
			m.flagnalich = ALLTRIM(packets0.flagpath) + '\'+ ALLTRIM(packets0.flagname)
			fflag = FCREATE(m.flagnalich)
			= FCLOSE(fflag)
		ELSE
			gInfoStr = 'Прием разнарядки. Ошибка выставления флага для пакета NALICH - не найдена запись с кодом = '+m.kod_nalich_packet+' в PACKETS.DBF.'
		ENDIF
		USE IN packets0
		
*		DO (gPathDoPrg + 'operdata.prg')	&& Формируем для передачи текущие данные;
											по разнарядке
*		COPY FILE (gPathTemp + 'raznar0.dbf') TO F:\UCHET\BOX_SBIT\raznar.dbf
*		COPY FILE (gPathTemp + 'reestr.dbf') TO F:\UCHET\BOX_SBIT\reestr.dbf
	ENDIF
	IF !USED('packet0')
		USE (gPathDbf+'raznlog') ORDER kod IN 0 ALIAS packet0 AGAIN
	ENDIF
	SELECT packet0
	IF SEEK(m.packetkod)
		COPY TO F:\UCHET\BOX_SBIT\packet.dbf FOR kod = m.packetkod
	ENDIF
	USE IN packet0
	**** Выставляем флаг отправки -  [nalich.t-m]
*	IF FILE('F:\UCHET\BOX_SBIT\raznar.dbf')
*		fflag = FCREATE('F:\NET\T-MAIL\FLAGS\nalich.t-m')
*		= FCLOSE(fflag)
*	ELSE
*		gInfoStr = 'Прием разнарядки. Файл RAZNAR.DBF не создан. Пакет NALICH не передан.'
*		=Wait3Beep(gInfoStr)
*	ENDIF
	&& Прием разнарядки в ORACLE RDBMS
	fflag = FCREATE('F:\DBA\MGRSR\FLAGS\oprirazn.mgr')
	= FCLOSE(fflag)
	
ELSE
	RETURN
ENDIF
DO DelAllFiles						&& Удаление файлов
RELEASE m.packetkod, m.date_operation, m.time_operation
RETURN

PROCEDURE SoundRaznar
SET BELL TO 700,4
?? ''
SET BELL TO 600,4
?? ''
SET BELL TO
RETURN

PROCEDURE DelAllFiles
DELETE FILE (gNstBoxTov + 'packet.dbf')
DELETE FILE (gNstBoxTov + 'raznar.dbf')
DELETE FILE (gNstBoxTov + 'predpr.dbf')
DELETE FILE (gNstBoxTov + 'gdor.dbf')
DELETE FILE (gNstBoxTov + 'region.dbf')
DELETE FILE (gNstBoxTov + 'stan.dbf')
DELETE FILE (gNstBoxTov + 'states.dbf')
DELETE FILE (gNstBoxTov + 'vetka.dbf')
DELETE FILE (gNstBoxTov + 'pred_st.dbf')
RETURN

FUNCTION CheckPacket
IF !FILE(gNstBoxTov + 'raznar.dbf')		&& Есть ли raznar.dbf ?
	gInfoStr = [Не найден файл ] + gNstBoxTov + [raznar.dbf]
	=Wait3Beep(gInfoStr)
	DO DelAllFiles
	RETURN .F.
ENDIF
IF FILE(gNstBoxTov + 'packet.dbf')		&& Есть ли packet.dbf ?
	m.exitrazn = .F.
	USE (gPathDbf+'raznlog') ORDER kod IN 0 ALIAS packet0
	USE (gNstBoxTov+'packet') IN 0 ALIAS packet NOUPDATE
	IF RECCOUNT('PACKET')=0	
		gInfoStr = [Таблица PACKET.DBF не содержит ни одной записи.]
		=Wait3Beep(gInfoStr)
		USE IN packet
		USE IN packet0
		DO DelAllFiles
		RETURN .F.
	ENDIF
	m.packetkod = packet.kod
ELSE
	gInfoStr = [Не найдена таблица ] + gNstBoxTov + [packet.dbf]
	=Wait3Beep(gInfoStr)
	DO DelAllFiles
	RETURN .F.
ENDIF
*** Регистрируем пакет
SELECT packet
SCATTER MEMVAR
SELECT packet0
IF SEEK(m.packetkod,'packet0')
	gInfoStr = [Повторная обработка задания. Обнаружен дубликат пакета.] + CHR(13);
			+ [Код пакета=]+m.packetkod + CHR(13);
			+ [Дата обработки=]+DTOC(DATE()) + CHR(13);
			+ [Время=]+TIME()
	=Wait3Beep(gInfoStr)
ELSE
	APPEND BLANK
ENDIF
GATHER MEMVAR
REPLACE date WITH date_operation, time WITH time_operation
USE IN packet
USE IN packet0
RETURN .T.