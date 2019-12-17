--
-- V_SNPORDEXP_OUTPUT_KSE  (View) 
--
CREATE OR REPLACE FORCE VIEW MASTER.V_SNPORDEXP_OUTPUT_KSE
(CONTRACT1NUM, ORDROWCODE, ORDDATE, ORDNUM, DELIVDATE, 
 CUSTCODE, PAYERCODE, CONSIGNEECODE, USERCODE, CONTRACT2NUM, 
 CONTRACT2DATE, PRICECAT, PRODCODE, WEIGHT, VOLUME, 
 PRICENOTAX, UNIT, SHIPTYPE, DISPSTAN, ENDSTAN, 
 UNLOADTERM, CONTRACT3NUM_SUBA, CONTRACT3DATE_SUBA, SUPPLIERCODE_SUBA, PAYERCODE_SUBA, 
 SALEPRICENOTAX_SUBA, UNIT_SUBA, NOTE, SPECNOTE, LETTERNUM, 
 LETTERDATE, UNLOADTERM2, "orderid")
AS 
select luk_dog.isu_kod_dog as contract1num,
         zakaz_hist.id as ordrowcode, zakaz_hist.input_date as orddate,
         zakaz_hist.client_number/* ||'/'|| zakaz_hist.input_number*/ as ordnum,
         last_day(zakaz.date_plan) as delivdate,
         969 as custcode, payerpr.ksss_predpr_id as payercode,
         consignpr.ksss_predpr_id as consigneecode, userpr.ksss_predpr_id as usercode,
         ''/*kls_dog.isu_kod_dog*/ as contract2num, ''/*kls_dog.dog_date*/ as contract2date,
         '' as pricecat, kls_prod.ksss_prod_id as prodcode,
         zakaz_hist.load_ves as weight, 0 as volume,
         0 as pricenotax, '�' as unit,
         case kls_load_type.id
            when 1 then 3 when 6 then 3
            when 2 then 1
            when 3 then 5
            when 4 then 6
            else 0
         end as shiptype,
         case nvl(kls_stan.ksss_stan_id, 0)
           when 0 then null
           else 'RR11229'/*'2520'*/
         end as dispstan,
         kls_stan.isu_kod/*ksss_stan_id*/ as endstan, kls_vetka.vetka_name as unloadterm,
         '' as contract3num_suba, '' as contract3date_suba,
         0 as suppliercode_suba, 969/*payerpr.ksss_predpr_id*/ as payercode_suba,
         0 as salepricenotax_suba, '' as unit_suba,
         '' as note, '' as specnote, '' as letternum,
         '' as letterdate, '' as unloadterm2,
         zakaz_hist.id as orderid -- ��� ���� ������ ���������, ����� ��� ����������� ��������
  from zakaz
       left join kls_dog luk_dog on luk_dog.id=zakaz.lukdog_id
       join zakaz_hist on zakaz_hist.zakaz_id=zakaz.id
       left join t_snpordexp_uploadord_kse uo on uo.orderid=zakaz_hist.id
       join kls_predpr payerpr on payerpr.id=zakaz.plat_id
       left join kls_predpr consignpr on consignpr.id=zakaz.poluch_id
       left join kls_predpr userpr on userpr.id=zakaz.potreb_id
       left join kls_dog on kls_dog.id=zakaz.dog_id
       join kls_prod on kls_prod.id_npr=zakaz.prod_id_npr
       join kls_vid_otgr on kls_vid_otgr.load_abbr=zakaz.load_abbr
       join kls_load_type on kls_load_type.id=kls_vid_otgr.load_type_id
       left join kls_stan on kls_stan.id=zakaz.stan_id
       left join kls_vetka on kls_vetka.id=zakaz.vetka_id
  where zakaz.is_agent=2 and zakaz_hist.status_zakaz_id=20 and
        uo.orderid is null;

COMMENT ON COLUMN MASTER.V_SNPORDEXP_OUTPUT_KSE.CONTRACT1NUM IS '����� ��������';

COMMENT ON COLUMN MASTER.V_SNPORDEXP_OUTPUT_KSE.ORDROWCODE IS '��� ������ ����������';

COMMENT ON COLUMN MASTER.V_SNPORDEXP_OUTPUT_KSE.ORDDATE IS '���� ����������';

COMMENT ON COLUMN MASTER.V_SNPORDEXP_OUTPUT_KSE.ORDNUM IS '����� ����������';

COMMENT ON COLUMN MASTER.V_SNPORDEXP_OUTPUT_KSE.DELIVDATE IS '������ �������� ����������. ���� ������ �������� ����������';

COMMENT ON COLUMN MASTER.V_SNPORDEXP_OUTPUT_KSE.CUSTCODE IS '��� ���� ���������';

COMMENT ON COLUMN MASTER.V_SNPORDEXP_OUTPUT_KSE.PAYERCODE IS '��� ���� ����������� �� ��������� �����';

COMMENT ON COLUMN MASTER.V_SNPORDEXP_OUTPUT_KSE.CONSIGNEECODE IS '��� ���� ���������������';

COMMENT ON COLUMN MASTER.V_SNPORDEXP_OUTPUT_KSE.USERCODE IS '��� ���� �����������';

COMMENT ON COLUMN MASTER.V_SNPORDEXP_OUTPUT_KSE.CONTRACT2NUM IS '����������� ����� ���������� ��������';

COMMENT ON COLUMN MASTER.V_SNPORDEXP_OUTPUT_KSE.CONTRACT2DATE IS '���� ���������� ��������';

COMMENT ON COLUMN MASTER.V_SNPORDEXP_OUTPUT_KSE.PRICECAT IS '��������� ����. ����� ������� ���������� ������ �� �������� � ���������� �������';

COMMENT ON COLUMN MASTER.V_SNPORDEXP_OUTPUT_KSE.PRODCODE IS '��� ���� ��������';

COMMENT ON COLUMN MASTER.V_SNPORDEXP_OUTPUT_KSE.WEIGHT IS '����� ��� ������ � ��';

COMMENT ON COLUMN MASTER.V_SNPORDEXP_OUTPUT_KSE.VOLUME IS '��������������� ����� ������ � ������ (��� �������)';

COMMENT ON COLUMN MASTER.V_SNPORDEXP_OUTPUT_KSE.PRICENOTAX IS '���� ����� ��� �������, ���.';

COMMENT ON COLUMN MASTER.V_SNPORDEXP_OUTPUT_KSE.UNIT IS '��������� ��: � � �����, �� � ���������, �� � �����, � � ����';

COMMENT ON COLUMN MASTER.V_SNPORDEXP_OUTPUT_KSE.SHIPTYPE IS '��� ��������: 1 � ������������� �����., 2 � ����, 3 � �/� �����., 5 � ������ �����., 6 � �������������� �����.';

COMMENT ON COLUMN MASTER.V_SNPORDEXP_OUTPUT_KSE.DISPSTAN IS '��� �������, ����� ��� ��������� (��� �������� �� �����) ����������� � ��������� ��';

COMMENT ON COLUMN MASTER.V_SNPORDEXP_OUTPUT_KSE.ENDSTAN IS '��� �������, ����� ��� ��������� (��� �������� �� �����) ���������� � ��������� ��';

COMMENT ON COLUMN MASTER.V_SNPORDEXP_OUTPUT_KSE.UNLOADTERM IS '����� ��������. ���������� � ����������, ���� ���� ������� �� ������� ������� �� ����������� �����';

COMMENT ON COLUMN MASTER.V_SNPORDEXP_OUTPUT_KSE.CONTRACT3NUM_SUBA IS '����� �������� ��� ���������� �� ������������ �����';

COMMENT ON COLUMN MASTER.V_SNPORDEXP_OUTPUT_KSE.CONTRACT3DATE_SUBA IS '���� ��������, ���������� � ���� CONTRACT3NUM_SUBA';

COMMENT ON COLUMN MASTER.V_SNPORDEXP_OUTPUT_KSE.SUPPLIERCODE_SUBA IS '��� ���� ���������� ������ ��������� �������';

COMMENT ON COLUMN MASTER.V_SNPORDEXP_OUTPUT_KSE.PAYERCODE_SUBA IS '���������� �� ������������ �����. ��� ���� �������';

COMMENT ON COLUMN MASTER.V_SNPORDEXP_OUTPUT_KSE.SALEPRICENOTAX_SUBA IS '���� ������� �� ������������ ����� ��� ����� �������, ���.';

COMMENT ON COLUMN MASTER.V_SNPORDEXP_OUTPUT_KSE.UNIT_SUBA IS '��������� �� �� ������������ �����: � � �����, �� � ���������, �� � �����, � � ����';

COMMENT ON COLUMN MASTER.V_SNPORDEXP_OUTPUT_KSE.NOTE IS '���������� � ���������, ������';

COMMENT ON COLUMN MASTER.V_SNPORDEXP_OUTPUT_KSE.SPECNOTE IS '������ ������� � ���������, ������';

COMMENT ON COLUMN MASTER.V_SNPORDEXP_OUTPUT_KSE.LETTERNUM IS '����� ������ � ������ ������ �� ��������';

COMMENT ON COLUMN MASTER.V_SNPORDEXP_OUTPUT_KSE.LETTERDATE IS '���� ������ � ������ ������ �� ��������';

COMMENT ON COLUMN MASTER.V_SNPORDEXP_OUTPUT_KSE.UNLOADTERM2 IS '����� �������� � ���. ������ �.';



