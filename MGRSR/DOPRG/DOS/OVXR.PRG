PARAMETERS date_kd
PRIVATE name_gramm,name_saldo,use_stats,stor_sele,mass_file,f_date,f_time;
  block,sel_table,stor_dele,stor_noti,stor_safe

old_saldo='f:\uchet\saldomth\sd_m_'+RIGHT(STR(YEAR(date_kd),4),1)+TRANSFORM(MONTH(date_kd),'@L 99')
new_saldo='f:\uchet\saldomth\sd_m_'+RIGHT(STR(YEAR(date_kd+31),4),1)+TRANSFORM(MONTH(date_kd+31),'@L 99')
IF !FILE(new_saldo+'.dbf')
  RETURN
ENDIF
prod_dbf='f:\tov_pr\dbf\prod'
sobs_dbf='f:\uchet\dbf\sobstv'

stor_sele=SELECT()
stor_dele=SET('DELETE')
stor_noti=SET('NOTIFY')
stor_safe=SET('SAFETY')
SET DELETE ON
SET NOTIFY OFF
SET SAFETY OFF

*начало выполнения кодограммы
WAIT CLEAR
WAIT [ Process...] + CHR(13);
  +[ Сообщение ] + 'OVXR' + [ для УИТиС. ] WINDOW NOWAIT

m.name_rezult=TRANSFORM(MONTH(date_kd),'@L 99')+'OVXR11'

DELETE FILE (m.gPathTemp+m.name_rezult+'.dbf')
CREATE TABLE (m.gPathTemp+m.name_rezult);
  (k_nfp C(10),k_sob C(10),kol_kg_b N(11),kol_kg_e N(11))
sel_table=SELECT()

SELECT kod_npr AS k_nfp, STR(kod_sobs,10) AS k_sob,;
       saldo_n*1000 AS kol_kg_b,0 AS kol_kg_e;
  FROM (old_saldo);
  WHERE kod_sobs=32;
  INTO TABLE (m.gPathTemp+'buf2')

USE IN BUF2

SELECT kod_npr+SPACE(5) AS k_nfp, STR(kod_sobs,10) AS k_sob,;
       00000000000 AS kol_kg_b,saldo_n*1000 AS kol_kg_e;
  FROM (new_saldo);
  WHERE kod_sobs=32;
  INTO TABLE (m.gPathTemp+'buf1')

APPEND FROM (m.gPathTemp+'buf2')
DELETE FILE (m.gPathTemp+'buf2.dbf')
USE IN RIGHT(old_saldo,8)
USE IN RIGHT(new_saldo,8)
IF !USED('PROD')
  USE (prod_dbf) ORDER kod IN 0 NOUPDATE
ENDIF
IF !USED('SOBSTV')
  USE (sobs_dbf) ORDER kod IN 0 NOUPDATE
ENDIF
SET RELATION TO ALLTRIM(k_nfp) INTO prod, VAL(k_sob) INTO sobstv
REPLACE ALL k_nfp WITH prod.kod_10, k_sob WITH sobstv.kod_inn

SELECT k_nfp, k_sob,;
    SUM(kol_kg_b) AS kol_kg_b, SUM(kol_kg_e) AS kol_kg_e;
  FROM buf1;
  WHERE !EMPTY(k_nfp) AND !EMPTY(k_sob);
  GROUP BY 1,2;
  HAVING ABS(kol_kg_b)+ABS(kol_kg_e)#0;
  INTO TABLE (m.gPathTemp+'buf')
USE IN buf1
DELETE FILE (m.gPathTemp+'buf1.dbf')
USE IN buf

SELECT (sel_table)
APPEND FROM (m.gPathTemp+'buf') FOR ABS(kol_kg_b)+ABS(kol_kg_e)#0
SELECT prod
SET ORDER TO kod_10
SELECT sobstv
SET ORDER TO kod_inn
SELECT (sel_table)
SET RELATION TO ALLTRIM(k_nfp) INTO prod, k_sob INTO sobstv
REPORT FORM (gReport+'ovxr') NOCONSOLE;
  TO FILE (m.gPathTemp+m.name_rezult+'.VTU')
USE IN prod
USE IN sobstv
DELETE FILE (m.gPathTemp+'buf.dbf')
USE

SELECT (stor_sele)
SET DELETE &stor_dele
SET NOTIFY &stor_noti
SET SAFETY &stor_safe

RETURN
