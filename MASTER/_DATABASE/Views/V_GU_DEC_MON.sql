--
-- V_GU_DEC_MON  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_GU_DEC_MON
(COLUMN_A, COLUMN_B, COLUMN_C, COLUMN_D, COLUMN_E, 
 COLUMN_F, COLUMN_G, COLUMN_H, COLUMN_I, COLUMN_J)
AS 
select 
COLUMN_A, 
COLUMN_B, 
COLUMN_C, 
COLUMN_D, 
sum(COLUMN_E) as COLUMN_E, 
sum(COLUMN_F) as COLUMN_F, 
sum(COLUMN_G) as COLUMN_G, 
sum(COLUMN_H) as COLUMN_H, 
sum(COLUMN_I) as COLUMN_I, 
sum(COLUMN_J) as COLUMN_J
from 
(

select 
-- ����� �� ����� (3, E) 
       Null                               as COLUMN_A,  -- ���� 
       0                                  as COLUMN_B,  -- ����������� �������� �� ��������� 
       T2.NAME_NPR                        as COLUMN_C,  -- ������� 
       (case T1.LOAD_ABBR when '���' 
		  then T3.PREDPR_NAME || ' (�/�)' 
	      else T3.PREDPR_NAME || ' (�/�)' 
        end)                              as COLUMN_D, 
       T1.VES                                  as COLUMN_E,  -- ����� �� �����, �� 
       0                        as COLUMN_F,  -- �������� �� �������, �� 
       0                                  as COLUMN_G,  -- ������� �� �����, �� 
       0                                  as COLUMN_H,  -- ���������� �� �������, �� 
       0                                  as COLUMN_I,  -- ���� �� �����, �� 
       0                                  as COLUMN_J,   -- ���������� �� ������� �� �����, ��
       T1.input_number 
from V_MASTER_REPORTS V1, ZAKAZ T1 
join KLS_PROD T2 on (T1.PROD_ID_NPR = T2.ID_NPR) 
join KLS_PREDPR T3 on (T1.PLAT_ID = T3.ID) 
where (T1.DATE_PLAN between V1.BEGIN_DATE and Last_Day(V1.BEGIN_DATE)) and 
      (Nls_Upper(V1.REPORT_FILE) = 'GU_DEC.XLS') and 
      t1.is_agent=1 and
      t1.is_accept=1
union all
select 
-- ����� �� ����� (3, E) 
       Null                               as COLUMN_A,  -- ���� 
       0                                  as COLUMN_B,  -- ����������� �������� �� ��������� 
       T2.NAME_NPR                        as COLUMN_C,  -- ������� 
       (case T1.LOAD_ABBR when '���' 
		  then T3.PREDPR_NAME || ' (�/�)' 
	      else T3.PREDPR_NAME || ' (�/�)' 
        end)                              as COLUMN_D, 
       T1.TONN_DECLARED                                  as COLUMN_E,  -- ����� �� �����, �� 
       0                        as COLUMN_F,  -- �������� �� �������, �� 
       0                                  as COLUMN_G,  -- ������� �� �����, �� 
       0                                  as COLUMN_H,  -- ���������� �� �������, �� 
       0                                  as COLUMN_I,  -- ���� �� �����, �� 
       0                                  as COLUMN_J,   -- ���������� �� ������� �� �����, ��
       T1.nom_zd 
from V_MASTER_REPORTS V1, MONTH T1 
join KLS_PROD T2 on (T1.PROD_ID_NPR = T2.ID_NPR) 
join KLS_DOG D on (T1.DOG_ID = D.ID) 
join KLS_PREDPR T3 on (D.PREDPR_ID = T3.ID) 
where (T1.DATE_PLAN between V1.BEGIN_DATE and Last_Day(V1.BEGIN_DATE)) and 
      (Nls_Upper(V1.REPORT_FILE) = 'GU_DEC.XLS') and 
      T1.is_exp=1
)      
group by 
COLUMN_A, COLUMN_B, COLUMN_C, COLUMN_D;


