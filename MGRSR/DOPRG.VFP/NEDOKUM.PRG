PARA d_b,d_e               &&процедура дополнения файла отгрузок
                           &&недокументированной информацией по расходу
PRIVATE als,sel,tmpdb,tmpdb1,s_dele
s_dele=SET('DELE')
SET DELE ON
IF TYPE('_g_path_tmp')#'C'
   _g_path_tmp='c:\tmp\'
ENDIF
IF TYPE('d_e')#'D'
   d_e=DATE()
ENDIF
IF TYPE('d_b')#'D'
   d_b=d_e-DAY(d_e)+1
ENDIF
sel=STR(SELECT())
als='a'+SUBSTR(SYS(2015),2)
USE f:\uchet\dbf\akts.dbf ALIAS &als IN 0 AGAIN
tmpdb=_g_path_tmp+SUBSTR(SYS(2015),3)+'.tmp'
SELECT kod_npr,num_akt,kod_sobs,flag_op,var_post,;
       kod_post,date_cen,kod_prin,prizn_mps,;
   0 AS tip_otgr,kol_akt AS ves,kol_akt AS fakt,date_akt AS date_otgr,;
   date_akt AS date_kvit,num1 AS num_kvit;
   FROM &als INTO TABLE &tmpdb;
   WHERE BETWEEN(date_akt,d_b,d_e) AND ssilka=0 AND kod_op=6 AND kod_sobs=32;
         AND INLIST(INT(flag_op),5,4,9)
USE &tmpdb ALIAS vrmals EXCL
tmpdb1=_g_path_tmp+SUBSTR(SYS(2015),3)+'.tmp'
SELECT kod_npr,num_akt,date_akt,kod_prin,kod_op,flag_op,ssilka;
   FROM &als INTO TABLE &tmpdb1;
   WHERE BETWEEN(date_akt,d_b,d_e) AND kod_sdal=32;
         AND INLIST(INT(kod_op),5,4,9)
USE &tmpdb1 ALIAS vrmals1 EXCL
REPL ALL FOR EMPTY(flag_op) flag_op WITH kod_op
INDEX ON DTOS(date_akt)+kod_npr+num_akt+STR(flag_op,4,1) TAG pr
SELE vrmals
SET RELA TO DTOS(date_otgr)+kod_npr+num_akt+STR(flag_op,4,1) INTO vrmals1
SCAN
   IF vrmals1.kod_prin>31
      REPL kod_prin WITH vrmals1.kod_prin
      SELE vrmals1
      DELE
      SELE vrmals
   ELSE
      REPL kod_prin WITH 0
   ENDIF
   IF vrmals1.ssilka=1
      DELE
   ELSE
      DO CASE
      CASE flag_op=4           &&Продажа
           REPL tip_otgr WITH 5
      CASE flag_op=5           &&Давальцы
      CASE flag_op=9.1         &&Отгр ЖД
           REPL tip_otgr WITH 1
      CASE flag_op=9.2         &&Отгр самовывоз
           REPL tip_otgr WITH 2
      CASE flag_op=9.3         &&Отгр водой
           REPL tip_otgr WITH 3
      CASE flag_op=9.4         &&Отгр трубой
           REPL tip_otgr WITH 4
      CASE flag_op=9.5         &&Отгр самовывоз ЖД
           REPL tip_otgr WITH 1
      CASE flag_op=9.6         &&Отгр самовывоз водой
           REPL tip_otgr WITH 3
      OTHER                    &&иначе ЖД
           REPL tip_otgr WITH 1
      ENDCASE
      IF prizn_mps<>3
         REPL prizn_mps WITH 2
      ENDIF
   ENDIF
ENDSCAN
SELE vrmals1
DELE TAG pr
USE
DELE FILE &tmpdb1
USE IN &als

SELE vrmals   &&на всякий случай обнуляем лишнюю информацию
REPL ALL num_akt WITH '',flag_op WITH 0,kod_prin WITH 0
PACK

SELE &sel     &&добавляем в оперативный файл
IF !EMPTY(DBF())
   APPE FROM &tmpdb
ENDIF
USE IN vrmals
DELE FILE &tmpdb
SET DELE &s_dele
