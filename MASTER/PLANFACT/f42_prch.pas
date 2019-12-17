unit f42_prch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, RXSpin, Placemnt, Db, ADODB, ExtCtrls, Grids, DBGrids,variants,
  OracleData;

type
  Tf_f42_prich = class(TForm)
    GroupBox1: TGroupBox;
    l_date1: TLabel;
    date1: TDateTimePicker;
    date2: TDateTimePicker;
    l_date2: TLabel;
    ds_plan: TDataSource;
    q_plan: TADOQuery;
    q_fact_plat: TADOQuery;
    q_cmn: TADOQuery;
    q_cmn2: TADOQuery;
    q_grplp: TADOQuery;
    PF_Conn: TADOConnection;
    q_plansum: TADOQuery;
    q_fact_otgr: TADOQuery;
    rg_TypeSelect: TRadioGroup;
    l_date: TLabel;
    e_date: TDateTimePicker;
    e_time: TDateTimePicker;
    l_month: TLabel;
    cb_Month: TComboBox;
    l_year: TLabel;
    e_year: TRxSpinEdit;
    q_acc: TADOQuery;
    pbar: TProgressBar;
    rg_typeOtgr: TRadioGroup;
    q_month: TADOQuery;
    btPrichin: TBitBtn;
    q_plan_hist: TADOQuery;
    q_prichsum: TADOQuery;
    q_resurs: TADOQuery;
    q_JRSobstv: TADOQuery;
    q_RES_GRP: TADOQuery;
    Label1: TLabel;
    date_proizv_from: TDateTimePicker;
    Label2: TLabel;
    date_proizv_to: TDateTimePicker;
    q_new_prich: TADOQuery;
    ds_new_prich: TDataSource;
    q_seek_prich: TADOQuery;
    q_plansumkod_npr: TStringField;
    q_plansumkod_pos: TIntegerField;
    q_plansumkod_sgr: TIntegerField;
    q_plansumkod_spg: TIntegerField;
    q_plansumkod_rzd: TIntegerField;
    q_plansumkod_prz: TIntegerField;
    q_plansumkod_grp: TIntegerField;
    q_plansumnaim: TStringField;
    q_plansumd_ves: TBCDField;
    q_plansumv_ves: TBCDField;
    q_plansumd_sum: TBCDField;
    q_plansumv_sum: TBCDField;
    q_fact_platkod_npr: TStringField;
    q_fact_platkod_pos: TIntegerField;
    q_fact_platkod_sgr: TIntegerField;
    q_fact_platkod_spg: TIntegerField;
    q_fact_platkod_rzd: TIntegerField;
    q_fact_platkod_prz: TIntegerField;
    q_fact_platkod_grp: TIntegerField;
    q_fact_platnaim: TStringField;
    q_fact_platd_ves: TFloatField;
    q_fact_platv_ves: TFloatField;
    q_fact_platd_sum: TFloatField;
    q_fact_platv_sum: TFloatField;
    q_fact_platpf_ordnung: TIntegerField;
    q_fact_platkind_npr: TStringField;
    q_fact_platnaim_pr: TStringField;
    q_fact_platpg_gr_ordn: TIntegerField;
    q_fact_platpf_kod_gr: TStringField;
    q_fact_platpf_group: TStringField;
    q_fact_otgrkod_npr: TStringField;
    q_fact_otgrkod_pos: TIntegerField;
    q_fact_otgrkod_sgr: TIntegerField;
    q_fact_otgrkod_spg: TIntegerField;
    q_fact_otgrkod_rzd: TIntegerField;
    q_fact_otgrkod_prz: TIntegerField;
    q_fact_otgrkod_grp: TIntegerField;
    q_fact_otgrnaim: TStringField;
    q_fact_otgrd_ves: TBCDField;
    q_fact_otgrv_ves: TBCDField;
    q_fact_otgrd_sum: TBCDField;
    q_fact_otgrv_sum: TBCDField;
    q_fact_otgrpf_ordnung: TIntegerField;
    q_fact_otgrkind_npr: TStringField;
    q_fact_otgrnaim_pr: TStringField;
    q_fact_otgrpg_gr_ordn: TIntegerField;
    q_fact_otgrpf_kod_gr: TStringField;
    q_fact_otgrpf_group: TStringField;
    q_plankod_npr: TStringField;
    q_plankod_pos: TIntegerField;
    q_plankod_sgr: TIntegerField;
    q_plankod_spg: TIntegerField;
    q_plankod_rzd: TIntegerField;
    q_plankod_prz: TIntegerField;
    q_plankod_grp: TIntegerField;
    q_plankod_pgr: TIntegerField;
    q_plannaim: TStringField;
    q_pland_ves: TBCDField;
    q_planv_ves: TBCDField;
    q_pland_sum: TBCDField;
    q_planv_sum: TBCDField;
    q_planpf_ordnung: TIntegerField;
    q_plankind_npr: TStringField;
    q_plannaim_pr: TStringField;
    q_planpg_gr_ordn: TIntegerField;
    q_planpf_kod_gr: TStringField;
    q_planpf_group: TStringField;
    q_monthkod_npr: TStringField;
    q_monthkod_pos: TIntegerField;
    q_monthkod_sgr: TIntegerField;
    q_monthkod_spg: TIntegerField;
    q_monthkod_rzd: TIntegerField;
    q_monthkod_prz: TIntegerField;
    q_monthkod_grp: TIntegerField;
    q_monthnaim: TStringField;
    q_monthtonn: TBCDField;
    q_monthvvoddat: TDateField;
    q_monthpf_ordnung: TIntegerField;
    q_monthkind_npr: TStringField;
    q_monthnaim_pr: TStringField;
    q_monthpg_gr_ordn: TIntegerField;
    q_monthpf_kod_gr: TStringField;
    q_monthpf_group: TStringField;
    q_plan_histkod_npr: TStringField;
    q_plan_histkod_pos: TIntegerField;
    q_plan_histkod_sgr: TIntegerField;
    q_plan_histkod_spg: TIntegerField;
    q_plan_histkod_rzd: TIntegerField;
    q_plan_histkod_prz: TIntegerField;
    q_plan_histkod_grp: TIntegerField;
    q_plan_histkod_pgr: TIntegerField;
    q_plan_histnaim: TStringField;
    q_plan_histd_ves: TBCDField;
    q_plan_histv_ves: TBCDField;
    q_plan_histd_sum: TBCDField;
    q_plan_histv_sum: TBCDField;
    q_plan_histpf_ordnung: TIntegerField;
    q_plan_histkind_npr: TStringField;
    q_plan_histnaim_pr: TStringField;
    q_plan_histpg_gr_ordn: TIntegerField;
    q_plan_histpf_kod_gr: TStringField;
    q_plan_histpf_group: TStringField;
    q_prichsumordnung: TIntegerField;
    q_prichsumkod_npr: TStringField;
    q_prichsumnaim_pr: TStringField;
    q_prichsumkod_pos: TIntegerField;
    q_prichsumkod_sgr: TIntegerField;
    q_prichsumkod_spg: TIntegerField;
    q_prichsumkod_rzd: TIntegerField;
    q_prichsumkod_prz: TIntegerField;
    q_prichsumkod_grp: TIntegerField;
    q_prichsumnaim: TStringField;
    q_prichsumkod_sobs: TIntegerField;
    q_prichsumd_ves: TBCDField;
    q_prichsumv_ves: TBCDField;
    q_prichsumd_sum: TBCDField;
    q_prichsumv_sum: TBCDField;
    q_prichsumhd_ves: TBCDField;
    q_prichsumhv_ves: TBCDField;
    q_prichsumhd_sum: TBCDField;
    q_prichsumhv_sum: TBCDField;
    q_prichsumfd_ves: TBCDField;
    q_prichsumfv_ves: TBCDField;
    q_prichsumfd_sum: TBCDField;
    q_prichsumfv_sum: TBCDField;
    q_prichsumzayv_tonn: TBCDField;
    q_prichsumzayv_dat: TDateField;
    q_tmp_prich: TADOQuery;
    q_RES_GRPkod_npr: TStringField;
    q_RES_GRPnaim: TStringField;
    q_RES_GRPkod_sgr: TIntegerField;
    q_RES_GRPplan: TBCDField;
    q_RES_GRPfact: TBCDField;
    q_RES_GRPpf_ordnung: TIntegerField;
    q_RES_GRPkind_npr: TStringField;
    q_RES_GRPnaim_pr: TStringField;
    q_RES_GRPpg_gr_ordn: TIntegerField;
    q_RES_GRPpf_kod_gr: TStringField;
    q_RES_GRPpf_group: TStringField;
    q_RES_GRPkod_sobs: TBCDField;
    q_kindprod: TADOQuery;
    q_prichsumto_mos: TStringField;
    q_f42_2: TADOQuery;
    q_f42: TADOQuery;
    q_f42kod_npr: TStringField;
    q_f42kod_pos: TIntegerField;
    q_f42kod_sgr: TIntegerField;
    q_f42kod_spg: TIntegerField;
    q_f42kod_rzd: TIntegerField;
    q_f42kod_prz: TIntegerField;
    q_f42kod_grp: TIntegerField;
    q_f42naim: TStringField;
    q_f42ordnung: TIntegerField;
    q_f42naim_pr: TStringField;
    q_f42to_mos: TStringField;
    q_f42fd_ves: TBCDField;
    q_f42fv_ves: TBCDField;
    q_f42fd_sum: TBCDField;
    q_f42fv_sum: TBCDField;
    q_f42zayv_tonn: TBCDField;
    q_f42zayv_dat: TDateField;
    q_fact_platfact_naim_pr: TStringField;
    q_fact_platprich_fact: TBooleanField;
    q_npr: TADOQuery;
    cb_AddMonth: TCheckBox;
    cb_AddPlanHist: TCheckBox;
    cb_AddResurs: TCheckBox;
    q_monthnom_zd: TStringField;
    q_DateUpdate: TADOQuery;
    q_fact_otgrprich_fact: TBooleanField;
    q_f42_2to_mos: TBooleanField;
    q_f42_2ordnung: TIntegerField;
    q_f42_2kod_npr: TStringField;
    q_f42_2naim_pr: TStringField;
    q_f42_2kod_pos: TIntegerField;
    q_f42_2kod_sgr: TIntegerField;
    q_f42_2kod_spg: TIntegerField;
    q_f42_2kod_rzd: TIntegerField;
    q_f42_2kod_prz: TIntegerField;
    q_f42_2kod_grp: TIntegerField;
    q_f42_2naim: TStringField;
    q_f42_2kod_sobs: TIntegerField;
    q_f42_2d_ves: TBCDField;
    q_f42_2v_ves: TBCDField;
    q_f42_2d_sum: TBCDField;
    q_f42_2v_sum: TBCDField;
    q_f42_2hd_ves: TBCDField;
    q_f42_2hv_ves: TBCDField;
    q_f42_2hd_sum: TBCDField;
    q_f42_2hv_sum: TBCDField;
    q_f42_2fd_ves: TBCDField;
    q_f42_2fv_ves: TBCDField;
    q_f42_2fd_sum: TBCDField;
    q_f42_2fv_sum: TBCDField;
    q_f42_2zayv_tonn: TBCDField;
    q_f42_2zayv_dat: TDateField;
    q_f42_2to_mos_str: TStringField;
    q_f42_2naim2: TStringField;
    q_f42_2kod_pos1: TIntegerField;
    q_f42_2kod_sgr1: TIntegerField;
    q_f42_2kod_spg1: TIntegerField;
    q_f42_2kod_rzd1: TIntegerField;
    q_f42_2kod_prz1: TIntegerField;
    q_f42_2kod_grp1: TIntegerField;
    q_f42_2kod_pgr1: TIntegerField;
    q_f42_2razn_tonn: TBCDField;
    q_f42_2razn_dat: TDateField;
    q_f42razn_tonn: TBCDField;
    q_f42razn_dat: TDateField;
    q_prichsumrazn_tonn: TBCDField;
    q_prichsumrazn_dat: TDateField;
    q_f42_2od_ves: TBCDField;
    q_f42_2ov_ves: TBCDField;
    q_f42_2od_sum: TBCDField;
    q_f42_2ov_sum: TBCDField;
    q_prichsumod_ves: TBCDField;
    q_prichsumov_ves: TBCDField;
    q_prichsumod_sum: TBCDField;
    q_prichsumov_sum: TBCDField;
    q_obpr: TOracleDataSet;
    q_obprKOD_NPR: TStringField;
    q_obprKOD_POS: TIntegerField;
    q_obprKOD_SGR: TIntegerField;
    q_obprKOD_SPG: TIntegerField;
    q_obprKOD_RZD: TIntegerField;
    q_obprKOD_PRZ: TIntegerField;
    q_obprKOD_GRP: TIntegerField;
    q_obprKOD_PGR: TIntegerField;
    q_obprNAIM: TStringField;
    q_obprD_VES: TFloatField;
    q_obprV_VES: TFloatField;
    q_obprD_SUM: TFloatField;
    q_obprV_SUM: TFloatField;
    q_obprPF_ORDNUNG: TIntegerField;
    q_obprKIND_NPR: TStringField;
    q_obprNAIM_PR: TStringField;
    q_obprPG_GR_ORDN: TIntegerField;
    q_obprPF_KOD_GR: TStringField;
    q_obprPF_GROUP: TStringField;
    q_f42od_ves: TBCDField;
    q_f42ov_ves: TBCDField;
    q_f42od_sum: TBCDField;
    q_f42ov_sum: TBCDField;
    procedure FormCreate(Sender: TObject);
    procedure date1Change(Sender: TObject);
    procedure date2Change(Sender: TObject);
    procedure rg_TypeSelectClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btPrichinClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CalcMon(year,mon:string;q_Fact:TADOQuery);
    procedure e_dateChange(Sender: TObject);
    procedure cb_MonthChange(Sender: TObject);
  private
    { Private declarations }
    PlanPostPath:String;
    ArchivePath:string;
    DbasesPath:string;
    OutDbasesPath:string;
    OperdataPath:string;
  public
    { Public declarations }
    str_kod_otgr:String;
    str_kod_otgr2:String;
    str_kod_otgr3:String;
  end;

function PADL(s:string;len:integer):string;

var
  f_f42_prich: Tf_f42_prich;

implementation

uses ForDB,dateutil,strutils,prichin, pfdbf, main, ForFiles;

{$R *.DFM}

procedure Tf_f42_prich.CalcMon(year,mon:string;q_Fact:TADOQuery);
var
  GR_Name,GR_Pos:String[255];
  kod_npr,naim_pr:String;
  s:string;
  end_d:TDateTime;
Begin

  q_cmn.SQL.Clear;
  q_cmn.SQL.Add('DELETE FROM "'+f_main.TempLocalPath+'prch_npr.DBF"');
  q_cmn.ExecSQL;
  q_cmn.SQL.Clear;
  q_cmn.SQL.Add('DELETE FROM "'+f_main.TempLocalPath+'prch_np1.DBF"');
  q_cmn.ExecSQL;

  {============================ Расчет факта ======================================================================}
  q_fact.Open;
  while not q_fact.Eof do
  begin
    if q_grplp.Locate('kod_sgr;kod_spg;kod_rzd;kod_prz;kod_grp',VarArrayOf([q_fact.FieldByName('KOD_SGR').AsInteger,q_fact.FieldByName('KOD_SPG').AsInteger,q_fact.FieldByName('KOD_RZD').AsInteger,q_fact.FieldByName('KOD_PRZ').AsInteger,q_fact.FieldByName('KOD_GRP').AsInteger]),[]) then
    begin
      gr_name:=Trim(q_grplp.FieldByName('naim').AsString);
      gr_pos:=q_grplp.FieldByName('kod_pos').AsString
    end
    else
    begin
      gr_name:=Trim(q_fact.FieldByName('Naim').AsString);
      gr_pos:=q_Fact.FieldByName('kod_pos').AsString;
    end;

{    If q_fact.FieldByName('prich_fact').AsBoolean Then
    Begin
      kod_npr:=q_fact.FieldByName('kod_npr').AsString;
      naim_pr:=q_fact.FieldByName('fact_naim_pr').AsString;
    End
    Else
    Begin}
      kod_npr:=q_fact.FieldByName('kind_npr').AsString;
      naim_pr:=q_fact.FieldByName('naim_pr').AsString;
{    End;}

    // добавление в файл продуктов
    q_cmn2.SQL.Clear;
    q_cmn2.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'prch_np1.DBF" (kod_npr_f,kod_npr_p) VALUES (');
    q_cmn2.SQL.Add(''''+q_fact.FieldByName('kod_npr').AsString+''','''+kod_npr+''')');
    q_cmn2.ExecSQL;

    // добавление в файл причин
    q_cmn2.SQL.Clear;
    q_cmn2.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'F42_SHB2.DBF" (to_mos,ordnung,kod_npr,naim_pr,kod_pos,'+
                  'kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,naim,kod_sobs,'+
                  'd_ves,v_ves,d_sum,v_sum,'+
                  'hd_ves,hv_ves,hd_sum,hv_sum,'+
                  'od_ves,ov_ves,od_sum,ov_sum,'+
                  'fd_ves,fv_ves,fd_sum,fv_sum,'+
                  'razn_tonn,razn_dat,zayv_tonn,zayv_dat) VALUES (');
    q_cmn2.SQL.Add('.T.,'+
                  q_fact.FieldByName('pf_ordnung').AsString+','''+
                  kod_npr+''','''+
                  naim_pr+''','+
                  gr_pos+','+
                  q_fact.FieldByName('kod_sgr').AsString+','+
                  q_fact.FieldByName('kod_spg').AsString+','+
                  q_fact.FieldByName('kod_rzd').AsString+','+
                  q_fact.FieldByName('kod_prz').AsString+','+
                  q_fact.FieldByName('kod_grp').AsString+','''+
                  gr_name+''',0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  FloatToStr(q_fact.FieldByName('d_ves').AsFloat)+','+
                  FloatToStr(q_fact.FieldByName('v_ves').AsFloat)+','+
                  FloatToStr(q_fact.FieldByName('d_sum').AsFloat)+','+
                  FloatToStr(q_fact.FieldByName('v_sum').AsFloat)+','+
                  '0,'+
                  '{01/01/1990},'+
                  '0,'+
                  '{01/01/1990})');
    q_cmn2.ExecSQL;

    q_cmn2.SQL.Clear;
    q_cmn2.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'F42_SHB2.DBF" (to_mos,ordnung,kod_npr,naim_pr,kod_pos,'+
                  'kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,naim,kod_sobs,'+
                  'd_ves,v_ves,d_sum,v_sum,'+
                  'hd_ves,hv_ves,hd_sum,hv_sum,'+
                  'od_ves,ov_ves,od_sum,ov_sum,'+
                  'fd_ves,fv_ves,fd_sum,fv_sum,'+
                  'razn_tonn,razn_dat,zayv_tonn,zayv_dat) VALUES (');
    q_cmn2.SQL.Add('.F.,'+
                  '999,'''+
                  '99999'','''+
                  'ИТОГО'','+
                  gr_pos+','+
                  q_fact.FieldByName('kod_sgr').AsString+','+
                  q_fact.FieldByName('kod_spg').AsString+','+
                  q_fact.FieldByName('kod_rzd').AsString+','+
                  q_fact.FieldByName('kod_prz').AsString+','+
                  q_fact.FieldByName('kod_grp').AsString+','''+
                  gr_name+''',0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  FloatToStr(q_fact.FieldByName('d_ves').AsFloat)+','+
                  FloatToStr(q_fact.FieldByName('v_ves').AsFloat)+','+
                  FloatToStr(q_fact.FieldByName('d_sum').AsFloat)+','+
                  FloatToStr(q_fact.FieldByName('v_sum').AsFloat)+','+
                  '0,'+
                  '{01/01/1990},'+
                  '0,'+
                  '{01/01/1990})');
    q_cmn2.ExecSQL;

    If Trim(q_fact.FieldByName('pf_group').AsString)<>'' Then
    Begin
      q_cmn2.SQL.Clear;
      q_cmn2.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'F42_SHB2.DBF" (to_mos,ordnung,kod_npr,naim_pr,kod_pos,'+
                    'kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,naim,kod_sobs,'+
                    'd_ves,v_ves,d_sum,v_sum,'+
                    'hd_ves,hv_ves,hd_sum,hv_sum,'+
                    'od_ves,ov_ves,od_sum,ov_sum,'+
                    'fd_ves,fv_ves,fd_sum,fv_sum,'+
                    'razn_tonn,razn_dat,zayv_tonn,zayv_dat) VALUES (');
      q_cmn2.SQL.Add('.F.,'+
                    q_fact.FieldByName('pg_gr_ordn').AsString+','''+
                    q_fact.FieldByName('pf_kod_gr').AsString+''','''+
                    q_fact.FieldByName('pf_group').AsString+''','+
                    gr_pos+','+
                    q_fact.FieldByName('kod_sgr').AsString+','+
                    q_fact.FieldByName('kod_spg').AsString+','+
                    q_fact.FieldByName('kod_rzd').AsString+','+
                    q_fact.FieldByName('kod_prz').AsString+','+
                    q_fact.FieldByName('kod_grp').AsString+','''+
                    gr_name+''',0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    FloatToStr(q_fact.FieldByName('d_ves').AsFloat)+','+
                    FloatToStr(q_fact.FieldByName('v_ves').AsFloat)+','+
                    FloatToStr(q_fact.FieldByName('d_sum').AsFloat)+','+
                    FloatToStr(q_fact.FieldByName('v_sum').AsFloat)+','+
                    '0,'+
                    '{01/01/1990},'+
                    '0,'+
                    '{01/01/1990})');
      q_cmn2.ExecSQL;
    End;

    q_fact.Next;
  end; // while not q_fact.Eof do


  {============================ Расчет плана ======================================================================}
  q_plan.SQL[22]:='"'+PlanPostPath+'pl'+Copy(year,3,2)+'_'+mon+'\grplp2.dbf" grplp2,';
  q_plan.SQL[23]:='"'+PlanPostPath+'pl'+Copy(year,3,2)+'_'+mon+'\PL_MOS2.DBF" pl_mos2';
  q_plan.SQL[24]:='WHERE grplp2.kod_pos<=5  and grplp2.kod_sgr<>501'+str_kod_otgr2;
  q_plan.Open;
  q_npr.Open;
  while not q_plan.EOF do
  begin

    if q_grplp.Locate('kod_sgr;kod_spg;kod_rzd;kod_prz;kod_grp',VarArrayOf([q_planKOD_SGR.AsInteger,q_planKOD_SPG.AsInteger,q_planKOD_RZD.AsInteger,q_planKOD_PRZ.AsInteger,q_planKOD_GRP.AsInteger]),[]) then
    begin
      gr_name:=Trim(q_grplp.FieldByName('naim').AsString);
      gr_pos:=q_grplp.FieldByName('kod_pos').AsString
    end
    else
    begin
      gr_name:=Trim(q_planNaim.AsString);
      gr_pos:=q_plankod_pos.AsString;
    end;

    // добавление в файл продуктов
    if NOT q_npr.Locate('kod_npr_f',q_plan.FieldByName('kod_npr').AsString,[]) then
    Begin
      q_cmn2.SQL.Clear;
      q_cmn2.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'prch_np1.DBF" (kod_npr_f,kod_npr_p) VALUES (');
      q_cmn2.SQL.Add(''''+q_plan.FieldByName('kod_npr').AsString+''','''+q_plan.FieldByName('kod_npr').AsString+''')');
      q_cmn2.ExecSQL;
    end;

    // добавление в файл причин
    q_cmn.SQL.Clear;
    q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'F42_SHB2.DBF" (to_mos,ordnung,kod_npr,naim_pr,kod_pos,'+
                  'kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,naim,kod_sobs,'+
                  'd_ves,v_ves,d_sum,v_sum,'+
                  'hd_ves,hv_ves,hd_sum,hv_sum,'+
                  'od_ves,ov_ves,od_sum,ov_sum,'+
                  'fd_ves,fv_ves,fd_sum,fv_sum,'+
                  'razn_tonn,razn_dat,zayv_tonn,zayv_dat) VALUES (');
    q_cmn.SQL.Add('.T.,'+
                  q_planpf_ordnung.AsString+','''+
                  q_plankind_npr.AsString+''','''+
                  q_plannaim_pr.AsString+''','+
                  gr_pos+','+
                  q_plankod_sgr.AsString+','+
                  q_plankod_spg.AsString+','+
                  q_plankod_rzd.AsString+','+
                  q_plankod_prz.AsString+','+
                  q_plankod_grp.AsString+','''+
                  gr_name+''',0,'+
                  q_pland_ves.AsString+','+
                  q_planv_ves.AsString+','+
                  q_pland_sum.AsString+','+
                  q_planv_sum.AsString+','+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '{01/01/1990},'+
                  '0,'+
                  '{01/01/1990})');
    q_cmn.ExecSQL;

    q_cmn.SQL.Clear;
    q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'F42_SHB2.DBF" (to_mos,ordnung,kod_npr,naim_pr,kod_pos,'+
                  'kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,naim,kod_sobs,'+
                  'd_ves,v_ves,d_sum,v_sum,'+
                  'hd_ves,hv_ves,hd_sum,hv_sum,'+
                  'od_ves,ov_ves,od_sum,ov_sum,'+
                  'fd_ves,fv_ves,fd_sum,fv_sum,'+
                  'razn_tonn,razn_dat,zayv_tonn,zayv_dat) VALUES (');
    q_cmn.SQL.Add('.F.,'+
                  '999,'''+
                  '99999'','''+
                  'ИТОГО'','+
                  gr_pos+','+
                  q_plankod_sgr.AsString+','+
                  q_plankod_spg.AsString+','+
                  q_plankod_rzd.AsString+','+
                  q_plankod_prz.AsString+','+
                  q_plankod_grp.AsString+','''+
                  gr_name+''',0,'+
                  q_pland_ves.AsString+','+
                  q_planv_ves.AsString+','+
                  q_pland_sum.AsString+','+
                  q_planv_sum.AsString+','+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '{01/01/1990},'+
                  '0,'+
                  '{01/01/1990})');
    q_cmn.ExecSQL;

    If Trim(q_planpf_group.AsString)<>'' Then
    Begin
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'F42_SHB2.DBF" (to_mos,ordnung,kod_npr,naim_pr,kod_pos,'+
                    'kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,naim,kod_sobs,'+
                    'd_ves,v_ves,d_sum,v_sum,'+
                    'hd_ves,hv_ves,hd_sum,hv_sum,'+
                    'od_ves,ov_ves,od_sum,ov_sum,'+
                    'fd_ves,fv_ves,fd_sum,fv_sum,'+
                    'razn_tonn,razn_dat,zayv_tonn,zayv_dat) VALUES (');
      q_cmn.SQL.Add('.F.,'+
                    q_planpg_gr_ordn.AsString+','''+
                    q_planpf_kod_gr.AsString+''','''+
                    q_planpf_group.AsString+''','+
                    gr_pos+','+
                    q_plankod_sgr.AsString+','+
                    q_plankod_spg.AsString+','+
                    q_plankod_rzd.AsString+','+
                    q_plankod_prz.AsString+','+
                    q_plankod_grp.AsString+','''+
                    gr_name+''',0,'+
                    q_pland_ves.AsString+','+
                    q_planv_ves.AsString+','+
                    q_pland_sum.AsString+','+
                    q_planv_sum.AsString+','+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '{01/01/1990},'+
                    '0,'+
                    '{01/01/1990})');
      q_cmn.ExecSQL;
    End;

    q_plan.Next;
  end; //while not q_plan.EOF
  q_plan.Close;

  {============================ Расчет ОБПР ======================================================================}
  q_obpr.SQL[23]:=' AND KLS_PLANSTRU.kod_sgr<>501 '+str_kod_otgr3;
  q_obpr.SQL[27]:=' AND PLAN_PERIODS.DATE_PLAN=TO_DATE(''01.'+mon+'.'+year+''',''dd.mm.yyyy'') ';
  q_obpr.Open;
  q_npr.Open;
  while not q_obpr.EOF do
  begin

    if q_grplp.Locate('kod_sgr;kod_spg;kod_rzd;kod_prz;kod_grp',VarArrayOf([q_obprKOD_SGR.AsInteger,q_obprKOD_SPG.AsInteger,q_obprKOD_RZD.AsInteger,q_obprKOD_PRZ.AsInteger,q_obprKOD_GRP.AsInteger]),[]) then
    begin
      gr_name:=Trim(q_grplp.FieldByName('naim').AsString);
      gr_pos:=q_grplp.FieldByName('kod_pos').AsString
    end
    else
    begin
      gr_name:=Trim(q_obprNaim.AsString);
      gr_pos:=q_obprkod_pos.AsString;
    end;

    // добавление в файл продуктов
    if NOT q_npr.Locate('kod_npr_f',q_obpr.FieldByName('kod_npr').AsString,[]) then
    Begin
      q_cmn2.SQL.Clear;
      q_cmn2.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'prch_np1.DBF" (kod_npr_f,kod_npr_p) VALUES (');
      q_cmn2.SQL.Add(''''+q_obpr.FieldByName('kod_npr').AsString+''','''+q_obpr.FieldByName('kod_npr').AsString+''')');
      q_cmn2.ExecSQL;
    end;

    // добавление в файл причин
    q_cmn.SQL.Clear;
    q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'F42_SHB2.DBF" (to_mos,ordnung,kod_npr,naim_pr,kod_pos,'+
                  'kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,naim,kod_sobs,'+
                  'd_ves,v_ves,d_sum,v_sum,'+
                  'hd_ves,hv_ves,hd_sum,hv_sum,'+
                  'od_ves,ov_ves,od_sum,ov_sum,'+
                  'fd_ves,fv_ves,fd_sum,fv_sum,'+
                  'razn_tonn,razn_dat,zayv_tonn,zayv_dat) VALUES (');
    q_cmn.SQL.Add('.T.,'+
                  q_obprpf_ordnung.AsString+','''+
                  q_obprkind_npr.AsString+''','''+
                  q_obprnaim_pr.AsString+''','+
                  gr_pos+','+
                  q_obprkod_sgr.AsString+','+
                  q_obprkod_spg.AsString+','+
                  q_obprkod_rzd.AsString+','+
                  q_obprkod_prz.AsString+','+
                  q_obprkod_grp.AsString+','''+
                  gr_name+''',0,'+
                  q_obprd_ves.AsString+','+
                  q_obprv_ves.AsString+','+
                  q_obprd_sum.AsString+','+
                  q_obprv_sum.AsString+','+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  q_obprd_ves.AsString+','+
                  q_obprv_ves.AsString+','+
                  q_obprd_sum.AsString+','+
                  q_obprv_sum.AsString+','+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '{01/01/1990},'+
                  '0,'+
                  '{01/01/1990})');
    q_cmn.ExecSQL;

    q_cmn.SQL.Clear;
    q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'F42_SHB2.DBF" (to_mos,ordnung,kod_npr,naim_pr,kod_pos,'+
                  'kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,naim,kod_sobs,'+
                  'd_ves,v_ves,d_sum,v_sum,'+
                  'hd_ves,hv_ves,hd_sum,hv_sum,'+
                  'od_ves,ov_ves,od_sum,ov_sum,'+
                  'fd_ves,fv_ves,fd_sum,fv_sum,'+
                  'razn_tonn,razn_dat,zayv_tonn,zayv_dat) VALUES (');
    q_cmn.SQL.Add('.F.,'+
                  '999,'''+
                  '99999'','''+
                  'ИТОГО'','+
                  gr_pos+','+
                  q_obprkod_sgr.AsString+','+
                  q_obprkod_spg.AsString+','+
                  q_obprkod_rzd.AsString+','+
                  q_obprkod_prz.AsString+','+
                  q_obprkod_grp.AsString+','''+
                  gr_name+''',0,'+
                  q_obprd_ves.AsString+','+
                  q_obprv_ves.AsString+','+
                  q_obprd_sum.AsString+','+
                  q_obprv_sum.AsString+','+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  q_obprd_ves.AsString+','+
                  q_obprv_ves.AsString+','+
                  q_obprd_sum.AsString+','+
                  q_obprv_sum.AsString+','+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '0,'+
                  '{01/01/1990},'+
                  '0,'+
                  '{01/01/1990})');
    q_cmn.ExecSQL;

    If Trim(q_obprpf_group.AsString)<>'' Then
    Begin
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'F42_SHB2.DBF" (to_mos,ordnung,kod_npr,naim_pr,kod_pos,'+
                    'kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,naim,kod_sobs,'+
                    'd_ves,v_ves,d_sum,v_sum,'+
                    'hd_ves,hv_ves,hd_sum,hv_sum,'+
                    'od_ves,ov_ves,od_sum,ov_sum,'+
                    'fd_ves,fv_ves,fd_sum,fv_sum,'+
                    'razn_tonn,razn_dat,zayv_tonn,zayv_dat) VALUES (');
      q_cmn.SQL.Add('.F.,'+
                    q_obprpg_gr_ordn.AsString+','''+
                    q_obprpf_kod_gr.AsString+''','''+
                    q_obprpf_group.AsString+''','+
                    gr_pos+','+
                    q_obprkod_sgr.AsString+','+
                    q_obprkod_spg.AsString+','+
                    q_obprkod_rzd.AsString+','+
                    q_obprkod_prz.AsString+','+
                    q_obprkod_grp.AsString+','''+
                    gr_name+''',0,'+
                    q_obprd_ves.AsString+','+
                    q_obprv_ves.AsString+','+
                    q_obprd_sum.AsString+','+
                    q_obprv_sum.AsString+','+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    q_obprd_ves.AsString+','+
                    q_obprv_ves.AsString+','+
                    q_obprd_sum.AsString+','+
                    q_obprv_sum.AsString+','+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '{01/01/1990},'+
                    '0,'+
                    '{01/01/1990})');
      q_cmn.ExecSQL;
    End;

    q_obpr.Next;
  end; //while not q_obpr.EOF
  q_obpr.Close;

  {==== Определения соответствия фактического и планового продукта (для производства) ======}
  q_npr.Close;
  q_npr.Open;
  while not q_npr.EOF do
  begin
    // добавление в файл продуктов
    q_cmn2.SQL.Clear;
    q_cmn2.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'prch_npr.DBF" (kod_npr_f,kod_npr_p) VALUES (');
    q_cmn2.SQL.Add(''''+q_npr.FieldByName('kod_npr_f').AsString+''','''+
                        q_npr.FieldByName('kod_npr_p').AsString+''')');
    q_cmn2.ExecSQL;
    q_npr.Next;
  end;
  q_npr.Close;

  if cb_AddPlanHist.Checked then
  Begin
    {============================ Расчет изменения плана ======================================================================}
    q_plan_hist.SQL[22]:='"'+PlanPostPath+'pl'+Copy(year,3,2)+'_'+mon+'\grplp2.dbf" grplp2,';
    q_plan_hist.SQL[23]:='"'+PlanPostPath+'pl'+Copy(year,3,2)+'_'+mon+'\PL_HIS2.DBF" pl_hist';
    q_plan_hist.SQL[24]:='WHERE grplp2.kod_pos<=5  and grplp2.kod_sgr<>501'+str_kod_otgr2;
    q_plan_hist.Open;
    while not q_plan_hist.EOF do
    begin
      if q_grplp.Locate('kod_sgr;kod_spg;kod_rzd;kod_prz;kod_grp',VarArrayOf([q_plan_histKOD_SGR.AsInteger,q_plan_histKOD_SPG.AsInteger,q_plan_histKOD_RZD.AsInteger,q_plan_histKOD_PRZ.AsInteger,q_plan_histKOD_GRP.AsInteger]),[]) then
      begin
        gr_name:=Trim(q_grplp.FieldByName('naim').AsString);
        gr_pos:=q_grplp.FieldByName('kod_pos').AsString
      end
      else
      begin
        gr_name:=Trim(q_plan_histNaim.AsString);
        gr_pos:=q_plan_histkod_pos.AsString;
      end;

      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'F42_SHB2.DBF" (to_mos,ordnung,kod_npr,naim_pr,kod_pos,'+
                    'kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,naim,kod_sobs,'+
                    'd_ves,v_ves,d_sum,v_sum,'+
                    'hd_ves,hv_ves,hd_sum,hv_sum,'+
                    'od_ves,ov_ves,od_sum,ov_sum,'+
                    'fd_ves,fv_ves,fd_sum,fv_sum,'+
                    'razn_tonn,razn_dat,zayv_tonn,zayv_dat) VALUES (');
      q_cmn.SQL.Add('.T.,'+
                    q_plan_histpf_ordnung.AsString+','''+
                    q_plan_histkind_npr.AsString+''','''+
                    q_plan_histnaim_pr.AsString+''','+
                    gr_pos+','+
                    q_plan_histkod_sgr.AsString+','+
                    q_plan_histkod_spg.AsString+','+
                    q_plan_histkod_rzd.AsString+','+
                    q_plan_histkod_prz.AsString+','+
                    q_plan_histkod_grp.AsString+','''+
                    gr_name+''',0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    q_plan_histd_ves.AsString+','+
                    q_plan_histv_ves.AsString+','+
                    q_plan_histd_sum.AsString+','+
                    q_plan_histv_sum.AsString+','+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '{01/01/1990},'+
                    '0,'+
                    '{01/01/1990})');
      q_cmn.ExecSQL;

      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'F42_SHB2.DBF" (to_mos,ordnung,kod_npr,naim_pr,kod_pos,'+
                    'kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,naim,kod_sobs,'+
                    'd_ves,v_ves,d_sum,v_sum,'+
                    'hd_ves,hv_ves,hd_sum,hv_sum,'+
                    'od_ves,ov_ves,od_sum,ov_sum,'+
                    'fd_ves,fv_ves,fd_sum,fv_sum,'+
                    'razn_tonn,razn_dat,zayv_tonn,zayv_dat) VALUES (');
      q_cmn.SQL.Add('.F.,'+
                    '999,'''+
                    '99999'','''+
                    'ИТОГО'','+
                    gr_pos+','+
                    q_plan_histkod_sgr.AsString+','+
                    q_plan_histkod_spg.AsString+','+
                    q_plan_histkod_rzd.AsString+','+
                    q_plan_histkod_prz.AsString+','+
                    q_plan_histkod_grp.AsString+','''+
                    gr_name+''',0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    q_plan_histd_ves.AsString+','+
                    q_plan_histv_ves.AsString+','+
                    q_plan_histd_sum.AsString+','+
                    q_plan_histv_sum.AsString+','+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '{01/01/1990},'+
                    '0,'+
                    '{01/01/1990})');
      q_cmn.ExecSQL;

      If Trim(q_plan_histpf_group.AsString)<>'' Then
      Begin
        q_cmn.SQL.Clear;
        q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'F42_SHB2.DBF" (to_mos,ordnung,kod_npr,naim_pr,kod_pos,'+
                      'kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,naim,kod_sobs,'+
                      'd_ves,v_ves,d_sum,v_sum,'+
                      'hd_ves,hv_ves,hd_sum,hv_sum,'+
                      'od_ves,ov_ves,od_sum,ov_sum,'+
                      'fd_ves,fv_ves,fd_sum,fv_sum,'+
                      'razn_tonn,razn_dat,zayv_tonn,zayv_dat) VALUES (');
        q_cmn.SQL.Add('.F.,'+
                      q_plan_histpg_gr_ordn.AsString+','''+
                      q_plan_histpf_kod_gr.AsString+''','''+
                      q_plan_histpf_group.AsString+''','+
                      gr_pos+','+
                      q_plan_histkod_sgr.AsString+','+
                      q_plan_histkod_spg.AsString+','+
                      q_plan_histkod_rzd.AsString+','+
                      q_plan_histkod_prz.AsString+','+
                      q_plan_histkod_grp.AsString+','''+
                      gr_name+''',0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      q_plan_histd_ves.AsString+','+
                      q_plan_histv_ves.AsString+','+
                      q_plan_histd_sum.AsString+','+
                      q_plan_histv_sum.AsString+','+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '{01/01/1990},'+
                      '0,'+
                      '{01/01/1990})');
        q_cmn.ExecSQL;
      End;
      q_plan_hist.Next;
    end; // end while not q_plan_hist.EOF
    q_plan_hist.Close;
  end;

  If cb_AddMonth.Checked Then
  Begin
    {============================ Расчет заявок ======================================================================}
    if rg_TypeSelect.ItemIndex=1 then
    begin
      // По счетам-фактурам
      end_d:=date2.Date
    end
    else
    Begin
      // Оперативная
      end_d:=e_date.Date;
      if system.copy(TimeToStr(e_time.Time),1,5)='00:00' then
        end_d:=end_d-1;
    end;
    q_month.SQL[17]:='FROM raznar,month,prod,kindprod,"'+PlanPostPath+'pl'+Copy(year,3,2)+'_'+mon+'\plotg1_.dbf" plotg';
    q_month.SQL[20]:='month.vvoddat<='+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',End_d)+' AND month.date_plan='+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',EncodeDate(Round(e_year.Value),cb_Month.ItemIndex+1,1))+str_kod_otgr;
//    q_month.SQL[20]:='month.date_plan='+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',EncodeDate(Round(e_year.Value),cb_Month.ItemIndex+1,1))+str_kod_otgr;
//    q_month.SQL.SaveToFile('c:\tmp\a.txt');
    q_month.Open;
    while not q_month.Eof do
    begin
      if q_grplp.Locate('kod_sgr;kod_spg;kod_rzd;kod_prz;kod_grp',VarArrayOf([q_monthKOD_SGR.AsInteger,q_monthKOD_SPG.AsInteger,q_monthKOD_RZD.AsInteger,q_monthKOD_PRZ.AsInteger,q_monthKOD_GRP.AsInteger]),[]) then
      begin
        gr_name:=Trim(q_grplp.FieldByName('naim').AsString);
        gr_pos:=q_grplp.FieldByName('kod_pos').AsString
      end
      else
      begin
        gr_name:=Trim(q_month.FieldByName('Naim').AsString);
        gr_pos:=q_month.FieldByName('kod_pos').AsString;
      end;

      // добавление в файл причин
      q_cmn2.SQL.Clear;
      q_cmn2.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'F42_SHB2.DBF" (to_mos,ordnung,kod_npr,naim_pr,kod_pos,'+
                    'kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,naim,kod_sobs,'+
                    'd_ves,v_ves,d_sum,v_sum,'+
                    'hd_ves,hv_ves,hd_sum,hv_sum,'+
                    'od_ves,ov_ves,od_sum,ov_sum,'+
                    'fd_ves,fv_ves,fd_sum,fv_sum,'+
                    'razn_tonn,razn_dat,zayv_tonn,zayv_dat) VALUES (');
      q_cmn2.SQL.Add('.T.,'+
                    q_monthpf_ordnung.AsString+','''+
                    q_monthkind_npr.AsString+''','''+
                    q_monthnaim_pr.AsString+''','+
                    gr_pos+','+
                    q_monthkod_sgr.AsString+','+
                    q_monthkod_spg.AsString+','+
                    q_monthkod_rzd.AsString+','+
                    q_monthkod_prz.AsString+','+
                    q_monthkod_grp.AsString+','''+
                    gr_name+''',0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    FloatToStr(q_month.FieldByName('tonn').AsFloat)+','+
                    FormatDateTime('"{"mm"/"dd"/"yyyy"}"',q_month.FieldByName('vvoddat').AsDateTime)+','+
                    FloatToStr(q_month.FieldByName('tonn').AsFloat)+','+
                    FormatDateTime('"{"mm"/"dd"/"yyyy"}"',q_month.FieldByName('vvoddat').AsDateTime)+')');
      q_cmn2.ExecSQL;

      q_cmn2.SQL.Clear;
      q_cmn2.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'F42_SHB2.DBF" (to_mos,ordnung,kod_npr,naim_pr,kod_pos,'+
                    'kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,naim,kod_sobs,'+
                    'd_ves,v_ves,d_sum,v_sum,'+
                    'hd_ves,hv_ves,hd_sum,hv_sum,'+
                    'od_ves,ov_ves,od_sum,ov_sum,'+
                    'fd_ves,fv_ves,fd_sum,fv_sum,'+
                    'razn_tonn,razn_dat,zayv_tonn,zayv_dat) VALUES (');
      q_cmn2.SQL.Add('.F.,'+
                    '999,'''+
                    '99999'','''+
                    'ИТОГО'','+
                    gr_pos+','+
                    q_monthkod_sgr.AsString+','+
                    q_monthkod_spg.AsString+','+
                    q_monthkod_rzd.AsString+','+
                    q_monthkod_prz.AsString+','+
                    q_monthkod_grp.AsString+','''+
                    gr_name+''',0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    '0,'+
                    FloatToStr(q_month.FieldByName('tonn').AsFloat)+','+
                    FormatDateTime('"{"mm"/"dd"/"yyyy"}"',q_month.FieldByName('vvoddat').AsDateTime)+','+
                    FloatToStr(q_month.FieldByName('tonn').AsFloat)+','+
                    FormatDateTime('"{"mm"/"dd"/"yyyy"}"',q_month.FieldByName('vvoddat').AsDateTime)+')');
      q_cmn2.ExecSQL;

      If Trim(q_monthpf_group.AsString)<>'' Then
      Begin
        q_cmn2.SQL.Clear;
        q_cmn2.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'F42_SHB2.DBF" (to_mos,ordnung,kod_npr,naim_pr,kod_pos,'+
                      'kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,naim,kod_sobs,'+
                      'd_ves,v_ves,d_sum,v_sum,'+
                      'hd_ves,hv_ves,hd_sum,hv_sum,'+
                      'od_ves,ov_ves,od_sum,ov_sum,'+
                      'fd_ves,fv_ves,fd_sum,fv_sum,'+
                      'razn_tonn,razn_dat,zayv_tonn,zayv_dat) VALUES (');
        q_cmn2.SQL.Add('.F.,'+
                      q_monthpg_gr_ordn.AsString+','''+
                      q_monthpf_kod_gr.AsString+''','''+
                      q_monthpf_group.AsString+''','+
                      gr_pos+','+
                      q_monthkod_sgr.AsString+','+
                      q_monthkod_spg.AsString+','+
                      q_monthkod_rzd.AsString+','+
                      q_monthkod_prz.AsString+','+
                      q_monthkod_grp.AsString+','''+
                      gr_name+''',0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      FloatToStr(q_month.FieldByName('tonn').AsFloat)+','+
                      FormatDateTime('"{"mm"/"dd"/"yyyy"}"',q_month.FieldByName('vvoddat').AsDateTime)+','+
                      FloatToStr(q_month.FieldByName('tonn').AsFloat)+','+
                      FormatDateTime('"{"mm"/"dd"/"yyyy"}"',q_month.FieldByName('vvoddat').AsDateTime)+')');
        q_cmn2.ExecSQL;
      End;

      q_month.Next;
    end;
    q_month.close;
  end;

  If cb_AddResurs.Checked Then
  Begin
    // Копирование производства в файл причин
    q_kindprod.Open;
    q_RES_GRP.Open;
    while not q_RES_GRP.Eof do
    begin

      // Наличие план-факта
      if q_kindprod.Locate('kod_npr',q_res_grp.FieldByName('kod_npr').AsString,[]) then
      begin

        gr_name:=Trim(q_RES_GRP.FieldByName('naim').AsString);
        gr_pos:='0';

        // добавление в файл причин
        q_cmn2.SQL.Clear;
        s:='INSERT INTO "'+f_main.TempLocalPath+'F42_SHB2.DBF" (to_mos,ordnung,kod_npr,naim_pr,kod_pos,'+
                      'kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,naim,kod_sobs,'+
                      'd_ves,v_ves,d_sum,v_sum,'+
                      'hd_ves,hv_ves,hd_sum,hv_sum,'+
                      'od_ves,ov_ves,od_sum,ov_sum,'+
                      'fd_ves,fv_ves,fd_sum,fv_sum,'+
                      'razn_tonn,razn_dat,zayv_tonn,zayv_dat) VALUES (';
        q_cmn2.SQL.Add(s);
        s:='.F.,'+q_RES_GRP.FieldByName('pf_ordnung').AsString+','''+
                      q_RES_GRP.FieldByName('kod_npr').AsString+''','''+
                      q_RES_GRP.FieldByName('naim_pr').AsString+''','+
                      gr_pos+','+
                      q_RES_GRP.FieldByName('kod_sgr').AsString+','+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'''+
                      gr_name+''','+
                      q_RES_GRP.FieldByName('kod_sobs').AsString+','+
                      FloatToStr(q_RES_GRP.FieldByName('plan').AsFloat)+','+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      FloatToStr(q_RES_GRP.FieldByName('fact').AsFloat)+','+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '{01/01/1990},'+
                      '0,'+
                      '{01/01/1990})';
        q_cmn2.SQL.Add(s);
        q_cmn2.ExecSQL;

        q_cmn2.SQL.Clear;
        s:='INSERT INTO "'+f_main.TempLocalPath+'F42_SHB2.DBF" (to_mos,ordnung,kod_npr,naim_pr,kod_pos,'+
                      'kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,naim,kod_sobs,'+
                      'd_ves,v_ves,d_sum,v_sum,'+
                      'hd_ves,hv_ves,hd_sum,hv_sum,'+
                      'od_ves,ov_ves,od_sum,ov_sum,'+
                      'fd_ves,fv_ves,fd_sum,fv_sum,'+
                      'razn_tonn,razn_dat,zayv_tonn,zayv_dat) VALUES (';
        q_cmn2.SQL.Add(s);
        s:='.F.,999,''99999'',''ИТОГО'','+
                      gr_pos+','+
                      q_RES_GRP.FieldByName('kod_sgr').AsString+','+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'''+
                      gr_name+''','+
                      q_RES_GRP.FieldByName('kod_sobs').AsString+','+
                      FloatToStr(q_RES_GRP.FieldByName('plan').AsFloat)+','+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      FloatToStr(q_RES_GRP.FieldByName('fact').AsFloat)+','+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '{01/01/1990},'+
                      '0,'+
                      '{01/01/1990})';
        q_cmn2.SQL.Add(s);
        q_cmn2.ExecSQL;

        If Trim(q_RES_GRP.FieldByName('pf_group').AsString)<>'' Then
        Begin
          q_cmn2.SQL.Clear;
          q_cmn2.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'F42_SHB2.DBF" (to_mos,ordnung,kod_npr,naim_pr,kod_pos,'+
                        'kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,naim,kod_sobs,'+
                        'd_ves,v_ves,d_sum,v_sum,'+
                        'hd_ves,hv_ves,hd_sum,hv_sum,'+
                        'od_ves,ov_ves,od_sum,ov_sum,'+
                        'fd_ves,fv_ves,fd_sum,fv_sum,'+
                        'razn_tonn,razn_dat,zayv_tonn,zayv_dat) VALUES (');
          s:='.F.,'+q_RES_GRP.FieldByName('pg_gr_ordn').AsString+','''+
                      q_RES_GRP.FieldByName('pf_kod_gr').AsString+''','''+
                      q_RES_GRP.FieldByName('pf_group').AsString+''','+
                      gr_pos+','+
                      q_RES_GRP.FieldByName('kod_sgr').AsString+','+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'''+
                      gr_name+''','+
                      q_RES_GRP.FieldByName('kod_sobs').AsString+','+
                      FloatToStr(q_RES_GRP.FieldByName('plan').AsFloat)+','+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      FloatToStr(q_RES_GRP.FieldByName('fact').AsFloat)+','+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '{01/01/1990},'+
                      '0,'+
                      '{01/01/1990})';

          q_cmn2.SQL.Add(s);
          q_cmn2.ExecSQL;
        End;
      end;

      q_RES_GRP.Next;
    end;
    q_RES_GRP.close;
    q_kindprod.Close;
  end;
end;

procedure Tf_f42_prich.date1Change(Sender: TObject);
begin
  if date2.date<date1.date then
  Begin
    date2.date:=date1.date;
    date_proizv_to.Date:=date2.Date;
  end;
  date_proizv_from.Date:=date1.Date;
end;

procedure Tf_f42_prich.date2Change(Sender: TObject);
begin
  if date2.date<date1.date then
  Begin
    date1.date:=date2.date;
    date_proizv_from.Date:=date1.Date;
  End;
  date_proizv_to.Date:=date2.Date;
end;

procedure Tf_f42_prich.rg_TypeSelectClick(Sender: TObject);
begin
  if rg_TypeSelect.ItemIndex=0 then
    begin
      l_date.Visible:=True;
      l_month.Visible:=True;
      l_year.Visible:=True;

      e_date.Visible:=True;
      e_time.Visible:=True;
      cb_Month.Visible:=True;
      e_year.Visible:=True;

      e_date.Enabled:=True;
      e_time.Enabled:=True;
      cb_Month.Enabled:=True;
      e_year.Enabled:=True;


      date1.Enabled:=False;
      date2.Enabled:=False;
      date1.Visible:=False;
      date2.Visible:=False;
      l_date1.Visible:=False;
      l_date2.Visible:=False;
      date_proizv_to.Date:=e_date.Date-1;
      date_proizv_from.Date:=date_proizv_to.Date-ExtractDay(date_proizv_to.Date)+1;
    end
  else
    begin
      l_date.Visible:=False;
      l_month.Visible:=False;
      l_year.Visible:=False;

      e_date.Visible:=False;
      e_time.Visible:=False;
      cb_Month.Visible:=False;
      e_year.Visible:=False;

      e_date.Enabled:=False;
      e_time.Enabled:=False;
      cb_Month.Enabled:=False;
      e_year.Enabled:=False;


      date1.Enabled:=True;
      date2.Enabled:=True;
      date1.Visible:=True;
      date2.Visible:=True;
      l_date1.Visible:=True;
      l_date2.Visible:=True;
      date_proizv_from.Date:=date1.Date;
      date_proizv_to.Date:=date2.Date;
    end;
end;

procedure Tf_f42_prich.FormCreate(Sender: TObject);
begin
  PlanPostPath:=F_FileUtils.FillFilePath(f_main.GetApplVari('PlanPostPath'),false);
  ArchivePath:=F_FileUtils.FillFilePath(f_main.GetApplVari('ArchivePath'),false);
  DbasesPath:=F_FileUtils.FillFilePath(f_main.GetApplVari('DbasesPath'),false);
  OutDbasesPath:=F_FileUtils.FillFilePath(f_main.GetApplVari('OutDbasesPath'),false);
  OperdataPath:=F_FileUtils.FillFilePath(f_main.GetApplVari('OperdataPath'),false);

  date1.Date:=FirstDayOfPrevMonth;
  date2.Date:=LastDayOfPrevMonth;
  cb_Month.ItemIndex:=ExtractMonth(Now-1)-1;
  e_Year.Value:=ExtractYear(Now-1);
  e_Date.Date:=Now-1;
  cb_AddResurs.Checked:=false;
  cb_AddPlanHist.Checked:=false;
  cb_AddMonth.Checked:=TRUE;
end;

procedure Tf_f42_prich.FormActivate(Sender: TObject);
begin
  PF_Conn.Close;
  PF_Conn.Connected:=True;
  date_proizv_to.Date:=Now-1;
  date_proizv_from.Date:=date_proizv_to.Date-ExtractDay(date_proizv_to.Date)+1;
  f_f42_prich.ClientHeight:=pbar.Top+pbar.Height+5;
end;

procedure Tf_f42_prich.btPrichinClick(Sender: TObject);
var
  f1,f2:String[255];
  kod_prich:integer;
  comment:string;
  plan,norma: double;
  obpr,norma_obpr: double;
  DaysInMonth:integer;
  s:string;
  kod_sobs,kod_pos,kod_struct,kod_parent,kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp:string;
  FlagExist,FlagNew:boolean;

  GR_Name,GR_Pos:String[255];
  QueryMon:integer; {Номер месяца, по которому выбирается план}
  mon:String[2];
  year:String[4];
  OldNaim:string;
  i:integer;
  kod_sobs1:integer;
  Save_Cursor: TCursor;

  // Заполняет C:\TMP\PRICHIN.DBF из U:\LUK\DBASES\PRICHIN.DBF
  procedure FillToTmp;
  Begin
    pbar.Visible:=True;
    pbar.Position:=1;
    pbar.Max:=100;
    btPrichin.Enabled:=False;
    btPrichin.Refresh;

    // Подготовка промежуточного файла
    f1:=f_main.MasterDBFPath+'prichin.DBF'+#0;
    f2:=f_main.TempLocalPath+'prichin.DBF'+#0;
    COPYFILE(@f1[1],@f2[1],False);
    q_cmn.SQL.Clear;
    q_cmn.SQL.Add('DELETE FROM "'+f_main.TempLocalPath+'prichin.DBF"');
    q_cmn.ExecSQL;

    q_seek_prich.Close;
    q_seek_prich.Parameters.ParamByName('beg_date').Value:=date_proizv_from.Date;
    q_seek_prich.Parameters.ParamByName('end_date').Value:=date_proizv_to.Date;
    q_seek_prich.Open;
    while not q_seek_prich.EOF do
    with q_seek_prich do
    begin
      pbar.Position:=Round(q_seek_prich.RecNo/q_seek_prich.RecordCount*100);
      pbar.Refresh;

      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'prichin.DBF" (beg_date,end_date,to_mos,ordnung,kod_npr,naim_pr,kod_pos,'+
                    'kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,naim,kod_sobs,'+
                    'plan,'+
                    'izm_plan,'+
                    'obpr,'+
                    'norma,'+
                    'norma_obpr,'+
                    'fact,'+
                    'razn_tonn,razn_dat,zayv_tonn,zayv_dat,kod_prich,comment,kod_struct,kod_parent) VALUES (');
      s:=FormatDateTime('"{"mm"/"dd"/"yyyy"}"',FieldByName('beg_date').AsDateTime)+','+
         FormatDateTime('"{"mm"/"dd"/"yyyy"}"',FieldByName('end_date').AsDateTime)+','+
         FieldByName('to_mos_str').AsString+','+
         FieldByName('ordnung').AsString+','''+
         FieldByName('kod_npr').AsString+''','''+
         FieldByName('naim_pr').AsString+''','+
         FieldByName('kod_pos').AsString+','+
         FieldByName('kod_sgr').AsString+','+
         FieldByName('kod_spg').AsString+','+
         FieldByName('kod_rzd').AsString+','+
         FieldByName('kod_prz').AsString+','+
         FieldByName('kod_grp').AsString+','''+
         FieldByName('naim').AsString+''','+
         FieldByName('kod_sobs').AsString+','+
         FieldByName('plan').AsString+','+
         FieldByName('izm_plan').AsString+','+
         FieldByName('obpr').AsString+','+
         FieldByName('norma').AsString+','+
         FieldByName('norma_obpr').AsString+','+
         FieldByName('fact').AsString+','+
         FieldByName('razn_tonn').AsString+','+
         FormatDateTime('"{"mm"/"dd"/"yyyy"}"',FieldByName('razn_dat').AsDateTime)+','+
         FieldByName('zayv_tonn').AsString+','+
         FormatDateTime('"{"mm"/"dd"/"yyyy"}"',FieldByName('zayv_dat').AsDateTime)+','+
         FieldByName('kod_prich').AsString+','''+
         FieldByName('comment').AsString+''','+
         FieldByName('kod_struct').AsString+','+
         FieldByName('kod_parent').AsString+')';
      q_cmn.SQL.Add(s);
      q_cmn.ExecSQL;
      q_seek_prich.Next;
    end;
    q_seek_prich.Close;
    pbar.Visible:=false;
    btPrichin.Enabled:=True;
  End;

  // Заполняет U:\LUK\DBASES\PRICHIN.DBF из C:\TMP\PRICHIN.DBF
  procedure FillToBase;
  Begin
    pbar.Visible:=True;
    pbar.Position:=1;
    pbar.Max:=100;
    btPrichin.Enabled:=False;
    btPrichin.Refresh;

    // Подготовка базового файла
    q_cmn.SQL.Clear;
    q_cmn.SQL.Add('DELETE FROM "'+DbasesPath+'prichin.DBF" WHERE beg_date='+
    FormatDateTime('"{"mm"/"dd"/"yyyy"}"',date_proizv_from.Date)+
    ' AND end_date='+
    FormatDateTime('"{"mm"/"dd"/"yyyy"}"',date_proizv_to.Date));
    q_cmn.ExecSQL;

    q_tmp_prich.Close;
    q_tmp_prich.Open;
    while not q_tmp_prich.EOF do
    with q_tmp_prich do
    begin
      pbar.Position:=Round(q_tmp_prich.RecNo/q_tmp_prich.RecordCount*100);
      pbar.Refresh;

      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('INSERT INTO "'+DbasesPath+'prichin.DBF" (beg_date,end_date,to_mos,ordnung,kod_npr,naim_pr,kod_pos,'+
                    'kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,naim,kod_sobs,'+
                    'plan,'+
                    'izm_plan,'+
                    'obpr,'+
                    'norma,'+
                    'norma_obpr,'+
                    'fact,'+
                    'razn_tonn,razn_dat,zayv_tonn,zayv_dat,kod_prich,comment,kod_struct,kod_parent) VALUES (');
      s:=FormatDateTime('"{"mm"/"dd"/"yyyy"}"',FieldByName('beg_date').AsDateTime)+','+
         FormatDateTime('"{"mm"/"dd"/"yyyy"}"',FieldByName('end_date').AsDateTime)+','+
         FieldByName('to_mos_str').AsString+','+
         FieldByName('ordnung').AsString+','''+
         FieldByName('kod_npr').AsString+''','''+
         FieldByName('naim_pr').AsString+''','+
         FieldByName('kod_pos').AsString+','+
         FieldByName('kod_sgr').AsString+','+
         FieldByName('kod_spg').AsString+','+
         FieldByName('kod_rzd').AsString+','+
         FieldByName('kod_prz').AsString+','+
         FieldByName('kod_grp').AsString+','''+
         FieldByName('naim').AsString+''','+
         FieldByName('kod_sobs').AsString+','+
         FieldByName('plan').AsString+','+
         FieldByName('izm_plan').AsString+','+
         FieldByName('obpr').AsString+','+
         FieldByName('norma').AsString+','+
         FieldByName('norma_obpr').AsString+','+
         FieldByName('fact').AsString+','+
         FieldByName('razn_tonn').AsString+','+
         FormatDateTime('"{"mm"/"dd"/"yyyy"}"',FieldByName('razn_dat').AsDateTime)+','+
         FieldByName('zayv_tonn').AsString+','+
         FormatDateTime('"{"mm"/"dd"/"yyyy"}"',FieldByName('zayv_dat').AsDateTime)+','+
         FieldByName('kod_prich').AsString+','''+
         FieldByName('comment').AsString+''','+
         FieldByName('kod_struct').AsString+','+
         FieldByName('kod_parent').AsString+')';
      q_cmn.SQL.Add(s);
      q_cmn.ExecSQL;
      q_tmp_prich.Next;
    end;
    q_tmp_prich.Close;
    pbar.Visible:=false;
    btPrichin.Enabled:=True;
  End;

begin
  // Проверка наличия справки в основной базе
  PF_Conn.Close;
  PF_Conn.Connected:=True;
  q_seek_prich.Close;
  q_seek_prich.Parameters.ParamByName('beg_date').Value:=date_proizv_from.Date;
  q_seek_prich.Parameters.ParamByName('end_date').Value:=date_proizv_to.Date;
  q_seek_prich.Open;
  FlagExist:=NOT q_seek_prich.Eof;
  FlagNew:=false;

  If NOT FlagExist OR (Application.MessageBox('Сформировать новую справку?','ВНИМАНИЕ!',MB_YESNO)=ID_YES) Then
  Begin
    if ExtractYear(Date1.Date)<>ExtractYear(Date2.Date) then
    begin
      ShowMessage('Только в пределах одного года.');
      Exit;
    end;

    FlagNew:=true;
    If FlagExist then
      if (Application.MessageBox(PChar('Справка за период с '+DateToStr(date_proizv_from.Date)+' по '+DateToStr(date_proizv_to.Date)+' уже существует. Заменить?'),'ВНИМАНИЕ!',MB_YESNO)=IDNO) Then
         FlagNew:=false;
    If FlagNew Then
    Begin

      Save_Cursor := Screen.Cursor;
      Screen.Cursor := crHourGlass;    { Show hourglass cursor }

      pbar.Visible:=True;
      pbar.Position:=1;
      pbar.Max:=100;
      btPrichin.Enabled:=False;
      btPrichin.Refresh;

      case rg_typeOtgr.ItemIndex of
        0: str_kod_otgr:=' AND month.kod_otgr<>10';
        1: str_kod_otgr:=' AND month.kod_otgr<>10 AND month.kod_otgr<>9';
        2: str_kod_otgr:=' AND month.kod_otgr<>10 AND month.kod_otgr=9';
      end;
      case rg_typeOtgr.ItemIndex of
        0: str_kod_otgr2:=' AND kod_otgr<>10';
        1: str_kod_otgr2:=' AND kod_otgr<>10 AND kod_otgr<>9';
        2: str_kod_otgr2:=' AND kod_otgr<>10 AND kod_otgr=9';
      end;

      q_grplp.Open;

      // Подготовка файла для расчета причин
      f1:=f_main.MasterDBFPath+'F42_SHB2.DBF'+#0;
      f2:=f_main.TempLocalPath+'F42_SHB2.DBF'+#0;
      COPYFILE(@f1[1],@f2[1],False);
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('DELETE FROM "'+f_main.TempLocalPath+'F42_SHB2.DBF"');
      q_cmn.ExecSQL;

      // Подготовка файлов для определения кода продукта
      f1:=f_main.MasterDBFPath+'prch_npr.DBF'+#0;
      f2:=f_main.TempLocalPath+'prch_npr.DBF'+#0;
      COPYFILE(@f1[1],@f2[1],False);
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('DELETE FROM "'+f_main.TempLocalPath+'prch_npr.DBF"');
      q_cmn.ExecSQL;

      f1:=f_main.MasterDBFPath+'prch_npr.DBF'+#0;
      f2:=f_main.TempLocalPath+'prch_np1.DBF'+#0;
      COPYFILE(@f1[1],@f2[1],False);
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('DELETE FROM "'+f_main.TempLocalPath+'prch_np1.DBF"');
      q_cmn.ExecSQL;

      // Подготовка временного файла под расчет производства
      f1:=f_main.MasterDBFPath+'F42_RESU.DBF'+#0;
      f2:=f_main.TempLocalPath+'F42_RESU.DBF'+#0;
      COPYFILE(@f1[1],@f2[1],False);
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('DELETE FROM "'+f_main.TempLocalPath+'F42_RESU.DBF"');
      q_cmn.ExecSQL;

      If cb_AddResurs.Checked Then
      Begin
        q_DateUpdate.SQL.Clear;
        s:='UPDATE F42_DATE SET DateBeg='''+FormatDateTime('dd/mm/yyyy',date_proizv_from.Date)+
                 ''', DateEnd='''+FormatDateTime('dd/mm/yyyy',date_proizv_to.Date)+'''';
        q_DateUpdate.SQL.Add(s);
        q_DateUpdate.ExecSQL;

        // Выборка ресурса
        q_JRsobstv.Open;
        q_resurs.Open;
        while not q_resurs.EOF do
        begin

          pbar.Position:=Round(q_resurs.RecNo/q_resurs.RecordCount*100/10);
          pbar.Refresh;

          if q_resurs.FieldByName('SelDaval').AsInteger=1 Then kod_sgr:='101'
          else
            if q_resurs.FieldByName('SelDaval').AsInteger=3 Then kod_sgr:='102'
            else kod_sgr:='0';

          // Поиск собственника
          kod_sobs1:=0;
          if q_JRsobstv.Locate('Код',q_resurs.FieldByName('sobstv').AsInteger,[]) then
          begin
            kod_sobs1:=q_JRSobstv.FieldByName('spr_sob').AsInteger;
          end;
          If kod_sobs1=0 Then kod_sobs1:=1;

          // добавление во временный файл
          q_cmn.SQL.Clear;
          q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'F42_RESU.DBF" (kod_npr,kod_sobs,kod_sgr,plan,fact,fact2,'+
                              'ost,hr,hran_n,hran_t,OstReal) VALUES (');
          s:=''''+q_resurs.FieldByName('prod').AsString+''','+
                             IntToStr(kod_sobs1)+','+
                             kod_sgr+','+
                             FloatToStr(q_resurs.FieldByName('plan').AsFloat)+','+
                             FloatToStr(q_resurs.FieldByName('fact').AsFloat)+','+
                             FloatToStr(q_resurs.FieldByName('fact2').AsFloat)+','+
                             FloatToStr(q_resurs.FieldByName('ost').AsFloat)+','+
                             FloatToStr(q_resurs.FieldByName('hr').AsFloat)+','+
                             FloatToStr(q_resurs.FieldByName('hran_n').AsFloat)+','+
                             FloatToStr(q_resurs.FieldByName('hran_t').AsFloat)+','+
                             FloatToStr(q_resurs.FieldByName('OstReal').AsFloat)+')';
          q_cmn.SQL.Add(s);
          q_cmn.ExecSQL;

          q_resurs.Next;
        end; //while not q_resurs.EOF
        q_resurs.Close;
        q_JRSobstv.Close;
      end;

      if rg_TypeSelect.ItemIndex=1 then
      begin
        // По счетам-фактурам
        QueryMon:=ExtractMonth(date1.Date);
        while QueryMon<=ExtractMonth(date2.Date) do
        begin
          mon:=IntToStr(QueryMon);
          if length(mon)<2 then mon:='0'+mon;
          year:=IntToStr(ExtractYear(date2.date));

          if ExtractYear(date2.Date)<2006 then
            s:='"'+ArchivePath+'out_plat.dbf"'
          else
            s:='"U:\LUK\TMP\OUT_PLAT.dbf"';
          q_fact_plat.SQL[19]:='FROM month,'+s+'OUT_PLAT,prod,kindprod,"'+PlanPostPath+'pl'+Copy(year,3,2)+'_'+mon+'\plotg1_.dbf" plotg, prod prod2';
          q_fact_plat.SQL[22]:='OUT_PLAT.DATA_KVIT BETWEEN '+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',date1.date)+' AND '+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',date2.date)+str_kod_otgr+' AND month.date_plan={'+mon+'/01/'+year+'}';
          if ExtractYear(date2.Date)<2005 then
            s:='"'+ArchivePath+'kvit.dbf"'
          else
            s:='';
          q_fact_plat.SQL[46]:='FROM month,'+s+'kvit,prod,kindprod,"'+PlanPostPath+'pl'+Copy(year,3,2)+'_'+mon+'\plotg1_.dbf" plotg, prod prod2';
          q_fact_plat.SQL[50]:='kvit.date_kvit BETWEEN '+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',date1.date)+' AND '+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',date2.date)+str_kod_otgr+' AND month.date_plan={'+mon+'/01/'+year+'}';
          q_fact_plat.SQL[77]:='OUT_PLAT.DATA_KVIT BETWEEN '+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',date1.date)+' AND '+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',date2.date)+str_kod_otgr+' AND month.date_plan={'+mon+'/01/'+year+'}';
          q_fact_plat.SQL[80]:='  and not exists (select plotg.n_dog from "'+PlanPostPath+'pl'+Copy(year,3,2)+'_'+mon+'\plotg1_.dbf" plotg';
          q_fact_plat.SQL[108]:='kvit.date_kvit BETWEEN '+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',date1.date)+' AND '+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',date2.date)+str_kod_otgr+' AND month.date_plan={'+mon+'/01/'+year+'}';
          q_fact_plat.SQL[111]:='  and not exists (select plotg.n_dog from "'+PlanPostPath+'pl'+Copy(year,3,2)+'_'+mon+'\plotg1_.dbf" plotg';

          CalcMon(year,mon,q_fact_plat);

          inc(QueryMon);
        end; // while QueryMon
      end
      else { Если оперативная отгрузка, то один месяц}
      begin
        mon:=IntToStr(cb_Month.ItemIndex+1);
        year:=IntToStr(Round(e_year.value));
        if length(mon)<2 then mon:='0'+mon;

        q_fact_otgr.SQL[22]:='DTOS(kvit.np_data_o)+kvit.np_timep<"'+
            FormatDateTime('yyyymmdd',e_date.date)+FormatDateTime('hh:mm:ss',e_time.time)+'"'+
            ' AND month.date_plan={'+mon+'/01/'+year+'}'+str_kod_otgr;
        q_fact_otgr.SQL[19]:='FROM "'+OperdataPath+'REESTR.DBF" kvit,month,prod,kindprod,"'+PlanPostPath+'pl'+Copy(year,3,2)+'_'+mon+'\plotg1_.dbf" plotg, prod prod2,kindprod kindprod2';
        q_fact_otgr.SQL[49]:='DTOS(kvit.np_data_o)+kvit.np_timep<"'+
            FormatDateTime('yyyymmdd',e_date.date)+FormatDateTime('hh:mm:ss',e_time.time)+'"'+
            ' AND month.date_plan={'+mon+'/01/'+year+'}'+str_kod_otgr;
        q_fact_otgr.SQL[52]:=' and not exists (select plotg.n_dog from "'+PlanPostPath+'pl'+Copy(year,3,2)+'_'+mon+'\plotg1_.dbf" plotg';

        CalcMon(year,mon,q_fact_otgr);
      end;

      // ====================== ИТОГИ по план-факту ===============================
      for i:=5 downto 2 do
      begin
        q_f42.SQL[23]:='WHERE kod_sobs=0 AND kod_pos='+IntToStr(i);
        q_f42.open;
        while not q_f42.eof do
        begin
          pbar.Position:=Round(30+(5-i)*10+q_f42.RecNo/q_f42.RecordCount*100/10);
          pbar.Refresh;
          kod_sgr:=q_f42KOD_SGR.AsString;
          if i>2 then kod_spg:=q_f42KOD_SPG.AsString else kod_spg:='0';
          if i>3 then kod_rzd:=q_f42KOD_rzd.AsString else kod_rzd:='0';
          if i>4 then kod_prz:=q_f42KOD_prz.AsString else kod_prz:='0';
          if i>5 then kod_grp:=q_f42KOD_grp.AsString else kod_grp:='0';

          if q_grplp.Locate('kod_sgr;kod_spg;kod_rzd;kod_prz;kod_grp',VarArrayOf([StrToInt(KOD_SGR),StrToInt(KOD_SPG),StrToInt(KOD_RZD),StrToInt(KOD_PRZ),StrToInt(KOD_GRP)]),[]) then
          begin
            gr_name:=Trim(q_grplp.FieldByName('naim').AsString);
            gr_pos:=q_grplp.FieldByName('kod_pos').AsString
          end
          else
          begin
            gr_name:=Trim(q_f42Naim.AsString);
            gr_pos:=q_f42kod_pos.AsString;
          end;

          // добавление в файл причин
          q_cmn2.SQL.Clear;
          q_cmn2.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'F42_SHB2.DBF" (to_mos,ordnung,kod_npr,naim_pr,kod_pos,'+
                        'kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,naim,kod_sobs,'+
                        'd_ves,v_ves,d_sum,v_sum,'+
                        'hd_ves,hv_ves,hd_sum,hv_sum,'+
                        'od_ves,ov_ves,od_sum,ov_sum,'+
                        'fd_ves,fv_ves,fd_sum,fv_sum,'+
                        'razn_tonn,razn_dat,zayv_tonn,zayv_dat) VALUES (');
          q_cmn2.SQL.Add({q_f42to_mos.AsString+}'.F.,'+
                        q_f42ordnung.AsString+','''+
                        q_f42kod_npr.AsString+''','''+
                        q_f42naim_pr.AsString+''','+
                        gr_pos+','+
                        kod_sgr+','+
                        kod_spg+','+
                        kod_rzd+','+
                        kod_prz+','+
                        kod_grp+','''+
                        gr_name+''',0,'+
                        q_f42od_ves.AsString+','+
                        q_f42ov_ves.AsString+','+
                        q_f42od_sum.AsString+','+
                        q_f42ov_sum.AsString+','+
                        '0,'+
                        '0,'+
                        '0,'+
                        '0,'+
                        q_f42od_ves.AsString+','+
                        q_f42ov_ves.AsString+','+
                        q_f42od_sum.AsString+','+
                        q_f42ov_sum.AsString+','+
                        q_f42fd_ves.AsString+','+
                        q_f42fv_ves.AsString+','+
                        q_f42fd_sum.AsString+','+
                        q_f42fv_sum.AsString+','+
                        FloatToStr(q_f42razn_tonn.AsFloat)+','+
                        FormatDateTime('"{"mm"/"dd"/"yyyy"}"',q_f42razn_dat.AsDateTime)+','+
                        FloatToStr(q_f42zayv_tonn.AsFloat)+','+
                        FormatDateTime('"{"mm"/"dd"/"yyyy"}"',q_f42zayv_dat.AsDateTime)+')');
          q_cmn2.ExecSQL;

          q_f42.Next;
        end;
        q_f42.Close;
      end;

      q_acc.SQL.Clear;
      q_acc.SQL.Add('UPDATE date_plan SET ');
      q_acc.SQL.Add('date_proizv_from=#'+FormatdateTime('m"/"d"/"yyyy',date_proizv_from.Date)+'#,');
      q_acc.SQL.Add('date_proizv_to=#'+FormatdateTime('m"/"d"/"yyyy',date_proizv_to.Date)+'#');
      q_acc.ExecSQL;

      // Убираем внутренний план по Севернефтепродукту

      // Подготовка файла
      f1:=f_main.MasterDBFPath+'F42_SHB2.DBF'+#0;
      f2:=f_main.TempLocalPath+'F42_SHB3.DBF'+#0;
      COPYFILE(@f1[1],@f2[1],False);
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('DELETE FROM "'+f_main.TempLocalPath+'F42_SHB3.DBF"');
      q_cmn.ExecSQL;
      q_f42_2.Open;
      while not q_f42_2.EOF do
      begin
        q_cmn2.SQL.Clear;
        q_cmn2.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'F42_SHB3.DBF" (to_mos,ordnung,kod_npr,naim_pr,kod_pos,'+
                        'kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,naim,kod_sobs,'+
                        'd_ves,v_ves,d_sum,v_sum,'+
                        'hd_ves,hv_ves,hd_sum,hv_sum,'+
                        'od_ves,ov_ves,od_sum,ov_sum,'+
                        'fd_ves,fv_ves,fd_sum,fv_sum,'+
                        'razn_tonn,razn_dat,zayv_tonn,zayv_dat) VALUES (');
        q_cmn2.SQL.Add(q_f42_2to_mos_str.AsString+','+
                        q_f42_2ordnung.AsString+','''+
                        q_f42_2kod_npr.AsString+''','''+
                        q_f42_2naim_pr.AsString+''','+
                        q_f42_2kod_pos1.AsString+','+
                        q_f42_2kod_sgr1.AsString+','+
                        q_f42_2kod_spg1.AsString+','+
                        q_f42_2kod_rzd1.AsString+','+
                        q_f42_2kod_prz1.AsString+','+
                        q_f42_2kod_grp1.AsString+','''+
                        q_f42_2naim2.AsString+''','+
                        q_f42_2kod_sobs.AsString+','+
                        q_f42_2d_ves.AsString+','+
                        q_f42_2v_ves.AsString+','+
                        q_f42_2d_sum.AsString+','+
                        q_f42_2v_sum.AsString+','+
                        q_f42_2hd_ves.AsString+','+
                        q_f42_2hv_ves.AsString+','+
                        q_f42_2hd_sum.AsString+','+
                        q_f42_2hv_sum.AsString+','+
                        q_f42_2od_ves.AsString+','+
                        q_f42_2ov_ves.AsString+','+
                        q_f42_2od_sum.AsString+','+
                        q_f42_2ov_sum.AsString+','+
                        q_f42_2fd_ves.AsString+','+
                        q_f42_2fv_ves.AsString+','+
                        q_f42_2fd_sum.AsString+','+
                        q_f42_2fv_sum.AsString+','+
                        FloatToStr(q_f42_2razn_tonn.AsFloat)+','+
                        FormatDateTime('"{"mm"/"dd"/"yyyy"}"',q_f42_2razn_dat.AsDateTime)+','+
                        FloatToStr(q_f42_2zayv_tonn.AsFloat)+','+
                        FormatDateTime('"{"mm"/"dd"/"yyyy"}"',q_f42_2zayv_dat.AsDateTime)+')');
        q_cmn2.ExecSQL;
        q_f42_2.Next;
      end;
      q_f42_2.Close;

      // Подготовка окончательного файла для причин
      f1:=f_main.MasterDBFPath+'F42_PRCH.DBF'+#0;
      f2:=f_main.TempLocalPath+'F42_PRCH.DBF'+#0;
      COPYFILE(@f1[1],@f2[1],False);
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('DELETE FROM "'+f_main.TempLocalPath+'F42_PRCH.DBF"');
      q_cmn.ExecSQL;
      q_prichsum.Open;
      while not q_prichsum.EOF do
      begin

        pbar.Position:=Round(80+q_prichsum.RecNo/q_prichsum.RecordCount*100/10);
        pbar.Refresh;

        q_cmn2.SQL.Clear;
        q_cmn2.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'F42_PRCH.DBF" (beg_date,end_date,to_mos,ordnung,kod_npr,naim_pr,kod_pos,'+
                      'kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,naim,kod_sobs,'+
                      'd_ves,v_ves,d_sum,v_sum,'+
                      'hd_ves,hv_ves,hd_sum,hv_sum,'+
                      'od_ves,ov_ves,od_sum,ov_sum,'+
                      'fd_ves,fv_ves,fd_sum,fv_sum,'+
                      'razn_tonn,razn_dat,zayv_tonn,zayv_dat) VALUES (');
                   s:=FormatDateTime('"{"mm"/"dd"/"yyyy"}"',date_proizv_from.Date)+','+
                      FormatDateTime('"{"mm"/"dd"/"yyyy"}"',date_proizv_to.Date)+','+
                      q_prichsumto_mos.AsString+','+
                      q_prichsumordnung.AsString+','''+
                      q_prichsumkod_npr.AsString+''','''+
                      q_prichsumnaim_pr.AsString+''','+
                      q_prichsumkod_pos.AsString+','+
                      q_prichsumkod_sgr.AsString+','+
                      q_prichsumkod_spg.AsString+','+
                      q_prichsumkod_rzd.AsString+','+
                      q_prichsumkod_prz.AsString+','+
                      q_prichsumkod_grp.AsString+','''+
                      q_prichsumnaim.AsString+''','+
                      q_prichsumkod_sobs.AsString+','+
                      q_prichsumd_ves.AsString+','+
                      q_prichsumv_ves.AsString+','+
                      q_prichsumd_sum.AsString+','+
                      q_prichsumv_sum.AsString+','+
                      q_prichsumhd_ves.AsString+','+
                      q_prichsumhv_ves.AsString+','+
                      q_prichsumhd_sum.AsString+','+
                      q_prichsumhv_sum.AsString+','+
                      q_prichsumod_ves.AsString+','+
                      q_prichsumov_ves.AsString+','+
                      q_prichsumod_sum.AsString+','+
                      q_prichsumov_sum.AsString+','+
                      q_prichsumfd_ves.AsString+','+
                      q_prichsumfv_ves.AsString+','+
                      q_prichsumfd_sum.AsString+','+
                      q_prichsumfv_sum.AsString+','+
                      FloatToStr(q_prichsum.FieldByName('razn_tonn').AsFloat)+','+
                      FormatDateTime('"{"mm"/"dd"/"yyyy"}"',q_prichsum.FieldByName('razn_dat').AsDateTime)+','+
                      FloatToStr(q_prichsum.FieldByName('zayv_tonn').AsFloat)+','+
                      FormatDateTime('"{"mm"/"dd"/"yyyy"}"',q_prichsum.FieldByName('zayv_dat').AsDateTime)+')';
        q_cmn2.SQL.Add(s);
        q_cmn2.ExecSQL;
        q_prichsum.Next;
      end;
      q_prichsum.Close;

      // доводка
      q_grplp.Close;

      q_seek_prich.Close;
      q_seek_prich.Open;

      q_new_prich.Close;
      q_new_prich.Parameters.ParamByName('beg_date').Value:=date_proizv_from.Date;
      q_new_prich.Parameters.ParamByName('end_date').Value:=date_proizv_to.Date;
      q_new_prich.Open;

      // Подготовка промежуточного файла
      f1:=f_main.MasterDBFPath+'prichin.DBF'+#0;
      f2:=f_main.TempLocalPath+'prichin.DBF'+#0;
      COPYFILE(@f1[1],@f2[1],False);
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('DELETE FROM "'+f_main.TempLocalPath+'prichin.DBF"');
      q_cmn.ExecSQL;

      OldNaim:='';
      while not q_new_prich.EOF do
      with q_new_prich do
      begin
        pbar.Position:=Round(90+q_new_prich.RecNo/q_new_prich.RecordCount*100/10);
        pbar.Refresh;

{        If (OldNaim<>(q_new_prich.FieldByName('kod_npr').AsString+q_new_prich.FieldByName('naim').AsString)) Then
        Begin}
          if q_seek_prich.Locate('ordnung;kod_npr;kod_pos;kod_sgr;kod_spg;kod_rzd;kod_prz;kod_grp',
             VarArrayOf([q_new_prich.FieldByName('ordnung').AsInteger,q_new_prich.FieldByName('kod_npr').AsString,
                         q_new_prich.FieldByName('kod_pos').AsInteger,q_new_prich.FieldByName('kod_sgr').AsInteger,
                         q_new_prich.FieldByName('kod_spg').AsInteger,q_new_prich.FieldByName('kod_rzd').AsInteger,
                         q_new_prich.FieldByName('kod_prz').AsInteger,q_new_prich.FieldByName('kod_grp').AsInteger]),[]) then
          Begin
            kod_prich:=q_seek_prich.FieldByName('kod_prich').AsInteger;
            comment:=q_seek_prich.FieldByName('comment').AsString;

          End
          Else
          Begin
            kod_prich:=0;
            comment:='';
          End;

          plan:=FieldByName('d_ves').AsFloat+FieldByName('v_ves').AsFloat;
          obpr:=FieldByName('od_ves').AsFloat+FieldByName('ov_ves').AsFloat;
          DaysInMonth := DaysPerMonth(ExtractYear(FieldByName('end_date').AsDateTime), ExtractMonth(FieldByName('end_date').AsDateTime));
          Norma := plan * ExtractDay(FieldByName('end_date').AsDateTime) / DaysInMonth;
          Norma_obpr := obpr * ExtractDay(FieldByName('end_date').AsDateTime) / DaysInMonth;
          kod_pos:=Trim(FieldByName('kod_pos').AsString);
          kod_sgr:=PADL(FieldByName('kod_sgr').AsString,3);
          kod_spg:=PADL(FieldByName('kod_spg').AsString,3);
          kod_rzd:=PADL(FieldByName('kod_rzd').AsString,3);
          kod_prz:=PADL(FieldByName('kod_prz').AsString,3);
          kod_grp:=PADL(FieldByName('kod_grp').AsString,2);
          kod_sobs:=PADL(FieldByName('kod_sobs').AsString,3);

          IF StrToInt(kod_pos)=0 Then
            kod_struct:='1'+kod_sgr+kod_spg+kod_rzd+kod_prz+kod_grp
          else
            kod_struct:='2'+kod_sgr+kod_spg+kod_rzd+kod_prz+kod_grp;

          case StrToInt(kod_pos) of
            0: kod_parent:='-1';
            1: kod_parent:='-1';
            2: kod_parent:='2'+kod_sgr+'00000000000';
            3: kod_parent:='2'+kod_sgr+kod_spg+'00000000';
            4: kod_parent:='2'+kod_sgr+kod_spg+kod_rzd+'00000';
          else kod_parent:='2'+kod_sgr+kod_spg+kod_rzd+kod_prz+'00';
          end;
          q_cmn.SQL.Clear;
          q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'prichin.DBF" (beg_date,end_date,to_mos,ordnung,kod_npr,naim_pr,kod_pos,'+
                        'kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,naim,kod_sobs,'+
                        'plan,'+
                        'izm_plan,'+
                        'obpr,'+
                        'norma,'+
                        'norma_obpr,'+
                        'fact,'+
                        'razn_tonn,razn_dat,zayv_tonn,zayv_dat,kod_prich,comment,kod_struct,kod_parent) VALUES (');
                     s:=FormatDateTime('"{"mm"/"dd"/"yyyy"}"',FieldByName('beg_date').AsDateTime)+','+
                        FormatDateTime('"{"mm"/"dd"/"yyyy"}"',FieldByName('end_date').AsDateTime)+','+
                        FieldByName('to_mos_str').AsString+','+
                        FieldByName('ordnung').AsString+','''+
                        FieldByName('kod_npr').AsString+''','''+
                        FieldByName('naim_pr').AsString+''','+
                        kod_pos+','+
                        kod_sgr+','+
                        kod_spg+','+
                        kod_rzd+','+
                        kod_prz+','+
                        kod_grp+','''+
                        FieldByName('naim').AsString+''','+
                        kod_sobs+','+
                        FloatToStr(plan)+','+
                        FloatToStr(FieldByName('hd_ves').AsFloat+FieldByName('hv_ves').AsFloat)+','+
                        FloatToStr(FieldByName('od_ves').AsFloat+FieldByName('ov_ves').AsFloat)+','+
                        FloatToStr(norma)+','+
                        FloatToStr(norma_obpr)+','+
                        FloatToStr(FieldByName('fd_ves').AsFloat+FieldByName('fv_ves').AsFloat)+','+
                        FloatToStr(FieldByName('razn_tonn').AsFloat)+','+
                        FormatDateTime('"{"mm"/"dd"/"yyyy"}"',FieldByName('razn_dat').AsDateTime)+','+
                        FloatToStr(FieldByName('zayv_tonn').AsFloat)+','+
                        FormatDateTime('"{"mm"/"dd"/"yyyy"}"',FieldByName('zayv_dat').AsDateTime)+','+
                        IntToStr(kod_prich)+','''+
                        comment+''','+kod_struct+','+kod_parent+')';
          q_cmn.SQL.Add(s);
          q_cmn.ExecSQL;
{        end;}
        OldNaim:=q_new_prich.FieldByName('kod_npr').AsString+q_new_prich.FieldByName('naim').AsString;
        q_new_prich.Next;
      end;
      q_new_prich.Close;
      q_seek_prich.Close;

      pbar.Visible:=false;
      btPrichin.Enabled:=True;

      Screen.Cursor := Save_Cursor;  { Always restore to normal }
    end
    Else FillToTmp;
  End
  Else FillToTmp;

  FormPrichin:=TFormPrichin.create(Self);
  with FormPrichin do
  try
    FormPrichin.Caption:='Справка о причинах отклонения от плана поставок на '+DateToStr(date_proizv_to.Date);
    FormPrichin.ShowModal;
    If (FlagNew AND NOT FlagExist) OR (Application.MessageBox('Сохранить изменения справки?','ВНИМАНИЕ!',MB_YESNO)=ID_YES) Then
      FillToBase;
  finally
    Free
  end;
end;

procedure Tf_f42_prich.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PF_Conn.Close;
end;

function PADL(s:string;len:integer):string;
var i:integer;
Begin
  s:=Trim(s);
  i:=length(s);
  for i:=len downto i+1 do s:='0'+s;
  PADL:=s;
End;

procedure Tf_f42_prich.e_dateChange(Sender: TObject);
begin
  date_proizv_to.Date:=e_date.Date-1;
  date_proizv_from.Date:=date_proizv_to.Date-ExtractDay(date_proizv_to.Date)+1;
end;

procedure Tf_f42_prich.cb_MonthChange(Sender: TObject);
var MM,YY:word;
begin
  MM:=ExtractMonth(e_date.Date);
  YY:=ExtractYear(e_date.Date);
  If cb_Month.ItemIndex+1<MM Then
  Begin
    date_proizv_from.Date:=EncodeDate(YY,cb_Month.ItemIndex+1,1);
    MM:=cb_Month.ItemIndex+2;
    IF MM>13 Then Begin MM:=1;YY:=YY+1 end;
    date_proizv_to.Date:=EncodeDate(YY,MM,1)-1;
  End
  Else
  Begin
    date_proizv_to.Date:=e_date.Date-1;
    date_proizv_from.Date:=date_proizv_to.Date-ExtractDay(date_proizv_to.Date)+1;
  End;
end;

end.



