*:******************************************************************
*:
*:		Process : operotg.prg
*:		Descript : ╘юЁьшЁютрэшх юяхЁрЄштэюую Їрщыр юЄуЁєчюъ OPEROTG.DBF
*:		Descript : Формирование оперативного файла отгрузок OPEROTG.DBF
*:		Status  : PRIVATE
*:
*:******************************************************************
IF DAY(DATE())=1	&& ╧хЁтюую ўшёыр ърцфюую ьхё Ўр юЄё√ырЄ№;
					   шэЇюЁьрЎш■ чр яЁю°ы√щ яхЁшюф
                  && Первого числа каждого месяца отсылать;
             информацию за прошлый период
	date0 = DATE()-1
ELSE
	date0 = DATE()
ENDIF
PRIVATE m.mm, m.gg
m.mm = alltrim(str(month(date0)))
m.mm = IIF(LEN(m.mm)=1,'0'+m.mm,m.mm)
m.gg = alltr(str(year(date0)))
date1 = CTOD('1/'+m.mm+'/'+m.gg)
date2 = DATE()
DO oper WITH date0,2
RETURN

PROC oper
PARA date0,kol_files    &&2-юсэюты Є№ т OPEROTG ш OPERTTO, 1-Єюы№ъю OPERTTO
                        &&2-обновлять в OPEROTG и OPERTTO, 1-только OPERTTO
IF TYPE('date0')#'D'
   IF DAY(DATE())=1  && ╧хЁтюую ўшёыр ърцфюую ьхё Ўр юЄё√ырЄ№;
                шэЇюЁьрЎш■ чр яЁю°ы√щ яхЁшюф
                     && Первого числа каждого месяца отсылать;
                информацию за прошлый период
     date0 = DATE()-1
   ELSE
     date0 = DATE()
   ENDIF
ENDIF
IF TYPE('kol_files')#'N' OR !INLIST(kol_files,1,2)
   kol_files=1
ENDIF
PRIVATE m.safety, m.deleted, m.file1, m.file2, m.file3
WAIT CLEAR
PRIVATE str_n_dog,str_type_fox
IF _DOS
   WAIT 'Формирование оперативного файла отгрузок.'+CHR(13)+;
	 'Запрос файла:             REESTR_D.DBF...'WINDOW NOWAIT
   str_n_dog='6077/Х2-99'
   str_type_fox=''
ELSE
   WAIT '╘юЁьшЁютрэшх юяхЁрЄштэюую Їрщыр юЄуЁєчюъ.'+CHR(13)+;
	 '╟ряЁюё Їрщыр:             REESTR_D.DBF...'WINDOW NOWAIT
   str_n_dog='6077/╒2-99'
   str_type_fox='TYPE FOX2X'
ENDIF
m.deleted = SET('DELETED')
m.safety = SET('SAFETY')
SET DELETED OFF
SET SAFETY OFF
m.file2 = gPathTemp  + SYS(3)
SELECT;
		kod,;
		kod_fond,;
		kod_plat, ;
		kod_poluch, ;
		kod_potreb,;
		kod_npr, ;
		n_dog, ;
		prizn_mps, ;
		IIF(EMPTY(transp),SPACE(32),transp) AS transp,;
		kol_cist, ;
		date_razn, ;
		dop_cist, ;
		num_cist,;
		date_otgr, ;
		ves, ;
		tip,;
		tipv, ;
		reestr, ;
		kst, ;
		dav, ;
		posred,;
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
	    pasp,;
	    kod_sgr,;
	    kod_spg,;
		res_akt+'    ' AS res_akt,;
      	nom_zv,;
      	num_rees,;
	    IIF(DELETED(),.T.,.F.) AS del;
	FROM (gTovPrDbf + 'reestr_d');
  INTO TABLE &file2;
	WHERE date_otgr BETWEEN date1 AND date2;
		AND !arh;
		AND error = 0;
		AND !EMPTY(num_cist);
    AND !DELETED() AND AT(str_n_dog,n_dog)=0
USE
IF USED('reestr_d')
	USE IN reestr_d
ENDIF

WAIT CLEAR
IF _DOS
   WAIT 'Формирование оперативного файла отгрузок.'+CHR(13)+;
	 'Запрос файла:               REESTR.DBF...'WINDOW NOWAIT
ELSE
   WAIT '╘юЁьшЁютрэшх юяхЁрЄштэюую Їрщыр юЄуЁєчюъ.'+CHR(13)+;
	 '╟ряЁюё Їрщыр:               REESTR.DBF...'WINDOW NOWAIT
ENDIF
m.file1 = gPathTemp  + SYS(3)
SELECT;
		kod,;
		kod_fond,;
		kod_plat, ;
		kod_poluch, ;
		kod_potreb,;
		kod_npr, ;
		n_dog, ;
		prizn_mps, ;
		transp,;
		kol_cist, ;
		date_razn, ;
		dop_cist, ;
		num_cist,;
		date_otgr, ;
		ves, ;
		tip,;
		tipv, ;
		reestr, ;
		kst, ;
		dav, ;
		posred,;
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
    	pasp,;
	    kod_sgr,;
	    kod_spg,;
		res_akt+'    ' AS res_akt,;
      	nom_zv,;
      	num_rees,;
	    IIF(DELETED(),.T.,.F.) AS del;
	FROM (gTovPrArh + 'reestr');
	INTO TABLE &file1;
	WHERE date_otgr BETWEEN date1 AND date2;
		AND error = 0;
    AND !DELETED() AND AT(str_n_dog,n_dog)=0

APPEND FROM &file2
DELETE FILE (file2 + '.dbf')
USE
IF USED('reestr')
	USE IN reestr
ENDIF

WAIT CLEAR
IF _DOS
   WAIT 'Формирование оперативного файла отгрузок.'+CHR(13)+;
	 'Запрос файла:             SVIVOZ_O.DBF...'WINDOW NOWAIT
ELSE
   WAIT '╘юЁьшЁютрэшх юяхЁрЄштэюую Їрщыр юЄуЁєчюъ.'+CHR(13)+;
	 '╟ряЁюё Їрщыр:             SVIVOZ_O.DBF...'WINDOW NOWAIT
ENDIF
m.file3 = gPathTemp  + SYS(3)
SELECT;
		kod,;
		kod_fond,;
		kod_plat, ;
		kod_poluch, ;
		kod_potreb,;
		kod_npr, ;
		n_dog, ;
		prizn_mps, ;
		transp,;
		kol_cist, ;
		date_razn, ;
		num_cist,;
		date_otgr, ;
		ves, ;
		reestr, ;
		kst, ;
		dav, ;
		posred,;
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
	    pasp,;
	    kod_sgr,;
	    kod_spg,;
     kod AS res_akt,;
      rodv,;
      	nom_zv,;
      	num_rees,;
	    IIF(DELETED(),.T.,.F.) AS del;
	FROM (gTovPrArh + 'reestr_s');
	INTO TABLE &file3;
	WHERE date_otgr BETWEEN date1 AND date2;
		AND error = 0;
    AND !DELETED() AND AT(str_n_dog,n_dog)=0
IF FILE(gSvOper + 'svivoz_o.dbf')
	APPEND FROM (gSvOper + 'svivoz_o.dbf')
ENDIF
USE (gTovPrArh + 'raznar') IN 0 ALIAS razntto ORDER TAG nom_zd AGAIN
IF USED('razntto')
   SET RELA TO nom_zd INTO razntto
   REPL ALL FOR INLIST(tip_otgr,2,6) AND dav#razntto.dav dav WITH razntto.dav
   USE IN razntto
ENDIF

USE
IF USED('reestr_s')
   USE IN reestr_s
ENDIF
WAIT CLEAR
IF _DOS
   IF kol_files=2
      WAIT 'Формирование оперативного файла отгрузок.'+CHR(13)+;
      'Формирование файла для отправки:   OPEROTG.DBF...'WINDOW NOWAIT
   ELSE
      WAIT WIND NOWAIT 'Компоновка результата...'
   ENDIF
ELSE
   IF kol_files=2
      WAIT '╘юЁьшЁютрэшх юяхЁрЄштэюую Їрщыр юЄуЁєчюъ.'+CHR(13)+;
      '╘юЁьшЁютрэшх Їрщыр фы  юЄяЁртъш:   OPEROTG.DBF...'WINDOW NOWAIT
   ELSE
      WAIT WIND NOWAIT '╩юьяюэютър Ёхчєы№ЄрЄр...'
   ENDIF
ENDIF
USE &file1 AGAIN
APPEND FROM &file3
DELETE FILE (file3 + '.dbf')

*DO (gPathDoPrg+'nedokum.prg') WITH date1,date2  &&фюяюыэхэшх ръЄрьш, эх шьх■∙шьш ёё√ыюъ

*** ╩юяшЁютрэшх т сюъё фы  юЄяЁртъш
IF kol_files=2
   COPY TO (gNstVtu + 'operotg.dbf') FOR !del
   PRIVATE flrun, m.seconds
   flsend = FCREATE(gTMFlags + 'operotg.t-m')
   = FCLOSE(flsend)
ENDIF

m.seconds = SECONDS()
DO WHILE FILE(gOperOtg + 'operotg.not') AND m.sec - m.seconds < 60
	m.sec = SECONDS()
  IF _DOS
     WAIT [Обнаружен флаг ]+gOperOtg+[operotg.not. Ожидание 1 мин...] WINDOW NOWAIT
  ELSE
     WAIT [╬сэрЁєцхэ Їыру ]+gOperOtg+[operotg.not. ╬цшфрэшх 1 ьшэ...] WINDOW NOWAIT
  ENDIF
ENDDO
DELETE FILE (gOperOtg + 'operotg.not')
flsend = FCREATE(gOperOtg + 'operotg.cop')
= FCLOSE(flsend)
IF kol_files=2
   COPY TO (gOperOtg + m.gg+m.mm+'.dbf') FOR !del &str_type_fox
ENDIF
COPY TO (gOperTTO + m.gg+m.mm+'.dbf') FOR !del &str_type_fox
USE     (gOperTTO + m.gg+m.mm+'.dbf') AGAIN
DELE ALL FOR kod_otgr=8         && ─ы  юЄфхыр ╥╥╬ єсшЁр■ яхЁхьх∙хэш
                                && Для отдела ТТО убираю перемещения
USE
DELETE FILE (gOperOtg + 'operotg.cop')

DELETE FILE (file1 + '.dbf')
RELEASE m.flsend, m.seconds

SET SAFETY &safety
SET DELETED &deleted
RETURN
