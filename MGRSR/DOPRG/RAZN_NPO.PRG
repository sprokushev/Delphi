WAIT [Обработка файла RAZN_NPO.DBF...] WINDOW NOWAIT
USE (gNstBoxTov + 'razn_npo') IN 0 ALIAS razn_npo0
IF RECCOUNT('razn_npo0') > 0
	USE (gTovPrDbf + 'razn_npo') ORDER nom_zdn IN 0 ALIAS razn_npo
	SELECT razn_npo0
	SCAN
		SCATTER MEMVAR
		SELECT razn_npo
		IF !SEEK(razn_npo0.nom_zdn,'razn_npo')
			APPEND BLANK
		ENDIF
		GATHER MEMVAR
		SELECT razn_npo0
	ENDSCAN
	USE IN razn_npo
ENDIF
USE IN razn_npo0
WAIT CLEAR