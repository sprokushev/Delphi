PRIVATE m.d_pak, m.t_pak

* Фиксируем время получения
m.d_pak=DATE()
m.t_pak=TIME()

DO (gPathDoPrg + 'sm_mplan.prg')	&& Прием sm_mplan.dbf

WAIT 'Приём файла заданий реестра RE_MSK.DBF... ' WINDOW NOWAIT
IF !FILE(gInRe_Msk+'RE_MSK.DBF')
	WAIT 'Нет реестра' WINDOW TIMEOUT 1
	RETURN
ENDIF

SELECT 0
USE (gInRe_Msk+'RE_MSK.DBF') ALIAS source
USE (gTovPrArh+'RE_MSK.DBF') ALIAS arh IN 0
USE (gTovPrDbf+'RE_MSK.DBF') ALIAS cur IN 0

SCAN
  SCATTER MEMVAR
  m.dreceive=m.d_pak
  m.treceive=m.t_pak
  SELECT arh
  APPEND BLANK
  GATHER MEMVAR
  SELECT cur
  LOCATE FOR nom_zd=m.nom_zd AND date_beg=m.date_beg
  IF FOUND()
    REPLACE zad_sut WITH zad_sut + m.zad_sut,;
    		ost_sut WITH ost_sut + m.zad_sut
  ELSE
    APPEND BLANK
    m.ost_sut = m.zad_sut
    GATHER MEMVAR
  ENDIF
  SELECT source
  DELETE
ENDSCAN

USE IN source
USE IN arh
USE IN cur

DELETE FILE(gInRe_Msk+'RE_MSK.DBF')

WAIT 'OK !' WINDOW TIMEOUT 1

RETURN
