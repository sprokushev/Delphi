*****************************************************************
*:
*:             Файл процедур : LIBRARY.PRG
*:
*****************************************************************
*	PROCEDURE About - Информация о системе
*					Параметр mess - Наименование системы
*
*	PROCEDURE proc_error - Обработка ошибок программы
*		Параметры : ERROR(), PROGRAM(), MESSAGE(), LINE()
*		В вызывающей программе должны быть определены:
*			_g_mas_error [4] - массив
*			end_progr() - функция завершения программы
*
*	FUNCTION full_brow([titleC]) - Отображение BROWSE на весь экран
* 		Где titleC - заголовок окна (по умолчанию пустой).
* 		 Возврат: .T. если нажали Enter на записи,
* 		.F.- если Esc, или Enter на пустом списке
*
*	FUNCTION barprcnt([parN][,messageC]) - Отображение линейки для
*		SCAN и т.п.
*		parN - количество делений (по умолчанию - 20)
* 		messageC - примечание     (по умолчанию - '')
*		В вызывающей процедуре должна быть объявлена
*		общая переменная текущего счетчика:  m.barblk = 0
*		По завершению SCAN ее надо обнулять !
*
*	FUNCTION show_file ( <'файл'>[,<'текст заголовка'>,<'текст подвала'>,
* 		<N цв.схемы>,<коорд.лев.верх.угла>,<коорд.прав.нижн.угла>] )
*
*	FUNCTION mes_dial(color_sheme, ;  && Цветовая схема окна
*               title, ;    &&  TITLE
*               message, ;  && Выводимое сообщение
*               kol_key	;   && Кол-во клавиш (если нет mes1, mes2, mes3
*               [ mes1,]    && Подсказка 1 клавиши
*               [ mes2,]    && Подсказка 2 клавиши
*               [ mes3])    && Подсказка 3 клавиши
*
*	PROCEDURE go_old_rec - Переход на старую запись, параметр <ВырN - старый
*							N записи>
*
*	PROCEDURE rec_no - Возвращает текущий номер записи
*
*	PROCEDURE r_lock - Ручная блокировка текущей записи. Возвращает .T.,
*		 если удачно, .F. - если нет и выводит диалог
*
*	FUNCTION propis_num(<вырN1>) - Функция получает в качестве
*		входного параметра число (например, 250 ) и возвращает его в виде
*		строки:	'250 (двести пятьдесят)'
*
*	FUNCTION propis_rub(<вырN1>) - 	Функция получает в качестве
*		входного параметра число (например, 250.25 ) и возвращает его
*		в виде строки:	'250 (двести пятьдесят) руб. 25 коп.'
*
*	FUNCTION monthr(вырD) - Функция возвращает наименование месяца
*							для заданной даты
*
*	FUNCTION dowr(вырD) - Возвращает наименование дня недели
* 						  из параметра в формате даты
*
*	FUNCTION DayMonth(вырD) - Возвращает количество дней в месяце по дате
*
*	FUNCTION existfile(file) - Возвращает .T., если файл найден
*
*	FUNCTION func_help -  Подсказка по текущему окну
************************************************************
*	Информация о системе
************************************************************
PROCEDURE About
PARAMETER m.mes
=mes_dial(5,' О системе ', ;
		'\r';
		+ IIF(EMPTY(m.mes),'','\r' + m.mes);
		+'\r(C) 1995-1998 Ким Е.А., ВТУ АО "Нефтяная компания "ЛУКойл"';
		+'\r';
        +'\rСегодня '+ dowr(DATE())+', '+LTRIM(STR(DAY(DATE())))+' '+ monthr(DATE())+' '+LTRIM(STR(YEAR(DATE())))+' года';
        +'\r\rПамять, Кб: '+ 'всего '+ALLTRIM(STR(VAL(SYS(1001))/1024)+IIF(EMPTY(VAL(SYS(23))),'','+'+SYS(23)+'(EMS)'))+', использовано '+ ALLTRIM(STR(VAL(SYS(1016))/1024));
        +'\rЗначение FILES в CONFIG.SYS: '+ SYS(2010);
        +'\rДрайвер принтера: '+ IIF(EMPTY(_PDSETUP),'нет',_PDSETUP);
		+'\rСетевое имя: '+ IIF(LEFT(ALLTRIM(SYS(0)),6)='#','нет',LEFT(ALLTRIM(SYS(0)),6));
		+'\rТекущий каталог: '+ SYS(5) + CURDIR();
	  	+'\rТекущая база данных: '+ IIF(EMPTY(DBF()),'нет',DBF());
	  	+'\rСтартовый каталог: '+ SYS(2004);
	  	+'\rФайл ресурсов: '+ SYS(2005);
		,1)
RETURN
********************************************
* Отображение BROWSE на весь экран
* Вызов =full_brow([titleC])
* где titleC - заголовок окна
* (по умолчанию пустой)
* возврат: .T. если нажали Enter на записи,
* .F.- если Esc, или Enter на пустом списке
*******************************************
FUNCTION full_brow
PARAMETERS m.br_title
PRIVATE br_title,;
		retval, rem_ind,;
		enter_key, esc_key, oldselect, startbrow
IF PARAMETERS() < 1
	m.br_title=''
ENDIF
m.retval = .F.
m.rem_ind = .F.
m.enter_key = ON('KEY','ENTER')
m.esc_key = ON('KEY','ESC')
m.oldselect = ALIAS()
m.startbrow = 'BROWSE REST NOREFRESH NOEDIT NODELETE NOAPPEND NOMENU TIMEOUT(m._g_swait) WINDOW [s_fsbrow] TITLE (m.br_title)'

IF !USED('bas_ind')
	USE (m._g_sdata +'bas_ind') IN 0 ORDER TAG "name_base"
	m.rem_ind = .T.
ENDIF
IF SEEK(m.oldselect,'bas_ind')
	m.startbrow = m.startbrow + bas_ind.fieldbrow
ENDIF

DEFINE WINDOW 's_fsbrow';
	FROM IIF(SET('SYSMENU') = 'OFF',0,1), 0 ;
	TO SROWS() - 1, SCOLS() - 1;
		IN SCREEN;
		SYSTEM;
       	CLOSE ;
		FLOAT ;
		GROW ;
		MINIMIZE;
		ZOOM;
		COLOR SCHEME 10

ON KEY LABEL Enter DO lookentr
ON KEY LABEL ESC DO lookescp
&startbrow
ON KEY LABEL Enter &enter_key
ON KEY LABEL Esc &esc_key
RELEASE WINDOW 's_fsbrow'
IF m.rem_ind
	SELECT bas_ind
	USE
	SELECT (m.oldselect)
ENDIF
RETURN m.retval

***********************
PROCEDURE lookentr
IF !BOF() AND !EOF()
	m.retval = .T.
ENDIF
RELEASE WINDOW (WONTOP())

***********************
PROCEDURE lookescp
RELEASE WINDOW (WONTOP())
**************************************************
*	Закрывает таблицу, если открыта
**************************************************
FUNCTION Use0
PARAMETER m.alias
IF USED(m.alias)
	USE IN (m.alias)
ENDIF
RETURN

**************************************************
* Отображение линейки для
* SCAN и т.п. Вызов =barprcnt([parN][,messageC])
* где parN - количество делений (по умолчанию - 20)
*     messageC - примечание     (по умолчанию - '')
* В вызывающей процедуре должна быть объявлена
* общая переменная текущего счетчика:
* m.barblk = 0
* По завершению SCAN ее надо обнулять !
**************************************************
FUNCTION barprcnt
PARAMETERS maxbar, comsg
PRIVATE maxbar
IF PARAMETERS() < 2
	m.comsg = ''
ENDIF
IF PARAMETERS() < 1
	m.maxbar = 20
	m.comsg = ''
ENDIF
IF RECCOUNT() < 20
	m.maxbar = RECCOUNT()
ENDIF
IF RECNO() > (m.barblk+1)*RECCOUNT()/m.maxbar
	WAIT WINDOW m.comsg+' '+REPLICATE('-',(m.barblk+1));
		+REPLICATE('-',m.maxbar-(m.barblk + 2));
		+PADL(LTRIM(STR((m.barblk+1)*100/(m.maxbar-1))),4);
		+'%' NOWAIT
		m.barblk = m.barblk + 1
ENDIF

*************************************************************************
*  Просмотр файла в окне
*	Формат вызова:
*	show_file ( <'файл'>;
*          [,<'текст заголовка'>,<'текст подвала'>,<N цветовой схемы>,
*            <координаты лев.верх. угла>,<координаты прав.нижн. угла>] )
* По умолчанию используется весь доступный экран
* и цветовая схема номер 10 (BROWSE)
*************************************************************************
FUNCTION show_file
PARAMETERS fil, title, footer, m.cc, fr, fc, tr, tc
PRIVATE ALL EXCEPT _*

IF PARAMETERS() < 1
	RETURN
ENDIF
IF PARAMETERS() < 2
	m.title = ''
ENDIF
IF PARAMETERS() < 3
	m.footer = ''
ENDIF
IF PARAMETERS() < 4
	m.cc = 10
ENDIF
IF PARAMETERS() < 5
	IF SET('SYSMENU') = 'OFF'
		m.fr = 0
	ELSE
		m.fr = 1
	ENDIF
ENDIF
IF PARAMETERS() < 6
	m.fc = 0
ENDIF
IF PARAMETERS() < 7
	m.tr = SROWS() - 1
ENDIF
IF PARAMETERS() < 8
	m.tc = SCOLS() - 1
ENDIF

m.wn =  SYS(2015)

IF m.cc = 0
	DEFINE WINDOW (m.wn);
		FROM m.fr,m.fc ;
		TO m.tr, m.tc;
			IN SCREEN;
			FOOTER m.footer;
			TITLE m.title;
			SYSTEM;
        	CLOSE ;
			FLOAT ;
			GROW ;
			MINIMIZE;
			ZOOM
ELSE
	DEFINE WINDOW (m.wn);
		FROM m.fr,m.fc ;
		TO m.tr, m.tc;
			IN SCREEN;
			FOOTER m.footer;
			TITLE m.title;
			SYSTEM;
        	CLOSE ;
			FLOAT ;
			GROW ;
			MINIMIZE;
			ZOOM;
			COLOR SCHEME m.cc
ENDIF

MODIFY COMMAND (m.fil);
	NOEDIT;
	WINDOW (m.wn)

RELEASE WINDOW (m.wn)

PROCEDURE mes_lock
PARAMETER str
WAIT CLEAR
str = 'Ждите - идет блокировка записи в базе ' + ALLTRIM(str) + CHR(13);
	+ '______________________________________________' + CHR(13);
	+ '[Esc] - прервать.'
WAIT str WINDOW NOWAIT

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
	= HButtShadow(m.mlin + 1,( m.wlm + 5 - m.n_key * (m.s_lin + 3) + 3) / 2, n_key, m.s_lin, 3, color)
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
	 TIMEOUT(60)

RELEASE WINDOW s_dialog
SET MEMOWIDTH TO m.old_width
IF m.talkstat = "ON"
    SET TALK ON
ENDIF
POP KEY
RETURN m.v_key

FUNCTION HButtShadow
PARAMETER m.row, m.col, m.numobj, m.size1, m.size2, m.color
IF PARAMETERS() < 3
	?? ''
	WAIT ' Число параметров должно быть не меньше 3-х ! ' WINDOW NOWAIT
	RETURN
ENDIF
DO CASE
	case PARAMETERS() = 3
		m.size1 = 10
		m.size2 = 1
		IF SET('BLINK') = 'OFF'
			m.color = 'n/b*'
		ELSE
			m.color = 'n+'
		ENDIF
	case PARAMETERS() = 4
		m.size2 = 1
		IF SET('BLINK') = 'OFF'
			m.color = 'n/b*'
		ELSE
			m.color = 'n+'
		ENDIF
	case PARAMETERS() = 5
		IF SET('BLINK') = 'OFF'
			m.color = 'n/b*'
		ELSE
			m.color = 'n+'
		ENDIF
ENDCASE

FOR i = 1 TO numobj
	step = (i-1) * (size1 + size2)
	@ m.row+1, (m.col+1) + step SAY REPLICATE('-', m.size1) COLOR &color
	@ m.row, (col()-1) SAY '-' COLOR &color
ENDFOR
RETURN

FUNCTION Shadow
PARAMETER m.lconrow, m.lconcol, m.col, m.row, m.color
IF PARAMETERS() < 2
	?? ''
	WAIT ' Число параметров должно быть не меньше 2-х ! ' WINDOW NOWAIT
	RETURN
ENDIF
DO CASE
	case PARAMETERS() = 2
		STORE 1 TO m.row, m.col
		IF SET('BLINK') = 'OFF'
			m.color = 'n*'
		ELSE
			m.color = 'n+'
		ENDIF
	case PARAMETERS() = 3
		STORE 1 TO m.row
		IF SET('BLINK') = 'OFF'
			m.color = 'n*'
		ELSE
			m.color = 'n+'
		ENDIF
	case PARAMETERS() = 4
		IF SET('BLINK') = 'OFF'
			m.color = 'n*'
		ELSE
			m.color = 'n+'
		ENDIF
ENDCASE
FOR i = 1 TO m.row
	IF i = 1		&& OR i = m.row
		@ m.lconrow + (i-1), m.lconcol + m.col SAY '-'COLOR &color
	ELSE
		@ m.lconrow + (i-1), m.lconcol + m.col SAY '-'COLOR &color
	ENDIF
ENDFOR
FOR i = 1 TO m.col
	@ m.lconrow + m.row, m.lconcol + 1 + (i-1) SAY '-'COLOR &color
ENDFOR
RETURN

PROCEDURE SetColor
SET COLOR OF SCHEME 1 TO W/N, N/BG*,GR+/B,GR+/B,R+/B,W+/GR,B/W*,N+/N,GR+/B,R+/B,+
SET COLOR OF SCHEME 2 TO GR+/B*, N/W, N/W*, B/W*, B/W*, W+/N*, R/W*, N+/N, B/W, W/W*,+
SET COLOR OF SCHEME 3 TO W/W*, N/W*, BG/N, BG/N, n/W, W+/B*, R/W*, N+/N, BG/N, BG/N,+
SET COLOR OF SCHEME 4 TO W/W*, N/W*, N/W*, B/W, n/W, W+/B*, R/W*, N+/N, B/W, W/N,+
SET COLOR OF SCHEME 5 TO W+/B*, W+/B, W+/B*, GR+/B*, N/W*, B/W*, R/W, N+/N, N/W, N+/W,+
SET COLOR OF SCHEME 6 TO W/W*, N/W*, B/W*, N/W*, N+/W*, W+/B, R/W, N+/N, N/W, N+/W,+
SET COLOR OF SCHEME 7 TO GR+/R, W+/W, GR+/R, W+/R, W/R, N/W*, R/W, N+/N, N/W, W/R,+
SET COLOR OF SCHEME 8 TO GR+/B,GR+/B,N/W,N/W,N+/W,N/W*,R/W,N+/N,N/W,W/B,+
SET COLOR OF SCHEME 9 TO W/W*,N/W*,N/W*,N/W*,N+/W*,W+/B,R/W,N+/N,N/W,N+/W,+
SET COLOR OF SCHEME 10 TO N/W,W+/B*,W+/B,B/W*,W/N*,W+/B,W+/B*,N+/N,N/W,N+/W,+
SET COLOR OF SCHEME 11 TO W+/BG,W+/W,GR+/W,GR+/W,N+/W,W+/GR,W/B,N+/N,W+/B,W/BG,+
SET COLOR OF SCHEME 12 TO GR+/R,W+/W,GR+/R,W+/R,W/R,W+/N,GR+/R,N+/N,W+/R,W/R,+
* Scheme 15 - Диалоговое окно с GET для ввода пароля(затемненный)
SET COLOR OF SCHEME 15 TO , N/B
* Scheme 20 - Окно ввода данных
SET COLOR OF SCHEME 20 TO N/W, N/W*, N/W, W+/W, W+/N*, N/W*, GR+/G, N+/N, W+/G, N+/G
* Scheme 21 - Окно списка в окне ввода по схеме 20
SET COLOR OF SCHEME 21 TO W/BG, W+/BG, N+/BG, GR+/BG, W+/N*, W+/B, GR+/BG, N+/N, N/BG+, N+/BG+,+
* Scheme 22 - Окно ввода данных (DESKTOP)
SET COLOR OF SCHEME 22 TO N/W, W+/B, N/W, W+/W, W+/N*, N/W*, W+/B, N+/N, W+/B, N+/G
RETURN

PROCEDURE UnSetColor
SET COLOR OF SCHEME 1 TO
SET COLOR OF SCHEME 2 TO
SET COLOR OF SCHEME 3 TO
SET COLOR OF SCHEME 4 TO
SET COLOR OF SCHEME 5 TO
SET COLOR OF SCHEME 6 TO
SET COLOR OF SCHEME 7 TO
SET COLOR OF SCHEME 8 TO
SET COLOR OF SCHEME 9 TO
SET COLOR OF SCHEME 10 TO
SET COLOR OF SCHEME 11 TO
SET COLOR OF SCHEME 12 TO
SET COLOR OF SCHEME 15 TO
SET COLOR OF SCHEME 20 TO
SET COLOR OF SCHEME 21 TO
SET COLOR OF SCHEME 22 TO
RETURN

PROCEDURE mesdialold
PARAMETERS col_sheme, titl, mess, n_key, mes1, mes2, mes3
PRIVATE mlin, wlm, old_width, v, s_key, s_lin, par, v_key, m.talkstat
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
    TO INT((SROW()-(m.mlin + 4))/2)+m.mlin+3, ;
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

IF m.col_sheme = 7
    ?? CHR(7)
    CLEAR TYPEAHEAD
ENDIF

IF NOT WVISIBLE("s_dialog")
    ACTIVATE WINDOW s_dialog
ENDIF

READ CYCLE;
	 MODAL;
	 TIMEOUT(120)

RELEASE WINDOW s_dialog
SET MEMOWIDTH TO m.old_width
IF m.talkstat = "ON"
    SET TALK ON
ENDIF
RETURN m.v_key
**********************************************
*	Переход на старую запись
**********************************************
PROCEDURE go_old_rec
PARAMETER old_rec
PRIVATE old_rec
IF m.old_rec = 0
	GO TOP
ELSE
	IF m.old_rec > RECCOUNT()
		GO BOTTOM
	ELSE
		GO m.old_rec
	ENDIF
ENDIF

**********************************************
*	Возвращает номер текущей записи
**********************************************
PROCEDURE rec_no
RETURN RECNO()

**********************************************
*	Блокировка текущей записи
**********************************************
PROCEDURE r_lock
DO WHILE !RLOCK()
	IF 2 = mes_dial( 7, '< Внимание >', '\rБаза данных заблокирована другим пользователем\rЧто будем делать?', 2, '\!\<Повторить', '\?\<Закончить')
		RETURN .F.
	ENDIF
ENDDO
RETURN .T.

**********************************************
*	Возвращает код работника, декодируя его из
*	 формата поля f_id
**********************************************
PROCEDURE dcr_f_id
PARAMETER m.p_f_id
PRIVATE m.vv, m.p_f_id
m.vv = IIF(EMPTY(m.p_f_id),0,ASC(m.p_f_id))
RETURN m.vv
****************************************************
*	Функция удаляет лишние пробелы и переводы строки
****************************************************
PROCEDURE del_space
PARAMETERS vv
PRIVATE vv, len_str, qr, kk, os, s, vvv
vv = ALLTRIM(vv)
qr = CHR(13)
len_str = LEN(vv)
kk=0
vvv = ''
os = ''
FOR kk = 1 TO len_str
	s = SUBSTR(vv, kk, 1)
	DO CASE
		CASE s = ' '
			IF os <> qr
				os = ' '
			ENDIF
		CASE s = qr
			os = s + CHR(10)
			kk = kk + 1
		OTHERWISE
			vvv = vvv + os + s
			os = ''
	ENDCASE
ENDFOR
RETURN vvv

********************************************************
*				propis_num(<вырN1>)
*
*	Функция получает в качестве входного параметра число
*	(например, 250 ) и возвращает его в виде строки:
*
*				'250 (двести пятьдесят)'
********************************************************
FUNCTION propis_num
PARAMETERS num
PRIVATE str_num, srt_num1, v, vv
str_num1 = LTRIM(STR(num))
str_num = ''
IF num > 100000000000
	v = INT( num / 1000000000)
	IF v > 100
		vv = INT( v / 100) * 100
		=ed_num( vv)
		IF v - vv = 0
			str_num = str_num + ' миллиардов'
		ENDIF
		num = num - vv * 1000000000
	ENDIF
ENDIF
IF num >= 1000000000
	v = INT( num / 1000000000)
	IF v > 20
		vv = INT( v / 10) * 10
		=ed_num( vv)
		vv = v - vv
		IF vv = 0
			str_num = str_num + ' миллиардов'
		ELSE
		DO CASE
			CASE vv = 1
				str_num = str_num + ' один'
			CASE vv = 2
				str_num = str_num + ' два'
			OTHERWISE
				=ed_num( vv)
		ENDCASE
			=ed_num(( vv) * 1000000000)
		ENDIF
	ELSE
		DO CASE
			CASE v = 1
				str_num = str_num + ' один'
			CASE v = 2
				str_num = str_num + ' два'
			OTHERWISE
				=ed_num( v)
		ENDCASE
		=ed_num( v * 1000000000)
	ENDIF
	num = num - v * 1000000000
ENDIF


IF num > 100000000
	v = INT( num / 1000000)
	IF v > 100
		vv = INT( v / 100) * 100
		=ed_num( vv)
		IF v - vv = 0
			str_num = str_num + ' миллионов'
		ENDIF
		num = num - vv * 1000000
	ENDIF
ENDIF
IF num >= 1000000
	v = INT( num / 1000000)
	IF v > 20
		vv = INT( v / 10) * 10
		=ed_num( vv)
		vv = v - vv
		IF vv = 0
			str_num = str_num + ' миллионов'
		ELSE
		DO CASE
			CASE vv = 1
				str_num = str_num + ' один'
			CASE vv = 2
				str_num = str_num + ' два'
			OTHERWISE
				=ed_num( vv)
		ENDCASE
			=ed_num(( vv) * 1000000)
		ENDIF
	ELSE
		DO CASE
			CASE v = 1
				str_num = str_num + ' один'
			CASE v = 2
				str_num = str_num + ' два'
			OTHERWISE
				=ed_num( v)
		ENDCASE
		=ed_num( v * 1000000)
	ENDIF
	num = num - v * 1000000
ENDIF
IF num > 100000
	v = INT( num / 1000)
	vv = INT( v / 100) * 100
	=ed_num( vv)
	IF v - vv = 0
		str_num = str_num + ' тысяч'
	ENDIF
	num = num - vv * 1000
ENDIF
IF num >= 1000
	v = INT( num / 1000)
	IF v > 20
		vv = INT( v / 10) * 10
		=ed_num( vv)
		vv = v - vv
		IF vv = 0
			str_num = str_num + ' тысяч'
		ELSE
			=ed_num( vv)
			=ed_num(( vv) * 1000)
		ENDIF
	ELSE
		=ed_num( v)
		=ed_num( v * 1000)
	ENDIF
	num = num - v * 1000
ENDIF
IF num > 100
	v = INT( num / 100) * 100
	=ed_num( v)
	num = num - v
ENDIF
IF num > 20
	v = INT( num / 10) * 10
	=ed_num( v)
	=ed_num( num - v)
ELSE
	=ed_num( num)
ENDIF
RETURN str_num1 + ' (' +ALLTRIM(str_num) + ')'

*********************************************************
FUNCTION ed_num
PARAMETER v
PRIVATE vv
DO CASE
	CASE v = 0
		vv = ''
	CASE v = 1
		vv = 'одна'
	CASE v = 2
		vv = 'две'
	CASE v = 3
		vv = 'три'
	CASE v = 4
		vv = 'четыре'
	CASE v = 5
		vv = 'пять'
	CASE v = 6
		vv = 'шесть'
	CASE v = 7
		vv = 'семь'
	CASE v = 8
		vv = 'восемь'
	CASE v = 9
		vv = 'девять'
	CASE v = 10
		vv = 'десять'
	CASE v = 11
		vv = 'одиннадцать'
	CASE v = 12
		vv = 'двенадцать'
	CASE v = 13
		vv = 'тринадцать'
	CASE v = 14
		vv = 'четырнадцать'
	CASE v = 15
		vv = 'пятнадцать'
	CASE v = 16
		vv = 'шестнадцать'
	CASE v = 17
		vv = 'семнадцать'
	CASE v = 18
		vv = 'восемнадцать'
	CASE v = 19
		vv = 'девятнадцать'
	CASE v = 20
		vv = 'двадцать'
	CASE v = 30
		vv = 'тридцать'
	CASE v = 40
		vv = 'сорок'
	CASE v = 50
		vv = 'пятьдесят'
	CASE v = 60
		vv = 'шестьдесят'
	CASE v = 70
		vv = 'семьдесят'
	CASE v = 80
		vv = 'восемьдесят'
	CASE v = 90
		vv = 'девяносто'
	CASE v = 100
		vv = 'сто'
	CASE v = 200
		vv = 'двести'
	CASE v = 300
		vv = 'триста'
	CASE v = 400
		vv = 'четыреста'
	CASE v = 500
		vv = 'пятьсот'
	CASE v = 600
		vv = 'шестьсот'
	CASE v = 700
		vv = 'семьсот'
	CASE v = 800
		vv = 'восемьсот'
	CASE v = 900
		vv = 'девятьсот'
	CASE v = 1000
		vv = 'тысяча'
	CASE v >= 2000 AND v <= 4000
		vv = 'тысячи'
	CASE v >= 5000 AND v <= 20000
		vv = 'тысяч'
	CASE v = 1000000
		vv = 'миллион'
	CASE v >= 2000000 AND v <= 4000000
		vv = 'миллиона'
	CASE v >= 5000000 AND v <= 20000000
		vv = 'миллионов'
	CASE v = 1000000000
		vv = 'миллиард'
	CASE v <= 2000000000 AND v <= 4000000000
		vv = 'миллиарда'
	CASE v >= 5000000000 AND v <= 20000000000
		vv = 'миллиардов'
	OTHERWISE
		vv = ' ???? '
ENDCASE
str_num = str_num + ' ' + vv

********************************************************
*				propis_rub(<вырN1>)
*
*	Функция получает в качестве входного параметра число
*	(например, 250.25 ) и возвращает его в виде строки:
*
*				'250 (двести пятьдесят) руб. 25 коп.'
********************************************************
FUNCTION propis_rub
PARAMETERS num
PRIVATE str_num, srt_num1, v, vv, str_num2
IF num > INT(num)
 	str_num2 = ' руб. ' + LTRIM(STR(100 * (num - INT(num)),2)) +' коп.'
	num = INT(num)
ELSE
	str_num2 = ' руб.'
ENDIF
str_num1 = LTRIM(STR(num))
str_num = ''
IF num > 100000000000
	v = INT( num / 1000000000)
	IF v > 100
		vv = INT( v / 100) * 100
		=ed_num1( vv)
		IF v - vv = 0
			str_num = str_num + ' миллиардов'
		ENDIF
		num = num - vv * 1000000000
	ENDIF
ENDIF
IF num >= 1000000000
	v = INT( num / 1000000000)
	IF v > 20
		vv = INT( v / 10) * 10
		=ed_num1( vv)
		vv = v - vv
		IF vv = 0
			str_num = str_num + ' миллиардов'
		ELSE
		DO CASE
			CASE vv = 1
				str_num = str_num + ' один'
			CASE vv = 2
				str_num = str_num + ' два'
			OTHERWISE
				=ed_num1( vv)
		ENDCASE
			=ed_num1(( vv) * 1000000000)
		ENDIF
	ELSE
		DO CASE
			CASE v = 1
				str_num = str_num + ' один'
			CASE v = 2
				str_num = str_num + ' два'
			OTHERWISE
				=ed_num1( v)
		ENDCASE
		=ed_num1( v * 1000000000)
	ENDIF
	num = num - v * 1000000000
ENDIF


IF num > 100000000
	v = INT( num / 1000000)
	IF v > 100
		vv = INT( v / 100) * 100
		=ed_num1( vv)
		IF v - vv = 0
			str_num = str_num + ' миллионов'
		ENDIF
		num = num - vv * 1000000
	ENDIF
ENDIF
IF num >= 1000000
	v = INT( num / 1000000)
	IF v > 20
		vv = INT( v / 10) * 10
		=ed_num1( vv)
		vv = v - vv
		IF vv = 0
			str_num = str_num + ' миллионов'
		ELSE
		DO CASE
			CASE vv = 1
				str_num = str_num + ' один'
			CASE vv = 2
				str_num = str_num + ' два'
			OTHERWISE
				=ed_num1( vv)
		ENDCASE
			=ed_num1(( vv) * 1000000)
		ENDIF
	ELSE
		DO CASE
			CASE v = 1
				str_num = str_num + ' один'
			CASE v = 2
				str_num = str_num + ' два'
			OTHERWISE
				=ed_num1( v)
		ENDCASE
		=ed_num1( v * 1000000)
	ENDIF
	num = num - v * 1000000
ENDIF
IF num > 100000
	v = INT( num / 1000)
	vv = INT( v / 100) * 100
	=ed_num1( vv)
	IF v - vv = 0
		str_num = str_num + ' тысяч'
	ENDIF
	num = num - vv * 1000
ENDIF
IF num >= 1000
	v = INT( num / 1000)
	IF v > 20
		vv = INT( v / 10) * 10
		=ed_num1( vv)
		vv = v - vv
		IF vv = 0
			str_num = str_num + ' тысяч'
		ELSE
			=ed_num1( vv)
			=ed_num1(( vv) * 1000)
		ENDIF
	ELSE
		DO CASE
			CASE v = 1
				str_num = str_num + ' одна'
			CASE v = 2
				str_num = str_num + ' две'
			OTHERWISE
				=ed_num( v)
		ENDCASE
		=ed_num1( v * 1000)
	ENDIF
	num = num - v * 1000
ENDIF
IF num > 100
	v = INT( num / 100) * 100
	=ed_num1( v)
	num = num - v
ENDIF
IF num > 20
	v = INT( num / 10) * 10
	=ed_num1( v)
	=ed_num1( num - v)
ELSE
	=ed_num1( num)
ENDIF
RETURN str_num1 + ' (' +ALLTRIM(str_num) + ')' + str_num2

*********************************************************
FUNCTION ed_num1
PARAMETER v
PRIVATE vv
DO CASE
	CASE v = 0
		vv = ''
	CASE v = 1
		vv = 'один'
	CASE v = 2
		vv = 'два'
	CASE v = 3
		vv = 'три'
	CASE v = 4
		vv = 'четыре'
	CASE v = 5
		vv = 'пять'
	CASE v = 6
		vv = 'шесть'
	CASE v = 7
		vv = 'семь'
	CASE v = 8
		vv = 'восемь'
	CASE v = 9
		vv = 'девять'
	CASE v = 10
		vv = 'десять'
	CASE v = 11
		vv = 'одиннадцать'
	CASE v = 12
		vv = 'двенадцать'
	CASE v = 13
		vv = 'тринадцать'
	CASE v = 14
		vv = 'четырнадцать'
	CASE v = 15
		vv = 'пятнадцать'
	CASE v = 16
		vv = 'шестнадцать'
	CASE v = 17
		vv = 'семнадцать'
	CASE v = 18
		vv = 'восемнадцать'
	CASE v = 19
		vv = 'девятнадцать'
	CASE v = 20
		vv = 'двадцать'
	CASE v = 30
		vv = 'тридцать'
	CASE v = 40
		vv = 'сорок'
	CASE v = 50
		vv = 'пятьдесят'
	CASE v = 60
		vv = 'шестьдесят'
	CASE v = 70
		vv = 'семьдесят'
	CASE v = 80
		vv = 'восемьдесят'
	CASE v = 90
		vv = 'девяносто'
	CASE v = 100
		vv = 'сто'
	CASE v = 200
		vv = 'двести'
	CASE v = 300
		vv = 'триста'
	CASE v = 400
		vv = 'четыреста'
	CASE v = 500
		vv = 'пятьсот'
	CASE v = 600
		vv = 'шестьсот'
	CASE v = 700
		vv = 'семьсот'
	CASE v = 800
		vv = 'восемьсот'
	CASE v = 900
		vv = 'девятьсот'
	CASE v = 1000
		vv = 'тысяча'
	CASE v >= 2000 AND v <= 4000
		vv = 'тысячи'
	CASE v >= 5000 AND v <= 20000
		vv = 'тысяч'
	CASE v = 1000000
		vv = 'миллион'
	CASE v >= 2000000 AND v <= 4000000
		vv = 'миллиона'
	CASE v >= 5000000 AND v <= 20000000
		vv = 'миллионов'
	CASE v = 1000000000
		vv = 'миллиард'
	CASE v <= 2000000000 AND v <= 4000000000
		vv = 'миллиарда'
	CASE v >= 5000000000 AND v <= 20000000000
		vv = 'миллиардов'
	OTHERWISE
		vv = ' ???? '
ENDCASE
str_num = str_num + ' ' + vv

************************************************************
*	Функция возвращает наименование месяца для заданной даты
************************************************************

FUNCTION monthr
PARAMETER mes
mes = MONTH( mes)
DO CASE
	CASE mes = 1
		RETURN 'января'
	CASE mes = 2
		RETURN 'февраля'
	CASE mes = 3
		RETURN 'марта'
	CASE mes = 4
		RETURN 'апреля'
	CASE mes = 5
		RETURN 'мая'
	CASE mes = 6
		RETURN 'июня'
	CASE mes = 7
		RETURN 'июля'
	CASE mes = 8
		RETURN 'августа'
	CASE mes = 9
		RETURN 'сентября'
	CASE mes = 10
		RETURN 'октября'
	CASE mes = 11
		RETURN 'ноября'
	CASE mes = 12
		RETURN 'декабря'
ENDCASE
************************************************************
*	Функция возвращает наименование месяца для заданной даты
************************************************************
FUNCTION monthrr
PARAMETER mes
DO CASE
	CASE mes = 1
		RETURN 'январь'
	CASE mes = 2
		RETURN 'февраль'
	CASE mes = 3
		RETURN 'март'
	CASE mes = 4
		RETURN 'апрель'
	CASE mes = 5
		RETURN 'май'
	CASE mes = 6
		RETURN 'июнь'
	CASE mes = 7
		RETURN 'июль'
	CASE mes = 8
		RETURN 'август'
	CASE mes = 9
		RETURN 'сентябрь'
	CASE mes = 10
		RETURN 'октябрь'
	CASE mes = 11
		RETURN 'ноябрь'
	CASE mes = 12
		RETURN 'декабрь'
ENDCASE
************************************************************
* Возвращает наименование дня недели
* из параметра в формате даты
************************************************************

FUNCTION dowr
PARAMETER mes
mes = DOW(mes)
DO CASE
	CASE mes = 1
		RETURN 'воскресенье'
	CASE mes = 2
		RETURN 'понедельник'
	CASE mes = 3
		RETURN 'вторник'
	CASE mes = 4
		RETURN 'среда'
	CASE mes = 5
		RETURN 'четверг'
	CASE mes = 6
		RETURN 'пятница'
	CASE mes = 7
		RETURN 'суббота'
ENDCASE
**********************************************
*   Подсказка по текущему окну
**********************************************
FUNCTION func_help
PRIVATE vv, old_sel, old_mw, ml, m.topic_h, ti

vv = PADR(SUBSTR(WONTOP(),1,10),10,' ')
IF !vv = 'Подсказка'
	vv = 'w' + PADR(SUBSTR(WONTOP(),1,10),10,' ')
ENDIF
ti = IIF(_g_help_ed = 'edit_help','Подсказка по окну: ' + WONTOP(),'Помощь')

old_sel = SELECT()

IF USED("akz_help")
	SELECT akz_help
	SET ORDER TO TAG "topic_h"
ELSE
	SELECT 0
	USE (m._g_sdata+'akz_help') ORDER TAG "topic_h"
ENDIF

IF !SEEK(vv,'akz_help')
	SELECT akz_help
	APPEND BLANK
	m.topic_h = vv
	GATHER MEMVAR FIELDS topic_h
ENDIF
ml = MEMLINES(akz_help.help_m)
ml = IIF(ml <= 2, 4, ml+2)
DEFINE WINDOW s_help FROM IIF(ml>23,1,12-INT(ml/2)), 4  ;
		TO IIF(ml>23,24,12-INT(ml/2)+ml), 75 ;
		SHADOW GROW ZOOM CLOSE FLOAT TITLE ti ;
		SYSTEM COLOR SCHEME 10

SET SKIP OF MENU _MSYSMENU .T.

ml = IIF( _g_help_ed = 'edit_help','','NOEDIT')

MODIFY MEMO akz_help.help_m WINDOW s_help &ml

RELEASE WINDOW s_help
USE
SELECT( old_sel)

SET SKIP OF MENU _MSYSMENU .F.
**********************************************************
*	Функция возвращает количество дней в месяце по дате
**********************************************************
FUNCTION DayMonth
PARAMETER date
strmonth = ALLTRIM(STR(MONTH(date)))
stryear = ALLTRIM(STR(YEAR(date)))
IF strmonth # '12'
	strmonthnext = ALLTRIM(STR(MONTH(date) + 1))
	stryearnext = stryear
ELSE
	strmonthnext = '1'
	stryearnext = ALLTRIM(STR(YEAR(date) + 1))
ENDIF
datelast = CTOD('1/' + strmonthnext + '/' + stryearnext)
datebegin = CTOD('1/' + strmonth + '/' + stryear)
kolday = datelast - datebegin
RETURN kolday
**********************************************************
*	Функция возвращает .T., если файл найден
**********************************************************
FUNCTION existfile
PARAMETER checkfile

IF !FILE(ALLTRIM(checkfile))
	= mes_dial(7,'Внимание!','\rФайл ' + checkfile + ' не найден !';
		+ '\rОбратитесь к администратору.')
	RETURN .F.
ELSE
	RETURN .T.
ENDIF
*************************************************************
PROC a_locate  && Поиск на вхождение в тек.базе, учитываются
                && реляционные связи.
                && <pole> - массив с наименованиями полей
                && <zag>  - массив с заголовками для полей
*************************************************************
PARA pole,zag
PUSH KEY CLEAR
PRIVATE kol_pl,sel,poi,str,tab,brw,uk,i,p,p1,dl,t,x,x1,x2,;
        cou_fnd,c_fld,m_setescape,m_setcursor,pol,zg
pol='pole'
zg='zag'
m_setescape=SET('ESCAPE')
kol_pl=ALEN(&pol)
sel=ALIAS()
uk=IIF(EOF() OR BOF(),0,RECNO())
poi=SYS(2015)
tb1=STUFF(SYS(2015),9,0,'.')
tb=SUBSTR(tb1,1,8)
w_brow=SYS(2015)
afi=SYS(2015)
afi1=SYS(2015)
w_stat=SYS(2015)
c_fld=AFIELDS(&afi)
DEFINE WINDOW &w_stat ;
  FROM SROW()-2, 0 TO SROW()-1,SCOL()-1 ;
  NOFLOAT NOCLOSE SHADOW NOMINIMIZE NONE COLOR SCHEME 22
ACTI WIND &w_stat
@ 0,10 SAY 'Введите строку поиска , <Enter>-начать поиск '
@ 1,10 SAY '                         <Esc>-Отмена'
DEFI WIND &poi FROM 13,20 TO 15,60 ;
     TITLE 'Введите строку поиска';
     FOOTER 'Поиск ведется с текущей строки' SHADOW COLOR SCHEME 5
ACTI WIND &poi
IF TYPE('_g_strloc')='U'
   _g_strloc=SPACE(35)
ELSE
   _g_strloc=ALLTRIM(_g_strloc)
   _g_strloc=SUBSTR(_g_strloc,1,MIN(35,LEN(_g_strloc)))
   _g_strloc=_g_strloc+SPACE(35-LEN(_g_strloc))
ENDIF
m_setcursor=SET('CURSOR')
SET CURSOR ON
@ 0,2 GET _g_strloc
READ
SET CURSOR &m_setcursor
RELE WIND &poi
_g_strloc=UPPER(ALLTRIM(_g_strloc))
IF LASTKEY()=27 OR LEN(_g_strloc)=0
   RELE WIND &w_stat
   SET ESCAPE &m_setescape
   POP KEY
   RETURN .F.
ENDIF
str=''
tab=''
brw=''
i=0
DO WHILE i<kol_pl
    i=i+1
    IF !EMPTY(&pol[i])
       p=&pol[i]
       t=TYPE(p)
    ELSE
       t='U'
    ENDIF
    DO CASE
       CASE t='N'
            x=ASCAN(&afi,p)
            IF x>0
               p1=afi
            ELSE
               x1=AT('.',p)
               p1=1
               IF x1<2
                  x1=AT('->',p)
                  p1=2
               ENDIF
               IF x1>1
                  x2=ALLTRIM(SUBSTR(p,x1+p1))  &&Поле
                  x1=ALLTRIM(SUBSTR(p,1,x1-1)) &&Алиас
                  SELE &x1
                  =AFIELDS(&afi1)
                  p1=ASCAN(&afi1,x2)
                  IF p1>0
                     x=p1
                     p1=afi1
                  ENDIF
               ENDIF
            ENDIF
            IF x>0
               x1=&p1[x+2]  &&Длина
               x2=&p1[x+3]  &&Кол.дес.знаков
               dl=ALLTRIM(STR(x1))+','+ALLTRIM(STR(x2))
               p='STR('+p+','+dl+')'
               dl='('+dl+')'
            ELSE
               t='U'
            ENDIF
       CASE t='D'
            p='DTOC('+p+')'
            dl=''
       CASE t='L'
            p='IIF('+p+',".T.",".F.")'
            dl=''
       CASE t='C'
            dl='('+ALLTRIM(STR(LEN(&p)))+')'
       OTHERWISE
            t='U'
    ENDCASE
    IF t#'U'
       str=str+'+" "+'+p
       tab=tab+', p'+ALLTRIM(STR(i))+' '+t+dl
       brw=brw+', p'+ALLTRIM(STR(i))+':H="'+IIF(EMPTY(&zg[i]),'',&zg[i])+'"'
    ELSE
       =ADEL(&pol,i,1)
       =ADEL(&zg,i,1)
       i=i-1
       kol_pl=kol_pl-1
    ENDIF
ENDDO
str=SUBSTR(str,6)
tab=SUBSTR(tab,3)+', rec N(7,0)'
brw=SUBSTR(brw,3)
CREATE TABLE ('c:\'+tb1) (&tab)
DEFI WIND &w_brow FROM 3,5 TO 21,72 TITLE 'Результат поиска' ;
     SHADOW COLOR SCHEME 10
WAIT 'Идет поиск...<Esc>-Прервать' WIND NOWAIT
SELE &sel
*DO str_wait WITH str
SET ESCAPE ON
CLEAR TYPEAHEAD
KEYBOARD CHR(105)
LOCA FOR AT(_g_strloc,UPPER(&str))>0 REST
cou_fnd=0
DO WHILE FOUND()
   cou_fnd=cou_fnd+1
   SELE &tb
   APPE BLANK
   SELE &sel
   FOR i=1 TO kol_pl
       p=&pol[i]
       p1=tb+'.p'+ALLTRIM(STR(i))
       REPL &p1 WITH &p
   NEXT
   REPL &tb->rec WITH RECNO()
   SELE &tb
   SKIP -1*MIN(20,cou_fnd)
   IF !WVISIBLE(w_brow)
      ACTIVATE WINDOW &w_brow
   ENDIF
   BROW IN WIND &w_brow FIELDS &brw NODELE NOAPPEND NOMODI NOWAIT
   SELE &sel
   WAIT 'Идет поиск...<Esc>-Прервать' WIND NOWAIT
   CONTINUE
ENDDO
WAIT CLEAR
IF !FOUND()
   IF LASTKEY()=105
      WAIT 'Прервано' WIND NOWAIT
   ELSE
      WAIT 'Поиск закончен' WIND NOWAIT
   ENDIF
ENDIF
CLEAR TYPEAHEAD
SET ESCAPE OFF
SELE &tb
ACTI WIND &w_stat
@ 0,10 SAY '<^PgUp>-Первая  запись       <^Ентер>-На выбранную запись'
@ 1,10 SAY '<^PgDn>-Последняя запись      <Esc>-Отмена поиска        '
tit='Результат поиска : '+ALLTRIM(STR(cou_fnd))+' записей'
DEFI WIND &w_brow FROM 3,5 TO 21,72 TITLE tit ;
     SHADOW COLOR SCHEME 10
ACTI WIND &w_brow
ON KEY LABEL Ctrl-Enter KEYBOARD CHR(23)
ON KEY LABEL Ctrl-PgUp GO TOP
ON KEY LABEL Ctrl-PgDn GO BOTTOM
BROW IN WIND &w_brow FIELDS &brw TITLE tit NODELE NOAPPEND NOMODI
x=rec
ON KEY LABEL Ctrl-Enter
ON KEY LABEL Ctrl-PgUp
ON KEY LABEL Ctrl-PgDn
RELE WIND &w_brow
USE IN &tb
DELE FILE ('c:\'+tb1)
SELE &sel
IF LASTKEY()=23 AND cou_fnd>0
   GO x
ELSE
   IF uk>0
      GO uk
   ENDIF
ENDIF
RELE WIND &w_stat
SET ESCAPE &m_setescape
POP KEY
RETURN

PROC str_wait
PARA s
PRIVATE s1,s2
IF TYPE('s')#'U' AND !EMPTY(s)
   WAIT CLEAR
   s1=s+SPACE(70)
   s2=''
   DO WHILE LEN(ALLTRIM(s1))>0
      s2=s2+CHR(13)+SUBSTR(s1,1,70)
      s1=SUBSTR(s1,71)
   ENDDO
   WAIT s2 WIND
ENDIF
RETURN

PROCEDURE beginfunc
PARAMETER m.func, m.info
PRIVATE m.alias
m.alias = SELECT()
IF !USED('admstats')
   USE (m._f_admstats) IN 0 ORDER 0
ENDIF
SELECT admstats
time_operation = TIME()
date_operation = DATE()
INSERT INTO admstats (kod, operation, DATE, time_b) VALUES (m.kodsess, m.func, date_operation, time_operation)
IF !EMPTY(m.info)
	REPLACE info WITH m.info
ENDIF
m._g_admstats = RECNO('admstats')
USE IN admstats
SELECT (m.alias)
RETURN

PROCEDURE endfunc
PARAMETER m.mess, m.info
PRIVATE m.alias
m.alias = SELECT()

IF PARAMETERS() = 0
	m.mess = 'OK'
	m.info = ''
ENDIF
IF !USED('admstats')
   USE (m._f_admstats) IN 0 ORDER 0
ENDIF
SELECT admstats
GO m._g_admstats
REPLACE time_e WITH TIME(), status WITH m.mess, info WITH IIF(EMPTY(m.info),'',m.info) ADDITIVE
USE IN admstats
SELECT (m.alias)
RETURN

*************************************************************
PROC at_locate  && Поиск на вхождение в тек.базе, учитываются
                && реляционные связи.
                && <pole> - массив с наименованиями полей
                && <zag>  - массив с заголовками для полей
*************************************************************
PARA pole,zag
PUSH KEY CLEAR
PRIVATE kol_pl,sel,poi,str,tab,brw,uk,i,p,p1,dl,t,x,x1,x2,;
        cou_fnd,c_fld,m_setescape,m_setcursor,pol,zg,y,y1
pol='pole'
zg='zag'
m_setescape=SET('ESCAPE')
kol_pl=ALEN(&pol)
sel=ALIAS()
uk=IIF(EOF() OR BOF(),0,RECNO())
poi=SYS(2015)
tb1=STUFF(SYS(2015),9,0,'.')
tb=SUBSTR(tb1,1,8)
w_brow=SYS(2015)
afi=SYS(2015)
afi1=SYS(2015)
w_stat=SYS(2015)
c_fld=AFIELDS(&afi)
DEFINE WINDOW &w_stat ;
  FROM SROW()-4, 0 TO SROW()-1,SCOL()-1 ;
  NOFLOAT NOCLOSE SHADOW NOMINIMIZE COLOR SCHEME 22
ACTI WIND &w_stat
@ 0,10 SAY 'Введите строку поиска , <Enter>-начать поиск '
@ 1,10 SAY '                         <Esc>-Отмена'
y=INT((SROW()-4)/2)
y1=INT((SCOL()-41)/2)
DEFI WIND &poi FROM y,y1 TO y+2,y1+40 ;
     TITLE 'Введите строку поиска';
     FOOTER 'Поиск ведется с текущей строки' SHADOW COLOR SCHEME 5
ACTI WIND &poi
IF TYPE('_g_strloc')='U'
   _g_strloc=SPACE(35)
ELSE
   _g_strloc=ALLTRIM(_g_strloc)
   _g_strloc=SUBSTR(_g_strloc,1,MIN(35,LEN(_g_strloc)))
   _g_strloc=_g_strloc+SPACE(35-LEN(_g_strloc))
ENDIF
m_setcursor=SET('CURSOR')
SET CURSOR ON
@ 0,2 GET _g_strloc
READ MODAL
SET CURSOR &m_setcursor
RELE WIND &poi
_g_strloc=UPPER(ALLTRIM(_g_strloc))
IF LASTKEY()=27 OR LEN(_g_strloc)=0
   RELE WIND &w_stat
   SET ESCAPE &m_setescape
   POP KEY
   RETURN .F.
ENDIF
str=''
tab=''
brw=''
i=0
DO WHILE i<kol_pl
    i=i+1
    IF !EMPTY(&pol[i])
       p=UPPER(&pol[i])
       t=TYPE(p)
    ELSE
       t='U'
    ENDIF
    DO CASE
       CASE t='N'
            x=ASCAN(&afi,p)
            IF x>0
               p1=afi
            ELSE
               x1=AT('.',p)
               p1=1
               IF x1<2
                  x1=AT('->',p)
                  p1=2
               ENDIF
               IF x1>1
                  x2=ALLTRIM(SUBSTR(p,x1+p1))  &&Поле
                  x1=ALLTRIM(SUBSTR(p,1,x1-1)) &&Алиас
                  SELE &x1
                  =AFIELDS(&afi1)
                  p1=ASCAN(&afi1,x2)
                  IF p1>0
                     x=p1
                     p1=afi1
                  ENDIF
               ENDIF
            ENDIF
            IF x>0
               x1=&p1[x+2]  &&Длина
               x2=&p1[x+3]  &&Кол.дес.знаков
               dl=ALLTRIM(STR(x1))+','+ALLTRIM(STR(x2))
               p='STR('+p+','+dl+')'
               dl='('+dl+')'
            ELSE
               t='U'
            ENDIF
       CASE t='D'
            p='DTOC('+p+')'
            dl=''
       CASE t='L'
            p='IIF('+p+',".T.",".F.")'
            dl=''
       CASE t='C'
            dl='('+ALLTRIM(STR(LEN(&p)))+')'
       OTHERWISE
            t='U'
    ENDCASE
    IF t#'U'
       str=str+'+" "+'+p
       tab=tab+', p'+ALLTRIM(STR(i))+' '+t+dl
       brw=brw+', p'+ALLTRIM(STR(i))+':H="'+IIF(EMPTY(&zg[i]),'',&zg[i])+'"'
    ELSE
       =ADEL(&pol,i,1)
       =ADEL(&zg,i,1)
       i=i-1
       kol_pl=kol_pl-1
    ENDIF
ENDDO
str=SUBSTR(str,6)
tab=SUBSTR(tab,3)+', rec N(7,0)'
brw=SUBSTR(brw,3)
CREATE TABLE ('c:\'+tb1) (&tab)
DEFI WIND &w_brow FROM 3,5 TO 21,72 TITLE 'Результат поиска' ;
     SHADOW COLOR SCHEME 10
WAIT 'Идет поиск...<Esc>-Прервать' WIND NOWAIT
SELE &sel
*DO str_wait WITH str
SET ESCAPE ON
CLEAR TYPEAHEAD
KEYBOARD CHR(105)
LOCA FOR AT(_g_strloc,UPPER(&str))>0 REST
cou_fnd=0
DO WHILE FOUND()
   SET ESCAPE OFF
   cou_fnd=cou_fnd+1
   SELE &tb
   APPE BLANK
   SELE &sel
   FOR i=1 TO kol_pl
       p=&pol[i]
       p1=tb+'.p'+ALLTRIM(STR(i))
       REPL &p1 WITH &p
   NEXT
   REPL &tb->rec WITH RECNO()
   SELE &tb
   SKIP -1*MIN(14,cou_fnd)
   IF !WVISIBLE(w_brow)
      ACTIVATE WINDOW &w_brow
   ENDIF
   BROW IN WIND &w_brow FIELDS &brw NODELE NOAPPEND NOMODI NOWAIT NOMENU
   SELE &sel
   WAIT 'Идет поиск...<Esc>-Прервать' WIND NOWAIT
   SET ESCAPE ON
   CONTINUE
ENDDO
WAIT CLEAR
IF !FOUND()
   IF LASTKEY()=105
      WAIT 'Прервано' WIND NOWAIT
   ELSE
      IF cou_fnd=0
         WAIT 'Нет таких записей' WIND NOWAIT
      ELSE
         WAIT 'Поиск закончен' WIND NOWAIT
      ENDIF
   ENDIF
ENDIF
CLEAR TYPEAHEAD
SET ESCAPE OFF
SELE &tb
IF cou_fnd>0
   ACTI WIND &w_stat
   @ 0,10 SAY '<^PgUp>-Первая  запись       <^Enter>-На выбранную запись'
   @ 1,10 SAY '<^PgDn>-Последняя запись      <Esc>-Отмена поиска        '
   tit='Результат поиска : '+ALLTRIM(STR(cou_fnd))+IIF(cou_fnd=1,' запись',' записей')
   GO BOTTOM
   SKIP -1*MIN(7,cou_fnd)
   DEFI WIND &w_brow FROM 3,5 TO 21,72 TITLE tit ;
        SHADOW COLOR SCHEME 10
   ACTI WIND &w_brow
   ON KEY LABEL Ctrl-Enter KEYBOARD CHR(23)
   ON KEY LABEL Ctrl-PgUp GO TOP
   ON KEY LABEL Ctrl-PgDn GO BOTTOM
   BROW IN WIND &w_brow FIELDS &brw TITLE tit NODELE NOAPPEND NOMODI NOMENU
   ON KEY LABEL Ctrl-Enter
   ON KEY LABEL Ctrl-PgUp
   ON KEY LABEL Ctrl-PgDn
ENDIF
x=rec
RELE WIND &w_brow
USE IN &tb
DELE FILE ('c:\'+tb1)
SELE &sel
IF LASTKEY()=23 AND cou_fnd>0
   GO x
ELSE
   IF uk>0
      GO uk
   ENDIF
ENDIF
RELE WIND &w_stat
SET ESCAPE &m_setescape
POP KEY
RETURN

PROCEDURE Wait3Beep
PARAMETER m.mess
?? ''
WAIT CLEAR
WAIT m.mess WINDOW TIMEOUT (2)
RETURN
