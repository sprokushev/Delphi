PARAMETERS date_kd
PRIVATE stor_sele,stor_dele,stor_safe,kol_rec

stor_sele=SELECT()
stor_dele=SET('DELETE')
stor_safe=SET('SAFETY')
SET DELETE ON
SET SAFETY OFF

SELECT 0
    IF MONTH(date_kd)>MONTH(DATE()) AND YEAR(date_kd)=YEAR(DATE())
      SELECT (stor_sele)
      SET DELETE &stor_dele
      SET SAFETY &stor_safe
      RETURN
    ENDIF
    date_sel=date_kd
    time_sel=8
    DO WHILE .T.
      SELECT reznal.kn_p, reznal.kol,rezervua.most,prim1;
        FROM f:\uchet\arhiv\rezervua,f:\uchet\arhiv\reznal;
        WHERE rezervua.kod=reznal.kod_rez;
          AND reznal.data=date_sel;
          AND reznal.vrema=time_sel;
          AND reznal.pr<2;
      INTO TABLE (gPathTemp+'nbm')
      COUNT TO kol_rec
      IF kol_rec#0
        EXIT
      ELSE
        IF time_sel=18
          time_sel=8
        ELSE
          date_sel=date_sel-1
          time_sel=18
          IF date_kd-date_sel>5
            SELECT (stor_sele)
            SET DELETE &stor_dele
            SET SAFETY &stor_safe
            RETURN
          ENDIF
        ENDIF
      ENDIF
    ENDDO
USE
SELECT nbm.kn_p,nbm.kol,nbm.most,prim1,;
    00000000000 AS kol_kg,SPACE(10) AS k_nfp;
  FROM (gPathTemp+'nbm');
  INTO TABLE (gPathTemp+'buf')
USE f:\tov_pr\dbf\prod ORDER psevdo IN 0
SET RELATION TO kn_p INTO prod
REPLACE kol_kg WITH MIN(kol,most)*1000,;
        k_nfp WITH prod.kod_10 ALL

m.name_rezult=TRANSFORM(MONTH(date_kd),'@L 99')+'OMRT11'

SELECT k_nfp,SUM(kol_kg) AS kol_kg, prod.name, prod.name1;
  FROM buf,prod ;
  WHERE buf.k_nfp=prod.kod_10;
    AND !EMPTY(buf.k_nfp);
  GROUP BY 1 HAVING kol_kg#0 INTO TABLE (gPathTemp+'buffer')

REPORT FORM (gReport+'omrt') NOCONSOLE;
  TO FILE (gPathTemp+m.name_rezult+'.VTU')

USE IN prod
USE IN buffer
USE IN buf
USE IN nbm
DELETE FILE ('c:\tmp\buf.dbf')

CREATE TABLE (gPathTemp+m.name_rezult) (k_nfp C(10),kol_kg N(11))
APPEND FROM (gPathTemp+'buffer')
USE
DELETE FILE (gPathTemp+'buffer.dbf')
DELETE FILE (gPathTemp+'nbm.dbf')

SELECT (stor_sele)
SET DELETE &stor_dele
SET SAFETY &stor_safe

RETURN