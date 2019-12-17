--
-- FOR_PLANFACT_PARUS  (Package) 
--
CREATE OR REPLACE PACKAGE MASTER.For_Planfact_Parus AS

  -- �������� ������� PLAN_FACT
  PROCEDURE EmptyPlanFact;
  
  -- ��������� ����
  PROCEDURE FillPlan (DateBeg VARCHAR2, DateEnd VARCHAR2);
  
  -- ��������� "��������"
  PROCEDURE FillZayv (DateBeg VARCHAR2, DateEnd VARCHAR2);

  -- ��������� ����
  PROCEDURE FillFact (DateBeg VARCHAR2, DateEnd VARCHAR2);
  
  -- ���������� �����/����� �� ����� ��������� � ��������  
  PROCEDURE FillAll (DateBeg VARCHAR2, DateEnd VARCHAR2);
	 
END;

/

