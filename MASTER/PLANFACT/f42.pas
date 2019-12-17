unit f42;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, RXSpin, Placemnt, Db, ADODB, ExtCtrls, variants,
  TB2Item, TB2Dock, TB2Toolbar, OracleData;

type
  Tf_f42 = class(TForm)
    GroupBox1: TGroupBox;
    l_date1: TLabel;
    date1: TDateTimePicker;
    date2: TDateTimePicker;
    l_date2: TLabel;
    BitBtn1: TBitBtn;
    ds_plan: TDataSource;
    q_plan: TADOQuery;
    q_fact_plat: TADOQuery;
    q_cmn: TADOQuery;
    q_cmn2: TADOQuery;
    q_grplp: TADOQuery;
    ADOConnection1: TADOConnection;
    q_plansum: TADOQuery;
    q_f42: TADOQuery;
    q_fact_otgr: TADOQuery;
    rg_TypeSelect: TRadioGroup;
    l_date: TLabel;
    e_date: TDateTimePicker;
    e_time: TDateTimePicker;
    l_month: TLabel;
    cb_Month: TComboBox;
    l_year: TLabel;
    e_year: TRxSpinEdit;
    q_pryam: TADOQuery;
    BitBtn2: TBitBtn;
    q_pf_dbf: TADOQuery;
    BitBtn3: TBitBtn;
    q_acc: TADOQuery;
    pbar: TProgressBar;
    rg_typeOtgr: TRadioGroup;
    q_pryam_sf: TADOQuery;
    q_fact_platkod_npr: TStringField;
    q_fact_platkod_pos: TIntegerField;
    q_fact_platkod_sgr: TIntegerField;
    q_fact_platkod_spg: TIntegerField;
    q_fact_platkod_rzd: TIntegerField;
    q_fact_platkod_prz: TIntegerField;
    q_fact_platkod_grp: TIntegerField;
    q_fact_platnaim: TStringField;
    q_fact_platd_ves: TBCDField;
    q_fact_platv_ves: TBCDField;
    q_fact_platd_sum: TBCDField;
    q_fact_platv_sum: TBCDField;
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
    q_f42kod_npr: TStringField;
    q_f42kod_pos: TIntegerField;
    q_f42kod_sgr: TIntegerField;
    q_f42kod_spg: TIntegerField;
    q_f42kod_rzd: TIntegerField;
    q_f42kod_prz: TIntegerField;
    q_f42kod_grp: TIntegerField;
    q_f42naim: TStringField;
    q_f42d_ves: TBCDField;
    q_f42v_ves: TBCDField;
    q_f42d_sum: TBCDField;
    q_f42v_sum: TBCDField;
    q_f42fd_ves: TBCDField;
    q_f42fv_ves: TBCDField;
    q_f42fd_sum: TBCDField;
    q_f42fv_sum: TBCDField;
    q_pryam_sfkod_plat: TIntegerField;
    q_pryam_sfkod_npr: TStringField;
    q_pryam_sfves: TBCDField;
    q_pryam_sfsum: TBCDField;
    q_pryamkod_plat: TIntegerField;
    q_pryamkod_npr: TStringField;
    q_pryamves: TBCDField;
    q_pryamsum: TBCDField;
    cb_FullPlan: TCheckBox;
    q_fullplan: TADOQuery;
    q_fullplankod_npr: TStringField;
    q_fullplankod_pos: TIntegerField;
    q_fullplankod_sgr: TIntegerField;
    q_fullplankod_spg: TIntegerField;
    q_fullplankod_rzd: TIntegerField;
    q_fullplankod_prz: TIntegerField;
    q_fullplankod_grp: TIntegerField;
    q_fullplankod_pgr: TIntegerField;
    q_fullplannaim: TStringField;
    q_sev_np_sf: TADOQuery;
    q_sev_np: TADOQuery;
    q_sev_np_sfkod_npr: TStringField;
    q_sev_np_sfves: TBCDField;
    q_sev_np_sfsum: TBCDField;
    q_sev_npkod_npr: TStringField;
    q_sev_npves: TBCDField;
    q_sev_npsum: TBCDField;
    DataSource1: TDataSource;
    q_sev_npkod_sgr: TIntegerField;
    q_sev_npkod_spg: TIntegerField;
    q_sev_npkod_rzd: TIntegerField;
    q_sev_npkod_prz: TIntegerField;
    q_sev_npkod_grp: TIntegerField;
    q_sev_npkod_pgr: TIntegerField;
    q_sev_npluk_dog_id: TStringField;
    q_sev_npluk_plt_id: TIntegerField;
    q_sev_npsnp_dog_id: TStringField;
    q_sev_npsnp_plt_id: TIntegerField;
    q_sev_np_sfkod_sgr: TIntegerField;
    q_sev_np_sfkod_spg: TIntegerField;
    q_sev_np_sfkod_rzd: TIntegerField;
    q_sev_np_sfkod_prz: TIntegerField;
    q_sev_np_sfkod_grp: TIntegerField;
    q_sev_np_sfkod_pgr: TIntegerField;
    q_sev_np_sfluk_dog_id: TStringField;
    q_sev_np_sfluk_plt_id: TIntegerField;
    q_sev_np_sfsnp_dog_id: TStringField;
    q_sev_np_sfsnp_plt_id: TIntegerField;
    q_sev_npnaim: TStringField;
    q_sev_np_sfnaim: TStringField;
    q_sev_np_sfkod_pos: TIntegerField;
    q_sev_npkod_pos: TIntegerField;
    cb_OnlyPlanSNP: TCheckBox;
    q_f42_2: TADOQuery;
    q_f42_2kod_npr: TStringField;
    q_f42_2kod_pos: TIntegerField;
    q_f42_2kod_sgr: TIntegerField;
    q_f42_2kod_spg: TIntegerField;
    q_f42_2kod_rzd: TIntegerField;
    q_f42_2kod_prz: TIntegerField;
    q_f42_2kod_grp: TIntegerField;
    q_f42_2naim: TStringField;
    q_f42_2d_ves: TBCDField;
    q_f42_2v_ves: TBCDField;
    q_f42_2d_sum: TBCDField;
    q_f42_2v_sum: TBCDField;
    q_f42_2fd_ves: TBCDField;
    q_f42_2fv_ves: TBCDField;
    q_f42_2fd_sum: TBCDField;
    q_f42_2fv_sum: TBCDField;
    q_f42_2naim2: TStringField;
    q_f42_2kod_pos1: TIntegerField;
    q_f42_2kod_sgr1: TIntegerField;
    q_f42_2kod_spg1: TIntegerField;
    q_f42_2kod_rzd1: TIntegerField;
    q_f42_2kod_prz1: TIntegerField;
    q_f42_2kod_grp1: TIntegerField;
    q_f42_2kod_pgr1: TIntegerField;
    Timer1: TTimer;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    bt_pfLukoil: TTBItem;
    bt_PFOutsiders: TTBItem;
    q_month: TADOQuery;
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
    q_monthnom_zd: TStringField;
    q_f42zayv_tonn: TBCDField;
    q_f42zayv_dat: TDateField;
    q_f42_2zayv_tonn: TBCDField;
    q_f42_2zayv_dat: TDateField;
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
    q_f42_2od_ves: TBCDField;
    q_f42_2ov_ves: TBCDField;
    q_f42_2od_sum: TBCDField;
    q_f42_2ov_sum: TBCDField;
    q_plansumod_ves: TBCDField;
    q_plansumov_ves: TBCDField;
    q_plansumod_sum: TBCDField;
    q_plansumov_sum: TBCDField;
    btPLNP: TBitBtn;
    q_plnp: TADOQuery;
    q_tr_rash: TADOQuery;
    StringField1: TStringField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    StringField2: TStringField;
    BCDField3: TBCDField;
    BCDField4: TBCDField;
    q_f42od_ves: TBCDField;
    q_f42ov_ves: TBCDField;
    q_f42od_sum: TBCDField;
    q_f42ov_sum: TBCDField;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure q_fact_platBeforeOpen(DataSet: TDataSet);
    procedure date1Change(Sender: TObject);
    procedure date2Change(Sender: TObject);
    procedure q_fact_otgrBeforeOpen(DataSet: TDataSet);
    procedure rg_TypeSelectClick(Sender: TObject);
    procedure Calc_pryam;
    procedure Calc_pryam_SNP;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ADOConnection1BeforeConnect(Sender: TObject);
    procedure SetSQLFromPath(ASQL:TStrings);
    procedure q_fullplanBeforeOpen(DataSet: TDataSet);
    procedure q_accBeforeOpen(DataSet: TDataSet);
    procedure q_sev_npBeforeOpen(DataSet: TDataSet);
    procedure q_sev_np_sfBeforeOpen(DataSet: TDataSet);
    procedure q_grplpBeforeOpen(DataSet: TDataSet);
    procedure q_plansumBeforeOpen(DataSet: TDataSet);
    procedure q_planBeforeOpen(DataSet: TDataSet);
    procedure q_f42BeforeOpen(DataSet: TDataSet);
    procedure q_cmnBeforeOpen(DataSet: TDataSet);
    procedure q_cmn2BeforeOpen(DataSet: TDataSet);
    procedure q_f42_2BeforeOpen(DataSet: TDataSet);
    procedure q_pryam_sfBeforeOpen(DataSet: TDataSet);
    procedure q_pryamBeforeOpen(DataSet: TDataSet);
    procedure q_pf_dbfBeforeOpen(DataSet: TDataSet);
    procedure q_monthBeforeOpen(DataSet: TDataSet);
    procedure btPLNPClick(Sender: TObject);
    procedure q_plnpBeforeOpen(DataSet: TDataSet);
    procedure q_tr_rashBeforeOpen(DataSet: TDataSet);
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

var
  f_f42: Tf_f42;

implementation

uses ForDB, dateutil,strutils,pfdbf, ForFiles, plnp_dbf, plnp, main;

{$R *.DFM}

procedure Tf_f42.FormCreate(Sender: TObject);
begin
  PlanPostPath:=F_FileUtils.FillFilePath(f_main.GetApplVari('PlanPostPath'),false);
  ArchivePath:=F_FileUtils.FillFilePath(f_main.GetApplVari('ArchivePath'),false);
  DbasesPath:=F_FileUtils.FillFilePath(f_main.GetApplVari('DbasesPath'),false);
  OutDbasesPath:=F_FileUtils.FillFilePath(f_main.GetApplVari('OutDbasesPath'),false);
  OperdataPath:=F_FileUtils.FillFilePath(f_main.GetApplVari('OperdataPath'),false);

  date1.Date:=FirstDayOfPrevMonth;
  date2.Date:=LastDayOfPrevMonth;
  cb_Month.ItemIndex:=ExtractMonth(Date())-1;
  e_Year.Value:=ExtractYear(Date());
  e_Date.Date:=Date;
  if Date>StrToDate('01.01.2003') then
    e_time.Time:=StrToTime('00:00:00')
  Else
    e_time.Time:=StrToTime('06:00:00');
end;

procedure Tf_f42.BitBtn1Click(Sender: TObject);
var
  f1,f2,GR_Name,GR_Pos:String[255];
  QueryMon:integer; {Номер месяца, по которому выбирается план}
  mon:String[2];
  year:String[2];
  year2:String[4];
  i:integer;
  kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp:String;
  q_Fact:TADOQuery;
  d:TDateTime;
  Save_Cursor: TCursor;
begin
  Save_Cursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;    { Show hourglass cursor }

  ADOConnection1.Connected:=True;
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
  case rg_typeOtgr.ItemIndex of
    0: str_kod_otgr3:=' AND nazn_otg_id<>10';
    1: str_kod_otgr3:=' AND nazn_otg_id<>10 AND nazn_otg_id<>9';
    2: str_kod_otgr3:=' AND nazn_otg_id<>10 AND nazn_otg_id=9';
  end;
  ADOConnection1.Close;
  ADOConnection1.Connected:=True;
  Calc_Pryam; {Для оперативной информации раскрываются прямые поставки (и не только)}
  q_grplp.Open;
  Calc_Pryam_SNP; {Для оперативной информации раскрываются поставки Севернефтепродукту}
  q_grplp.Close;
  if rg_TypeSelect.ItemIndex=0 then
    begin
      q_Fact:=q_fact_otgr;
      ADOConnection1.Close;
      ADOConnection1.Connected:=True;
    end
  else
    q_Fact:=q_fact_plat;

  if ExtractYear(Date1.Date)<>ExtractYear(Date2.Date) then
    begin
      ShowMessage('Только в пределах одного года.');
      Exit;
    end;
  pbar.Visible:=True;
  pbar.Position:=0;
  BitBtn1.Enabled:=False;
  BitBtn1.Refresh;
  f1:=f_main.MasterDBFPath+ 'F42_SHBL.DBF'+#0;
  f2:=f_main.TempLocalPath + 'F42_SHBL.DBF'+#0;
  COPYFILE(@f1[1],@f2[1],False);
  q_cmn.SQL.Clear;
  q_cmn.SQL.Add('DELETE FROM "'+f_main.TempLocalPath+'F42_SHBL.DBF"');
  q_cmn.ExecSQL;

  {============================ Расчет плана ======================================================================}
  If cb_FullPlan.Checked then {Заполнить всю структуру плана}
  Begin
    q_grplp.Open;
    q_fullplan.Open;
    while not q_fullplan.EOF do
    begin
      if q_grplp.Locate('kod_sgr;kod_spg;kod_rzd;kod_prz;kod_grp',VarArrayOf([q_fullplanKOD_SGR.AsInteger,q_fullplanKOD_SPG.AsInteger,q_fullplanKOD_RZD.AsInteger,q_fullplanKOD_PRZ.AsInteger,q_fullplanKOD_GRP.AsInteger]),[]) then
      begin
        gr_name:=Trim(q_grplp.FieldByName('naim').AsString);
        gr_pos:=q_grplp.FieldByName('kod_pos').AsString
      end
      else
      begin
        gr_name:=Trim(q_fullplanNaim.AsString);
        gr_pos:=q_fullplankod_pos.AsString;
      end;
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'F42_SHBL.DBF" (kod_npr,kod_pos,kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,naim,d_ves,v_ves,d_sum,v_sum,od_ves,ov_ves,od_sum,ov_sum) VALUES (');
      q_cmn.SQL.Add(''''+q_fullplankod_npr.AsString+''','+gr_pos+','+q_fullplankod_sgr.AsString+','+q_fullplankod_spg.AsString+','+q_fullplankod_rzd.AsString+','+q_fullplankod_prz.AsString+','+q_fullplankod_grp.AsString+',');
      q_cmn.SQL.Add(''''+gr_name+''',0,0,0,0,0,0,0,0)');
      q_cmn.ExecSQL;
      q_fullplan.Next;
    end;
    q_fullplan.Close;
    q_grplp.Close;
  end;

  if rg_TypeSelect.ItemIndex=1 then
    begin
      QueryMon:=ExtractMonth(date1.Date);
      q_grplp.Open;
      while QueryMon<=ExtractMonth(date2.Date) do
        begin
          mon:=IntToStr(QueryMon);
          if length(mon)<2 then mon:='0'+mon;
          year:=Copy(IntToStr(ExtractYear(date2.date)),3,2);
          q_plan.SQL[16]:='"'+PlanPostPath+'pl'+year+'_'+mon+'\PL_MOS2.DBF" pl_mos2';
          q_plan.SQL[17]:='WHERE grplp2.kod_pos<=5 and grplp2.kod_sgr<>501'+str_kod_otgr2;
          q_plan.Open;
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
              q_cmn.SQL.Clear;
              q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'F42_SHBL.DBF" (kod_npr,kod_pos,kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,naim,d_ves,v_ves,d_sum,v_sum,od_ves,ov_ves,od_sum,ov_sum) VALUES (');
              q_cmn.SQL.Add(''''+q_plankod_npr.AsString+''','+gr_pos+','+q_plankod_sgr.AsString+','+q_plankod_spg.AsString+','+q_plankod_rzd.AsString+','+q_plankod_prz.AsString+','+q_plankod_grp.AsString+',');
              q_cmn.SQL.Add(''''+gr_name+''','+q_pland_ves.AsString+','+q_planv_ves.AsString+','+q_pland_sum.AsString+','+q_planv_sum.AsString+',0,0,0,0)');
              q_cmn.ExecSQL;
              q_plan.Next;
            end;
          q_plan.Close;
          inc(QueryMon);
        end;
      q_grplp.Close;
    end
  else { Если оперативная отгрузка, то один месяц}
    begin
      mon:=IntToStr(cb_Month.ItemIndex+1);
      year:=Copy(IntToStr(Round(e_year.value)),3,2);
      if length(mon)<2 then mon:='0'+mon;
      q_plan.SQL[15]:='"'+PlanPostPath+'pl'+year+'_'+mon+'\grplp2.dbf" grplp2,';
      q_plan.SQL[16]:='"'+PlanPostPath+'pl'+year+'_'+mon+'\PL_MOS2.DBF" pl_mos2';
      q_plan.SQL[17]:='WHERE grplp2.kod_pos<=5 and grplp2.kod_sgr<>501'+str_kod_otgr2;
      q_plan.Open;
      q_grplp.Open;
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
          q_cmn.SQL.Clear;
          q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'F42_SHBL.DBF" (kod_npr,kod_pos,kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,naim,d_ves,v_ves,d_sum,v_sum,od_ves,ov_ves,od_sum,ov_sum) VALUES (');
          q_cmn.SQL.Add(''''+q_plankod_npr.AsString+''','+gr_pos+','+q_plankod_sgr.AsString+','+q_plankod_spg.AsString+','+q_plankod_rzd.AsString+','+q_plankod_prz.AsString+','+q_plankod_grp.AsString+',');
          q_cmn.SQL.Add(''''+gr_name+''','+q_pland_ves.AsString+','+q_planv_ves.AsString+','+q_pland_sum.AsString+','+q_planv_sum.AsString+',0,0,0,0)');
          q_cmn.ExecSQL;
          q_plan.Next;
        end;
        q_grplp.Close;
        q_plan.Close;
    end;

  {============================ Расчет ОБПР ======================================================================}
  if rg_TypeSelect.ItemIndex=1 then
    begin
      QueryMon:=ExtractMonth(date1.Date);
      q_grplp.Open;
      while QueryMon<=ExtractMonth(date2.Date) do
        begin
          mon:=IntToStr(QueryMon);
          if length(mon)<2 then mon:='0'+mon;
          year:=Copy(IntToStr(ExtractYear(date2.date)),3,2);
          year2:=IntToStr(ExtractYear(date2.date));
          q_obpr.SQL[23]:=' AND KLS_PLANSTRU.kod_sgr<>501 '+str_kod_otgr3;
          q_obpr.SQL[27]:=' AND PLAN_PERIODS.DATE_PLAN=TO_DATE(''01.'+mon+'.'+year2+''',''dd.mm.yyyy'') ';
          q_obpr.Open;
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
              q_cmn.SQL.Clear;
              q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'F42_SHBL.DBF" (kod_npr,kod_pos,kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,naim,d_ves,v_ves,d_sum,v_sum,od_ves,ov_ves,od_sum,ov_sum) VALUES (');
              q_cmn.SQL.Add(''''+q_obprkod_npr.AsString+''','+gr_pos+','+q_obprkod_sgr.AsString+','+q_obprkod_spg.AsString+','+q_obprkod_rzd.AsString+','+q_obprkod_prz.AsString+','+q_obprkod_grp.AsString+',');
              q_cmn.SQL.Add(''''+gr_name+''','+q_obprd_ves.AsString+','+q_obprv_ves.AsString+','+q_obprd_sum.AsString+','+q_obprv_sum.AsString+','+q_obprd_ves.AsString+','+q_obprv_ves.AsString+','+q_obprd_sum.AsString+','+q_obprv_sum.AsString+')');
              q_cmn.ExecSQL;
              q_obpr.Next;
            end;
          q_obpr.Close;
          inc(QueryMon);
        end;
      q_grplp.Close;
    end
  else { Если оперативная отгрузка, то один месяц}
    begin
      mon:=IntToStr(cb_Month.ItemIndex+1);
      year:=Copy(IntToStr(Round(e_year.value)),3,2);
      year2:=IntToStr(Round(e_year.value));
      if length(mon)<2 then mon:='0'+mon;
      q_obpr.SQL[23]:=' AND KLS_PLANSTRU.kod_sgr<>501 '+str_kod_otgr3;
      q_obpr.SQL[27]:=' AND PLAN_PERIODS.DATE_PLAN=TO_DATE(''01.'+mon+'.'+year2+''',''dd.mm.yyyy'') ';
      q_obpr.Open;
      q_grplp.Open;
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
          q_cmn.SQL.Clear;
          q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'F42_SHBL.DBF" (kod_npr,kod_pos,kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,naim,d_ves,v_ves,d_sum,v_sum,od_ves,ov_ves,od_sum,ov_sum) VALUES (');
          q_cmn.SQL.Add(''''+q_obprkod_npr.AsString+''','+gr_pos+','+q_obprkod_sgr.AsString+','+q_obprkod_spg.AsString+','+q_obprkod_rzd.AsString+','+q_obprkod_prz.AsString+','+q_obprkod_grp.AsString+',');
          q_cmn.SQL.Add(''''+gr_name+''','+q_obprd_ves.AsString+','+q_obprv_ves.AsString+','+q_obprd_sum.AsString+','+q_obprv_sum.AsString+','+q_obprd_ves.AsString+','+q_obprv_ves.AsString+','+q_obprd_sum.AsString+','+q_obprv_sum.AsString+')');
          q_cmn.ExecSQL;
          q_obpr.Next;
        end;
        q_grplp.Close;
        q_obpr.Close;
    end;


  {============================ Перенос плана ======================================================================}
  f1:=f_main.MasterDBFPath+'F42_PLAN.DBF'+#0;
  f2:=f_main.TempLocalPath+'F42_PLN1.DBF'+#0;
  COPYFILE(@f1[1],@f2[1],False);
  q_cmn.SQL.Clear;
  q_cmn.SQL.Add('DELETE FROM "'+f_main.TempLocalPath+'F42_PLN1.DBF"');
  q_cmn.ExecSQL;
  q_plansum.Open;
  while not q_plansum.EOF do
    begin
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'F42_PLN1.DBF" (kod_npr,kod_pos,kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,naim,d_ves,v_ves,d_sum,v_sum,od_ves,ov_ves,od_sum,ov_sum,Fd_ves,Fv_ves,Fd_sum,Fv_sum,zayv_tonn,zayv_dat) VALUES (');
      q_cmn.SQL.Add(''''+q_plansumkod_npr.AsString+''','+q_plansumkod_pos.AsString+','+q_plansumkod_sgr.AsString+','+q_plansumkod_spg.AsString+','+q_plansumkod_rzd.AsString+','+q_plansumkod_prz.AsString+','+q_plansumkod_grp.AsString+',');
      q_cmn.SQL.Add(''''+q_plansumnaim.AsString+''','+q_plansumd_ves.AsString+','+q_plansumv_ves.AsString+','+q_plansumd_sum.AsString+','+q_plansumv_sum.AsString+','+q_plansumod_ves.AsString+','+q_plansumov_ves.AsString+','+q_plansumod_sum.AsString+','+q_plansumov_sum.AsString+',0,0,0,0,0,{01/01/1990})');
      q_cmn.ExecSQL;
      q_plansum.Next;
    end;
  q_plansum.Close;

  {============================ Расчет факта ======================================================================}
  q_fact.Open;
  q_grplp.Open;
  while not q_fact.Eof do
    begin
      pbar.Position:=Round(q_fact.RecNo/q_fact.RecordCount*100/5);
      pbar.Refresh;
      if True then
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
          q_cmn2.SQl.Clear;
          q_cmn2.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'F42_PLN1.DBF" (kod_npr,kod_pos,kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,naim,d_ves,v_ves,d_sum,v_sum,od_ves,ov_ves,od_sum,ov_sum,Fd_ves,Fv_ves,Fd_sum,Fv_sum,zayv_tonn,zayv_dat) VALUES (');
          q_cmn2.SQL.ADD(''''+q_fact.FieldByName('KOD_NPR').AsString+''',');
          q_cmn2.SQL.Add(gr_pos+',');
          q_cmn2.SQL.Add(q_Fact.FieldByName('kod_sgr').AsString+','+q_Fact.FieldByName('kod_spg').AsString+',');
          q_cmn2.SQL.Add(q_Fact.FieldByName('kod_rzd').AsString+','+q_Fact.FieldByName('kod_prz').AsString+',');
          q_cmn2.SQL.Add(q_Fact.FieldByName('kod_grp').AsString+','''+gr_name+''',0,0,0,0,0,0,0,0,');
          q_cmn2.SQL.Add(FloatToStr(q_Fact.FieldByName('d_ves').AsFloat)+','+FloatToStr(q_Fact.FieldByName('v_ves').AsFloat)+',');
          q_cmn2.SQL.Add(FloatToStr(q_Fact.FieldByName('d_sum').AsFloat)+','+FloatToStr(q_Fact.FieldByName('v_sum').AsFloat)+',0,{01/01/1990})');
          q_cmn2.ExecSQL;
        end;
      q_fact.Next;
    end;
  q_fact.Close;

  {============================ Расчет транспортных расходов  ===================================================}
  q_tr_rash.Open;
  q_grplp.Open;
  while not q_tr_rash.Eof do
    begin
      if q_grplp.Locate('kod_sgr;kod_spg;kod_rzd;kod_prz;kod_grp',VarArrayOf([q_tr_rash.FieldByName('KOD_SGR').AsInteger,q_tr_rash.FieldByName('KOD_SPG').AsInteger,q_tr_rash.FieldByName('KOD_RZD').AsInteger,q_tr_rash.FieldByName('KOD_PRZ').AsInteger,q_tr_rash.FieldByName('KOD_GRP').AsInteger]),[]) then
        begin
          gr_name:=Trim(q_grplp.FieldByName('naim').AsString);
          gr_pos:=q_grplp.FieldByName('kod_pos').AsString
        end
      else
        begin
          gr_name:=Trim(q_tr_rash.FieldByName('Naim').AsString);
          gr_pos:=q_tr_rash.FieldByName('kod_pos').AsString;
        end;
      q_cmn2.SQl.Clear;
      q_cmn2.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'F42_PLN1.DBF" (kod_npr,kod_pos,kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,naim,d_ves,v_ves,d_sum,v_sum,od_ves,ov_ves,od_sum,ov_sum,Fd_ves,Fv_ves,Fd_sum,Fv_sum,zayv_tonn,zayv_dat) VALUES (');
      q_cmn2.SQL.ADD(''''+q_tr_rash.FieldByName('KOD_NPR').AsString+''',');
      q_cmn2.SQL.Add(gr_pos+',');
      q_cmn2.SQL.Add(q_tr_rash.FieldByName('kod_sgr').AsString+','+q_tr_rash.FieldByName('kod_spg').AsString+',');
      q_cmn2.SQL.Add(q_tr_rash.FieldByName('kod_rzd').AsString+','+q_tr_rash.FieldByName('kod_prz').AsString+',');
      q_cmn2.SQL.Add(q_tr_rash.FieldByName('kod_grp').AsString+','''+gr_name+''',0,0,0,0,0,0,0,0,');
      q_cmn2.SQL.Add('0,0,');
      q_cmn2.SQL.Add(FloatToStr(q_tr_rash.FieldByName('d_sum').AsFloat)+','+FloatToStr(q_tr_rash.FieldByName('v_sum').AsFloat)+',0,{01/01/1990})');
      q_cmn2.ExecSQL;

      q_tr_rash.Next;
    end;
  q_tr_rash.Close;

  {============================ Расчет заявок ======================================================================}
  if rg_TypeSelect.ItemIndex=1 then
  begin
    // По счетам-фактурам
    d:=date2.Date
  end
  else
  Begin
    // Оперативная
    d:=e_date.Date;
    if Copy(TimeToStr(e_time.Time),1,5)='00:00' then
      d:=d-1;
  end;
  q_month.SQL[17]:='FROM month,prod,kindprod,"'+PlanPostPath+'pl'+year+'_'+mon+'\plotg2.dbf" plotg';
  q_month.SQL[20]:='month.vvoddat<='+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',d)+' AND month.date_plan='+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',EncodeDate(Round(e_year.Value),cb_Month.ItemIndex+1,1))+str_kod_otgr;
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

    q_cmn2.SQl.Clear;
    q_cmn2.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'F42_PLN1.DBF" (kod_npr,kod_pos,kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,naim,d_ves,v_ves,d_sum,v_sum,od_ves,ov_ves,od_sum,ov_sum,Fd_ves,Fv_ves,Fd_sum,Fv_sum,zayv_tonn,zayv_dat) VALUES (');
    q_cmn2.SQL.ADD(''''+q_month.FieldByName('KOD_NPR').AsString+''',');
    q_cmn2.SQL.Add(gr_pos+',');
    q_cmn2.SQL.Add(q_Month.FieldByName('kod_sgr').AsString+','+q_Month.FieldByName('kod_spg').AsString+',');
    q_cmn2.SQL.Add(q_Month.FieldByName('kod_rzd').AsString+','+q_Month.FieldByName('kod_prz').AsString+',');
    q_cmn2.SQL.Add(q_Month.FieldByName('kod_grp').AsString+','''+gr_name+''',0,0,0,0,0,0,0,0,0,0,0,0,');
    q_cmn2.SQL.Add(FloatToStr(q_month.FieldByName('tonn').AsFloat)+',');
    q_cmn2.SQL.Add(FormatDateTime('"{"mm"/"dd"/"yyyy"}"',q_month.FieldByName('vvoddat').AsDateTime)+')');
    q_cmn2.ExecSQL;

    q_month.Next;
  end;
  q_month.close;

  // ====================== ИТОГИ по план-факту ===============================
  for i:=5 downto 2 do
    begin
      q_f42.SQL[1]:='WHERE kod_pos='+IntToStr(i);
      q_f42.open;
      while not q_f42.eof do
        begin
          pbar.Position:=Round((6-i)*20+q_f42.RecNo/q_f42.RecordCount*100/5);
          pbar.Refresh;
          kod_sgr:=q_f42KOD_SGR.AsString;
          if i>2 then kod_spg:=q_f42KOD_SPG.AsString else kod_spg:='0';
          if i>3 then kod_rzd:=q_f42KOD_rzd.AsString else kod_rzd:='0';
          if i>4 then kod_prz:=q_f42KOD_prz.AsString else kod_prz:='0';
          if i>5 then kod_grp:=q_f42KOD_grp.AsString else kod_grp:='0';

          if True then
            begin
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
              q_cmn2.SQl.Clear;
              q_cmn2.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'F42_PLN1.DBF" (kod_npr,kod_pos,kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,naim,d_ves,v_ves,d_sum,v_sum,od_ves,ov_ves,od_sum,ov_sum,Fd_ves,Fv_ves,Fd_sum,Fv_sum,zayv_tonn,zayv_dat) VALUES (');
              q_cmn2.SQL.ADD(''''+q_f42KOD_NPR.AsString+''',');
              q_cmn2.SQL.Add(gr_pos+',');
              q_cmn2.SQL.Add(kod_sgr+','+kod_spg+',');
              q_cmn2.SQL.Add(kod_rzd+','+kod_prz+',');
              q_cmn2.SQL.Add(kod_grp+','''+gr_name+''',');
              q_cmn2.SQL.Add(FloatToStr(q_f42od_ves.AsFloat)+','+FloatToStr(q_f42ov_ves.AsFloat)+',');
              q_cmn2.SQL.Add(FloatToStr(q_f42od_sum.AsFloat)+','+FloatToStr(q_f42ov_sum.AsFloat)+',');
              q_cmn2.SQL.Add(FloatToStr(q_f42od_ves.AsFloat)+','+FloatToStr(q_f42ov_ves.AsFloat)+',');
              q_cmn2.SQL.Add(FloatToStr(q_f42od_sum.AsFloat)+','+FloatToStr(q_f42ov_sum.AsFloat)+',');
              q_cmn2.SQL.Add(FloatToStr(q_f42fd_ves.AsFloat)+','+FloatToStr(q_f42fv_ves.AsFloat)+',');
              q_cmn2.SQL.Add(FloatToStr(q_f42fd_sum.AsFloat)+','+FloatToStr(q_f42fv_sum.AsFloat)+',');
              q_cmn2.SQL.Add(FloatToStr(q_f42zayv_tonn.AsFloat)+',');
              q_cmn2.SQL.Add(FormatDateTime('"{"mm"/"dd"/"yyyy"}"',q_f42zayv_dat.AsDateTime)+')');
              q_cmn2.ExecSQL;
            end;
          q_f42.Next;
        end;
    q_f42.Close;
  end;
  q_grplp.Close;
  q_cmn.SQL.Clear;
  q_cmn.SQL.Add('UPdAtE "'+f_main.TempLocalPath+'f42_pln1" SET kod_spg=999 WHERE kod_sgr=90 and kod_spg=10');
  q_cmn.ExecSQL;

  // Убираем внутренний план по Севернефтепродукту

  // Подготовка файла
  f1:=f_main.MasterDBFPath+'F42_PLAN.DBF'+#0;
  f2:=f_main.TempLocalPath+'F42_PLAN.DBF'+#0;
  COPYFILE(@f1[1],@f2[1],False);
  q_cmn.SQL.Clear;
  q_cmn.SQL.Add('DELETE FROM "'+f_main.TempLocalPath+'F42_PLAN.DBF"');
  q_cmn.ExecSQL;

  q_f42_2.Open;
  while not q_f42_2.EOF do
  begin
    q_cmn2.SQL.Clear;
    q_cmn2.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'F42_PLAN.DBF" (kod_npr,kod_pos,kod_sgr,'+
                   'kod_spg,kod_rzd,kod_prz,kod_grp,naim,'+
                   'd_ves,v_ves,d_sum,v_sum,od_ves,ov_ves,od_sum,ov_sum,Fd_ves,Fv_ves,Fd_sum,Fv_sum,zayv_tonn,zayv_dat) VALUES (');
    q_cmn2.SQL.Add(''''+q_f42_2kod_npr.AsString+''',');
    if not cb_OnlyPlanSNP.Checked then
    Begin
      q_cmn2.SQL.Add(q_f42_2kod_pos1.AsString+','+
                     q_f42_2kod_sgr1.AsString+','+
                     q_f42_2kod_spg1.AsString+','+
                     q_f42_2kod_rzd1.AsString+','+
                     q_f42_2kod_prz1.AsString+','+
                     q_f42_2kod_grp1.AsString+','''+
                     q_f42_2naim2.AsString+''',');
    end
    else
    begin
      q_cmn2.SQL.Add(q_f42_2kod_pos.AsString+','+
                     q_f42_2kod_sgr.AsString+','+
                     q_f42_2kod_spg.AsString+','+
                     q_f42_2kod_rzd.AsString+','+
                     q_f42_2kod_prz.AsString+','+
                     q_f42_2kod_grp.AsString+','''+
                     q_f42_2naim.AsString+''',');
    end;
    q_cmn2.SQL.Add(q_f42_2d_ves.AsString+','+
                   q_f42_2v_ves.AsString+','+
                   q_f42_2d_sum.AsString+','+
                   q_f42_2v_sum.AsString+','+
                   q_f42_2od_ves.AsString+','+
                   q_f42_2ov_ves.AsString+','+
                   q_f42_2od_sum.AsString+','+
                   q_f42_2ov_sum.AsString+','+
                   q_f42_2fd_ves.AsString+','+
                   q_f42_2fv_ves.AsString+','+
                   q_f42_2fd_sum.AsString+','+
                   q_f42_2fv_sum.AsString+','+
                   q_f42_2zayv_tonn.AsString+','+
                   FormatDateTime('"{"mm"/"dd"/"yyyy"}"',q_f42_2zayv_dat.AsDateTime)+')');
    q_cmn2.ExecSQL;
    q_f42_2.Next;
  end;
  q_f42_2.Close;

  q_acc.SQL.Clear;
  q_acc.SQL.Add('UPDATE date_plan SET date_plan=#'+FormatdateTime('m"/"d"/"yyyy',EncodeDate(Round(e_year.Value), cb_Month.ItemIndex+1, 1))+'#,');
  if not cb_OnlyPlanSNP.Checked then
  Begin
    q_acc.SQL.Add('OnlyPlanSNP=0,');
  end
  else
  begin
    q_acc.SQL.Add('OnlyPlanSNP=1,');
  end;
  q_acc.SQL.Add('date_vyb=#'+FormatdateTime('m"/"d"/"yyyy',e_date.Date)+'#,');
  q_acc.SQL.Add('time_vyb='''+FormatdateTime('hh:mm:ss',e_time.time)+'''');
  q_acc.ExecSQL;
  pbar.Visible:=False;
  BitBtn1.Enabled:=True;

  Screen.Cursor := Save_Cursor;  { Always restore to normal }
end;


procedure Tf_f42.q_fact_platBeforeOpen(DataSet: TDataSet);
begin
  if ExtractYear(date2.Date)<2006 then
    begin
      q_fact_plat.SQL[13]:='FROM month,"'+ArchivePath+'out_plat.dbf" OUT_PLAT';
      q_fact_plat.SQL[32]:='FROM month,"'+ArchivePath+'kvit.dbf" kvit';
      q_fact_plat.SQL[35]:='(kvit.kod_otgr=5 or kvit.kod_otgr=8) and';
    end
  else
    begin
      q_fact_plat.SQL[13]:='FROM month,"U:\LUK\TMP\OUT_PLAT.dbf" OUT_PLAT';
      q_fact_plat.SQL[32]:='FROM month,kvit';
      q_fact_plat.SQL[35]:='(kvit.kod_otgr=5 or kvit.kod_otgr=8 or kvit.kod_plat=8) and';
    end;
  q_fact_plat.SQL[16]:='OUT_PLAT.DATA_KVIT BETWEEN '+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',date1.date)+' AND '+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',date2.date)+str_kod_otgr;
  q_fact_plat.SQL[36]:='kvit.date_kvit BETWEEN '+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',date1.date)+' AND '+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',date2.date)+str_kod_otgr;
  SetSQLFromPath(TADOQuery(DataSet).SQL);
  q_fact_plat.SQL.SaveToFile('c:\1.sql');
end;

procedure Tf_f42.date1Change(Sender: TObject);
begin
  if date2.date<date1.date then date2.date:=date1.date;
end;

procedure Tf_f42.date2Change(Sender: TObject);
begin
  if date2.date<date1.date then date1.date:=date2.date;
end;

procedure Tf_f42.q_fact_otgrBeforeOpen(DataSet: TDataSet);
begin
  q_fact_otgr.SQL[16]:='DTOS(kvit.np_data_o)+kvit.np_timep<"'+
        FormatDateTime('yyyymmdd',e_date.date)+FormatDateTime('hh:mm:ss',e_time.time)+'"'+
        ' AND month.date_plan='+
        FormatDateTime('"{"mm"/"dd"/"yyyy"}"',EncodeDate(Round(e_year.Value),cb_Month.ItemIndex+1,1))+str_kod_otgr;
  SetSQLFromPath(TADOQuery(DataSet).SQL);
end;

procedure Tf_f42.rg_TypeSelectClick(Sender: TObject);
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
      btPLNP.Enabled:=true;
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
      btPLNP.Enabled:=false;
    end;
end;

procedure Tf_f42.Calc_pryam;
var f1,f2:String[255];
begin
  f1:=f_main.MasterDBFPath+'optov.DBF'+#0;
  f2:=f_main.TempLocalPath+'optov.DBF'+#0;
  COPYFILE(@f1[1],@f2[1],False);
  q_cmn.SQL.Clear;
  q_cmn.SQL.Add('DELETE FROM "'+f_main.TempLocalPath+'optov.DBF"');
  q_cmn.ExecSQL;
  if rg_TypeSelect.ItemIndex=0 then
    begin
      q_pryam.SQL[3] :=' month.date_plan={'+FormatdateTime('mm"/"dd"/"yyyy',EncodeDate(Round(e_year.Value), cb_Month.ItemIndex+1, 1))+'}';
      q_pryam.SQL[6] :='  AND DTOS(np_data_o)+np_timep<'''+FormatdateTime('yyyymmdd',e_date.Date)+FormatdateTime('hh:mm:ss',e_time.time)+'''';
      q_pryam.Open;
      while not q_pryam.eof do
        begin
          q_cmn.SQL.Clear;
          q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'optov" (kod_plat,kod_npr,ves,sum) VALUES ('+
            q_pryam.FieldByName('kod_plat').AsString+','+
            ''''+q_pryam.FieldByName('kod_npr').AsString+''','+
            FloatToStr(q_pryam.FieldByName('ves').AsFloat/1000)+','+
            FloatToStr(q_pryam.FieldByName('sum').AsFloat/1000)+
          ')');
          q_cmn.ExecSQL;
          q_pryam.next;
        end;
      q_pryam.close;
    end
  else
    begin
      q_pryam_sf.SQL[5] :='AND OUT_PLAT.DATA_KVIT>='+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',date1.date)+' AND OUT_PLAT.DATA_KVIT<='+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',date2.date);
      q_pryam_sf.Open;
      while not q_pryam_sf.eof do
        begin
          q_cmn.SQL.Clear;
          q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'optov" (kod_plat,kod_npr,ves,sum) VALUES ('+
            q_pryam_sf.FieldByName('kod_plat').AsString+','+
            ''''+q_pryam_sf.FieldByName('kod_npr').AsString+''','+
            FloatToStr(q_pryam_sf.FieldByName('ves').AsFloat/1000)+','+
            FloatToStr(q_pryam_sf.FieldByName('sum').AsFloat/1000)+
          ')');
          q_cmn.ExecSQL;
          q_pryam_sf.next;
        end;
      q_pryam_sf.close;
    end;
  q_cmn.Close;
end;

procedure Tf_f42.Calc_pryam_SNP;
var  f1,f2:String[255];
     S:string;
     gr_name,gr_pos:string;
begin
  f1:=f_main.MasterDBFPath+'luk_snp.DBF'+#0;
  f2:=f_main.TempLocalPath+'luk_snp.DBF'+#0;
  COPYFILE(@f1[1],@f2[1],False);
  q_cmn.SQL.Clear;
  q_cmn.SQL.Add('DELETE FROM "'+f_main.TempLocalPath+'luk_snp.DBF"');
  q_cmn.ExecSQL;
  q_sev_np.Close;
  q_sev_np_sf.Close;;
  if rg_TypeSelect.ItemIndex=0 then
    begin
      q_sev_np.SQL[16] :=' month.date_plan={'+FormatdateTime('mm"/"dd"/"yyyy',EncodeDate(Round(e_year.Value), cb_Month.ItemIndex+1, 1))+'}';
      q_sev_np.SQL[17] :=' AND DTOS(np_data_o)+np_timep<'''+FormatdateTime('yyyymmdd',e_date.Date)+FormatdateTime('hh:mm:ss',e_time.time)+'''';
      q_sev_np.SQL[39] :=' month.date_plan={'+FormatdateTime('mm"/"dd"/"yyyy',EncodeDate(Round(e_year.Value), cb_Month.ItemIndex+1, 1))+'}';
      q_sev_np.SQL[40] :=' AND DTOS(np_data_o)+np_timep<'''+FormatdateTime('yyyymmdd',e_date.Date)+FormatdateTime('hh:mm:ss',e_time.time)+'''';
      q_sev_np.Open;
      while not q_sev_np.eof do
        begin
          if q_grplp.Locate('kod_sgr;kod_spg;kod_rzd;kod_prz;kod_grp',VarArrayOf([q_sev_npKOD_SGR.AsInteger,q_sev_npKOD_SPG.AsInteger,q_sev_npKOD_RZD.AsInteger,q_sev_npKOD_PRZ.AsInteger,q_sev_npKOD_GRP.AsInteger]),[]) then
            begin
              gr_name:=Trim(q_grplp.FieldByName('naim').AsString);
              gr_pos:=q_grplp.FieldByName('kod_pos').AsString
            end
          else
            begin
              gr_name:=Trim(q_sev_npNaim.AsString);
              gr_pos:=q_sev_npkod_pos.AsString;
            end;
          q_cmn.SQL.Clear;
          s:='INSERT INTO "'+f_main.TempLocalPath+'luk_snp" (kod_pos,kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,kod_pgr,naim,luk_dog_id,luk_plt_id,snp_dog_id,snp_plt_id,kod_npr,ves,sum) VALUES ('+
            gr_pos+','+
            q_sev_np.FieldByName('kod_sgr').AsString+','+
            q_sev_np.FieldByName('kod_spg').AsString+','+
            q_sev_np.FieldByName('kod_rzd').AsString+','+
            q_sev_np.FieldByName('kod_prz').AsString+','+
            q_sev_np.FieldByName('kod_grp').AsString+','+
            q_sev_np.FieldByName('kod_pgr').AsString+','+
            ''''+gr_name+''','+
            ''''+q_sev_np.FieldByName('luk_dog_id').AsString+''','+
            q_sev_np.FieldByName('luk_plt_id').AsString+','+
            ''''+q_sev_np.FieldByName('snp_dog_id').AsString+''','+
            q_sev_np.FieldByName('snp_plt_id').AsString+','+
            ''''+q_sev_np.FieldByName('kod_npr').AsString+''','+
            FloatToStr(q_sev_np.FieldByName('ves').AsFloat/1000)+','+
            FloatToStr(q_sev_np.FieldByName('sum').AsFloat/1000)+
          ')';
          q_cmn.SQL.Add(S);
          q_cmn.ExecSQL;
          q_sev_np.next;
        end;
      q_sev_np.close;
    end
  else
    begin
      q_sev_np_sf.SQL[16] :=' OUT_PLAT.DATA_KVIT>='+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',date1.date)+' AND OUT_PLAT.DATA_KVIT<='+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',date2.date);
      q_sev_np_sf.SQL[38] :=' OUT_PLAT.DATA_KVIT>='+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',date1.date)+' AND OUT_PLAT.DATA_KVIT<='+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',date2.date);
      q_sev_np_sf.Open;
      while not q_sev_np_sf.eof do
        begin
          if q_grplp.Locate('kod_sgr;kod_spg;kod_rzd;kod_prz;kod_grp',VarArrayOf([q_sev_np_sfKOD_SGR.AsInteger,q_sev_np_sfKOD_SPG.AsInteger,q_sev_np_sfKOD_RZD.AsInteger,q_sev_np_sfKOD_PRZ.AsInteger,q_sev_np_sfKOD_GRP.AsInteger]),[]) then
            begin
              gr_name:=Trim(q_grplp.FieldByName('naim').AsString);
              gr_pos:=q_grplp.FieldByName('kod_pos').AsString
            end
          else
            begin
              gr_name:=Trim(q_sev_np_sfNaim.AsString);
              gr_pos:=q_sev_np_sfkod_pos.AsString;
            end;
          q_cmn.SQL.Clear;
          q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'luk_snp" (kod_pos,kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,kod_pgr,naim,luk_dog_id,luk_plt_id,snp_dog_id,snp_plt_id,kod_npr,ves,sum) VALUES ('+
            gr_pos+','+
            q_sev_np_sf.FieldByName('kod_sgr').AsString+','+
            q_sev_np_sf.FieldByName('kod_spg').AsString+','+
            q_sev_np_sf.FieldByName('kod_rzd').AsString+','+
            q_sev_np_sf.FieldByName('kod_prz').AsString+','+
            q_sev_np_sf.FieldByName('kod_grp').AsString+','+
            q_sev_np_sf.FieldByName('kod_pgr').AsString+','+
            ''''+gr_name+''','+
            ''''+q_sev_np_sf.FieldByName('luk_dog_id').AsString+''','+
            q_sev_np_sf.FieldByName('luk_plt_id').AsString+','+
            ''''+q_sev_np_sf.FieldByName('snp_dog_id').AsString+''','+
            q_sev_np_sf.FieldByName('snp_plt_id').AsString+','+
            ''''+q_sev_np_sf.FieldByName('kod_npr').AsString+''','+
            FloatToStr(q_sev_np_sf.FieldByName('ves').AsFloat/1000)+','+
            FloatToStr(q_sev_np_sf.FieldByName('sum').AsFloat/1000)+
          ')');
          q_cmn.ExecSQL;
          q_sev_np_sf.next;
        end;
      q_sev_np_sf.close;
    end;
  q_cmn.Close;
end;

procedure Tf_f42.BitBtn3Click(Sender: TObject);
begin
  if bt_pfLukoil.Checked then
    F_FileUtils.CheckReport('f42.xls',f_main.TempNetPath+'f42.xls')
  else
    F_FileUtils.CheckReport('f42_out.xls',f_main.TempNetPath+'f42.xls');
  F_FileUtils.ExecAndWait(f_main.TempNetPath+'f42.xls','',SW_SHOWMAXIMIZED,false)
end;

procedure Tf_f42.BitBtn2Click(Sender: TObject);
var
  day,month,year:Word;
  SourceFile,DestFile:String;
  CurrGroup,CurrName :String;
  ToSkip:Boolean;
begin
  ToSkip:=False;
  ADOConnection1.Connected:=False;
  ADOConnection1.Connected:=True;

  SourceFile:=f_main.MasterDBFPath+'PF_SHBL.DBF'+#0;
  FillChar(DestFile,SizeOf(DestFile),0);
  decodedate(Date()-1,Year,Month,day);
  If (Year*100+Month) < 200501 Then
    DestFile:=f_main.TempLocalPath+system.copy('0'+IntTostr(day),length('0'+IntTostr(day))-1,2)+copy('0'+IntTostr(month),length('0'+IntTostr(month))-1,2)+'pfX6.dbf'
  else
    DestFile:=f_main.TempLocalPath+system.copy('0'+IntTostr(day),length('0'+IntTostr(day))-1,2)+copy('0'+IntTostr(month),length('0'+IntTostr(month))-1,2)+'pf34.dbf';
  DeleteFile(DestFile);
  CopyFile(@SourceFile[1],@DestFile[1],True);
  with q_cmn do
    begin
      if Active then Close;
      SQL.Clear;
      SQL.Add('DELETE FROM "'+DestFile+'"');
      ExecSQL;
      if q_pf_dbf.Active then q_pf_dbf.Close;
      q_pf_dbf.Open;
      q_pf_dbf.Last;
      CurrGroup:=q_pf_dbf.FieldByName('kod_plan').AsString;
      CurrName:=q_pf_dbf.FieldByName('naim_plan').AsString;
      while not q_pf_dbf.Bof do
        begin
          if (CurrGroup=q_pf_dbf.FieldByName('kod_plan').AsString) then
             begin
               {Одна группа - одна позиция плана поставок}
               ToSkip:=False;
             end;
(*          if (CurrGroup<>q_pf_dbf.FieldByName('kod_plan').AsString) and
             (CurrName=q_pf_dbf.FieldByName('naim_plan').AsString) then
             begin
               {Другая группа - та же позиция плана поставок}
               //ToSkip:=True;
               ToSkip:=False;
             end;  *)
          if (CurrGroup<>q_pf_dbf.FieldByName('kod_plan').AsString) then
             begin
               {Другая группа - другая позиция плана поставок}
               if System.Copy(q_pf_dbf.FieldByName('kod_plan').AsString,1,q_pf_dbf.FieldByName('kod_pos').AsInteger*3)=
                  System.Copy(CurrGroup,1,q_pf_dbf.FieldByName('kod_pos').AsInteger*3) then
                 ToSkip:=True
               else
                 begin
                    ToSkip:=False;
                    CurrGroup:=q_pf_dbf.FieldByName('kod_plan').AsString;
                    CurrName:=q_pf_dbf.FieldByName('naim_plan').AsString;
                 end;
             end;
          if not ToSkip then
            begin
              SQL.Clear;
              SQL.Add('INSERT INTO "'+DestFile+'" (KOD_PLAN,NAIM_PLAN,KOD_10,PLAN_D,PLAN_V,PLAN_VZ,SPLAN_D,SPLAN_V,SPLAN_VZ,FACT_D,FACT_V,FACT_VZ,SFACT_D,SFACT_V,SFACT_VZ) VALUES (');
              SQL.Add(''''+q_pf_dbf.FieldByName('lukoil_id').AsString+''',');
              SQL.Add(''''+Trim(q_pf_dbf.FieldByName('naim_plan').AsString)+''',');
              SQL.Add(''''+q_pf_dbf.FieldByName('kod_10').AsString+''',');
              SQL.Add(IntTostr(Round(q_pf_dbf.FieldByName('plan_d').AsFloat))+',');
              SQL.Add(IntTostr(Round(q_pf_dbf.FieldByName('plan_v').AsFloat))+',');
              SQL.Add(IntTostr(Round(q_pf_dbf.FieldByName('plan_vz').AsFloat))+',');
              SQL.Add(IntTostr(Round(q_pf_dbf.FieldByName('splan_d').AsFloat))+',');
              SQL.Add(IntTostr(Round(q_pf_dbf.FieldByName('splan_v').AsFloat))+',');
              SQL.Add(IntTostr(Round(q_pf_dbf.FieldByName('splan_vz').AsFloat))+',');
              SQL.Add(IntTostr(Round(q_pf_dbf.FieldByName('fact_d').AsFloat))+',');
              SQL.Add(IntTostr(Round(q_pf_dbf.FieldByName('fact_v').AsFloat))+',');
              SQL.Add(IntTostr(Round(q_pf_dbf.FieldByName('fact_vz').AsFloat))+',');
              SQL.Add(IntTostr(Round(q_pf_dbf.FieldByName('sfact_d').AsFloat))+',');
              SQL.Add(IntTostr(Round(q_pf_dbf.FieldByName('sfact_v').AsFloat))+',');
              SQL.Add(IntTostr(Round(q_pf_dbf.FieldByName('sfact_vz').AsFloat))+')');
              ExecSQL;
            end;
          q_pf_dbf.Prior;
        end;
      q_pf_dbf.close;
    end;
  q_cmn.Active:=False;
  with tf_pfdbf.create(self) do
    begin
      Caption:=DestFile;
      t_pfdbf.TableName:=DestFile;
      t_pfdbf.open;
      ShowModal;
      Free;
    end;
end;

procedure Tf_f42.FormShow(Sender: TObject);
begin
  Timer1.Enabled:=True;
end;

procedure Tf_f42.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:=False;
  if (ParamCount>0) and (ParamStr(1)='/pf') then
    begin
      e_date.Date:=Date;
      e_time.Time:=StrToTime('00:00:00');
      if ExtractMonth(Date)<>ExtractMonth(Date-1) then
        begin
          if cb_Month.ItemIndex>0 then
            cb_Month.ItemIndex:=cb_Month.ItemIndex-1
          else
            begin
              e_year.Value:=e_year.Value-1;
              cb_Month.ItemIndex:=11;
            end;
        end;
      BitBtn1Click(Self);
      BitBtn2Click(Self);
      Close;
    end;
end;

procedure Tf_f42.ADOConnection1BeforeConnect(Sender: TObject);
begin
  if bt_pfLukoil.Checked then
    ADOConnection1.DefaultDatabase:=DbasesPath
  else
    ADOConnection1.DefaultDatabase:=OutDbasesPath;
end;

procedure Tf_f42.SetSQLFromPath(ASQL:TStrings);
var
  I:Integer;
  J:Integer;
  S:String[255];
begin
  if bt_PFOutsiders.Checked then
    for i:=0 to ASQL.Count-1 do
    Begin
      while pos(OperdataPath+'REESTR',UpperCase(ASQL[i]))>0 do
        begin
          J:=pos(OperdataPath+'REESTR',UpperCase(ASQL[i]));
          S:=ASQL[i];
          System.delete(S,J,27);
          System.insert(DbasesPath+'KVIT',S,J);
          ASQL[i]:=S;
        end;
{      while pos('REESTR',UpperCase(ASQL[i]))>0 do
        begin
          J:=pos('REESTR',UpperCase(ASQL[i]));
          S:=ASQL[i];
          System.delete(S,J,6);
          System.insert('KVIT',S,J);
          ASQL[i]:=S;
        end;}
      while pos('U:',UpperCase(ASQL[i]))>0 do
        begin
          S:=ASQL[i];
          S[pos('U:',UpperCase(ASQL[i]))]:='p';
          ASQL[i]:=S;
        end;
    end;
end;

procedure Tf_f42.q_fullplanBeforeOpen(DataSet: TDataSet);
begin
  SetSQLFromPath(TADOQuery(DataSet).SQL);
end;

procedure Tf_f42.q_accBeforeOpen(DataSet: TDataSet);
begin
  SetSQLFromPath(TADOQuery(DataSet).SQL);
end;

procedure Tf_f42.q_sev_npBeforeOpen(DataSet: TDataSet);
begin
  SetSQLFromPath(TADOQuery(DataSet).SQL);
end;

procedure Tf_f42.q_sev_np_sfBeforeOpen(DataSet: TDataSet);
begin
  SetSQLFromPath(TADOQuery(DataSet).SQL);
end;

procedure Tf_f42.q_grplpBeforeOpen(DataSet: TDataSet);
begin
  SetSQLFromPath(TADOQuery(DataSet).SQL);
end;

procedure Tf_f42.q_plansumBeforeOpen(DataSet: TDataSet);
begin
  SetSQLFromPath(TADOQuery(DataSet).SQL);
end;

procedure Tf_f42.q_planBeforeOpen(DataSet: TDataSet);
begin
  SetSQLFromPath(TADOQuery(DataSet).SQL);
end;

procedure Tf_f42.q_f42BeforeOpen(DataSet: TDataSet);
begin
  SetSQLFromPath(TADOQuery(DataSet).SQL);
end;

procedure Tf_f42.q_cmnBeforeOpen(DataSet: TDataSet);
begin
  SetSQLFromPath(TADOQuery(DataSet).SQL);
end;

procedure Tf_f42.q_cmn2BeforeOpen(DataSet: TDataSet);
begin
  SetSQLFromPath(TADOQuery(DataSet).SQL);
end;

procedure Tf_f42.q_f42_2BeforeOpen(DataSet: TDataSet);
begin
  SetSQLFromPath(TADOQuery(DataSet).SQL);
end;

procedure Tf_f42.q_pryam_sfBeforeOpen(DataSet: TDataSet);
begin
  SetSQLFromPath(TADOQuery(DataSet).SQL);
end;

procedure Tf_f42.q_pryamBeforeOpen(DataSet: TDataSet);
begin
  SetSQLFromPath(TADOQuery(DataSet).SQL);
end;

procedure Tf_f42.q_pf_dbfBeforeOpen(DataSet: TDataSet);
begin
  SetSQLFromPath(TADOQuery(DataSet).SQL);
end;

procedure Tf_f42.q_monthBeforeOpen(DataSet: TDataSet);
begin
  SetSQLFromPath(TADOQuery(DataSet).SQL);
end;

procedure Tf_f42.btPLNPClick(Sender: TObject);
var
  day,month,year:Word;
  mm:string;
  yy:string;
  SourceFile,DestFile:String;
  CurrGroup,CurrName :String;
  ToSkip:Boolean;
  g_PlanTypId:integer;
  g_FromDate:TDateTime;
begin
  Year:=Round(e_year.value);
  Month:=cb_Month.ItemIndex+1;
  mm:=IntToStr(Month);
  mm:=system.copy('0'+mm,length('0'+mm)-1,2);
  yy:=Copy(IntToStr(Year),3,2);

  g_PlanTypId:=-1;

  with Tf_plnp.Create(Self) do
  Begin
    DatePlan:=EncodeDate(Round(e_year.value),cb_Month.ItemIndex+1,1);
    EndDate:=e_date.Date;
    if Copy(TimeToStr(e_time.Time),1,5)='00:00' then
      EndDate:=EndDate-1;
    ShowModal;
    If ModalResult=mrOk then
    Begin
      g_PlanTypId:=PlanTypId;
      g_FromDate:=FromDate
    End;
    Free;
  End;

  If g_PlanTypId=-1 then exit;

  ToSkip:=False;
  ADOConnection1.Connected:=False;
  ADOConnection1.Connected:=True;

  SourceFile:=f_main.MasterDBFPath+'PF_PLNP.DBF'+#0;
  FillChar(DestFile,SizeOf(DestFile),0);
  IF yy>='05' then
    DestFile:=f_main.TempLocalPath+mm+yy+'p334.dbf'
  else
    DestFile:=f_main.TempLocalPath+mm+yy+'p3X6.dbf';

  DeleteFile(DestFile);
  CopyFile(@SourceFile[1],@DestFile[1],True);
  with q_cmn do
  begin
    if Active then Close;
    SQL.Clear;
    SQL.Add('DELETE FROM "'+DestFile+'"');
    ExecSQL;
    if q_plnp.Active then q_plnp.Close;
    if g_PlanTypId=1 then
    Begin
      // Первоначальный план
      q_plnp.SQL[4]:='Sum((D_VES+V_VES-OD_VES-OV_VES)*1000) AS plan,';
      q_plnp.SQL[5]:='Sum((D_SUM+V_SUM-OD_SUM-OV_SUM)) AS splan,';
    end
    else
    Begin
      // Текущий план
      q_plnp.SQL[4]:='Sum((D_VES+V_VES)*1000) AS plan,';
      q_plnp.SQL[5]:='Sum((D_SUM+V_SUM)) AS splan,';
    end;
    decodedate(g_FromDate,Year,Month,Day);
//    q_plnp.SQL[6]:='MAX(IIF((OD_VES+OV_VES)<>0,'''+IntToStr(g_PlanTypId)+''',''1'')) as plan_typ,';
//    q_plnp.SQL[7]:='MAX(IIF((OD_VES+OV_VES)<>0,''{'+mm+'/'+IntToStr(Day)+'/20'+yy+'}'',''{'+mm+'/01/20'+yy+'}'')) as date_plan';
    q_plnp.SQL[6]:=''''+IntToStr(g_PlanTypId)+''' as plan_typ,';
    q_plnp.SQL[7]:='''{'+mm+'/'+IntToStr(Day)+'/20'+yy+'}'' as date_plan';
//    q_plnp.SQL.SaveToFile('c:\tmp\1.sql');
    q_plnp.Open;
    q_plnp.Last;
    CurrGroup:=q_plnp.FieldByName('kod_plan').AsString;
    CurrName:=q_plnp.FieldByName('naim_plan').AsString;
    while not q_plnp.Bof do
    begin
      if (CurrGroup=q_plnp.FieldByName('kod_plan').AsString) then
      begin
        {Одна группа - одна позиция плана поставок}
        ToSkip:=False;
      end;
      if (CurrGroup<>q_plnp.FieldByName('kod_plan').AsString) then
      begin
        {Другая группа - другая позиция плана поставок}
        if System.Copy(q_plnp.FieldByName('kod_plan').AsString,1,q_plnp.FieldByName('kod_pos').AsInteger*3)=
          System.Copy(CurrGroup,1,q_plnp.FieldByName('kod_pos').AsInteger*3) then
          ToSkip:=True
        else
          begin
            ToSkip:=False;
            CurrGroup:=q_plnp.FieldByName('kod_plan').AsString;
            CurrName:=q_plnp.FieldByName('naim_plan').AsString;
          end;
      end;
      if not ToSkip then
      begin
        SQL.Clear;
        SQL.Add('INSERT INTO "'+DestFile+'" (KOD_PLAN,NAIM_PLAN,KOD_10,PLAN,SPLAN,PLAN_TYP,DATE_PLAN) VALUES (');
        SQL.Add(''''+q_plnp.FieldByName('lukoil_id').AsString+''',');
        SQL.Add(''''+Trim(q_plnp.FieldByName('naim_plan').AsString)+''',');
        SQL.Add(''''+q_plnp.FieldByName('kod_10').AsString+''',');
        SQL.Add(IntTostr(Round(q_plnp.FieldByName('plan').AsFloat))+',');
        SQL.Add(IntTostr(Round(q_plnp.FieldByName('splan').AsFloat))+',');
        SQL.Add(''''+q_plnp.FieldByName('plan_typ').AsString+''',');
        SQL.Add(q_plnp.FieldByName('date_plan').AsString+')');
        ExecSQL;
      end;
      q_plnp.Prior;
    end;
    q_plnp.close;
  end;
  q_cmn.Active:=False;
  with tf_plnpdbf.create(self) do
  begin
    Caption:=DestFile;
    t_plnpdbf.TableName:=DestFile;
    t_plnpdbf.open;
    ShowModal;
    Free;
  end;
end;

procedure Tf_f42.q_plnpBeforeOpen(DataSet: TDataSet);
begin
  SetSQLFromPath(TADOQuery(DataSet).SQL);
end;

procedure Tf_f42.q_tr_rashBeforeOpen(DataSet: TDataSet);
begin
  if rg_TypeSelect.ItemIndex=0 then
  begin
    q_tr_rash.SQL[13]:='DTOS(kvit.np_data_o)+kvit.np_timep<"'+
        FormatDateTime('yyyymmdd',e_date.date)+FormatDateTime('hh:mm:ss',e_time.time)+'"'+
        ' AND month.date_plan='+
        FormatDateTime('"{"mm"/"dd"/"yyyy"}"',EncodeDate(Round(e_year.Value),cb_Month.ItemIndex+1,1))+str_kod_otgr;
  End
  Else
  Begin
    if ExtractYear(date2.Date)<2003 then
    begin
      q_tr_rash.SQL[11]:='FROM month,"'+ArchivePath+'kvit.dbf" KVIT,DOG';
    end
    else
    begin
      q_tr_rash.SQL[11]:='FROM month,KVIT,DOG';
    end;
    q_tr_rash.SQL[13]:='kvit.date_kvit BETWEEN '+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',date1.date)+' AND '+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',date2.date)+str_kod_otgr;
  End;
  SetSQLFromPath(TADOQuery(DataSet).SQL);
end;

end.
