*:*****************************************************************************
*:
*:  Program : PROC_ERR.PRG
*:  Descript: Обработка критических ситуаций и ошибок программы
*:	Замечание ! Диалоговое окно сообщения имеет таймаут для завершения
*:	согласно значению TIMEOUT в READ (см. описание функции mes_dial в lib.prg)
*:
*:*****************************************************************************
PARAMETER err, prog, mes, lin
PRIVATE scr_msg
m.scr_msg = ''
DO CASE
CASE m.err = 125 OR m.mes = 'Printer not ready.'
   *******************************************************
   *	Обработка ошибки принтера
   *******************************************************
   m.scr_msg = '\rПринтер не готов!'
   
CASE m.err=108 OR m.err=109 OR m.err=1502 OR m.err=1106
   *******************************************************
   * File | Record is in use by another | TTS in progress
   *******************************************************
   m.scr_msg = '\rБаза обновляется другим пользователем\rПовторить попытку?'
   
CASE m.err=111 OR m.err=1101 OR m.err=1503 OR m.err=1705 OR m.err=1718
   *******************************************************
   * File is | read-only | exclusively opened by another
   *******************************************************
   m.scr_msg = '\rБаза помечена Только Чтение\rили заблокирована другим\rПовторить попытку?'
   
CASE m.err = 56 OR m.err = 1105 OR m.err = 1157 OR m.err = 1160
   *******************************************************
   * File write error | Not enought disk space
   *******************************************************
   m.scr_msg = '\rНет места на диске либо диск защищен от записи\rПовторить попытку?'
   
OTHERWISE
   *******************************************************
   * Прочие гадости...
   *******************************************************
   ON ERROR
   m.ali = ALIAS()
   m.ord = ORDER()
   m.fil = FILTER()
   _g_mas_error[1] = m.err
   _g_mas_error[2] = m.prog
   _g_mas_error[3] = m.mes
   _g_mas_error[4] = m.lin
   
ENDCASE
IF EMPTY(m.scr_msg)
   m._g_error_in = .T.
   =mes_dial( 7,'< Error >', '\r'+'Программа '+m.prog+'\rОшибка '+LTRIM(STR(m.err))+IIF(m.lin>0,' в строке '+LTRIM(STR(m.lin)),'')+'\r'+m.mes+'\rALIAS()="'+m.ali+'"\rORDER()="'+m.ord+'"\rFILTER()="'+m.fil+'"', 1)
   IF FILE(gPathDbf + 'delflag')	&& Удаляем флаги
    PRIVATE m.alias
    m.alias = ALIAS()
    SELECT 0
    USE (gPathDbf + 'delflag') ALIAS delflag
    SCAN FOR ALLTRIM(delflag.module) = PROGRAM(2)
		DELETE FILE (ALLTRIM(delflag.flagname))
	ENDSCAN
	USE
	IF !EMPTY(m.alias)
	 	SELECT (m.alias)
	ENDIF
   ENDIF
   =end_prog('ERROR')
ELSE
   IF 1 =mes_dial(7,' Внимание! ',m.scr_msg,2,'\!\< Повторить ','\?\<  Отказ ')
      m._g_error_in = .F.
      RETRY
   ELSE
   
* Пользователь нажал "Отмена" - ОБЯЗАТЕЛЬНО обрабатывайте данную ситуацию !
* Например:
* Программа пытается выполнить USE table, а table кем-то эксклюзивно занята
* Чтобы обработать эту ситуацию после USE table Вы пишете:
* IF _g_error_in = .T.	&& т.е. база занята (или что-то ещё) и юзер нажал ESC
	&& Тут Вы что-то предпринимаете для случая, описанного выше 
* ELSE
	&& Продолжаете нормальное выполнение программы
* ENDIF

      m._g_error_in = .T.
      						 
   ENDIF
ENDIF
RETURN