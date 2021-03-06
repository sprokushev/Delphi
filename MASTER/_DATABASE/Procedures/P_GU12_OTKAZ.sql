--
-- P_GU12_OTKAZ  (Procedure) 
--
CREATE OR REPLACE PROCEDURE MASTER.P_GU12_OTKAZ (ID_REIS INTEGER
										  ,DATEISH DATE
										  ,DATEVHOD DATE
										  ,NOMISH VARCHAR2
										  ,NOMVHOD VARCHAR2) IS
SUMKOL NUMBER;
SUMVES NUMBER;
NEW_SUMKOL NUMBER;
NEW_SUMVES NUMBER;
OTKAZ_SUMKOL NUMBER;
OTKAZ_SUMVES NUMBER;
NEW_ID_REIS NUMBER;

BEGIN

SELECT seq_gu12_B.NEXTVAL
INTO NEW_ID_REIS
FROM DUAL;

SUMKOL:=0;
SUMVES:=0;
NEW_SUMKOL:=0;
NEW_SUMVES:=0;
OTKAZ_SUMKOL:=0;
OTKAZ_SUMVES:=0;

-- ������ ����
FOR rec2 IN (SELECT * FROM GU12_BR WHERE ID_B=ID_REIS)
LOOP

	SUMKOL:=SUMKOL+rec2.KOL_VAG;
	SUMVES:=SUMVES+rec2.VES;

	IF NVL(rec2.METKA,0)=1 THEN
	   OTKAZ_SUMKOL:=OTKAZ_SUMKOL+rec2.KOL_VAG;
	   OTKAZ_SUMVES:=OTKAZ_SUMVES+rec2.VES;
	   --UPDATE GU12_BR SET METKA=0 WHERE ID=rec2.ID;
	   --UPDATE GU12_BR SET ID_B=NEW_ID_REIS WHERE ID=rec2.ID;
	END IF;

END LOOP;

NEW_SUMKOL:=SUMKOL-OTKAZ_SUMKOL;
NEW_SUMVES:=SUMVES-OTKAZ_SUMVES;

FOR rec1 IN (SELECT * FROM GU12_B WHERE ID=ID_REIS)
LOOP

INSERT INTO GU12_B
  (PDATE
  ,SOBSTVVAG_ID
  ,STAN_ID
  ,STAN_PER_ID
  ,STATES_ID
  ,GRUZPOL_ID
  ,KOL_VAG
  ,VES
  ,VIDOTPR_ID
  ,MRK
  ,ID_A
  ,ID
  ,PLAT_ID
--  ,FOX_KOD
  ,ISCOR
  ,DATE_LETTER
  ,NOM_LETTER
  ,DATE_VHOD
  ,NOM_VHOD
  ,PRINVAG_ID
  ,OLD_ID)
VALUES
  (rec1.PDATE
  ,rec1.SOBSTVVAG_ID
  ,rec1.STAN_ID
  ,rec1.STAN_PER_ID
  ,rec1.STATES_ID
  ,rec1.GRUZPOL_ID
  ,OTKAZ_SUMKOL  /*KOL_VAG*/
  ,OTKAZ_SUMVES  /*VES*/
  ,rec1.VIDOTPR_ID
  ,rec1.MRK
  ,rec1.ID_A
  ,NEW_ID_REIS /*ID*/
  ,rec1.PLAT_ID
--  ,'' /*FOX_KOD*/
  ,2  /*ISCOR*/
  ,DATEISH  /*DATE_LETTER*/
  ,NOMISH   /*NOM_LETTER*/
  ,DATEVHOD /*DATE_VHOD*/
  ,NOMVHOD  /*NOM_VHOD*/
  ,rec1.PRINVAG_ID
  ,ID_REIS);

  --UPDATE GU12_A SET ISCOR=2
  --WHERE ID=rec1.ID_A;

END LOOP;

UPDATE GU12_B SET KOL_VAG=NEW_SUMKOL,VES=NEW_SUMVES
WHERE ID=ID_REIS;

-- update br 
FOR rec2 IN (SELECT * FROM GU12_BR WHERE ID_B=ID_REIS)
LOOP

	IF NVL(rec2.METKA,0)=1 THEN
	   UPDATE GU12_BR SET METKA=0 WHERE ID=rec2.ID;
	   UPDATE GU12_BR SET ID_B=NEW_ID_REIS WHERE ID=rec2.ID;
	END IF;

END LOOP;

COMMIT;

END P_GU12_OTKAZ;

/

