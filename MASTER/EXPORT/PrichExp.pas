unit PrichExp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ExtCtrls, Grids, DBGridEh, ADODB, DBGrids, StdCtrls, Buttons, DateUtils;

type
  Tf_PrichExp = class(TForm)
    t_pe_edit: TADOTable;
    ds_pe_edit: TDataSource;
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    Panel2: TPanel;
    t_pe_editplat_kod: TStringField;
    t_pe_editplat_name: TStringField;
    t_pe_editprod_kod: TStringField;
    t_pe_editprod_kod10: TStringField;
    t_pe_editkind_npr: TStringField;
    t_pe_editprod_fas: TStringField;
    t_pe_editprod_name: TStringField;
    t_pe_editstan_kod: TStringField;
    t_pe_editstan_name: TStringField;
    t_pe_editexped_kod: TStringField;
    t_pe_editexped_name: TStringField;
    t_pe_editvid_trans: TStringField;
    t_pe_editvid_tr_nam: TStringField;
    t_pe_editfact_year: TBCDField;
    t_pe_editplan_post: TBCDField;
    t_pe_editplan_gd: TBCDField;
    t_pe_editfact_mon: TBCDField;
    t_pe_editfact_sut: TBCDField;
    t_pe_editprich: TStringField;
    t_pe_editnum_dog: TStringField;
    t_pe_editsortby: TBCDField;
    t_pe_editnorma_mon: TBCDField;
    t_pe_editis_bad: TIntegerField;
    t_pe_editid: TBCDField;
    BitBtn1: TBitBtn;
    t_pe_editSortByInfo: TStringField;
    q_cmn: TADOQuery;
    t_pe_editzapr_mps: TStringField;
    BitBtn2: TBitBtn;
    t_pe_editplan_izm: TBCDField;
    t_pe_editobpr: TBCDField;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure t_pe_editprichGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure t_pe_editCalcFields(DataSet: TDataSet);
    procedure t_pe_editzapr_mpsGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_PrichExp: Tf_PrichExp;

implementation

uses SoobExp, ForDB, ForFiles, plnp, main;

{$R *.dfm}

procedure Tf_PrichExp.FormActivate(Sender: TObject);
begin
  t_pe_edit.Open;
end;

procedure Tf_PrichExp.BitBtn1Click(Sender: TObject);
var DestFile2:string;
begin
  with t_pe_edit do
  try
    if State<>dsBrowse then Post;
    DisableControls;

    // Подготовка файла
    F_FileUtils.SafeCopyFile(f_main.MasterDBFPath+'pe.DBF',f_main.TempLocalPath+'pe.DBF');
    try
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('DELETE FROM "'+f_main.TempLocalPath+'pe.DBF"');
      q_cmn.ExecSQL;
    except
    end;

    Filtered:=false;
    First;
    while not EOF do
    begin
      f_SoobExp.q_cmn.SQL.Clear;
      f_SoobExp.q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'pe.DBF" (plat_kod,plat_name,prod_kod,'+
                        'prod_fas,stan_kod,stan_name,exped_kod,exped_name,vid_trans,'+
                        'fact_year,plan_post,plan_gd,fact_mon,fact_sut,prich,num_dog,zapr_mps) VALUES (');
      f_SoobExp.q_cmn.SQL.Add(''''+FieldByName('PLAT_KOD').AsString+''','+
                    ''''+FieldByName('PLAT_NAME').AsString+''','+
                    ''''+FieldByName('PROD_KOD10').AsString+''','+
                    ''''+FieldByName('PROD_FAS').AsString+''','+
                    ''''+FieldByName('STAN_KOD').AsString+''','+
                    ''''+FieldByName('STAN_NAME').AsString+''','+
                    ''''+FieldByName('EXPED_KOD').AsString+''','+
                    ''''+FieldByName('EXPED_NAME').AsString+''','+
                    ''''+Trim(FieldByName('VID_TRANS').AsString)+''','+
                    FieldByName('FACT_YEAR').AsString+','+
                    FieldByName('PLAN_POST').AsString+','+
                    FieldByName('PLAN_GD').AsString+','+
                    FieldByName('FACT_MON').AsString+','+
                    FieldByName('FACT_SUT').AsString+','+
                    ''''+FieldByName('PRICH').AsString+''','+
                    ''''+FieldByName('NUM_DOG').AsString+''','+
                    ''''+FieldByName('ZAPR_MPS').AsString+''')');
      f_SoobExp.q_cmn.ExecSQL;
      Next;
    end;
  finally
    Filtered:=true;
    First;
    EnableControls;
  end;
  if YearOf(f_SoobExp.ed_Date.Date)<2005 then
  Begin
    DestFile2:=FormatDateTime('ddmm',f_SoobExp.ed_Date.Date)+'peX6.dbf';
    DestFile2:=InputBox('','Название файла ДДММpeX6.dbf: ',DestFile2);
  End
  else
  Begin
    DestFile2:=FormatDateTime('ddmm',f_SoobExp.ed_Date.Date)+'pe34.dbf';
    DestFile2:=InputBox('','Название файла ДДММpe34.dbf: ',DestFile2);
  end;
  DestFile2:=f_main.EMailPath+'OI@lukoil.com\'+DestFile2;
  if not F_FileUtils.SafeCopyFile(f_main.TempLocalPath+'pe.DBF',DestFile2) then
    ShowMessage('Не отправилось почему-то :(')
  else
    ShowMessage('Отправилось.');
end;

procedure Tf_PrichExp.t_pe_editprichGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text:=Trim(Sender.AsString);
end;

procedure Tf_PrichExp.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if (t_pe_edit.FieldByName('sortby').AsInteger=1) then
    Background:=clInfoBk;
  if (t_pe_edit.FieldByName('sortby').AsInteger=2) then
    Background:=clMoneyGreen;
  if gdSelected in State then
    Background:=clNavy;
  if AnsiUpperCase(Column.FieldName) = 'PLAN_POST' then AFont.Style := [fsBold];
  if AnsiUpperCase(Column.FieldName) = 'FACT_MON' then AFont.Style := [fsBold];
end;

procedure Tf_PrichExp.t_pe_editCalcFields(DataSet: TDataSet);
begin
  if t_pe_editSortby.AsInteger=1 then
    t_pe_editSortByInfo.AsString:='Ж/Д план';
  if t_pe_editSortby.AsInteger=2 then
    t_pe_editSortByInfo.AsString:='Нерасп.план';
  if t_pe_editSortby.AsInteger=3 then
    t_pe_editSortByInfo.AsString:='Факт';
end;

procedure Tf_PrichExp.t_pe_editzapr_mpsGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text:=Trim(Sender.AsString);
end;

procedure Tf_PrichExp.BitBtn2Click(Sender: TObject);
var DestFile2:string;
  g_PlanTypId:integer;
  g_FromDate:TDateTime;
begin

  g_PlanTypId:=-1;

  with Tf_plnp.Create(Self) do
  Begin
    DatePlan:=StartOfTheMonth(f_SoobExp.ed_Date.Date);
    EndDate:=f_SoobExp.ed_Date.Date;
    ShowModal;
    If ModalResult=mrOk then
    Begin
      g_PlanTypId:=PlanTypId;
      g_FromDate:=FromDate
    End;
    Free;
  End;

  If g_PlanTypId=-1 then exit;


  with t_pe_edit do
  try
    if State<>dsBrowse then Post;
    DisableControls;

    // Подготовка файла
    F_FileUtils.SafeCopyFile(f_main.MasterDBFPath+'plexp.DBF',f_main.TempLocalPath+'plexp.DBF');
    try
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('DELETE FROM "'+f_main.TempLocalPath+'plexp.DBF"');
      q_cmn.ExecSQL;
    except
    end;

    Filtered:=false;
    First;
    while not EOF do
    begin
//      if (FieldByName('PLAN_POST').AsFloat<>0) then
      Begin
        f_SoobExp.q_cmn.SQL.Clear;
        f_SoobExp.q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'plexp.DBF" (plat_kod,plat_name,num_dog,prod_kod,'+
                          'prod_fas,stan_kod,stan_name,exped_kod,exped_name,vid_trans,'+
                          'plan,plan_typ,date_plan) VALUES (');
        f_SoobExp.q_cmn.SQL.Add(''''+FieldByName('PLAT_KOD').AsString+''','+
                      ''''+FieldByName('PLAT_NAME').AsString+''','+
                      ''''+FieldByName('NUM_DOG').AsString+''','+
                      ''''+FieldByName('PROD_KOD10').AsString+''','+
                      ''''+FieldByName('PROD_FAS').AsString+''','+
                      ''''+FieldByName('STAN_KOD').AsString+''','+
                      ''''+FieldByName('STAN_NAME').AsString+''','+
                      ''''+FieldByName('EXPED_KOD').AsString+''','+
                      ''''+FieldByName('EXPED_NAME').AsString+''','+
                      ''''+Trim(FieldByName('VID_TRANS').AsString)+''','+
                      FloatToStr(FieldByName('PLAN_POST').AsFloat)+','+
                      ''''+IntToStr(g_PlanTypId)+''','+
                      FormatDateTime('"{"mm"/"dd"/"yyyy"}"',g_FromDate)+')');
        f_SoobExp.q_cmn.ExecSQL;
      end;
      Next;
    end;
  finally
    Filtered:=true;
    First;
    EnableControls;
  end;
  if YearOf(f_SoobExp.ed_Date.Date)<2005 then
  Begin
    DestFile2:=FormatDateTime('mmyy',f_SoobExp.ed_Date.Date)+'p4X6.dbf';
    DestFile2:=InputBox('','Название файла ММГГp4X6.dbf: ',DestFile2);
  End
  else
  Begin
    DestFile2:=FormatDateTime('mmyy',f_SoobExp.ed_Date.Date)+'p434.dbf';
    DestFile2:=InputBox('','Название файла ММГГp434.dbf: ',DestFile2);
  end;

  DestFile2:=f_main.EMailPath+'OI@lukoil.com\'+DestFile2;
  if not F_FileUtils.SafeCopyFile(f_main.TempLocalPath+'plexp.DBF',DestFile2) then
    ShowMessage('Не отправилось почему-то :(')
  else
    ShowMessage('Отправилось.');
end;

end.
