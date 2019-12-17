unit pr_view;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ActnList, XPStyleActnCtrls, ActnMan, OracleData, Oracle,
  Grids,  StdCtrls, ComCtrls, RxLookup, Buttons, ExtCtrls,MdiForm,
  TB2Item, TB2Dock, TB2Toolbar,DateUtils, PrnDbgeh, Menus, Mask, ToolEdit, DBGrids, EhLibDOA,
  TB2ExtItems, GridsEh, DBGridEh;

type
  TfrmPRView = class(Tf_MDIForm)
    Panel1: TPanel;
    cbPredpr: TRxDBLookupCombo;
    cbProd: TRxDBLookupCombo;
    Panel2: TPanel;
    GridPlan: TDBGridEh;
    oraSes: TOracleSession;
    oraPP: TOracleDataSet;
    dsPP: TDataSource;
    ActionManager1: TActionManager;
    acAddPlanR: TAction;
    acApplyPlanR: TAction;
    oraKls_prod: TOracleDataSet;
    dsProd: TDataSource;
    oraKls_predpr: TOracleDataSet;
    dsPredpr: TDataSource;
    oraPPPREDPR: TStringField;
    oraPPNPR: TStringField;
    oraPPVID_REAL: TStringField;
    oraPPTIP_REAL: TStringField;
    oraPPORG_STRU: TStringField;
    oraPPORG_KIND: TStringField;
    oraPPVES: TFloatField;
    oraPPDATE_PLAN: TDateTimeField;
    oraPPD_PLAN: TStringField;
    oraTip_real: TOracleDataSet;
    dsTip_real: TDataSource;
    dsVid_real: TDataSource;
    oraVid_real: TOracleDataSet;
    oraOrg_kind: TOracleDataSet;
    dsOrg_kind: TDataSource;
    dsOrg_Stru: TDataSource;
    oraOrg_Stru: TOracleDataSet;
    cbOrg_stru: TRxDBLookupCombo;
    cbOrg_kind: TRxDBLookupCombo;
    cbVid_Real: TRxDBLookupCombo;
    cbTip_real: TRxDBLookupCombo;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    TBItem4: TTBItem;
    TBItem3: TTBItem;
    TBItem2: TTBItem;
    acEditPlanR: TAction;
    acDelPlanR: TAction;
    Label1: TLabel;
    edDateFrom: TDateTimePicker;
    Label2: TLabel;
    edDateTo: TDateTimePicker;
    oraPPID: TFloatField;
    oraPPPREDPR_ID: TIntegerField;
    oraPPID_NPR: TStringField;
    oraPPVID_REAL_ID: TFloatField;
    oraPPTIP_REAL_ID: TFloatField;
    oraPPORG_STRU_ID: TFloatField;
    oraPPORG_KIND_ID: TFloatField;
    cb_Sklad: TRxDBLookupCombo;
    ora_Sklad: TOracleDataSet;
    ds_Sklad: TDataSource;
    oraPPSKLAD: TStringField;
    oraPPSKLAD_ID: TFloatField;
    acToXLS: TAction;
    PrintDBGridEh1: TPrintDBGridEh;
    SaveDialog1: TSaveDialog;
    oraPPIS_KORR: TIntegerField;
    cb_Korr: TCheckBox;
    oraPPPLANSTRU_NAME: TStringField;
    oraPPPLANSTRU_ID: TFloatField;
    oraPlanStru: TOracleDataSet;
    dsPlanStru: TDataSource;
    cb_PlanStru: TRxDBLookupCombo;
    oraPPSUMMA: TFloatField;
    acCopyPlanR: TAction;
    oraPPIS_SIGN1: TIntegerField;
    oraPPIS_SIGN2: TIntegerField;
    oraPPFIRST_PLAN: TFloatField;
    TBPopupMenu2: TTBPopupMenu;
    TBItem15: TTBItem;
    TBEditItem1: TTBEditItem;
    TBItem17: TTBItem;
    TBItem18: TTBItem;
    TBSeparatorItem7: TTBSeparatorItem;
    TBItem21: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBItem5: TTBItem;
    oraFromSklad: TOracleDataSet;
    dsFromSklad: TDataSource;
    oraPPROWID: TStringField;
    oraPPSKLAD_ID_FROM: TFloatField;
    oraPPFROM_NAME: TStringField;
    cb_Uchastok: TRxDBLookupCombo;
    ora_Uch: TOracleDataSet;
    ds_Uch: TDataSource;
    oraPPUCHASTOK_ID: TFloatField;
    oraPPUCHASTOK: TStringField;
    procedure acApplyPlanRExecute(Sender: TObject);
    procedure acAddPlanRExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acEditPlanRExecute(Sender: TObject);
    procedure acDelPlanRExecute(Sender: TObject);
    procedure cbOrg_struChange(Sender: TObject);
    procedure cbOrg_kindChange(Sender: TObject);
    procedure acToXLSExecute(Sender: TObject);
    procedure cb_KorrClick(Sender: TObject);
    procedure acCopyPlanRExecute(Sender: TObject);
    procedure GridPlanExit(Sender: TObject);
    procedure TBEditItem1AcceptText(Sender: TObject; var NewText: String;
      var Accept: Boolean);
    procedure TBItem17Click(Sender: TObject);
    procedure TBItem18Click(Sender: TObject);
    procedure TBItem21Click(Sender: TObject);
    procedure oraPPFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure oraPPAfterOpen(DataSet: TDataSet);
    procedure cb_UchastokChange(Sender: TObject);
  private
    { Private declarations }
    filter2plan: TStringList; // Фильтр для grSF
  public
    { Public declarations }
  end;

var
  frmPRView: TfrmPRView;

implementation
uses pr_new, ForDB, DBGridEhImpExp,RxShell, KlsMisc2;
{$R *.dfm}

procedure TfrmPRView.acApplyPlanRExecute(Sender: TObject);
begin
  if oraPP.State=dsEdit then oraPP.Post;

  if cb_Korr.Checked then
    oraPP.SQl[25]:='and pr.is_korr=1'
  else
    oraPP.SQl[25]:='and 1=1';

  if cbPredpr.Value<>'0' then
    oraPP.SQl[26]:='and pr.supplier_id='+oraKls_predpr.fieldByName('id').AsString
  else
    oraPP.SQl[26]:='and 1=1';
  if cbProd.Value<>'0' then
    oraPP.SQl[27]:='and pr.prod_id_npr='+oraKls_prod.fieldByName('id_npr').AsString
  else
    oraPP.SQl[27]:='and 1=1';
  oraPP.SQl[28]:='and pr.date_plan>=TO_DATE('''+FormatDateTime('dd.mm.yyyy',edDateFrom.Date)+''',''dd.mm.yyyy'')';
  oraPP.SQl[29]:='and pr.date_plan<=TO_DATE('''+FormatDateTime('dd.mm.yyyy',edDateTo.Date)+''',''dd.mm.yyyy'')';
  if cbTip_real.Value<>'0' then
    oraPP.SQl[30]:='and pr.tip_real_id='+oraTip_real.fieldByName('ID').AsString
  else
    oraPP.SQl[30]:='and 1=1';
  if cbVid_real.Value<>'0' then
    oraPP.SQl[31]:='and pr.vid_real_id='+oraVid_real.fieldByName('ID').AsString
  else
    oraPP.SQl[31]:='and 1=1';
  if cbOrg_kind.Value<>'0' then
    oraPP.SQl[32]:='and pr.org_kind_id='+oraOrg_kind.fieldByName('ID').AsString
  else
    oraPP.SQl[32]:='and 1=1';
  if cbOrg_stru.Value<>'0' then
    oraPP.SQl[33]:='and pr.org_stru_id='+oraOrg_stru.fieldByName('ID').AsString
  else
    oraPP.SQl[33]:='and 1=1';
  if cb_Sklad.Value<>'0' then
    oraPP.SQl[34]:='and pr.sklad_id='+cb_Sklad.KeyValue
  else
    oraPP.SQl[34]:='and 1=1';
  if cb_PlanStru.Value<>'0' then
    oraPP.SQl[35]:='and pr.planstru_id='+cb_PlanStru.KeyValue
  else
    oraPP.SQl[35]:='and 1=1';
  if cb_Uchastok.Value<>'0' then
    oraPP.SQl[36]:='and sklad.UCHASTOK_id='+cb_Uchastok.KeyValue
  else
    oraPP.SQl[36]:='and 1=1';
  f_db.ReQuery(oraPP,True);
end;

procedure TfrmPRView.acAddPlanRExecute(Sender: TObject);
begin
  if oraPP.State=dsEdit then oraPP.Post;
  with tfrmPRNew.create(self) do
  Begin
    EditId:=0;
    IsAdd:=true;
    showmodal;
    Free;
    f_db.ReQuery(oraPP,True);
  end;
end;

procedure TfrmPRView.FormCreate(Sender: TObject);
begin
  filter2plan:=TStringList.Create;
  filter2plan.Clear;

  f_db.LogonMasterSession(oraSes);
  oraKls_predpr.Open;
  oraKls_prod.Open;
  oraTip_real.Open;
  oraVid_real.Open;
  oraOrg_kind.Open;
  oraOrg_stru.Open;
  ora_Sklad.Open;
  ora_Uch.Open;
  oraPlanStru.Open;
  edDateFrom.Date:=StartOfTheMonth(Now);
  edDateTo.Date:=EndOfTheMonth(Now);
  acApplyPlanRExecute(Sender);

  // Раздаем права
  if f_db.CheckGrant('acPlanRealAdd') then
  Begin
    gridPlan.columns[0].ReadOnly:=false;
    gridPlan.Options:=gridPlan.Options - [dgRowSelect]+[dgEditing];
  End;

  if f_db.CheckGrant('acPlanRealConfirm') then
  Begin
    gridPlan.columns[1].ReadOnly:=false;
    gridPlan.Options:=gridPlan.Options - [dgRowSelect]+[dgEditing];
  End;
end;

procedure TfrmPRView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    filter2plan.Clear;
  except
  end;
  oraSes.Connected:=false;
  action:=caFree;
end;

procedure TfrmPRView.acEditPlanRExecute(Sender: TObject);
begin
  inherited;
  if oraPP.State=dsEdit then oraPP.Post;
  if not oraPP.eof then
  with tfrmPRNew.create(self) do
  Begin
    EditId:=oraPP.FieldByName('ID').AsInteger;
    IsAdd:=false;
    showmodal;
    Free;
    f_db.ReQuery(oraPP,True);
  End;
end;

procedure TfrmPRView.acDelPlanRExecute(Sender: TObject);
begin
  inherited;
  if oraPP.State=dsEdit then oraPP.Post;
  if Application.MessageBox('Удалить запись?','Внимание!',MB_YESNO)=IDYES then
  Begin
    oraPP.Delete;
  End;
end;

procedure TfrmPRView.cbOrg_struChange(Sender: TObject);
begin
  inherited;
  ora_Sklad.Close;
  ora_Uch.Close;
  if cbOrg_stru.Value<>'0' then
  Begin
    ora_Sklad.SQl[2]:='where filial_id='+oraOrg_stru.fieldByName('ID').AsString;
    ora_Uch.SQl[2]:='and org_kind_id in (1,4,11)';
    ora_Uch.SQl[3]:='and filial_id='+oraOrg_stru.fieldByName('ID').AsString;
  end
  else
  Begin
    ora_Sklad.SQl[2]:='where 1=1';
    ora_Uch.SQl[2]:='and 1=0';
    ora_Uch.SQl[3]:='and 1=0';
  end;
  ora_Uch.Open;
  cb_Uchastok.Value:='0';
  ora_Sklad.Open;
  cb_Sklad.Value:='0';
end;

procedure TfrmPRView.cbOrg_kindChange(Sender: TObject);
begin
  inherited;
  ora_Sklad.Close;
  if cbOrg_kind.Value='1' then
    ora_Sklad.SQl[3]:=' and org_kind_id not in (5,12)'
  else
    if cbOrg_kind.Value='5' then
      ora_Sklad.SQl[3]:=' and org_kind_id in (5,12)'
    else
      ora_Sklad.SQl[3]:=' and 1=1';
  ora_Sklad.Open;
  cb_Sklad.Value:='0';
end;

procedure TfrmPRView.acToXLSExecute(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
    if not FileExists(SaveDialog1.FileName) then
      begin
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,GridPlan,SaveDialog1.FileName,True);
        FileExecute(SaveDialog1.FileName,'','',esMaximized);
      end
    else
      if MessageDlg('Файл уже существует! Переписать?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,GridPlan,SaveDialog1.FileName,True);
          FileExecute(SaveDialog1.FileName,'','',esMaximized);
        end
end;

procedure TfrmPRView.cb_KorrClick(Sender: TObject);
begin
  inherited;
  if cb_Korr.Checked then cb_Korr.Caption:='Корректировки'
  else cb_Korr.Caption:='Все'
end;

procedure TfrmPRView.acCopyPlanRExecute(Sender: TObject);
begin
  if not oraPP.eof then
  with tfrmPRNew.create(self) do
  Begin
    EditId:=oraPP.FieldByName('ID').AsInteger;
    IsAdd:=true;
    showmodal;
    Free;
    f_db.ReQuery(oraPP,True);
  End;
end;

procedure TfrmPRView.GridPlanExit(Sender: TObject);
begin
  inherited;
  if oraPP.State=dsEdit then oraPP.Post;
end;

procedure TfrmPRView.TBEditItem1AcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  inherited;
  f_db.FilterAcceptText(GridPlan,filter2plan,NewText,Accept);
end;

procedure TfrmPRView.TBItem17Click(Sender: TObject);
begin
  inherited;
  f_db.FilterCurrentValue(GridPlan,filter2plan);
end;

procedure TfrmPRView.TBItem18Click(Sender: TObject);
begin
  inherited;
  f_db.FilterCLear(GridPlan,filter2plan);
end;

procedure TfrmPRView.TBItem21Click(Sender: TObject);
begin
  inherited;
  f_db.EditInMemo(GridPlan);
end;

procedure TfrmPRView.oraPPFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept:=f_db.AcceptFilterRecord(GridPlan,filter2plan);
end;

procedure TfrmPRView.oraPPAfterOpen(DataSet: TDataSet);
var i:integer;
begin
  inherited;
  if filter2plan.Count=0 then
  for i:=1 to oraPP.FieldCount do
  Begin
    filter2plan.Add('');
  end;
end;

procedure TfrmPRView.cb_UchastokChange(Sender: TObject);
begin
  inherited;
  ora_Sklad.Close;
  if (cb_Uchastok.Value<>'0') and (cbOrg_stru.Value<>'0') then
    ora_Sklad.SQl[4]:='and UCHASTOK_id='+ora_Uch.fieldByName('ID').AsString
  else
    ora_Sklad.SQl[4]:='and 1=1';
  ora_Sklad.Open;
  cb_Sklad.Value:='0';
end;

end.
