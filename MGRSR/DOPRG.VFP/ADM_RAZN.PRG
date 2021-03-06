*:*****************************************************************************
*:
*:	 	Process : ADM_RAZN.PRG
*:		Descript: ����� ����������
*:		Status  : PRIVATE
*:		Call    : !raznew.prg
*:
*:*****************************************************************************
*= debugraznar()

PUBLIC m.grd, m.cntrec0, m.cist0, m.tonn0

m.cntrec0 = 0
m.cist0 = 0
m.tonn0 = 0

PRIVATE m.safety
m.safety = SET('SAFETY')
SET SAFETY OFF
USE (gPathDbf+'raznlog') ORDER kod IN 0 ALIAS packet
*** ��������� � RAZNLOG.DBF ������������� �� ������ � ����� ���������� ������
IF !SEEK(m.packetkod, 'packet')
	gInfoStr = [�� ������ ��� ������ � ������� PACKET.DBF.]+CHR(13);
			+ [��� ������ = ] + m.packetkod
	=Wait3Beep(gInfoStr)
	USE IN packet
	RETURN .F.
ENDIF
WAIT CLEAR
WAIT '����� ���������� :                   '+CHR(13)+;
		 '����������� ����.......GD_PRN.DBF...' WINDOW NOWAIT
*) ��������� ��������� ����� � ����������� �� �������/���������;
	� ��� ��������
USE (gNstBoxTov + 'raznar.dbf') IN 0 ALIAS raznar0
SELECT *, 000 AS error;
	FROM raznar0;
	INTO TABLE (gPathTemp + 'gd_prn.dbf');
	WHERE prizn_mps # 3 AND (INLIST(oemtoansi(otgr),'���','���','���','���','���','�/�'));
      AND !DELETED();
	ORDER BY date_razn, mesto, kod_npr, kst, kod_poluch, n_dog
m.rec_gd = _TALLY
USE IN gd_prn

WAIT CLEAR
WAIT '����� ���������� :                   '+CHR(13)+;
	 '����������� ����......GDE_PRN.DBF...' WINDOW NOWAIT
SELECT *, 000 AS error;
	FROM raznar0;
	INTO TABLE (gPathTemp + 'gde_prn.dbf');
	WHERE prizn_mps = 3 AND (INLIST(oemtoansi(otgr),'���','���','���','���','���','�/�'));
		AND !DELETED();
		AND !DELETED();
	ORDER BY date_razn, mesto, kod_npr, kst, kod_poluch, n_dog
m.rec_gde = _TALLY
USE IN gde_prn

WAIT CLEAR
WAIT '����� ���������� :                   '+CHR(13)+;
	 '����������� ����.......WE_PRN.DBF...' WINDOW NOWAIT
SELECT *, 000 AS error;
	FROM raznar0;
	INTO TABLE (gPathTemp + 'we_prn.dbf');
	WHERE prizn_mps = 3 AND (INLIST(oemtoansi(otgr),'���','���'));
		AND !DELETED();
	ORDER BY date_razn, mesto, kod_npr, kst, kod_poluch, n_dog
m.rec_we = _TALLY
USE IN we_prn

WAIT CLEAR
WAIT '����� ���������� :                   '+CHR(13)+;
	 '����������� ����........W_PRN.DBF...' WINDOW NOWAIT
SELECT *, 000 AS error;
	FROM raznar0;
	INTO TABLE (gPathTemp + 'w_prn.dbf');
	WHERE prizn_mps # 3 AND (INLIST(oemtoansi(otgr),'���','���'));
		AND !DELETED();
	ORDER BY date_razn, mesto, kod_npr, kst, kod_poluch, n_dog
m.rec_w = _TALLY
USE IN w_prn

WAIT CLEAR
WAIT '����� ���������� :                   '+CHR(13)+;
	 '����������� ����........T_PRN.DBF...' WINDOW NOWAIT
SELECT *, 000 AS error;
	FROM raznar0;
	INTO TABLE (gPathTemp + 't_prn.dbf');
	WHERE INLIST(oemtoansi(otgr),'���','���','���');
		AND !DELETED();
	ORDER BY date_razn, mesto, kod_npr, kst, kod_poluch, n_dog
m.rec_t = _TALLY
USE IN t_prn

WAIT CLEAR
WAIT '����� ���������� :                   '+CHR(13)+;
	 '����������� ����........S_PRN.DBF...' WINDOW NOWAIT
SELECT *, 000 AS error;
	FROM raznar0;
	INTO TABLE (gPathTemp + 's_prn.dbf');
	WHERE INLIST(oemtoansi(otgr),'���','���','���') AND !DELETED();
	ORDER BY date_razn, mesto, kod_npr, kst, kod_poluch, n_dog
m.rec_s = _TALLY
USE IN s_prn

USE (gTovPrDbf + 'raznar') ORDER nom_zd IN 0 ALIAS raznar
&& Debug	 USE (gPathTemp + 'razn') ORDER nom_zd IN 0 ALIAS raznar

USE (gTovPrArh + 'raznar') ORDER nom_zd IN 0 ALIAS arh
&& Debug	 USE (gPathTemp + 'raznarh') ORDER nom_zd IN 0 ALIAS arh

*USE (gTovPrArh + 'raznar_s') ORDER nom_zd IN 0 ALIAS arh_s
&& Debug 	 USE (gPathTemp + 'raznar_s') ORDER nom_zd IN 0 ALIAS arh_s

USE (gTovPrDbf + 'prod') ORDER TAG kod IN 0 ALIAS prod
USE (gTovPrDbf + 'stan') ORDER TAG kod IN 0 ALIAS stan
USE (gTovPrDbf + 'gdor') ORDER TAG kod IN 0 ALIAS gdor
USE (gTovPrDbf + 'predpr') ORDER TAG kod IN 0 ALIAS predpr
USE (gUchetDbf + 'sobstv') ORDER TAG kod IN 0 ALIAS sobstv
USE (gTovPrDbf + 'nazn_otg') ORDER TAG kod IN 0 ALIAS nazn_otg
USE (gTovPrDbf + 'for_o') ORDER TAG kod_o IN 0 ALIAS for_o

SELECT stan
SET RELATION TO kodgd INTO gdor ADDITIVE

IF !EMPTY(m.rec_gd)
	= ReplaceRaznar('gd_prn')
	= PrintRaznar('gd_prn')
ENDIF
IF !EMPTY(m.rec_gde)
	= ReplaceRaznar('gde_prn')
	= PrintRaznar('gde_prn')
ENDIF
IF !EMPTY(m.rec_w)
	= ReplaceRaznar('w_prn')
	= PrintRaznar('w_prn')
ENDIF
IF !EMPTY(m.rec_we)
	= ReplaceRaznar('we_prn')
	= PrintRaznar('we_prn')
ENDIF
IF !EMPTY(m.rec_we) OR !EMPTY(m.rec_w)
	DO raznar_w
ENDIF
IF !EMPTY(m.rec_t)
	= ReplaceRaznar('t_prn')
	= PrintRaznar('t_prn')
ENDIF
IF !EMPTY(m.rec_s)
	= ReplaceRaznar('s_prn')
	= PrintRaznar('s_prn')
	DO raznar_s
ENDIF

SELECT packet
REPLACE cntrec0 WITH m.cntrec0, cist0 WITH m.cist0, tonn0 WITH m.tonn0

= Use0('arh')
*= Use0('arh_s')
= Use0('prod')
= Use0('stan')
= Use0('gdor')
= Use0('predpr')
= Use0('sobstv')
= Use0('nazn_otg')
= Use0('for_o')

&& Debug	��������������� ����� 2-� ��������� ��������

DO DeleOldRaznar			&& ������ ����������
DO RaznarNPZ				&& ��������� ���������� ��� ���
DO RaznProch                && ������������ ���������� �� �������� ������ ����

*** ������������
*    DO (gPathDoPrg + 'razntov.prg')	&& ��������� ���������� ��� ���

= Use0('raznar0')
= Use0('raznar')

DELETE FILE (gPathTemp + 'gd_prn.dbf')
*DELETE FILE (gPathTemp + 'gd_prn.txt')
DELETE FILE (gPathTemp + 'gde_prn.dbf')
*DELETE FILE (gPathTemp + 'gde_prn.txt')
DELETE FILE (gPathTemp + 'w_prn.dbf')
*DELETE FILE (gPathTemp + 'w_prn.txt')
DELETE FILE (gPathTemp + 'we_prn.dbf')
*DELETE FILE (gPathTemp + 'we_prn.txt')
DELETE FILE (gPathTemp + 't_prn.dbf')
*DELETE FILE (gPathTemp + 't_prn.txt')
DELETE FILE (gPathTemp + 's_prn.dbf')
*DELETE FILE (gPathTemp + 's_prn.txt')
DELETE FILE (gPathTemp + 'razn_npz.dbf')

RELEASE m.grd
SET SAFETY &safety

WAIT '���������� �������.' WINDOW TIMEOUT(1)
RETURN

*:********************************************************************
*:
*:       Function: PLATEL()
*:       Return  : predpr.naim (������������ �����������)
*:
*:*********************************************************************
FUNCTION platel
PARAMETER m.kod

PRIVATE m.alias, m.numr, m.as
m.alias = SELECT()
IF USED("predpr")
   SELECT predpr
ELSE
   SELECT 0
   USE (gTovPrDbf + 'predpr') ORDER TAG kod
ENDIF
m.numr = RECNO()

IF SEEK(m.kod,'PREDPR')
   m.as = predpr.naim
ELSE
   m.as = '-'
ENDIF
IF RECCOUNT() < m.numr AND m.as = '-'
   m.as = '�������� !!!!  ������ ������ �� ���������� '
   GO BOTTOM
ELSE
   GO m.numr
ENDIF
m.grd = predpr.gorod
SELECT (m.alias)
RETURN as

*:*****************************************************************************
*:
*:		Function : GD()
*:		Return	 : stan.ngd (������������ �/������)
*:
*:*****************************************************************************
FUNCTION gd
PARAMETER kod
PRIVATE m.alias, m.gd_name

m.alias = SELECT()
IF USED("stan")
   SELECT stan
ELSE
   SELECT 0
   USE (gTovPrDbf + 'stan') ORDER TAG kod
ENDIF
IF SEEK(kod, 'STAN')
   m.gd_name = stan.ngd
ELSE
   m.gd_name = ''
ENDIF
SELECT (m.alias)
RETURN m.gd_name

PROCEDURE ReplaceRaznar
PARAMETER alias
USE (gTovPrDbf + 'predpr') IN 0 ORDER kod AGAIN ALIAS predpr0
namealias = gPathTemp + alias
USE (gVizir + 'vizir') IN 0
USE (gVizir + 'flagviz') IN 0
USE &namealias IN 0
SELECT &alias
m.barblk = 0
PRIVATE _viz_date,_viz_time,_kod_pak,_viz_kol
_viz_date=DATE()
_viz_time=TIME()
_viz_kol=0
_kod_pak=SYS(2015)
SCAN
  = barprcnt(20, '���������� �������� ����� RAZNAR.DBF :')
  SCATTER MEMVAR
  m.cntrec0 = m.cntrec0 + 1
  m.cist0 = m.cist0 + kol_cist
  m.tonn0 = m.tonn0 + tonn
  IF !m.pered									&& ���� ������ �� �������
	  IF alias#"s_prn"							&& ���� �� ���������
	 *IF !INLIST(alias,"s_prn","w_prn","we_prn")	&& ���� �� ��������� � ����
		SELECT raznar
		IF SEEK(m.nom_zd,'raznar')	&& ���� ��� ���� ����� �������
			REPLACE kol_cist WITH kol_cist + m.kol_cist,;
				tonn WITH tonn + IIF(m.kol_cist = 0 AND m.tonn = 0.001,0,m.tonn)
			IF (part_ot=0 AND viz_cist>0 AND kol_cist<viz_cist;
				OR part_ot<>0 AND viz_tonn>0 AND tonn<viz_tonn);
        		AND INLIST(oemtoansi(m.otgr),'���','���','���','���','���','�/�')
				* ��� ���������� ������������� �� �/�
				m.date_viz = date_otgr
				korr_cist=MAX(0,viz_cist-kol_cist)
				korr_tonn=MAX(0,viz_tonn-tonn)
				REPL viz_cist WITH viz_cist-korr_cist,;
					viz_tonn WITH viz_tonn-korr_tonn
				SELECT vizir
				LOCATE FOR nom_zd = m.nom_zd AND date = m.date_viz AND last
				IF FOUND()
					_viz_kol=_viz_kol+1
			  		SCATTER MEMVAR
				  	REPLACE last WITH .F.
				  	APPEND BLANK
				  	GATHER MEMVAR
					REPLACE viz WITH (-1)*korr_cist,;
					vizt  WITH (-1)*korr_tonn,;
	                viz_id WITH 0,;
    	            naviz  WITH (-1)*korr_cist,;
        	        navizt WITH (-1)*korr_tonn,;
		       		naviz_id WITH 0,;
			  		statviz WITH 2,;
			  		zapret WITH ansitooem('����.��� ')+ ALLTRIM(STR(m.kol_cist)) + ansitooem(' �. ') + ALLTRIM(STR(IIF(m.kol_cist = 0 AND m.tonn = 0.001,0,m.tonn),7,0)) + ansitooem(' ��'),;
			  		otgrviz WITH MAX(otgrviz + m.kol_cist,0);
			  		otgrvizt WITH MAX(otgrvizt + IIF(m.kol_cist = 0 AND m.tonn = 0.001,0,m.tonn),0);
					last WITH .T.,;
					naviz_date WITH _viz_date,;
					viz_date WITH _viz_date,;
					naviz_time WITH _viz_time,;
					viz_time WITH _viz_time,;
					kod_pak WITH _kod_pak,;
			  		k_tar WITH m.k_tar
				ENDIF
				SELECT raznar
			ENDIF
			REPLACE	cist WITH cist + m.kol_cist,;
				kol_tonn WITH kol_tonn + IIF(m.kol_cist = 0 AND m.tonn = 0.001,0,m.tonn),;
				sum_zd WITH sum_zd + m.sum_zd,;
				otgr WITH m.otgr,;
				transp WITH m.transp,;
				prim WITH m.prim,;
				kontrakt WITH m.kontrakt,;
				dop_cist WITH m.dop_cist,;
				osn_8 WITH m.osn_8,;
				sliv_v WITH m.sliv_v,;
				date WITH date_operation,;
				time WITH time_operation,;
				status WITH m.status,;
				dat_stat WITH m.dat_stat,;
				os_otm WITH m.os_otm,;
				k_tar WITH m.k_tar,;
				s_sng WITH m.s_sng,;
				mps_s WITH m.mps_s,;
				nom_zdn WITH m.nom_zdn,;
				nom_zv WITH m.nom_zv,;
				num_rees WITH m.num_rees,;
				dat_rees WITH m.dat_rees,;
				plat_tar WITH m.plat_tar,;
				obogr WITH m.obogr,;
				posred WITH m.posred,;
				packet WITH m.packetkod
		ELSE						&& ���� �� ������� - ���������
			APPEND BLANK
			GATHER MEMVAR
			REPLACE packet WITH m.packetkod,;
				cist WITH m.kol_cist, kol_tonn WITH m.tonn,;
				date WITH date_operation, time WITH time_operation
		ENDIF
		IF m.prizn_mps = 4 AND SEEK(m.kod_poluch, 'predpr0')	&& ����� ���������� ��� ��������
			REPLACE predpr0.prizn_mps WITH m.prizn_mps
		ENDIF
		IF SEEK(posred,'for_o')
			REPLACE kod_pos WITH for_o.kod_k
		ENDIF
	ENDIF
	IF INLIST(oemtoansi(alias),'���','���','���')
		m.tip_otg1 = IIF(INLIST(oemtoansi(alias),'���','���'),4,;
						IIF(INLIST(oemtoansi(alias),'���','���'),5,0) )
		IF SEEK(m.kod_poluch,'predpr0')
			SELECT predpr0
			REPLACE tip_otgr WITH m.tip_otg1
		ENDIF
		IF SEEK(m.kod_plat,'predpr0')
			SELECT predpr0
			REPLACE tip_otgr WITH m.tip_otg1
		ENDIF
	ENDIF
    SELECT arh					&& ��������� � ����� RAZNAR
   	APPEND BLANK
	GATHER MEMVAR
	REPLACE packet WITH m.packetkod, date WITH date_operation, time WITH time_operation
	SELECT raznar0
	LOCATE FOR raznar0.nom_zd = m.nom_zd
	IF FOUND('raznar0')
		REPLACE raznar0.pered WITH .T.		&& ����� ������, ������� ��� ����������
	ENDIF
	SELECT &alias
	REPLACE error WITH 999
  ENDIF
ENDSCAN
IF _viz_kol>0  &&���������� � ���������� ���.����.
   SELE flagviz
   APPE BLANK
   REPL date WITH _viz_date,;
        time WITH _viz_time,;
        statviz WITH 1,;
        kod_pak WITH _kod_pak
   SELECT &alias
ENDIF
USE IN vizir
USE IN flagviz
USE IN predpr0
USE IN &alias
RETURN

PROCEDURE PrintRaznar
PARAMETER alias
WAIT CLEAR
WAIT '����� ���������� :                   '+CHR(13)+;
	 '������ �����.......' + alias + '.DBF...' WINDOW NOWAIT
namereport = gRaznRep + alias + '.FRX'
nametxt = gPathTemp + alias + '.TXT'
namealias = gPathTemp + alias
USE &namealias IN 0
SELECT &alias
SET RELATION TO kod_npr INTO prod, kod_poluch INTO predpr,;
				kst INTO stan, kod_otgr INTO nazn_otg,;
				kod_sobs INTO sobstv ADDITIVE
REPORT FORM &namereport TO FILE &nametxt NOCONSOLE &&FOR pech # 5
SELECT packet
APPEND MEMO &alias FROM &nametxt OVERWRITE

USE IN &alias
RETURN

PROCEDURE DeleOldRaznar
SELECT raznar
SCAN
	IF (part_ot = 0 AND kol_cist <= 0 AND EMPTY(date_zero));
		OR (part_ot # 0 AND tonn <= 0 AND EMPTY(date_zero))
		REPLACE date_zero WITH DATE()
	ENDIF
ENDSCAN
DELETE ALL FOR kol_cist <= 0 AND DATE() - date_zero >= 3 AND !INLIST(oemtoansi(otgr),'���','���','���','���','���')
*DELETE ALL FOR tonn <= 30 AND INLIST(otgr,'���','���')
RETURN
*************************************************************
*       ������� ��� ����������
*************************************************************
PROCEDURE raznar_s
flagvivoz = gTMFlags + 'svivoz_r.t-m'
= Use0('stan')
= Use0('predpr')
DO WHILE FILE(m.gSvBoxIn+'svivoz_o.t-m')
		&& ���� T-MAILa - ��������� ���������� ����������
	WAIT '���� ����� �������� ���������� ���������� �� ���������...' + CHR(13);
		+ '���� F:\SVIVOZ\BOX_IN\svivoz_o.t-m' WINDOW NOWAIT
ENDDO
DELETE FILE &flagvivoz
IF FILE(m.gSvBoxIn+'raznar.dbf')
	SELECT 0
	USE (m.gSvBoxIn+'raznar.dbf') ALIAS raznars
	APPEND FROM (gPathTemp + 's_prn.dbf')
	USE IN raznars
ELSE
	COPY FILE (gPathTemp + 's_prn.dbf') TO (m.gSvBoxIn+'raznar.dbf')
ENDIF
IF FILE(gSvBoxIn+'stan.dbf')
	IF FILE(gNstBoxTov + 'stan.dbf')
		SELECT 0
		USE (gSvBoxIn+'stan.dbf') ALIAS stans
		APPEND FROM (gNstBoxTov + 'stan.dbf')
		USE IN stans
		RENAME (gSvBoxIn+'stan.dbf') TO (gSvBoxIn+'stan1.dbf')
		USE (gSvBoxIn+'stan1.dbf') IN 0 ALIAS stan1
		SELECT * FROM stan1 INTO TABLE (gPathTemp+'stan.dbf') GROUP BY kod
		COPY TO (gSvBoxIn+'stan.dbf') TYPE FOX2X
		USE
		USE IN stan1
		DELETE FILE (gSvBoxIn+'stan1.dbf')
		DELETE FILE (gPathTemp+'stan.dbf')
	ENDIF
ELSE
	COPY FILE (gNstBoxTov + 'stan.dbf') TO (gSvBoxIn+'stan.dbf')
ENDIF
IF FILE(gSvBoxIn+'predpr.dbf')
	IF FILE(gNstBoxTov + 'predpr.dbf')
		SELECT 0
		USE (gSvBoxIn+'predpr.dbf') ALIAS predprs
		APPEND FROM (gNstBoxTov + 'predpr.dbf')
		USE IN predprs
		RENAME (gSvBoxIn+'predpr.dbf') TO (gSvBoxIn+'predpr1.dbf')
		USE (gSvBoxIn+'predpr1.dbf') IN 0 ALIAS predpr1
		SELECT * FROM predpr1 INTO TABLE (gPathTemp+'predpr.dbf') GROUP BY kod
		COPY TO (gSvBoxIn+'predpr.dbf') TYPE FOX2X
		USE
		USE IN predpr1
		DELETE FILE (gSvBoxIn+'predpr1.dbf')
		DELETE FILE (gPathTemp+'predpr.dbf')
	ENDIF
ELSE
	COPY FILE (gNstBoxTov + 'predpr.dbf') TO (gSvBoxIn+'predpr.dbf')
ENDIF
IF FILE(gSvBoxIn+'nazn_otg.dbf')
	DELETE FILE (gSvBoxIn+'nazn_otg.dbf')
ENDIF
IF !USED('naznadd')
	USE (gTovPrDbf + 'nazn_otg') IN 0 ALIAS naznadd AGAIN
ENDIF
SELECT naznadd
COPY TO (gSvBoxIn+'nazn_otg.dbf')
USE IN naznadd
IF FILE(gSvBoxIn+'prod.dbf')
	DELETE FILE (gSvBoxIn+'prod.dbf')
ENDIF
IF !USED('prodadd')
	USE (gTovPrDbf + 'prod') IN 0 ALIAS prodadd AGAIN
ENDIF
SELECT prodadd
COPY TO (gSvBoxIn+'prod.dbf')
USE IN prodadd
IF FILE(gSvBoxIn+'sobstv.dbf')
	DELETE FILE (gSvBoxIn+'sobstv.dbf')
ENDIF
IF !USED('sobadd')
	USE (gUchetDbf + 'sobstv') IN 0 ALIAS sobadd AGAIN
ENDIF
SELECT sobadd
COPY TO (gSvBoxIn+'sobstv.dbf') FIELDS kod, naim
USE IN sobadd

*flag = FCREATE(flagvivoz)
*= FCLOSE(flag)
RETURN
*************************************************************
*       ������� ��� �������
*************************************************************
PROCEDURE raznar_w
m.flagwater = gTMFlags + 'water_r.t-m'
*= Use0('stan')
*= Use0('predpr')
DO WHILE FILE(gWBoxIn+'water_o.t-m')
		&& ���� T-MAILa - ��������� ���������� ����������
	WAIT '���� ����� �������� ���������� ���������� �� ������...' + CHR(13);
		+ '���� F:\WATER\BOX_IN\water_o.t-m' WINDOW NOWAIT
ENDDO
DELETE FILE &flagwater
IF !USED('w_prn')
	SELECT 0
	USE (gPathTemp + 'w_prn.dbf') ALIAS w_prn
ENDIF
SELECT w_prn
APPEND FROM (gPathTemp + 'we_prn.dbf')
USE IN w_prn
IF FILE(gWBoxIn+'raznar.dbf')
	SELECT 0
	USE (gWBoxIn+'raznar.dbf') ALIAS raznarw
	APPEND FROM (gPathTemp + 'w_prn.dbf')
	USE IN raznarw
ELSE
	COPY FILE (gPathTemp + 'w_prn.dbf') TO (gWBoxIn+'raznar.dbf')
ENDIF
*** �����������
IF FILE(gNstBoxTov + 'stan.dbf')
	USE (gNstBoxTov + 'stan.dbf') IN 0 ALIAS stan0
	SELECT * FROM stan0;
	 INTO TABLE (gPathTemp+'stan.dbf') WHERE kodgd=2	&& ������ ������
	USE
	USE (gPathTemp + 'stan.dbf') IN 0 ALIAS stann AGAIN

	IF FILE(gWBoxIn+'stan.dbf')
		USE (gWBoxIn+'stan.dbf') ALIAS stans IN 0 AGAIN
		SELECT stann
		SCAN
			SCATTER MEMVAR
			SELECT stans
			LOCATE FOR kod=m.kod
			IF !FOUND('stans')
				APPEND BLANK
			ENDIF
			GATHER MEMVAR
			SELECT stann
		ENDSCAN
		USE IN stans
	ELSE
		SELECT stann
		COPY TO (gWBoxIn+'stan.dbf')
	ENDIF
	USE IN stan0
	USE IN stann
	DELETE FILE (gPathTemp+'stan.dbf')
ENDIF
*** PREDPR.DBF
IF FILE(gNstBoxTov + 'predpr.dbf')
	USE (gPathTemp + 'w_prn.dbf') IN 0 ALIAS wdbf AGAIN
	SELECT kod_fond AS predpr FROM wdbf;
	UNION ALL;
	SELECT kod_plat AS predpr FROM wdbf;
	UNION ALL;
	SELECT kod_poluch AS predpr FROM wdbf;
	UNION ALL;
	SELECT kod_potreb AS predpr FROM wdbf;
	INTO CURSOR s0
	USE IN wdbf
	SELECT predpr AS kod FROM s0 INTO CURSOR s1 WHERE predpr#0;
		GROUP BY 1 ORDER BY 1
	USE IN s0
	IF !USED('predpr')
		USE (gNstBoxTov + 'predpr.dbf') ALIAS predpr IN 0
	ENDIF
	SELECT predpr
	COPY STRUCTURE TO (gPathTemp + 'predpr.dbf')
	USE (gPathTemp + 'predpr.dbf') ALIAS predpr0 IN 0
	SELECT s1
	SCAN
		SELECT predpr
		LOCATE FOR kod=s1.kod
		IF FOUND('predpr')
			SCATTER MEMVAR
			SELECT predpr0
			APPEND BLANK
			GATHER MEMVAR
		ENDIF
		SELECT s1
	ENDSCAN
	USE IN s1

	IF FILE(gWBoxIn+'predpr.dbf')
		USE (gWBoxIn+'predpr.dbf') ALIAS predprs AGAIN IN 0
		SELECT predpr0
		SCAN
			SCATTER MEMVAR
			SELECT predprs
			LOCATE FOR kod=m.kod
			IF !FOUND('predprs')
				APPEND BLANK
			ENDIF
			GATHER MEMVAR
			SELECT predpr0
		ENDSCAN
		USE IN predprs
	ELSE
		SELECT predpr0
		COPY TO (gWBoxIn+'predpr.dbf')
	ENDIF
	USE IN predpr0
ENDIF
IF FILE(gWBoxIn+'nazn_otg.dbf')
	DELETE FILE (gWBoxIn+'nazn_otg.dbf')
ENDIF
IF !USED('naznadd')
	USE (gTovPrDbf + 'nazn_otg') IN 0 ALIAS naznadd AGAIN NOUPDATE
ENDIF
SELECT naznadd
COPY TO (gWBoxIn+'nazn_otg.dbf')
USE IN naznadd
IF FILE(gWBoxIn+'prod.dbf')
	DELETE FILE (gWBoxIn+'prod.dbf')
ENDIF
IF !USED('prodadd')
	USE (gTovPrDbf + 'prod') IN 0 ALIAS prodadd AGAIN NOUPDATE
ENDIF
SELECT prodadd
COPY TO (gWBoxIn+'prod.dbf')
USE IN prodadd
IF FILE(gWBoxIn+'sobstv.dbf')
	DELETE FILE (gWBoxIn+'sobstv.dbf')
ENDIF
IF !USED('sobadd')
	USE (gUchetDbf+'sobstv') IN 0 ALIAS sobadd AGAIN NOUPDATE
ENDIF
SELECT sobadd
COPY TO (gWBoxIn+'sobstv.dbf') FIELDS kod, naim
USE IN sobadd

IF FILE(gWBoxIn+'varpost.dbf')
	DELETE FILE (gWBoxIn+'varpost.dbf')
ENDIF
IF !USED('varpadd')
	USE (gUchetDbf + 'varpost') IN 0 ALIAS varpadd AGAIN NOUPDATE
ENDIF
SELECT varpadd
COPY TO (gWBoxIn+'varpost.dbf')
USE IN varpadd

*flag = FCREATE(flagwater)
*= FCLOSE(flag)
RETURN
****************************** RaznarNPZ
PROCEDURE RaznarNPZ
= Use0('stan')
= Use0('predpr')
WAIT '����� ���������� : ������ ������� ��� ���...' WINDOW NOWAIT
SELECT *;
	FROM raznar0;
	INTO TABLE (gPathTemp + 'razn_npz.dbf');
	WHERE !INLIST(otgr,'���','���','���')
m.rec_npz = _TALLY
USE IN razn_npz
IF m.rec_npz = 0
	DELETE FILE (gPathTemp + 'razn_npz.dbf')
	RETURN
ENDIF
DO WHILE FILE('F:\NPZ\BOX_OUT\npz_o.t-m')
		&& ���� T-MAILa - ��������� ���������� ����������
	WAIT '���� ����� �������� ���������� ���������� �� ���...' + CHR(13);
		+ '���� F:\NPZ\BOX_OUT\npz_o.t-m' WINDOW NOWAIT
ENDDO

DELETE FILE &gFlRazNPZ
IF FILE(gBoxNpz + 'raznar.dbf')
	SELECT 0
	USE (gBoxNpz + 'raznar.dbf') ALIAS raznars
	APPEND FROM (gPathTemp + 'razn_npz.dbf')
	USE IN raznars
ELSE
	COPY FILE (gPathTemp + 'razn_npz.dbf') TO (gBoxNpz + 'raznar.dbf')
ENDIF
IF FILE(gBoxNpz + 'stan.dbf')
	IF FILE(gNstBoxTov + 'stan.dbf')
		SELECT 0
		USE (gBoxNpz + 'stan.dbf') ALIAS stans
		APPEND FROM (gNstBoxTov + 'stan.dbf')
		USE IN stans
		RENAME (gBoxNpz + 'stan.dbf') TO (gBoxNpz + 'stan1.dbf')
		USE (gBoxNpz + 'stan1.dbf') IN 0 ALIAS stan1
		SELECT * FROM stan1 INTO TABLE (gBoxNpz + 'stan.dbf');
			GROUP BY kod
		USE IN stan1
		USE IN stan
		DELETE FILE (gBoxNpz + 'stan1.dbf')
	ENDIF
ELSE
	COPY FILE (gNstBoxTov + 'stan.dbf') TO (gBoxNpz + 'stan.dbf')
ENDIF
IF FILE(gBoxNpz + 'predpr.dbf')
	IF FILE(gNstBoxTov + 'predpr.dbf')
		SELECT 0
		USE (gBoxNpz + 'predpr.dbf') ALIAS predprs
		APPEND FROM (gNstBoxTov + 'predpr.dbf')
		USE IN predprs
		RENAME (gBoxNpz + 'predpr.dbf') TO (gBoxNpz + 'predpr1.dbf')
		USE (gBoxNpz + 'predpr1.dbf') IN 0 ALIAS predpr1
		SELECT * FROM predpr1 INTO TABLE (gBoxNpz + 'predpr.dbf');
			GROUP BY kod
		USE IN predpr1
		USE IN predpr
		DELETE FILE (gBoxNpz + 'predpr1.dbf')
	ENDIF
ELSE
	COPY FILE (gNstBoxTov + 'predpr.dbf') TO (gBoxNpz + 'predpr.dbf')
ENDIF
IF FILE(gBoxNpz + 'vetka.dbf')
	IF FILE(gNstBoxTov + 'vetka.dbf')
		SELECT 0
		USE (gBoxNpz + 'vetka.dbf') ALIAS vetkas
		APPEND FROM (gNstBoxTov + 'vetka.dbf')
		USE IN vetkas
		RENAME (gBoxNpz + 'vetka.dbf') TO (gBoxNpz + 'vetka1.dbf')
		USE (gBoxNpz + 'vetka1.dbf') IN 0 ALIAS vetka1
		SELECT * FROM vetka1 INTO TABLE (gBoxNpz + 'vetka.dbf');
			GROUP BY kod
		USE IN vetka1
		USE IN vetka
		DELETE FILE (gBoxNpz + 'vetka1.dbf')
	ENDIF
ELSE
	COPY FILE (gNstBoxTov + 'vetka.dbf') TO (gBoxNpz + 'vetka.dbf')
ENDIF

IF FILE(gBoxNpz + 'region.dbf')
	DELETE FILE (gBoxNpz + 'region.dbf')
ENDIF
COPY FILE (gNstBoxTov + 'region.dbf') TO (gBoxNpz + 'region.dbf')

IF FILE(gBoxNpz + 'states.dbf')
	DELETE FILE (gBoxNpz + 'states.dbf')
ENDIF
COPY FILE (gNstBoxTov + 'states.dbf') TO (gBoxNpz + 'states.dbf')

IF FILE(gBoxNpz + 'gdor.dbf')
	DELETE FILE (gBoxNpz + 'gdor.dbf')
ENDIF
COPY FILE (gNstBoxTov + 'gdor.dbf') TO (gBoxNpz + 'gdor.dbf')

IF FILE(gBoxNpz + 'nazn_otg.dbf')
	DELETE FILE (gBoxNpz + 'nazn_otg.dbf')
ENDIF
IF !USED('naznadd')
	USE (gTovPrDbf + 'nazn_otg') IN 0 ALIAS naznadd AGAIN
ENDIF
SELECT naznadd
COPY TO (gBoxNpz + 'nazn_otg.dbf')
USE IN naznadd

IF FILE(gBoxNpz + 'prod.dbf')
	DELETE FILE (gBoxNpz + 'prod.dbf')
ENDIF
IF !USED('prodadd')
	USE (gTovPrDbf + 'prod') IN 0 ALIAS prodadd AGAIN
ENDIF
SELECT prodadd
COPY TO (gBoxNpz + 'prod.dbf')
USE IN prodadd

IF FILE(gBoxNpz + 'sobstv.dbf')
	DELETE FILE (gBoxNpz + 'sobstv.dbf')
ENDIF
IF !USED('sobadd')
	USE (gUchetDbf + 'sobstv') IN 0 ALIAS sobadd AGAIN
ENDIF
SELECT sobadd
COPY TO (gBoxNpz + 'sobstv.dbf') FIELDS kod, naim
USE IN sobadd
*flag = FCREATE(gFlRazNPZ)
*= FCLOSE(flag)
RETURN

PROCEDURE DebugRaznar
PUBLIC gNstBoxTov, gPathTemp, gTovPrDbf, gTovPrArh, gTovPrTxt,;
	gBoxNpz, gUchetDbf, gRaznRep, gTMFlags,;
	date_operation, time_operation
susp
clos data
set status off
set talk off
set safety off
*set proc to f:\project\lib\lib
gNstBoxTov = 'C:\TMP\'
gPathTemp = 'C:\TMP\'
gTovPrDbf = 'F:\TOV_PR\DBF\'
gTovPrArh = 'F:\TOV_PR\ARHIV\'
gTovPrTxt = 'C:\TMP\'
gBoxNpz = 'C:\TMP\BOX\'
gUchetDbf = 'F:\UCHET\DBF\'
gRaznRep = 'F:\TOV_PR\REPORT\'
gVizir = 'C:\TMP\'
gTMFlags = 'C:\TMP\'
gSvBoxIn = 'C:\TMP\'
gWBoxIn = 'C:\TMP\'
gFlRazNPZ = 'C:\TMP\razn_npz.t-m'
date_operation=date()
time_operation=time()
RETURN

PROCEDURE RaznProch  &&������������ ������� �� �������� ������ ����
PRIVATE stor_sele,use_zad,m.kod,m.kod_sobs,m.rec_rez
stor_sele=SELECT()

WAIT '������������ ������� �� �������� ������ ����' WINDOW NOWAIT
SELECT *;
	FROM raznar0;
	INTO TABLE (gPathTemp + 'cur_zad0.dbf');
	WHERE INLIST(otgr,'���')
m.rec_rez = _TALLY
IF m.rec_rez # 0
  IF !USED('CUR_ZAD')
    USE ('F:\OTGR\PROCHOTGR\DBF\CUR_ZAD') ORDER nom_zd IN 0
    use_zad=.T.
  ELSE
    use_zad=.F.
  ENDIF
  IF !USED('PREDPR')
    USE (gTovPrDbf + 'predpr') ORDER kod IN 0
    use_predpr=.T.
  ELSE
    use_predpr=.F.
  ENDIF
  SELECT cur_zad0
  SCAN
    SCATTER MEMVAR
    IF SEEK(kod_poluch,'PREDPR') AND !EMPTY(predpr.kod_sobs) AND tonn#0.001
      SELECT cur_zad
      IF SEEK(m.nom_zd,'CUR_ZAD')
        REPLACE tonn WITH tonn+cur_zad0.tonn,;
                kod_sobs WITH predpr.kod_sobs,;
                kol_tonn WITH kol_tonn+cur_zad.tonn
      ELSE
        IF m.tonn>0
          APPEND BLANK
          USE (gTovPrDbf+'PROD') ORDER kod IN 0 ALIAS _proprod AGAIN
          =SEEK(m.kod_npr,'_PROPROD')
          m.kod_npr=_proprod.kod_otgr
          USE IN _proprod
          GATHER MEMVAR
          REPLACE kod        WITH RIGHT(SYS(2015),9),;
                  tip_otgr   WITH 1,;
                  kod_poluch WITH 0,;
                  kst        WITH 0,;
                  kod_sobs   WITH predpr.kod_sobs,;
                       ceh   WITH IIF(m.mesto='�',17,11)
        ENDIF
      ENDIF
      SELECT cur_zad0
    ENDIF
  ENDSCAN
  IF use_zad
    USE IN cur_zad
  ENDIF
  IF use_predpr
    USE IN predpr
  ENDIF
ENDIF
USE IN cur_zad0
WAIT CLEAR

SELECT (stor_sele)
RETURN
