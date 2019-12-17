select p.*
from kvit k,
parus_fin p
where k.ID=p.KVIT_ID
and p.AUTHID = 'HALFAEVA'
and k.sved_num in(5641,5642,5643,5646,5647,5648,5659,5670)

delete from parus_fin p
where p.KVIT_ID in (select k.id from kvit k
where p.AUTHID = 'HALFAEVA'
and k.sved_num in(5641,5642,5643,5646,5647,5648,5659,5670))

