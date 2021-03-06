*:******************************************************************
*:
*:		Process : operotg.prg
*:		Descript : ������������ ������������ ����� �������� OPEROTG.DBF
*:		Descript : ��ନ஢���� ����⨢���� 䠩�� ���㧮� OPEROTG.DBF
*:		Status  : PRIVATE
*:
*:******************************************************************
IF DAY(DATE())=1	&& ������� ����� ������� ������ ��������;
					   ���������� �� ������� ������
                  && ��ࢮ�� �᫠ ������� ����� ���뫠��;
             ���ଠ�� �� ���� ��ਮ�
	date0 = DATE()-1
ELSE
	date0 = DATE()
ENDIF
PRIVATE m.mm, m.gg
m.mm = alltrim(str(month(date0)))
m.mm = IIF(LEN(m.mm)=1,'0'+m.mm,m.mm)
m.gg = alltr(str(year(date0)))
date1 = CTOD('1/'+m.mm+'/'+m.gg)
date2 = DATE()
DO oper WITH date0,2
RETURN

PROC oper
PARA date0,kol_files    &&2-��������� � OPEROTG � OPERTTO, 1-������ OPERTTO
                        &&2-��������� � OPEROTG � OPERTTO, 1-⮫쪮 OPERTTO
IF TYPE('date0')#'D'
   IF DAY(DATE())=1  && ������� ����� ������� ������ ��������;
                ���������� �� ������� ������
                     && ��ࢮ�� �᫠ ������� ����� ���뫠��;
                ���ଠ�� �� ���� ��ਮ�
     date0 = DATE()-1
   ELSE
     date0 = DATE()
   ENDIF
ENDIF
IF TYPE('kol_files')#'N' OR !INLIST(kol_files,1,2)
   kol_files=1
ENDIF
PRIVATE m.safety, m.deleted, m.file1, m.file2, m.file3
WAIT CLEAR
PRIVATE str_n_dog,str_type_fox
IF _DOS
   WAIT '��ନ஢���� ����⨢���� 䠩�� ���㧮�.'+CHR(13)+;
	 '����� 䠩��:             REESTR_D.DBF...'WINDOW NOWAIT
   str_n_dog='6077/�2-99'
   str_type_fox=''
ELSE
   WAIT '������������ ������������ ����� ��������.'+CHR(13)+;
	 '������ �����:             REESTR_D.DBF...'WINDOW NOWAIT
   str_n_dog='6077/�2-99'
   str_type_fox='TYPE FOX2X'
ENDIF
m.deleted = SET('DELETED')
m.safety = SET('SAFETY')
SET DELETED OFF
SET SAFETY OFF
m.file2 = gPathTemp  + SYS(3)
SELECT;
		kod,;
		kod_fond,;
		kod_plat, ;
		kod_poluch, ;
		kod_potreb,;
		kod_npr, ;
		n_dog, ;
		prizn_mps, ;
		IIF(EMPTY(transp),SPACE(32),transp) AS transp,;
		kol_cist, ;
		date_razn, ;
		dop_cist, ;
		num_cist,;
		date_otgr, ;
		ves, ;
		tip,;
		tipv, ;
		reestr, ;
		kst, ;
		dav, ;
		posred,;
		gtd, ;
		kvet, ;
		vn_transp,;
		error,;
		arh,;
		mesto, ;
		tip_otgr, ;
		kateg_cen, ;
		date_cen, ;
		kod_otgr, ;
		kod_sobs, ;
		kod_post,;
		var_post, ;
		kod_otv, ;
		el_f,;
		summa,;
		ntarif,;
		ndop_tarif,;
		date_kvit,;
		num_kvit,;
		date_gd,;
		rodv,;
		nom_zd,;
		cnt_cist,;
		n_rez,;
		IIF(rodv=2,INT(kol_all),00000) AS kolmest,;
		wes_ed,;
	    num,;
	    pasp,;
	    kod_sgr,;
	    kod_spg,;
		res_akt+'    ' AS res_akt,;
      	nom_zv,;
      	num_rees,;
	    IIF(DELETED(),.T.,.F.) AS del;
	FROM (gTovPrDbf + 'reestr_d');
  INTO TABLE &file2;
	WHERE date_otgr BETWEEN date1 AND date2;
		AND !arh;
		AND error = 0;
		AND !EMPTY(num_cist);
    AND !DELETED() AND AT(str_n_dog,n_dog)=0
USE
IF USED('reestr_d')
	USE IN reestr_d
ENDIF

WAIT CLEAR
IF _DOS
   WAIT '��ନ஢���� ����⨢���� 䠩�� ���㧮�.'+CHR(13)+;
	 '����� 䠩��:               REESTR.DBF...'WINDOW NOWAIT
ELSE
   WAIT '������������ ������������ ����� ��������.'+CHR(13)+;
	 '������ �����:               REESTR.DBF...'WINDOW NOWAIT
ENDIF
m.file1 = gPathTemp  + SYS(3)
SELECT;
		kod,;
		kod_fond,;
		kod_plat, ;
		kod_poluch, ;
		kod_potreb,;
		kod_npr, ;
		n_dog, ;
		prizn_mps, ;
		transp,;
		kol_cist, ;
		date_razn, ;
		dop_cist, ;
		num_cist,;
		date_otgr, ;
		ves, ;
		tip,;
		tipv, ;
		reestr, ;
		kst, ;
		dav, ;
		posred,;
		gtd, ;
		kvet, ;
		error,;
		mesto, ;
		tip_otgr, ;
		kateg_cen, ;
		date_cen, ;
		kod_otgr, ;
		kod_sobs, ;
		kod_post,;
		var_post, ;
		kod_otv, ;
		el_f,;
		summa,;
		ntarif,;
		ndop_tarif,;
		date_kvit,;
		num_kvit,;
		date_gd,;
		rodv,;
	    nom_zd,;
		cnt_cist,;
		n_rez,;
		IIF(rodv=2,INT(kol_all),00000) AS kolmest,;
		wes_ed,;
	    num,;
    	pasp,;
	    kod_sgr,;
	    kod_spg,;
		res_akt+'    ' AS res_akt,;
      	nom_zv,;
      	num_rees,;
	    IIF(DELETED(),.T.,.F.) AS del;
	FROM (gTovPrArh + 'reestr');
	INTO TABLE &file1;
	WHERE date_otgr BETWEEN date1 AND date2;
		AND error = 0;
    AND !DELETED() AND AT(str_n_dog,n_dog)=0

APPEND FROM &file2
DELETE FILE (file2 + '.dbf')
USE
IF USED('reestr')
	USE IN reestr
ENDIF

WAIT CLEAR
IF _DOS
   WAIT '��ନ஢���� ����⨢���� 䠩�� ���㧮�.'+CHR(13)+;
	 '����� 䠩��:             SVIVOZ_O.DBF...'WINDOW NOWAIT
ELSE
   WAIT '������������ ������������ ����� ��������.'+CHR(13)+;
	 '������ �����:             SVIVOZ_O.DBF...'WINDOW NOWAIT
ENDIF
m.file3 = gPathTemp  + SYS(3)
SELECT;
		kod,;
		kod_fond,;
		kod_plat, ;
		kod_poluch, ;
		kod_potreb,;
		kod_npr, ;
		n_dog, ;
		prizn_mps, ;
		transp,;
		kol_cist, ;
		date_razn, ;
		num_cist,;
		date_otgr, ;
		ves, ;
		reestr, ;
		kst, ;
		dav, ;
		posred,;
		gtd, ;
		error,;
		mesto, ;
		tip_otgr, ;
		kateg_cen, ;
		date_cen, ;
		kod_otgr, ;
		kod_sobs, ;
		kod_post,;
		var_post, ;
		kod_otv, ;
		summa,;
		ntarif,;
		ndop_tarif,;
		date_kvit,;
		num_kvit,;
		nom_zd,;
	    0 AS n_rez,;
	    kolmest,;
	    wes_ed,;
	    pasp,;
	    kod_sgr,;
	    kod_spg,;
     kod AS res_akt,;
      rodv,;
      	nom_zv,;
      	num_rees,;
	    IIF(DELETED(),.T.,.F.) AS del;
	FROM (gTovPrArh + 'reestr_s');
	INTO TABLE &file3;
	WHERE date_otgr BETWEEN date1 AND date2;
		AND error = 0;
    AND !DELETED() AND AT(str_n_dog,n_dog)=0
IF FILE(gSvBoxIn + 'svivoz_o.dbf')
	APPEND FROM (gSvBoxIn + 'svivoz_o.dbf')
ENDIF
*USE (gTovPrArh + 'raznar') IN 0 ALIAS razntto ORDER TAG nom_zd AGAIN
*IF USED('razntto')
*   SET RELA TO nom_zd INTO razntto
*   REPL ALL FOR INLIST(tip_otgr,2,6) AND dav#razntto.dav dav WITH razntto.dav
*   USE IN razntto
*ENDIF

USE
IF USED('reestr_s')
   USE IN reestr_s
ENDIF
WAIT CLEAR
IF _DOS
   IF kol_files=2
      WAIT '��ନ஢���� ����⨢���� 䠩�� ���㧮�.'+CHR(13)+;
      '��ନ஢���� 䠩�� ��� ��ࠢ��:   OPEROTG.DBF...'WINDOW NOWAIT
   ELSE
      WAIT WIND NOWAIT '���������� १����...'
   ENDIF
ELSE
   IF kol_files=2
      WAIT '������������ ������������ ����� ��������.'+CHR(13)+;
      '������������ ����� ��� ��������:   OPEROTG.DBF...'WINDOW NOWAIT
   ELSE
      WAIT WIND NOWAIT '���������� ����������...'
   ENDIF
ENDIF
USE &file1 AGAIN
APPEND FROM &file3
DELETE FILE (file3 + '.dbf')

*DO (gPathDoPrg+'nedokum.prg') WITH date1,date2  &&���������� ������, �� �������� ������

*** ����������� � ���� ��� ��������
IF kol_files=2
   COPY TO (gNstVtu + 'operotg.dbf') FOR !del &str_type_fox
   PRIVATE flrun, m.seconds
   flsend = FCREATE(gTMFlags + 'operotg.t-m')
   = FCLOSE(flsend)
ENDIF

m.seconds = SECONDS()
DO WHILE FILE(gOperOtg + 'operotg.not') AND m.sec - m.seconds < 60
	m.sec = SECONDS()
  IF _DOS
     WAIT [�����㦥� 䫠� ]+gOperOtg+[operotg.not. �������� 1 ���...] WINDOW NOWAIT
  ELSE
     WAIT [��������� ���� ]+gOperOtg+[operotg.not. �������� 1 ���...] WINDOW NOWAIT
  ENDIF
ENDDO
DELETE FILE (gOperOtg + 'operotg.not')
flsend = FCREATE(gOperOtg + 'operotg.cop')
= FCLOSE(flsend)
IF kol_files=2
   COPY TO (gOperOtg + m.gg+m.mm+'.dbf') FOR !del &str_type_fox
ENDIF
COPY TO (gOperTTO + m.gg+m.mm+'.dbf') FOR !del &str_type_fox
USE     (gOperTTO + m.gg+m.mm+'.dbf') AGAIN
DELE ALL FOR kod_otgr=8         && ��� ������ ��� ������ ����������
                                && ��� �⤥�� ��� 㡨�� ��६�饭��
USE
DELETE FILE (gOperOtg + 'operotg.cop')

DELETE FILE (file1 + '.dbf')
RELEASE m.flsend, m.seconds

SET SAFETY &safety
SET DELETED &deleted
RETURN
