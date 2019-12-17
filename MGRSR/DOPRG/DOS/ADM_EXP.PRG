*:******************************************************************
*:
*:		Process : ADM_EXP.PRG
*:		Descript: Подготовка файлов по экспорту для передачи
*:		Status  : PRIVATE
*:		Call	: !admrask.prg / sendrask.spr
*:
*:******************************************************************
WAIT [Process...] + CHR(13);
	+[Подготовка файлов по экспорту.] WINDOW NOWAIT

USE (gExportDbf + 'gtd') IN 0 ALIAS gtd0
SELECT * FROM gtd0 INTO TABLE (gNstOut + 'gtd');
	WHERE !DELETED()
USE
USE IN gtd0

USE (gExportGui + 'country') IN 0 ALIAS country0
SELECT * FROM country0 INTO TABLE (gNstOut + 'country');
	WHERE !DELETED()
USE
USE IN country0

USE (gExportGui + 'exped') IN 0 ALIAS exped0
SELECT * FROM exped0 INTO TABLE (gNstOut + 'exped');
	WHERE !DELETED()
USE
USE IN exped0

USE (gExportGui + 'exporter') IN 0 ALIAS exporter0
SELECT * FROM exporter0 INTO TABLE (gNstOut + 'exporter');
	WHERE !DELETED()
USE
USE IN exporter0

USE (gExportGui + 'gdor') IN 0 ALIAS gdor0
SELECT * FROM gdor0 INTO TABLE (gNstOut + 'gdor');
	WHERE !DELETED()
USE
USE IN gdor0

USE (gExportGui + 'importer') IN 0 ALIAS importer0
SELECT * FROM importer0 INTO TABLE (gNstOut + 'importer');
	WHERE !DELETED()
USE
USE IN importer0

USE (gExportGui + 'kontrakt') IN 0 ALIAS kontrakt0
SELECT * FROM kontrakt0 INTO TABLE (gNstOut + 'kontrakt');
	WHERE !DELETED()
USE
USE IN kontrakt0

USE (gExportGui + 'stan_naz') IN 0 ALIAS stan_naz0
SELECT * FROM stan_naz0 INTO TABLE (gNstOut + 'stan_naz');
	WHERE !DELETED()
USE
USE IN stan_naz0

USE (gExportGui + 'stan_pog') IN 0 ALIAS stan_pog0
SELECT * FROM stan_pog0 INTO TABLE (gNstOut + 'stan_pog');
	WHERE !DELETED()
USE
USE IN stan_pog0

USE (gExportGui + 'vetka') IN 0 ALIAS vetka0
SELECT * FROM vetka0 INTO TABLE (gNstOut + 'vetka');
	WHERE !DELETED()
USE
USE IN vetka0
WAIT [Подготовка файлов по экспорту завершена.] WINDOW TIMEOUT(1)
RETURN