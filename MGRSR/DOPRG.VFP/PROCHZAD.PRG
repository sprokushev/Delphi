PRIVATE root,BoxIn,PathDbf,stor_sele
stor_sele=SELECT()
root='f:\'
BoxIn=root+'OTGR\BOX_IN\'
PathDbf=root+'OTGR\PROCHOTG\DBF\'

USE (PathDbf+'CUR_ZAD') ORDER nom_zd IN 0
USE (PathDbf+'ARH_ZAD')              IN 0
SELECT 0
USE (BoxIn+'PAC_ZAD') EXCLUSIVE

SCAN
	WAIT 'Обновление текущего файла задания для прочих фирм ' WINDOW NOWAIT
	SCATTER MEMVAR
	SELECT cur_zad
	IF SEEK(m.nom_zd,'CUR_ZAD')	&& Если уже есть такое задание
		IF EMPTY(pac_zad.kod)
			REPLACE zapret WITH pac_zad.zapret
		ELSE
 			REPLACE	cist WITH cist + m.kol_cist,;
				kol_tonn WITH kol_tonn +m.tonn,;
					tonn WITH tonn+m.tonn,;
				kol_cist WITH kol_cist+m.kol_cist,;
                   mesto WITH m.mesto,;
                     ceh WITH m.ceh
        ENDIF
	ELSE
		LOCATE FOR kod_nalich=m.kod_nalich;
	    	   AND kod_npr=m.kod_npr;
	           AND kod_sobs=m.kod_sobs;
	           AND kod_poluch=m.kod_poluch;
	           AND kod_otpr=m.kod_otpr;
	           AND kst=m.kst;
	           AND mesto=m.mesto;
	           AND ceh=m.ceh
		IF FOUND()
 			REPLACE	kol_tonn WITH kol_tonn +m.tonn,;
					    tonn WITH tonn+m.tonn,;
					  nom_zd WITH m.nom_zd
		ELSE  && Если не найдено - добавляем
			APPEND BLANK
			m.cist=m.kol_cist
			m.kol_tonn=m.tonn
			GATHER MEMVAR
		ENDIF
	ENDIF
    SELECT arh_zad					&& Добавляем в архив
   	APPEND BLANK
	GATHER MEMVAR
ENDSCAN
WAIT CLEAR
USE IN cur_zad
USE IN pac_zad
USE IN arh_zad
DELETE FILE (BoxIn+'PAC_ZAD.DBF')

SELECT (stor_sele)
RETURN