*:*****************************************************************************
*:
*: 		Process : ADM_SPR.PRG
*:		Descript: Обновление справочников
*:		Status  : PRIVATE
*:		Call    : !raznew.prg
*:
*:*****************************************************************************
DO sprav WITH 'predpr'
DO sprav WITH 'pred_st'
DO sprav WITH 'gdor'
DO sprav WITH 'region'
DO sprav WITH 'stan'
DO sprav WITH 'states'
DO sprav WITH 'vetka'
RETURN

PROCEDURE Sprav
PARAMETER m.alias

m.alias = UPPER(m.alias)
m.newalias = [NEW] + m.alias
IF FILE(gNstBoxTov + m.alias + '.dbf')
	WAIT CLEAR
	WAIT [ Process...] + CHR(13);
		+ [ Обновление файла ] + m.alias + [.DBF.] WINDOW NOWAIT
	USE (gNstBoxTov + m.alias) EXCLUSIVE IN 0 ALIAS &newalias
	USE (gTovPrDbf + m.alias) ORDER TAG kod IN 0 ALIAS &alias
	SELECT &newalias
	SCAN
   		SCATTER MEMVAR
   		IF UPPER(alias) = 'PRED_ST'
   			m.kod = STR(m.kod)+STR(m.kst)
   		ENDIF
   		SELECT &alias
   		IF !SEEK(m.kod)
   			APPEND BLANK
   			GATHER MEMVAR
   		ELSE
	   		IF UPPER(alias) = 'STAN'
   				m.oldrast = &alias->rast
	   		ENDIF
   			GATHER MEMVAR
   			IF UPPER(alias) = 'STAN' AND &alias->tvk # 'T'
   				REPLACE rast WITH m.oldrast
   			ENDIF
   		ENDIF
   		
   		SELECT &newalias
	ENDSCAN
	USE IN &newalias
	USE IN &alias
	WAIT CLEAR
ENDIF
RETURN