--
-- FOR_PLANFACT  (Package) 
--
CREATE OR REPLACE PACKAGE MASTER.For_Planfact AS

  -- �������� ������� PLAN_FACT
  PROCEDURE EmptyPlanFact;
  
  -- ��������� ���� ��������
  PROCEDURE FillPlanPost (PlanId NUMBER, DateBeg VARCHAR2, DateEnd VARCHAR2, IsSNP NUMBER DEFAULT 0);
  
  -- ��������� "��������"
  PROCEDURE FillZayv (DateBeg VARCHAR2, DateEnd VARCHAR2, IsSNP NUMBER DEFAULT 0);

  -- ��������� "��������� �������"
  PROCEDURE FillEmptyVol (TimeEnd VARCHAR2, DateEnd VARCHAR2);
    
  -- ��������� ���� �� ����� ��������
  PROCEDURE FillFactPost (DateBegPlan VARCHAR2, DateEndPlan VARCHAR2, TimeBeg VARCHAR2, DateBeg VARCHAR2, TimeEnd VARCHAR2, DateEnd VARCHAR2, IsSNP NUMBER DEFAULT 0);
  
  -- ��������� ���� ���������
  PROCEDURE FillPlanGD (DateBeg VARCHAR2, DateEnd VARCHAR2);
  
  -- ��������� ���� �� ����� ���������
  PROCEDURE FillFactGD (TimeBeg VARCHAR2, DateBeg VARCHAR2, TimeEnd VARCHAR2, DateEnd VARCHAR2);

  -- ���������� �����/����� �� ����� ��������� � ��������  
  PROCEDURE FillAll (PlanId NUMBER, DateBegPlanPost VARCHAR2, DateEndPlanPost VARCHAR2,  
     TimeBegFactPost VARCHAR2, DateBegFactPost VARCHAR2, TimeEndFactPost VARCHAR2, DateEndFactPost VARCHAR2,
	 DateBegPlanGD VARCHAR2, DateEndPlanGD VARCHAR2,   
     TimeBegFactGD VARCHAR2, DateBegFactGD VARCHAR2, TimeEndFactGD VARCHAR2, DateEndFactGD VARCHAR2);
	 
  -- ���������� �����/����� �� ����� �������� ��� ���  
  PROCEDURE FillSNP (PlanId NUMBER, DateBegPlanPost VARCHAR2, DateEndPlanPost VARCHAR2,  
     TimeBegFactPost VARCHAR2, DateBegFactPost VARCHAR2, TimeEndFactPost VARCHAR2, DateEndFactPost VARCHAR2,
	 DateBegPlanGD VARCHAR2, DateEndPlanGD VARCHAR2,   
     TimeBegFactGD VARCHAR2, DateBegFactGD VARCHAR2, TimeEndFactGD VARCHAR2, DateEndFactGD VARCHAR2);
	 
  -- ���������� ����������� ������  
  PROCEDURE FillOper (PlanId NUMBER, DateBegPlanPost VARCHAR2, DateEndPlanPost VARCHAR2,  
     TimeBegFactPost VARCHAR2, DateBegFactPost VARCHAR2, TimeEndFactPost VARCHAR2, DateEndFactPost VARCHAR2,
	 DateBegPlanGD VARCHAR2, DateEndPlanGD VARCHAR2,   
     TimeBegFactGD VARCHAR2, DateBegFactGD VARCHAR2, TimeEndFactGD VARCHAR2, DateEndFactGD VARCHAR2);

  -- ���������� ������� ��� ����������������  
  PROCEDURE FillConf (PlanId NUMBER, DateBegPlanPost VARCHAR2, DateEndPlanPost VARCHAR2,  
     TimeBegFactPost VARCHAR2, DateBegFactPost VARCHAR2, TimeEndFactPost VARCHAR2, DateEndFactPost VARCHAR2,
	 DateBegPlanGD VARCHAR2, DateEndPlanGD VARCHAR2,   
     TimeBegFactGD VARCHAR2, DateBegFactGD VARCHAR2, TimeEndFactGD VARCHAR2, DateEndFactGD VARCHAR2);
	 
END;

/

