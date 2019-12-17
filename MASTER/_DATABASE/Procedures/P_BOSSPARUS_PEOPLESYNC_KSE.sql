--
-- P_BOSSPARUS_PEOPLESYNC_KSE  (Procedure) 
--
CREATE OR REPLACE PROCEDURE MASTER.p_bossparus_peoplesync_kse as
/*


*/
--type TAgnRec is record(
--  abbr AGNLIST.AGNABBR%type;
--  name AGNLIST.AGNNAME%type;
--  isemp AGNLIST.EMP%type;
--  sex AGNLIST.SEX%type;
--  objectcode DOCS_PROPS_VALS.STR_VALUE%type
--);
--AgnRec TAgnRec;
type TNumArray is varray(4) of number(2);

nRN number(17); -- AGNLIST.RN%type
nCRN number(17); -- AGNLIST.CRN%type
sAgnAbbr varchar2(20); -- �������� �����������
sContrNum varchar2(2); -- ���������� ����� ����������, ���� ���������� ������� �����
sz TNumArray; -- ����� �������, ���-�� ��������, ����� �����, ����� ��������
begin

for rec in (
  select *
  from load_buffer.t_bossparus_peoplesync_kse
) loop
  
  begin
  -- �������� �� ������������ �� ���, �����������, ��� ��������� ��� ����������
--  select contr.AGNABBR, contr.AGNNAME, contr.EMP,
--         contr.SEX, props.STR_VALUE as objectcode
--  into AgnRec
--  from AGNLIST@P5TEST.WORLD contr left join (
--      select dpv.UNIT_RN, dpv.STR_VALUE
--      from DOCS_PROPS_VALS@P5TEST.WORLD dpv
--            join DOCS_PROPS@P5TEST.WORLD dp on dp.RN=dpv.DOCS_PROP_RN
--      where dpv.UNITCODE='AGNLIST' and dp.CODE_UC='������'
--      ) props on props.UNIT_RN=contr.RN
--  where trim(contr.AGNIDNUMB)=rec.ITN and contr.AGNTYPE=1  
  select contr.RN, props.STR_VALUE as objectcode
  into nRN, ObjectCode
  from AGNLIST@P5TEST.WORLD contr left join (
      select dpv.UNIT_RN, dpv.STR_VALUE
      from DOCS_PROPS_VALS@P5TEST.WORLD dpv
           join DOCS_PROPS@P5TEST.WORLD dp on dp.RN=dpv.DOCS_PROP_RN
      where dpv.UNITCODE='AGNLIST' and dp.CODE_UC='������'
      ) props on props.UNIT_RN=contr.RN
  where trim(contr.AGNIDNUMB)=rec.ITN and contr.AGNTYPE=1;

  exception
  when NO_DATA_FOUND then -- ���� �� ����������, ���������
    begin
    -- ��������� �������� �����������
    sz:=TNumArray(length(rec.Surname), 1, 1, 1);
    sContrNum:='';
    loop
      -- ������ ������ ���������
      sAgnAbbr:=substr((ltrim(rec.Surname), 1, sz(1)) ||
                lpad('', sz(2)) ||
                substr(ltrim(rec.Name), 1, sz(3)) ||'.'||
                substr(ltrim(rec.Patronymic), 1, sz(4)) ||'.'||
                sContrNum;
      -- ���� �� ����� � �����������
      select count(rn)
      into nRN
      from AGNLIST
      where AGNABBR=sAgnAbbr;

      -- ����� �������� ��� ��������� �������, ���� �����������
      
      
      -- �������, ���� �� ���������
      exit when length(sAgnAbbr)<=20 and nRN=0;
    end loop;
          
    
    P_AGNLIST_INSERT@oracle.world(/*nCOMPANY*/2, nCRN,
        /*AGNABBR*/sAgnAbbr,
        /*AGNTYPE*/1,
        /*AGNNAME*/rec.Surname ||' '|| rec.Name ||' '|| rec.Patronymic,
        /*AGNIDNUMB*/rec.ITN,
        null, null, null, null, null, null, null, null, null, null, null,
        /*EMP*/rec.IsEmployee,   -- ������� ���������� (0 - �� ���������, 1 - ���������)
        null, null, null, null, null, null, null, null, null, null, null,
        /*nSEX*/2-1*rec.Sex,   -- ���
        null, null, null, null, null, null, null,
        nRN);
    end;
  end;
  -- ��������� ���
  if trim(ObjectCode)<>trim(rec.ObjectCode) then
    P_DOCS_PROPS_MODIFY@P5TEST.WORLD(/*nCOMPANY*/2, nRN, /*sUNITCODE*/'AGNLIST',
        /*sCODE*/'������', null, /*sSTR_VALUE*/rec.ObjectCode,
        /*nNUM_VALUE*/null, /*dDATE_VALUE*/null);
  end if;
  
  commit;
end loop;

end p_bossparus_peoplesync_kse;

/

