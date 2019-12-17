select dbo.UTCFILETIMEToDateTime(time)as EventTime,source,value,TransactionId,EventId
from ems_vw_EMSEvents 
where Source in('ID11STR','ID12STR','ID21STR','ID22STR','STATUS11','STATUS12','STATUS21','STATUS22','VES11','VES12','VES21','VES22',
'VZLIV11','VZLIV12','VZLIV21','VZLIV22','TEMPER11','TEMPER12','TEMPER21','TEMPER22','XPL11','XPL12','XPL21','XPL22')
and dbo.UTCFILETIMEToDateTime(time)>={ts '2007-03-28 00:00:00.000'}
order by TransactionId,Source