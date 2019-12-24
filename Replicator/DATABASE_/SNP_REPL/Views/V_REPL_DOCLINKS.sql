--
-- V_REPL_DOCLINKS  (View) 
--
CREATE OR REPLACE FORCE VIEW SNP_REPL.V_REPL_DOCLINKS
(REPL_RN, REPL_USERNAME, REPL_TABLENAME, REPL_TABLERN, REPL_MODIFDATE, 
 REPL_OPERATION, REPL_AUTHID)
AS 
select /*+ RULE */
-- Связь по ВХОДУ (добавление)
i.RN+6000000000000 as REPL_RN,
'PARUS' as USERNAME,
'DOCLINKS' as TABLENAME,
l.RN as TABLERN,
i.MODIFDATE,
i.OPERATION,
i.AUTHID
from parus.updatelist i,parus.doclinks l
where i.TABLENAME='DOCINPT'
and i.tablern=l.in_doc
and i.operation IN ('I','U')
UNION ALL
-- Связь по ВЫХОДУ (добавление)
select /*+ RULE */
o.RN+7000000000000 as REPL_RN,
'PARUS' as USERNAME,
'DOCLINKS' as TABLENAME,
l.RN as TABLERN,
o.MODIFDATE,
o.OPERATION,
o.AUTHID
from parus.updatelist o,parus.doclinks l
where o.TABLENAME='DOCOUTPT'
and o.tablern=l.out_doc
and o.operation IN ('I','U')
UNION ALL
-- Удаления связей
select /*+ RULE */
u.RN+8000000000000 as REPL_RN,
'PARUS' as USERNAME,
u.TABLENAME,
u.TABLERN,
u.MODIFDATE,
u.OPERATION,
u.AUTHID
from parus.updatelist u
where u.TABLENAME='DOCLINKS'
and u.operation='D';


