*обработчик запросов для московских кодограмм
PRIVATE mas_dbf,lenmas,i,name_dbf,stor_coll,path_prg;
        stor_sele,path_dbf,path_ask,path_ans,flg_asn,flg_tmail,stor_safe,fi
PRIVATE m.name_rezult,use_ask,use_tip
DIMENSION mas_dbf(1)

path_dbf='f:\svodka\moscow\dbf\'           &&Справочник кодограмм
path_ask='f:\svodka\moscow\boxin\'         &&база вопроса
path_ans='f:\svodka\moscow\boxout\'        &&бокс ответа
flg_ans=gTMFlags + 'answer.t-m'          &&флаг готовности ответа
flg_tmail=gTMFlags+'asknbbus.t-m'        &&флаг архивации ответа tmail-ом
path_prg=gPathDoPrg                      &&процедуры кодограмм

DO WHILE FILE(flg_tmail) &&не формировать если идет процесс архивации
  WAIT "Идет процесс архивации кодограмм T_MAIL'ом !!!" WINDOW TIMEOUT 5
ENDDO
IF FILE(flg_ans)    &&удалить флаг готовновти ответа
  DELETE FILE(flg_ans)
ENDIF

stor_safe=SET('SAFETY')
SET SAFETY OFF

WAIT 'Формирование заготовок кодограмм' WINDOW NOWAIT
stor_sele=SELECT()

IF USED('KODOGRAM')
  USE IN kodogram
ENDIF
SELECT 0
USE (path_dbf+'KODOGRAM') ORDER kodkg

IF USED('TIP')
  USE IN tip
ENDIF
USE (path_dbf+'TIP') ORDER tip IN 0
SET RELATION TO tip INTO tip

IF FILE(path_ask+'ASKNB.DBF')
  IF USED('ASKNB')
    SELECT asknb
    use_ask=.F.
  ELSE
    SELECT 0
    USE (path_ask+'ASKNB')
    use_ask=.T.
  ENDIF
ENDIF

SET RELATION TO kodkg INTO kodogram

m.name_rezult = ''

SCAN
  DO CASE
    CASE kodogram.paramcount=0
      DO (path_prg+ALLTRIM(kodogram.prgname))
    CASE kodogram.paramcount=1
      DO (path_prg+ALLTRIM(kodogram.prgname)) WITH bdate
    CASE kodogram.paramcount=2
      DO (path_prg+ALLTRIM(kodogram.prgname)) WITH bdate,edate
  ENDCASE
  IF FILE(m.gPathTemp+m.name_rezult+'.'+tip.extension)
    COPY FILE (m.gPathTemp+m.name_rezult+'.'+tip.extension);
           TO (path_ans+m.name_rezult+'.'+tip.extension)
    DELETE FILE (m.gPathTemp+m.name_rezult+'.'+tip.extension)
    IF FILE(m.gPathTemp+m.name_rezult+'.VTU')
      COPY FILE (m.gPathTemp+m.name_rezult+'.VTU');
             TO (path_ans+m.name_rezult+'.VTU')
      DELETE FILE (m.gPathTemp+m.name_rezult+'.'+'VTU')
    ENDIF
    REPLACE filename WITH m.name_rezult
  ENDIF
ENDSCAN

USE IN asknb
USE IN kodogram
USE IN tip

COPY FILE (path_ask+'ASKNB.DBF') TO (path_ans+'ASKNB.DBF')
DELETE FILE (path_ask+'ASKNB.DBF')
*справочники
*Продукт
SELECT kod_10,naim_pr;
  FROM f:\tov_pr\dbf\prod;
  WHERE !EMPTY(kod_10);
  INTO TABLE (path_ans+'PROD')
USE
USE IN prod
*Собственник
SELECT kod,naim,naim_k,kod_inn,pnp98;
  FROM f:\uchet\dbf\sobstv;
  INTO TABLE (path_ans+'SOBSTV')
USE
USE IN sobstv
SELECT (stor_sele)
WAIT CLEAR
i=FCREATE(flg_ans)
IF i#-1
  =FCLOSE(i)
ENDIF

SET SAFETY &stor_safe
RETURN
