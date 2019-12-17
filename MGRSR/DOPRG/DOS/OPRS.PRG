*
* Сообщение OPRS
* Оперативные сведения о приемке и реализации
*
PARA data  && Дата отчета
IF TYPE('data')#'D'
   data=DATE()
ENDIF

PRIVATE sel,i,d,akt_us,akt_uk,akt_flt,akt_ord,akt_rela,;
        pr_us,pr_uk,pr_flt,pr_ord,;
        prd_us,prd_uk,prd_flt,prd_ord,;
        sob_uk,sob_flt,sob_ord,s_proc,s_safe,s_dele,s_talk;
        d_b,d_breal,d_e, messwait, mas_sobs
DECLARE mas_sobs[2]
mas_sobs[1]=32
mas_sobs[2]=183

*messwait = 'OPRS'
*WAIT CLEAR
*IF _DOS
*   WAIT [ Process...] + CHR(13);
*     +[ Сообщение ] + messwait + [ для УИТиС. ] WINDOW NOWAIT
*ELSE
*   WAIT [ Process...] + CHR(13);
*      +[ ╤ююс∙хэшх ] + messwait + [ фы  ╙╚╥ш╤. ] WINDOW NOWAIT
*ENDIF
tf=.T.
sel=SELECT()
IF TYPE('_g_path_tmp')#'C'
   _g_path_tmp = 'C:\TMP\'
ENDIF
IF TYPE('_g_path_prg')#'C'
   _g_path_prg = 'F:\DBA\KODOGRAM\PRG\'
ENDIF
IF TYPE('_g_path_rep')#'C'
   _g_path_rep = 'F:\DBA\KODOGRAM\REPORT\'
ENDIF
s_proc=SET('PROC')
SET PROC TO (_g_path_prg+'olgalib.prg')
s_safe=SET('SAFE')
SET SAFE OFF
s_dele=SET('DELE')
SET DELE ON
s_talk=SET('TALK')
SET TALK OFF

pr_us=USED('prod')
IF !pr_us
   SELE 0
   USE f:\tov_pr\dbf\prod ALIAS prod AGAIN
ELSE
   SELE prod
   pr_uk=IIF(EOF() OR BOF(),0,RECNO())
   pr_ord=ORDER()
   pr_flt=FILTER()
   SET FILTER TO
ENDIF
SET ORDER TO kod

prd_us=USED('produkt')
IF !prd_us
   SELE 0
   USE f:\tov_pr\dbf\produkt ALIAS produkt AGAIN
ELSE
   SELE produkt
   prd_uk=IIF(EOF() OR BOF(),0,RECNO())
   prd_ord=ORDER()
   prd_flt=FILTER()
   SET FILTER TO
ENDIF
SET ORDER TO kod

akt_us=USED('akts')
IF !akt_us
   SELE 0
   USE f:\uchet\dbf\akts ALIAS akts AGAIN
ELSE
   SELE akts
   akt_uk=IIF(EOF() OR BOF(),0,RECNO())
   akt_ord=ORDER()
   akt_rela=SET('RELA')
   akt_flt=FILTER()
   SET ORDER TO
ENDIF
IF !USED('modidata')
   USE f:\uchet\dbf\modidata IN 0 ORDER TAG kod
ENDIF

d_ereal=data
d_e=d_ereal-1
d_b=d_ereal-DAY(d_ereal)+1
d_breal=d_b
d=SUBSTR(DBF(),1,3)+'UCHET\saldomth\'
CREATE TABLE (_g_path_tmp+'rezult') (kod_npr C(5), psevdo C(6), typnp N(1,0),;
   npp N(3,0),kn_p C(6),kn_p1 C(6),;
   naim_pr C(20), ostn N(10,3), osts N(10,3), otvn N(10,3), otvs N(10,3),;
   svem_npz N(10,3), svem_nb N(10,3), prin N(10,3), otgr N(10,3))
INDEX ON kod_npr TAG kod_npr
rezult=SUBSTR(DTOS(d_ereal),7,2)+SUBSTR(DTOS(d_ereal),5,2)+'$r11'

IF USED('sldzapr')
   SELE sldzapr
ELSE
   SELE 0
ENDIF
USE (d+'prtsld-m.dbf') ALIAS sldzapr AGAIN
i=d_e-DAY(d_e)
LOCA FOR date_end=i
DO WHILE !FOUND() AND d_e-i<180
   i=i-DAY(i)
   LOCA FOR date_end=i
ENDDO
IF FOUND()
   d_b=i+1
   d=d+ALLTRIM(name_saldo)
   USE
   SELE 0
   USE &d ALIAS sldzapr AGAIN
   SCAN FOR ASCAN(mas_sobs,kod_sobs)>0
        IF !SEEK(kod_npr,'rezult')
           SELE rezult
           APPE BLANK
           REPL kod_npr WITH sldzapr.kod_npr
           SELE sldzapr
        ENDIF
        REPL rezult.otvn WITH rezult.otvn+saldo_n
   ENDSCAN
   USE IN sldzapr
   SELE akts
   SCAN FOR BETWEEN(date_akt,d_b,d_ereal) AND ASCAN(mas_sobs,kod_sobs)>0 AND ;
     (vid_akt=3 AND !INLIST(flag_op,1,5) AND kod_sobs=32 OR vid_akt<>3 OR kod_sobs<>32);
            AND dokum;
            AND (oprhran(kod_prin) OR oprhran(kod_sdal));
            AND !INLIST(flag_op,6,10,14)
        IF !SEEK(kod_npr,'rezult')
           SELE rezult
           APPE BLANK
           REPL kod_npr WITH akts.kod_npr
           SELE akts
        ENDIF
        i=IIF(oprhran(kod_prin),kol_akt,kol_akt*(-1))
        IF date_akt<d_ereal                        && Остатки на начало
           IF date_akt<d_breal
              REPL rezult.otvn WITH rezult.otvn+i  && месяца
           ELSE
              REPL rezult.otvs WITH rezult.otvs+i  && суток
           ENDIF
        ENDIF
   ENDSCAN
   SELE rezult
   REPL ALL otvs WITH otvs+otvn

                              && Принято
   fl_fakt='f:\uchet\arhiv\priem_ar.dbf'
   IF FILE(fl_fakt) AND analizfg('F:\UCHET\NALICH\PRIEM_AR.NOT',60)
      USE &fl_fakt IN 0 ALIAS oprsfakt ORDER TAG data AGAIN
      SELE oprsfakt
      SET FILTER TO BETWEEN(data,d_breal,d_ereal)
      GO BOTTOM
      IF !EOF() AND !BOF()
         PRIVATE d_fakt
         d_fakt=data
         SELECT kod_npr,fakt FROM oprsfakt INTO TABLE (_g_path_tmp+'nal');
            WHERE data=d_fakt AND !EMPTY(fakt)
         USE IN oprsfakt
         SCAN
            IF !SEEK(kod_npr,'rezult')
               SELE rezult
               APPE BLANK
               REPL kod_npr WITH nal.kod_npr
               SELE nal
            ENDIF
            REPL rezult.prin WITH rezult.prin+fakt
         ENDSCAN
         USE IN nal
         DELE FILE (_g_path_tmp+'nal.dbf')
      ENDIF
      IF USED('oprsfakt')
         USE IN oprsfakt
      ENDIF
   ENDIF

                              && Отгружено
   fl_otgr='f:\otgr\opertto\'+STR(YEAR(d_breal),4)
   fl_otgr=fl_otgr+IIF(MONTH(d_breal)<10,'0','')+ALLTRIM(STR(MONTH(d_breal)))+'.dbf'
   IF FILE(fl_otgr) AND analizfg('F:\OTGR\OPEROTG\OPEROTG.COP',60)
      PRIVATE _flcreate,dekada1,dekada2,dekada3,dekada
      STORE 0 TO dekada1,dekada2,dekada3,dekada
      DO oprdek WITH d_ereal
      DO CASE
         CASE DAY(d_ereal)<dekada1
              dekada=d_ereal-DAY(d_ereal)
         CASE DAY(d_ereal)<dekada2
              dekada=d_ereal-DAY(d_ereal)+dekada1
         CASE DAY(d_ereal)<dekada3
              dekada=d_ereal-DAY(d_ereal)+dekada2
         OTHERWISE
              dekada=d_ereal
      ENDCASE
      _flcreate=FCREATE('F:\OTGR\OPEROTG\OPEROTG.NOT')
      USE &fl_otgr IN 0 ALIAS oprsree AGAIN

      SELECT oprsree.kod_npr,SUM(oprsree.ves) AS ves,;
             IIF(modidata.dnakl_in<=dekada,.T.,.F.) AS tekdek;
         FROM oprsree,modidata ;
         WHERE BETWEEN(modidata.dnakl_in,d_breal,d_ereal) ;
               AND oprsree.dav#'ОТВ';
               AND (!INLIST(oprsree.tip_otgr,2,6) OR oprsree.rodv=0);
               AND oprsree.res_akt=modidata.kod AND !EMPTY(modidata.kod);
      UNION;
      SELECT oprsree.kod_npr,SUM(oprsree.ves) AS ves,;
             IIF(oprsree.date_otgr<=dekada,.T.,.F.) AS tekdek;
         FROM oprsree;
         WHERE BETWEEN(oprsree.date_otgr,d_breal,d_ereal) ;
               AND oprsree.dav#'ОТВ';
               AND (!INLIST(oprsree.tip_otgr,2,6) OR oprsree.rodv=0);
               AND oprsree.res_akt ;
                   NOT IN (SELECT kod FROM modidata WHERE !EMPTY(kod));
         GROUP BY kod_npr,tekdek;
         INTO TABLE (_g_path_tmp+'nal')
      IF USED('oprsree')
         USE IN oprsree
      ENDIF
      =FCLOSE(_flcreate)
      DELE FILE F:\OTGR\OPEROTG\OPEROTG.NOT
      IF dekada<d_ereal
         SET RELA TO kod_npr INTO prod
         DELE ALL FOR !tekdek AND prod.typnp=4
         SET RELA TO
      ENDIF
      SCAN
         IF !SEEK(kod_npr,'rezult')
            SELE rezult
            APPE BLANK
            REPL kod_npr WITH nal.kod_npr
            SELE nal
         ENDIF
         REPL rezult.otgr WITH rezult.otgr+ves
      ENDSCAN
      USE IN nal
      DELE FILE (_g_path_tmp+'nal.dbf')
   ENDIF

   SELE rezult
   SET RELA TO kod_npr INTO prod
   REPL ALL kn_p WITH prod.psevdo,kn_p1 WITH prod.psevdo1
   SET RELA TO
   IF FILE('f:\uchet\arhiv\reznal.dbf') AND FILE('f:\uchet\arhiv\rezervua.dbf')
      IF USED('reznal')
         USE IN reznal
      ENDIF
      USE f:\uchet\arhiv\reznal.dbf IN 0 ORDER TAG datvrmes ALIAS reznal AGAIN
      IF USED('rez')
         USE IN rez
      ENDIF
      USE f:\uchet\arhiv\rezervua.dbf IN 0 ALIAS rez AGAIN ORDER TAG kod

                      && Свободная емкость ПТХН и НПЗ и остатки на нач.сут.
                                            && и месяца
      FOR j=1 TO 2    && 1-остатки на нач.мес.  2-св.емк. и ост.на нач.сут.
         _d=IIF(j=1,'d_breal','d_ereal')
         SELECT data,vrema,mesto FROM reznal INTO CURSOR curnal ;
            WHERE data=&_d GROUP BY data,vrema,mesto
         FOR i=1 TO 2             && 1-ПТХН  2-Завод
            _p=IIF(i=1,'Н','З')
            _sv=IIF(i=1,'svem_nb','svem_npz')
            SELE curnal
            LOCA FOR vrema=8 AND mesto=_p
            IF !FOUND()
               LOCA FOR vrema=18 AND mesto=_p
            ENDIF
            IF FOUND()
               _data=data
               _vrema=vrema
            ELSE
               SELE reznal
               SET FILTER TO mesto=_p AND data<&_d
               GO BOTTOM
               _data=data
               _vrema=vrema
            ENDIF
            IF !EMPTY(_data) AND !EMPTY(_vrema)
               SELECT kn_p,kod_rez,kol,pr,000000 AS svem,prim1+prim2 AS prim;
                  FROM reznal INTO TABLE (_g_path_tmp+'nal');
                  WHERE data=_data AND vrema=_vrema AND mesto=_p AND pr<3;
                        AND !EMPTY(kn_p)
               SET RELA TO kod_rez INTO rez
               IF j=2
                  REPL ALL svem WITH rez.maxvm-kol
                  REPL ALL FOR svem<rez.prsvem svem WITH 0
               ENDIF
               REPL ALL FOR pr<>1 kol WITH 0
               IF i=2
                  REPL ALL FOR !EMPTY(kod_rez) AND AT('п',prim)=0 kol WITH 0
               ELSE
                  REPL ALL FOR !EMPTY(kod_rez) AND AT('анализ',prim)>0 kol WITH 0
               ENDIF
               REPL ALL kol WITH MAX(0,kol-rez.most)    && Остаток на нач.
               SET RELA TO
               IF j=2
                  DELE ALL FOR EMPTY(svem) AND EMPTY(kol)
               ELSE
                  DELE ALL FOR EMPTY(kol)
               ENDIF
               SELECT kn_p,hr*(-1) AS kol;
                  FROM reznal INTO TABLE (_g_path_tmp+'nal1');
                  WHERE data=_data AND vrema=_vrema AND mesto=_p AND hr>0;
                        AND !EMPTY(kn_p)
               SELE nal
               APPE FROM (_g_path_tmp+'nal1')
               SELECT kn_p,SUM(kol) AS kol,SUM(svem) AS svem;
                  FROM nal INTO TABLE (_g_path_tmp+'nal1') GROUP BY kn_p
               REPL ALL FOR kol<0 kol WITH 0
               SCAN
                  SELE rezult
                  LOCA FOR kn_p=nal1.kn_p
                  IF !FOUND()
                     LOCA FOR kn_p1=nal1.kn_p
                  ENDIF
                  IF !FOUND()
                     APPE BLANK
                     REPL kn_p WITH nal1.kn_p
                     SELE prod
                     LOCA FOR psevdo=nal1.kn_p
                     IF !FOUND()
                        LOCA FOR psevdo1=nal1.kn_p
                     ENDIF
                     IF !FOUND()
                        SELE produkt
                        LOCA FOR kod_pr=nal1.kn_p
                        REPL rezult.naim_pr WITH produkt.naim_pr,;
                             rezult.typnp   WITH produkt.typnp,;
                             rezult.npp     WITH produkt.npp_sh
                     ELSE
                        REPL rezult.kod_npr WITH prod.kod
                     ENDIF
                     SELE rezult
                  ENDIF
                  IF j=2
                     REPL &_sv WITH &_sv+nal1.svem,osts WITH osts+nal1.kol
                  ELSE
                     REPL ostn WITH ostn+nal1.kol
                  ENDIF
                  SELE nal1
               ENDSCAN
            ENDIF
         NEXT
      NEXT
      IF USED('curnal')
         USE IN curnal
      ENDIF
      IF USED('nal')
         USE IN nal
      ENDIF
      DELE FILE (_g_path_tmp+'nal.dbf')
      IF USED('nal1')
         USE IN nal1
      ENDIF
      DELE FILE (_g_path_tmp+'nal1.dbf')
      DELE FILE (_g_path_tmp+'nal1.cdx')
      USE IN reznal
      USE IN rez

      SELE rezult
      SET RELA TO kod_npr INTO prod
      REPL ALL FOR !EMPTY(kod_npr) typnp WITH prod.typnp,npp WITH prod.npp,;
         naim_pr WITH prod.naim_pr
      SET RELA TO
      DELE TAG kod_npr
      REPL ALL ostn WITH INT(0.5+ostn),osts WITH INT(0.5+osts),;
               otvn WITH INT(0.5+otvn),otvs WITH INT(0.5+otvs),;
               svem_nb WITH INT(0.5+svem_nb),svem_npz WITH INT(0.5+svem_npz),;
               prin WITH INT(0.5+prin),otgr WITH INT(0.5+otgr)
      REPL ALL FOR ostn<100 ostn WITH 0
      REPL ALL FOR osts<100 osts WITH 0
      REPL ALL FOR otvn<0 otvn WITH 0
      REPL ALL FOR otvs<0 otvs WITH 0
      DELE ALL FOR ostn=0 AND osts=0 AND otvn=0 AND otvs=0 AND svem_nb=0;
         AND svem_npz=0 AND prin=0 AND otgr=0
      INDEX ON STR(typnp)+STR(npp) TAG typ_npp
      SET CONSOL OFF
      REPO FORM (_g_path_rep+'oprs' ) TO FILE (_g_path_tmp+'oprs.txt')
      REPO FORM (_g_path_rep+'oprs1') TO FILE (_g_path_tmp+'oprs.vtu') && С итоговыми суммами для проверки
      SET CONSOL ON
      DELE TAG typ_npp
      _d=DBF()
      USE
      DELE FILE (_d)
   ENDIF
   IF TYPE('m.gBoxEvotch')='C'
      COPY FILE (_g_path_tmp + rezult + '.txt') TO (m.gBoxEvotch + rezult+'.txt')
      m.name_rezult=SUBSTR(rezult,1,LEN(rezult)-4)
      gotovo = 'Готово !'    &&' Смотрите '+_g_path_tmp + rezult + '.txt'
   ELSE
      IF TYPE('_g_path_current')#'C'
         _g_path_current='F:\DBA\KODOGRAM\CURRENT\'
      ENDIF
      COPY FILE (_g_path_tmp + 'oprs.txt') TO (_g_path_current + rezult+'.txt')
      COPY FILE (_g_path_tmp + 'oprs.vtu') TO (_g_path_current + rezult+'.vtu')
      _g_namekod=rezult
      IF _DOS
         gotovo = 'Готово ! Смотрите '+_g_path_current + rezult + '.vtu'
      ELSE
         gotovo = '├юЄютю ! ╤ьюЄЁшЄх '+_g_path_current + rezult + '.vtu'
      ENDIF
   ENDIF
   DELE FILE (_g_path_tmp + rezult+'.txt')
   DELE FILE (_g_path_tmp + 'oprs.txt')
ELSE
   USE
   d_b=CTOD(' ')
   tf=.F.
   WAIT CLEAR
   IF _DOS
      WAIT 'Сальдо на '+DTOC(d_e-DAY(d_e)+1)+' г. отсутствует !' + CHR(13)+;
           '  Нажмите любую клавишу, чтобы продолжить.' WIND
   ELSE
      WAIT '╤ры№фю эр '+DTOC(d_e-DAY(d_e)+1)+' у. юЄёєЄёЄтєхЄ !' + CHR(13)+;
           '  ═рцьшЄх ы■сє■ ъыртш°є, ўЄюс√ яЁюфюыцшЄ№.' WIND
   ENDIF
   _g_namekod=''
ENDIF
WAIT CLEAR

IF !akt_us
   USE IN akts
ELSE
   SELE akts
   IF FILTER()#akt_flt
      SET FILTER TO &akt_flt
   ENDIF
   IF ORDER()#akt_ord
      SET ORDER TO &akt_ord
   ENDIF
   SET RELA TO &akt_rela
   IF akt_uk>0
      GO akt_uk
   ENDIF
ENDIF

IF !pr_us
   USE IN prod
ELSE
   SELE prod
   IF FILTER()#pr_flt
      SET FILTER TO &pr_flt
   ENDIF
   IF ORDER()#pr_ord
      SET ORDER TO &pr_ord
   ENDIF
   IF pr_uk>0
      GO pr_uk
   ENDIF
ENDIF

IF !prd_us
   USE IN produkt
ELSE
   SELE produkt
   IF FILTER()#prd_flt
      SET FILTER TO &prd_flt
   ENDIF
   IF ORDER()#prd_ord
      SET ORDER TO &prd_ord
   ENDIF
   IF prd_uk>0
      GO prd_uk
   ENDIF
ENDIF
USE IN modidata

SET PROC TO &s_proc
SET SAFE &s_safe
SET DELE &s_dele
SET TALK &s_talk
SELE (sel)
RETURN
