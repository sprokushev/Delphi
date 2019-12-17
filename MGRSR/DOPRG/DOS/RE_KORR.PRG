*** Процедура приема-разноски откорректированных данных по отгрузке

PRIVATE m.d_pak, m.t_pak

* Фиксируем время получения
m.d_pak=DATE()
m.t_pak=TIME()

WAIT 'Приём файла корректировок отгрузок RE_KORR.DBF... ' WINDOW NOWAIT
IF !FILE(gInRe_Msk+'RE_KORR.DBF')
	WAIT 'Нет файла корректировок' WINDOW TIMEOUT 1
	RETURN
ENDIF

SELECT 0
USE (gInRe_Msk+'RE_KORR.DBF') ALIAS source
USE (gTovPrArh+'REESTR.DBF') ALIAS arh ORDER kod IN 0
USE (gTovPrDbf+'REESTR_D.DBF') ALIAS cur ORDER kod IN 0

*** Раскомментировать после добавления полей DATE_BEG & REE_PRIZ
*USE (gTovPrArh+'REESTR_S.DBF') ALIAS arh_s ORDER kod IN 0

SCAN
  IF SEEK(source.kod,'arh') AND source.tip_otgr # 2
  	SELECT arh
  	REPLACE date_beg WITH source.date_beg, ree_priz WITH source.ree_priz
  ENDIF
*  IF SEEK(source.kod,'arh_s') AND source.tip_otgr = 2
*  	SELECT arh_s
*  	REPLACE date_beg WITH source.date_beg, ree_priz WITH source.ree_priz
*  ENDIF
  IF SEEK(source.kod,'cur') AND source.tip_otgr # 2
  	SELECT cur
  	REPLACE date_beg WITH source.date_beg, ree_priz WITH source.ree_priz
  ENDIF
  SELECT source
ENDSCAN

USE IN source
USE IN arh
*USE IN arh_s
USE IN cur
DELETE FILE(gInRe_Msk+'RE_KORR.DBF')
WAIT 'OK !' WINDOW TIMEOUT 1
RETURN
