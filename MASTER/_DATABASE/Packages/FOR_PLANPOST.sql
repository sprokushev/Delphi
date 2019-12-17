--
-- FOR_PLANPOST  (Package) 
--
CREATE OR REPLACE PACKAGE MASTER.FOR_PLANPOST AS
  PLAN_PERIODS_ID PLAN_PERIODS.ID%TYPE;

  -- ������� �������� ������
  -- ���������� PLAN_PERIODS.ID
  FUNCTION NewPeriod (PlanID NUMBER, DatePlan DATE, BeginDate DATE, EndDate DATE) RETURN NUMBER;

  -- �������� �������� ������
  PROCEDURE ChangePeriod (PlanPerID NUMBER, DatePlan DATE, BeginDate DATE, EndDate DATE);

  -- ������� �������� ������
  PROCEDURE DeletePeriod (PlanPerID NUMBER);

  -- ����������� �����
  -- ���������� PLAN_PERIODS.ID
  FUNCTION CopyPlan (PlanPerIdFrom NUMBER, PlanIdTo NUMBER) RETURN NUMBER;

  -- ��������� �����
  PROCEDURE NewIzm (TableID VARCHAR2 DEFAULT 'POST', PlanPerID NUMBER, NumIzm NUMBER, NumCheck NUMBER);

  -- ���������� ��������� ������� ��� �����/�������������� ������� �����
  -- ���������� ���������� ��� ��������� �������
  FUNCTION FillTempPayForms(IsAdd NUMBER, PlanId NUMBER, PlanPerId NUMBER, ProdId VARCHAR2, PlanStruId NUMBER, DogId NUMBER, RefineryId NUMBER DEFAULT 8, OrgStruId NUMBER DEFAULT NULL) RETURN VARCHAR2;

  -- ���������� ��� �� ��������� �������
  PROCEDURE FillTempPrices(PlanPerId NUMBER, ProdId VARCHAR2, DogId NUMBER);

  -- ���������� ��������� �� ��������� ������� � PLAN_POST
  FUNCTION AddPlanPost(EditId NUMBER, PlanId NUMBER, PlanPerId NUMBER, ProdId VARCHAR2, PlanStruId NUMBER, DogId NUMBER, 
                           RefineryId NUMBER, OrgStruId NUMBER, PayFormId NUMBER, Price NUMBER, Ves NUMBER, CatCenId NUMBER, DateCena DATE) RETURN NUMBER;

  -- ������� ��������� �������
  PROCEDURE ClearTempPayForms(TempTableName VARCHAR2);

  -- ������� ������� �����
  PROCEDURE DeletePlanPost(EditId NUMBER);

END;
/

