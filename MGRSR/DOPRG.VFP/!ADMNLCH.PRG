*:*******************************************************************
*:
*:		Process : !admnlch.prg
*:		Descript: Формирование оперативного наличия н/продуктов
*:			в разрезе продукт, собственник, происхождение - цена,
*:			локализаци
*:      Is ready for VFP?  - READY
*:
*******************************************************************
IF FILE(gPathFlag + 'nalich.run')
	gReturnErr = 'Формирование наличия отложено. Обнаружен флаг '+ gPathFlag + 'nalich.run'
	gInfoStr = ''
	=Wait3Beep(gReturnErr)
	RETURN
ENDIF
*** Выставляем флаг, запрещающий выполняться другим сессиям формирования наличи
PRIVATE flrun
flrun = FCREATE(gPathFlag + 'nalich.run')
= FCLOSE(flrun)
RELEASE flrun
m.alias = SELECT()
WAIT ' Формирование файла по наличию н/продуктов... ' WINDOW NOWAIT
PRIVATE m._p_akt, m._p_arh, m._p_npz, m._p_otgr, m._p_saldo, m._p_storno,;
	m._p_adm, m._p_nalich, m._p_box, m._p_strukt, m._p_tmp,;
	m._f_akt, m._f_rees, m._f_reesd, m._f_reesz, m._f_reess, m._f_cen,;
	m._f_nalich, m._f_aktnlch, m._f_snalich, m._f_prtcl, m._f_prod,;
	m._f_sobstv, m._f_varpost, m._f_prihod, m._f_rashod, m._f_naltmp,;
	m._f_naltmp1, m._f_prih, m._f_rash, m._f_rash_a, m._f_rash_o, m._f_rasho1,;
	m._f_rasho2, m._f_rasho3, m._f_tmpraznar, m._f_tmpsobstv, m._f_tmpvarpost,;
  m._f_tmpakt, m._f_tmpprih, m._f_tmprash

*real_form='LOCAL'  &&Отладочный вариант без передачи
real_form='YES'
m.curdate = DATE()              && По текущий день

SET EXCLUSIVE OFF
SET REPROCESS TO 0
SET SAFETY OFF
SET NEAR OFF
SET DELETE ON

SET TALK OFF

m._p_akt = 'F:\UCHET\DBF\'
m._p_arh = 'F:\TOV_PR\ARHIV\'
m._p_npz = 'F:\TOV_PR\ADM\'
m._p_otgr = 'F:\TOV_PR\DBF\'
m._p_saldo = 'F:\UCHET\SALDOMTH\'
m._p_storno = 'F:\UCHET\STORNO\'
m._p_adm = 'F:\UCHET\ADM\'
m._p_nalich = 'F:\UCHET\NALICH\'
m._p_box = 'F:\UCHET\BOX_SBIT\'
m._p_strukt = 'F:\UCHET\ADM\'
m._p_tmp = gPathTemp

m._f_akt = m._p_akt + 'akts'
m._f_rees = m._p_arh + 'ras_ar'
m._f_reesd = m._p_otgr + 'reestr_d'
m._f_reesz = m._p_arh + 'reestrz'
m._f_reess = m._p_arh + 'reestr_s'

m._f_cen = m._p_nalich + 'npr_cen'
m._f_nalich = m._p_nalich + 'nalich.dbf'
m._f_aktnlch = m._p_nalich + 'aktnlch.dbf'
m._f_snalich = m._p_strukt + 'snalich.dbf'
m._f_prtcl = m._p_saldo + 'prtsld-m'

m._f_prod = m._p_otgr + 'prod'
m._f_sobstv = m._p_akt + 'sobstv'
m._f_varpost = m._p_akt + 'varpost'

m._f_prihod = m._p_tmp + 'prihod.dbf'
m._f_rashod = m._p_tmp + 'rashod.dbf'
m._f_naltmp = m._p_tmp + 'naltmp.dbf'
m._f_naltmp1 = m._p_tmp + 'naltmp1.dbf'

m._f_prih = m._p_tmp + 'prih.dbf'
m._f_rash = m._p_tmp + 'rash.dbf'

m._f_rash_a = m._p_tmp + 'rash_a.dbf'
m._f_rash_o = m._p_tmp + 'rash_o.dbf'
m._f_rasho1 = m._p_tmp + 'rasho1.dbf'
m._f_rasho2 = m._p_tmp + 'rasho2.dbf'
m._f_rasho3 = m._p_tmp + 'rasho3.dbf'

m._f_tmpraznar = m._p_tmp + 'raznar0.dbf'
m._f_tmpsobstv = m._p_tmp + 'sobstv.dbf'
m._f_tmpvarpost = m._p_tmp + 'varpost.dbf'
m._f_tmpakt = m._p_tmp + 'tmpakt.dbf'
m._f_tmpprih = m._p_tmp + 'tmpprih.dbf'
m._f_tmprash = m._p_tmp + 'tmprash.dbf'

*** Debug
*CLOS DATA
*set proc to c:\fp\lib
*strtime = '10:13'
*gPathDoPrg = 'f:\project\adm\doprg\'

**** Определяем период формирования и последний файл сальдо из протокола
SELECT 0
USE &_f_prtcl
GO BOTTOM
m._filesaldo = m._p_saldo + name_saldo		&& Текущий файл сальдо
m._f_indsaldo = m._p_saldo + name_saldo + '.cdx'
m._f_storno = m._p_storno + 'strn_' + SUBSTR(name_saldo,6,3) + '.dbf'
m._begin = date_begin						&& Начало периода файла сальдо
m._end = date_end							&& Конец периода файла сальдо
m.curbegin=m.curdate-DAY(m.curdate)+1
m.curend=m.curbegin+31-DAY(m.curbegin+31)
_emp_dt=CTOD('')

m.datecenlimit = {1/3/96}
*m.curdate = {31/8/95}
*m._begin = {1/8/95}
*m._end = {31/7/95}

USE
USE &_f_prod ALIAS prod ORDER kod IN 0
USE &_f_sobstv ALIAS sobstv ORDER kod IN 0
USE &_f_varpost ALIAS varpost ORDER kod IN 0

DECLARE tov_kr[3],filerash[2]
tov_kr[1]='tk_sh'
tov_kr[2]='tk_sr'
tov_kr[3]='sr_nk'
filerash[1]='ras_nal'
filerash[2]='ras_akt'
CREATE TABLE &_f_tmpakt (kod_npr C(5), kod_sobs N(6,0), kod_post N(6,0),;
        var_post N(2,0), date_cen D, dokum L, kod_otv N(6), mesto C(1), saldo_n N(13,6),;
        prihod N(13,6), prihod0 N(13,6), rashod N(13,6), rashod0 N(13,6),;
        saldo_r N(13,6), date D, flag_op N(4,1), akt L, date_akt D, num_akt C(3))
USE &_f_akt IN 0
SELECT akts
**** Формирование временного файла актов, содержащий все проводки****
**** (без группировки)

SCAN FOR BETWEEN(date_akt,m._end+1,curdate);
  AND INLIST(kod_op,6,10) AND (dokum OR kod_prin=4)
  IF kod_sobs<>32 OR (vid_akt=3 AND !INLIST(flag_op,1,5) OR vid_akt<>3)
     SCATTER MEMVAR
     SELE tmpakt
     pole_oper=IIF(m.kod_op=6,'rashod','prihod')
     pole_oper0=pole_oper+'0'
     naim_otv=IIF(m.kod_op=6,'kod_sdal','kod_prin')
     IF m.kod_sobs=32 AND m.flag_tk AND m.kod_post=1
        FOR i=1 TO 3
            p=tov_kr[i]
            IF akts->&p<>0
               APPE BLANK
               GATH MEMVAR
               REPL &pole_oper WITH akts->&p, ;
                    mesto WITH IIF(akts->&naim_otv=11,'З',IIF(INLIST(akts->&naim_otv,2,3,4,17),'Н','П')),;
                    kod_otv WITH IIF(INLIST(akts->&naim_otv,2,3),17,akts->&naim_otv),;
                    date WITH akts.date_akt,;
                    var_post WITH 10+i
               IF BETWEEN(akts.date_akt,m.curbegin,m.curdate)
                  REPL &pole_oper0 WITH &pole_oper
               ENDIF
               DO priv_cen
               REPL akt WITH akts.dokum
               DO privod
            ENDIF
        NEXT
     ELSE
        APPEND BLANK
        GATH MEMVAR
        REPL &pole_oper WITH akts.kol_akt, ;
             mesto WITH IIF(akts->&naim_otv=11,'З',IIF(INLIST(akts->&naim_otv,2,3,4,17),'Н','П')),;
             kod_otv WITH IIF(INLIST(akts->&naim_otv,2,3),17,akts->&naim_otv),;
             date WITH akts.date_akt
        IF BETWEEN(akts.date_akt,m.curbegin,m.curdate)
           REPL &pole_oper0 WITH &pole_oper
        ENDIF
        DO priv_cen
        REPL akt WITH akts.dokum
        DO privod
     ENDIF
     SELE akts
  ENDIF
ENDSCAN

USE &_filesaldo ALIAS saldo   &&Закрыть акты и открыть сальдо
SCAN
   SCATTER MEMVAR
   SELE tmpakt
   APPE BLANK
   GATH MEMVAR
   REPL prihod WITH 0, rashod WITH 0,saldo_r WITH 0,flag_op WITH 0,akt WITH .T.,;
        prihod0 WITH 0, rashod0 WITH 0,;
    mesto WITH IIF(saldo.kod_otv=11,'З',IIF(INLIST(saldo.kod_otv,2,3,4,17),'Н','П')),;
    dokum WITH .t.,date WITH _emp_dt
   REPL kod_otv WITH IIF(INLIST(kod_otv,2,3),17,kod_otv)
   SELE saldo
ENDSCAN
**************************Непроактированная реализация**************
SELECT kod_npr,nom_zd,kod_sobs,kod_post,var_post,SUM(ves) AS rashod,;
       dnakl_in,date_cen,mesto;
   FROM (m._p_akt+'rez_akt') INTO TABLE (m._p_tmp+'rez') ;
   WHERE BETWEEN(dnakl_in,m._end+1,curdate) AND dok AND num_akt='   ';
         AND EMPTY(date_akt) AND INLIST(tipdok,3,6,7,96,97,98);
   GROUP BY kod_npr,nom_zd,kod_sobs,kod_post,var_post,dnakl_in,date_cen,mesto
USE (m._p_arh+'raznar') IN 0 ALIAS raznlch AGAIN ORDER TAG nom_zd
SET RELA TO nom_zd INTO raznlch
SCAN FOR raznlch.kod_otgr<>8
   SCATTER MEMVAR
   SELE tmpakt
   APPE BLANK
   GATH MEMVAR
   REPL mesto WITH IIF(rez.mesto=11,'З',IIF(INLIST(rez.mesto,2,3,4,17),'Н','П')),date WITH rez.dnakl_in,;
        rashod WITH rez.rashod,flag_op WITH 0,akt WITH .F.,;
        saldo_n WITH 0,prihod WITH 0,prihod0 WITH 0
   REPL kod_otv WITH IIF(INLIST(rez.mesto,2,3),17,rez.mesto)
   IF BETWEEN(date,m.curbegin,m.curdate)
      REPL rashod0 WITH rashod
   ENDIF
   DO priv_cen
   DO privod
   SELE rez
ENDSCAN
USE IN raznlch
************************Наращиваю емкости****************
USE (m._p_akt+'sootn')
LOCA FOR BETWEEN(date,m.curbegin,m.curend)
srnk=IIF(FOUND(),sr_nk,1)
minf=IIF(FOUND(),tk_sh+tk_sr,0)
USE
SELECT kod_npr,date,SUM(saldo_n) AS saldo_n,SUM(prihod) AS prihod,;
       SUM(rashod) AS rashod, SUM(saldo_n+prihod-rashod) AS saldo_r,;
       kod_otv;
    FROM tmpakt INTO TABLE (m._p_tmp+'emk');
    WHERE kod_otv<>4 AND kod_sobs=32;
    GROUP BY kod_npr,kod_otv,date;
    ORDER BY kod_npr,kod_otv,date
knp='*****'
ktv=0
nal=0
SCAN
     IF knp#kod_npr OR ktv<>kod_otv
        knp=kod_npr
        ktv=kod_otv
        nal=0
     ENDIF
     nal=nal+saldo_r
     IF nal<0 AND rashod>0
        nal1=MIN((-1)*nal,rashod)
        SCATT MEMVAR
        SELE tmpakt
        APPE BLANK
        REPL kod_npr WITH m.kod_npr,kod_sobs WITH 32,kod_post WITH 1,;
             var_post WITH 13,date_cen WITH m.curbegin,;
             prihod WITH nal1*srnk/(srnk+minf),date WITH m.curdate
        REPL prihod0 WITH prihod
        SCATT MEMVAR
        APPE BLANK
        GATH MEMVAR
        REPL var_post WITH 12,prihod WITH nal1-m.prihod
        REPL prihod0 WITH prihod
        SELE emk
        nal=nal+nal1
     ENDIF
ENDSCAN

USE IN emk
DELE FILE (m._p_tmp+'emk.dbf')

***************************Расход*****************
SELECT kod_npr,kod_sobs,kod_post,var_post,date_cen,;
       SUM(rashod) AS rashod,SUM(rashod0) AS rashod0;
   FROM tmpakt INTO TABLE (m._p_tmp+filerash[1]);
   WHERE kod_sobs=32 AND kod_post=1 AND INLIST(var_post,12,13) AND date<>_emp_dt;
         AND !INLIST(flag_op,6,10,14);
   GROUP BY date_cen,kod_npr;
   ORDER BY date_cen,kod_npr
SELECT kod_npr,kod_sobs,kod_post,var_post,date_cen,;
       SUM(rashod) AS rashod,SUM(rashod0) AS rashod0;
   FROM tmpakt INTO TABLE (m._p_tmp+filerash[2]);
   WHERE kod_sobs=32 AND kod_post=1 AND INLIST(var_post,12,13) AND date<>_emp_dt AND akt;
         AND !INLIST(flag_op,6,10,14);
   GROUP BY date_cen,kod_npr;
   ORDER BY date_cen,kod_npr
SELE tmpakt
REPL ALL FOR kod_sobs=32 AND kod_post=1 AND INLIST(var_post,12,13) AND date<>_emp_dt;
     rashod WITH 0,rashod0 WITH 0
FOR i=1 TO 2   &&1-оперативн.налич.  2-налич.по актам
   _rashod=filerash[i]
   ***************************К распределению*****************
   flt=IIF(i=1,'!INLIST(flag_op,6,10,14)','!INLIST(flag_op,6,10,14) AND akt')
   SELECT kod_npr,kod_sobs,kod_post,var_post,date_cen,;
          SUM(saldo_n) AS saldo_n,;
          SUM(prihod) AS prihod,;
          SUM(prihod0) AS prihod0,;
          SUM(rashod) AS rashod,;
          SUM(rashod0) AS rashod0,;
          SUM(saldo_n+prihod-rashod) AS saldo_r;
      FROM tmpakt INTO TABLE (m._p_tmp+'raspred');
      WHERE &flt;
      GROUP BY kod_sobs,kod_post,var_post,kod_npr,date_cen;
      ORDER BY kod_sobs,kod_post,var_post,kod_npr,date_cen
   _recn=RECCOUNT()
   SELE &_rashod
   DELE ALL FOR rashod=0 AND rashod0=0
   SCAN            &&Расход продукта к распределению (FIFO)
      SCATT MEMVAR
      SELE raspred
      flt='kod_npr=m.kod_npr AND kod_sobs=32 AND kod_post=1 AND var_post=m.var_post'
      LOCA FOR &flt
      DO WHILE &flt AND &_rashod->rashod<>0 AND RECNO()<=_recn
         IF saldo_r<>0
            m=MIN(&_rashod->rashod,saldo_r)
            REPL rashod WITH rashod+m,;
                 saldo_r WITH saldo_r-m,;
                 &_rashod->rashod WITH &_rashod->rashod-m
            m=MIN(m,&_rashod->rashod0)
            IF m>0
               REPL rashod0 WITH rashod0+m,;
                    &_rashod->rashod0 WITH &_rashod->rashod0-m
            ENDIF
         ENDIF
         SKIP
      ENDDO
      IF &_rashod->rashod<>0 OR &_rashod->rashod0<>0
         APPE BLANK
         REPL kod_sobs WITH 32,;
              kod_post WITH 1,;
              var_post WITH m.var_post,;
              date_cen WITH m.date_cen,;
              kod_npr WITH m.kod_npr,;
              rashod WITH &_rashod->rashod,;
              rashod0 WITH &_rashod->rashod0,;
              saldo_r WITH -1 * &_rashod->rashod
         REPL &_rashod->rashod WITH 0
      ENDIF
      SELE &_rashod
   ENDSCAN


**********************************************************************
********************* Создание файла наличия NALICH ******************
**********************************************************************
   _tmp=IIF(i=1,_f_naltmp,_f_naltmp1)
   SELECT;
       kod_npr, SPACE(20) AS naim_pr,;
       kod_sobs, SPACE(30) AS naim_sobs,;
       kod_post, SPACE(30) AS naim_post,;
       var_post, SPACE(30) AS naim_var,;
       date_cen,;
       SUM(saldo_n) AS saldo_n,;
       SUM(prihod) AS prihod,;
       SUM(prihod0) AS prihod0,;
       SUM(rashod) AS rashod,;
       SUM(rashod0) AS rashod0,;
       SUM(prihod - rashod + saldo_n) AS saldo_r,;
       00 AS month,;
       0000 AS year,;
       .F. AS RealCen;
     FROM raspred;
     INTO TABLE &_tmp;
     ORDER BY kod_npr, kod_sobs, kod_post, var_post, date_cen;
     GROUP BY kod_npr, kod_sobs, kod_post, var_post, date_cen
   DELETE ALL FOR saldo_n=0 and prihod=0 and rashod=0 and saldo_r=0
   USE IN raspred
   DELE FILE (m._p_tmp+'raspred.dbf')
   USE IN &_rashod
   DELE FILE (m._p_tmp+filerash[i]+'.dbf')
*   DO RealCenReestr
   SET RELATION TO kod_npr INTO prod, kod_sobs INTO sobstv, var_post INTO varpost
   m.barblk = 0
   SCAN
     IF real_form='YES'
        = barprcnt(20, 'Дополнение справочной информацией :')
     ENDIF
     REPLACE naim_pr WITH prod.naim_pr, naim_sobs WITH sobstv.naim,;
       naim_var WITH varpost.naim_var
     IF SEEK(kod_post, 'sobstv')
       REPLACE naim_post WITH sobstv.naim
     ENDIF
     REPLACE month WITH MONTH(date_cen), year WITH YEAR(date_cen)
   ENDSCAN
   PACK
NEXT

IF real_form#'YES'
   CANCEL &&Отладка
ENDIF

USE IN tmpakt
DELE FILE (m._p_tmp+'tmpakt.dbf')
DELE FILE (m._p_tmp+'rez.dbf')
WAIT 'Формирование пакета на отправку...' WINDOW NOWAIT
**** А не копируется ли NALICH кем-нибудь ?
IF FILE('F:\UCHET\NALICH\nalich.cop')
	DO Delete_file
	gInfoStr = [Обнаружен флаг F:\UCHET\NALICH\nalich.cop. Пакет не был сформирован.]
	gReturnErr = [Ошибка формирования пакета NALICH. Копирование невозможно. Файл F:\UCHET\NALICH\NALICH.DBF.]
	DELETE FILE (gPathFlag + 'nalich.run')
	=Wait3Beep(gInfoStr)
	RETURN	&& Кто-то копирует NALICH(Вернусь через некоторое время...)
ENDIF

&&&&&&&&&&&&&&&&&&&&&&&&&&&7
*USE &_f_naltmp excl
*BROW
*RETURN
&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

*** Выставляем флаг, запрещающий копирование из ввода актов
IF FILE('F:\UCHET\ADM\nalich.cop')
	COPY FILE F:\UCHET\ADM\nalich.cop TO F:\UCHET\NALICH\nalich.cop
ELSE
	fflag = FCREATE('F:\UCHET\NALICH\nalich.cop')
	= FCLOSE(fflag)
ENDIF
USE IN naltmp
*** Копируем в NALICH
COPY FILE &_f_naltmp TO &_f_nalich
*** Снимаем флаг
DELETE FILE F:\UCHET\NALICH\nalich.cop

***** Формирование справочника собственников для отправки
WAIT 'Подготовка справочника собственников...' WINDOW NOWAIT
IF FILE(gUchBoxSb + 'sobstv.dbf')
	DELETE FILE (gUchBoxSb + 'sobstv.dbf')
ENDIF
SELECT *;
	FROM &_f_sobstv;
	INTO TABLE &_f_tmpsobstv;
	WHERE !DELETED()
COPY TO (gUchBoxSb + 'sobstv.dbf') TYPE FOX2X
USE
***** Формирование справочника вариантов поставки для отправки
WAIT 'Подготовка справочника вариантов поставки...' WINDOW NOWAIT
IF FILE(gUchBoxSb + 'varpost.dbf')
	DELETE FILE (gUchBoxSb + 'varpost.dbf')
ENDIF
SELECT *;
	FROM &_f_varpost;
	INTO TABLE &_f_tmpvarpost;
	WHERE !DELETED()
COPY TO (gUchBoxSb + 'varpost.dbf') TYPE FOX2X
USE

*** Копируем в BOX
WAIT 'Копирование справочников...' WINDOW NOWAIT
IF FILE(gUchBoxSb + 'nalich.dbf')
	DELETE FILE (gUchBoxSb + 'nalich.dbf')
ENDIF
USE IN naltmp1
USE IN prod
USE IN sobstv
USE IN varpost
USE IN saldo
USE IN rez_akt

USE &_f_naltmp
COPY TO (gUchBoxSb + 'nalich.dbf') TYPE FOX2X
USE
USE &_f_naltmp1
COPY TO (gUchBoxSb + 'aktnlch.dbf') TYPE FOX2X

&& End of Nalich

***** Формирование файла оперативных данных для отправки (отгрузка, разнарядка)
DO (gDoVFP + 'operdata.fxp')

**** А вдруг старый файл не передан ?
IF FILE('F:\UCHET\BOX_SBIT\peredach.t-m')
	DO Delete_file
	gInfoStr = [Обнаружен флаг F:\UCHET\BOX_SBIT\peredach.t-m. Пакет не был сформирован.]
	gReturnErr = [Формирование наличия отложено. Идет архивация T-Mail-ом предыдущего пакета]
	DELETE FILE (gPathFlag + 'nalich.run')
	=Wait3Beep(gInfoStr)
	RETURN 1			&&Занят T-Mail-ом(Вернусь через некоторое время...)
ENDIF

m.copy = .F.
**** Выставляем флаг отправки -  [nalich.t-m]
IF FILE('F:\UCHET\BOX_SBIT\nalich.dbf');
      AND FILE('F:\UCHET\BOX_SBIT\sobstv.dbf');
			AND FILE('F:\UCHET\BOX_SBIT\varpost.dbf');
			AND FILE('F:\UCHET\BOX_SBIT\raznar.dbf');
			AND FILE('F:\UCHET\BOX_SBIT\reestr.dbf');
      AND FILE('F:\UCHET\BOX_SBIT\aktnlch.dbf')
	m.copy = .T.
ELSE
	m.copy = .F.
ENDIF
IF m.copy
	IF FILE('F:\UCHET\ADM\nalich.t-m')
		COPY FILE F:\UCHET\ADM\nalich.t-m TO F:\NET\T-MAIL\FLAGS\nalich.t-m
	ELSE
		fflag = FCREATE('F:\NET\T-MAIL\FLAGS\nalich.t-m')
		= FCLOSE(fflag)
	ENDIF
	WAIT ' Файл наличия сформирован.' WINDOW TIMEOUT(2)
ELSE
	gInfoStr = 'Пакет для отправки не сформирован. Не все файлы были сформированы.'
	gReturnErr = 'Ошибка формирования пакета NALICH.'
	DELETE FILE (gPathFlag + 'nalich.run')
	=Wait3Beep(gInfoStr)
ENDIF
DO Delete_file
SELECT (m.alias)
WAIT CLEAR

&& Удаляем флаги
DELETE FILE F:\UCHET\BOX_TOV\rubl.raz
DELETE FILE F:\UCHET\NALICH\nalich.cop
DELETE FILE (gPathFlag + 'nalich.run')
DELETE FILE (gPathFlag + 'nalich.mgr')
RETURN

PROCEDURE RealCen
PARAMETER string
m.barblk = 0
SCAN
  IF real_form='YES'
     = barprcnt(20, string)
  ENDIF
	IF INLIST(var_post,1,11,12,13) AND date_cen < m.datecenlimit
		&& Меням цену только для товара, принятого с НПЗ;
			и только для данных позднее феврал
	 IF !SEEK(kod_npr + STR(kod_post,6) + STR(var_post,2) + DTOS(date_cen),'cen')
		GO RECNO(0) IN cen
		IF !BOF('cen')
			SKIP -1 IN cen
			IF kod_npr = cen.kod_npr AND kod_post = cen.kod_post;
					AND var_post = cen.var_post
				REPLACE date_cen WITH cen.date_dey
			ENDIF
		ENDIF
	 ENDIF
	ENDIF
ENDSCAN
RETURN

PROCEDURE RealCenReestr
SCAN FOR kod_post = 1
	IF !SEEK(kod_npr + STR(kod_post,6) + STR(var_post,2) + DTOS(date_cen),'cen')
		GO RECNO(0) IN cen
		IF !BOF('cen')
			SKIP -1 IN cen
			IF kod_npr = cen.kod_npr AND kod_post = cen.kod_post;
					AND var_post = cen.var_post
				REPLACE RealCen WITH .T.
			ENDIF
		ENDIF
	ELSE
		REPLACE RealCen WITH .T.
	ENDIF
ENDSCAN
RETURN

PROCEDURE Delete_File
DELETE FILE &_f_prihod
DELETE FILE &_f_rashod
IF USED('naltmp')
   USE IN naltmp
ENDIF
DELETE FILE &_f_naltmp
IF USED('naltmp1')
   USE IN naltmp1
ENDIF
DELETE FILE &_f_naltmp1
DELETE FILE &_f_prih
DELETE FILE &_f_rash
DELETE FILE &_f_rash_a
DELETE FILE &_f_rasho1
DELETE FILE &_f_rasho2
DELETE FILE &_f_rasho3
*DELETE FILE &_f_tmpraznar
*DELETE FILE (gPathTemp + 'reestr.dbf')
DELETE FILE &_f_tmpsobstv
DELETE FILE &_f_tmpvarpost
DELETE FILE &_f_tmpprih
DELETE FILE &_f_tmprash
DELETE FILE &_f_tmpakt

RETURN

PROC privod
PARA bilo,stalo
IF kod_otv=4
   IF date>m._end
      REPL date WITH m.curdate,dokum WITH .T.
   ELSE
      REPL date WITH m._end,dokum WITH .T.
   ENDIF
ENDIF
IF kod_sobs=32 AND INLIST(var_post,11,14) AND (rashod<>0 OR prihod<>0)
   stalo=IIF(var_post=11,12,13)
   IF rashod<>0
      SCATTER MEMVAR
      REPL prihod WITH rashod, prihod0 WITH rashod0,saldo_n WITH 0
      APPE BLANK
      GATH MEMVAR
      REPL prihod WITH -1*rashod, prihod0 WITH -1*rashod0
      REPL rashod WITH 0, rashod0 WITH 0,var_post WITH stalo
   ELSE
      REPL var_post WITH stalo
   ENDIF
ENDIF
RETURN

PROC priv_cen
IF kod_sobs=32 AND INLIST(var_post,11,12,14)
   REPL date_cen WITH date-DAY(date)+1
ENDIF
RETURN
