*:******************************************************************
*:
*:		Process : adm_otgr.prg
*:		Descript : Формирование оперативного файла отгрузок REESTR.DBF
*:		Status  : PRIVATE
*:		Call    : !admnlch.prg
*:      Is ready for VFP?  - READY
*:
*:******************************************************************
*DO f:\dba\mgrsr\doprg.vfp\config.prg

PRIVATE m.safety, m.file1, m.file2, m.file3
WAIT CLEAR
WAIT 'Формирование оперативного файла отгрузок.'+CHR(13)+;
	 'Запрос файла:             REESTR_D.DBF...'WINDOW NOWAIT

m.safety = SET('SAFETY')
SET SAFETY OFF
IF DAY(DATE())=1	&& Первого числа каждого месяца отсылать;
					   информацию за прошлый период
	date0 = DATE()-1
ELSE
	date0 = DATE()
ENDIF
date1 = CTOD('1/'+alltrim(str(month(date0)))+'/'+alltr(str(year(date0))))
date2 = DATE()
m.file1 = gPathTemp  + SYS(3)
SELECT;
		kod,;
		kod_fond,;
		kod_plat, ;
		kod_poluch, ;
		kod_potreb,;
		kod_npr, ;
		n_dog, ;
		p_gdpl,;
		prizn_mps, ;
		IIF(EMPTY(transp),SPACE(32),transp) AS transp,;
		kol_cist, ;
		date_razn, ;
		dop_cist, ;
		num_cist,;
		date_otgr, ;
		ves,;
		fakt,;
		tip,;
		tipv, ;
		reestr, ;
		kst, ;
		kst_o, ;
		dav, ;
		gtd, ;
		kvet, ;
		vn_transp,;
		error,;
		arh,;
		mesto, ;
		tip_otgr, ;
		kateg_cen, ;
		date_cen, ;
		kod_otgr, ;
		kod_sobs, ;
		kod_post,;
		var_post, ;
		kod_otv, ;
		el_f,;
		summa,;
		ntarif,;
		ndop_tarif,;
		date_kvit,;
		num_kvit,;
		date_gd,;
		rodv,;
		nom_zd,;
		cnt_cist,;
		n_rez,;
		IIF(rodv=2,INT(kol_all),00000) AS kolmest,;
		wes_ed,;
	    num,;
	    pasp, osc, kod_grotp,;
	    date_beg, ree_priz, kodser, kodpasp;
	FROM (gTovPrDbf + 'reestr_d');
	INTO TABLE &file1;
	WHERE date_otgr BETWEEN date1 AND date2;
		AND !arh;
		AND error = 0;
		AND !EMPTY(num_cist);
		AND !DELETED()
COPY TO (gPathTemp + 'reestr.dbf') TYPE FOX2X
USE
IF USED('reestr_d')
	USE IN reestr_d
ENDIF

WAIT CLEAR
WAIT 'Формирование оперативного файла отгрузок.'+CHR(13)+;
	 'Запрос файла:               REESTR.DBF...'WINDOW NOWAIT
m.file2 = gPathTemp  + SYS(3)
SELECT;
		kod,;
		kod_fond,;
		kod_plat, ;
		kod_poluch, ;
		kod_potreb,;
		kod_npr, ;
		n_dog, ;
		p_gdpl,;
		prizn_mps, ;
		transp,;
		kol_cist, ;
		date_razn, ;
		dop_cist, ;
		num_cist,;
		date_otgr, ;
		ves, ;
		fakt, ;
		tip, ;
		tipv, ;
		reestr, ;
		kst, ;
		kst_o, ;
		dav, ;
		gtd, ;
		kvet, ;
		error,;
		mesto, ;
		tip_otgr, ;
		kateg_cen, ;
		date_cen, ;
		kod_otgr, ;
		kod_sobs, ;
		kod_post,;
		var_post, ;
		kod_otv, ;
		el_f,;
		summa,;
		ntarif,;
		ndop_tarif,;
		date_kvit,;
		num_kvit,;
		date_gd,;
		rodv,;
	    nom_zd,;
		cnt_cist,;
		n_rez,;
		IIF(rodv=2,INT(kol_all),00000) AS kolmest,;
		wes_ed,;
	    num,;
    	pasp, osc, kod_grotp,;
    	date_beg, ree_priz, kodser, kodpasp;
	FROM (gTovPrArh + 'reestr');
	INTO TABLE &file2;
	WHERE date_otgr BETWEEN date1 AND date2;
		AND error = 0;
		AND !DELETED()
USE
IF USED('reestr')
	USE IN reestr
ENDIF

WAIT CLEAR
WAIT 'Формирование оперативного файла отгрузок.'+CHR(13)+;
	 'Запрос файла:             SVIVOZ_O.DBF...'WINDOW NOWAIT
m.file3 = gPathTemp  + SYS(3)
SELECT;
		kod,;
		kod_fond,;
		kod_plat, ;
		kod_poluch, ;
		kod_potreb,;
		kod_npr, ;
		n_dog, ;
		p_gdpl,;
		prizn_mps, ;
		transp,;
		kol_cist, ;
		date_razn, ;
		num_cist,;
		date_otgr, ;
		ves, ;
		fakt, ;
		reestr, ;
		kst, ;
		0 AS kst_o, ;
		dav, ;
		gtd, ;
		error,;
		mesto, ;
		tip_otgr, ;
		kateg_cen, ;
		date_cen, ;
		kod_otgr, ;
		kod_sobs, ;
		kod_post,;
		var_post, ;
		kod_otv, ;
		summa,;
		ntarif,;
		ndop_tarif,;
		date_kvit,;
		num_kvit,;
		nom_zd,;
	    0 AS n_rez,;
	    kolmest,;
	    wes_ed,;
	    pasp;
	FROM (gTovPrArh + 'reestr_s');
	INTO TABLE &file3;
	WHERE date_otgr BETWEEN date1 AND date2;
		AND error = 0;
		AND !DELETED()
*IF FILE(gSvOper + 'svivoz_o.dbf')
*	APPEND FROM (gSvOper + 'svivoz_o.dbf') FOR (date_otgr >= date1 AND date_otgr <= date2)
*ENDIF
USE
IF USED('reestr_s')
   USE IN reestr_s
ENDIF
USE (gSvOper + 'reestr_d') ALIAS sv IN 0 NOUPDATE
SELECT * FROM sv WHERE !tran_ras AND transflag AND !DELETED();
	INTO TABLE (gPathTemp + 'svoper.dbf')
USE
USE IN sv
WAIT CLEAR
WAIT 'Формирование оперативного файла отгрузок.'+CHR(13)+;
 	 'Формирование файла для отправки:   REESTR.DBF...'WINDOW NOWAIT

USE (gPathTemp + 'reestr.dbf') AGAIN
APPEND FROM &file2
APPEND FROM &file3
APPEND FROM (gPathTemp + 'svoper.dbf')
DELETE FILE (gUchBoxSb + 'reestr.dbf')
COPY TO (gUchBoxSb + 'reestr.dbf') TYPE FOX2X
USE
DELETE FILE (file1 + '.dbf')
DELETE FILE (file2 + '.dbf')
DELETE FILE (file3 + '.dbf')
DELETE FILE (gPathTemp + 'svoper.dbf')

SET SAFETY &safety
RETURN 0