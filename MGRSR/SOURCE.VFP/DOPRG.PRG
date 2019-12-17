************************************************************************
*
*	Program: Главный модуль диспетчера модулей обработки 
*			данных при приеме-передаче (Visual FoxPro модулей)
*	Description: 
*	Author: Ким Е.А.
*
************************************************************************
PARAMETERS m.kodsess, m.kodevent, m.kodpacket

*** Массив, заполняющийся информацией об ошибке:;
	_g_mas_error[1] = m.err;
	_g_mas_error[2] = m.prog;
	_g_mas_error[3] = m.mes;
	_g_mas_error[4] = m.lin

PUBLIC ARRAY _g_mas_error[4]
DECLARE _g_mas_error[4]
STORE '' TO _g_mas_error

ON ERROR DO errproc.prg;
	WITH ERROR(), PROGRAM(), MESSAGE(), LINENO()
	
WAIT [Старт диспетчера...] WINDOW NOWAIT
SET EXCLUSIVE OFF
gPathDbf = 'F:\DBA\MGRSR\DBF\'		&& Рабочая папка диспетчера

DO CASE
	case EMPTY(m.kodsess)
		m.mess = 'Не передан код сессии gKodSession диспетчеру !'
		m.kodsess = DTOC(DATE())
	case EMPTY(m.kodevent)
		m.mess = 'Не передан код записи gKodEvents диспетчеру !'
		m.kodevent = SYS(2015)
	case EMPTY(m.kodpacket)
		m.mess = 'Не передан код пакета gKodPacket диспетчеру !'	
OTHERWISE
	m.mess = ''
ENDCASE
IF !EMPTY(m.mess)
	?? ''
	WAIT m.mess WINDOW TIMEOUT(1)
	USE (gPathDbf + 'notrun')
	INSERT INTO notrun (date, time, mess) VALUES (DATE(), TIME(), ansitooem(m.mess))
	IF EMPTY(m.kodpacket)
		QUIT
	ENDIF
ENDIF
RELEASE m.mess

PUBLIC m.gConfigFile	&& Файл конфигурации (параметров, SET установок)
gConfigFile = gPathDbf + 'config.dbf'

PUBLIC m.gKodSession	&& Код записи в протоколе сессий
DO CASE
	case TYPE('m.kodsess') = 'C'
		m.gKodSession = SUBSTR(m.kodsess,1,12)
	case TYPE('m.kodsess') = 'N'
		m.gKodSession = SUBSTR(ALLTRIM(STR(m.kodsess)),1,12)
OTHERWISE
	USE (gPathDbf + 'notrun')
	INSERT INTO notrun (date, time, mess);
				VALUES (DATE(), TIME(), ansitooem('Недопустимый тип параметра gKodSession.'))
	QUIT
ENDCASE		

PUBLIC m.gKodEvent		&& Код записи в EVENTS
DO CASE
	case TYPE('m.kodevent') = 'C'
		m.gKodEvent = SUBSTR(m.kodevent,1,12)
	case TYPE('m.kodevent') = 'N'
		m.gKodEvent = SUBSTR(ALLTRIM(STR(m.kodevent)),1,12)
OTHERWISE
	USE (gPathDbf + 'notrun')
	INSERT INTO notrun (date, time, mess);
				VALUES (DATE(), TIME(), ansitooem('Недопустимый тип параметра m.gKodEvent.'))
	QUIT
ENDCASE		

PUBLIC m.gKodPacket		&& Код пакета в PACKETS
DO CASE
	case TYPE('m.kodpacket') = 'C'
		m.gKodPacket = VAL(m.kodpacket)
	case TYPE('m.kodpacket') = 'N'
		m.gKodPacket = m.kodpacket
OTHERWISE
	USE (gPathDbf + 'notrun')
	INSERT INTO notrun (date, time, mess);
				VALUES (DATE(), TIME(), ansitooem('Недопустимый тип параметра m.gKodPacket.'))
	QUIT
ENDCASE
************* Общеиспользуемые глобальные переменные
** Внимание ! В случае добавления новых переменных в конфиг.файл
** необходимо добавить описание переменной в данной секции (для наглядности)

* gPathDbf - Рабочая папка диспетчера (служебные файлы)
* gPathFlags - Папка сканирования флагов
* gDoVFP - Папка хранения загружаемых модулей обработки Visual FoxPro
* gPathVFP - Папка исходных текстов проекта менеджера VFP
* gPathTemp - Временная папка
* gBoxIn - Бокс получения данных с Н/базы
* gBoxOut - Бокс для отправки данных на Н/базу

*** Инициализация переменных, SET установок
*DO InitVarSet
IF !FILE(gConfigFile)
	=error_f('Не найден конфигурационный файл !')
ENDIF
IF !USED('config')
	USE (gConfigFile) ALIAS config
ELSE
	SELECT config
ENDIF
PRIVATE m.varname, m.setname
SCAN
	DO CASE
		case config.tip = 'VAR'
			m.varname = ALLTRIM(config.key)
*			PUBLIC (m.varname)
			&varname = ALLTRIM(config.value)
		case config.tip = 'SET'
			m.setname = ALLTRIM(config.key)
			m.set = 'SET '+ m.setname + SPACE(1) + ALLTRIM(config.value)
			&set
	ENDCASE
ENDSCAN
RELEASE m.varname, m.setname
USE IN config
SET PROCEDURE TO (gPathVFP + 'lib.prg')	&& Процедурный файл
*SAVE TO (gPathTemp + 'doprg.mem')
*** Запускаем модуль
IF !USED('packets')
	USE (gPathDbf + 'packets') ALIAS packets ORDER kod_packet IN 0
ENDIF
SELECT packets
IF !SEEK(m.gKodPacket)
	= error_f('Не найдена запись в PACKETS.')
ENDIF
PUBLIC m.module
m.module = ''
m.strmodule = ALLTRIM(packets.module)
m.params = packets.params
IF !EMPTY(m.params)
	m.module = [DO ] + m.strmodule + [ WITH ] + m.params
ELSE
	m.module = [DO ] + m.strmodule
ENDIF
IF FILE(m.strmodule)
	*** Регистрируем начало выполнения модуля
	IF !USED('events')
		USE (gPathDbf + 'events') ALIAS events ORDER kod_event IN 0
	ENDIF
	SELECT events
	IF SEEK(m.gKodEvent)
		REPLACE time_b WITH TIME()
	ELSE
		APPEND BLANK
		REPLACE kod_sess WITH gKodSession, kod_event WITH gKodEvent,;
				kod_packet WITH gKodPacket, time_b WITH TIME(),;
				Result WITH ansitooem('Не найдена запись в EVENTS. Событие было выполнено.')
	ENDIF
	USE IN events
	&module						&& Запуск модуля
	IF !EMPTY(gReturnErr)		&& Если переменная результата модуля не пустая
		=error_f(gReturnErr)
	ENDIF
ELSE
	=error_f('Не найден файл модуля ' + m.strmodule)
ENDIF
*RESTORE FROM (gPathTemp + 'doprg.mem')
*** Фиксируем завершение работы модуля
IF !USED("events")
   USE (gPathDbf + 'events.dbf') IN 0 ORDER kod_event
ENDIF 
SELECT events
IF SEEK(m.gKodEvent)
	REPLACE time_e WITH TIME(),;
	        info WITH m.module + IIF(!EMPTY(gInfoStr),CHR(13)+ gInfoStr,'');
	        ADDITIVE
ELSE
	=error_f('Не найдена запись в EVENTS.')
ENDIF

WAIT CLEAR
=end_prog('')

*** Отображает сообщение и вызывает завершение сессии как ошибочной
PROCEDURE error_f
PARAMETER m.mess
?? ''
WAIT CLEAR
WAIT m.mess WINDOW TIMEOUT(2)
m.mess = m.mess + CHR(13);
		+'Код сессии gKodSession = ' + gKodSession + CHR(13);
		+'Код события gKodEvents = ' + gKodEvent + CHR(13);
		+'Код пакета gKodPacket = ' + ALLTRIM(STR(gKodPacket))
=end_prog(m.mess)
RETURN

PROCEDURE InitVarSet		&& Инициализация переменных, SET установок
RETURN

FUNCTION end_prog
PARAMETER m.str
DO CASE
	case UPPER(m.str) = 'ERROR'
      m.ali = ALIAS()
      m.ord = ORDER()
      m.fil = FILTER()
      m.er_ror = _g_mas_error[2] +':ошибка '+LTRIM(STR(_g_mas_error[1]))+IIF(_g_mas_error[4]=0,'',' в строке '+LTRIM(STR(_g_mas_error[4])))+ CHR(13)+CHR(10)
      m.er_ror = m.er_ror + '=== '+_g_mas_error[3]+ ' ==='+CHR(13)+CHR(10)+CHR(13)+CHR(10)
      FOR m.vv = 1 TO 256
         m.v = PROGRAM(m.vv)
         IF EMPTY(m.v)
            EXIT
         ENDIF
         m.er_ror = m.er_ror + 'PROGRAM('+LTRIM(STR(m.vv))+') = '+ m.v +CHR(13)+CHR(10)
      ENDFOR
      m.er_ror = m.er_ror +CHR(13)+CHR(10)+ 'ALIAS() = "'+ m.ali +'"'+CHR(13)+CHR(10)
      m.er_ror = m.er_ror +'ORDER() = "'+ m.ord +'"'+CHR(13)+CHR(10)
      m.er_ror = m.er_ror +'FILTER() = "'+ m.fil +'"'+CHR(13)+CHR(10) +CHR(13)+CHR(10)
*      m.er_ror = ansitooem(m.er_ror)
	case EMPTY(m.str)
      m.er_ror = ''
	OTHERWISE
      m.er_ror = ansitooem(m.str)
ENDCASE
IF !USED("events")
   USE (gPathDbf + 'events.dbf') IN 0 ORDER kod_event
ENDIF 
SELECT events
IF SEEK(m.gKodEvent)
	IF !EMPTY(m.er_ror)
		REPLACE time_e WITH TIME(), error WITH .T., result WITH m.er_ror ADDITIVE
	ENDIF
	IF !EMPTY(m.gInfoStr)
		REPLACE info WITH m.gInfoStr ADDITIVE
	ENDIF
ELSE
	USE (gPathDbf + 'notrun')
	INSERT INTO notrun (date, time, mess);
				VALUES (DATE(), TIME(), m.er_ror)
ENDIF
*= proc_quit(1)

PROCEDURE proc_quit
PARAMETER i
IF PARAMETERS() < 1
   ?? ''
   WAIT WINDOW ' Не найдены необходимые файлы !' TIMEOUT 1
ENDIF
SET LIBRARY TO
RESTORE MACROS
SET SYSMENU TO DEFAULT
SET HELP ON
UNLOCK ALL
CLOSE DATA
CLOSE ALL
RELEASE ALL
CLEAR ALL
*CANCEL
QUIT
*****************************************************************
*  mes_dial(color_sheme, ;  && Цветовая схема окна
*               title, ;    &&  TITLE
*               message, ;  && Выводимое сообщение
*               kol_key	;   && Кол-во клавиш (если нет mes1, mes2, mes3
*               [ mes1,]    && Подсказка 1 клавиши
*               [ mes2,]    && Подсказка 2 клавиши
*               [ mes3])    && Подсказка 3 клавиши
*
*   При отсутствии подсказок клавиш для одной клавиши определено
*   по умолчанию '\!\?OK',  а для двух: 'OK;\!\? Отказ'
****************************************************************
PROCEDURE mes_dial
PARAMETERS col_sheme, titl, mess, n_key, mes1, mes2, mes3
PRIVATE mlin, wlm, old_width, v, s_key, s_lin, par, v_key, m.talkstat
PUSH KEY CLEAR
IF SET("TALK") = "ON"
    SET TALK OFF
    m.talkstat = "ON"
ELSE
    m.talkstat = "OFF"
ENDIF
m.par = PARAMETERS()
IF m.par < 3 OR EMPTY(m.mess)
    IF m.talkstat = "ON"
        SET TALK ON
    ENDIF
    RETURN 0
ENDIF
m.s_key = "@*H "
m.s_lin = 8
m.n_key = IIF(m.par < 4, 1, INT(m.n_key))
IF m.par <= 4
    m.n_key = IIF(m.n_key = 2, 2, 1)
    m.s_key = m.s_key + IIF(m.n_key = 2, '\!\? Отказ ; OK', '\!\?OK')
ELSE
    m.n_key = IIF(m.par > 7, 3, m.par - 4)
    FOR m.v = 1 TO m.n_key
        m.wlm = 'm.mes' + STR( m.v, 1)
        m.mlin = &wlm
        IF EMPTY( m.mlin)
            m.mlin = '.?.'
        ENDIF
        m.wlm = STRTRAN(STRTRAN(STRTRAN(m.mlin,'\<',''),'\!',''),'\?','')
        m.s_lin = MAX( LEN( m.wlm)+2, m.s_lin)
        m.s_key = m.s_key + m.mlin + IIF(m.v = m.n_key, '', ';')
    ENDFOR
    m.s_lin = MIN(( 70 - 3 * m.s_lin) / m.n_key, m.s_lin)
ENDIF

m.mess = STRTRAN( m.mess, '\r', CHR(10)+CHR(13))
m.old_width = SET('MEMOWIDTH')
SET MEMOWIDTH TO 70
m.mlin = MEMLINES(m.mess)	&& Количество строк в сообщении
IF m.mlin > 20
    SET MEMOWIDTH TO m.old_width
    ?? CHR(7)
    WAIT WINDOW 'Сообщение не может быть высотой более 20 строк!' NOWAIT
    IF m.talkstat = "ON"
        SET TALK ON
    ENDIF
    RETURN
ENDIF
_MLINE = 0
m.wlm = 0
FOR m.v = 1 TO m.mlin
    m.wlm = MAX( LEN( MLINE(m.mess, 1, _MLINE)), m.wlm)
                              &&  Определение максимальной длины строки
ENDFOR
m.wlm = MAX( m.wlm, m.s_lin * m.n_key + 3 * m.n_key + 3)

IF WEXIST("s_dialog")
    RELEASE WINDOWS 's_dialog'
ENDIF

DEFINE WINDOW s_dialog ;
    FROM INT((SROW()-(m.mlin + 4))/2),INT((SCOL()-(m.wlm+6))/2) ;
    TO INT((SROW()-(m.mlin + 4))/2)+m.mlin+4, ;
          INT((SCOL()-(m.wlm+6))/2)+m.wlm+5 ;
    TITLE m.titl FLOAT NOCLOSE SHADOW DOUBLE COLOR SCHEME m.col_sheme


IF WVISIBLE("s_dialog")
    ACTIVATE WINDOW s_dialog SAME
ELSE
    ACTIVATE WINDOW s_dialog NOSHOW
ENDIF

_MLINE = 0
FOR m.v = 1 TO m.mlin
    IF m.v = 1
        ?? PADC( MLINE(m.mess, 1, _MLINE), m.wlm + 4)
                                 && Вывод строк сообщения
    ELSE
        ?? PADC( MLINE(m.mess, 1, _MLINE), m.wlm + 4)
                                 && Вывод строк сообщения
    ENDIF
ENDFOR

@ m.mlin + 1,( m.wlm + 5 - m.n_key * (m.s_lin + 3) + 3) / 2 GET m.v_key ;
    PICTURE m.s_key ;
    SIZE 1, m.s_lin, 3 ;
    DEFAULT 1
IF _DOS
	numb = AT('/',SCHEME(col_sheme, 1))
	color = SUBSTR(SCHEME(col_sheme, 1),numb)
ENDIF
IF m.col_sheme = 7
    ?? CHR(7)
    CLEAR TYPEAHEAD
ENDIF

IF NOT WVISIBLE("s_dialog")
    ACTIVATE WINDOW s_dialog
ENDIF

READ CYCLE;
	 MODAL;
	 TIMEOUT(10)

RELEASE WINDOW s_dialog
SET MEMOWIDTH TO m.old_width
IF m.talkstat = "ON"
    SET TALK ON
ENDIF
POP KEY
RETURN m.v_key