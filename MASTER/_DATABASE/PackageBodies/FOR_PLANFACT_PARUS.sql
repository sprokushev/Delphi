--
-- FOR_PLANFACT_PARUS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY MASTER.For_Planfact_Parus AS

  -- �������� ������� PLAN_FACT
  PROCEDURE EmptyPlanFact IS
  BEGIN
    DELETE FROM PLAN_FACT
    WHERE TERMINAL_NAME = For_Init.GetCurrTerm
      AND OSUSER_NAME = For_Init.GetCurrUser;
    COMMIT;	 
  END;
  
  -- ��������� ����
  PROCEDURE FillPlan (DateBeg VARCHAR2, DateEnd VARCHAR2) IS
	pDateBeg DATE;
	pDateEnd DATE;
	NumDay NUMBER;
	MaxDay NUMBER;
    vDateBeg DATE;
	vDateEnd DATE;
  BEGIN
    pDateBeg:=TO_DATE(DateBeg,'dd.mm.yyyy'); 
    pDateEnd:=TO_DATE(DateEnd,'dd.mm.yyyy'); 

	vDateBeg:=TRUNC(pDateBeg,'MONTH'); -- ������ ������
	vDateEnd:=LAST_DAY(pDateEnd); -- ����� ������

	NumDay:=TO_NUMBER(TO_CHAR(pDateEnd,'dd'));
	MaxDay:=TO_NUMBER(TO_CHAR(vDateEnd,'dd'));
	
    -- ��������� ���� �� ��������� �������
    INSERT INTO PLAN_FACT (TIP_ROW, GROUP_ORDER, NB_NAME, NOMMODIF_NAME, DICNOMNS_RN, NOMMODIF_RN,
	  CONTRACTS_RN,CONTRACTS_NUMB,AGENT_RN,AGENT_NAME,STAGES_RN,FACEACC_RN,FACEACC_CODE,
	  DATE_PLAN,PLAN_MON_V,PLAN_NAR_V) 
    SELECT
        '�����' AS TIP_ROW,
		1,
        NB_NAME, 
		NOMMODIF_NAME, 
		DICNOMNS_RN, 
		NOMMODIF_RN, 
		CONTRACTS_RN,
		CONTRACTS_NUMB,
		AGENT_RN,
		AGENT_NAME, 
        STAGES_RN, 
		FACEACC_RN, 
		FACEACC_CODE, 
        pDateEnd AS DATE_PLAN,
        SUM(A.PLAN_VES) AS PLAN_MON_V,
        SUM(A.PLAN_VES/MaxDay*NumDay) AS PLAN_NAR_V
      FROM VANEEV.V_FILIALS_PLAN_PSV@ORACLE.WORLD A
      WHERE A.DOC_DATE BETWEEN vDateBeg AND vDateEnd
      GROUP BY     
        NB_NAME, 
		NOMMODIF_NAME, 
		DICNOMNS_RN, 
		NOMMODIF_RN, 
		CONTRACTS_RN, 
		CONTRACTS_NUMB,
		AGENT_RN,
		AGENT_NAME, 
        STAGES_RN, 
		FACEACC_RN, 
		FACEACC_CODE; 

    COMMIT;
  END; 
  
  -- ��������� "��������"
  PROCEDURE FillZayv (DateBeg VARCHAR2, DateEnd VARCHAR2) IS
	pDateBeg DATE;
	pDateEnd DATE;
    vDateBeg DATE;
	vDateEnd DATE;
  BEGIN
    pDateBeg:=TO_DATE(DateBeg,'dd.mm.yyyy'); 
    pDateEnd:=TO_DATE(DateEnd,'dd.mm.yyyy'); 

	vDateBeg:=TRUNC(pDateBeg,'MONTH'); -- ������ ������
	vDateEnd:=LAST_DAY(pDateEnd); -- ����� ������

    INSERT INTO PLAN_FACT (TIP_ROW, GROUP_ORDER, NB_NAME, NOMMODIF_NAME, DICNOMNS_RN, NOMMODIF_RN,
	  CONTRACTS_RN,CONTRACTS_NUMB,AGENT_RN,AGENT_NAME,STAGES_RN,FACEACC_RN,FACEACC_CODE,
	  ZAYV_RN,ZAYV_PREF,TIP_OTGR_RN,TIP_OTGR_NAME,PAYTYPE_RN,PAYTYPE_NAME,
	  POLUCH_RN,POLUCH_NAME,DATE_ZAYV,ZAYV) 
    SELECT
        '�����' AS TIP_ROW,
		2,
        NB_NAME, 
		NOMMODIF_NAME, 
		DICNOMNS_RN, 
		NOMMODIF_RN, 
		CONTRACTS_RN,
		CONTRACTS_NUMB,
		AGENT_RN,
		AGENT_NAME, 
        STAGES_RN, 
		FACEACC_RN, 
		FACEACC_CODE,
		ZAYV_RN,
		MAX(ZAYV_PREF),
		MAX(TIP_OTGR_RN),
		MAX(TIP_OTGR_NAME),
		MAX(PAYTYPE_RN),
		MAX(PAYTYPE_NAME),
	    MAX(POLUCH_RN),
		MAX(POLUCH_NAME), 
        pDateEnd AS DATE_ZAYV,
        SUM(A.ZAYV_VES) AS ZAYV
      FROM VANEEV.V_FILIALS_ZAYV_PSV@ORACLE.WORLD A
      WHERE A.DOC_DATE BETWEEN vDateBeg AND vDateEnd
      GROUP BY     
        NB_NAME, 
		NOMMODIF_NAME, 
		DICNOMNS_RN, 
		NOMMODIF_RN, 
		CONTRACTS_RN, 
		CONTRACTS_NUMB,
		AGENT_RN,
		AGENT_NAME, 
        STAGES_RN, 
		FACEACC_RN, 
		FACEACC_CODE, 
		ZAYV_RN;

	COMMIT;  
  END;
    
  -- ��������� ���� 
  PROCEDURE FillFact (DateBeg VARCHAR2, DateEnd VARCHAR2) IS
	pDateBeg DATE;
	pDateEnd DATE;
    vDateBeg DATE;
	vDateEnd DATE;
  BEGIN
    pDateBeg:=TO_DATE(DateBeg,'dd.mm.yyyy'); 
    pDateEnd:=TO_DATE(DateEnd,'dd.mm.yyyy'); 

	vDateBeg:=TRUNC(pDateBeg,'MONTH'); -- ������ ������
	vDateEnd:=LAST_DAY(pDateEnd); -- ����� ������

    INSERT INTO PLAN_FACT (TIP_ROW, GROUP_ORDER, NB_NAME, NOMMODIF_NAME, DICNOMNS_RN, NOMMODIF_RN,
	  CONTRACTS_RN,CONTRACTS_NUMB,AGENT_RN,AGENT_NAME,STAGES_RN,FACEACC_RN,FACEACC_CODE,
	  ZAYV_RN,TIP_OTGR_RN,TIP_OTGR_NAME,PAYTYPE_RN,PAYTYPE_NAME,
	  POLUCH_RN,POLUCH_NAME,DATE_FACT,FACT_V) 
    SELECT
        '�����' AS TIP_ROW,
		2,
        NB_NAME, 
		NOMMODIF_NAME, 
		DICNOMNS_RN, 
		NOMMODIF_RN, 
		CONTRACTS_RN,
		CONTRACTS_NUMB,
		AGENT_RN,
		AGENT_NAME, 
        STAGES_RN, 
		FACEACC_RN, 
		FACEACC_CODE,
		ZAYV_RN,
		MAX(TIP_OTGR_RN),
		MAX(TIP_OTGR_NAME),
		MAX(PAYTYPE_RN),
		MAX(PAYTYPE_NAME),
	    MAX(POLUCH_RN),
		MAX(POLUCH_NAME), 
        pDateEnd AS DATE_FACT,
        SUM(A.FACT_VES) AS FACT_V
      FROM VANEEV.V_FILIALS_FACT_PSV@ORACLE.WORLD A
      WHERE A.DOC_DATE BETWEEN vDateBeg AND vDateEnd
      GROUP BY     
        NB_NAME, 
		NOMMODIF_NAME, 
		DICNOMNS_RN, 
		NOMMODIF_RN, 
		CONTRACTS_RN, 
		CONTRACTS_NUMB,
		AGENT_RN,
		AGENT_NAME, 
        STAGES_RN, 
		FACEACC_RN, 
		FACEACC_CODE, 
		ZAYV_RN;
  
    COMMIT;
  END;
  

  -- ���������� �����/����� �� ����� ��������� � ��������  
  PROCEDURE FillAll (DateBeg VARCHAR2, DateEnd VARCHAR2) IS
  BEGIN
    EmptyPlanFact;
    FillPlan (DateBeg,DateEnd);
    FillZayv (DateBeg,DateEnd);
    FillFact (DateBeg,DateEnd);
	
	COMMIT;
  END;	 

END;

/

