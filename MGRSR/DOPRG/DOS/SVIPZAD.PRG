PARAMETERS datesv

PRIVATE stor_sele
stor_sele=SELECT()

SET DATE TO GERMAN
SET EXCLUSIVE OFF
SET DELETE ON
SET SAFETY OFF

WAIT 'Справка о выполнении задания:'+CHR(13)+;
     'Подготовка данных' WINDOW NOWAIT

DIMENSION mas_month(12)
mas_month(1)='января'
mas_month(2)='февраля'
mas_month(3)='марта'
mas_month(4)='апреля'
mas_month(5)='мая'
mas_month(6)='июня'
mas_month(7)='июля'
mas_month(8)='августа'
mas_month(9)='сентября'
mas_month(10)='октября'
mas_month(11)='ноября'
mas_month(12)='декабря'

IF EMPTY(datesv)
  DateSv=DATE()
*  DateSv={03.03.99}
ENDIF

Root='F:\'
PathDbf=root+'TOV_PR\DBF\'
TovPrDbf=root+'TOV_PR\DBF\'
PathArh=root+'TOV_PR\ARHIV\'
KodogrArh=root+'DBA\KODOGRAM\DATA\'
PathKg=root+'DBA\KODOGRAM\ARH\'    && архив кодограмм
BoxOut=root+'SVODKA\REES_ZAD\BOX_OUT\'  && бокс отправки сводки
PathTmp='C:\TMP\'

FileBlank=PathDbf+'SVipZan.xls'  && бланк справки
FileResult=PathTmp+'planfakt.xls' && результат справки
FileFlag=root+'\net\t-mail\flags\nb_rees.t-m'  && флаг пересылки

IF !FILE(FileFlag)  && флаг t-mail'у для пересылки
  DELETE FILE (FileFlag)
ENDIF
susp
DateBeg=CTOD('01.'+STR(MONTH(datesv),2)+'.'+STR(YEAR(datesv),4))
DateBeg={29.07.99}
DateSv={30.07.99}

*Формирование планов 
SELECT date_beg, date_end, kod_sgr, kod_spg, kod_rzd, kod_prz, kod_grp, kod_pgr, kod_pos, ;
    naim_p, kod_npr, 000000 AS kod_plat, SPACE(10) AS n_dog, ;
    SUM(zad_sut) AS u_tonn, 000000000.000 AS tonn, 000000000.000 AS sum_ves ;
  FROM (PathDbf+'SM_MPLAN');
  WHERE !EMPTY(zad_sut);
    AND BETWEEN(date_beg,DateBeg,DateSv);
  GROUP BY date_beg, kod_npr, kod_sgr, kod_spg, kod_rzd, kod_prz, kod_grp, kod_pgr, kod_pos;
  INTO TABLE (PathTmp+'PLANREES')

USE (PathArh+'RAZNAR') IN 0 NOUPDATE ORDER kod_plan
SELECT planrees
SET RELATION TO STR(kod_sgr,3)+STR(kod_spg,3)+STR(kod_rzd,3)+STR(kod_prz,3)+;
                STR(kod_grp,3)+STR(kod_pgr,3)+STR(kod_pos,1) INTO raznar

REPLACE tonn     WITH u_tonn,;
        kod_plat WITH raznar.kod_plat,;
        n_dog    WITH raznar.n_dog ALL

USE IN SM_MPLAN
USE IN RAZNAR

*Формирование отгрузок
*архив отгрузок
SELECT nom_zd,kod_plat,n_dog,num_cist,prod.kod_gru AS kod_npr,ves,date_beg,kod_sgr, kod_spg, kod_rzd, kod_prz, kod_grp, kod_pgr, kod_pos ;
  FROM (PathArh+'REESTR'), f:\tov_pr\dbf\prod;
  WHERE kod_npr = prod.kod and;
  BETWEEN(date_beg,DateBeg,DateSv);
    AND !DELETE();
    AND error=0;
UNION ALL ;
SELECT nom_zd,kod_plat,n_dog,num_cist,prod.kod_gru AS kod_npr,ves,date_beg,kod_sgr, kod_spg, kod_rzd, kod_prz, kod_grp, kod_pgr, kod_pos ;
  FROM (TovPrDbf+'REESTR_D'), f:\tov_pr\dbf\prod;
  WHERE kod_npr = prod.kod and !arh AND BETWEEN(date_beg,DateBeg,DateSv);
    AND !DELETE();
    AND error=0;
  INTO CURSOR sum_rees

SELECT date_beg, prod.kod_gru AS kod_npr, kod_plat, n_dog, kod_sgr, kod_spg, kod_rzd, kod_prz, kod_grp,;
       kod_pgr, kod_pos, SUM(ves) AS sum_ves;
  FROM sum_rees, (TovPrDbf+'PROD') ;
  WHERE sum_rees.kod_npr = prod.kod;
  GROUP BY date_beg, 2, kod_plat, n_dog, kod_sgr, kod_spg, kod_rzd, kod_prz, kod_grp, kod_pgr, kod_pos ;
  INTO TABLE c:\tmp\sumrees

USE IN prod
USE IN sum_rees  
USE IN reestr
USE IN reestr_d

SELECT planrees

IF !USED('PROD')
  USE (TovPrDbf+'PROD') ORDER kod IN 0
ELSE
  SELECT prod
  SET ORDER TO kod
ENDIF

IF !USED('PREDPR')
  USE (TovPrDbf+'PREDPR') ORDER kod IN 0
ELSE
  SELECT prod
  SET ORDER TO kod
ENDIF


IF !USED('FOR_O')
  USE (TovPrDbf+'FOR_O') ORDER kod_k IN 0
ELSE
  SELECT for_o
  SET ORDER TO kod_k
ENDIF

SELECT planrees
SET RELATION TO kod_npr INTO prod, kod_pos INTO for_o
INDEX ON DTOS(date_beg) + kod_npr + STR(kod_sgr,3) + STR(kod_spg,3) + ;
         STR(kod_rzd,3) + STR(kod_prz,3) + ;
         STR(kod_grp,3) + STR(kod_pgr,3) + STR(kod_pos,1) TO (PathTmp+'PLANREES') addi

SELECT sumrees

SET RELATION TO kod_plat INTO predpr ADDI
INDEX ON DTOS(date_beg) + kod_npr + N_DOG +STR(kod_sgr,3) + STR(kod_spg,3) + ;
         STR(kod_rzd,3) + STR(kod_prz,3) + ;
         STR(kod_grp,3) + STR(kod_pgr,3) + STR(kod_pos,1) TO (PathTmp+'SUMREES')

SELECT planrees

PRIVATE kol_rec && количество строк в отчёте
COUNT TO kol_rec

PRIVATE i, displ, CountCells, TablCells, SumDate,SumAll
PRIVATE stDate, stKod_Npr, stNaim_p, stN_dog, stProdukt
PRIVATE logDate, logKod_Npr, logKod_plat, logN_dog

displ=8  && смещение
TablCells=1 && количество строк в таблице продукта
DIMENSION SumDate(3), SumAll(3)  && сохраняем ячейки для общей суммы ( "ВСЕГО :")

SumDate(1)=''
SumDate(2)=''
SumDate(3)=''

SumAll(1)=''
SumAll(2)=''
SumAll(3)=''

SumProdOtgr=''

GO TOP
logDate=.F.
logKod_Npr=.F.
logKod_plat=.F.
logN_dog=.F.

WAIT 'Справка о выполнении задания.'+CHR(13)+;
     'Формирование результирующего файла.' WINDOW NOWAIT

WITH CREATEOBJECT('Excel.Application') &&инициализация Excel
  
  .Workbooks.Open(FileBlank)
  IF FILE(PathTmp+'TmpSpr.xls')
    DELETE FILE(PathTmp+'TmpSpr.xls')
  ENDIF
  .ActiveWorkbook.SaveAs(PathTmp+'TmpSpr.xls')
*  .Visible=.T.
  .Cells(3,1).Value='по состоянию на 15ч. " '+TRANSFORM(DAY(DATE()),'@Z 99')+' " '+;
    mas_month(month(DATE()))+' '+STR(YEAR(DATE()),4)+' года'  && заголовок (на дату)

IF kol_rec#0

  FOR i=1 TO kol_rec
    stDate=planrees.date_beg
    stKod_Npr=planrees.kod_npr
    stNaim_p=ALLTRIM(planrees.Naim_p)
    stN_dog=sumrees.n_dog
    stProdukt=prod.naim_pr
    stKodPlat=sumrees.kod_plat
    IF !logDate                                  &&дата реестра
      WAIT 'Справка о выполнении задания.'+CHR(13)+;
           'Формирование результирующего файла: '+DTOC(date_beg);
           WINDOW NOWAIT
      logDate=.F.
      logKod_Npr=.F.
      logNaim_p=.F.
      logKod_plat=.F.
      logN_dog=.F.
      logKodPlat=.F.

      IF i#1 && итого по дате
        displ=displ+1
        .Range(.Cells(displ+i-1,1),.Cells(displ+i-1,8)).Select
        .RUN("TmpSpr.xls!BordersTabl1")
        displ=displ+1
        .Range(.Cells(displ+i-1,1),.Cells(displ+i-1,8)).Select
        .RUN("TmpSpr.xls!BordersTabl1")
        SKIP -1
        DO ItogDate WITH planrees.date_beg, planrees.date_end
        SKIP
        displ=displ+1
      ENDIF

      WITH .Cells(displ+i,1) &&за дату
        .Font.Italic = .T.
        .Font.Bold = .T.
        SELECT planrees
        IF date_beg = date_end
          .Value=TRANSFORM(DAY(date_beg),'@Z 99')+' '+;
             mas_month(month(date_beg))+' '+STR(YEAR(date_beg),4)+' г.'
        ELSE
          .Value=TRANSFORM(DAY(date_beg),'@Z 99')+ ' - ' + ;
             TRANSFORM(DAY(date_end),'@Z 99') + ' ' + ;
             mas_month(month(date_beg)) + ' ' + STR(YEAR(date_beg),4) + ' г.'
        ENDIF
        SELECT sumrees
        .HorizontalAlignment = 3
      ENDWITH
      
      displ=displ+1
      .Range(.Cells(displ+i-1,1),.Cells(displ+i-1,8)).Select
      .RUN("TmpSpr.xls!BordersTabl1")
      displ=displ+1
      .Range(.Cells(displ+i-1,1),.Cells(displ+i-1,8)).Select
      .RUN("TmpSpr.xls!BordersTabl1")

      TablCells=TablCells+2
    ENDIF

    IF !logNaim_p                                 &&позиция плана
      .Cells(displ+i,1).Font.Size=7
      .Cells(displ+i,1).Font.Bold=.T.
      .Cells(displ+i,1).Value=ALLTRIM( planrees.naim_p ) + ' ' + ALLTRIM( for_o.naim_k )
      .Cells(displ+i,2).Font.Size=7
      .Cells(displ+i,2).HorizontalAlignment = 3
      .Cells(displ+i,2).Value=for_o.naim_k
      .Cells(displ+i,5).Font.Bold=.T.
      .Cells(displ+i,5).Font.Size=7
      .Cells(displ+i,5).Value=planrees.u_tonn     &&план
*      .Cells(displ+i,9).Value=1   
      .Cells(displ+i,7).Font.Bold=.T.
      .Cells(displ+i,7).Font.Size=7
      .Cells(displ+i,7).FormulaR1C1 = '=IF(RC[-2]-RC[-1]>0,RC[-2]-RC[-1]," ")' &&не исполнено
*ЗАПОМНИМ ПОЗИЦИЮ ПЛАНА
       m.plan_pos=displ+i      
    ENDIF
    IF !logKod_Npr                               &&продукт
      .Cells(displ+i,4).Font.Bold=.T.
      .Cells(displ+i,4).Font.Size=8
      .Cells(displ+i,4).Value=prod.naim_pr
      CountCells=1
    ENDIF

    SELECT sumrees
    KolSells=0
    SCAN FOR date_beg = planrees.date_beg ;
         AND kod_sgr  = planrees.kod_sgr  ;
         AND kod_spg  = planrees.kod_spg  ;
         AND kod_rzd  = planrees.kod_rzd  ;
         AND kod_prz  = planrees.kod_prz  ;
         AND kod_grp  = planrees.kod_grp  ;
         AND kod_pgr  = planrees.kod_pgr  ;
         AND kod_pos  = planrees.kod_pos  ;
         AND kod_npr  = planrees.kod_npr
      displ=displ+1
      IF !logKod_plat                               &&плательщик
        .Cells(displ+i,1).Font.Size=5
        .Cells(displ+i,1).Value=ALLTRIM( predpr.naim )
      ENDIF

      IF !logN_dog                                 &&договор
        WITH .Cells(displ+i,3)
          .Font.Size=7
          .Value=sumrees.n_dog
          .HorizontalAlignment = 3
        ENDWITH
      ENDIF
  
      .Cells(displ+i,6).Font.Size=6
      .Cells(displ+i,6).Value=sumrees.sum_ves              &&факт. отгрузка
      .Range(.Cells(displ+i-1,1),.Cells(displ+i-1,8)).Select
      .RUN("TmpSpr.xls!BordersTabl3")
      CountCells=CountCells+1  &&количество строк по продукту
      TablCells=TablCells+1
      KolSells=KolSells+1
      
      SumProdOtgr=SumProdOtgr+'+F'+LTRIM(STR(plan_pos))

    ENDSCAN
    SELECT planrees
    
    IF KolSells#0
       WITH .Cells(plan_pos,6)
         .Font.Bold=.T.
         .Font.Size=7
         .FormulaR1C1 = '=SUM(R[1]C:R[' + LTRIM(STR(KolSells)) + ']C)'
       ENDWITH
      .Range(.Cells(displ+i,1),.Cells(displ+i,8)).Select
      .RUN("TmpSpr.xls!BordersTabl1")
    ELSE
      .Range(.Cells(displ+i,1),.Cells(displ+i,8)).Select
      .RUN("TmpSpr.xls!BordersTabl1")
    ENDIF

    CountCells=CountCells+1  &&количество строк по продукту
    TablCells=TablCells+1
*    displ=displ+1

    SKIP
  
    logDate=(stDate=date_beg)
    logKod_Npr=(stKod_Npr=planrees.kod_npr)
*    logNaim_p=(stNaim_p=planrees.naim_p)
*    logKod_plat=(stKodplat=sumrees.Kod_plat)
*    logN_dog=(stN_dog=sumrees.N_dog)


    IF !logKod_Npr
      logKod_Npr=.F.
      logNaim_p=.F.
      logKod_plat=.F.
      logN_dog=.F.

      displ=displ+1

      WITH .Cells(displ+i,1)  && итог по продукту
        .Font.Size=8
        .Font.Bold=.T.
        .Value='ИТОГО: '+stProdukt
      ENDWITH

      WITH .Cells(displ+i,5)  && план
        .Font.Size=7
        .Font.Bold=.T.
        .FormulaR1C1=;
             '=SUM(R[-' + LTRIM(STR(CountCells-1)) + ']C:R[-1]C)'
      ENDWITH

      IF !EMPTY(SumProdOtgr)
        WITH .Cells(displ+i,6)  && фактическая отгрузка
          .Font.Size=7
          .Font.Bold=.T.
          .Formula= '=' + SUBSTR(SumProdOtgr,2)
        ENDWITH
      ENDIF
      SumProdOtgr=''

      WITH .Cells(displ+i,7)  && не исполнено
        .Font.Size=7
        .Font.Bold=.T.
        .FormulaR1C1 = '=IF(RC[-2]-RC[-1]>0,RC[-2]-RC[-1]," ")' &&не исполнено
      ENDWITH

      SumDate(1)=SumDate(1) + '+E' + LTRIM( STR( displ+i ) )
      SumDate(2)=SumDate(2) + '+F' + LTRIM( STR( displ+i ) )
      SumDate(3)=SumDate(3) + '+G' + LTRIM( STR( displ+i ) )

      displ=displ+1

      .Range(.Cells(displ+i-1,1),.Cells(displ+i-1,8)).Select
      .RUN("TmpSpr.xls!BordersTabl2")
      .Range(.Cells(displ+i,1),.Cells(displ+i,8)).Select
      .RUN("TmpSpr.xls!BordersTabl1")
      TablCells=1
    ENDIF

  ENDFOR

  GO BOTTOM
  DO ItogDate WITH planrees.date_beg, planrees.date_end
  displ=displ+1
  
  WITH .Cells(displ+i,1)
    .Font.Size=8
    .Font.Bold=.T.
    .Value='ВСЕГО: '
  ENDWITH

  WITH .Cells(displ+i,5)
    .Font.Size=7
    .Font.Bold=.T.
    .Formula= '=' + SUBSTR(SumAll(1),2)
  ENDWITH

  WITH .Cells(displ+i,6)
    .Font.Size=7
    .Font.Bold=.T.
    .Formula= '=' + SUBSTR(SumAll(2),2)
  ENDWITH

  WITH .Cells(displ+i,7)
    .Font.Size=7
    .Font.Bold=.T.
    .FormulaR1C1 = '=IF(RC[-2]-RC[-1]>0,RC[-2]-RC[-1]," ")' &&не исполнено
*    .Formula= '=' + SUBSTR(SumAll(3),2)
  ENDWITH

  .Range(.Cells(displ+i,1),.Cells(displ+i,8)).Select
  .RUN("TmpSpr.xls!BordersTabl2")

*числовое форматирование
  .Range(.Cells(9,4),.Cells(displ+i,8)).Select
  .Selection.NumberFormat = "0.000"

ENDIF
  IF FILE(PathTmp+'TMPREES.XLS')
    DELETE FILE(PathTmp+'TMPREES.XLS')
  ENDIF

  IF FILE(FileResult)
    DELETE FILE(FileResult)
  ENDIF

  .RUN("TmpSpr.xls!SaveRezult")

  IF FILE(PathTmp+'TMPREES.XLS')
    DELETE FILE(PathTmp+'TMPREES.XLS')
  ENDIF

  .Windows("TmpSpr.xls").Activate
  .ActiveWorkbook.Save
  .ActiveWindow.Close
  DELETE FILE(PathTmp+'TmpSpr.xls')
*  .Quit

ENDWITH
WAIT CLEAR

USE IN prod
USE IN for_o
USE IN planrees
DELETE FILE (PathTmp+'PLANREES.IDX')
DELETE FILE (PathTmp+'PLANREES.DBF')

*подготовка файлов к отправке
*поиск приёмки
IF !USED('ARHKG')
  SELECT 0
  USE (KodogrArh+'ARHKG') NOUPDATE
ELSE
  SELECT arhkg
ENDIF
SET FILTER TO kodkg=14 AND date2=DateSv

COUNT TO kol_rec
GO BOTTOM

PRIVATE m.priemka

IF kol_rec>0
  m.priemka=PathKg+arhkg.filename+'.txt'
  IF FILE(m.priemka)
    COPY FILE (m.priemka) TO (BoxOut+arhkg.oldname+'.TXT')
  ENDIF
ENDIF

USE 

COPY FILE (FileResult) TO (BoxOut+TRANSFORM(DAY(DATE()),'@L 99')+;
                           TRANSFORM(MONTH(DATE()),'@L 99')+'2J11.XLS')
=INKEY(5)
DELETE FILE (FileResult)

PRIVATE m.file
IF !FILE(FileFlag)  && флаг t-mail'у для пересылки
*  m.file=FCREATE(FileFlag)
*  =FCLOSE(m.file)
ENDIF

SELECT (stor_sele)
RETURN

*Итоги по дате
PROCEDURE ItogDate
PARAMETERS m.datebeg,m.dateend

WITH .Cells(displ+i,1)
  .Font.Bold = .T.
  IF m.datebeg = m.dateend
    .Value='Итого за '+TRANSFORM(DAY(m.datebeg),'@Z 99')+' '+;
       mas_month(month(m.datebeg))+' '+STR(YEAR(m.datebeg),4)+' г.'
  ELSE
    .Value='Итого за '+TRANSFORM(DAY(m.datebeg),'@Z 99')+ ' - ' + ;
           TRANSFORM(DAY(m.dateend),'@Z 99') + ' ' + ;
           mas_month(month(m.datebeg)) + ' ' + STR(YEAR(m.datebeg),4) + ' г.'
   ENDIF
  .HorizontalAlignment = 3
ENDWITH

WITH .Cells(displ+i,5)  && план
  .Font.Size=7
  .Font.Bold=.T.
  .Formula='=' + SUBSTR(SumDate(1),2)
ENDWITH

WITH .Cells(displ+i,6)  && фактическая отгрузка
  .Font.Size=7
  .Font.Bold=.T.
  .Formula='=' + SUBSTR(SumDate(2),2)
ENDWITH

WITH .Cells(displ+i,7)  && не исполнено
  .Font.Size=7
  .Font.Bold=.T.
  .Formula='=IF(RC[-2]-RC[-1]>0,RC[-2]-RC[-1]," ")'
ENDWITH

SumDate(1)=''
SumDate(2)=''
SumDate(3)=''
        
&&общий итог по отчёту
SumAll(1)=SumAll(1) + '+E' + LTRIM( STR( displ+i ) )
SumAll(2)=SumAll(2) + '+F' + LTRIM( STR( displ+i ) )
SumAll(3)=SumAll(3) + '+G' + LTRIM( STR( displ+i ) )
      
.Range(.Cells(displ+i,1),.Cells(displ+i,8)).Select
.RUN("TmpSpr.xls!BordersTabl2")

displ=displ+1
.Range(.Cells(displ+i,1),.Cells(displ+i,8)).Select
.RUN("TmpSpr.xls!BordersTabl1")

RETURN
