**************************************************************************
*
*   ������������ �������� ��� ��������
*
**************************************************************************
*DO F:\DBA\MGRSR\DOPRG.VFP\config.prg
IF !FILE(gFlagRaskr + 'fiopr.dbf')
	gInfoStr = [�� ������ ���� ] + gFlagRaskr + [fiopr.dbf]
	=Wait3Beep(gInfoStr)
	RETURN .F.
ENDIF
m.cntraskred = 0		&& ���������� ������������ �������
SELECT 0
USE (gFlagRaskr + 'fiopr') ALIAS fiopr
IF RECCOUNT() = 0
	gInfoStr = [����-������������� FIOPR.DBF �� �������� ������� ������ !]
	=Wait3Beep(gInfoStr)
	RETURN .F.
ENDIF
SCATTER MEMVAR
USE
DO (gDoVFP + 'admpsp.fxp')			&& ���������� ���������(������������)
DO (gDoVFP + 'adm_rask.fxp')		&& ��������
DO (gDoVFP + 'adm_pack.fxp')		&& ������ REESTR_D
DO (gDoVFP + 'adm_exp.fxp')			&& �� �� ��������
IF FILE(gNstOut + 'raskred.dbf')
	file = FCREATE(gTMFlags + 'pack_n_o.t-m')
	= FCLOSE(file)
	gInfoStr = [���������� ] + ALLTRIM(STR(m.cntraskred)) + [ ������� �� ��������.]
	WAIT CLEAR
	WAIT [������������ ������ ��� �������� ���������.]+CHR(13);
		+[�� �������� ������� �� �������� - ]+ ALLTRIM(STR(m.cntraskred));
		WINDOW TIMEOUT(1)
ELSE
	gInfoStr = [�� ������ ���� ] + gNstOut + [raskred.dbf&]
	=Wait3Beep(gInfoStr)
ENDIF
DELETE FILE (gFlagRaskr + 'fiopr.dbf')	&& ������� ����-�������������