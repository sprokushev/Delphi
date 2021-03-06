************************************************************************
*
*	Program: ������ ����� ��ᯥ��� ���㫥� ��ࠡ�⪨ 
*			������ �� �ਥ��-��।�� (FoxPro ���㫥�)
*	Description: 
*	Author: ��� �.�.
*
************************************************************************
PARAMETERS m.param1

*** ���ᨢ, ��������騩�� ���ଠ樥� �� �訡��:;
	_g_mas_error[1] = m.err;
	_g_mas_error[2] = m.prog;
	_g_mas_error[3] = m.mes;
	_g_mas_error[4] = m.lin

PUBLIC ARRAY _g_mas_error[4]
DECLARE _g_mas_error[4]
STORE '' TO _g_mas_error

ON ERROR DO errproc.prg;
	WITH ERROR(), PROGRAM(), MESSAGE(), LINENO()
	
WAIT [���� ��ᯥ���...] WINDOW NOWAIT
SET EXCLUSIVE OFF
gPathDbf = 'F:\DBA\MGRSR\DBF\'		&& ������ ����� ��ᯥ���

USE (gPathDbf+'EVENTS')
SET FILTER TO kod_packet=11
GO BOTT
m.kodsess=kod_sess
m.kodevent=kod_event
m.kodpacket=kod_packet
USE

DO CASE
	case EMPTY(m.kodsess)
		m.mess = '�� ��।�� ��� ��ᨨ gKodSession ��ᯥ���� !'
		m.kodsess = DTOC(DATE())
	case EMPTY(m.kodevent)
		m.mess = '�� ��।�� ��� ����� gKodEvents ��ᯥ���� !'
		m.kodevent = SYS(2015)
	case EMPTY(m.kodpacket)
		m.mess = '�� ��।�� ��� ����� gKodPacket ��ᯥ���� !'	
OTHERWISE
	m.mess = ''
ENDCASE

IF !EMPTY(m.mess)
	?? ''
	WAIT m.mess WINDOW TIMEOUT(1)
	USE (gPathDbf + 'notrun')
	INSERT INTO notrun (date, time, mess) VALUES (DATE(), TIME(), m.mess)
	IF EMPTY(m.kodpacket)
		QUIT
	ENDIF
ENDIF
RELEASE m.mess

PUBLIC m.gConfigFile	&& ���� ���䨣��樨 (��ࠬ��஢, SET ��⠭����)
gConfigFile = gPathDbf + 'config.dbf'

PUBLIC m.gKodSession	&& ��� ����� � ��⮪��� ��ᨩ
DO CASE
	case TYPE('m.kodsess') = 'C'
		m.gKodSession = SUBSTR(m.kodsess,1,12)
	case TYPE('m.kodsess') = 'N'
		m.gKodSession = SUBSTR(ALLTRIM(STR(m.kodsess)),1,12)
OTHERWISE
	USE (gPathDbf + 'notrun')
	INSERT INTO notrun (date, time, mess);
				VALUES (DATE(), TIME(), '�������⨬� ⨯ ��ࠬ��� gKodSession.')
	QUIT
ENDCASE		

PUBLIC m.gKodEvent		&& ��� ����� � EVENTS
DO CASE
	case TYPE('m.kodevent') = 'C'
		m.gKodEvent = SUBSTR(m.kodevent,1,12)
	case TYPE('m.kodevent') = 'N'
		m.gKodEvent = SUBSTR(ALLTRIM(STR(m.kodevent)),1,12)
OTHERWISE
	USE (gPathDbf + 'notrun')
	INSERT INTO notrun (date, time, mess);
				VALUES (DATE(), TIME(), '�������⨬� ⨯ ��ࠬ��� m.gKodEvent.')
	QUIT
ENDCASE		

PUBLIC m.gKodPacket		&& ��� ����� � PACKETS
DO CASE
	case TYPE('m.kodpacket') = 'C'
		m.gKodPacket = VAL(m.kodpacket)
	case TYPE('m.kodpacket') = 'N'
		m.gKodPacket = m.kodpacket
OTHERWISE
	USE (gPathDbf + 'notrun')
	INSERT INTO notrun (date, time, mess);
				VALUES (DATE(), TIME(), '�������⨬� ⨯ ��ࠬ��� m.gKodPacket.')
	QUIT
ENDCASE
************* ��饨ᯮ��㥬� �������� ��६����
** �������� ! � ��砥 ���������� ����� ��६����� � ���䨣.䠩�
** ����室��� �������� ���ᠭ�� ��६����� � ������ ᥪ樨 (��� ����來���)

* gPathDbf - ������ ����� ��ᯥ��� (�㦥��� 䠩��)
* gPathFlags - ����� ᪠��஢���� 䫠���
* gPathDoPrg - ����� �࠭���� ����㦠���� ���㫥� ��ࠡ�⪨
* gPathPrg - ����� ��室��� ⥪�⮢ �஥�� ��������          
* gPathTemp - �६����� �����
* gBoxIn - ���� ����祭�� ������ � �/����
* gBoxOut - ���� ��� ��ࠢ�� ������ �� �/����

*** ���樠������ ��६�����, SET ��⠭����
*DO InitVarSet
IF !FILE(gConfigFile)
	=error_f('�� ������ ���䨣��樮��� 䠩� !')
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

SET PROCEDURE TO (gPathPrg + 'lib.prg')	&& ��楤��� 䠩�
*** ����᪠�� �����
IF !USED('packets')
	USE (gPathDbf + 'packets') ALIAS packets ORDER kod_packet IN 0
ENDIF
SELECT packets
IF !SEEK(m.gKodPacket)
	= error_f('�� ������� ������ � PACKETS.')
ENDIF
PUBLIC m.module
m.module = ''
m.strmodule = '' && ALLTRIM(packets.module)
m.params = ''  && packets.params
IF !EMPTY(m.params)
	m.module = [DO ] + m.strmodule + [ WITH ] + m.params
ELSE
	m.module = [DO ] + m.strmodule
ENDIF

m.strmodule=[F:\DBA\MGRSR\DOPRG\]+PARAM1
m.module = [DO ] + m.strmodule
SAVE TO (gPathTemp + 'doprg.mem')

IF FILE(m.strmodule)
	*** ��������㥬 ��砫� �믮������ �����
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
				Result WITH '�� ������� ������ � EVENTS. ����⨥ �뫮 �믮�����.'
	ENDIF
	USE IN events
	&module						&& ����� �����
	IF !EMPTY(gReturnErr)		&& �᫨ ��६����� १���� ����� �� �����
		=error_f(gReturnErr)
	ENDIF
ELSE
	=error_f('�� ������ 䠩� ����� ' + m.strmodule)
ENDIF
RESTORE FROM (gPathTemp + 'doprg.mem')
*** �����㥬 �����襭�� ࠡ��� �����
IF !USED("events")
   USE (gPathDbf + 'events.dbf') IN 0 ORDER kod_event
ENDIF 
SELECT events
IF SEEK(m.gKodEvent)
	REPLACE time_e WITH TIME(),;
	        info WITH m.module + IIF(!EMPTY(gInfoStr),CHR(13)+gInfoStr,'')
ELSE
	=error_f('�� ������� ������ � EVENTS.')
ENDIF

WAIT CLEAR
=end_prog('')

*** �⮡ࠦ��� ᮮ�饭�� � ��뢠�� �����襭�� ��ᨨ ��� �訡�筮�
PROCEDURE error_f
PARAMETER m.mess
?? ''
WAIT CLEAR
WAIT m.mess WINDOW TIMEOUT(2)
m.mess = m.mess + CHR(13);
		+'��� ��ᨨ gKodSession = ' + gKodSession + CHR(13);
		+'��� ᮡ��� gKodEvents = ' + gKodEvent + CHR(13);
		+'��� ����� gKodPacket = ' + ALLTRIM(STR(gKodPacket))
=end_prog(m.mess)
RETURN

PROCEDURE InitVarSet		&& ���樠������ ��६�����, SET ��⠭����
RETURN

FUNCTION end_prog
PARAMETER m.str
DO CASE
	case UPPER(m.str) = 'ERROR'
      m.ali = ALIAS()
      m.ord = ORDER()
      m.fil = FILTER()
      m.er_ror = _g_mas_error[2] +':�訡�� '+LTRIM(STR(_g_mas_error[1]))+IIF(_g_mas_error[4]=0,'',' � ��ப� '+LTRIM(STR(_g_mas_error[4])))+ CHR(13)+CHR(10)
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
	case EMPTY(m.str)
      m.er_ror = ''
	OTHERWISE
      m.er_ror = m.str
ENDCASE
IF !USED("events")
   USE (gPathDbf + 'events.dbf') IN 0 ORDER kod_event
ENDIF 
SELECT events
IF SEEK(m.gKodEvent)
	IF !EMPTY(m.er_ror)
		REPLACE time_e WITH TIME(), error WITH .T., result WITH m.er_ror ADDITIVE
	ENDIF
ELSE
	USE (gPathDbf + 'notrun')
	INSERT INTO notrun (date, time, mess);
				VALUES (DATE(), TIME(), m.er_ror)
ENDIF
= proc_quit(1)

PROCEDURE proc_quit
PARAMETER i
IF PARAMETERS() < 1
   ?? ''
   WAIT WINDOW ' �� ������� ����室��� 䠩�� !' TIMEOUT 1
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
*  mes_dial(color_sheme, ;  && ���⮢�� �奬� ����
*               title, ;    &&  TITLE
*               message, ;  && �뢮����� ᮮ�饭��
*               kol_key	;   && ���-�� ������ (�᫨ ��� mes1, mes2, mes3
*               [ mes1,]    && ���᪠��� 1 ������
*               [ mes2,]    && ���᪠��� 2 ������
*               [ mes3])    && ���᪠��� 3 ������
*
*   �� ������⢨� ���᪠��� ������ ��� ����� ������ ��।�����
*   �� 㬮�砭�� '\!\?OK',  � ��� ����: 'OK;\!\? �⪠�'
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
    m.s_key = m.s_key + IIF(m.n_key = 2, '\!\? �⪠� ; OK', '\!\?OK')
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
m.mlin = MEMLINES(m.mess)	&& ������⢮ ��ப � ᮮ�饭��
IF m.mlin > 20
    SET MEMOWIDTH TO m.old_width
    ?? CHR(7)
    WAIT WINDOW '����饭�� �� ����� ���� ���⮩ ����� 20 ��ப!' NOWAIT
    IF m.talkstat = "ON"
        SET TALK ON
    ENDIF
    RETURN
ENDIF
_MLINE = 0
m.wlm = 0
FOR m.v = 1 TO m.mlin
    m.wlm = MAX( LEN( MLINE(m.mess, 1, _MLINE)), m.wlm)
                              &&  ��।������ ���ᨬ��쭮� ����� ��ப�
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
                                 && �뢮� ��ப ᮮ�饭��
    ELSE
        ?? PADC( MLINE(m.mess, 1, _MLINE), m.wlm + 4)
                                 && �뢮� ��ப ᮮ�饭��
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