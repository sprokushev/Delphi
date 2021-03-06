--
-- V_FIL_MES_REAL_OLD  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_FIL_MES_REAL_OLD
(FILIAL_ORDER, FILIAL_NAME, ORG_KIND_ORDER, ORG_KIND_NAME, GROUP_ORDER, 
 GROUP_FULL_NAME, FACT_REAL_VES, PLAN_REAL_VES, NORMA_REAL_VES)
AS 
SELECT 
	   FILIAL_ORDER 
       ,MAX(FILIAL_NAME) AS FILIAL_NAME 
	   ,ORG_KIND_ORDER 
	   ,MAX(ORG_KIND_NAME) AS ORG_KIND_NAME 
	   ,GROUP_ORDER 
  	   ,MAX(GROUP_FULL_NAME) AS GROUP_FULL_NAME 
	   ,SUM(FACT_REAL_VES) AS FACT_REAL_VES 
  	   ,SUM(PLAN_REAL_VES) AS PLAN_REAL_VES 
       ,SUM(NORMA_REAL_VES) AS NORMA_REAL_VES 
FROM 
(SELECT 
  (CASE 
	 		 WHEN FILIAL_ID IN (30,59) THEN 1 
	 		 WHEN FILIAL_ID IN (31) THEN 2 
	 		 WHEN FILIAL_ID IN (22) THEN 3 
	 		 WHEN FILIAL_ID IN (32) THEN 4 
	 		 WHEN FILIAL_ID IN (34) THEN 5 
	 		 WHEN FILIAL_ID IN (35) THEN 6 
	 		 WHEN FILIAL_ID IN (36) THEN 7 
	 		 WHEN FILIAL_ID IN (37) THEN 8 
	 		 WHEN FILIAL_ID IN (38) THEN 9 
	 		 WHEN FILIAL_ID IN (50) THEN 10 
	 		 WHEN FILIAL_ID IN (40) THEN 11 
	 		 WHEN FILIAL_ID IN (75) THEN 12 
	    	 ELSE FILIAL_ORDER 
	END) AS FILIAL_ORDER , 
  (CASE 
			 WHEN FILIAL_ID IN (31) THEN '��������� �������' 
			 WHEN FILIAL_ID IN (30,59) THEN '������������� ������� (���+������������� ���������)' 
			 WHEN FILIAL_ID IN (40) THEN '������������� ���������' 
	         ELSE FILIAL_NAME 
	END) AS FILIAL_NAME, 
  (CASE 
  		WHEN ORG_KIND_ORDER=11 THEN 1 
  		WHEN ORG_KIND_ORDER=12 THEN 5 
		ELSE ORG_KIND_ORDER 
	END) AS ORG_KIND_ORDER, 
  (CASE 
  		WHEN ORG_KIND_ORDER=11 THEN '���������' 
  		WHEN ORG_KIND_ORDER=12 THEN '���' 
  		WHEN ORG_KIND_ORDER=0 THEN '�������' 
		ELSE ORG_KIND_NAME 
   END) AS ORG_KIND_NAME, 
  (CASE 
  	   WHEN GROUP_ORDER=140 THEN 130 
	   ELSE GROUP_ORDER 
  	END) AS GROUP_ORDER, 
  (CASE 
  	   WHEN GROUP_ORDER IN (130,140) THEN '�����������' 
	   ELSE GROUP_FULL_NAME 
  	END) AS GROUP_FULL_NAME, 
  FACT_REAL_VES, 
  PLAN_REAL_VES, 
  NORMA_REAL_VES 
FROM V_FIL_SUT_REAL 
ORDER BY FILIAL_ORDER 
		  			 	) 
GROUP BY 
        FILIAL_ORDER 
		,ORG_KIND_ORDER 
		,GROUP_ORDER 
ORDER BY 
        FILIAL_ORDER 
		,ORG_KIND_ORDER 
		,GROUP_ORDER;


