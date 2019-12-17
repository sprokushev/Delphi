*************************Программа обновления ЖД планов из ВТУ*********

PUSH KEY CLEAR
PRIVATE s_excl,s_exac,s_safe,s_talk,s_dele,s_sysm,s_esca,;
        _mes,_god,dir_plan,naim_plan, str_rez, x,y,d_b,t_b
dir_plan='F:\SVODKA\DISPNB\'
*dir_plan='D:\MYRAB\PLAN_GD\'
IF !FILE(dir_plan+'plan_gd\plan_gd.dbf')
   RETURN
ENDIF
IF USED('plan_gd')
   USE IN plan_gd
ENDIF
USE (dir_plan+'plan_gd\plan_gd') IN 0
s_excl=SET('EXCLU')
Set EXCLU Off
s_exac=SET('EXACT')
SET EXACT OFF
s_safe=SET('SAFE')
SET SAFETY OFF
s_talk=SET('TALK')
SET TALK OFF
s_dele=SET('DELE')
SET DELE ON
s_sysm=SET('SYSMENU')
SET SYSMENU OFF
s_esca=SET('ESCAPE')
SET ESCAPE OFF
str_rez=''
x=0
y=0
d_b=DATE()
t_b=TIME()

IF .F.
   USE f:\tov_pr\dbf\prod order tag kod IN 0 ALIAS prodgd AGAIN
   USE f:\tov_pr\dbf\produkt order tag kod IN 0 ALIAS produgd AGAIN
ENDIF

IF USED('evegd')
   USE IN evegd
ENDIF
IF FILE('F:\DBA\DBF\EVENTS.DBF')
   SELE 0
   USE f:\dba\dbf\events ALIAS evegd AGAIN
   APPE BLANK
   REPL kod WITH SUBSTR(SYS(2015),2), date_b WITH d_b, time_b WITH t_b,;
      kod_proc WITH 12, rezult WITH 'Прием плана не завершен'
ENDIF

SELE plan_gd
LOCA FOR mes>0 AND god>0
IF FOUND()
   _mes=ALLTRIM(STR(mes)) &&Новая версия хранения плана Захаровой
   IF LEN(_mes)<2
      _mes=REPLICATE('0',2-LEN(_mes))+_mes
   ENDIF
   _god=ALLTRIM(STR(god))
   IF LEN(_god)<4
      _god=REPLICATE('0',4-LEN(_god))+_god
   ENDIF
   naim_plan='PE'+_god+_mes
   SELECT * FROM plan_gd INTO TABLE c:\tmp\pl
   COPY TO (dir_plan+naim_plan) TYPE FOX2X
   SUM kol_vag TO x
   SUM tonn    TO y
   USE
   DELE FILE c:\tmp\pl.dbf
   str_rez='План на '+mnth(_mes,_god)+' : '+ALLTRIM(STR(x))+' вагонов, '+ALLTRIM(STR(y))+' тонн.'
ELSE
   str_rez='!!!!Не указан месяц и год плана!!!!'
ENDIF

IF USED('evegd')
   IF !EMPTY(str_rez)
      SELE evegd
      REPL date_e WITH DATE(), time_e WITH TIME(), rezult WITH str_rez
   ENDIF
   USE IN evegd
ENDIF
IF EMPTY(str_rez)
   str_rez='Прием плана не завершен'
ENDIF
SET PRINT TO c:\tmp\1.txt
SET PRINT ON
?d_b,'в',SUBSTR(t_b,1,5),str_rez
SET PRINT OFF
SET PRINT TO
x='! COPY '+dir_plan+'PLAN_GD.LOG C:\TMP\2.TXT'
&x
x='! COPY C:\TMP\2.TXT+C:\TMP\1.TXT '+dir_plan+'PLAN_GD.LOG'
&x
DELE FILE c:\tmp\1.txt
DELE FILE c:\tmp\2.txt

USE IN plan_gd
DELE FILE (dir_plan+'plan_gd\plan_gd.dbf')
DELE FILE (dir_plan+'plan_gd\plan_gd.cdx')
POP KEY
Set EXCLU &s_excl
SET EXACT &s_exac
SET SAFETY &s_safe
SET TALK &s_talk
SET DELE &s_dele
SET SYSMENU &s_sysm
SET ESCAPE &s_esca
IF .F.
   USE IN prodgd
   USE IN produgd
ENDIF.
RETURN

PROC mnth
PARA m,g
PRIVATE s,m1
m1=VAL(m)
DO CASE
   CASE m1=1
        s='Январь '
   CASE m1=2
        s='Февраль '
   CASE m1=3
        s='Март '
   CASE m1=4
        s='Апрель '
   CASE m1=5
        s='Май '
   CASE m1=6
        s='Июнь '
   CASE m1=7
        s='Июль '
   CASE m1=8
        s='Август '
   CASE m1=9
        s='Сентябрь '
   CASE m1=10
        s='Октябрь '
   CASE m1=11
        s='Ноябрь '
   CASE m1=12
        s='Декабрь '
   OTHER
        s='* '
ENDCASE
RETURN s+g+' г.'
