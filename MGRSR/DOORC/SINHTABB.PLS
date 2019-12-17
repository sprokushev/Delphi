PACKAGE BODY sinhtabl IS

-- определение констант
  
-- переменные
  lPathLog    VARCHAR2(10) := 'log\'; -- путь к log-файлу
  log_file    TEXT_IO.FILE_TYPE := NULL ; -- log-файл

  dbf_connid EXEC_SQL.ConnType; -- соединение с dbf
  ora_connid EXEC_SQL.ConnType; -- соединение с Oracle
  dbf_connect NUMBER := 0;

  SinhtablRezim PLS_INTEGER := 0; -- флаг режимов запуска
  -- 0 - общий
  -- 1 - приём разнарядки

PROCEDURE lfraznar (PathDbf IN VARCHAR2 DEFAULT TovPrDbf);
PROCEDURE On_ExecSqlError (ConnId IN EXEC_SQL.ConnType DEFAULT NULL);

PROCEDURE tt IS
BEGIN
	null;
--	sinhid(0, 'RAZNAR_RW', 'ID', 'C:\TOV_PR\ARHIV\RAZNAR', 'ORA_ID');
END;

PROCEDURE Otgr_Gd IS
  dbf_cursor EXEC_SQL.CursType;
  ora_cursor EXEC_SQL.CursType;
  ignore     PLS_INTEGER      ;
  
-- поля для выборки SELECT'а
  kod        VARCHAR2(9);
  ora_id     NUMBER;
  kod_npr    VARCHAR(5);
  transp     VARCHAR(20);
  kol_cist   NUMBER;
  num_cist   NUMBER;
  date_otgr  DATE;
  ves        NUMBER;
  fakt       NUMBER;
  cnt_cist   NUMBER;
  kod_op     NUMBER;
  id_rask    NUMBER;
  date_rask  DATE;
  time_rask  VARCHAR2(8);
  forma      NUMBER;
  tip        VARCHAR2(3);
  vzliv      NUMBER;
  pl         NUMBER;
  xpl        NUMBER;
  wes_ed     NUMBER;
  kol_all    NUMBER;
  tara_all   NUMBER;
  wes        NUMBER;
  osc        NUMBER;
  temper     NUMBER;
  tipv       NUMBER;
  rodv       NUMBER;
  obem       NUMBER;
  reestr     NUMBER;
  num_kvit   NUMBER;
  date_kvit  DATE;
  error      NUMBER;
  gtd        VARCHAR2(20);
  date_real  DATE;
  time_real  VARCHAR2(8);
  mesto      VARCHAR2(1);
  el_p       VARCHAR2(2);
  el_f       VARCHAR2(2);
  date_pr    DATE;
  time_pr    VARCHAR2(8);
  fio_pr     VARCHAR2(15);
  tip_otgr   NUMBER;
  plomba     VARCHAR2(50);
  kodser     VARCHAR2(9);
  kodpasp    VARCHAR2(9);
  exped      NUMBER;
  res_akt    VARCHAR2(9);
  metka      VARCHAR2(18);
  fio_tk     VARCHAR2(15);
  date_tk    DATE;
  time_tk    VARCHAR2(8);
  numkvit    NUMBER;
  ntarif     NUMBER;
  ndop_tarif NUMBER;
  tarif19    NUMBER;
  tarif20    NUMBER;
  num_rees   NUMBER;
  dat_rees   DATE;
  date_beg   DATE;
  date_end   DATE;
  nom_zv     VARCHAR2(12);
  ree_priz   NUMBER;

  CURSOR exists_otgr ( param VARCHAR2 ) IS 
    SELECT id FROM otgr_gd WHERE id_dbf=param;
  lid NUMBER;

  CURSOR exists_otgr_prod ( param VARCHAR2 ) IS 
    SELECT id FROM otgr_gd_prod WHERE otgr_id=param;
  lid_prod NUMBER;
  
  lfasovka NUMBER; -- признак фасованной отгрузки
  lzagsert_id NUMBER; -- код паспорта

BEGIN
--	log_file := TEXT_IO.FOPEN(lPathLog || 'CurOtgr.log','a');
	TEXT_IO.NEW_LINE(log_file);
	TEXT_IO.PUT_LINE(log_file,TO_CHAR(SYSDATE,'DD.MM.IYYY HH24:MI:SS'));
-- ODBC - соединение с таблицами DBF
  dbf_connid := EXEC_SQL.OPEN_CONNECTION('@ODBC:VFP');
  ora_connid := EXEC_SQL.CURR_CONNECTION;
  dbf_connect := 1;
  dbf_cursor := EXEC_SQL.OPEN_CURSOR(dbf_connid);
  ora_cursor := EXEC_SQL.OPEN_CURSOR(ora_connid);
  BEGIN
    EXEC_SQL.PARSE(dbf_connid, dbf_cursor, 
      'SELECT kod,ora_id,kod_npr,transp,kol_cist,num_cist,date_otgr,ves,fakt,cnt_cist,
kod_op,id_rask,date_rask,time_rask,forma,tip,vzliv,pl,xpl,wes_ed,kol_all,tara_all,wes,
osc,temper,tipv,rodv,obem,reestr,num_kvit,date_kvit,error,gtd,date_real,time_real,
mesto,el_p,el_f,date_pr,time_pr,fio_pr,tip_otgr,plomba,kodser,kodpasp,exped,res_akt,
metka,fio_tk,date_tk,time_tk,numkvit,ntarif,ndop_tarif,tarif19,tarif20,num_rees,dat_rees,
date_beg,date_end,nom_zv,ree_priz FROM ' || TovPrDbf || 'reestr_d');
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor,  1, kod, 9);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor,  2, ora_id);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor,  3, kod_npr, 5);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor,  4, transp, 20);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor,  5, kol_cist);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor,  6, num_cist);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor,  7, date_otgr);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor,  8, ves);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor,  9, fakt);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 10, cnt_cist);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 11, kod_op);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 12, id_rask);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 13, date_rask);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 14, time_rask, 8);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 15, forma);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 16, tip, 3);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 17, vzliv);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 18, pl);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 19, xpl);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 20, wes_ed);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 21, kol_all);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 22, tara_all);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 23, wes);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 24, osc);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 25, temper);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 26, tipv);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 27, rodv);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 28, obem);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 29, reestr);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 30, num_kvit);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 31, date_kvit);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 32, error);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 33, gtd, 20);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 34, date_real);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 35, time_real, 8);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 36, mesto, 1);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 37, el_p, 2);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 38, el_f, 2);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 39, date_pr);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 40, time_pr, 8);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 41, fio_pr, 15);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 42, tip_otgr);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 43, plomba, 50);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 44, kodser, 9);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 45, kodpasp, 9);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 46, exped);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 47, res_akt, 9);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 48, metka, 18);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 49, fio_tk, 15);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 50, date_tk);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 51, time_tk, 8);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 52, numkvit);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 53, ntarif);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 54, ndop_tarif);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 55, tarif19);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 56, tarif20);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 57, num_rees);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 58, dat_rees);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 59, date_beg);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 60, date_end);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 61, nom_zv, 12);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 62, ree_priz);
    ignore := EXEC_SQL.EXECUTE(dbf_connid, dbf_cursor);
    WHILE EXEC_SQL.FETCH_ROWS(dbf_connid, dbf_cursor) > 0 LOOP
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor,  1, kod);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor,  2, ora_id);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor,  3, kod_npr);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor,  4, transp);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor,  5, kol_cist);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor,  6, num_cist);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor,  7, date_otgr);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor,  8, ves);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor,  9, fakt);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 10, cnt_cist);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 11, kod_op);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 12, id_rask);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 13, date_rask);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 14, time_rask);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 15, forma);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 16, tip);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 17, vzliv);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 18, pl);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 19, xpl);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 20, wes_ed);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 21, kol_all);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 22, tara_all);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 23, wes);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 24, osc);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 25, temper);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 26, tipv);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 27, rodv);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 28, obem);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 29, reestr);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 30, num_kvit);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 31, date_kvit);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 32, error);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 33, gtd);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 34, date_real);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 35, time_real);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 36, mesto);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 37, el_p);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 38, el_f);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 39, date_pr);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 40, time_pr);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 41, fio_pr);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 42, tip_otgr);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 43, plomba);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 44, kodser);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 45, kodpasp);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 46, exped);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 47, res_akt);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 48, metka);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 49, fio_tk);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 50, date_tk);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 51, time_tk);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 52, numkvit);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 53, ntarif);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 54, ndop_tarif);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 55, tarif19);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 56, tarif20);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 57, num_rees);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 58, dat_rees);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 59, date_beg);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 60, date_end);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 61, nom_zv);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 62, ree_priz);
      IF kodpasp = NULL THEN
      	lzagsert_id := NULL;
      ELSE
 	  	  BEGIN
       		SELECT id INTO lzagsert_id FROM zagsert WHERE id_dbf=kodpasp;
 	  	  EXCEPTION WHEN no_data_found THEN lzagsert_id := NULL;
 	  	  END;
      END IF;
     	SELECT fasovka INTO lfasovka FROM prod WHERE id=kod_npr;
 	    IF lfasovka=0 THEN
        OPEN exists_otgr (kod);    
        FETCH exists_otgr INTO lid;
        IF exists_otgr%FOUND THEN
   	      UPDATE otgr_gd SET num_transp=num_cist,tipv=tipv,date_otgr=date_otgr,
   	        num_kvit=num_kvit,date_kvit=date_kvit,ves=ves,tarif=ntarif,
   	        ident_id0=999, ident_id=999 WHERE id=lid;
   	      UPDATE otgr_gd_prod SET raznar_id=ora_id, zagsert_id=lzagsert_id,
     	      prod_id=kod_npr, ves=ves, fakt=fakt WHERE otgr_id=lid;
     	  ELSE
       	  SELECT otgr_seq.nextval INTO lid FROM DUAL;
       	  INSERT INTO otgr_gd (id,id_dbf,num_transp,tipv,date_otgr,num_kvit,date_kvit,
     	      ves,tarif,ident_id0,ident_id) VALUES (lid,kod,num_cist,tipv,date_otgr,
     	      num_kvit,date_kvit,ves,ntarif,999,999);
   	      INSERT INTO otgr_gd_prod (otgr_id, raznar_id, zagsert_id, prod_id, ves, fakt)
   	        VALUES (lid, ora_id, lzagsert_id, kod_npr, ves, fakt);
   	    END IF;
        CLOSE exists_otgr;
      ELSE
      -- для фасованной продукции
        NULL;
      END IF;
    END LOOP;
    COMMIT;
    check_rec(2,'f:\tov_pr\dbf\reestr_d','kod','otgr_gd','id_dbf');    
    
  EXCEPTION WHEN EXEC_SQL.PACKAGE_ERROR THEN 
    IF EXEC_SQL.LAST_ERROR_CODE(dbf_connid) != 0 THEN
      On_ExecSqlError(dbf_connid);
    END IF;
    IF EXEC_SQL.LAST_ERROR_CODE(ora_connid) != 0 THEN
      On_ExecSqlError(ora_connid);
    END IF;
  END;
  EXEC_SQL.CLOSE_CURSOR(ora_connid, ora_cursor);
  EXEC_SQL.CLOSE_CURSOR(dbf_connid, dbf_cursor);
  EXEC_SQL.CLOSE_CONNECTION(dbf_connid);  -- закрытие соединения
  TEXT_IO.PUT_LINE(log_file,TO_CHAR(SYSDATE,'DD.MM.IYYY HH24:MI:SS'));
  TEXT_IO.FCLOSE(log_file);
END;

PROCEDURE sinhall IS
BEGIN
-- ODBC - соединение с таблицами DBF
  dbf_connid := EXEC_SQL.OPEN_CONNECTION('@ODBC:VFP');
  BEGIN
-- обработка справочников
    dbf_connect := 1;
    region; -- область
    gdor; -- справочник дорог
    stan; -- справочник станций 
    pred_st; -- справочник ж/д кодов получателей
    sobstv; -- справочник собственников
    predpr; -- справочник предприятий
    region; -- справочник областей
    states; -- справочник стран
    vetka; -- справочник веток получателя
    prod_gd_rod; -- справочник родов грузов
    prod; -- нефтепродукт
    lfraznar; -- заявки
    del_razn; -- очистка просроченных заявок
  EXCEPTION WHEN EXEC_SQL.PACKAGE_ERROR THEN 
    IF EXEC_SQL.LAST_ERROR_CODE(dbf_connid) != 0 THEN
      On_ExecSqlError(dbf_connid);
    END IF;
    IF EXEC_SQL.LAST_ERROR_CODE(ora_connid) != 0 THEN
      On_ExecSqlError(ora_connid);
    END IF;
  END;
  EXEC_SQL.CLOSE_CONNECTION(dbf_connid);  -- закрытие соединения
END;

-- синихронизация разнарядки 
PROCEDURE raznar(PathDbf IN VARCHAR2) IS
BEGIN
	SinhtablRezim := 0;
	lfraznar(PathDbf);
END;

--приём разнарядки
PROCEDURE receive_raznar IS
  PathReceive VARCHAR2(30) := 'F:\NST\BOX_TOV\EDAY\';
--  PathReceive VARCHAR2(30) := 'c:\a1\';
  log_file    TEXT_IO.FILE_TYPE := Null; -- log-файл

  dbf_cursor EXEC_SQL.CursType;
  ignore     PLS_INTEGER;
  cnt_razn   NUMBER; -- количество обработанных записей

BEGIN
	log_file := TEXT_IO.FOPEN(lPathLog || 'oprirazn.log','a');
	TEXT_IO.NEW_LINE(log_file);
	TEXT_IO.PUT(log_file,TO_CHAR(SYSDATE,'DD.MM.IYYY HH24:MI:SS'));
	SinhtablRezim := 1;
-- ODBC - соединение с таблицами DBF
  dbf_connid := EXEC_SQL.OPEN_CONNECTION('@ODBC:VFP');
  dbf_connect := 1;
  BEGIN

-- обработка справочников
	  states(PathReceive);    -- справочник стран
	  region(PathReceive);    -- справочник областей
	  gdor(PathReceive);      -- справочник дорог
	  stan(PathReceive);      -- справочник станций
	  predpr(PathReceive);    -- справочник предприятий
	  pred_st(PathReceive);   -- справочник ж/д кодов получателей
--	razn_npo;  -- справочник разнарядок НПО
	  vetka(PathReceive);     -- справочник веток получателя
-- приём разнарядки
	  lfraznar(PathReceive);
	  del_razn;
-- подсчёт обработанных записей
    dbf_cursor := EXEC_SQL.OPEN_CURSOR(dbf_connid);
    EXEC_SQL.PARSE(dbf_connid, dbf_cursor,
      'SELECT COUNT(*) FROM ' || PathReceive || 'raznar');
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 1, cnt_razn);
    ignore := EXEC_SQL.EXECUTE_AND_FETCH(dbf_connid, dbf_cursor);
    EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 1, cnt_razn);
    EXEC_SQL.CLOSE_CURSOR(dbf_connid, dbf_cursor);
	  TEXT_IO.PUT(log_file,' Обработано -' || TO_CHAR(cnt_razn,'999') || ' записей ');

  EXCEPTION WHEN EXEC_SQL.PACKAGE_ERROR THEN 
    IF EXEC_SQL.LAST_ERROR_CODE(dbf_connid) != 0 THEN
      On_ExecSqlError(dbf_connid);
    END IF;
    IF EXEC_SQL.LAST_ERROR_CODE(ora_connid) != 0 THEN
      On_ExecSqlError(ora_connid);
    END IF;
  END;
  EXEC_SQL.CLOSE_CONNECTION(dbf_connid);  -- закрытие соединения
  TEXT_IO.PUT(log_file,TO_CHAR(SYSDATE,'DD.MM.IYYY HH24:MI:SS'));
  TEXT_IO.FCLOSE(log_file);
END;

--синхронизация архива разнарядок
PROCEDURE raznar_rw IS
  PathReceive VARCHAR2(30) := 'F:\TOV_PR\ARHIV\';
BEGIN
-- ODBC - соединение с таблицами DBF
  dbf_connid := EXEC_SQL.OPEN_CONNECTION('@ODBC:VFP');
  BEGIN
	  SET TRANSACTION USE ROLLBACK SEGMENT longrbs;
  	SinhtablRezim := 2;
    dbf_connect := 1;
	  lfraznar(PathReceive);
  EXCEPTION
    WHEN EXEC_SQL.PACKAGE_ERROR THEN
	  TEXT_IO.PUT(log_file,'ERROR (' || 
        TO_CHAR(EXEC_SQL.LAST_ERROR_CODE(dbf_connid)) || ')');
  END;
  EXEC_SQL.CLOSE_CONNECTION(dbf_connid);  -- закрытие соединения
END;

--справочник СТАНЦИИ
PROCEDURE stan (PathDbf IN VARCHAR2) IS

  stan_cursor EXEC_SQL.CursType;
  ignore PLS_INTEGER;

-- переменные выборки таблицы STAN
  kod       NUMBER     ;
  naim      VARCHAR(20);
  kodgd     NUMBER     ;
  rast      NUMBER     ;
  prizn_mps NUMBER     ;
  kobl      NUMBER     ;
  name_obl  VARCHAR(30);
  kstran    NUMBER     ;
  krug      VARCHAR(20);
--переменные конвертирования
  id_stan   CHAR(6)    ;
  ntvk      NUMBER     ;

BEGIN
  TEXT_IO.PUT_LINE('STAN - BEGIN !');
  IF dbf_connect = 0 THEN
    dbf_connid := EXEC_SQL.OPEN_CONNECTION('@ODBC:VFP');
  END IF;
  -- Подготовка курсора для выполения SELECT
  stan_cursor := EXEC_SQL.OPEN_CURSOR(dbf_connid);

  IF SinhtablRezim = 1 THEN
    EXEC_SQL.PARSE(dbf_connid, stan_cursor,
      'SELECT kod, naim, kodgd, rast, kobl, name_obl, kstran, krug
         FROM ' || PathDbf || 'stan');
  ELSE
    EXEC_SQL.PARSE(dbf_connid, stan_cursor,
      'SELECT kod, naim, kodgd, rast, kobl, name_obl, kstran, krug, prizn_mps
         FROM ' || PathDbf || 'stan');
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, stan_cursor, 9, prizn_mps);
  END IF;
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, stan_cursor, 1, kod);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, stan_cursor, 2, naim, 20);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, stan_cursor, 3, kodgd);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, stan_cursor, 4, rast);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, stan_cursor, 5, kobl);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, stan_cursor, 6, name_obl, 30);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, stan_cursor, 7, kstran);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, stan_cursor, 8, krug, 20);
  ignore := EXEC_SQL.EXECUTE(dbf_connid, stan_cursor);

  LOOP
    IF EXEC_SQL.FETCH_ROWS(dbf_connid, stan_cursor) > 0 THEN
      -- get column values the row
      IF SinhtablRezim = 0 THEN
        EXEC_SQL.COLUMN_VALUE(dbf_connid, stan_cursor, 9, prizn_mps);
      END IF;
      EXEC_SQL.COLUMN_VALUE(dbf_connid, stan_cursor, 1, kod);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, stan_cursor, 2, naim);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, stan_cursor, 3, kodgd);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, stan_cursor, 4, rast);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, stan_cursor, 5, kobl);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, stan_cursor, 6, name_obl);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, stan_cursor, 7, kstran);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, stan_cursor, 8, krug);

      id_stan := SUBSTR(TO_CHAR(kod,'000000'),2);
      IF not kod=0 THEN
      	IF SinhtablRezim = 1 THEN
          UPDATE stan SET name = naim, gdor_id = kodgd, rast = rast, kobl = kobl,
             name_obl = name_obl, kstran = kstran, krug = krug
            WHERE id=kod;
          IF sql%notfound THEN
            INSERT INTO stan (id, name, name_s, gdor_id, rast, kobl,
                name_obl, kstran, krug, kod_dbf)
              VALUES (id_stan, naim, SUBSTR(naim,1,15), kodgd, rast, kobl, name_obl,
                kstran, krug, kod);
          END IF;
      	ELSE
          UPDATE stan SET name = naim, gdor_id = kodgd, rast = rast,
              kobl = kobl, name_obl = name_obl, kstran = kstran, krug = krug,
              prizn_mps = prizn_mps
            WHERE id=kod;
          IF sql%notfound THEN
            INSERT INTO stan (id, name, name_s, gdor_id, rast,
                kobl, name_obl, kstran, krug, kod_dbf, prizn_mps)
              VALUES (id_stan, naim, SUBSTR(naim,1,15), kodgd, rast,
                kobl, name_obl, kstran, krug, kod, prizn_mps);
          END IF;
        END IF;
        COMMIT;
      END IF;
    ELSE
      -- no more rows to copy
      EXIT;
    END IF;
  END LOOP;
  -- Commit the destination cursor
  EXEC_SQL.CLOSE_CURSOR(dbf_connid, stan_cursor);
  IF dbf_connect = 0 THEN
    EXEC_SQL.CLOSE_CONNECTION(dbf_connid);
  END IF;
  TEXT_IO.PUT_LINE('STAN - END !');

END;

--справочник ЖЕЛЕЗНЫЕ ДОРОГИ
PROCEDURE gdor (PathDbf IN VARCHAR2) IS

  gdor_cursor EXEC_SQL.CursType;
  ignore PLS_INTEGER;

-- переменные выборки таблицы GDOR
  kod       NUMBER     ;
  naim      VARCHAR(25);
  s_naim    VARCHAR(8) ;

BEGIN
  TEXT_IO.PUT_LINE('GDOR - BEGIN !');
-- добавление пустого кода
  BEGIN
    SELECT gdor_id INTO kod FROM gdor WHERE gdor_id=0;
  EXCEPTION WHEN no_data_found THEN
  	INSERT INTO gdor VALUES (0, ' ', ' ');
  END;
  IF dbf_connect = 0 THEN
    dbf_connid := EXEC_SQL.OPEN_CONNECTION('@ODBC:VFP');
  END IF;
  -- Подготовка курсора для выполения SELECT
  gdor_cursor := EXEC_SQL.OPEN_CURSOR(dbf_connid);
  EXEC_SQL.PARSE(dbf_connid, gdor_cursor,
      'SELECT kod, naim, s_naim FROM ' || PathDbf || 'gdor');
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, gdor_cursor, 1, kod);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, gdor_cursor, 2, naim, 25);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, gdor_cursor, 3, s_naim, 8);
  ignore := EXEC_SQL.EXECUTE(dbf_connid, gdor_cursor);

  LOOP
    IF EXEC_SQL.FETCH_ROWS(dbf_connid, gdor_cursor) > 0 THEN
      -- get column values for the row
      EXEC_SQL.COLUMN_VALUE(dbf_connid, gdor_cursor, 1, kod);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, gdor_cursor, 2, naim);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, gdor_cursor, 3, s_naim);

      IF not kod=0 THEN
        UPDATE gdor SET name = naim, name_s=s_naim
          WHERE gdor_id=kod;
        IF sql%notfound THEN
          INSERT INTO gdor (gdor_id, name, name_s)
            VALUES (kod, naim, s_naim);
        END IF;
        COMMIT;
      END IF;
    ELSE
      -- no more rows to copy
      EXIT;
    END IF;
  END LOOP;
  -- Commit the destination cursor
  EXEC_SQL.CLOSE_CURSOR(dbf_connid, gdor_cursor);
  IF dbf_connect = 0 THEN
    EXEC_SQL.CLOSE_CONNECTION(dbf_connid);
  END IF;
  TEXT_IO.PUT_LINE('GDOR - END !');

END;

--справочник Ж/Д КОДЫ ПОЛУЧАТЕЛЕЙ
PROCEDURE pred_st (PathDbf IN VARCHAR2) IS

  dbf_cursor EXEC_SQL.CursType;
  ignore PLS_INTEGER;

-- переменные выборки таблицы PRED_ST
  kod       NUMBER     ;
  kst       NUMBER     ;
  gdkod     VARCHAR(12);
  kstr      NUMBER     ;
  kobl      NUMBER     ;
  kvet      NUMBER     ;
-- конвертирование кода станции
  id_stan   CHAR(6)    ;

BEGIN
  TEXT_IO.PUT_LINE('PRED_ST - BEGIN !');
  IF dbf_connect = 0 THEN
    dbf_connid := EXEC_SQL.OPEN_CONNECTION('@ODBC:VFP');
  END IF;
  -- Подготовка курсора для выполения SELECT
  dbf_cursor := EXEC_SQL.OPEN_CURSOR(dbf_connid);
  EXEC_SQL.PARSE(dbf_connid, dbf_cursor,
      'SELECT kod, kst, gdkod, kstr, kobl, kvet FROM ' || PathDbf || 'pred_st');
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 1, kod);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 2, kst);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 3, gdkod, 12);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 4, kstr);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 5, kobl);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 6, kvet);
  ignore := EXEC_SQL.EXECUTE(dbf_connid, dbf_cursor);

  LOOP
    IF EXEC_SQL.FETCH_ROWS(dbf_connid, dbf_cursor) > 0 THEN
      -- get column values for the row
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 1, kod);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 2, kst);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 3, gdkod);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 4, kstr);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 5, kobl);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 6, kvet);

      id_stan := SUBSTR(TO_CHAR(kst,'000000'),2);
      IF not ( kod=0 or kst=0 ) THEN
        UPDATE pred_st SET gdkod=gdkod, states_id=kstr, region_id=kobl, vetka_id=kvet
          WHERE predpr_id=kod AND stan_id=kst;
        IF sql%notfound THEN
          INSERT INTO pred_st (predpr_id, stan_id, gdkod, states_id, region_id, vetka_id)
            VALUES (kod, id_stan, gdkod, kstr, kobl, kvet);
        END IF;
        COMMIT;
      END IF;
    ELSE
      -- no more rows to copy
      EXIT;
    END IF;
  END LOOP;
  -- Commit the destination cursor
  EXEC_SQL.CLOSE_CURSOR(dbf_connid, dbf_cursor);
  IF dbf_connect = 0 THEN
    EXEC_SQL.CLOSE_CONNECTION(dbf_connid);
  END IF;
  TEXT_IO.PUT_LINE('PRED_ST - END !');

END;

--справочник ПОЛУЧАТЕЛИ
PROCEDURE predpr (PathDbf IN VARCHAR2) IS

  dbf_cursor EXEC_SQL.CursType;
  ignore PLS_INTEGER;

-- переменные выборки таблицы PREDPR
  kod       NUMBER     ;
  naim      VARCHAR(65);
  pindex    NUMBER     ;
  adres     VARCHAR(40);
  gdkod     VARCHAR(12);
  kstr      NUMBER     ;
  kobl      NUMBER     ;
  gorod     VARCHAR(25);
  kod_sobs  NUMBER     ;

BEGIN
  TEXT_IO.PUT_LINE('PREDPR - BEGIN !');
-- добавление пустого кода
  BEGIN
    SELECT id INTO kod FROM predpr WHERE id=0;
  EXCEPTION WHEN no_data_found THEN
  	INSERT INTO predpr (id,name) VALUES (0,' ');
  END;
  IF dbf_connect = 0 THEN
    dbf_connid := EXEC_SQL.OPEN_CONNECTION('@ODBC:VFP');
  END IF;
  -- Подготовка курсора для выполения SELECT
  dbf_cursor := EXEC_SQL.OPEN_CURSOR(dbf_connid);
  IF SinhtablRezim = 1 THEN
    EXEC_SQL.PARSE(dbf_connid, dbf_cursor,
      'SELECT kod, naim, pindex, adres, gdkod, kstr, kobl, gorod
         FROM ' || PathDbf || 'predpr');
  ELSE
    EXEC_SQL.PARSE(dbf_connid, dbf_cursor,
      'SELECT kod, naim, pindex, adres, gdkod, kstr, kobl, gorod, kod_sobs
         FROM ' || PathDbf || 'predpr');
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 9, kod_sobs);
  END IF;
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 1, kod);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 2, naim, 65);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 3, pindex);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 4, adres, 40);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 5, gdkod, 12);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 6, kstr);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 7, kobl);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 8, gorod, 25);
  ignore := EXEC_SQL.EXECUTE(dbf_connid, dbf_cursor);

  LOOP
    IF EXEC_SQL.FETCH_ROWS(dbf_connid, dbf_cursor) > 0 THEN
      -- get column values for the row
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 1, kod);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 2, naim);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 3, pindex);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 4, adres);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 5, gdkod);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 6, kstr);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 7, kobl);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 8, gorod);
      IF NOT SinhtablRezim = 1 THEN
        EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 9, kod_sobs);
      END IF;

      IF not kod = 0 THEN
        IF kod_sobs = 0 THEN
          kod_sobs := null;
        END IF;
        IF SinhtablRezim = 1 THEN
          UPDATE predpr SET name=naim, pindex=pindex, adres=adres, gdkod=gdkod,
               kstr=kstr, kobl=kobl, gorod=gorod
            WHERE id=kod;
          IF sql%notfound THEN
            INSERT INTO predpr(id, name, pindex, adres, gdkod, kstr,
                   kobl, gorod)
              VALUES (kod,  naim, pindex, adres, gdkod, kstr, kobl, gorod);
          END IF;
        ELSE
          UPDATE predpr SET name=naim, pindex=pindex, adres=adres, gdkod=gdkod,
               kstr=kstr, kobl=kobl, gorod=gorod, sobstv_id=kod_sobs
            WHERE id=kod;
          IF sql%notfound THEN
            INSERT INTO predpr(id, name, pindex, adres, gdkod, kstr,
                 kobl, gorod, sobstv_id)
              VALUES (kod,  naim, pindex, adres, gdkod, kstr, kobl, gorod, kod_sobs);
          END IF;
        END IF;
        COMMIT;
      END IF;
    ELSE
      -- no more rows to copy
      EXIT;
    END IF;
  END LOOP;
  -- Commit the destination cursor
  EXEC_SQL.CLOSE_CURSOR(dbf_connid, dbf_cursor);
  IF dbf_connect = 0 THEN
    EXEC_SQL.CLOSE_CONNECTION(dbf_connid);
  END IF;
  TEXT_IO.PUT_LINE('PREDPR - END !');

END;

--справочник Собственники
PROCEDURE sobstv (PathDbf IN VARCHAR2) IS

  dbf_cursor EXEC_SQL.CursType;
  ignore PLS_INTEGER;

-- переменные выборки таблицы SOBSTV
  kod       NUMBER     ;
  naim      VARCHAR(30);
  post      NUMBER     ;
  naim_k    VARCHAR(10);
  fio       VARCHAR(20);
  kod_inn   VARCHAR(15);
  pnp98     VARCHAR(5) ;

BEGIN
  TEXT_IO.PUT_LINE('SOBSTV - BEGIN !');
-- добавление пустого кода
  BEGIN
    SELECT id INTO kod FROM sobstv WHERE id=0;
  EXCEPTION WHEN no_data_found THEN
  	INSERT INTO sobstv (id,name,id_insert,date_insert) VALUES (0,' ',999,SYSDATE);
  END;
  IF dbf_connect = 0 THEN
    dbf_connid := EXEC_SQL.OPEN_CONNECTION('@ODBC:VFP');
  END IF;
  -- Подготовка курсора для выполения SELECT
  dbf_cursor := EXEC_SQL.OPEN_CURSOR(dbf_connid);
  EXEC_SQL.PARSE(dbf_connid, dbf_cursor,
      'SELECT kod, naim, post, naim_k, fio, kod_inn, pnp98
         FROM ' || PathDbf || 'sobstv');
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 1, kod);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 2, naim, 30);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 3, post);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 4, naim_k, 10);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 5, fio, 20);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 6, kod_inn, 15);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 7, pnp98, 5);
  ignore := EXEC_SQL.EXECUTE(dbf_connid, dbf_cursor);

  LOOP
    IF EXEC_SQL.FETCH_ROWS(dbf_connid, dbf_cursor) > 0 THEN
      -- get column values for the row
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 1, kod);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 2, naim);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 3, post);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 4, naim_k);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 5, fio);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 6, kod_inn);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 7, pnp98);

      IF not kod=0 THEN
        UPDATE sobstv SET name=naim, name_s=naim_k, fio=fio, kod_inn=kod_inn, pnp_identif=pnp98
          WHERE id=kod;
        IF sql%notfound THEN
          INSERT INTO sobstv (id, name, name_s, fio, kod_inn, pnp_identif,
               id_insert, date_insert, id_update, date_update)
            VALUES (kod,  naim, naim_k, fio, kod_inn, pnp98,
               999, '01.01.80', 999, '01.01.80');
        END IF;
        COMMIT;
      END IF;
    ELSE
      -- no more rows to copy
      EXIT;
    END IF;
  END LOOP;
  -- Commit the destination cursor
  EXEC_SQL.CLOSE_CURSOR(dbf_connid, dbf_cursor);
  IF dbf_connect = 0 THEN
    EXEC_SQL.CLOSE_CONNECTION(dbf_connid);
  END IF;
  TEXT_IO.PUT_LINE('SOBSTV - END !');

END;

--справочник Области
PROCEDURE region (PathDbf IN VARCHAR2) IS

  dbf_cursor EXEC_SQL.CursType;
  ignore PLS_INTEGER;

-- переменные выборки таблицы REGION
  kod       NUMBER     ;
  naim      VARCHAR(30);
  s_naim    VARCHAR(15);

BEGIN
  TEXT_IO.PUT_LINE('REGION - BEGIN !');
  BEGIN
    SELECT id INTO kod FROM region WHERE id=0;
  EXCEPTION WHEN no_data_found THEN
  	INSERT INTO region (id,name,name_s) VALUES (0,' ',' ');
  END;
  IF dbf_connect = 0 THEN
    dbf_connid := EXEC_SQL.OPEN_CONNECTION('@ODBC:VFP');
  END IF;
  -- Подготовка курсора для выполения SELECT
  dbf_cursor := EXEC_SQL.OPEN_CURSOR(dbf_connid);
  EXEC_SQL.PARSE(dbf_connid, dbf_cursor,
      'SELECT kod, naim, s_naim FROM ' || PathDbf || 'region');
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 1, kod);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 2, naim, 30);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 3, s_naim, 15);
  ignore := EXEC_SQL.EXECUTE(dbf_connid, dbf_cursor);

  LOOP
    IF EXEC_SQL.FETCH_ROWS(dbf_connid, dbf_cursor) > 0 THEN
      -- get column values for the row
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 1, kod);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 2, naim);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 3, s_naim);

      IF not kod=0 THEN
        UPDATE region SET name=naim, name_s=s_naim
          WHERE id=kod;
        IF sql%notfound THEN
          INSERT INTO region (id, name, name_s)
            VALUES (kod,  naim, s_naim);
        END IF;
        COMMIT;
      END IF;
    ELSE
      -- no more rows to copy
      EXIT;
    END IF;
  END LOOP;
  -- Commit the destination cursor
  EXEC_SQL.CLOSE_CURSOR(dbf_connid, dbf_cursor);
  IF dbf_connect = 0 THEN
    EXEC_SQL.CLOSE_CONNECTION(dbf_connid);
  END IF;
  TEXT_IO.PUT_LINE('REGION - END !');

END;

--справочник Страны
PROCEDURE states (PathDbf IN VARCHAR2) IS

  dbf_cursor EXEC_SQL.CursType;
  ignore PLS_INTEGER;

-- переменные выборки таблицы STATES
  kod       NUMBER     ;
  naim      VARCHAR(30);
  s_naim    VARCHAR(10);

BEGIN
  TEXT_IO.PUT_LINE('STATES - BEGIN !');
  BEGIN
    SELECT id INTO kod FROM states WHERE id=0;
  EXCEPTION WHEN no_data_found THEN
  	INSERT INTO states (id,name) VALUES (0,' ');
  END;
  IF dbf_connect = 0 THEN
    dbf_connid := EXEC_SQL.OPEN_CONNECTION('@ODBC:VFP');
  END IF;
  -- Подготовка курсора для выполения SELECT
  dbf_cursor := EXEC_SQL.OPEN_CURSOR(dbf_connid);
  EXEC_SQL.PARSE(dbf_connid, dbf_cursor,
      'SELECT kod, naim, s_naim FROM ' || PathDbf || 'states');
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 1, kod);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 2, naim, 30);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 3, s_naim, 10);
  ignore := EXEC_SQL.EXECUTE(dbf_connid, dbf_cursor);

  LOOP
    IF EXEC_SQL.FETCH_ROWS(dbf_connid, dbf_cursor) > 0 THEN
      -- get column values for the row
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 1, kod);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 2, naim);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 3, s_naim);

      IF not kod=0 THEN
        UPDATE states SET name=naim, name_s=s_naim
          WHERE id=kod;
        IF sql%notfound THEN
          INSERT INTO states (id, name, name_s)
            VALUES (kod,  naim, s_naim);
        END IF;
        COMMIT;
      END IF;
    ELSE
      -- no more rows to copy
      EXIT;
    END IF;
  END LOOP;
  -- Commit the destination cursor
  EXEC_SQL.CLOSE_CURSOR(dbf_connid, dbf_cursor);
  IF dbf_connect = 0 THEN
    EXEC_SQL.CLOSE_CONNECTION(dbf_connid);
  END IF;
  TEXT_IO.PUT_LINE('STATES - END !');

END;

--справочник Ветки Получателя
PROCEDURE vetka (PathDbf IN VARCHAR2) IS

  dbf_cursor EXEC_SQL.CursType;
  ignore PLS_INTEGER;

-- переменные выборки таблицы VETKA
  kod       NUMBER     ;
  fvetka     VARCHAR(50);

BEGIN
  TEXT_IO.PUT_LINE('VETKA - BEGIN !');
-- добавление пустого кода
  BEGIN
    SELECT id INTO kod FROM vetka WHERE id=0;
  EXCEPTION WHEN no_data_found THEN
  	INSERT INTO vetka (id,name) VALUES (0,' ');
  END;
  IF dbf_connect = 0 THEN
    dbf_connid := EXEC_SQL.OPEN_CONNECTION('@ODBC:VFP');
  END IF;
  -- Подготовка курсора для выполения SELECT
  dbf_cursor := EXEC_SQL.OPEN_CURSOR(dbf_connid);
  EXEC_SQL.PARSE(dbf_connid, dbf_cursor,
      'SELECT kod, vetka FROM ' || PathDbf || 'vetka');
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 1, kod);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 2, fvetka, 50);
  ignore := EXEC_SQL.EXECUTE(dbf_connid, dbf_cursor);

  LOOP
    IF EXEC_SQL.FETCH_ROWS(dbf_connid, dbf_cursor) > 0 THEN
      -- get column values for the row
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 1, kod);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 2, fvetka);

      IF not kod=0 THEN
        UPDATE vetka SET name=fvetka
          WHERE id=kod;
        IF sql%notfound THEN
          INSERT INTO vetka (id, name) VALUES (kod,  fvetka);
        END IF;
        COMMIT;
      END IF;
    ELSE
      -- no more rows to copy
      EXIT;
    END IF;
  END LOOP;
  -- Commit the destination cursor
  EXEC_SQL.CLOSE_CURSOR(dbf_connid, dbf_cursor);
  IF dbf_connect = 0 THEN
    EXEC_SQL.CLOSE_CONNECTION(dbf_connid);
  END IF;
  TEXT_IO.PUT_LINE('VETKA - END !');

END;

--Заявки на отгрузку
PROCEDURE lfraznar (PathDbf IN VARCHAR2) IS

-- поля синхронизации
  CURSOR struct_raznar ( param1 NUMBER, param2 VARCHAR2 ) IS 
    SELECT * FROM strurazn WHERE tip_razn>param1 AND RTRIM(field_name)=param2;
  RecStrRazn struct_raznar%ROWTYPE;

  dbf_cursor   EXEC_SQL.CursType; -- RAZNAR.DBF
  OraIdCurRazn EXEC_SQL.CursType; -- обновление ora_id в текущем задании
  OraIdArhRazn EXEC_SQL.CursType; -- обновление ora_id в архивном задании
  ora_update   EXEC_SQL.CursType; -- обновление заявки в Oracle
  ora_insert   EXEC_SQL.CursType; -- добавление заявки в Oracle
  ignore     PLS_INTEGER;

-- PL - таблица значений SELECT'а
  TYPE type_record_struct IS RECORD ( name      VARCHAR2(10),
                                      collen    PLS_INTEGER,
                                      type      PLS_INTEGER,
                                      s_values  VARCHAR2(255),
                                      d_values  DATE,
                                      n_values  NUMBER,
                                      dostup    BOOLEAN);
  TYPE type_table_struct IS TABLE OF type_record_struct INDEX BY BINARY_INTEGER;
  rvalues     type_record_struct;
  tvalues     type_table_struct;
  position    PLS_INTEGER;
  kol_rec     PLS_INTEGER;
  sql_update  VARCHAR(4096);
  sql_insert  VARCHAR(4096);
  sql_insert2 VARCHAR(4096);
  sql_select  VARCHAR(200);
  form_raznar PLS_INTEGER := 0; -- вид разнарядки
  sql_insert_arhiv VARCHAR(4096); -- добавление в архив при приёме разнарядки
  ora_insert_arhiv EXEC_SQL.CursType; -- добавление заявки в архив
  larhiv_id    NUMBER; -- код в архиве

-- приём разнарядки
  CURSOR exist_raznar (param VARCHAR2) IS 
    SELECT kol_cist, tonn, cist, kol_tonn FROM raznar WHERE nom_zd LIKE RPAD(param,12);
  KolRazn exist_raznar%ROWTYPE;
  ora_select   EXEC_SQL.CursType; -- поиск текущей 
  pos_nomzd    PLS_INTEGER; -- позиция номера задания
  TYPE raznar_update IS REF CURSOR;

BEGIN
  TEXT_IO.PUT_LINE('RAZNAR - BEGIN !');
  -- Подготовка курсоров
  IF dbf_connect = 0 THEN
    dbf_connid := EXEC_SQL.OPEN_CONNECTION('@ODBC:VFP');
  END IF;
  ora_connid := EXEC_SQL.CURR_CONNECTION;
  dbf_cursor := EXEC_SQL.OPEN_CURSOR(dbf_connid);
  ora_update := EXEC_SQL.OPEN_CURSOR(ora_connid);
  ora_insert := EXEC_SQL.OPEN_CURSOR(ora_connid);
  IF SinhtablRezim = 1 THEN
    ora_select := EXEC_SQL.OPEN_CURSOR(ora_connid);
    OraIdCurRazn := EXEC_SQL.OPEN_CURSOR(dbf_connid);
    OraIdArhRazn := EXEC_SQL.OPEN_CURSOR(dbf_connid);
    EXEC_SQL.PARSE(dbf_connid, OraIdCurRazn,
      'UPDATE ' || TovPrDbf || 'raznar SET ora_id=:larhiv_id WHERE nom_zd=:lnom_zd');
    EXEC_SQL.PARSE(dbf_connid, OraIdArhRazn,
      'UPDATE ' || TovPrArh || 'raznar SET ora_id=:larhiv_id WHERE EMPTY(ora_id) AND 
         nom_zd=:lnom_zd');
  END IF;
  IF SinhtablRezim = 1 OR SinhtablRezim = 2 THEN
    ora_insert_arhiv := EXEC_SQL.OPEN_CURSOR(ora_connid);
  END IF;
  
  EXEC_SQL.PARSE(dbf_connid, dbf_cursor,
      'SELECT * FROM ' || PathDbf || 'raznar');

  position := 0;
  LOOP  -- определяем переменные для хранения SELECT'а DBF  
    BEGIN
      position := position + 1;
      EXEC_SQL.DESCRIBE_COLUMN(dbf_connid, dbf_cursor, position,
        rvalues.name, rvalues.collen, rvalues.type);
      tvalues(position).name := rvalues.name;
      tvalues(position).collen := rvalues.collen;
      tvalues(position).type := rvalues.type;
      tvalues(position).s_values := '';
      tvalues(position).dostup := FALSE;

      IF rvalues.type = EXEC_SQL.DATE_TYPE THEN
        EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, position,
          tvalues(position).d_values);
      ELSIF rvalues.type = EXEC_SQL.NUMBER_TYPE THEN
        EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, position,
          tvalues(position).n_values);
      ELSE
        EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, position,
          tvalues(position).s_values, tvalues(position).collen);
      END IF;
      IF rvalues.name='NOM_ZD' THEN -- позиция поля 'N задания'
      	pos_nomzd := position;
      END IF;
    EXCEPTION WHEN EXEC_SQL.INVALID_COLUMN_NUMBER THEN EXIT;
    END;
  END LOOP;
  kol_rec := position-1;
  ignore := EXEC_SQL.EXECUTE(dbf_connid, dbf_cursor);  -- выполняем SELECT DBF'а

  -- формируем курсоры на обновление и на добавление
  sql_update := '';
  sql_insert := '';
  sql_insert2 := '';
  sql_select := '';
	IF SinhtablRezim = 1 OR SinhtablRezim = 2 THEN
		form_raznar := 1; -- приём разнарядки
	END IF;
  FOR position IN 1..kol_rec LOOP
    OPEN struct_raznar ( form_raznar, RTRIM(tvalues(position).name) );
    FETCH struct_raznar INTO RecStrRazn;
    IF struct_raznar%FOUND AND NOT LENGTH(LTRIM(RecStrRazn.ora_name)) = 0  THEN
      sql_update := sql_update || ',' || RTRIM(RecStrRazn.ora_name) || 
        '=:' || tvalues(position).name;
      sql_insert := sql_insert || ',' || RTRIM(RecStrRazn.ora_name);
      sql_insert2 := sql_insert2 || ',:' || tvalues(position).name;
      tvalues(position).dostup := TRUE;
    END IF;
    CLOSE struct_raznar;
  END LOOP;

	IF SinhtablRezim = 1 OR SinhtablRezim = 2 THEN
    sql_insert_arhiv := 'INSERT INTO raznar_rw (' ||
      SUBSTR(sql_insert,2) || ',id) VALUES (' || SUBSTR(sql_insert2,2) || ',:id)';
    EXEC_SQL.PARSE(ora_connid, ora_insert_arhiv, sql_insert_arhiv); -- сохраниение в архиве
		sql_insert := sql_insert || ',kol_tonn,cist,arhiv_id';
		sql_insert2 := sql_insert2 || ',:tonn,:kol_cist,:arhiv_id';
	ELSE
    EXEC_SQL.PARSE( ora_connid, ora_update, 'UPDATE raznar SET ' || SUBSTR(sql_update,2) ||
          ' WHERE nom_zd=:nom_zd' );
  END IF;

  EXEC_SQL.PARSE( ora_connid, ora_insert, 'INSERT INTO raznar (' ||
      SUBSTR(sql_insert,2) || ') VALUES (' || SUBSTR(sql_insert2,2) || ')' );

-- обновляем данные
  WHILE EXEC_SQL.FETCH_ROWS(dbf_connid, dbf_cursor) > 0 LOOP
    -- достаем значения записи 
    FOR position IN 1..kol_rec LOOP  
      IF tvalues(position).dostup THEN
        IF tvalues(position).type = EXEC_SQL.DATE_TYPE THEN
          EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, position, tvalues(position).d_values);
        ELSIF tvalues(position).type = EXEC_SQL.NUMBER_TYPE THEN
          EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, position, tvalues(position).n_values);
        ELSE
          EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, position, tvalues(position).s_values);
        END IF;
      END IF;
    END LOOP;
    -- обновляем запись в ORA.RAZNAR
  	IF SinhtablRezim = 1 OR SinhtablRezim = 2 THEN
      FOR position IN 1..kol_rec LOOP  -- добавление в архив разнарядок
        IF tvalues(position).dostup THEN
          IF tvalues(position).name = 'KST' THEN
          	tvalues(position).s_values := SUBSTR(TO_CHAR(tvalues(position).n_values,'000000'),2);
            EXEC_SQL.BIND_VARIABLE(ora_connid, ora_insert_arhiv,
              tvalues(position).name, tvalues(position).s_values);
          ELSIF tvalues(position).type = EXEC_SQL.DATE_TYPE THEN
            EXEC_SQL.BIND_VARIABLE(ora_connid, ora_insert_arhiv,
              tvalues(position).name, tvalues(position).d_values);
          ELSIF tvalues(position).type = EXEC_SQL.NUMBER_TYPE THEN
            EXEC_SQL.BIND_VARIABLE(ora_connid, ora_insert_arhiv,
              tvalues(position).name, tvalues(position).n_values);
          ELSE
            EXEC_SQL.BIND_VARIABLE(ora_connid, ora_insert_arhiv,
              tvalues(position).name, tvalues(position).s_values);
          END IF;
        END IF;
      END LOOP;
      SELECT raznar_rw_seq.nextval INTO larhiv_id FROM dual;
      EXEC_SQL.BIND_VARIABLE(ora_connid, ora_insert_arhiv,
              ':id', larhiv_id);
      ignore := EXEC_SQL.EXECUTE(ora_connid, ora_insert_arhiv);
    	IF SinhtablRezim = 1 THEN
        --проверка на наличие в текущей разнарядке
        OPEN exist_raznar (tvalues(pos_nomzd).s_values);
        FETCH exist_raznar INTO KolRazn;
        IF exist_raznar%FOUND THEN
          UPDATE raznar SET kol_cist=KolRazn.kol_cist+kol_cist, tonn=KolRazn.tonn+tonn, 
                          cist=KolRazn.cist+kol_cist, kol_tonn=KolRazn.kol_tonn+tonn,
	                          arhiv_id=larhiv_id
            WHERE nom_zd LIKE tvalues(pos_nomzd).s_values || '%';
          ignore := 1;
        ELSE
          ignore := 0;
        END IF;
        CLOSE exist_raznar;
      ELSE
        ignore:=1;
      END IF;
    ELSE
      FOR position IN 1..kol_rec LOOP
        IF tvalues(position).dostup THEN
          IF tvalues(position).name = 'KST' THEN
        	  tvalues(position).s_values := SUBSTR(TO_CHAR(tvalues(position).n_values,'000000'),2);
            EXEC_SQL.BIND_VARIABLE(ora_connid, ora_update,
              tvalues(position).name, tvalues(position).s_values);
          ELSIF tvalues(position).type = EXEC_SQL.DATE_TYPE THEN
            EXEC_SQL.BIND_VARIABLE(ora_connid, ora_update,
              tvalues(position).name, tvalues(position).d_values);
          ELSIF tvalues(position).type = EXEC_SQL.NUMBER_TYPE THEN
            EXEC_SQL.BIND_VARIABLE(ora_connid, ora_update,
              tvalues(position).name, tvalues(position).n_values);
          ELSE
            EXEC_SQL.BIND_VARIABLE(ora_connid, ora_update,
              tvalues(position).name, tvalues(position).s_values);
          END IF;
        END IF;
      END LOOP;
      ignore := EXEC_SQL.EXECUTE(ora_connid, ora_update);
   	END IF;
    IF ignore=0 THEN  -- если нет - добавляем
      FOR position IN 1..kol_rec LOOP
        IF tvalues(position).dostup THEN
          IF tvalues(position).name = 'KST' THEN
          	tvalues(position).s_values := SUBSTR(TO_CHAR(tvalues(position).n_values,'000000'),2);
            EXEC_SQL.BIND_VARIABLE(ora_connid, ora_insert,
              tvalues(position).name, tvalues(position).s_values);
          ELSIF tvalues(position).type = EXEC_SQL.DATE_TYPE THEN
            EXEC_SQL.BIND_VARIABLE(ora_connid, ora_insert,
              tvalues(position).name, tvalues(position).d_values);
          ELSIF tvalues(position).type = EXEC_SQL.NUMBER_TYPE THEN
            EXEC_SQL.BIND_VARIABLE(ora_connid, ora_insert,
              tvalues(position).name, tvalues(position).n_values);
          ELSE
            EXEC_SQL.BIND_VARIABLE(ora_connid, ora_insert,
              tvalues(position).name, tvalues(position).s_values);
          END IF;
        END IF;
      END LOOP;
      IF SinhtablRezim = 1 THEN
        EXEC_SQL.BIND_VARIABLE(ora_connid, ora_insert,
          ':arhiv_id', larhiv_id);
      END IF;
      ignore := EXEC_SQL.EXECUTE(ora_connid, ora_insert);
    END IF;
-- обновление ora_id в принятой разнарядке (DBF)
    IF SinhtablRezim = 1 THEN
      EXEC_SQL.BIND_VARIABLE(dbf_connid, OraIdCurRazn,
        ':larhiv_id', larhiv_id);
      EXEC_SQL.BIND_VARIABLE(dbf_connid, OraIdCurRazn,
        ':lnom_zd', tvalues(pos_nomzd).s_values);
      EXEC_SQL.BIND_VARIABLE(dbf_connid, OraIdArhRazn,
        ':larhiv_id', larhiv_id);
      EXEC_SQL.BIND_VARIABLE(dbf_connid, OraIdArhRazn,
        ':lnom_zd', tvalues(pos_nomzd).s_values);
      ignore := EXEC_SQL.EXECUTE(dbf_connid, OraIdCurRazn);  -- выполняем SELECT DBF'а
      ignore := EXEC_SQL.EXECUTE(dbf_connid, OraIdArhRazn);  -- выполняем SELECT DBF'а
    END IF;
  END LOOP;

  EXEC_SQL.PARSE( ora_connid, ora_update, 'COMMIT' );
  ignore := EXEC_SQL.EXECUTE(ora_connid, ora_update);
  EXEC_SQL.PARSE( ora_connid, ora_insert, 'COMMIT' );
  ignore := EXEC_SQL.EXECUTE(ora_connid, ora_insert);

  EXEC_SQL.CLOSE_CURSOR(dbf_connid, dbf_cursor);
  IF SinhtablRezim > 0 THEN
    EXEC_SQL.PARSE( ora_connid, ora_insert_arhiv, 'COMMIT' );
    ignore := EXEC_SQL.EXECUTE(ora_connid, ora_insert_arhiv);
    EXEC_SQL.CLOSE_CURSOR(ora_connid, ora_insert_arhiv);
    EXEC_SQL.CLOSE_CURSOR(dbf_connid, OraIdCurRazn);
    EXEC_SQL.CLOSE_CURSOR(dbf_connid, OraIdArhRazn);
  END IF;
  EXEC_SQL.CLOSE_CURSOR(ora_connid, ora_insert);
  EXEC_SQL.CLOSE_CURSOR(ora_connid, ora_update);
  EXEC_SQL.CLOSE_CURSOR(ora_connid, ora_select);
  IF dbf_connect = 0 THEN
    EXEC_SQL.CLOSE_CONNECTION(dbf_connid);
  END IF;

  TEXT_IO.PUT_LINE('RAZNAR - END !');
END;

--справочник НЕФТЕПРОДУКТЫ
PROCEDURE prod (PathDbf IN VARCHAR2) IS

  dbf_cursor EXEC_SQL.CursType;
  ignore PLS_INTEGER;

-- переменные выборки таблицы PROD
  kod       VARCHAR(5) ;
  kod_otgr  VARCHAR(5) ;
  typnp     NUMBER     ;
  psevdo    VARCHAR(6) ;
  naim_pr   VARCHAR(20);
  name      VARCHAR(20);
  name1     VARCHAR(20);
  kodgrgd   NUMBER     ;
  dostup    NUMBER     ;
  sortby    NUMBER     ;
  npl_min   NUMBER     ;
  npl_max   NUMBER     ;
  kod_10    VARCHAR(10);
  uch       NUMBER     ;
  fasovka   NUMBER     ;

BEGIN
  TEXT_IO.PUT_LINE('PROD - BEGIN !');
  IF dbf_connect = 0 THEN
    dbf_connid := EXEC_SQL.OPEN_CONNECTION('@ODBC:VFP');
  END IF;
  -- Подготовка курсора для выполения SELECT
  dbf_cursor := EXEC_SQL.OPEN_CURSOR(dbf_connid);

  EXEC_SQL.PARSE(dbf_connid, dbf_cursor,
      'SELECT kod,kod_otgr,typnp,psevdo,naim_pr,name,name1,kodgrgd,dostup,sortby,
         npl_min,npl_max,kod_10,uch,fasovka FROM ' || PathDbf || 'prod');
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 1, kod, 5);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 2, kod_otgr, 5);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 3, typnp);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 4, psevdo, 6);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 5, naim_pr, 20);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 6, name, 20);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 7, name1, 20);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 8, kodgrgd);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 9, dostup);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 10, sortby);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 11, npl_min);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 12, npl_max);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 13, kod_10, 10);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 14, uch);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 15, fasovka);
  ignore := EXEC_SQL.EXECUTE(dbf_connid, dbf_cursor);

  WHILE EXEC_SQL.FETCH_ROWS(dbf_connid, dbf_cursor) > 0 LOOP
      -- get column values for the row
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 1, kod);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 2, kod_otgr);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 3, typnp);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 4, psevdo);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 5, naim_pr);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 6, name);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 7, name1);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 8, kodgrgd);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 9, dostup);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 10, sortby);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 11, npl_min);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 12, npl_max);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 13, kod_10);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 14, uch);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 15, fasovka);

      UPDATE prod SET kod_otgr = kod_otgr, prod_type_id = typnp, kod_pr = psevdo,
          naim_pr = naim_pr, name = name, name1 = name1, prod_gd_rod_id = kodgrgd,
          dostup = dostup, sortby = sortby, npl_min = npl_min, npl_max = npl_max, kod_10 = kod_10,
          uch = uch, fasovka = fasovka
        WHERE id=kod;
      IF sql%notfound THEN
          INSERT INTO prod (id, kod_otgr, prod_type_id, kod_pr, naim_pr,
              name, name1, prod_gd_rod_id, dostup, sortby, npl_min, npl_max, kod_10, uch, fasovka)
            VALUES (kod, kod_otgr, typnp, psevdo, naim_pr, name, name1, kodgrgd, dostup, sortby,
              npl_min, npl_max, kod_10, uch, fasovka);
      END IF;
      COMMIT;
  END LOOP;
  -- Commit the destination cursor
  EXEC_SQL.CLOSE_CURSOR(dbf_connid, dbf_cursor);
  IF dbf_connect = 0 THEN
    EXEC_SQL.CLOSE_CONNECTION(dbf_connid);
  END IF;
  TEXT_IO.PUT_LINE('PROD - END !');

END;

--справочник РОД ГРУЗА
PROCEDURE prod_gd_rod (PathDbf IN VARCHAR2) IS

  dbf_cursor EXEC_SQL.CursType;
  ignore PLS_INTEGER;

-- переменные выборки таблицы ROD
  kodgrgd   NUMBER     ;
  name      VARCHAR(20);
  shema     NUMBER     ;
  shemas    NUMBER     ;
  klass     NUMBER     ;
  priz_dv   NUMBER     ;
  norm_otg  NUMBER     ;
  kgr       VARCHAR(6) ;

BEGIN
  TEXT_IO.PUT_LINE('PROD_GD_ROD - BEGIN !');
-- добавление пустого кода
  BEGIN
    SELECT id INTO kodgrgd FROM prod_gd_rod WHERE id=0;
  EXCEPTION WHEN no_data_found THEN
  	INSERT INTO prod_gd_rod (id,name) VALUES (0,' ');
  END;
  IF dbf_connect = 0 THEN
    dbf_connid := EXEC_SQL.OPEN_CONNECTION('@ODBC:VFP');
  END IF;
  -- Подготовка курсора для выполения SELECT
  dbf_cursor := EXEC_SQL.OPEN_CURSOR(dbf_connid);

  EXEC_SQL.PARSE(dbf_connid, dbf_cursor,
      'SELECT kodgrgd,name,shema,shemas,klass,priz_dv,norm_otg,kgr
         FROM ' || PathDbf || 'grgd');

  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 1, kodgrgd);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 2, name, 20);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 3, shema);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 4, shemas);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 5, klass);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 6, priz_dv);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 7, norm_otg);
  EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 8, kgr, 6);
  ignore := EXEC_SQL.EXECUTE(dbf_connid, dbf_cursor);

  WHILE EXEC_SQL.FETCH_ROWS(dbf_connid, dbf_cursor) > 0 LOOP
      -- get column values for the row
    EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 1, kodgrgd);
    EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 2, name);
    EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 3, shema);
    EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 4, shemas);
    EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 5, klass);
    EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 6, priz_dv);
    EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 7, norm_otg);
    EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 8, kgr);

  	IF not kodgrgd = 0 THEN
      UPDATE prod_gd_rod SET name = name, shema = shema, shemas = shemas,
        klass = klass, priz_dv = priz_dv, norm_otg = norm_otg, kgr = kgr
        WHERE id = kodgrgd;
      IF sql%notfound THEN
        INSERT INTO prod_gd_rod (id, name, shema, shemas, klass,
             priz_dv, norm_otg, kgr)
          VALUES (kodgrgd, name, shema, shemas, klass,
             priz_dv, norm_otg, kgr);
      END IF;
      COMMIT;
    END IF;
  END LOOP;
  -- Commit the destination cursor
  EXEC_SQL.CLOSE_CURSOR(dbf_connid, dbf_cursor);
  IF dbf_connect = 0 THEN
    EXEC_SQL.CLOSE_CONNECTION(dbf_connid);
  END IF;
  TEXT_IO.PUT_LINE('PROD_GD_ROD - END !');

END;

PROCEDURE del_razn IS
BEGIN
	check_rec(2,'f:\tov_pr\dbf\raznar','nom_zd','raznar','nom_zd');
END;

-- процедура проверки записей на наличие
PROCEDURE check_rec(Regime PLS_INTEGER, FullNameSource IN VARCHAR2,FieldSource IN VARCHAR2,
    NameSinhr IN VARCHAR2,FieldSinhr IN VARCHAR2) IS

  dbf_cursor EXEC_SQL.CursType;
  del_cursor EXEC_SQL.CursType;
  ora_cursor EXEC_SQL.CursType;
  ignore PLS_INTEGER;

  lField VARCHAR2(20);
  TYPE tyTable IS TABLE OF lField%TYPE INDEX BY BINARY_INTEGER;
  ltaSource tyTable;
  i    PLS_INTEGER;
  lInd PLS_INTEGER;

BEGIN
	IF Regime = 1 THEN
  	log_file := TEXT_IO.FOPEN(lPathLog || 'check_rec.log','a');
	  TEXT_IO.NEW_LINE(log_file);
   	TEXT_IO.PUT_LINE(log_file,TO_CHAR(SYSDATE,'DD.MM.IYYY HH24:MI:SS'));
  END IF;
  ora_connid := EXEC_SQL.CURR_CONNECTION;
  IF dbf_connect = 0 THEN
    dbf_connid := EXEC_SQL.OPEN_CONNECTION('@ODBC:VFP');
  END IF;
  -- Подготовка курсора для выполения SELECT'а
  dbf_cursor := EXEC_SQL.OPEN_CURSOR(dbf_connid);
  ora_cursor := EXEC_SQL.OPEN_CURSOR(ora_connid);
  IF Regime = 2 THEN
    del_cursor := EXEC_SQL.OPEN_CURSOR(ora_connid);
  END IF;

  BEGIN
    EXEC_SQL.PARSE(dbf_connid, dbf_cursor,
      'SELECT ' || FieldSource || ' FROM ' || FullNameSource);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 1, lField, 20);
    ignore := EXEC_SQL.EXECUTE(dbf_connid, dbf_cursor);
    i := 0;
    WHILE EXEC_SQL.FETCH_ROWS(dbf_connid, dbf_cursor) > 0 LOOP
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor, 1, lField);
    	i := i + 1;
    	ltaSource(i) := lField;
    END LOOP;

    EXEC_SQL.PARSE(ora_connid, ora_cursor,
      'SELECT ' || FieldSinhr || ' FROM ' || NameSinhr );
    EXEC_SQL.DEFINE_COLUMN(ora_connid, ora_cursor, 1, lField, 20);
    ignore := EXEC_SQL.EXECUTE(ora_connid, ora_cursor);
    
    WHILE EXEC_SQL.FETCH_ROWS(ora_connid, ora_cursor) > 0 LOOP
      EXEC_SQL.COLUMN_VALUE(ora_connid, ora_cursor, 1, lField);
      i := ltaSource.FIRST;
      lInd := ltaSource.LAST;
      WHILE NOT RTRIM(lField)=RTRIM(ltaSource(i)) LOOP
      	IF i = lInd THEN
          IF Regime = 2 THEN
            EXEC_SQL.PARSE(ora_connid, del_cursor,'DELETE FROM ' || NameSinhr ||
              ' WHERE ' || FieldSinhr || '=''' || lField || '''');
            ignore := EXEC_SQL.EXECUTE(ora_connid, del_cursor);
            EXEC_SQL.PARSE(ora_connid, del_cursor, 'COMMIT' );
            ignore := EXEC_SQL.EXECUTE(ora_connid, del_cursor);
          END IF;
         	TEXT_IO.PUT_LINE(log_file, FieldSinhr || '=' || lField);
      		EXIT;
      	END IF;
      	i := ltaSource.NEXT(i);
      END LOOP;
      null;
    END LOOP;

  EXCEPTION WHEN EXEC_SQL.PACKAGE_ERROR THEN
    IF EXEC_SQL.LAST_ERROR_CODE(dbf_connid) != 0 THEN
       On_ExecSqlError(dbf_connid);
    END IF;
    IF EXEC_SQL.LAST_ERROR_CODE(ora_connid) != 0 THEN
       On_ExecSqlError(ora_connid);
    END IF;
  END;

  EXEC_SQL.CLOSE_CURSOR(dbf_connid, dbf_cursor);
  EXEC_SQL.CLOSE_CURSOR(ora_connid, ora_cursor);
	IF Regime = 2 THEN
    EXEC_SQL.CLOSE_CURSOR(ora_connid, del_cursor);
  END IF;
  IF dbf_connect = 0 THEN
    EXEC_SQL.CLOSE_CONNECTION(dbf_connid);  -- закрытие соединения
  END IF;
	IF Regime = 1 THEN
   	TEXT_IO.PUT_LINE(log_file,TO_CHAR(SYSDATE,'DD.MM.IYYY HH24:MI:SS'));
    TEXT_IO.FCLOSE(log_file);
  END IF;
END;

-- синхронизация id-таблиц
PROCEDURE sinhid(Regime PLS_INTEGER, NameSource IN VARCHAR2,FieldSource IN VARCHAR2,
    FullNameSinhr IN VARCHAR2,FieldSinhr IN VARCHAR2) IS
  
  dbf_cursor EXEC_SQL.CursType;
  ora_cursor EXEC_SQL.CursType;
  ignore     PLS_INTEGER      ;
  
  lora_id NUMBER       ; -- id-Oracle
  ldbf_id NUMBER       ; -- id-DBF
  lnom_zd VARCHAR2(12) ; -- N задания
  
BEGIN
	IF Regime = 1 THEN
  	log_file := TEXT_IO.FOPEN(lPathLog || 'sinhid.log','a');
  END IF;
	TEXT_IO.NEW_LINE(log_file);
 	TEXT_IO.PUT_LINE(log_file,TO_CHAR(SYSDATE,'DD.MM.IYYY HH24:MI:SS'));
  ora_connid := EXEC_SQL.CURR_CONNECTION;
  IF dbf_connect = 0 THEN
    dbf_connid := EXEC_SQL.OPEN_CONNECTION('@ODBC:VFP');
  END IF;
  -- Подготовка курсора для выполения SELECT'а
  dbf_cursor := EXEC_SQL.OPEN_CURSOR(dbf_connid);
  ora_cursor := EXEC_SQL.OPEN_CURSOR(ora_connid);

  BEGIN
    EXEC_SQL.PARSE(ora_connid, ora_cursor, 'SELECT nom_zd,' || FieldSource ||
      ' FROM ' || NameSource);
    EXEC_SQL.DEFINE_COLUMN(ora_connid, ora_cursor, 1, lnom_zd, 12);
    EXEC_SQL.DEFINE_COLUMN(ora_connid, ora_cursor, 2, lora_id);
    ignore := EXEC_SQL.EXECUTE(ora_connid, ora_cursor);

    EXEC_SQL.PARSE(dbf_connid, dbf_cursor, 'UPDATE ' || FullNameSinhr ||
      ' SET ' || FieldSinhr || '=:field_id WHERE nom_zd=:lnom_zd');

    WHILE EXEC_SQL.FETCH_ROWS(ora_connid, ora_cursor) > 0 LOOP
      EXEC_SQL.COLUMN_VALUE(ora_connid, ora_cursor, 1, lnom_zd);
      EXEC_SQL.COLUMN_VALUE(ora_connid, ora_cursor, 2, lora_id);
      EXEC_SQL.BIND_VARIABLE(dbf_connid, dbf_cursor,':field_id',lora_id);
      EXEC_SQL.BIND_VARIABLE(dbf_connid, dbf_cursor,':lnom_zd',lnom_zd);
      ignore := EXEC_SQL.EXECUTE(dbf_connid, dbf_cursor);
    END LOOP;
  	
  EXCEPTION WHEN EXEC_SQL.PACKAGE_ERROR THEN
    IF EXEC_SQL.LAST_ERROR_CODE(dbf_connid) != 0 THEN
       On_ExecSqlError(dbf_connid);
    END IF;
    IF EXEC_SQL.LAST_ERROR_CODE(ora_connid) != 0 THEN
       On_ExecSqlError(ora_connid);
    END IF;
  END;

  EXEC_SQL.CLOSE_CURSOR(ora_connid, ora_cursor);
  EXEC_SQL.CLOSE_CURSOR(ora_connid, dbf_cursor);
  IF dbf_connect = 0 THEN
    EXEC_SQL.CLOSE_CONNECTION(dbf_connid);  -- закрытие соединения
  END IF;
 	TEXT_IO.PUT_LINE(log_file,TO_CHAR(SYSDATE,'DD.MM.IYYY HH24:MI:SS'));
	IF Regime = 1 THEN
    TEXT_IO.FCLOSE(log_file);
  END IF;
END;

-- справочник тип грузоподьёмность количество осей  
PROCEDURE cist_typ IS
  dbf_cursor EXEC_SQL.CursType;
  ignore     PLS_INTEGER      ;

  tip      VARCHAR2(3) ;
  gru      NUMBER      ;
  koo      NUMBER      ;
  CURSOR exists_tip ( param VARCHAR2 ) IS 
    SELECT tip FROM cist_typ WHERE tip=param;
  ltip VARCHAR2(3);
BEGIN
--	log_file := TEXT_IO.FOPEN(lPathLog || 'Cist_typ.log','a');
	TEXT_IO.NEW_LINE(log_file);
	TEXT_IO.PUT(log_file,TO_CHAR(SYSDATE,'DD.MM.IYYY HH24:MI:SS'));
-- ODBC - соединение с таблицами DBF
  dbf_connid := EXEC_SQL.OPEN_CONNECTION('@ODBC:VFP');
  dbf_connect := 1;
  dbf_cursor := EXEC_SQL.OPEN_CURSOR(dbf_connid);
  BEGIN
    EXEC_SQL.PARSE(dbf_connid, dbf_cursor, 
      'SELECT tip,gru,koo FROM ' || TovPrDbf || 'cist_typ');
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 1, tip, 3);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 2, gru);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 3, koo);
    ignore := EXEC_SQL.EXECUTE(dbf_connid, dbf_cursor);
    WHILE EXEC_SQL.FETCH_ROWS(dbf_connid, dbf_cursor) > 0 LOOP
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor,  1, tip);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor,  2, gru);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor,  3, koo);
      OPEN exists_tip (tip);
      FETCH exists_tip INTO ltip;
      IF exists_tip%FOUND THEN
      	UPDATE cist_typ SET gru=gru, koo=koo WHERE tip=ltip;
      ELSE
      	INSERT INTO cist_typ (tip,gru,koo) VALUES (tip,gru,koo);
      END IF;
      CLOSE exists_tip;
    END LOOP;
    COMMIT;
  EXCEPTION WHEN EXEC_SQL.PACKAGE_ERROR THEN 
    IF EXEC_SQL.LAST_ERROR_CODE(dbf_connid) != 0 THEN
      On_ExecSqlError(dbf_connid);
    END IF;
    ROLLBACK;
  END;
  EXEC_SQL.CLOSE_CURSOR(dbf_connid, dbf_cursor);
  EXEC_SQL.CLOSE_CONNECTION(dbf_connid);  -- закрытие соединения
  TEXT_IO.PUT(log_file,TO_CHAR(SYSDATE,'DD.MM.IYYY HH24:MI:SS'));
--  TEXT_IO.FCLOSE(log_file);
END;

-- сравочник собственников в/ц
PROCEDURE types IS
  dbf_cursor EXEC_SQL.CursType;
  ignore     PLS_INTEGER      ;

  nom       NUMBER       ;
  name      VARCHAR2(35) ;
  CURSOR exists_VagSobs ( param NUMBER ) IS 
    SELECT id FROM types WHERE id_dbf=param;
  lid NUMBER;
BEGIN
--	log_file := TEXT_IO.FOPEN(lPathLog || 'Num_Tip.log','a');
	TEXT_IO.NEW_LINE(log_file);
	TEXT_IO.PUT(log_file,TO_CHAR(SYSDATE,'DD.MM.IYYY HH24:MI:SS'));
-- ODBC - соединение с таблицами DBF
  dbf_connid := EXEC_SQL.OPEN_CONNECTION('@ODBC:VFP');
  dbf_connect := 1;
  dbf_cursor := EXEC_SQL.OPEN_CURSOR(dbf_connid);
  BEGIN
    EXEC_SQL.PARSE(dbf_connid, dbf_cursor, 
      'SELECT nom,name FROM ' || TovPrDbf || 'types');
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 1, nom);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 2, name, 35);
    ignore := EXEC_SQL.EXECUTE(dbf_connid, dbf_cursor);
    WHILE EXEC_SQL.FETCH_ROWS(dbf_connid, dbf_cursor) > 0 LOOP
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor,  1, nom);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor,  2, name);
      OPEN exists_VagSobs (nom);
      FETCH exists_VagSobs INTO lid;
      IF exists_VagSobs%FOUND THEN
      	UPDATE types SET id=nom, name=name, id_dbf=nom WHERE id=lid;
      ELSE
      	INSERT INTO types (id,name,id_dbf) VALUES (nom,name,nom);
      END IF;
      CLOSE exists_VagSobs;
    END LOOP;
    COMMIT;
  EXCEPTION WHEN EXEC_SQL.PACKAGE_ERROR THEN 
    IF EXEC_SQL.LAST_ERROR_CODE(dbf_connid) != 0 THEN
      On_ExecSqlError(dbf_connid);
    END IF;
    ROLLBACK;
  END;
  EXEC_SQL.CLOSE_CURSOR(dbf_connid, dbf_cursor);
  EXEC_SQL.CLOSE_CONNECTION(dbf_connid);  -- закрытие соединения
  TEXT_IO.PUT(log_file,TO_CHAR(SYSDATE,'DD.MM.IYYY HH24:MI:SS'));
--  TEXT_IO.FCLOSE(log_file);
END;

-- справочник типов в/ц
PROCEDURE num_tip IS
  dbf_cursor EXEC_SQL.CursType;
  ignore     PLS_INTEGER      ;

  num_cist NUMBER;
  tip      VARCHAR2(4);
  wes      NUMBER;
  tipc     NUMBER;
  kod_npr  VARCHAR2(5);
  CURSOR exists_vag ( param VARCHAR2 ) IS 
    SELECT num_transp FROM num_tip WHERE num_transp=param;
  lnum_transp VARCHAR2(9);
BEGIN
--	log_file := TEXT_IO.FOPEN(lPathLog || 'Num_Tip.log','a');
	TEXT_IO.NEW_LINE(log_file);
	TEXT_IO.PUT(log_file,TO_CHAR(SYSDATE,'DD.MM.IYYY HH24:MI:SS'));
-- ODBC - соединение с таблицами DBF
  dbf_connid := EXEC_SQL.OPEN_CONNECTION('@ODBC:VFP');
  dbf_connect := 1;
  dbf_cursor := EXEC_SQL.OPEN_CURSOR(dbf_connid);
  BEGIN
-- типы вагонов
    EXEC_SQL.PARSE(dbf_connid, dbf_cursor, 
      'SELECT num_cist,tip,wes FROM ' || TovPrDbf || 'num_tip');
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 1, num_cist);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 2, tip, 4);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 3, wes);
    ignore := EXEC_SQL.EXECUTE(dbf_connid, dbf_cursor);
    WHILE false and EXEC_SQL.FETCH_ROWS(dbf_connid, dbf_cursor) > 0 LOOP
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor,  1, num_cist);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor,  2, tip);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor,  3, wes);
      OPEN exists_vag (TO_CHAR(num_cist));
      FETCH exists_vag INTO lnum_transp;
      IF exists_vag%FOUND THEN
      	UPDATE num_tip SET tip=tip, wes=wes WHERE num_transp=lnum_transp;
      ELSE
      	INSERT INTO num_tip (num_transp,tip,wes) VALUES (num_cist,tip,wes);
      END IF;
      CLOSE exists_vag;
    END LOOP;
    COMMIT;
-- собственники вагонов
    EXEC_SQL.PARSE(dbf_connid, dbf_cursor, 
      'SELECT num_cist,tipc FROM ' || TovPrDbf || 'tip_cist');
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 1, num_cist);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 2, tipc);
    ignore := EXEC_SQL.EXECUTE(dbf_connid, dbf_cursor);
    WHILE false and EXEC_SQL.FETCH_ROWS(dbf_connid, dbf_cursor) > 0 LOOP
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor,  1, num_cist);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor,  2, tipc);
      OPEN exists_vag (TO_CHAR(num_cist));
      FETCH exists_vag INTO lnum_transp;
      IF exists_vag%FOUND THEN
      	UPDATE num_tip SET types_id=tipc WHERE num_transp=lnum_transp;
      ELSE
      	INSERT INTO num_tip (num_transp,types_id) VALUES (num_cist,tipc);
      END IF;
      CLOSE exists_vag;
    END LOOP;
    COMMIT;
-- выделенные вагоны под продукты
    EXEC_SQL.PARSE(dbf_connid, dbf_cursor, 
      'SELECT num_cist,kod_npr FROM ' || TovPrDbf || 'excl_pro');
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 1, num_cist);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 2, kod_npr, 5);
    ignore := EXEC_SQL.EXECUTE(dbf_connid, dbf_cursor);
    WHILE EXEC_SQL.FETCH_ROWS(dbf_connid, dbf_cursor) > 0 LOOP
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor,  1, num_cist);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor,  2, kod_npr);
      OPEN exists_vag (TO_CHAR(num_cist));
      FETCH exists_vag INTO lnum_transp;
      IF exists_vag%FOUND THEN
      	UPDATE num_tip SET prod_id=kod_npr WHERE num_transp=lnum_transp;
      ELSE
      	INSERT INTO num_tip (num_transp,prod_id) VALUES (num_cist,kod_npr);
      END IF;
      CLOSE exists_vag;
    END LOOP;
    COMMIT;
    
  EXCEPTION WHEN EXEC_SQL.PACKAGE_ERROR THEN 
    IF EXEC_SQL.LAST_ERROR_CODE(dbf_connid) != 0 THEN
      On_ExecSqlError(dbf_connid);
    END IF;
    ROLLBACK;
  END;
  EXEC_SQL.CLOSE_CURSOR(dbf_connid, dbf_cursor);
  EXEC_SQL.CLOSE_CONNECTION(dbf_connid);  -- закрытие соединения
  TEXT_IO.PUT(log_file,TO_CHAR(SYSDATE,'DD.MM.IYYY HH24:MI:SS'));
--  TEXT_IO.FCLOSE(log_file);
END;

PROCEDURE ora_id_dbf IS
BEGIN
	sinhid(0, 'RAZNAR_RW', 'ID', 'C:\TOV_PR\ARHIV\RAZNAR', 'ORA_ID');
END;

PROCEDURE On_ExecSqlError (ConnId IN EXEC_SQL.ConnType) IS
BEGIN
	TEXT_IO.PUT_LINE(log_file,'ERROR (' || 
        TO_CHAR(EXEC_SQL.LAST_ERROR_CODE(ConnId)) || 
        ' ' || EXEC_SQL.LAST_ERROR_MESG(ConnId) || ')');
END;

PROCEDURE pasport ( lBegDate IN DATE ) IS
  dbf_cursor_zagsert EXEC_SQL.CursType;
  dbf_cursor_qualsert EXEC_SQL.CursType;
  ignore     PLS_INTEGER;

  sql_string VARCHAR2(200);
  nser       VARCHAR2(15);
  nins       VARCHAR2(12);
  dins       DATE;
  kodser     VARCHAR2(9);
  dokum      NUMBER;
  kod_npr    VARCHAR2(5);
  gost       VARCHAR2(30);
  m_res      NUMBER;
  mesto      NUMBER;
  export     NUMBER;
  kod_p      NUMBER;
  kod_last   NUMBER;
  qual       VARCHAR2(12);

  CURSOR exists_zagsert ( param VARCHAR2 ) IS 
    SELECT id FROM zagsert WHERE id_dbf=param;
  lid_zag NUMBER;
  CURSOR exists_qualsert ( lzagsert_id NUMBER, lkod_p NUMBER, lkod_last NUMBER ) IS
    SELECT  b.id, a.qual FROM qualsert a, kodifika b WHERE a.kodifika_id = b.id
      AND a.zagsert_id = lzagsert_id 
      AND (b.kod_p = lkod_p AND lkod_p != 0
       OR b.kod_last = lkod_last AND lkod_last != 0);
  lqual_rec exists_qualsert%ROWTYPE;
  CURSOR cur_kodifika (lkod_p NUMBER, lkod_last NUMBER) IS
    SELECT id FROM kodifika WHERE kod_p = lkod_p AND lkod_p != 0
       OR kod_last = lkod_last AND lkod_last != 0;
  lid_kodifika NUMBER;
  
BEGIN
  dbf_connid := EXEC_SQL.OPEN_CONNECTION('@ODBC:VFP');
  dbf_cursor_zagsert := EXEC_SQL.OPEN_CURSOR(dbf_connid);
  dbf_cursor_qualsert := EXEC_SQL.OPEN_CURSOR(dbf_connid);
  BEGIN
	  IF lBegDate=NULL THEN
	    sql_string := 'SELECT nser,nins,dins,kodser,dokum,kod_npr,gost,m_res,mesto,export
 FROM ' || TovPrDbf || 'zagsert';
	  ELSE
	    sql_string := 'SELECT nser,nins,dins,kodser,dokum,kod_npr,gost,m_res,mesto,export
 FROM ' || TovPrDbf || 'zagsert WHERE dins >={' || TO_CHAR(lBegDate,'MM.DD.YYYY') || '}';
	  END IF;
    EXEC_SQL.PARSE(dbf_connid, dbf_cursor_zagsert, sql_string);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor_zagsert, 1, nser, 15);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor_zagsert, 2, nins, 12);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor_zagsert, 3, dins);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor_zagsert, 4, kodser, 9);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor_zagsert, 5, dokum);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor_zagsert, 6, kod_npr, 5);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor_zagsert, 7, gost, 30);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor_zagsert, 8, m_res);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor_zagsert, 9, mesto);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor_zagsert, 10, export);
    ignore := EXEC_SQL.EXECUTE(dbf_connid, dbf_cursor_zagsert);

    EXEC_SQL.PARSE(dbf_connid, dbf_cursor_qualsert, 
      'SELECT kod_p,kod_last,qual FROM ' || TovPrDbf || 'qualsert WHERE kod=:kodser 
AND !EMPTY(qual)');
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor_qualsert, 1, kod_p);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor_qualsert, 2, kod_last);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor_qualsert, 3, qual, 12);
    WHILE EXEC_SQL.FETCH_ROWS(dbf_connid, dbf_cursor_zagsert) > 0 LOOP
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor_zagsert,  1, nser);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor_zagsert,  2, nins);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor_zagsert,  3, dins);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor_zagsert,  4, kodser);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor_zagsert,  5, dokum);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor_zagsert,  6, kod_npr);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor_zagsert,  7, gost);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor_zagsert,  8, m_res);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor_zagsert,  9, mesto);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor_zagsert, 10, export);
      OPEN exists_zagsert (kodser);
      FETCH exists_zagsert INTO lid_zag;
      IF exists_zagsert%FOUND THEN
      	UPDATE zagsert SET nser=nser, nins=nins, dins=dins, id_dbf=kodser,
      	  dokum=dokum, prod_id=kod_npr, gost=gost, m_res=m_res, mesto=mesto,
      	  export=export WHERE id=lid_zag;

        EXEC_SQL.BIND_VARIABLE(dbf_connid, dbf_cursor_qualsert,
              ':kodser', kodser);
        ignore := EXEC_SQL.EXECUTE(dbf_connid, dbf_cursor_qualsert);
        WHILE EXEC_SQL.FETCH_ROWS(dbf_connid, dbf_cursor_qualsert) > 0 LOOP
          EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor_qualsert, 1, kod_p);
          EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor_qualsert, 2, kod_last);
          EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor_qualsert, 3, qual);
    	    OPEN exists_qualsert (lid_zag, kod_p, kod_last);
    	    FETCH exists_qualsert INTO lqual_rec;
     	    IF exists_qualsert%FOUND THEN
     	    	IF RTRIM(lqual_rec.qual) != RTRIM(qual) THEN
     	  	    UPDATE qualsert SET qual = lqual_rec.qual 
     	  	      WHERE zagsert_id = lid_zag AND kodifika_id = lqual_rec.id;
     	  	  END IF;
   	    	ELSE
     	      OPEN cur_kodifika ( kod_p, kod_last );
     	      FETCH cur_kodifika INTO lid_kodifika;
     	      IF cur_kodifika%FOUND THEN
        	  	INSERT INTO qualsert (zagsert_id,kodifika_id,qual) 
        	  	  VALUES (lid_zag,lid_kodifika,qual);
     	      END IF;
     	      CLOSE cur_kodifika;
   	    	END IF;
   	    	CLOSE exists_qualsert;
     	  END LOOP;
      ELSE
        SELECT zagsert_seq.nextval INTO lid_zag FROM dual;
      	INSERT INTO zagsert (id,nser,nins,dins,id_dbf,dokum,prod_id,gost,m_res,
      	  mesto,export) VALUES (lid_zag,nser,nins,dins,kodser,dokum,kod_npr,gost,m_res,
      	  mesto,export);
        EXEC_SQL.BIND_VARIABLE(dbf_connid, dbf_cursor_qualsert,
          ':kodser', kodser);
        ignore := EXEC_SQL.EXECUTE(dbf_connid, dbf_cursor_qualsert);
        WHILE EXEC_SQL.FETCH_ROWS(dbf_connid, dbf_cursor_qualsert) > 0 LOOP
          EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor_qualsert, 1, kod_p);
          EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor_qualsert, 2, kod_last);
          EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor_qualsert, 3, qual);
   	      OPEN cur_kodifika ( kod_p, kod_last );
   	      FETCH cur_kodifika INTO lid_kodifika;
   	      IF cur_kodifika%FOUND THEN
       	  	INSERT INTO qualsert (zagsert_id,kodifika_id,qual) 
       	  	  VALUES (lid_zag,lid_kodifika,qual);
   	      END IF;
   	      CLOSE cur_kodifika;
     	  END LOOP;
      END IF;
      CLOSE exists_zagsert;
    END LOOP;
    COMMIT;
  EXCEPTION WHEN EXEC_SQL.PACKAGE_ERROR THEN 
    IF EXEC_SQL.LAST_ERROR_CODE(dbf_connid) != 0 THEN
      On_ExecSqlError(dbf_connid);
    END IF;
    ROLLBACK;
  END;
  EXEC_SQL.CLOSE_CURSOR(dbf_connid, dbf_cursor_qualsert);
  EXEC_SQL.CLOSE_CURSOR(dbf_connid, dbf_cursor_zagsert);
  EXEC_SQL.CLOSE_CONNECTION(dbf_connid);  -- закрытие соединения
END;

PROCEDURE kodifika IS
  dbf_cursor EXEC_SQL.CursType;
  ignore     PLS_INTEGER      ;

  kod_p      NUMBER;
  kod_last   NUMBER;
  name_r     VARCHAR2(50);
  name_e     VARCHAR2(50);
  unut_e     VARCHAR2(10);
  unut_r     VARCHAR2(10);
  field_type VARCHAR2(1);
  field_len  NUMBER;
  field_dec  NUMBER;

  CURSOR exists_rec ( param1 NUMBER, param2 NUMBER ) IS 
    SELECT id FROM kodifika WHERE param1!=0 AND kod_p=param1  OR param2!=0 AND kod_last=param2;
  lid NUMBER;
  
BEGIN
  dbf_connid := EXEC_SQL.OPEN_CONNECTION('@ODBC:VFP');
  dbf_cursor := EXEC_SQL.OPEN_CURSOR(dbf_connid);
  BEGIN
    EXEC_SQL.PARSE(dbf_connid, dbf_cursor, 
      'SELECT kod_p,kod_last,name_r,name_e,unut_e,unut_r,field_type,field_len,field_dec
 FROM ' || TovPrDbf || 'kodifika');
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 1, kod_p);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 2, kod_last);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 3, name_r, 50);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 4, name_e, 50);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 5, unut_e, 10);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 6, unut_r, 10);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 7, field_type, 1);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 8, field_len);
    EXEC_SQL.DEFINE_COLUMN(dbf_connid, dbf_cursor, 9, field_dec);
    ignore := EXEC_SQL.EXECUTE(dbf_connid, dbf_cursor);
    WHILE EXEC_SQL.FETCH_ROWS(dbf_connid, dbf_cursor) > 0 LOOP
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor,  1, kod_p);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor,  2, kod_last);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor,  3, name_r);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor,  4, name_e);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor,  5, unut_e);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor,  6, unut_r);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor,  7, field_type);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor,  8, field_len);
      EXEC_SQL.COLUMN_VALUE(dbf_connid, dbf_cursor,  9, field_dec);
      OPEN exists_rec (kod_p,kod_last);
      FETCH exists_rec INTO lid;
      IF exists_rec%FOUND THEN
      	UPDATE kodifika SET kod_p=kod_p, kod_last=kod_last, name_r=name_r, name_e=name_e,
      	  unut_e=unut_e, unut_r=unut_r, field_type=field_type, field_len=field_len,
      	  field_dec=field_dec WHERE id=lid;
      ELSE
      	INSERT INTO kodifika (kod_p,kod_last,name_r,name_e,unut_e,unut_r,field_type,
      	  field_len,field_dec) VALUES (kod_p,kod_last,name_r,name_e,unut_e,unut_r,field_type,
      	  field_len,field_dec);
      END IF;
      commit;
      CLOSE exists_rec;
    END LOOP;
    COMMIT;
  EXCEPTION WHEN EXEC_SQL.PACKAGE_ERROR THEN 
    IF EXEC_SQL.LAST_ERROR_CODE(dbf_connid) != 0 THEN
      On_ExecSqlError(dbf_connid);
    END IF;
    ROLLBACK;
  END;
  EXEC_SQL.CLOSE_CURSOR(dbf_connid, dbf_cursor);
  EXEC_SQL.CLOSE_CONNECTION(dbf_connid);  -- закрытие соединения
END;

END;