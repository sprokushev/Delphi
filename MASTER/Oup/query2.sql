
select distinct to_char(rep_date, 'day') as day, to_char(rep_date, 'dd.mm.yyyy') as d
from azsrepout, azssreportmain
where rep_date >= to_date('19.05.2003', 'dd.mm.yyyy')
and rep_date < to_date('25.05.2003') + 1
and azsrepout.company =2
and azsrepout.prn = azssreportmain.rn
and azssreportmain.azs_number = 721630
order by d


/*to_date('25.05.2003') (select min(rep_date) from azsrepout where rep_date > '25.05.2003')*/