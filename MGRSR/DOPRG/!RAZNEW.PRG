*:******************************************************************
*:
*:		Process : !raznew.prg
*:		Descript: �ਥ� ࠧ���浪� �� ���
*:		Flag    : F:\NST\BOX_TOV\recieve.t-m
*:
*:******************************************************************
PUBLIC m.packetkod, m.date_operation, m.time_operation

m.packetkod = '000'
m.date_operation = DATE()	&& ��� �ਥ��
m.time_operation = TIME()	&& �६� �ਥ��
m.kod_nalich_packet = 1		&& ��� ����� NALICH;
						 - �������� � ��砥 ����䨪�樨 � PACKETS.DBF !!!

FOR i = 1 TO 5
	=SoundRaznar()
ENDFOR
RELEASE i
IF CheckPacket()
	DO (gPathDoPrg + 'adm_spr.prg')		&& ��ࠡ�⪠ �ࠢ�筨���
	DO (gPathDoPrg + 'razn_npo.prg')	&& ��ࠡ�⪠ RAZN_NPO.DBF
	DO (gPathDoPrg + 'adm_razn.prg')	&& �ਥ� ࠧ���浪�
	IF !FILE(gPathFlag + 'nalich.run')
		USE (gPathDbf + 'packets') ORDER kod_packet IN 0 ALIAS packets0 NOUPDATE AGAIN
		IF SEEK(m.kod_nalich_packet,'packets0')
			m.flagnalich = ALLTRIM(packets0.flagpath) + '\'+ ALLTRIM(packets0.flagname)
			fflag = FCREATE(m.flagnalich)
			= FCLOSE(fflag)
		ELSE
			gInfoStr = '�ਥ� ࠧ���浪�. �訡�� ���⠢����� 䫠�� ��� ����� NALICH - �� ������� ������ � ����� = '+m.kod_nalich_packet+' � PACKETS.DBF.'
		ENDIF
		USE IN packets0
		
*		DO (gPathDoPrg + 'operdata.prg')	&& ��ନ�㥬 ��� ��।�� ⥪�騥 �����;
											�� ࠧ���浪�
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
	**** ���⠢�塞 䫠� ��ࠢ�� -  [nalich.t-m]
*	IF FILE('F:\UCHET\BOX_SBIT\raznar.dbf')
*		fflag = FCREATE('F:\NET\T-MAIL\FLAGS\nalich.t-m')
*		= FCLOSE(fflag)
*	ELSE
*		gInfoStr = '�ਥ� ࠧ���浪�. ���� RAZNAR.DBF �� ᮧ���. ����� NALICH �� ��।��.'
*		=Wait3Beep(gInfoStr)
*	ENDIF
	&& �ਥ� ࠧ���浪� � ORACLE RDBMS
	fflag = FCREATE('F:\DBA\MGRSR\FLAGS\oprirazn.mgr')
	= FCLOSE(fflag)
	
ELSE
	RETURN
ENDIF
DO DelAllFiles						&& �������� 䠩���
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
IF !FILE(gNstBoxTov + 'raznar.dbf')		&& ���� �� raznar.dbf ?
	gInfoStr = [�� ������ 䠩� ] + gNstBoxTov + [raznar.dbf]
	=Wait3Beep(gInfoStr)
	DO DelAllFiles
	RETURN .F.
ENDIF
IF FILE(gNstBoxTov + 'packet.dbf')		&& ���� �� packet.dbf ?
	m.exitrazn = .F.
	USE (gPathDbf+'raznlog') ORDER kod IN 0 ALIAS packet0
	USE (gNstBoxTov+'packet') IN 0 ALIAS packet NOUPDATE
	IF RECCOUNT('PACKET')=0	
		gInfoStr = [������ PACKET.DBF �� ᮤ�ন� �� ����� �����.]
		=Wait3Beep(gInfoStr)
		USE IN packet
		USE IN packet0
		DO DelAllFiles
		RETURN .F.
	ENDIF
	m.packetkod = packet.kod
ELSE
	gInfoStr = [�� ������� ⠡��� ] + gNstBoxTov + [packet.dbf]
	=Wait3Beep(gInfoStr)
	DO DelAllFiles
	RETURN .F.
ENDIF
*** ��������㥬 �����
SELECT packet
SCATTER MEMVAR
SELECT packet0
IF SEEK(m.packetkod,'packet0')
	gInfoStr = [����ୠ� ��ࠡ�⪠ �������. �����㦥� �㡫���� �����.] + CHR(13);
			+ [��� �����=]+m.packetkod + CHR(13);
			+ [��� ��ࠡ�⪨=]+DTOC(DATE()) + CHR(13);
			+ [�६�=]+TIME()
	=Wait3Beep(gInfoStr)
ELSE
	APPEND BLANK
ENDIF
GATHER MEMVAR
REPLACE date WITH date_operation, time WITH time_operation
USE IN packet
USE IN packet0
RETURN .T.