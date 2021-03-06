*:*****************************************************************************
*:
*:  Program : PROC_ERR.PRG
*:  Descript: ��������� ����������� �������� � ������ ���������
*:	��������� ! ���������� ���� ��������� ����� ������� ��� ����������
*:	�������� �������� TIMEOUT � READ (��. �������� ������� mes_dial � lib.prg)
*:
*:*****************************************************************************
PARAMETER err, prog, mes, lin
PRIVATE scr_msg
m.scr_msg = ''
DO CASE
CASE m.err = 125 OR m.mes = 'Printer not ready.'
   *******************************************************
   *	��������� ������ ��������
   *******************************************************
   m.scr_msg = '\r������� �� �����!'
   
CASE m.err=108 OR m.err=109 OR m.err=1502 OR m.err=1106
   *******************************************************
   * File | Record is in use by another | TTS in progress
   *******************************************************
   m.scr_msg = '\r���� ����������� ������ �������������\r��������� �������?'
   
CASE m.err=111 OR m.err=1101 OR m.err=1503 OR m.err=1705 OR m.err=1718
   *******************************************************
   * File is | read-only | exclusively opened by another
   *******************************************************
   m.scr_msg = '\r���� �������� ������ ������\r��� ������������� ������\r��������� �������?'
   
CASE m.err = 56 OR m.err = 1105 OR m.err = 1157 OR m.err = 1160
   *******************************************************
   * File write error | Not enought disk space
   *******************************************************
   m.scr_msg = '\r��� ����� �� ����� ���� ���� ������� �� ������\r��������� �������?'
   
OTHERWISE
   *******************************************************
   * ������ �������...
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
   =mes_dial( 7,'< Error >', '\r'+'��������� '+m.prog+'\r������ '+LTRIM(STR(m.err))+IIF(m.lin>0,' � ������ '+LTRIM(STR(m.lin)),'')+'\r'+m.mes+'\rALIAS()="'+m.ali+'"\rORDER()="'+m.ord+'"\rFILTER()="'+m.fil+'"', 1)
   IF FILE(gPathDbf + 'delflag')	&& ������� �����
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
   IF 1 =mes_dial(7,' ��������! ',m.scr_msg,2,'\!\< ��������� ','\?\<  ����� ')
      m._g_error_in = .F.
      RETRY
   ELSE
   
* ������������ ����� "������" - ����������� ������������� ������ �������� !
* ��������:
* ��������� �������� ��������� USE table, � table ���-�� ����������� ������
* ����� ���������� ��� �������� ����� USE table �� ������:
* IF _g_error_in = .T.	&& �.�. ���� ������ (��� ���-�� ���) � ���� ����� ESC
	&& ��� �� ���-�� �������������� ��� ������, ���������� ���� 
* ELSE
	&& ����������� ���������� ���������� ���������
* ENDIF

      m._g_error_in = .T.
      						 
   ENDIF
ENDIF
RETURN