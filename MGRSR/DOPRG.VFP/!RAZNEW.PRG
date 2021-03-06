*:******************************************************************
*:
*:		Process : !raznew.prg
*:		Descript: ����� ���������� �� ���
*:		Flag    : F:\NST\BOX_TOV\recieve.t-m
*:
*:******************************************************************
PUBLIC m.packetkod, m.date_operation, m.time_operation

m.packetkod = '000'
m.date_operation = DATE()	&& ���� ������
m.time_operation = TIME()	&& ����� ������
FOR i = 1 TO 5
	=SoundRaznar()
ENDFOR
RELEASE i
IF CheckPacket()
	DO (gDoVFP + 'adm_spr.prg')		&& ��������� ������������
	DO (gDoVFP + 'razn_npo.prg')	&& ��������� RAZN_NPO.DBF
	DO (gDoVFP + 'adm_razn.prg')	&& ����� ����������
	DO (gDoVFP + 'operdata.prg')	&& ��������� ��� �������� ������� ������;
											�� ����������
	COPY FILE (gPathTemp + 'raznar0.dbf') TO (gUchBoxSb + 'raznar.dbf')
	COPY FILE (gPathTemp + 'reestr.dbf') TO (gUchBoxSb + 'reestr.dbf')
	IF !USED('packet0')
		USE (gPathDbf+'raznlog') ORDER kod IN 0 ALIAS packet0 AGAIN
	ENDIF
	SELECT packet0
	IF SEEK(m.packetkod)
		COPY TO (gUchBoxSb + 'packet.dbf') FOR kod = m.packetkod TYPE FOX2X
	ENDIF
	USE IN packet0
	**** ���������� ���� �������� -  [nalich.t-m]
	IF FILE(gUchBoxSb + 'raznar.dbf')
		fflag = FCREATE('F:\NET\T-MAIL\FLAGS\nalich.t-m')
		= FCLOSE(fflag)
	ELSE
		gInfoStr = '����� ����������. ���� RAZNAR.DBF �� ������. ����� NALICH �� �������.'
		=Wait3Beep(gInfoStr)
	ENDIF
ELSE
	RETURN
ENDIF
DO DelAllFiles						&& �������� ������
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
DELETE FILE (gNstBoxTov + 'razn_npo.dbf')
RETURN

FUNCTION CheckPacket
IF !FILE(gNstBoxTov + 'raznar.dbf')		&& ���� �� raznar.dbf ?
	gInfoStr = [�� ������ ���� ] + gNstBoxTov + [raznar.dbf]
	=Wait3Beep(gInfoStr)
	DO DelAllFiles
	RETURN .F.
ENDIF
IF FILE(gNstBoxTov + 'packet.dbf')		&& ���� �� packet.dbf ?
	m.exitrazn = .F.
	USE (gPathDbf+'raznlog') ORDER kod IN 0 ALIAS packet0
	USE (gNstBoxTov+'packet') IN 0 ALIAS packet NOUPDATE
	IF RECCOUNT('PACKET')=0	
		gInfoStr = [������� PACKET.DBF �� �������� �� ����� ������.]
		=Wait3Beep(gInfoStr)
		USE IN packet
		USE IN packet0
		DO DelAllFiles
		RETURN .F.
	ENDIF
	m.packetkod = packet.kod
ELSE
	gInfoStr = [�� ������� ������� ] + gNstBoxTov + [packet.dbf]
	=Wait3Beep(gInfoStr)
	DO DelAllFiles
	RETURN .F.
ENDIF
*** ������������ �����
SELECT packet
SCATTER MEMVAR
SELECT packet0
IF SEEK(m.packetkod,'packet0')
	gInfoStr = [��������� ��������� �������. ��������� �������� ������.] + CHR(13);
			+ [��� ������=]+m.packetkod + CHR(13);
			+ [���� ���������=]+DTOC(DATE()) + CHR(13);
			+ [�����=]+TIME()
	=Wait3Beep(gInfoStr)
ELSE
	APPEND BLANK
ENDIF
GATHER MEMVAR
REPLACE date WITH date_operation, time WITH time_operation
USE IN packet
USE IN packet0
RETURN .T.