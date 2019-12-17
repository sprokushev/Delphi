SET DELE ON
SET DATE TO GERMAN
SET CENT ON
close databases

use ('u:\luk\dbases\kvit.dbf') in 0 
use ('u:\luk\gd\dbf\gd_plan2.dbf') in 0 
use ('u:\luk\dbases\predpr.dbf') in 0 

select ;
  kod_predpr,;
  predpr.naim,;
  IIF(export=1,'êéëëàü','ùäëèéêí') as exp,;
  SUM(plan_cist-plan_csob) as mps_cis,;
  SUM(plan_ves-plan_vsob) as mps_ves,;
  SUM(IIF(export=2,plan_csob,0000000000)) as sob_cis,;
  SUM(IIF(export=2,plan_vsob,0000000000.000)) as sob_ves,;
  SUM(IIF(export=2,0000000000,plan_csob)) as arend_cis,;
  SUM(IIF(export=2,0000000000.000,plan_vsob)) as arend_ves,;
  SUM(plan_cist) as all_cis,;
  SUM(plan_ves) as all_ves;
from gd_plan2,predpr;
into table ('c:\tmp\plan');
where date_plan between {01.01.2003} and {31.01.2003};
  and kod_predpr=predpr.kod;
  and (tip_otgr=1);
group by kod_predpr,export


select ;
  kod_grotp,;
  predpr.naim,;
  IIF(prizn_mps<>3,'êéëëàü','ùäëèéêí') as exp,;
  (IIF(tipv=3,1,0000000000)) as mps_cis,;
  (IIF(tipv=3,IIF(kod_otgr=4,ves_brutto,ves),0000000000.000)) as mps_ves,;
  (IIF(tipv=3,0000000000,IIF(prizn_mps=3,1,0000000000))) as sob_cis,;
  (IIF(tipv=3,0000000000.000,IIF(prizn_mps=3,IIF(kod_otgr=4,ves_brutto,ves),0000000000.000))) as sob_ves,;
  (IIF(tipv=3,0000000000,IIF(prizn_mps=3,0000000000,1))) as arend_cis,;
  (IIF(tipv=3,0000000000.000,IIF(prizn_mps=3,0000000000.000,IIF(kod_otgr=4,ves_brutto,ves)))) as arend_ves,;
  0000000001 as all_cis,;
  IIF(kod_otgr=4,ves_brutto,ves) as all_ves;
from kvit,predpr;
into table ('c:\tmp\fact_v');
where date_otgr>={01.01.2003} ;
  and date_otgr<={31.01.2003};
  and (tip_otgr=1);
  and kvit.kod_grotp=predpr.kod

SELECT;
  kod_grotp,;
  naim,;
  exp,;
  SUM(mps_cis) as mps_cis,;
  SUM(mps_ves) as mps_ves,;
  SUM(sob_cis) as sob_cis,;
  SUM(sob_ves) as sob_ves,;
  SUM(arend_cis) as arend_cis,;
  SUM(arend_ves) as arend_ves, ;
  SUM(all_cis) as all_cis,;
  SUM(all_ves) as all_ves;
FROM fact_v;
into table ('c:\tmp\fact');
group by 1,3  


select ;
  plan.naim,;
  plan.exp,;
  plan.mps_cis as mps_cis_p,;
  ROUND(plan.mps_ves/1000,0) as mps_ves_p,;
  plan.sob_cis as sob_cis_p,;
  ROUND(plan.sob_ves/1000,0) as sob_ves_p,;
  plan.arend_cis as arend_cis_p,;
  ROUND(plan.arend_ves/1000,0) as arend_ves_p,;
  plan.all_cis as all_cis_p,;
  ROUND(plan.all_ves/1000,0) as all_ves_p,;
  fact.mps_cis,;
  ROUND(fact.mps_ves/1000,0) as mps_ves,;
  fact.sob_cis,;
  ROUND(fact.sob_ves/1000,0) as sob_ves,;
  fact.arend_cis,;
  ROUND(fact.arend_ves/1000,0) as arend_ves,;
  fact.all_cis,;
  fact.all_ves;
from plan,fact ;
into table ('c:\tmp\pl_fact');
where ;
  plan.kod_predpr=fact.kod_grotp ;
  and plan.exp=fact.exp  
  
  