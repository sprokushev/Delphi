unit prichin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Db, ADODB, ExtCtrls, ComCtrls, RxLookup, Grids, DBGrids,
  DBGridEh, Mask, variants, math, ToolEdit, CurrEdit, VCLUtils, Buttons, DateUtil;

type
  TFormPrichin = class(TForm)
    Panel1: TPanel;
    q_prod: TADOQuery;
    ds_prod: TDataSource;
    Panel2: TPanel;
    nav_Prod: TDBNavigator;
    DBText1: TDBText;
    ds_struct: TDataSource;
    q_struct: TADOQuery;
    Panel3: TPanel;
    rg_Daval: TRadioGroup;
    Panel4: TPanel;
    q_kls_prich: TADOQuery;
    ds_kls_prich: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    q_structbeg_date: TDateField;
    q_structend_date: TDateField;
    q_structordnung: TIntegerField;
    q_structkod_npr: TStringField;
    q_structnaim_pr: TStringField;
    q_structkod_pos: TIntegerField;
    q_structkod_sgr: TIntegerField;
    q_structkod_spg: TIntegerField;
    q_structkod_rzd: TIntegerField;
    q_structkod_prz: TIntegerField;
    q_structkod_grp: TIntegerField;
    q_structnaim: TStringField;
    q_structkod_sobs: TIntegerField;
    q_structplan: TBCDField;
    q_structizm_plan: TBCDField;
    q_structnorma: TBCDField;
    q_structfact: TBCDField;
    q_structzayv_tonn: TBCDField;
    q_structzayv_dat: TDateField;
    q_structkod_prich: TIntegerField;
    q_structPLUS_MINUS: TFloatField;
    grid_Struct: TDBGridEh;
    lcbox_Prichin: TDBLookupComboBox;
    ed_Plan: TCurrencyEdit;
    ed_IzmPlan: TCurrencyEdit;
    ed_Norma: TCurrencyEdit;
    ed_Fact: TCurrencyEdit;
    ed_PlusMinus: TCurrencyEdit;
    q_cmn: TADOQuery;
    cb_CanChange: TCheckBox;
    ed_Comment: TLabeledEdit;
    ed_KodPrich: TLabeledEdit;
    sb_Info: TStatusBar;
    DBText2: TDBText;
    bt_XLS: TBitBtn;
    bt_DBF: TBitBtn;
    lb_Prichin: TLabel;
    q_structto_mos: TBooleanField;
    q_structcomment: TStringField;
    lb_Comment: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ed_Zayvtonn: TCurrencyEdit;
    ed_Zayvdat: TEdit;
    q_to_mos: TADOQuery;
    q_structkod_struct: TBCDField;
    q_structkod_parent: TBCDField;
    BitBtn1: TBitBtn;
    q_structnaim_plan: TStringField;
    q_structrazn_tonn: TBCDField;
    q_structrazn_dat: TDateField;
    q_structobpr: TBCDField;
    q_structnorma_obpr: TBCDField;
    Label8: TLabel;
    ed_Obpr: TCurrencyEdit;
    Label9: TLabel;
    ed_NormaObpr: TCurrencyEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure q_prodAfterScroll(DataSet: TDataSet);
    procedure rg_DavalClick(Sender: TObject);
    procedure q_structCalcFields(DataSet: TDataSet);
    procedure ed_KodPrichChange(Sender: TObject);
    procedure q_structAfterScroll(DataSet: TDataSet);
    procedure lcbox_PrichinCloseUp(Sender: TObject);
    procedure grid_StructGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure q_structBeforeScroll(DataSet: TDataSet);
    procedure q_prodBeforeScroll(DataSet: TDataSet);
    procedure cb_CanChangeClick(Sender: TObject);
    procedure ed_KodPrichKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_PlanKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_IzmPlanKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_NormaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_FactKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_CommentKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure q_structBeforeClose(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ed_PlanEnter(Sender: TObject);
    procedure ed_IzmPlanEnter(Sender: TObject);
    procedure ed_NormaEnter(Sender: TObject);
    procedure ed_FactEnter(Sender: TObject);
    procedure ed_KodPrichEnter(Sender: TObject);
    procedure ed_CommentEnter(Sender: TObject);
    procedure bt_XLSClick(Sender: TObject);
    procedure ed_CommentChange(Sender: TObject);
    procedure bt_DBFClick(Sender: TObject);
    procedure lcbox_PrichinKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure ed_ObprEnter(Sender: TObject);
    procedure ed_ObprKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_NormaObprEnter(Sender: TObject);
    procedure ed_NormaObprKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    FilterExpr1:string;
    FilterExpr2:string;
    BeginWork:boolean; //флаг разрешения изменения данных в базе
    NeedRefresh:boolean;
  public
    { Public declarations }
    procedure CheckKeyDown(VAR Key: Word; ed_Control:TControl; Shift: TShiftState);
  end;

var
  FormPrichin: TFormPrichin;

implementation

uses ForDB, f42_prch, ForFiles, main;

{$R *.DFM}

procedure TFormPrichin.FormActivate(Sender: TObject);
begin
  BeginWork:=false;
  NeedRefresh:=false;
  FilterExpr1:='ordnung=1';
  FilterExpr2:='(kod_sgr<>101 and kod_sgr<>102 and kod_sgr<>103)';
{  FilterExpr2:='kod_sgr<>101 ';}
  q_prod.Connection:=f_f42_prich.PF_Conn;
  Q_STRUCT.Connection:=f_f42_prich.PF_Conn;
  q_kls_prich.Connection:=f_f42_prich.PF_Conn;
  q_kls_prich.Open;
  rg_Daval.ItemIndex:=-1;
  rg_Daval.ItemIndex:=0;
  q_prod.Open;
end;

procedure TFormPrichin.q_prodAfterScroll(DataSet: TDataSet);
begin
  FilterExpr1:='ordnung='+q_prod.FieldByName('ordnung').AsString+' AND kod_npr='''+q_prod.FieldByName('kod_npr').AsString+'''';
  BeginWork:=false;
  Q_STRUCT.Close;
  Q_STRUCT.SQL[1]:='WHERE '+FilterExpr1;
  Q_STRUCT.SQL[2]:='  AND '+FilterExpr2;
  Q_STRUCT.Open;
{  vgdbtreeview1.fullexpand;}
end;

procedure TFormPrichin.rg_DavalClick(Sender: TObject);
var IsActive:boolean;
var KodNpr:string;
begin
  q_structBeforeScroll(q_struct);
  BeginWork:=false;
  IsActive:=Q_STRUCT.Active;
  If q_prod.Active Then KodNpr:=q_prod.FieldByName('kod_npr').AsString
  Else KodNpr:='';
  q_prod.Close;
  If rg_Daval.ItemIndex=0 Then
  Begin
    q_prod.SQL[5]:='WHERE (A.kod_sgr<>101 and A.kod_sgr<>102 and A.kod_sgr<>103) AND A.kod_npr=B.kod '
  End
  Else
  Begin
    q_prod.SQL[5]:='WHERE (A.kod_sgr=101 OR A.kod_sgr=102 OR A.kod_sgr=103) AND A.kod_npr=B.kod '
  End;
  Q_STRUCT.Close;
  If rg_Daval.ItemIndex=0 Then
  Begin
    FilterExpr2:='(kod_sgr<>101 and kod_sgr<>102 and kod_sgr<>103) '
{    FilterExpr2:='kod_sgr<>101 '}
  End
  Else
  Begin
    FilterExpr2:='(kod_sgr=101 OR kod_sgr=102 OR kod_sgr=103) '
{    FilterExpr2:='kod_sgr=101 '}
  End;
  q_prod.Active:=true;
  If q_prod.Active AND (KodNpr<>'') Then q_prod.Locate('kod_npr',KodNpr,[]);
{  If IsActive then vgdbtreeview1.fullexpand;}
end;

procedure TFormPrichin.q_structCalcFields(DataSet: TDataSet);
begin
  Q_STRUCTplus_minus.AsFloat:=RoundTo(Q_STRUCTfact.AsFloat,0)-RoundTo(Q_STRUCTnorma.AsFloat,0);
end;

procedure TFormPrichin.ed_KodPrichChange(Sender: TObject);
var i:integer;
begin
  try
    i:=StrToInt(ed_KodPrich.Text);
  except
    i:=0;
  end;
  lcbox_Prichin.KeyValue:=i;
  lb_Prichin.Caption:=lcbox_Prichin.Text;
end;

procedure TFormPrichin.q_structAfterScroll(DataSet: TDataSet);
var
  KodNpr:string;
  KodSobs:integer;
  KodStruct:double;
begin
  if q_struct.Active then
  Begin
    If NeedRefresh Then
    Begin
      NeedRefresh:=false;
      KodNpr:=q_structkod_npr.AsString;
      KodSobs:=q_structkod_sobs.AsInteger;
      KodStruct:=q_structkod_struct.AsFloat;
      q_struct.Close;
      q_struct.Open;
      q_struct.locate('kod_npr;kod_sobs;kod_struct',VarArrayOf([KodNpr,KodSobs,KodStruct]),[]);
    End
    Else
    Begin
      BeginWork:=true;
      ed_KodPrich.Text:=q_structkod_prich.AsString;
      ed_Plan.Text:=q_structplan.AsString;
      ed_Obpr.Text:=q_structobpr.AsString;
      ed_IzmPlan.Text:=q_structizm_plan.AsString;
      ed_Norma.Text:=q_structnorma.AsString;
      ed_NormaObpr.Text:=q_structnorma_obpr.AsString;
      ed_Fact.Text:=q_structfact.AsString;
      ed_PlusMinus.Text:=q_structplus_minus.AsString;
      ed_Zayvtonn.Text:=q_structzayv_tonn.AsString;
      ed_Zayvdat.Text:=q_structzayv_dat.AsString;
      ed_Comment.Text:=Trim(q_structcomment.AsString);
      ed_KodPrich.SetFocus;
      ed_KodPrich.SelectAll;
    End;
  end;
end;

procedure TFormPrichin.lcbox_PrichinCloseUp(Sender: TObject);
begin
  ed_KodPrich.Text:=IntToStr(lcbox_Prichin.KeyValue);
end;

procedure TFormPrichin.grid_StructGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  If not (gdSelected in State) then
  Begin
    If Q_STRUCTplus_minus.AsFloat<0 then AFont.Color:=clRed;
    If Q_STRUCTkod_prich.AsInteger<>0 then Background:=clYellow;
  end;
end;

procedure TFormPrichin.q_structBeforeScroll(DataSet: TDataSet);
var sSQL:string;
    sAND:string;
begin
  if BeginWork Then
  Begin
    If ed_KodPrich.Text='' Then ed_KodPrich.Text:='0'; 
    If lcbox_Prichin.Text='' Then
    Begin
      MsgBox('Внимание','Причины с кодом '+ed_KodPrich.Text+' в справочнике причин не найдено',MB_OK)
    End;
    sSQL:='';
    sAND:='';
    If (ed_KodPrich.Text<>q_structkod_prich.AsString) Then
    Begin
      sSQL:=sSQL+sAND+'kod_prich='+ed_KodPrich.Text;
      sAND:=', ';
    End;
    if (ed_Plan.Value<>Round(q_structplan.AsFloat)) Then
    Begin
      sSQL:=sSQL+sAND+'plan='+FloatToStr(ed_Plan.Value);
      sAND:=', ';
    End;
    if (ed_Obpr.Value<>Round(q_structobpr.AsFloat)) Then
    Begin
      sSQL:=sSQL+sAND+'obpr='+FloatToStr(ed_Obpr.Value);
      sAND:=', ';
    End;
    if (ed_IzmPlan.Value<>Round(q_structizm_plan.AsFloat)) Then
    Begin
      sSQL:=sSQL+sAND+'izm_plan='+FloatToStr(ed_IzmPlan.Value);
      sAND:=', ';
    End;
    if (ed_Norma.Value<>Round(q_structnorma.AsFloat)) Then
    Begin
      sSQL:=sSQL+sAND+'Norma='+FloatToStr(ed_Norma.Value);
      sAND:=', ';
    End;
    if (ed_NormaObpr.Value<>Round(q_structnorma_obpr.AsFloat)) Then
    Begin
      sSQL:=sSQL+sAND+'Norma_obpr='+FloatToStr(ed_NormaObpr.Value);
      sAND:=', ';
    End;
    if (ed_Fact.Value<>Round(q_structfact.AsFloat)) Then
    Begin
      sSQL:=sSQL+sAND+'Fact='+FloatToStr(ed_Fact.Value);
      sAND:=', ';
    End;
    if (ed_Comment.Text<>Trim(q_structcomment.AsString)) Then
    Begin
      sSQL:=sSQL+sAND+'Comment='''+Trim(ed_Comment.Text)+'''';
      sAND:=', ';
    End;
    if sSQL<>'' Then
    Begin
      sSQL:='UPDATE "'+f_main.TempLocalPath+'prichin.dbf" SET '+sSQL+
        ' WHERE kod_npr='''+q_structkod_npr.AsString+''''+
        '   AND naim_pr ='''+q_structnaim_pr.AsString+''''+
        '   AND kod_sobs ='+q_structkod_sobs.AsString+
        '   AND kod_struct ='+FloatToStr(q_struct.FieldByName('kod_struct').AsFloat);
      q_cmn.Close;
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add(sSQL);
      q_cmn.ExecSQL;
      NeedRefresh:=True;
      BeginWork:=false;
    End;
  end;
end;

procedure TFormPrichin.q_prodBeforeScroll(DataSet: TDataSet);
begin
  q_structBeforeScroll(q_struct);
end;

procedure TFormPrichin.cb_CanChangeClick(Sender: TObject);
begin
  ed_Plan.ReadOnly:=NOT cb_CanChange.Checked;
  ed_Obpr.ReadOnly:=NOT cb_CanChange.Checked;
  ed_IzmPlan.ReadOnly:=NOT cb_CanChange.Checked;
  ed_Norma.ReadOnly:=NOT cb_CanChange.Checked;
  ed_NormaObpr.ReadOnly:=NOT cb_CanChange.Checked;
  ed_Fact.ReadOnly:=NOT cb_CanChange.Checked;
  If cb_CanChange.Checked Then ed_Plan.SetFocus else ed_KodPrich.SetFocus;
end;

procedure TFormPrichin.CheckKeyDown(VAR Key: Word; ed_Control:TControl; Shift: TShiftState);
Begin
  IF Key=VK_RETURN Then
  Begin
    IF ed_Control.Name='ed_KodPrich' Then ed_Comment.SetFocus;
    IF ed_Control.Name='ed_Comment' Then
      If cb_CanChange.Checked Then ed_Plan.SetFocus Else Key:=VK_NEXT;
    IF ed_Control.Name='ed_Plan' Then
      If cb_CanChange.Checked Then ed_Obpr.SetFocus Else ed_KodPrich.SetFocus;
    IF ed_Control.Name='ed_Obpr' Then
      If cb_CanChange.Checked Then ed_IzmPlan.SetFocus Else ed_KodPrich.SetFocus;
    IF ed_Control.Name='ed_IzmPlan' Then
      If cb_CanChange.Checked Then ed_Norma.SetFocus Else ed_KodPrich.SetFocus;
    IF ed_Control.Name='ed_Norma' Then
      If cb_CanChange.Checked Then ed_NormaObpr.SetFocus Else ed_KodPrich.SetFocus;
    IF ed_Control.Name='ed_NormaObpr' Then
      If cb_CanChange.Checked Then ed_Fact.SetFocus Else ed_KodPrich.SetFocus;
    IF ed_Control.Name='ed_Fact' Then Key:=VK_NEXT;
  end;
  IF Key=VK_UP Then
  Begin
    Key:=VK_PRIOR;
  end;
  IF Key=VK_DOWN Then
  Begin
    Key:=VK_NEXT;
  end;
  IF Key=VK_PRIOR Then
  Begin
    If (ssCtrl IN Shift) Then
    Begin
      q_prod.Prior;
    End
    Else
    Begin
      q_struct.Prior;
    End;
  end;
  IF Key=VK_NEXT Then
  Begin
    If (ssCtrl IN Shift) Then
    Begin
      q_prod.Next;
    End
    Else
    Begin
      q_struct.Next;
    End;
  end;
End;

procedure TFormPrichin.ed_KodPrichKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CheckKeyDown(Key,TControl(Sender),Shift);
end;

procedure TFormPrichin.ed_PlanKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CheckKeyDown(Key,TControl(Sender),Shift);
end;

procedure TFormPrichin.ed_IzmPlanKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CheckKeyDown(Key,TControl(Sender),Shift);
end;

procedure TFormPrichin.ed_NormaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CheckKeyDown(Key,TControl(Sender),Shift);
end;

procedure TFormPrichin.ed_FactKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CheckKeyDown(Key,TControl(Sender),Shift);
end;

procedure TFormPrichin.ed_CommentKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CheckKeyDown(Key,TControl(Sender),Shift);
end;

procedure TFormPrichin.q_structBeforeClose(DataSet: TDataSet);
begin
  q_structBeforeScroll(q_struct);
end;

procedure TFormPrichin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  q_struct.Close;
end;

procedure TFormPrichin.ed_PlanEnter(Sender: TObject);
begin
  TEdit(Sender).SelectAll;
end;

procedure TFormPrichin.ed_IzmPlanEnter(Sender: TObject);
begin
  TEdit(Sender).SelectAll;
end;

procedure TFormPrichin.ed_NormaEnter(Sender: TObject);
begin
  TEdit(Sender).SelectAll;
end;

procedure TFormPrichin.ed_FactEnter(Sender: TObject);
begin
  TEdit(Sender).SelectAll;
end;

procedure TFormPrichin.ed_KodPrichEnter(Sender: TObject);
begin
  TEdit(Sender).SelectAll;
end;

procedure TFormPrichin.ed_CommentEnter(Sender: TObject);
begin
  ed_Comment.SelectAll;
end;

procedure TFormPrichin.bt_XLSClick(Sender: TObject);
begin
  q_structBeforeScroll(q_struct);
  F_FileUtils.CheckReport('f42_prch.xls',f_main.TempNetPath+'f42prch1.xls');
  F_FileUtils.ExecAndWait(f_main.TempNetPath+'f42prch1.xls','',SW_SHOWMAXIMIZED,false)
end;

procedure TFormPrichin.ed_CommentChange(Sender: TObject);
begin
  lb_Comment.Caption:=ed_Comment.Text;
end;

procedure TFormPrichin.bt_DBFClick(Sender: TObject);
VAR
  f1,f2:String[255];
  s:string;
  DD,MM:string[2];
  YYYY:string[4];
begin
  q_structBeforeScroll(q_struct);
  DD:=PADL(IntToStr(ExtractDay(f_f42_prich.date_proizv_to.Date)),2);
  MM:=PADL(IntToStr(ExtractMonth(f_f42_prich.date_proizv_to.Date)),2);
  YYYY:=PADL(IntToStr(ExtractYear(f_f42_prich.date_proizv_to.Date)),4);
  If Application.MessageBox(PChar('Отправить сообщение "Причины отклонения от плана поставок" на '+DateToStr(f_f42_prich.date_proizv_to.Date)+' по адресу OI@LUKOIL.COM?'),'ВНИМАНИЕ!',MB_YESNO)=ID_YES Then
  try
    // Подготовка файлов для отправки
    f1:=f_main.MasterDBFPath+'prch_MOS.DBF'+#0;
    f2:=f_main.TempLocalPath+'prch_MOS.DBF'+#0;
    COPYFILE(@f1[1],@f2[1],False);
    q_cmn.SQL.Clear;
    q_cmn.SQL.Add('DELETE FROM "'+f_main.TempLocalPath+'prch_MOS.DBF"');
    q_cmn.ExecSQL;

    q_to_mos.Open;
    while not q_to_mos.EOF do
    with q_to_mos do
    begin
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'prch_mos.DBF" (kod_plan,naim_plan,kod_npr,kod_prich,comment,razn_tonn,zayv_tonn) VALUES (');
      s:=''''+FieldByName('lukoil_id').AsString+''','+
         ''''+FieldByName('naim_plan').AsString+''','+
         ''''+FieldByName('kod_npr').AsString+''','+
         ''''+FieldByName('kod_prich').AsString+''','+
         ''''+FieldByName('comment').AsString+''','+
         FloatToStr(FieldByName('razn_tonn').AsFloat)+','+
         FloatToStr(FieldByName('zayv_tonn').AsFloat)+')';
      q_cmn.SQL.Add(s);
      q_cmn.ExecSQL;
      q_to_mos.Next;
    end;
    q_to_mos.Close;
    f1:=f_main.TempLocalPath+'prch_MOS.DBF'+#0;
    If YYYY+MM < '200501' then
      f2:=f_main.EMailPath+'OI@LUKOIL.COM\'+DD+MM+'ppX6.DBF'+#0
    else
      f2:=f_main.EMailPath+'OI@LUKOIL.COM\'+DD+MM+'pp34.DBF'+#0;
    COPYFILE(@f1[1],@f2[1],False);
    Application.MessageBox('Файл с причинами был сформирован и отправлен!','УРА-А-А',MB_OK);
  except
    Application.MessageBox('ОШИБКА! Файл не был сформирован и отправлен!','ОШИБКА!',MB_OK);
  end;

end;

procedure TFormPrichin.lcbox_PrichinKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ed_KodPrich.Text:=IntToStr(lcbox_Prichin.KeyValue);
end;

procedure TFormPrichin.BitBtn1Click(Sender: TObject);
begin
  q_structBeforeScroll(q_struct);
  F_FileUtils.CheckReport('f42_prch.xls',f_main.TempNetPath+'f42prch3.xls');
  F_FileUtils.ExecAndWait(f_main.TempNetPath+'f42prch3.xls','',SW_SHOWMAXIMIZED,false)
end;

procedure TFormPrichin.ed_ObprEnter(Sender: TObject);
begin
  TEdit(Sender).SelectAll;
end;

procedure TFormPrichin.ed_ObprKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CheckKeyDown(Key,TControl(Sender),Shift);
end;

procedure TFormPrichin.ed_NormaObprEnter(Sender: TObject);
begin
  TEdit(Sender).SelectAll;
end;

procedure TFormPrichin.ed_NormaObprKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CheckKeyDown(Key,TControl(Sender),Shift);
end;

procedure TFormPrichin.BitBtn2Click(Sender: TObject);
begin
  q_structBeforeScroll(q_struct);
  F_FileUtils.CheckReport('f42_prch.xls',f_main.TempNetPath+'f42prch2.xls');
  F_FileUtils.ExecAndWait(f_main.TempNetPath+'f42prch2.xls','',SW_SHOWMAXIMIZED,false)
end;

procedure TFormPrichin.BitBtn3Click(Sender: TObject);
begin
  q_structBeforeScroll(q_struct);
  F_FileUtils.CheckReport('f42prch4.xls',f_main.TempNetPath+'f42prch4.xls');
  F_FileUtils.ExecAndWait(f_main.TempNetPath+'f42prch4.xls','',SW_SHOWMAXIMIZED,false)
end;

end.
