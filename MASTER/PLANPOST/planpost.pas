unit planpost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, ComCtrls, StdCtrls,
  Grids, DBGridEh, TB2Dock, ExtCtrls, TB2Item, TB2Toolbar, ActnList, mdiform,
  ActnMan, RxLookup,DateUtil, OracleNavigator, Buttons, dbcgrids, DBCtrls,
  Mask, XPStyleActnCtrls, RXCtrls,DateUtils, PrnDbgeh, Menus, EhLibDOA,
  PropFilerEh, PropStorageEh, TB2ExtItems;

type
  Tf_PlanPost = class(Tf_MDIForm)
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    q_PlanStru: TOracleDataSet;
    ds_PlanStru: TDataSource;
    Panel1: TPanel;
    q_Prod: TOracleDataSet;
    ds_Prod: TDataSource;
    lc_Prod: TRxDBLookupCombo;
    Label2: TLabel;
    q_Plan: TOracleDataSet;
    ds_Plan: TDataSource;
    q_Tmp: TOracleDataSet;
    q_PlanPeriods: TOracleDataSet;
    ds_PlanPeriods: TDataSource;
    lc_PlanPeriods: TRxDBLookupCombo;
    q_PayForms: TOracleDataSet;
    ds_PayForms: TDataSource;
    ActionManager: TActionManager;
    acPlanLeft: TAction;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    acPlanRight: TAction;
    acPlanPeriodsLeft: TAction;
    acPlanPeriodsRight: TAction;
    acProdLeft: TAction;
    acProdRight: TAction;
    ds_PlanPost: TDataSource;
    q_ProdID_NPR: TStringField;
    q_ProdNAME_NPR: TStringField;
    acAddPlanPeriods: TAction;
    TBItem2: TTBItem;
    acEditPlanPeriods: TAction;
    acDelPlanPeriods: TAction;
    acAddPlanPost: TAction;
    acDelPlanPost: TAction;
    TBItem1: TTBItem;
    TBItem3: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    acEditPlanPost: TAction;
    PageControl1: TPageControl;
    tabInput1: TTabSheet;
    q_PlanPost: TOracleDataSet;
    q_PlanPostPLAN_ID: TIntegerField;
    q_PlanPostPLAN_PER_ID: TFloatField;
    q_PlanPostPROD_ID_NPR: TStringField;
    q_PlanPostNAME_NPR: TStringField;
    q_PlanPostPLANSTRU_ID: TFloatField;
    q_PlanPostPLANSTRU_NAME: TStringField;
    q_PlanPostDOG_ID: TIntegerField;
    q_PlanPostDOG_NUMBER: TStringField;
    q_PlanPostPLAT_ID: TIntegerField;
    q_PlanPostPLAT_NAME: TStringField;
    q_PlanPostPLAN_CENA: TFloatField;
    q_PlanPostPLAN_VES: TFloatField;
    q_PlanPostPLAN_SUM: TFloatField;
    Panel4: TPanel;
    Panel5: TPanel;
    grid_PlanPost: TDBGridEh;
    Panel6: TPanel;
    q_PlanPostDATE_CENA: TDateTimeField;
    Label12: TLabel;
    DBText3: TDBText;
    Label13: TLabel;
    DBText4: TDBText;
    q_BrotherPlan: TOracleDataSet;
    ds_BrotherPlan: TDataSource;
    DBText5: TDBText;
    Label15: TLabel;
    DBText6: TDBText;
    q_BrotherPlanPLAN_NAME: TStringField;
    q_BrotherPlanPLAN_PER_ID: TFloatField;
    q_BrotherPlanPLAN_VES: TFloatField;
    q_Resurs: TOracleDataSet;
    q_ResursRESURS_VES: TFloatField;
    DBText7: TDBText;
    ds_Resurs: TDataSource;
    q_PlanPeriodsID: TFloatField;
    q_PlanPeriodsPLAN_ID: TIntegerField;
    q_PlanPeriodsDATE_PLAN: TDateTimeField;
    q_PlanPeriodsNUM_IZM_POST: TIntegerField;
    q_PlanPeriodsNUM_IZM_RESU: TIntegerField;
    q_PlanPeriodsBEGIN_DATE: TDateTimeField;
    q_PlanPeriodsEND_DATE: TDateTimeField;
    q_PlanPeriodsNUM_IZM_STR: TStringField;
    q_PayFormsPAYFORM_NAME: TStringField;
    q_PayFormsPLAN_VES: TFloatField;
    q_PayFormsPLAN_SUM: TFloatField;
    q_PayFormsPAYFORM_ID: TFloatField;
    grid_PayForms: TDBGridEh;
    q_PlanStruLEVEL_POS: TIntegerField;
    q_PlanStruNAME: TStringField;
    q_PlanStruPLAN_VES: TFloatField;
    q_PlanStruPLAN_SUM: TFloatField;
    grid_PlanStru: TDBGridEh;
    cb_Prod: TCheckBox;
    q_Month: TOracleDataSet;
    acRefresh_PP_View1: TAction;
    RxSpeedButton1: TRxSpeedButton;
    ds_Month: TDataSource;
    q_MonthTONN_DECLARED: TFloatField;
    RxSpeedButton2: TRxSpeedButton;
    RxSpeedButton3: TRxSpeedButton;
    RxSpeedButton4: TRxSpeedButton;
    RxSpeedButton5: TRxSpeedButton;
    q_Fact: TOracleDataSet;
    q_FactVES: TFloatField;
    acAddPlanIzm: TAction;
    TBItem4: TTBItem;
    q_PlanID: TIntegerField;
    q_PlanPLAN_NAME: TStringField;
    q_PlanPLAN_KIND_ID: TFloatField;
    q_PlanBROTHER_ID: TIntegerField;
    q_PlanPLAN_OWNER_ID: TIntegerField;
    q_PlanSHORT_NAME: TStringField;
    q_PlanPeriodsRUS_MONTH: TStringField;
    ora_Package: TOraclePackage;
    Label3: TLabel;
    Label4: TLabel;
    q_PlanPostMONTH_VES: TFloatField;
    q_PlanPostFACT_VES: TFloatField;
    q_FactPROD_ID_NPR: TStringField;
    q_FactPLANSTRU_ID: TFloatField;
    q_FactDOG_ID: TIntegerField;
    RxSpeedButton6: TRxSpeedButton;
    q_MonthPROD_ID_NPR: TStringField;
    q_MonthPLANSTRU_ID: TFloatField;
    q_MonthDOG_ID: TIntegerField;
    lc_Plat: TRxDBLookupCombo;
    q_Plat: TOracleDataSet;
    ds_Plat: TDataSource;
    q_PlatID: TIntegerField;
    q_PlatSHORT_NAME: TStringField;
    cb_Plat: TCheckBox;
    PrintDBGridEh1: TPrintDBGridEh;
    acPlanPostPrint: TAction;
    acPlanPostExportXLS: TAction;
    SaveDialog1: TSaveDialog;
    q_PlanPos: TOracleDataSet;
    ds_PlanPos: TDataSource;
    cb_PlanPos: TCheckBox;
    lc_PlanPos: TRxDBLookupCombo;
    q_PlanPosID: TFloatField;
    q_PlanPosNAME: TStringField;
    edWithOBR: TDBText;
    q_WithOBR: TOracleDataSet;
    FloatField2: TFloatField;
    ds_WithObr: TDataSource;
    q_PlanGLOBAL_PLAN_ID: TFloatField;
    q_PlanSHORT_GLOBAL: TStringField;
    DBText1: TDBText;
    q_PlanONLY_SNP: TIntegerField;
    q_PlanPostPLANSTRU_ORDER: TStringField;
    q_PlanPostLEVEL_POS: TIntegerField;
    q_PlanPostREFINERY_ID: TIntegerField;
    q_PlanPostREFINERY_NAME: TStringField;
    q_PlanONLY_UNP: TIntegerField;
    q_PlanPostORGSTRU_ID: TFloatField;
    q_PlanPostORGSTRU_NAME: TStringField;
    PropStorageEh1: TPropStorageEh;
    TBPopupMenu2: TTBPopupMenu;
    TBItem15: TTBItem;
    TBEditItem1: TTBEditItem;
    TBItem17: TTBItem;
    TBItem18: TTBItem;
    TBSeparatorItem7: TTBSeparatorItem;
    TBItem21: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem16: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBItem14: TTBItem;
    TBItem7: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    TBItem10: TTBItem;
    q_PlanPostID: TFloatField;
    q_PlanPostPAYFORM_ID: TIntegerField;
    q_PlanPostPAYFORM_NAME: TStringField;
    q_PlanPostCAT_CEN_ID: TIntegerField;
    acCopyPlanPost: TAction;
    TBItem11: TTBItem;
    RxSpeedButton7: TRxSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lc_PlanPeriodsChange(Sender: TObject);
    procedure lc_ProdChange(Sender: TObject);
    procedure acPlanPeriodsLeftExecute(Sender: TObject);
    procedure acPlanPeriodsRightExecute(Sender: TObject);
    procedure acProdLeftExecute(Sender: TObject);
    procedure acProdRightExecute(Sender: TObject);
    procedure acAddPlanPeriodsExecute(Sender: TObject);
    procedure acDelPlanPeriodsExecute(Sender: TObject);
    procedure acAddPlanPostExecute(Sender: TObject);
    procedure acEditPlanPeriodsExecute(Sender: TObject);
    procedure cb_ProdClick(Sender: TObject);
    procedure q_PlanPostAfterScroll(DataSet: TDataSet);
    procedure acRefresh_PP_View1Execute(Sender: TObject);
    procedure acAddPlanIzmExecute(Sender: TObject);
    procedure acDelPlanPostExecute(Sender: TObject);
    procedure acEditPlanPostExecute(Sender: TObject);
    procedure q_PlanPostCalcFields(DataSet: TDataSet);
    procedure RxSpeedButton5Click(Sender: TObject);
    procedure RxSpeedButton6Click(Sender: TObject);
    procedure q_PlanBeforeOpen(DataSet: TDataSet);
    procedure q_PlanPeriodsBeforeOpen(DataSet: TDataSet);
    procedure q_PlanStruBeforeOpen(DataSet: TDataSet);
    procedure q_PayFormsBeforeOpen(DataSet: TDataSet);
    procedure q_PlanPostBeforeOpen(DataSet: TDataSet);
    procedure q_ResursBeforeOpen(DataSet: TDataSet);
    procedure q_BrotherPlanBeforeOpen(DataSet: TDataSet);
    procedure q_ProdBeforeOpen(DataSet: TDataSet);
    procedure q_MonthBeforeOpen(DataSet: TDataSet);
    procedure q_FactBeforeOpen(DataSet: TDataSet);
    procedure q_PlatBeforeOpen(DataSet: TDataSet);
    procedure cb_PlatClick(Sender: TObject);
    procedure lc_PlatChange(Sender: TObject);
    procedure acPlanPostPrintExecute(Sender: TObject);
    procedure acPlanPostExportXLSExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure q_PlanPosBeforeOpen(DataSet: TDataSet);
    procedure cb_PlanPosClick(Sender: TObject);
    procedure lc_PlanPosChange(Sender: TObject);
    procedure q_WithOBRBeforeOpen(DataSet: TDataSet);
    procedure TBEditItem1AcceptText(Sender: TObject; var NewText: String;
      var Accept: Boolean);
    procedure TBItem17Click(Sender: TObject);
    procedure TBItem18Click(Sender: TObject);
    procedure TBItem21Click(Sender: TObject);
    procedure q_PlanPostFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure q_PlanPostAfterOpen(DataSet: TDataSet);
    procedure acCopyPlanPostExecute(Sender: TObject);
  private
    { Private declarations }
    IsRefresh:boolean;
    StartPlanId:integer;
    filter2plan: TStringList; // Фильтр для grSF
  public
    { Public declarations }
  end;

var
  f_PlanPost: Tf_PlanPost;
  GlobalPlanId:integer;

implementation
uses AddPlnPer, AddPlPst, AddPlnIz,DBGridEhImpExp,RxShell, ForEnv,
  ForDB, main;
{$R *.dfm}

procedure Tf_PlanPost.FormCreate(Sender: TObject);
Var MaxDate:TDateTime;
    MaxId:integer;
    DatePlan:TDateTime;
    BeginDate:TDateTime;
begin
  filter2plan:=TStringList.Create;
  filter2plan.Clear;

  StartPlanId:=GlobalPlanId;
  DatePlan:=StartOfTheMonth(Now);
  BeginDate:=DatePlan;

  q_Prod.Open;
  q_Plan.Open;

  q_PlanPeriods.Open;

  If q_PlanPeriods.Locate('PLAN_ID;DATE_PLAN;BEGIN_DATE',VarArrayOf([StartPlanId,DatePlan,BeginDate]),[]) Then
    lc_PlanPeriods.KeyValue:=q_PlanPeriods.FieldByName('ID').AsInteger
  Else
  Begin
    with q_Tmp do
    try
      Close;
      SQL.Clear;
      SQL.Add('SELECT MAX(DATE_PLAN) AS dat1 FROM PLAN_PERIODS WHERE PLAN_ID='+IntToStr(StartPlanId));
      Open;
      If not Eof then MaxDate:=FieldByName('dat1').AsDateTime
      else MaxDate:=StartOfTheMonth(Now);
      Close;
    except;
      MaxDate:=StartOfTheMonth(Now);
    End;
    with q_Tmp do
    try
      Close;
      SQL.Clear;
      SQL.Add('SELECT MAX(ID) AS id1 FROM PLAN_PERIODS WHERE PLAN_ID='+IntToStr(StartPlanId)+' AND DATE_PLAN=TO_DATE('''+FormatDateTime('dd.mm.yyyy',MaxDate)+''',''dd.mm.yyyy'')');
      Open;
      If not Eof then MaxId:=FieldByName('id1').AsInteger
      else MaxId:=0;
      Close;
    except;
      MaxId:=0;
    End;

    If MaxId<>0 Then
      lc_PlanPeriods.KeyValue:=MaxId
    else
    Begin
      lc_PlanPeriods.ResetField;
      lc_Prod.ResetField;
    end;
  end;

  q_PlanStru.Open;
  q_PayForms.Open;
  IsRefresh:=true;
  q_PlanPost.Open;
  IsRefresh:=false;
  q_PlanPostAfterScroll(q_planPost);
  q_Resurs.Open;
  q_BrotherPlan.Open;
  q_WithObr.Open;

  f_db.SetUserGrants(ActionManager);
end;

procedure Tf_PlanPost.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    filter2plan.Clear;
  except
  end;

  q_Tmp.SQL.Clear;
  q_PlanPost.Close;
  q_Month.Close;
  q_Fact.Close;
  Action:=caFree;
end;

procedure Tf_PlanPost.lc_PlanPeriodsChange(Sender: TObject);
Var PlanPerId:integer;
    Prod:string;
begin
  If VarType(lc_PlanPeriods.KeyValue)<>varNull Then
    PlanPerId:=lc_PlanPeriods.KeyValue
  Else
    PlanPerId:=0;

  If NOT q_prod.EOF Then
    Prod:=q_Prod.FieldByName('ID_NPR').AsString
  else
    Prod:='00000';

  f_db.ReQuery(q_prod,true);
  f_db.ReQuery(q_plat,true);
  f_db.ReQuery(q_PlanStru,true);
  f_db.ReQuery(q_PayForms,true);
  f_db.ReQuery(q_PlanPos,true);

  IsRefresh:=true;
  f_db.ReQuery(q_PlanPost,true);
  IsRefresh:=false;
  q_PlanPostAfterScroll(q_planPost);

  f_db.ReQuery(q_Resurs,true);
  f_db.ReQuery(q_BrotherPlan,true);
  f_db.ReQuery(q_WithObr,true);

  q_Month.Close;
  q_Fact.Close;

  // Позиционируемся на тот же продукт
  If q_Prod.Locate('ID_NPR',Prod,[]) Then
    lc_Prod.KeyValue:=q_Prod.FieldByName('ID_NPR').AsString
  Else
  Begin
    with q_Tmp do
    try
      Close;
      SQL.Clear;
      SQL.Add('SELECT MIN(PROD_ID_NPR) AS id_npr1 FROM PLAN_POST WHERE PLAN_PER_ID='+IntToStr(PlanPerId));
      Open;
      If not Eof then Prod:=FieldByName('id_npr1').AsString
      else Prod:='00000';
      Close;
    except;
      Prod:='00000';
    End;

    If Prod<>'00000' Then
      lc_Prod.KeyValue:=Prod;
  end;

end;

procedure Tf_PlanPost.lc_ProdChange(Sender: TObject);
begin
  IsRefresh:=true;
  f_db.ReQuery(q_PlanPost,true);
  IsRefresh:=false;
  q_PlanPostAfterScroll(q_planPost);
end;

procedure Tf_PlanPost.acPlanPeriodsLeftExecute(Sender: TObject);
begin
  if q_PlanPeriods.Active then
  Begin
    q_PlanPeriods.Next;
    lc_PlanPeriods.KeyValue:=q_PlanPeriods.FieldByName('ID').AsInteger
  end;
end;

procedure Tf_PlanPost.acPlanPeriodsRightExecute(Sender: TObject);
begin
  if q_PlanPeriods.Active then
  Begin
    q_PlanPeriods.Prior;
    lc_PlanPeriods.KeyValue:=q_PlanPeriods.FieldByName('ID').AsInteger
  end;
end;

procedure Tf_PlanPost.acProdLeftExecute(Sender: TObject);
begin
  if q_Prod.Active then
  Begin
    q_Prod.Prior;
    lc_Prod.KeyValue:=q_Prod.FieldByName('ID_NPR').AsString;
  end;
end;

procedure Tf_PlanPost.acProdRightExecute(Sender: TObject);
begin
  if q_Prod.Active then
  Begin
    q_Prod.Next;
    lc_Prod.KeyValue:=q_Prod.FieldByName('ID_NPR').AsString;
  end;
end;

procedure Tf_PlanPost.acAddPlanPeriodsExecute(Sender: TObject);
begin
  inherited;
  F_AddPlanPer:=TF_AddPlanPer.Create(Self);
  F_AddPlanPer.PlanId:=StartPlanId;
  F_AddPlanPer.IsAdd:=true;
  if F_AddPlanPer.ShowModal=mrOk then
  Begin
    IsRefresh:=true;
    f_db.ReQuery(q_PlanPeriods,True);
    IsRefresh:=false;
    q_PlanPostAfterScroll(q_planPost);
    q_PlanPeriods.Locate('ID',F_AddPlanPer.PlanPerId,[]);
    lc_PlanPeriods.KeyValue:=F_AddPlanPer.PlanPerId;
    lc_PlanPeriodsChange(Sender);
  end;
  F_AddPlanPer.Free;
end;

procedure Tf_PlanPost.acDelPlanPeriodsExecute(Sender: TObject);
begin
  inherited;
  If VarType(lc_PlanPeriods.KeyValue)=varNull then exit;
  if Application.MessageBox('Удалить плановый период?','Запрос',MB_YESNO)=IDYES Then
  Begin
    with ora_Package do
    try
      CallProcedure('DeletePeriod', [lc_PlanPeriods.KeyValue]);
    except
      on E:EOracleError do ShowMessage(E.Message);
    end;
    lc_PlanPeriods.ResetField;
    IsRefresh:=true;
    f_db.ReQuery(q_PlanPeriods,True);
    IsRefresh:=false;
    q_PlanPostAfterScroll(q_planPost);
    lc_PlanPeriodsChange(Sender);
  End;
end;

procedure Tf_PlanPost.acAddPlanPostExecute(Sender: TObject);
var s:string;
begin
  inherited;
  If VarType(lc_PlanPeriods.KeyValue)=varNull then exit;
  F_AddPlanPost:=TF_AddPlanPost.Create(Self);
  with F_AddPlanPost do
  Begin
    EditMode:=0;
    EditId:=0;
    PlanId:=StartPlanId;
    PlanName:=q_Plan.FieldByName('PLAN_NAME').AsString;
    PlanPerId:=lc_PlanPeriods.KeyValue;
    PlanPerName:=q_PlanPeriods.FieldByName('NUM_IZM_STR').AsString;
    BegDate:=q_PlanPeriods.FieldByName('BEGIN_DATE').AsDateTime;
    EndDate:=q_PlanPeriods.FieldByName('END_DATE').AsDateTime;
    OnlySNP:=(q_Plan.FieldByName('ONLY_SNP').AsInteger=1);
    OnlyUNP:=(q_Plan.FieldByName('ONLY_UNP').AsInteger=1);

    if ShowModal=mrOk then
    Begin
      IsRefresh:=true;
      f_db.ReQuery(q_PlanPost,false);
      q_PlanPost.Locate('ID',VarArrayOf([EditId]),[]);
      IsRefresh:=false;
      lc_PlanPeriodsChange(Sender);
    end;
    Free;
  End;
end;

procedure Tf_PlanPost.acEditPlanPeriodsExecute(Sender: TObject);
begin
  inherited;
  If VarType(lc_PlanPeriods.KeyValue)=varNull then exit;
  F_AddPlanPer:=TF_AddPlanPer.Create(Self);
  F_AddPlanPer.PlanId:=StartPlanId;
  F_AddPlanPer.PlanPerId:=lc_PlanPeriods.KeyValue;
  F_AddPlanPer.PlanDate:=q_PlanPeriods.FieldByName('DATE_PLAN').AsDateTime;
  F_AddPlanPer.BegDate:=q_PlanPeriods.FieldByName('BEGIN_DATE').AsDateTime;
  F_AddPlanPer.EndDate:=q_PlanPeriods.FieldByName('END_DATE').AsDateTime;
  F_AddPlanPer.IsAdd:=false;
  if F_AddPlanPer.ShowModal=mrOk then
  Begin
    lc_PlanPeriods.ResetField;
    IsRefresh:=true;
    f_db.ReQuery(q_PlanPeriods,True);
    IsRefresh:=false;
    q_PlanPostAfterScroll(q_planPost);
    q_PlanPeriods.Locate('ID',F_AddPlanPer.PlanPerId,[]);
    lc_PlanPeriods.KeyValue:=F_AddPlanPer.PlanPerId;
    lc_PlanPeriodsChange(Sender);
  end;
  F_AddPlanPer.Free;
end;

procedure Tf_PlanPost.cb_ProdClick(Sender: TObject);
begin
  inherited;
  lc_Prod.Enabled:=cb_Prod.Checked;
  lc_ProdChange(Sender);
end;

procedure Tf_PlanPost.q_PlanPostAfterScroll(DataSet: TDataSet);
begin
  inherited;
  If NOT IsRefresh then
  Begin
    f_db.ReQuery(q_PayForms,true);
    f_db.ReQuery(q_BrotherPlan,true);
    f_db.ReQuery(q_WithObr,true);
    f_db.ReQuery(q_PlanStru,true);
    f_db.ReQuery(q_Resurs,true);
  End;
end;

procedure Tf_PlanPost.acRefresh_PP_View1Execute(Sender: TObject);
begin
  inherited;
  Cursor:=crSQLWait;
  IsRefresh:=true;
  f_db.ReQuery(q_PlanPeriods,True);
  f_db.ReQuery(q_Prod,True);
  f_db.ReQuery(q_Plat,True);
  f_db.ReQuery(q_PlanPost,True);
  IsRefresh:=false;
  q_PlanPostAfterScroll(q_planPost);
  Cursor:=crDefault;
end;

procedure Tf_PlanPost.acAddPlanIzmExecute(Sender: TObject);
begin
  inherited;
  If VarType(lc_PlanPeriods.KeyValue)=varNull then exit;
  F_AddPlanIzm:=TF_AddPlanIzm.Create(Self);
  F_AddPlanIzm.PlanName:=q_Plan.FieldByName('PLAN_NAME').AsString;
  F_AddPlanIzm.PlanPerId:=lc_PlanPeriods.KeyValue;
  F_AddPlanIzm.PlanMon:=q_PlanPeriods.FieldByName('RUS_MONTH').AsString;
  F_AddPlanIzm.NumIzm:=q_PlanPeriods.FieldByName('NUM_IZM_POST').AsInteger;
  F_AddPlanIzm.BegDate:=q_PlanPeriods.FieldByName('BEGIN_DATE').AsDateTime;
  F_AddPlanIzm.EndDate:=q_PlanPeriods.FieldByName('END_DATE').AsDateTime;
  if F_AddPlanIzm.ShowModal=mrOk then
  Begin
    lc_PlanPeriods.ResetField;
    lc_PlanPeriodsChange(Sender);
    q_PlanPeriods.Locate('ID',F_AddPlanIzm.PlanPerId,[]);
  end;
  F_AddPlanIzm.Free;
end;

procedure Tf_PlanPost.acDelPlanPostExecute(Sender: TObject);
var SavePlanPost: TBookmark;
begin
  inherited;
  If q_PlanPost.EOF then exit;
  if Application.MessageBox('Удалить позицию плана?','Запрос',MB_YESNO)=IDYES Then
  Begin
    with ora_Package do
    try
      SavePlanPost:=q_PlanPost.GetBookmark;
      CallProcedure('DeletePlanPost',
        [q_PlanPost.FieldValues['ID']]);
    except
      on E:EOracleError do ShowMessage(E.Message);
    end;
    lc_PlanPeriodsChange(Sender);
    try
      q_PlanPost.GotoBookmark(SavePlanPost);
    except
    end;
  End;
end;

procedure Tf_PlanPost.acEditPlanPostExecute(Sender: TObject);
begin
  inherited;
  If q_PlanPost.Eof then exit;
  F_AddPlanPost:=TF_AddPlanPost.Create(Self);
  with F_AddPlanPost do
  Begin
    EditMode:=1;
    EditId:=q_PlanPost.FieldByName('ID').AsFloat;
    PlanId:=StartPlanId;
    PlanName:=q_Plan.FieldByName('PLAN_NAME').AsString;
    PlanPerId:=lc_PlanPeriods.KeyValue;
    PlanPerName:=q_PlanPeriods.FieldByName('NUM_IZM_STR').AsString;
    BegDate:=q_PlanPeriods.FieldByName('BEGIN_DATE').AsDateTime;
    EndDate:=q_PlanPeriods.FieldByName('END_DATE').AsDateTime;
    OnlySNP:=(q_Plan.FieldByName('ONLY_SNP').AsInteger=1);
    OnlyUNP:=(q_Plan.FieldByName('ONLY_UNP').AsInteger=1);

    if ShowModal=mrOk then
    Begin
      lc_PlanPeriodsChange(Sender);
    end;
    Free;
  End;
end;

procedure Tf_PlanPost.q_PlanPostCalcFields(DataSet: TDataSet);
begin
  inherited;
  if q_Fact.Active then
    if q_Fact.Locate('PROD_ID_NPR;PLANSTRU_ID;DOG_ID',VarArrayOf([q_PlanPostPROD_ID_NPR.AsString,q_PlanPostPLANSTRU_ID.AsInteger,q_PlanPostDOG_ID.AsInteger]),[]) then
      q_PlanPostFACT_VES.AsFloat:=q_FactVES.AsFloat;
  if q_Month.Active then
    if q_Month.Locate('PROD_ID_NPR;PLANSTRU_ID;DOG_ID',VarArrayOf([q_PlanPostPROD_ID_NPR.AsString,q_PlanPostPLANSTRU_ID.AsInteger,q_PlanPostDOG_ID.AsInteger]),[]) then
      q_PlanPostMONTH_VES.AsFloat:=q_MonthTONN_DECLARED.AsFloat;
end;

procedure Tf_PlanPost.RxSpeedButton5Click(Sender: TObject);
begin
  inherited;
  try
    Cursor:=crSQLWait;
    try
      q_Fact.Close;
      q_Fact.Open;
    except
      q_Fact.Close;
    end;
    acRefresh_PP_View1Execute(Sender);
  finally
    Cursor:=crDefault;
  end;
end;

procedure Tf_PlanPost.RxSpeedButton6Click(Sender: TObject);
begin
  inherited;
  try
    Cursor:=crSQLWait;
    try
      q_Month.Close;
      q_Month.Open;
    except
      q_Month.Close;
    end;
    acRefresh_PP_View1Execute(Sender);
  finally
    Cursor:=crDefault;
  end;
end;

procedure Tf_PlanPost.q_PlanBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  q_Plan.SQL[2]:=' AND ID='+IntToStr(StartPlanId);
end;

procedure Tf_PlanPost.q_PlanPeriodsBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  q_PlanPeriods.SQL[3]:=' WHERE PLAN_ID='+IntToStr(StartPlanId);
end;

procedure Tf_PlanPost.q_PlanStruBeforeOpen(DataSet: TDataSet);
var PlanPerId:integer;
    PlanStruId:integer;
    Prod:string;
begin
  inherited;
  If VarType(lc_PlanPeriods.KeyValue)<>varNull Then
    PlanPerId:=lc_PlanPeriods.KeyValue
  Else
    PlanPerId:=0;

  if q_PlanPost.Active then
  Begin
    PlanStruId:=q_PlanPost.FieldByName('PLANSTRU_ID').AsInteger;
    Prod:=q_PlanPost.FieldByName('PROD_ID_NPR').AsString;
  end
  else
  Begin
    PlanStruId:=0;
    Prod:='00000';
  End;

  with q_PlanStru do
  Begin
    SQL[14]:=' WHERE ID='+IntToStr(PlanStruId);
    SQL[27]:=' AND PLAN_ID='+IntToStr(StartPlanId);
    SQL[28]:=' AND PLAN_PER_ID='+IntToStr(PlanPerId);
    SQL[29]:=' AND PROD_ID_NPR='''+Prod + '''';
  end;
end;

procedure Tf_PlanPost.q_PayFormsBeforeOpen(DataSet: TDataSet);
var PlanPerId:integer;
    PlanStruId:integer;
    DogId:integer;
    Prod:string;
begin
  inherited;
  If VarType(lc_PlanPeriods.KeyValue)<>varNull Then
    PlanPerId:=lc_PlanPeriods.KeyValue
  Else
    PlanPerId:=0;

  if q_PlanPost.Active then
  Begin
    PlanStruId:=q_PlanPost.FieldByName('PLANSTRU_ID').AsInteger;
    DogId:=q_PlanPost.FieldByName('DOG_ID').AsInteger;
    Prod:=q_PlanPost.FieldByName('PROD_ID_NPR').AsString;
  end
  else
  Begin
    PlanStruId:=0;
    DogId:=0;
    Prod:='00000';
  End;

  with q_PayForms do
  Begin
    SQL[7]:=' WHERE PLAN_ID='+IntToStr(StartPlanId);
    SQL[8]:='   AND PLAN_PER_ID='+IntToStr(PlanPerId);
    SQL[9]:=' AND PROD_ID_NPR='''+Prod + '''';
    SQL[10]:=' AND PLANSTRU_ID='+IntToStr(PlanStruId);
    SQL[11]:=' AND DOG_ID='+IntToStr(DogId);
  end;
end;

procedure Tf_PlanPost.q_PlanPostBeforeOpen(DataSet: TDataSet);
var PlanPos,Plat,PlanPerId:integer;
    Prod:string;
begin
  inherited;
  If VarType(lc_PlanPeriods.KeyValue)<>varNull Then
    PlanPerId:=lc_PlanPeriods.KeyValue
  Else
    PlanPerId:=0;

  If VarType(lc_Prod.KeyValue)<>varNull Then
    Prod:=lc_Prod.KeyValue
  Else
    Prod:='00000';

  If VarType(lc_Plat.KeyValue)<>varNull Then
    Plat:=lc_Plat.KeyValue
  Else
    Plat:=0;

  If VarType(lc_PlanPos.KeyValue)<>varNull Then
    PlanPos:=lc_PlanPos.KeyValue
  Else
    PlanPos:=0;

  with q_PlanPost do
  Begin
    SQL[2]:=' WHERE PLAN_ID='+IntToStr(StartPlanId);
    SQL[3]:='   AND PLAN_PER_ID='+IntToStr(PlanPerId);
    IF cb_Prod.Checked then
      SQL[4]:=' AND PROD_ID_NPR='''+Prod + ''''
    else
      SQL[4]:=' AND 1 = 1';
    IF cb_Plat.Checked then
      SQL[5]:=' AND PLAT_ID='+IntToStr(Plat)
    else
      SQL[5]:=' AND 1 = 1';
    IF cb_PlanPos.Checked then
      SQL[6]:=' AND PLANSTRU_ID='+IntToStr(PlanPos)
    else
      SQL[6]:=' AND 1 = 1';
  end;
end;

procedure Tf_PlanPost.q_ResursBeforeOpen(DataSet: TDataSet);
var PlanPerId:integer;
    Prod:string;
begin
  inherited;
  If VarType(lc_PlanPeriods.KeyValue)<>varNull Then
    PlanPerId:=lc_PlanPeriods.KeyValue
  Else
    PlanPerId:=0;

  if q_PlanPost.Active then
  Begin
    Prod:=q_PlanPost.FieldByName('PROD_ID_NPR').AsString;
  end
  else
  Begin
    Prod:='00000';
  End;

  with q_Resurs do
  Begin
    SQL[3]:=' WHERE PLAN_ID='+IntToStr(StartPlanId);
    SQL[4]:='   AND PLAN_PER_ID='+IntToStr(PlanPerId);
    SQL[5]:='   AND PROD_ID_NPR='''+Prod + '''';
  end;
end;

procedure Tf_PlanPost.q_BrotherPlanBeforeOpen(DataSet: TDataSet);
var BeginDate:TDateTime;
    DatePlan:TDateTime;
    PlanStruId:integer;
    DogId:integer;
    Prod:string;
begin
  inherited;
  If VarType(lc_PlanPeriods.KeyValue)<>varNull Then
  Begin
    DatePlan:=q_PlanPeriods.FieldByName('DATE_PLAN').AsDateTime;
    BeginDate:=q_PlanPeriods.FieldByName('BEGIN_DATE').AsDateTime;
  End
  Else
  Begin
    DatePlan:=StartOfTheMonth(Now);
    BeginDate:=DatePlan;
  End;

  if q_PlanPost.Active then
  Begin
    PlanStruId:=q_PlanPost.FieldByName('PLANSTRU_ID').AsInteger;
    DogId:=q_PlanPost.FieldByName('DOG_ID').AsInteger;
    Prod:=q_PlanPost.FieldByName('PROD_ID_NPR').AsString;
  end
  else
  Begin
    PlanStruId:=0;
    DogId:=0;
    Prod:='00000';
  End;

  with q_BrotherPlan do
  Begin
    SQL[6]:=' AND B.ID='+IntToStr(StartPlanId);
    SQL[8]:=' AND C.DATE_PLAN=TO_DATE('''+FormatDateTime('dd.mm.yyyy',DatePlan)+''',''dd.mm.yyyy'')';
    SQL[9]:='-- AND C.BEGIN_DATE=TO_DATE('''+FormatDateTime('dd.mm.yyyy',BeginDate)+''',''dd.mm.yyyy'')';
    SQL[10]:=' AND A.PROD_ID_NPR='''+Prod + '''';
    SQL[11]:=' AND A.PLANSTRU_ID='+IntToStr(PlanStruId);
    SQL[12]:=' AND A.DOG_ID='+IntToStr(DogId);
  end;
end;

procedure Tf_PlanPost.q_ProdBeforeOpen(DataSet: TDataSet);
var PlanPerId:integer;
begin
  inherited;
  If VarType(lc_PlanPeriods.KeyValue)<>varNull Then
    PlanPerId:=lc_PlanPeriods.KeyValue
  Else
    PlanPerId:=0;

  with q_Prod do
  Begin
    SQL[5]:=' AND (PLAN_POST.PLAN_PER_ID='+IntToStr(PlanPerId) + ')';
  end;
end;

procedure Tf_PlanPost.q_MonthBeforeOpen(DataSet: TDataSet);
var BeginDate:TDateTime;
    EndDate:TDateTime;
    DatePlan:TDateTime;
begin
  inherited;
  If VarType(lc_PlanPeriods.KeyValue)<>varNull Then
  Begin
    DatePlan:=q_PlanPeriods.FieldByName('DATE_PLAN').AsDateTime;
    BeginDate:=q_PlanPeriods.FieldByName('BEGIN_DATE').AsDateTime;
    EndDate:=q_PlanPeriods.FieldByName('END_DATE').AsDateTime;
  End
  Else
  Begin
    DatePlan:=StartOfTheMonth(Now);
    BeginDate:=DatePlan;
    EndDate:=EndOfTheMonth(DatePlan);
  End;

  with q_Month do
  Begin
    Close;
    SQL[6]:=' WHERE DATE_PLAN=TO_DATE('''+FormatDateTime('dd.mm.yyyy',DatePlan)+''',''dd.mm.yyyy'')';
    SQL[7]:=' AND 1=1';
    SQL[8]:=' AND INPUT_DATE<TO_DATE('''+FormatDateTime('dd.mm.yyyy',EndDate)+''',''dd.mm.yyyy'')+1';
  End;

end;

procedure Tf_PlanPost.q_FactBeforeOpen(DataSet: TDataSet);
var BeginDate:TDateTime;
    EndDate:TDateTime;
begin
  inherited;
  If VarType(lc_PlanPeriods.KeyValue)<>varNull Then
  Begin
    BeginDate:=q_PlanPeriods.FieldByName('BEGIN_DATE').AsDateTime;
    EndDate:=q_PlanPeriods.FieldByName('END_DATE').AsDateTime;
  End
  Else
  Begin
    BeginDate:=StartOfTheMonth(Now);
    EndDate:=EndOfTheMonth(Now);
  End;

  with q_Fact do
  Begin
    Close;
    SQL[6]:=' WHERE A.DATE_OTGR>TO_DATE('''+FormatDateTime('dd.mm.yyyy',BeginDate)+''',''dd.mm.yyyy'')-1';
    SQL[7]:=' AND A.DATE_OTGR<TO_DATE('''+FormatDateTime('dd.mm.yyyy',EndDate)+''',''dd.mm.yyyy'')+1';
  End;

end;

procedure Tf_PlanPost.q_PlatBeforeOpen(DataSet: TDataSet);
var PlanPerId:integer;
begin
  inherited;
  If VarType(lc_PlanPeriods.KeyValue)<>varNull Then
    PlanPerId:=lc_PlanPeriods.KeyValue
  Else
    PlanPerId:=0;

  with q_Plat do
  Begin
    SQL[6]:=' AND (PLAN_POST.PLAN_PER_ID='+IntToStr(PlanPerId) + ')';
  end;
end;

procedure Tf_PlanPost.cb_PlatClick(Sender: TObject);
begin
  inherited;
  lc_Plat.Enabled:=cb_Plat.Checked;
  lc_PlatChange(Sender);
end;

procedure Tf_PlanPost.lc_PlatChange(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.ReQuery(q_PlanPost,true);
  IsRefresh:=false;
  q_PlanPostAfterScroll(q_planPost);
end;

procedure Tf_PlanPost.acPlanPostPrintExecute(Sender: TObject);
begin
  inherited;
  PrintDBGridEh1.Preview;
end;

procedure Tf_PlanPost.acPlanPostExportXLSExecute(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
    if not FileExists(SaveDialog1.FileName) then
      begin
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,grid_PlanPost,SaveDialog1.FileName,True);
        FileExecute(SaveDialog1.FileName,'','',esMaximized);
      end
    else
      if MessageDlg('Файл уже существует! Переписать?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,grid_PlanPost,SaveDialog1.FileName,True);
          FileExecute(SaveDialog1.FileName,'','',esMaximized);
        end
end;

procedure Tf_PlanPost.FormShow(Sender: TObject);
begin
  inherited;
{  if StartPlanId=1 then Caption:='Рабочий план поставок';
  if StartPlanId=2 then Caption:='Московский план поставок';
  if StartPlanId=3 then Caption:='Операционно-бюджетные решения по плану поставок';
  if StartPlanId=4 then Caption:='Изменения плана поставок';
  if StartPlanId=5 then Caption:='Заявки на поставку нефтепродуктов';
  if StartPlanId=6 then Caption:='Корректировка заявок на поставку нефтепродуктов';}
  if NOT q_Plan.EOF then
    Caption:=q_Plan.FieldByName('PLAN_NAME').AsString;
end;

procedure Tf_PlanPost.q_PlanPosBeforeOpen(DataSet: TDataSet);
var BeginDate:TDateTime;
    EndDate:TDateTime;
begin
  inherited;
  If VarType(lc_PlanPeriods.KeyValue)<>varNull Then
  Begin
    BeginDate:=q_PlanPeriods.FieldByName('BEGIN_DATE').AsDateTime;
    EndDate:=q_PlanPeriods.FieldByName('END_DATE').AsDateTime;
  End
  Else
  Begin
    BeginDate:=StartOfTheMonth(Now);
    EndDate:=EndOfTheMonth(Now);
  End;

  with q_PlanPos do
  Begin
    Close;
    SQL[3]:=' AND END_DATE>TO_DATE('''+FormatDateTime('dd.mm.yyyy',BeginDate)+''',''dd.mm.yyyy'')-1';
    SQL[4]:=' AND BEGIN_DATE<TO_DATE('''+FormatDateTime('dd.mm.yyyy',EndDate)+''',''dd.mm.yyyy'')+1';
  End;
end;

procedure Tf_PlanPost.cb_PlanPosClick(Sender: TObject);
begin
  inherited;
  lc_PlanPos.Enabled:=cb_PlanPos.Checked;
  lc_PlanPosChange(Sender);
end;

procedure Tf_PlanPost.lc_PlanPosChange(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.ReQuery(q_PlanPost,true);
  IsRefresh:=false;
  q_PlanPostAfterScroll(q_planPost);
end;

procedure Tf_PlanPost.q_WithOBRBeforeOpen(DataSet: TDataSet);
var BeginDate:TDateTime;
    DatePlan:TDateTime;
    PlanStruId:integer;
    DogId:integer;
    Prod:string;
begin
  inherited;
  If VarType(lc_PlanPeriods.KeyValue)<>varNull Then
  Begin
    DatePlan:=q_PlanPeriods.FieldByName('DATE_PLAN').AsDateTime;
    BeginDate:=q_PlanPeriods.FieldByName('BEGIN_DATE').AsDateTime;
  End
  Else
  Begin
    DatePlan:=StartOfTheMonth(Now);
    BeginDate:=DatePlan;
  End;

  if q_PlanPost.Active then
  Begin
    PlanStruId:=q_PlanPost.FieldByName('PLANSTRU_ID').AsInteger;
    DogId:=q_PlanPost.FieldByName('DOG_ID').AsInteger;
    Prod:=q_PlanPost.FieldByName('PROD_ID_NPR').AsString;
  end
  else
  Begin
    PlanStruId:=0;
    DogId:=0;
    Prod:='00000';
  End;

  with q_WithObr do
  Begin
    SQL[5]:=' AND B.ID='+IntToStr(StartPlanId);
    SQL[7]:=' AND C.DATE_PLAN=TO_DATE('''+FormatDateTime('dd.mm.yyyy',DatePlan)+''',''dd.mm.yyyy'')';
    SQL[8]:='-- AND C.BEGIN_DATE=TO_DATE('''+FormatDateTime('dd.mm.yyyy',BeginDate)+''',''dd.mm.yyyy'')';
    SQL[9]:=' AND A.PROD_ID_NPR='''+Prod + '''';
    SQL[10]:=' AND A.PLANSTRU_ID='+IntToStr(PlanStruId);
    SQL[11]:=' AND A.DOG_ID='+IntToStr(DogId);
//    SQL.SaveToFile('c:\tmp\1.sql');
  end;

end;

procedure Tf_PlanPost.TBEditItem1AcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  inherited;
  f_db.FilterAcceptText(grid_PlanPost,filter2plan,NewText,Accept);
end;

procedure Tf_PlanPost.TBItem17Click(Sender: TObject);
begin
  inherited;
  f_db.FilterCurrentValue(grid_PlanPost,filter2plan);
end;

procedure Tf_PlanPost.TBItem18Click(Sender: TObject);
begin
  inherited;
  f_db.FilterCLear(grid_PlanPost,filter2plan);
end;

procedure Tf_PlanPost.TBItem21Click(Sender: TObject);
begin
  inherited;
  f_db.EditInMemo(grid_PlanPost);
end;

procedure Tf_PlanPost.q_PlanPostFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept:=f_db.AcceptFilterRecord(grid_PlanPost,filter2plan);
end;

procedure Tf_PlanPost.q_PlanPostAfterOpen(DataSet: TDataSet);
var i:integer;
begin
  inherited;
  if filter2plan.Count=0 then
  for i:=1 to q_PlanPost.FieldCount do
  Begin
    filter2plan.Add('');
  end;
end;

procedure Tf_PlanPost.acCopyPlanPostExecute(Sender: TObject);
begin
  inherited;
  If VarType(lc_PlanPeriods.KeyValue)=varNull then exit;
  F_AddPlanPost:=TF_AddPlanPost.Create(Self);
  with F_AddPlanPost do
  Begin
    EditMode:=0;
    EditId:=q_planpost.FieldByname('ID').asFloat;
    PlanId:=StartPlanId;
    PlanName:=q_Plan.FieldByName('PLAN_NAME').AsString;
    PlanPerId:=lc_PlanPeriods.KeyValue;
    PlanPerName:=q_PlanPeriods.FieldByName('NUM_IZM_STR').AsString;
    BegDate:=q_PlanPeriods.FieldByName('BEGIN_DATE').AsDateTime;
    EndDate:=q_PlanPeriods.FieldByName('END_DATE').AsDateTime;
    OnlySNP:=(q_Plan.FieldByName('ONLY_SNP').AsInteger=1);
    OnlyUNP:=(q_Plan.FieldByName('ONLY_UNP').AsInteger=1);

    if ShowModal=mrOk then
    Begin
      IsRefresh:=true;
      f_db.ReQuery(q_PlanPost,false);
      q_PlanPost.Locate('ID',VarArrayOf([EditId]),[]);
      IsRefresh:=false;
      lc_PlanPeriodsChange(Sender);
    end;
    Free;
  end;
end;

end.
