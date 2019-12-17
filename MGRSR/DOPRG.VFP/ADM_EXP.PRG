*:******************************************************************
*:
*:		Process : ADM_EXP.PRG
*:		Descript: Подготовка файлов по экспорту для передачи
*:		Status  : PRIVATE
*:		Call	: !admrask.prg / sendrask.spr
*:      Is ready for VFP?  - READY
*:
*:******************************************************************
*DO F:\DBA\MGRSR\DOPRG.VFP\config.prg

WAIT [Process...] + CHR(13);
	+[Подготовка файлов по экспорту.] WINDOW NOWAIT

USE (gExportDbf + 'gtd') IN 0 ALIAS gtd0
SELECT * FROM gtd0 INTO TABLE (gPathTemp + 'gtd');
	WHERE !DELETED()
COPY TO (gNstOut + 'gtd') TYPE FOX2X
USE
USE IN gtd0
DELETE FILE (gPathTemp + 'gtd.dbf')

USE (gExportGui + 'country') IN 0 ALIAS country0
SELECT * FROM country0 INTO TABLE (gPathTemp + 'country');
	WHERE !DELETED()
COPY TO (gNstOut + 'country') TYPE FOX2X
USE
USE IN country0
DELETE FILE (gPathTemp + 'country.dbf')

USE (gExportGui + 'exped') IN 0 ALIAS exped0
SELECT * FROM exped0 INTO TABLE (gPathTemp + 'exped');
	WHERE !DELETED()
COPY TO (gNstOut + 'exped') TYPE FOX2X
USE
USE IN exped0
DELETE FILE (gPathTemp + 'exped.dbf')

USE (gExportGui + 'exporter') IN 0 ALIAS exporter0
SELECT * FROM exporter0 INTO TABLE (gPathTemp + 'exporter');
	WHERE !DELETED()
COPY TO (gNstOut + 'exporter') TYPE FOX2X
USE
USE IN exporter0
DELETE FILE (gPathTemp + 'exporter.dbf')

USE (gExportGui + 'gdor') IN 0 ALIAS gdor0
SELECT * FROM gdor0 INTO TABLE (gPathTemp + 'gdor');
	WHERE !DELETED()
COPY TO (gNstOut + 'gdor') TYPE FOX2X
USE
USE IN gdor0
DELETE FILE (gPathTemp + 'gdor.dbf')

USE (gExportGui + 'importer') IN 0 ALIAS importer0
SELECT * FROM importer0 INTO TABLE (gPathTemp + 'importer');
	WHERE !DELETED()
COPY TO (gNstOut + 'importer') TYPE FOX2X
USE
USE IN importer0
DELETE FILE (gPathTemp + 'importer.dbf')

USE (gExportGui + 'kontrakt') IN 0 ALIAS kontrakt0
SELECT * FROM kontrakt0 INTO TABLE (gPathTemp + 'kontrakt');
	WHERE !DELETED()
COPY TO (gNstOut + 'kontrakt') TYPE FOX2X
USE
USE IN kontrakt0
DELETE FILE (gPathTemp + 'kontrakt.dbf')

USE (gExportGui + 'stan_naz') IN 0 ALIAS stan_naz0
SELECT * FROM stan_naz0 INTO TABLE (gPathTemp + 'stan_naz');
	WHERE !DELETED()
COPY TO (gNstOut + 'stan_naz') TYPE FOX2X
USE
USE IN stan_naz0
DELETE FILE (gPathTemp + 'stan_naz.dbf')

USE (gExportGui + 'stan_pog') IN 0 ALIAS stan_pog0
SELECT * FROM stan_pog0 INTO TABLE (gPathTemp + 'stan_pog');
	WHERE !DELETED()
COPY TO (gNstOut + 'stan_pog') TYPE FOX2X
USE
USE IN stan_pog0
DELETE FILE (gPathTemp + 'stan_pog.dbf')

USE (gExportGui + 'vetka') IN 0 ALIAS vetka0
SELECT * FROM vetka0 INTO TABLE (gPathTemp + 'vetka');
	WHERE !DELETED()
COPY TO (gNstOut + 'vetka') TYPE FOX2X
USE
USE IN vetka0
DELETE FILE (gPathTemp + 'vetka.dbf')
WAIT [Подготовка файлов по экспорту завершена.] WINDOW TIMEOUT(1)
RETURN