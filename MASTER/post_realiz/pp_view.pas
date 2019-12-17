unit pp_view;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, Grids, DBGridEh, ExtCtrls, StdCtrls,
  ComCtrls, RxLookup, Buttons, ActnList, XPStyleActnCtrls, ActnMan,MdiForm,
  TB2Item, TB2Dock, TB2Toolbar, DateUtils;

type
  TfrmPPView = class(Tf_MDIForm)
    oraSes: TOracleSession;
    oraPP: TOracleDataSet;
    dsPP: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    oraPPNAME_NPR: TStringField;
    oraPPSHORT_NAME: TStringField;
    oraPPVES: TFloatField;
    oraPPHRAN: TFloatField;
    oraPPD_PLAN: TStringField;
    oraPPDATE_PLAN: TDateTimeField;
    ActionManager1: TActionManager;
    acAddSvodPP: TAction;
    acApplySvodPP: TAction;
    cbPredpr: TRxDBLookupCombo;
    cbProd: TRxDBLookupCombo;
    oraKls_prod: TOracleDataSet;
    dsProd: TDataSource;
    oraKls_predpr: TOracleDataSet;
    dsPredpr: TDataSource;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    oraPPID_NPR: TStringField;
    oraPPPREDPR_ID: TIntegerField;
    oraPPPLANSTRU_ID: TFloatField;
    edDateFrom: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    edDateTo: TDateTimePicker;
    acDelSvodPP: TAction;
    acEditSvodPP: TAction;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    oraPPID: TFloatField;
    oraPlanStru: TOracleDataSet;
    dsPlanStru: TDataSource;
    cb_PlanStru: TRxDBLookupCombo;
    oraPPPLANSTRU_NAME: TStringField;
    oraPPIS_KORR: TIntegerField;
    cb_Korr: TCheckBox;
    procedure acApplySvodPPExecute(Sender: TObject);
    procedure acAddSvodPPExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh1SortMarkingChanged(Sender: TObject);
    procedure acEditSvodPPExecute(Sender: TObject);
    procedure acDelSvodPPExecute(Sender: TObject);
    procedure cb_KorrClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPPView: TfrmPPView;

implementation
uses pp_new, ForDB;
{$R *.dfm}

procedure TfrmPPView.acApplySvodPPExecute(Sender: TObject);
begin
  if cb_Korr.Checked then
    oraPP.SQl[10]:='and pp.is_korr=1'
  else
    oraPP.SQl[10]:='and 1=1';
  if cbPredpr.Value<>'0' then
     oraPP.SQl[11]:='and pp.supplier_id='+oraKls_predpr.fieldByName('id').AsString
  else
     oraPP.SQl[11]:='and 1=1';
  if cbProd.Value<>'0' then
     oraPP.SQl[12]:='and pp.prod_id_npr='+oraKls_prod.fieldByName('id_npr').AsString
  else
     oraPP.SQl[12]:='and 1=1';
  oraPP.SQl[13]:='and pp.date_plan>=TO_DATE('''+FormatDateTime('dd.mm.yyyy',edDateFrom.Date)+''',''dd.mm.yyyy'')';
  oraPP.SQl[14]:='and pp.date_plan<=TO_DATE('''+FormatDateTime('dd.mm.yyyy',edDateTo.Date)+''',''dd.mm.yyyy'')';
  if cb_PlanStru.Value<>'0' then
     oraPP.SQl[15]:='and pp.planstru_id='+oraPlanStru.fieldByName('id').AsString
  else
     oraPP.SQl[15]:='and 1=1';
  f_db.ReQuery(oraPP,True);
end;

procedure TfrmPPView.acAddSvodPPExecute(Sender: TObject);
begin
  with tfrmPPNew.create(self) do
  Begin
    EditId:=0;
    showmodal;
    Free;
    f_db.ReQuery(oraPP,True);
  End;
end;

procedure TfrmPPView.FormCreate(Sender: TObject);
begin
  f_db.LogonMasterSession(oraSes);
  oraKls_predpr.Open;
  oraKls_prod.Open;
  oraPlanStru.Open;
  edDateFrom.Date:=StartOfTheMonth(Now);
  edDateTo.Date:=EndOfTheMonth(Now);
  acApplySvodPPExecute(Sender);
end;

procedure TfrmPPView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  oraSes.Connected:=false;
  action:=caFree;
end;

procedure TfrmPPView.DBGridEh1SortMarkingChanged(Sender: TObject);
begin
  inherited;
  f_db.SortInGrid(oraPP,16,DBGridEh1);
end;

procedure TfrmPPView.acEditSvodPPExecute(Sender: TObject);
begin
  inherited;
  with tfrmPPNew.create(self) do
  Begin
    EditId:=oraPP.FieldByName('ID').AsInteger;
    showmodal;
    Free;
    f_db.ReQuery(oraPP,True);
  End;
end;

procedure TfrmPPView.acDelSvodPPExecute(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Удалить запись?','Внимание!',MB_YESNO)=IDYES then
  Begin
    oraPP.Delete;
  End;
end;

procedure TfrmPPView.cb_KorrClick(Sender: TObject);
begin
  inherited;
  if cb_Korr.Checked then cb_Korr.Caption:='Корректировки'
  else cb_Korr.Caption:='Все'
end;

end.
