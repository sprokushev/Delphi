**************************************************************************
*
*   ��ନ஢���� ���㧪� ��� ��।��
*
**************************************************************************
IF !FILE(gFlagRaskr + 'fiopr.dbf')
	gInfoStr = [�� ������ 䠩� ] + gFlagRaskr + [fiopr.dbf]
	=Wait3Beep(gInfoStr)
	RETURN .F.
ENDIF
m.cntraskred = 0		&& ������⢮ ��।������� ����ᥩ
SELECT 0
USE (gFlagRaskr + 'fiopr') ALIAS fiopr
IF RECCOUNT() = 0
	gInfoStr = [����-�����䨪��� FIOPR.DBF �� ᮤ�ন� ��⭮� ����� !]
	=Wait3Beep(gInfoStr)
	RETURN .F.
ENDIF
SCATTER MEMVAR
USE
DO (gPathDoPrg + 'admpsp.prg')			&& ��ࠢ�筨� ��ᯮ�⮢(���䨪�⮢)
DO (gPathDoPrg + 'adm_rask.prg')		&& ���㧪�
DO (gPathDoPrg + 'adm_pack.prg')		&& ���⪠ REESTR_D
DO (gPathDoPrg + 'adm_exp.prg')			&& �� �� ��ᯮ���
IF FILE(gNstOut + 'raskred.dbf')
	file = FCREATE(gTMFlags + 'pack_n_o.t-m')
	= FCLOSE(file)
	gInfoStr = [��ࠢ���� ] + ALLTRIM(STR(m.cntraskred)) + [ ����ᥩ �� ���㧪�.]
	WAIT CLEAR
	WAIT [��ନ஢���� ������ ��� ��।�� �����襭�.]+CHR(13);
		+[�� ��।��� ����ᥩ �� ���㧪� - ]+ ALLTRIM(STR(m.cntraskred));
		WINDOW TIMEOUT(1)
ELSE
	gInfoStr = [�� ������ 䠩� ] + gNstOut + [raskred.dbf&]
	=Wait3Beep(gInfoStr)
ENDIF
DELETE FILE (gFlagRaskr + 'fiopr.dbf')	&& ����塞 䠩�-�����䨪���