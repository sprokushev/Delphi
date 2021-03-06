--
-- P_GU12_ISPOLN_2  (Procedure) 
--
CREATE OR REPLACE PROCEDURE MASTER.P_GU12_ISPOLN_2 IS
N_USER VARCHAR(20);
DAT1 DATE;
DAT2 DATE;
BEGIN
	 N_USER:=FOR_TEMP.GET_AS_CHAR('GU12_USER','MASTER','GU12');
	 DAT1:=FOR_TEMP.GET_AS_DATE('DBEG_ISP','MASTER','GU12');
	 DAT2:=FOR_TEMP.GET_AS_DATE('DEND_ISP','MASTER','GU12');

 	 DELETE FROM GU12_ISPOLN WHERE UPPER(USER_NAME)=UPPER(N_USER);

	 FOR rec1 IN (SELECT P.NAME AS PROD,TRIM(PV.ABBR) AS PRINVAG,B.STAN_ID AS STAN_ID,
	 	 	 			BR.KOL_VAG AS PLAN_VAG,BR.VES AS PLAN_VES,N_USER AS USER_NAME,
						DECODE(NVL(A.EXPED_ID,0),0,0,1) AS EXPORT,P.ID AS PROD_ID
	 	 	 			FROM GU12_A A,GU12_B B,GU12_BR BR,KLS_PROD_GU12 P,KLS_GD_PRINVAG PV
						WHERE (BR.DATE_R>=DAT1 AND BR.DATE_R<=DAT2)
						AND A.PROD_ID=P.ID(+)
						AND A.ID=B.ID_A(+)
						AND B.PRINVAG_ID=PV.ID(+)
						AND BR.ID_B=B.ID)
		LOOP

		INSERT INTO GU12_ISPOLN (PROD,PRINVAG,USER_NAME,FORDEL,STAN_ID,PLAN_VAG,PLAN_VES,EXPORT,PROD_ID)
		VALUES (rec1.PROD,rec1.PRINVAG,rec1.USER_NAME,1,rec1.STAN_ID,rec1.PLAN_VAG,rec1.PLAN_VES,rec1.EXPORT,rec1.PROD_ID);

		END LOOP;

	FOR rec2 IN (
			 	 SELECT
				 PGD.NAME AS PROD,
				 PGD.ID AS PROD_ID,
				 DECODE(OW.VAGOWN_TYP_ID,0,'�',1,'�',2,'�',3,'�','') AS PRINVAG,
				 M.STAN_ID AS STAN_ID,
				 1 AS FAKT_VAG,
				 K.VES_BRUTTO AS FAKT_VES,
				 N_USER AS USER_NAME,
				 M.IS_EXP AS EXPORT,
				 TRUNC(K.DATE_OFORML) AS DATE_O,
				 TO_NUMBER(TO_CHAR(K.DATE_OFORML,'HH24MI')) AS TIME_O
				 FROM KVIT K,MONTH M,KLS_VID_OTGR VO,KLS_PROD P,KLS_PROD_GU12 PGD,KLS_VAGOWNER OW
				 WHERE K.NOM_ZD=M.NOM_ZD
				 AND M.LOAD_ABBR=VO.LOAD_ABBR
				 AND K.PROD_ID_NPR=P.ID_NPR
				 AND K.VAGOWNER_ID=OW.ID
				 AND P.PROD_GU12_ID=PGD.ID
				 AND TRUNC(K.DATE_OFORML)>DAT1-2
				 AND TRUNC(K.DATE_OFORML)<DAT2+1
				 AND VO.LOAD_TYPE_ID=1
				 )

		LOOP

		INSERT INTO GU12_ISPOLN
		 (PROD,FORDEL,STAN_ID,FAKT_VAG,FAKT_VES,EXPORT,USER_NAME,PRINVAG,DATE_O,PROD_ID,TIME_O)
		VALUES
		 (rec2.PROD,2,rec2.STAN_ID,rec2.FAKT_VAG,rec2.FAKT_VES,rec2.EXPORT,
		 rec2.USER_NAME,rec2.PRINVAG,rec2.DATE_O,rec2.PROD_ID,rec2.TIME_O);

		END LOOP;

		UPDATE GU12_ISPOLN SET DATE_O=DATE_O+1 WHERE TIME_O>=1700 AND FORDEL=2 AND UPPER(USER_NAME)=UPPER(N_USER);
		DELETE FROM GU12_ISPOLN WHERE FORDEL=2 AND(DATE_O<DAT1 OR DATE_O>DAT2) AND UPPER(USER_NAME)=UPPER(N_USER);

		COMMIT;

	FOR rec3 IN(
SELECT
	  I.PROD_ID,
	  MAX(I.PROD) AS PROD,
	  I.EXPORT,
	  I.PRINVAG,
--	  I.STAN_ID,
	  S.STAN_NAME AS STAN,
	  SUM(NVL(I.PLAN_VAG,0)) AS PLAN_VAG,
	  SUM(NVL(I.PLAN_VES,0)) AS PLAN_VES,
	  SUM(NVL(I.FAKT_VAG,0)) AS FAKT_VAG,
	  SUM(NVL(I.FAKT_VES,0)) AS FAKT_VES,
	  SUM(DECODE(TO_NUMBER(TO_CHAR(DATE_O,'DD')),1,I.FAKT_VAG,0)) AS D01,
	  SUM(DECODE(TO_NUMBER(TO_CHAR(DATE_O,'DD')),2,I.FAKT_VAG,0)) AS D02,
	  SUM(DECODE(TO_NUMBER(TO_CHAR(DATE_O,'DD')),3,I.FAKT_VAG,0)) AS D03,
	  SUM(DECODE(TO_NUMBER(TO_CHAR(DATE_O,'DD')),4,I.FAKT_VAG,0)) AS D04,
	  SUM(DECODE(TO_NUMBER(TO_CHAR(DATE_O,'DD')),5,I.FAKT_VAG,0)) AS D05,
	  SUM(DECODE(TO_NUMBER(TO_CHAR(DATE_O,'DD')),6,I.FAKT_VAG,0)) AS D06,
	  SUM(DECODE(TO_NUMBER(TO_CHAR(DATE_O,'DD')),7,I.FAKT_VAG,0)) AS D07,
	  SUM(DECODE(TO_NUMBER(TO_CHAR(DATE_O,'DD')),8,I.FAKT_VAG,0)) AS D08,
	  SUM(DECODE(TO_NUMBER(TO_CHAR(DATE_O,'DD')),9,I.FAKT_VAG,0)) AS D09,
	  SUM(DECODE(TO_NUMBER(TO_CHAR(DATE_O,'DD')),10,I.FAKT_VAG,0)) AS D10,
	  SUM(DECODE(TO_NUMBER(TO_CHAR(DATE_O,'DD')),11,I.FAKT_VAG,0)) AS D11,
	  SUM(DECODE(TO_NUMBER(TO_CHAR(DATE_O,'DD')),12,I.FAKT_VAG,0)) AS D12,
	  SUM(DECODE(TO_NUMBER(TO_CHAR(DATE_O,'DD')),13,I.FAKT_VAG,0)) AS D13,
	  SUM(DECODE(TO_NUMBER(TO_CHAR(DATE_O,'DD')),14,I.FAKT_VAG,0)) AS D14,
	  SUM(DECODE(TO_NUMBER(TO_CHAR(DATE_O,'DD')),15,I.FAKT_VAG,0)) AS D15,
	  SUM(DECODE(TO_NUMBER(TO_CHAR(DATE_O,'DD')),16,I.FAKT_VAG,0)) AS D16,
	  SUM(DECODE(TO_NUMBER(TO_CHAR(DATE_O,'DD')),17,I.FAKT_VAG,0)) AS D17,
	  SUM(DECODE(TO_NUMBER(TO_CHAR(DATE_O,'DD')),18,I.FAKT_VAG,0)) AS D18,
	  SUM(DECODE(TO_NUMBER(TO_CHAR(DATE_O,'DD')),19,I.FAKT_VAG,0)) AS D19,
	  SUM(DECODE(TO_NUMBER(TO_CHAR(DATE_O,'DD')),20,I.FAKT_VAG,0)) AS D20,
	  SUM(DECODE(TO_NUMBER(TO_CHAR(DATE_O,'DD')),21,I.FAKT_VAG,0)) AS D21,
	  SUM(DECODE(TO_NUMBER(TO_CHAR(DATE_O,'DD')),22,I.FAKT_VAG,0)) AS D22,
	  SUM(DECODE(TO_NUMBER(TO_CHAR(DATE_O,'DD')),23,I.FAKT_VAG,0)) AS D23,
	  SUM(DECODE(TO_NUMBER(TO_CHAR(DATE_O,'DD')),24,I.FAKT_VAG,0)) AS D24,
	  SUM(DECODE(TO_NUMBER(TO_CHAR(DATE_O,'DD')),25,I.FAKT_VAG,0)) AS D25,
	  SUM(DECODE(TO_NUMBER(TO_CHAR(DATE_O,'DD')),26,I.FAKT_VAG,0)) AS D26,
	  SUM(DECODE(TO_NUMBER(TO_CHAR(DATE_O,'DD')),27,I.FAKT_VAG,0)) AS D27,
	  SUM(DECODE(TO_NUMBER(TO_CHAR(DATE_O,'DD')),28,I.FAKT_VAG,0)) AS D28,
	  SUM(DECODE(TO_NUMBER(TO_CHAR(DATE_O,'DD')),29,I.FAKT_VAG,0)) AS D29,
	  SUM(DECODE(TO_NUMBER(TO_CHAR(DATE_O,'DD')),30,I.FAKT_VAG,0)) AS D30,
	  SUM(DECODE(TO_NUMBER(TO_CHAR(DATE_O,'DD')),31,I.FAKT_VAG,0)) AS D31,
	  N_USER AS USER_NAME
FROM GU12_ISPOLN I,KLS_STAN S
WHERE
I.STAN_ID=S.ID
AND NOT PROD IS NULL
AND UPPER(USER_NAME)=UPPER(N_USER)
GROUP BY I.PROD_ID,I.EXPORT
--,I.STAN_ID
--,S.STAN_NAME,I.PRINVAG
,I.PRINVAG,S.STAN_NAME
	   	  )
 	LOOP

		INSERT INTO GU12_ISPOLN
		 (FORDEL,PROD,EXPORT,PRINVAG
		 --,STAN_ID
		 ,STAN,PROD_ID,
		 PLAN_VAG,PLAN_VES,FAKT_VAG,FAKT_VES,USER_NAME,
		 D01,D02,D03,D04,D05,D06,D07,D08,D09,
		 D10,D11,D12,D13,D14,D15,D16,D17,D18,D19,
		 D20,D21,D22,D23,D24,D25,D26,D27,D28,D29,
		 D30,D31)
		VALUES
		 (0,rec3.PROD,rec3.EXPORT,rec3.PRINVAG
		 --,rec3.STAN_ID
		 ,rec3.STAN,rec3.PROD_ID,
		 rec3.PLAN_VAG,rec3.PLAN_VES,rec3.FAKT_VAG,rec3.FAKT_VES,rec3.USER_NAME,
		 rec3.D01,rec3.D02,rec3.D03,rec3.D04,rec3.D05,rec3.D06,rec3.D07,rec3.D08,rec3.D09,
		 rec3.D10,rec3.D11,rec3.D12,rec3.D13,rec3.D14,rec3.D15,rec3.D16,rec3.D17,rec3.D18,rec3.D19,
		 rec3.D20,rec3.D21,rec3.D22,rec3.D23,rec3.D24,rec3.D25,rec3.D26,rec3.D27,rec3.D28,rec3.D29,
		 rec3.D30,rec3.D31);

	END LOOP;

		DELETE FROM GU12_ISPOLN WHERE FORDEL>0 AND UPPER(USER_NAME)=UPPER(N_USER);

		COMMIT;

END P_GU12_ISPOLN_2;

/

