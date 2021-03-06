--
-- P_LOAD_SF_R3  (Procedure) 
--
CREATE OR REPLACE PROCEDURE MASTER.P_Load_Sf_R3 (vDATE DATE) IS
  vPrevDok NUMBER;
  vPrevProd VARCHAR2(5);
  vBillPosId NUMBER;
  vNomSf NUMBER;
  vNumAkt NUMBER;
BEGIN
vBillPosId:=1;

--������� ��� �������� ������� �� �����
DELETE FROM BILL_POS WHERE NOM_DOK IN (SELECT NOM_DOK FROM BILLS WHERE DATE_KVIT=vDATE 
   AND (PROD_ID_NPR>='10100' OR PROD_ID_NPR='10080'));
UPDATE KVIT SET BILL_ID=0 WHERE BILL_ID IN (SELECT NOM_DOK FROM BILLS WHERE DATE_KVIT=vDATE 
   AND (PROD_ID_NPR>='10100' OR PROD_ID_NPR='10080'));
DELETE FROM BILLS WHERE DATE_VYP_SF=vDATE AND (PROD_ID_NPR>='10100' OR PROD_ID_NPR='10080');
   
--���� �� ����������
FOR REC3 IN (SELECT /*+ ORDERED */ DISTINCT 
	 	 		IB.NOM_SF AS ISU_NOM_SF
		 		,IB.DATE_VYP_SF
		 		,IB.ISU_KOD
		 		,K.DATE_KVIT
				,For_Init.GetCurrUser AS FIO_ISPOL
				,TO_NUMBER(SUBSTR(IB.USL_PLAT,3)) AS KOL_DN
				,IB.ISU_KOD_OLD
				,(CASE
				      WHEN D.ID=2519 THEN '?'
					  ELSE K.NOM_ZD
				  END) AS NOM_ZD
				,(CASE
                    WHEN k.date_otgr<TO_DATE('01.04.2008','dd.mm.yyyy') THEN 8
                    ELSE 4175
                  END) AS OWNER_ID
				,D.ID AS DOG_ID
				,M.USL_NUMBER
				,(CASE
				      WHEN D.ID=2519 THEN '10080'
					  ELSE P.ID_NPR
				  END) AS PROD_ID_NPR
				,K.DATE_KVIT AS DATE_MOS
				,D.IS_AGENT
				,(CASE
				  	   WHEN TO_NUMBER(TO_CHAR(K.DATE_KVIT,'DD')) BETWEEN 1 AND 5 THEN 1
				  	   WHEN TO_NUMBER(TO_CHAR(K.DATE_KVIT,'DD')) BETWEEN 6 AND 10 THEN 2
				  	   WHEN TO_NUMBER(TO_CHAR(K.DATE_KVIT,'DD')) BETWEEN 11 AND 15 THEN 3
				  	   WHEN TO_NUMBER(TO_CHAR(K.DATE_KVIT,'DD')) BETWEEN 16 AND 20 THEN 4
				  	   WHEN TO_NUMBER(TO_CHAR(K.DATE_KVIT,'DD')) BETWEEN 20 AND 25 THEN 5
				  	   WHEN TO_NUMBER(TO_CHAR(K.DATE_KVIT,'DD'))>25 THEN 6
					   ELSE 0
				  END) AS NUM_5_DAY
				,M.NAZN_OTG_ID
				,K.DATE_KVIT+TO_NUMBER(SUBSTR(IB.USL_PLAT,3)) AS DATE_PLAT
				,1-NVL(IBP.IS_AKCIZ,0) AS NO_AKCIZ
				,K.DATE_KVIT AS DATE_BUXG
				,NVL(IB.STATUS,0) AS STATUS
		 FROM KVIT K
			  ,MONTH M
   		 	  ,ISU_BILL_POS_ROW IR
		      ,ISU_BILLS IB
			  ,ISU_BILL_POS IBP
			  ,KLS_DOG D
			  ,USL_DOG U
			  ,KLS_PROD P
		 WHERE IB.DATE_KVIT=vDATE
		   AND K.NOM_ZD=M.NOM_ZD
		   AND IR.KVIT_ID=K.ID
	 	   AND IB.ISU_KOD=IR.ISU_KOD
		   AND IB.ISU_KOD=SUBSTR(IBP.ISU_KOD_POS,1,10)
		   AND SUBSTR(IB.ISU_KOD_DOG,1,10)=SUBSTR(D.ISU_KOD_DOG,1,10)
		   AND IB.ISU_KOD_DOG=U.ISU_KOD_DOG
		   AND K.PROD_ID_NPR=P.ID_NPR
		   AND NVL(IB.STATUS,0) IN (0,3)
		   AND IB.LATENT||' '<>'X'
			   )
LOOP

		-- ��� ��������������� �����
		IF REC3.STATUS=3 THEN 
		   DELETE FROM DOP_KVIT DK WHERE DK.BILL_ID=REC3.ISU_KOD_OLD;  
		   INSERT INTO DOP_KVIT SELECT * FROM KVIT K WHERE K.BILL_ID=REC3.ISU_KOD_OLD;  
		END IF;

		vNumAkt:=0;
		
		/*
		--���� ������ NUM_AKT
		SELECT NVL(MAX(NUM_AKT),0) AS NUMAKT INTO vNumAkt FROM KVIT_NUMAKT KNA 
		WHERE KNA.NOM_DOK=REC3.ISU_KOD;
		
		IF rec3.PROD_ID_NPR='10080' AND vNumAkt=0 THEN
		  --���������� NUM_AKT
          vNumAkt:=for_documents.GET_NEXT_NUM(12,0,'',rec3.DATE_KVIT);
		  -- ��������� NUM_AKT
          for_documents.SET_NUM(12,0,0,'',vNumAkt,rec3.DATE_KVIT);
		  -- ��������� ������� ������������
		  UPDATE KVIT_NUMAKT SET NUM_AKT=vNumAkt,DATE_AKT=rec3.DATE_KVIT
 		   WHERE NOM_DOK=REC3.ISU_KOD;
		  IF SQL%NOTFOUND THEN  
  		    INSERT INTO KVIT_NUMAKT (NUM_AKT,DATE_AKT,NOM_DOK)
			  VALUES (vNumAkt,rec3.DATE_KVIT,REC3.ISU_KOD);
		  END IF;	  
        end if;
		*/

		--���� ������ NOM_SF
		SELECT NVL(MAX(NOM_SF),0) AS NOMSF INTO vNomSF FROM KVIT_NOMSF KSF 
		WHERE KSF.KVIT_ID IN (SELECT KVIT_ID FROM ISU_BILL_POS_ROW A WHERE A.ISU_KOD=REC3.ISU_KOD);

		IF rec3.PROD_ID_NPR='10080' AND vNumAkt=0 THEN
  		  vNumAkt:=vNomSF;
		END IF;  
		
		--��������� KVIT ���  
		   FOR REC1 IN (SELECT
        	 		    IBPR.ISU_KOD
        			   ,IBPR.KVIT_ID
        			   ,KT.DATE_KVIT
        			   ,KT.PROD_ID_NPR
        			   ,IBP.PRICE AS CENA
        			   ,IBP.PRICE_WITH_NDS AS CENA_OTP
        			   ,(IBP.SUMMA_BN-NVL(DK.SUM_PROD,0)) AS SUM_PROD
        			   ,0 AS SUM_AKCIZ
        			   ,(IBP.SUMMA_NDS-NVL(DK.SUM_PROD_NDS,0)) AS SUM_PROD_NDS
        			   ,(IBP.TARIF_NDS-NVL(DK.TARIF_NDS,0)) AS TARIF_NDS 
        			   ,(IBP.TARIF_GUARD_NDS-NVL(DK.TARIF_GUARD_NDS,0)) AS TARIF_GUARD_NDS 
        			   ,(IBP.SUMMA_VOZN_BN-NVL(DK.SUM_VOZN11,0)) AS SUM_VOZN11
        			   ,(ROUND(IBP.SUMMA_VOZN_BN*0.18,2)-NVL(DK.SUM_VOZN11_NDS,0)) AS SUM_VOZN11_NDS  
        			   ,(IBP.SUMMA_RAZN_BN-NVL(DK.SUM_VOZN12,0)) AS SUM_VOZN12
        			   ,(ROUND(IBP.SUMMA_RAZN_BN*0.18,2)-NVL(DK.SUM_VOZN12_NDS,0)) AS SUM_VOZN12_NDS
        			 FROM 
        		 	   ISU_BILL_POS_ROW IBPR
        			   ,ISU_BILL_POS IBP
        			   ,KVIT KT
					   ,DOP_KVIT DK
        			 WHERE KT.DATE_KVIT=vDATE
        			   AND IBPR.KVIT_ID=KT.ID
        			   AND IBPR.ISU_KOD_POS=IBP.ISU_KOD_POS
        			   AND IBPR.ISU_KOD=REC3.ISU_KOD
					   AND KT.ID=DK.ID(+)
        			 ORDER BY IBPR.ISU_KOD,KT.PROD_ID_NPR
					 ) 
           LOOP
 
           /* PSV - ���������� BILL_POS_ID */
           IF vPrevDok<>REC1.ISU_KOD THEN
           	   vBillPosId:=1;
           ELSE
               IF vPrevProd<>REC1.PROD_ID_NPR THEN
               	  vBillPosId:=vBillPosId+1;
        	   END IF;
           END IF;	  

          UPDATE KVIT SET 
          		--BILL_ID=REC1.ISU_KOD
             	--,BILL_POS_ID=vBillPosId
             	CENA=0
             	,CENA_OTP=0
             	,SUM_PROD=0
             	,SUM_AKCIZ=0
             	,SUM_PROD_NDS=0
             	,TARIF_NDS=0
             	,TARIF_GUARD_NDS=0
             	,SUM_VOZN11=0
             	,SUM_VOZN11_NDS=0
             	,SUM_VOZN12=0
             	,SUM_VOZN12_NDS=0
     			,NUM_AKT=0
          WHERE KVIT.ID=REC1.KVIT_ID;	
		   
          -- ��������� ����� � �����
          UPDATE KVIT SET
        		BILL_ID=REC1.ISU_KOD
        		,BILL_POS_ID=vBillPosId
        		,CENA=REC1.CENA
        		,CENA_OTP=REC1.CENA_OTP
        		,SUM_PROD=(CASE
					   WHEN REC3.PROD_ID_NPR='10080' THEN 0
					   ELSE REC1.SUM_PROD
				  END)
        		,SUM_AKCIZ=0
        		,SUM_PROD_NDS=(CASE
					   WHEN REC3.PROD_ID_NPR='10080' THEN 0
					   ELSE REC1.SUM_PROD_NDS
				  END)
        		,TARIF_NDS=(CASE
					   WHEN REC3.PROD_ID_NPR='10080' THEN 0
					   ELSE REC1.TARIF_NDS
				  END)
        		,TARIF_GUARD_NDS=(CASE
					   WHEN REC3.PROD_ID_NPR='10080' THEN 0
					   ELSE REC1.TARIF_GUARD_NDS
				  END)
        		,SUM_VOZN11=(CASE
					   WHEN REC3.PROD_ID_NPR='10080' THEN 0
					   ELSE REC1.SUM_VOZN11
				  END)
        		,SUM_VOZN11_NDS=(CASE
					   WHEN REC3.PROD_ID_NPR='10080' THEN 0
					   ELSE REC1.SUM_VOZN11_NDS
				  END)
        		,SUM_VOZN12=(CASE
					   WHEN REC3.PROD_ID_NPR='10080' THEN 0
					   ELSE REC1.SUM_VOZN12
				  END)
        		,SUM_VOZN12_NDS=(CASE
					   WHEN REC3.PROD_ID_NPR='10080' THEN 0
					   ELSE REC1.SUM_VOZN12_NDS
				  END)
				,NUM_AKT=vNumAkt
        	WHERE KVIT.ID=REC1.KVIT_ID;

          vPrevDok:=REC1.ISU_KOD;
          vPrevProd:=REC1.PROD_ID_NPR;
 
           END LOOP;			
		
		--����� ��� ������ ������ 
		IF REC3.PROD_ID_NPR='10080' THEN
    		FOR REC1 IN (SELECT 
                            IBPR.ISU_KOD
                           ,MIN(IBPR.KVIT_ID) AS KVIT_ID 
                           ,MIN(KT.DATE_KVIT) AS DATE_KVIT 
                           ,KT.PROD_ID_NPR
                           ,MIN(IBP.PRICE) AS CENA
                           ,MIN(IBP.PRICE_WITH_NDS) AS CENA_OTP
                           ,MIN(IBP.SUMMA_BN-NVL(DK.SUM_PROD,0)) AS SUM_PROD
                           ,0 AS SUM_AKCIZ
                           ,MIN(IBP.SUMMA_NDS-NVL(DK.SUM_PROD_NDS,0)) AS SUM_PROD_NDS
                           ,MIN(IBP.TARIF_NDS-NVL(DK.TARIF_NDS,0)) AS TARIF_NDS 
                           ,MIN(IBP.TARIF_GUARD_NDS-NVL(DK.TARIF_GUARD_NDS,0)) AS TARIF_GUARD_NDS
                           ,MIN(IBP.SUMMA_VOZN_BN-NVL(DK.SUM_VOZN11,0)) AS SUM_VOZN11
                           ,MIN(ROUND(IBP.SUMMA_VOZN_BN*0.18,2)-NVL(DK.SUM_VOZN11_NDS,0)) AS SUM_VOZN11_NDS  
                           ,MIN(IBP.SUMMA_RAZN_BN-NVL(DK.SUM_VOZN12,0)) AS SUM_VOZN12
                           ,MIN(ROUND(IBP.SUMMA_RAZN_BN*0.18,2)-NVL(DK.SUM_VOZN12_NDS,0)) AS SUM_VOZN12_NDS
                         FROM 
                            ISU_BILL_POS_ROW IBPR
                           ,ISU_BILL_POS IBP
                           ,KVIT KT
						   ,DOP_KVIT DK
                         WHERE KT.DATE_KVIT=vDATE
                           AND IBPR.KVIT_ID=KT.ID
                           AND IBPR.ISU_KOD_POS=IBP.ISU_KOD_POS
                           AND IBPR.ISU_KOD=REC3.ISU_KOD
						   AND KT.ID=DK.ID(+)
                           GROUP BY IBPR.ISU_KOD,KT.PROD_ID_NPR
             			   ORDER BY IBPR.ISU_KOD,KT.PROD_ID_NPR
    			)
            LOOP

                 UPDATE KVIT SET 
                 		BILL_ID=REC1.ISU_KOD
                    	--,BILL_POS_ID=vBillPosId
                    	,CENA=REC1.CENA
                    	,CENA_OTP=REC1.CENA_OTP
                    	,SUM_PROD=REC1.SUM_PROD
                    	,SUM_AKCIZ=0
                    	,SUM_PROD_NDS=REC1.SUM_PROD_NDS
                    	,TARIF_NDS=REC1.TARIF_NDS
                    	,TARIF_GUARD_NDS=REC1.TARIF_GUARD_NDS
                    	,SUM_VOZN11=REC1.SUM_VOZN11
                    	,SUM_VOZN11_NDS=REC1.SUM_VOZN11_NDS
                    	,SUM_VOZN12=REC1.SUM_VOZN12
                    	,SUM_VOZN12_NDS=REC1.SUM_VOZN12_NDS
            			,NUM_AKT=vNumAkt
                 WHERE KVIT.ID=REC1.KVIT_ID;	

    		END LOOP;
		END IF;			

		--��������� � ���� ��� 
		FOR REC2 IN(SELECT DISTINCT
				 		   K.ID		   				 		   
						   ,NPC.BEGIN_DATE
						   ,NPC.PROTOKOL_NUM AS PROTO_NUM
						   ,NPC.PROTOKOL_DATE AS PROTO_DATE
						   FROM ISU_BILLS IB
						   ,USL_DOG U
						   ,ISU_BILL_POS IBP
						   ,KLS_PROD P
						   ,NPR_PRICES NPC
						   ,ISU_BILL_POS_ROW IR
						   ,KVIT K
						   WHERE K.DATE_KVIT=vDATE
						   AND IB.ISU_KOD_DOG=U.ISU_KOD_DOG
						   AND IB.ISU_KOD=SUBSTR(IBP.ISU_KOD_POS,1,10)
						   AND IB.ISU_KOD=REC3.ISU_KOD
						   AND IBP.MATERIAL_KSSS=P.KSSS_PROD_ID
						   AND NPC.CAT_CEN_ID=U.CAT_CEN_ID
						   AND NPC.PROD_ID_NPR=P.ID_NPR
						   AND NPC.IS_ORIGINAL=1	   
						   AND IB.ISU_KOD=IR.ISU_KOD
						   AND IR.KVIT_ID=K.ID
						   AND K.DATE_KVIT>=NPC.BEGIN_DATE
						   AND K.DATE_KVIT<=NVL(NPC.END_DATE,TO_DATE('31.12.2100','dd.mm.yyyy'))
						ORDER BY BEGIN_DATE   
					)
		LOOP
			
			UPDATE KVIT SET DATE_CENA=REC2.BEGIN_DATE,PROTO_NUM=REC2.PROTO_NUM,PROTO_DATE=REC2.PROTO_DATE WHERE ID=REC2.ID;
		
		END LOOP;
		
		
		--��������� ���������
		INSERT INTO BILLS (ISU_NOM_SF
			   		  ,NOM_SF /* PSV - ����� ������ ����� =0 */
    		          ,DATE_VYP_SF
					  ,ISU_KOD
					  ,NOM_DOK
					  ,DATE_KVIT
					  ,FIO_ISPOL
					  ,KOL_DN
					  ,OLD_NOM_DOK
					  ,NOM_ZD
					  ,OWNER_ID
					  ,DOG_ID
					  ,USL_NUMBER
					  ,PROD_ID_NPR
					  ,DATE_MOS
					  ,IS_AGENT
					  ,NUM_5_DAY
					  ,KORR_5_DAY
					  ,NAZN_OTG_ID
					  ,DATE_PLAT
					  ,NO_AKCIZ
					  ,DATE_BUXG
					  )
          VALUES (REC3.ISU_NOM_SF
		  		 ,REC3.ISU_NOM_SF --,vNomSF � 01.01.2007 ����� ����� �� r3
		         ,REC3.DATE_VYP_SF
				 ,REC3.ISU_KOD
				 ,TO_NUMBER(REC3.ISU_KOD)
				 ,REC3.DATE_KVIT
				 ,REC3.FIO_ISPOL
				 ,REC3.KOL_DN
				 ,REC3.ISU_KOD_OLD
				 ,REC3.NOM_ZD
				 ,REC3.OWNER_ID
				 ,REC3.DOG_ID
				 ,REC3.USL_NUMBER
				 ,REC3.PROD_ID_NPR
				 ,REC3.DATE_MOS
				 ,REC3.IS_AGENT
				 ,REC3.NUM_5_DAY
				 ,REC3.NUM_5_DAY
				 ,REC3.NAZN_OTG_ID
				 ,REC3.DATE_PLAT
				 ,REC3.NO_AKCIZ
				 ,REC3.DATE_BUXG
				 );
			 
     	-- ����� � ���������
     	FOR REC4 IN (SELECT
     			 		   K.BILL_ID
					       ,MAX(K.PROTO_NUM) AS PROTO_NUM 
 					       ,MAX(K.PROTO_DATE) AS PROTO_DATE 
     					   ,SUM(SUM_PROD + SUM_PROD_NDS + TARIF + TARIF_NDS + TARIF_GUARD + TARIF_GUARD_NDS + SUM_VOZN11 + SUM_VOZN11_NDS + SUM_VOZN12 + SUM_VOZN12_NDS) AS SUMMA_DOK
     					   ,SUM(SUM_PROD_NDS + TARIF_NDS + TARIF_GUARD_NDS + SUM_VOZN11_NDS + SUM_VOZN12_NDS) AS NDS_DOK
     					   ,SUM(SUM_PROD + SUM_PROD_NDS) AS PROD_SUM
     					   ,SUM(SUM_PROD_NDS) AS PROD_NDS
     					   ,SUM(SUM_PROD + SUM_PROD_NDS) AS LUK_SUMMA_DOK
     					   ,SUM(SUM_PROD_NDS) AS LUK_NDS_DOK
     				  FROM KVIT K
     				  WHERE K.DATE_KVIT=vDATE
					  AND K.ID IN (SELECT KVIT_ID FROM ISU_BILL_POS_ROW WHERE ISU_KOD=REC3.ISU_KOD)
     				  GROUP BY K.BILL_ID
                      ORDER BY K.BILL_ID
     				 )
     	LOOP
     
     	UPDATE BILLS SET SUMMA_DOK=REC4.SUMMA_DOK
     	                    ,NDS_DOK=REC4.NDS_DOK
     						,PROD_SUM=REC4.PROD_SUM
     						,PROD_NDS=REC4.PROD_NDS
     						,LUK_SUMMA_DOK=REC4.LUK_SUMMA_DOK
     						,LUK_NDS_DOK=REC4.LUK_NDS_DOK
							,PROTO_NUM=REC4.PROTO_NUM
							,PROTO_DATE=REC4.PROTO_DATE
     	                WHERE ISU_KOD=REC3.ISU_KOD;
     
     	END LOOP;
				 
	--������� �� �������� �� 
	FOR REC5 IN (SELECT
                       BT.NOM_DOK
                       ,K.BILL_POS_ID
					   ,MAX(BT.DATE_KVIT) AS DATE_REALIZ
                       ,SUM(K.VES) AS VES
                       ,MAX(K.CENA) AS CENA_BN
                       ,SUM(K.SUM_PROD) AS SUMMA_BN
                       ,SUM(K.SUM_AKCIZ) AS SUMMA_AKCIZ
                       ,SUM(K.SUM_PROD_NDS) AS SUMMA_NDS20
                       ,SUM(K.SUM_PROD + K.SUM_PROD_NDS) AS SUMMA
                       ,MAX(PR.ID_NPR) AS PROD_ID_NPR
                       ,MAX(BT.IS_AGENT) AS IS_AGENT
                       ,MAX(BT.NO_AKCIZ) AS NO_AKCIZ
                       ,SUM(K.TARIF) AS TARIF_BN
                       ,SUM(K.TARIF_NDS) AS TARIF_NDS
                       ,SUM(K.SUM_VOZN11) AS SUMMA_VOZN_BN
                       ,SUM(K.SUM_VOZN11_NDS) AS SUMMA_VOZN_NDS
                       ,SUM(K.SUM_VOZN12) AS SUMMA_RAZN_BN
                       ,SUM(K.SUM_VOZN12_NDS) AS SUMMA_RAZN_NDS
                       ,SUM(K.TARIF_GUARD) AS TARIF_GUARD_BN
                       ,SUM(K.TARIF_GUARD_NDS) AS TARIF_GUARD_NDS
					   ,MAX(K.PROTO_NUM) AS PROTO_NUM 
					   ,MAX(K.PROTO_DATE) AS PROTO_DATE 
                       FROM KVIT K,BILLS BT,KLS_PROD PR
                       WHERE K.DATE_KVIT=vDATE
                       AND K.PROD_ID_NPR=PR.ID_NPR
                       AND K.BILL_ID=BT.NOM_DOK
					   AND BT.NOM_DOK=REC3.ISU_KOD
                       GROUP BY BT.NOM_DOK,K.BILL_POS_ID
                       ORDER BY BT.NOM_DOK,K.BILL_POS_ID
                       )
	LOOP
	--�������
	INSERT INTO BILL_POS (
		   					  BILL_POS_ID
							 ,NOM_DOK
		   					 ,VES
							 ,CENA_BN
							 ,SUMMA_BN
							 ,SUMMA_AKCIZ
							 ,SUMMA_NDS20
							 ,SUMMA
							 ,PROD_ID_NPR
							 ,IS_AGENT
							 ,NO_AKCIZ
							 ,OWNERSHIP_ID
							 ,IS_LUK
							 ,PROTO_NUM
							 ,PROTO_DATE
							 ,DATE_REALIZ
							 ,NUM_AKT
							 )
					VALUES(
							 REC5.BILL_POS_ID
							 ,REC5.NOM_DOK
		   					 ,REC5.VES
							 ,REC5.CENA_BN
							 ,REC5.SUMMA_BN
							 ,REC5.SUMMA_AKCIZ
							 ,REC5.SUMMA_NDS20
							 ,REC5.SUMMA
							 ,REC5.PROD_ID_NPR
							 ,REC5.IS_AGENT
							 ,REC5.NO_AKCIZ
							 ,1
							 ,1
							 ,REC5.PROTO_NUM
							 ,REC5.PROTO_DATE
							 ,REC5.DATE_REALIZ
							 ,vNumAkt
							 );	
	END LOOP;

	--������
	FOR REC6 IN (SELECT
                       BT.NOM_DOK
					   ,MAX(BT.DATE_KVIT) AS DATE_REALIZ
                       ,SUM(K.VES) AS VES
                       ,MAX(K.CENA) AS CENA_BN
                       ,SUM(K.SUM_PROD) AS SUMMA_BN
                       ,SUM(K.SUM_AKCIZ) AS SUMMA_AKCIZ
                       ,SUM(K.SUM_PROD_NDS) AS SUMMA_NDS20
                       ,SUM(K.SUM_PROD+K.SUM_PROD_NDS) AS SUMMA
                       ,MAX(PR.ID_NPR) AS PROD_ID_NPR
                       ,MAX(BT.IS_AGENT) AS IS_AGENT
                       ,MAX(BT.NO_AKCIZ) AS NO_AKCIZ
                       ,SUM(K.TARIF) AS TARIF_BN
                       ,SUM(K.TARIF_NDS) AS TARIF_NDS
                       ,SUM(K.SUM_VOZN11) AS SUMMA_VOZN_BN
                       ,SUM(K.SUM_VOZN11_NDS) AS SUMMA_VOZN_NDS
                       ,SUM(K.SUM_VOZN12) AS SUMMA_RAZN_BN
                       ,SUM(K.SUM_VOZN12_NDS) AS SUMMA_RAZN_NDS
                       ,SUM(K.TARIF_GUARD) AS TARIF_GUARD_BN
                       ,SUM(K.TARIF_GUARD_NDS) AS TARIF_GUARD_NDS
					   ,MAX(K.PROTO_NUM) AS PROTO_NUM 
					   ,MAX(K.PROTO_DATE) AS PROTO_DATE 
                       FROM KVIT K,BILLS BT,KLS_PROD PR
                       WHERE K.DATE_KVIT=vDATE
                       AND K.PROD_ID_NPR=PR.ID_NPR
                       AND K.BILL_ID=BT.NOM_DOK
					   AND BT.NOM_DOK=REC3.ISU_KOD
                       GROUP BY BT.NOM_DOK
                       ORDER BY BT.NOM_DOK
                       )
	LOOP
	--�����
	IF REC6.TARIF_BN<>0 THEN
	INSERT INTO BILL_POS (
		   					 BILL_POS_ID
							 ,NOM_DOK
		   					 ,VES
							 ,CENA_BN
							 ,SUMMA_BN
							 ,SUMMA_AKCIZ
							 ,SUMMA_NDS20
							 ,SUMMA
							 ,PROD_ID_NPR
							 ,IS_AGENT
							 ,NO_AKCIZ
							 ,OWNERSHIP_ID
							 ,IS_LUK
							 ,PROTO_NUM
							 ,PROTO_DATE
							 ,DATE_REALIZ
							 )
					VALUES(
							  10
							 ,REC6.NOM_DOK
		   					 ,0
							 ,0
							 ,REC6.TARIF_BN
							 ,0
							 ,REC6.TARIF_NDS
							 ,REC6.TARIF_BN+REC6.TARIF_NDS
							 ,10010
							 ,REC6.IS_AGENT
							 ,REC6.NO_AKCIZ
							 ,13
							 ,0
							 ,REC6.PROTO_NUM
							 ,REC6.PROTO_DATE
							 ,REC6.DATE_REALIZ
							 );
	END IF;
	--��������������
	IF REC6.SUMMA_VOZN_BN<>0 THEN
	INSERT INTO BILL_POS (
		   					 BILL_POS_ID
							 ,NOM_DOK
		   					 ,VES
							 ,CENA_BN
							 ,SUMMA_BN
							 ,SUMMA_AKCIZ
							 ,SUMMA_NDS20
							 ,SUMMA
							 ,PROD_ID_NPR
							 ,IS_AGENT
							 ,NO_AKCIZ
							 ,OWNERSHIP_ID
							 ,IS_LUK
							 ,PROTO_NUM
							 ,PROTO_DATE
							 ,DATE_REALIZ
							 )
					VALUES(
							  11
							 ,REC6.NOM_DOK
		   					 ,0
							 ,0
							 ,REC6.SUMMA_VOZN_BN
							 ,0
							 ,REC6.SUMMA_VOZN_NDS
							 ,REC6.SUMMA_VOZN_BN+REC6.SUMMA_VOZN_NDS
							 ,10011
							 ,REC6.IS_AGENT
							 ,REC6.NO_AKCIZ
							 ,13
							 ,0
							 ,REC6.PROTO_NUM
							 ,REC6.PROTO_DATE
							 ,REC6.DATE_REALIZ
							 );
	END IF;
	--�������
	IF REC6.SUMMA_RAZN_BN<>0 THEN
	INSERT INTO BILL_POS (
		   					 BILL_POS_ID
							 ,NOM_DOK
		   					 ,VES
							 ,CENA_BN
							 ,SUMMA_BN
							 ,SUMMA_AKCIZ
							 ,SUMMA_NDS20
							 ,SUMMA
							 ,PROD_ID_NPR
							 ,IS_AGENT
							 ,NO_AKCIZ
							 ,OWNERSHIP_ID
							 ,IS_LUK
							 ,PROTO_NUM
							 ,PROTO_DATE
							 ,DATE_REALIZ
							 )
					VALUES(
							  12
							 ,REC6.NOM_DOK
		   					 ,0
							 ,0
							 ,REC6.SUMMA_RAZN_BN
							 ,0
							 ,REC6.SUMMA_RAZN_NDS
							 ,REC6.SUMMA_RAZN_BN+REC6.SUMMA_RAZN_NDS
							 ,10012
							 ,REC6.IS_AGENT
							 ,REC6.NO_AKCIZ
							 ,13
							 ,0
							 ,REC6.PROTO_NUM
							 ,REC6.PROTO_DATE
							 ,REC6.DATE_REALIZ
							 );
	END IF;
	--������
	IF REC6.TARIF_GUARD_BN<>0 THEN
	INSERT INTO BILL_POS (
		   					 BILL_POS_ID
							 ,NOM_DOK
		   					 ,VES
							 ,CENA_BN
							 ,SUMMA_BN
							 ,SUMMA_AKCIZ
							 ,SUMMA_NDS20
							 ,SUMMA
							 ,PROD_ID_NPR
							 ,IS_AGENT
							 ,NO_AKCIZ
							 ,OWNERSHIP_ID
							 ,IS_LUK
							 ,PROTO_NUM
							 ,PROTO_DATE
							 ,DATE_REALIZ
							 )
					VALUES(
							  13
							 ,REC6.NOM_DOK
		   					 ,0
							 ,0
							 ,REC6.TARIF_GUARD_BN
							 ,0
							 ,REC6.TARIF_GUARD_NDS
							 ,REC6.TARIF_GUARD_BN+REC6.TARIF_GUARD_NDS
							 ,10013
							 ,REC6.IS_AGENT
							 ,REC6.NO_AKCIZ
							 ,13
							 ,0
							 ,REC6.PROTO_NUM
							 ,REC6.PROTO_DATE
							 ,REC6.DATE_REALIZ
							 );
	END IF;
	END LOOP;
				 
END LOOP;
COMMIT;

END P_Load_Sf_R3; 
/

