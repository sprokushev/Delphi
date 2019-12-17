*******************************************************************
*
*	Выделение разнарядки для товарных операторов НПЗ (оформителей)
*   в условиях отсутствия связи по АРЛАНу
*
*******************************************************************
PROCEDURE NPZ_RAZN

= Use0('stan')
= Use0('predpr')

flagnpz = 'F:\NET\T-MAIL\FLAGS\xxx_oz.t-m'

WAIT 'Прием разнарядки : Запрос заданий для НПЗ...' WINDOW NOWAIT
SELECT *;
	FROM raznar0;
	INTO TABLE (gPathTemp + 'razn_npz.dbf');
	WHERE !INLIST(otgr,'ПРИ','ПРС','РЕЗ')
m.rec_npz = _TALLY
USE IN razn_npz
IF m.rec_npz = 0
	DELETE FILE (gPathTemp + 'razn_npz.dbf')
	RETURN
ENDIF
DO WHILE FILE(gBoxNpzTov+'xxx_ozar.t-m')
		&& Флаг T-MAILa - архивация предыдущей разнарядки
	WAIT 'Ждем конца передачи предыдущей разнарядки на НПЗ...' + CHR(13);
		+ 'Флаг F:\NPZ\BOX_OUTR\npz_o.t-m' WINDOW NOWAIT
ENDDO

DELETE FILE &flagnpz
f=FCREATE(gBoxNpzTov+'xxx_ozap.t-m')
IF f#-1
  =FCLOSE(f)
ENDIF

IF FILE(gBoxNpzTov + 'raznar.dbf')
	SELECT 0
	USE (gBoxNpzTov + 'raznar.dbf') ALIAS raznars
	APPEND FROM (gPathTemp + 'razn_npz.dbf')
	USE IN raznars
ELSE
	COPY FILE (gPathTemp + 'razn_npz.dbf') TO (gBoxNpzTov + 'raznar.dbf')
ENDIF
IF FILE(gBoxNpzTov + 'stan.dbf')
	IF FILE(gNstBoxTov + 'stan.dbf')
		SELECT 0
		USE (gBoxNpzTov + 'stan.dbf') ALIAS stans
		APPEND FROM (gNstBoxTov + 'stan.dbf')
		USE IN stans
		RENAME (gBoxNpzTov + 'stan.dbf') TO (gBoxNpzTov + 'stan1.dbf')
		USE (gBoxNpzTov + 'stan1.dbf') IN 0 ALIAS stan1
		SELECT * FROM stan1 INTO TABLE (gBoxNpzTov + 'stan.dbf');
			GROUP BY kod
		USE IN stan1
		USE IN stan
		DELETE FILE (gBoxNpzTov + 'stan1.dbf')
	ENDIF
ELSE
	COPY FILE (gNstBoxTov + 'stan.dbf') TO (gBoxNpzTov + 'stan.dbf')
ENDIF
IF FILE(gBoxNpzTov + 'predpr.dbf')
	IF FILE(gNstBoxTov + 'predpr.dbf')
		SELECT 0
		USE (gBoxNpzTov + 'predpr.dbf') ALIAS predprs
		APPEND FROM (gNstBoxTov + 'predpr.dbf')
		USE IN predprs
		RENAME (gBoxNpzTov + 'predpr.dbf') TO (gBoxNpzTov + 'predpr1.dbf')
		USE (gBoxNpzTov + 'predpr1.dbf') IN 0 ALIAS predpr1
		SELECT * FROM predpr1 INTO TABLE (gBoxNpzTov + 'predpr.dbf');
			GROUP BY kod
		USE IN predpr1
		USE IN predpr
		DELETE FILE (gBoxNpzTov + 'predpr1.dbf')
	ENDIF
ELSE
	COPY FILE (gNstBoxTov + 'predpr.dbf') TO (gBoxNpzTov + 'predpr.dbf')
ENDIF
IF FILE(gBoxNpzTov + 'vetka.dbf')
	IF FILE(gNstBoxTov + 'vetka.dbf')
		SELECT 0
		USE (gBoxNpzTov + 'vetka.dbf') ALIAS vetkas
		APPEND FROM (gNstBoxTov + 'vetka.dbf')
		USE IN vetkas
		RENAME (gBoxNpzTov + 'vetka.dbf') TO (gBoxNpzTov + 'vetka1.dbf')
		USE (gBoxNpzTov + 'vetka1.dbf') IN 0 ALIAS vetka1
		SELECT * FROM vetka1 INTO TABLE (gBoxNpzTov + 'vetka.dbf');
			GROUP BY kod
		USE IN vetka1
		USE IN vetka
		DELETE FILE (gBoxNpzTov + 'vetka1.dbf')
	ENDIF
ELSE
	COPY FILE (gNstBoxTov + 'vetka.dbf') TO (gBoxNpzTov + 'vetka.dbf')
ENDIF

IF FILE(gBoxNpzTov + 'region.dbf')
	DELETE FILE (gBoxNpzTov + 'region.dbf')
ENDIF
COPY FILE (gNstBoxTov + 'region.dbf') TO (gBoxNpzTov + 'region.dbf')

IF FILE(gBoxNpzTov + 'states.dbf')
	DELETE FILE (gBoxNpzTov + 'states.dbf')
ENDIF
COPY FILE (gNstBoxTov + 'states.dbf') TO (gBoxNpzTov + 'states.dbf')

IF FILE(gBoxNpzTov + 'gdor.dbf')
	DELETE FILE (gBoxNpzTov + 'gdor.dbf')
ENDIF
COPY FILE (gNstBoxTov + 'gdor.dbf') TO (gBoxNpzTov + 'gdor.dbf')

IF FILE(gBoxNpzTov + 'nazn_otg.dbf')
	DELETE FILE (gBoxNpzTov + 'nazn_otg.dbf')
ENDIF
IF !USED('naznadd')
	USE (gTovPrDbf + 'nazn_otg') IN 0 ALIAS naznadd AGAIN
ENDIF
SELECT naznadd
COPY TO (gBoxNpzTov + 'nazn_otg.dbf')
USE IN naznadd

IF FILE(gBoxNpzTov + 'prod.dbf')
	DELETE FILE (gBoxNpzTov + 'prod.dbf')
ENDIF
IF !USED('prodadd')
	USE (gTovPrDbf + 'prod') IN 0 ALIAS prodadd AGAIN
ENDIF
SELECT prodadd
COPY TO (gBoxNpzTov + 'prod.dbf')
USE IN prodadd

IF FILE(gBoxNpzTov + 'sobstv.dbf')
	DELETE FILE (gBoxNpzTov + 'sobstv.dbf')
ENDIF
IF !USED('sobadd')
	USE (gUchetDbf + 'sobstv') IN 0 ALIAS sobadd AGAIN
ENDIF
SELECT sobadd
COPY TO (gBoxNpzTov + 'sobstv.dbf') FIELDS kod, naim
USE IN sobadd

*копирование файлов по ЭКСПОРТУ

SELECT 0
USE (gExportDbf+'GTD.DBF')
COPY TO (m.gBoxNpzTov+'GTD.DBF')
USE (m.gExportGui+'EXPED.DBF')
COPY TO (m.gBoxNpzTov+'EXPED.DBF')
USE (m.gExportGui+'EXPORTER.DBF')
COPY TO (m.gBoxNpzTov+'EXPORTER.DBF')
USE (m.gExportGui+'GDOR.DBF')
COPY TO (m.gBoxNpzTov+'GDOR.DBF')
USE (m.gExportGui+'IMPORTER.DBF')
COPY TO (m.gBoxNpzTov+'IMPORTER.DBF')
USE (m.gExportGui+'KONTRAKT.DBF')
COPY TO (m.gBoxNpzTov+'KONTRAKT.DBF')
USE (m.gExportGui+'STAN_NAZ.DBF')
COPY TO (m.gBoxNpzTov+'STAN_NAZ.DBF')
USE (m.gExportGui+'STAN_POG.DBF')
COPY TO (m.gBoxNpzTov+'STAN_POG.DBF')
USE (m.gExportGui+'VETKA.DBF')
COPY TO (m.gBoxNpzTov+'VETKAE.DBF')
USE

DELETE FILE(gBoxNpzTov+'xxx_ozap.t-m')
flag = FCREATE(flagnpz)
= FCLOSE(flag)

RETURN