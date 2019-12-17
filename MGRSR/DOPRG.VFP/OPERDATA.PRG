******************************************************************
*
*   Формирование оперативных данных в качестве пакета NAILCH.RAR
*:      Is ready for VFP?  - READY
*
******************************************************************

*** Формирование оперативного файла отгрузок для отправки

DO (gDoVFP + 'adm_otgr.fxp')

*** Формирование "остатков" разнарядки

WAIT 'Формирование "остатков" разнарядки...' WINDOW NOWAIT

SELECT *, 000000.000000 AS zad_msk, 000000.000000 AS ost_msk;
	FROM (gTovPrDbf + 'raznar');
	INTO TABLE (gPathTemp + 'raznar0');
	WHERE !DELETED()
	
*** Выданное задание

SELECT nom_zd, SUM(zad_sut) AS zad_msk FROM (gTovPrDBF + 're_msk');
	INTO CURSOR planzad;
	WHERE  BETWEEN(DATE(), date_beg, date_beg + 1);
		OR BETWEEN(DATE(), date_beg, date_end) GROUP BY nom_zd
	
*** Остаток по заданиям
SELECT ree_dat, nom_zd, ves FROM (gTovPrArh + 'reestr');
	WHERE (BETWEEN(DATE(), date_beg, date_beg + 1);
		OR BETWEEN(DATE(), date_beg, date_end));
		AND !EMPTY(ree_dat);
UNION ALL;
SELECT ree_dat, nom_zd, ves FROM (gTovPrDbf + 'reestr_d');
	WHERE (BETWEEN(DATE(), date_beg, date_beg + 1);
		OR BETWEEN(DATE(), date_beg, date_end));
		AND error = 0 AND !arh AND !DELETED();
		AND !EMPTY(ree_dat);
		INTO CURSOR otgarh
	
SELECT nom_zd, SUM(ves) AS ost_msk INTO CURSOR otgzad;
	FROM otgarh GROUP BY nom_zd
SELECT raznar0
SCAN
	SELECT planzad
	LOCATE FOR nom_zd = raznar0.nom_zd
	IF FOUND('planzad')
		SELECT raznar0
		REPLACE zad_msk WITH planzad.zad_msk, ost_msk WITH planzad.zad_msk
	ENDIF
	SELECT otgzad
	LOCATE FOR nom_zd = raznar0.nom_zd
	IF FOUND('otgzad')
		SELECT raznar0
		REPLACE ost_msk WITH zad_msk-otgzad.ost_msk
	ENDIF
	SELECT raznar0
ENDSCAN

DELETE FILE (gUchBoxSb + 'raznar.dbf')
COPY TO (gUchBoxSb + 'raznar.dbf') TYPE FOX2X
USE IN otgarh
USE IN otgzad
USE IN planzad
USE IN re_msk
USE IN raznar
USE IN reestr
USE IN reestr_d
USE IN raznar0

*** Прочие отгрузки
SELECT 0
USE (gNpzOtgOth + 'otgr') ALIAS otgr1
COPY TO (gUchBoxSb + 'otgr.dbf') WITH CDX TYPE FOX2X
USE IN otgr1
SELECT 0
USE (gTovPrDbf + 'prod') ALIAS prod1 AGAIN
COPY TO (gUchBoxSb + 'prod.dbf') WITH CDX TYPE FOX2X
USE IN prod1
SELECT 0
USE (gTovPrDbf + 'produkt') ALIAS prod1 AGAIN
COPY TO (gUchBoxSb + 'produkt.dbf') WITH CDX TYPE FOX2X
USE IN prod1
yr = YEAR(DATE())
yr0 = IIF(MONTH(DATE())=1,YEAR(DATE())-1,YEAR(DATE()))
mn = MONTH(DATE())
mn0 = IIF(MONTH(DATE())=1,12,MONTH(DATE()))
m.fdir='F:\SVODKA\DISPNB\'
m.fname='SVN_'+SUBSTR(ALLTRIM(STR(yr)),3,2)+IIF(mn<10,'0','')+ALLTRIM(STR(mn))+'.DBF'
m.fname0='SVN_'+SUBSTR(ALLTRIM(STR(yr0)),3,2)+IIF(mn0<10,'0','')+ALLTRIM(STR(mn0))+'.DBF'
m.ffull=m.fdir+m.fname
m.ffull0=m.fdir+m.fname0
IF FILE(m.ffull)
	COPY FILE &ffull TO (gUchBoxSb + m.fname)
ENDIF
IF FILE(m.ffull0)
	COPY FILE &ffull0 TO (gUchBoxSb + m.fname0)
ENDIF
SELECT 0
USE (fdir+'zayavka') ALIAS zz
m.date0=CTOD('1/'+ALLTRIM(STR(mn0))+'/'+ALLTRIM(STR(yr0)))
COPY TO (gUchBoxSb + 'zayavka') FOR date>={1/3/98} AND date<=DATE() WITH CDX TYPE FOX2X
USE IN zz
RETURN