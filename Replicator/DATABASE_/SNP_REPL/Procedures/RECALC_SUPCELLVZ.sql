--
-- RECALC_SUPCELLVZ  (Procedure) 
--
CREATE OR REPLACE PROCEDURE SNP_REPL.recalc_supcellvz (
--TASK :пересчет товарного запаса по местам хранения
--Warning:парметр - RN товарного запаса
--11.10.04 VZhukow, 12.10.2004 PSV
nrn_ IN Number
)
as
ncell_ NUMBER;
nrash_quant NUMBER;
nrash_aquant NUMBER;
nprih_quant NUMBER;
nprih_aquant NUMBER;
nquant_ NUMBER;
naquant_ NUMBER;
begin

for mas in
(
select /*+ RULE */ SP.RN,SP.COMPANY,SP.CELL,SP.GOODSSUPPLY,GP.NOMMODIF
from STPLGOODSSUPPLY SP, GOODSSUPPLY GS, GOODSPARTIES GP
where SP.GOODSSUPPLY   = GS.RN
and GS.PRN           = GP.RN
and SP.GOODSSUPPLY=nrn_
and SP.COMPANY=2
)
loop

  nprih_quant:=0;
  nrash_quant:=0;
  nprih_aquant:=0;
  nrash_aquant:=0;

  select /*+ RULE */
    NVL(SUM(decode(T.oper_type,1,T.QUANT,0)),0) as NQAUNT_RASH,
    NVL(SUM(decode(T.oper_type,1,T.QUANTALT,0)),0) as NQAUNTALT_RASH,
    NVL(SUM(decode(T.oper_type,0,T.QUANT,0)),0) as NQAUNT_prih,
    NVL(SUM(decode(T.oper_type,0,T.QUANTALT,0)),0) as NQAUNTALT_prih
  into
    nrash_quant,
    nrash_aquant,
    nprih_quant,
    nprih_aquant
  from
    STRPLOPRJRNL T,
    GOODSSUPPLY GS,
    GOODSPARTIES GP
  where T.GOODSSUPPLY = GS.RN
    and T.GOODSSUPPLY=mas.GOODSSUPPLY
    and GS.PRN = GP.RN
    and GP.NOMMODIF = mas.nommodif
    and T.Cell = mas.cell
	AND T.company=mas.company;

  nquant_:= nprih_quant-  nrash_quant;
  naquant_:= nprih_aquant-nrash_aquant;
  if nquant_<0 then
    nquant_:=0;
  end if;
  if naquant_<0 then
    naquant_:=0;
  end if;	 
  update STPLGOODSSUPPLY CC
     set cc.quant =nquant_, cc.quantalt = naquant_
   where cc.rn = mas.rn;
  commit;
end loop;
end;
/


