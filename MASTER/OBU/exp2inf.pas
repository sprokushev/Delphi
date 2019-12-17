unit exp2inf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MdiForm,
  Dialogs, ExtCtrls, Oracle, DB, OracleData, Mask, DBCtrlsEh, DBLookupEh,
  StdCtrls, Grids, DBGridEh, ToolEdit, Buttons, TB2Item, TB2Dock,
  TB2Toolbar, XPStyleActnCtrls, ActnList, ActnMan,DBGridEhImpExp;

type
  TfrmExp2INFIN = class(Tf_MDIForm)
    oraSes: TOracleSession;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    gExp2Inf: TDBGridEh;
    QueryList: TMemo;
    oraExpList: TOracleDataSet;
    oraExp2Inf: TOracleDataSet;
    dsExpList: TDataSource;
    dsExp2Inf: TDataSource;
    oraExpListKLS_NAME: TStringField;
    oraExpListQUERY_TEXT: TStringField;
    oraExpListFNAME: TStringField;
    ActionManager1: TActionManager;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBControlItem1: TTBControlItem;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    TBControlItem2: TTBControlItem;
    BitBtn1: TBitBtn;
    TBDock2: TTBDock;
    TBToolbar2: TTBToolbar;
    deDateBegin: TDateEdit;
    TBControlItem3: TTBControlItem;
    deDateEnd: TDateEdit;
    TBControlItem4: TTBControlItem;
    BitBtn2: TBitBtn;
    TBControlItem5: TTBControlItem;
    BitBtn3: TBitBtn;
    TBControlItem6: TTBControlItem;
    acE2IOpen: TAction;
    acE2IExecute: TAction;
    acE2IUnload: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acE2IOpenExecute(Sender: TObject);
    procedure acE2IExecuteExecute(Sender: TObject);
    procedure acE2IUnloadExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExp2INFIN: TfrmExp2INFIN;

implementation

uses main,ForDB;
{$R *.dfm}

procedure TfrmExp2INFIN.FormCreate(Sender: TObject);
begin
  inherited;
  // Все открываем
  f_db.LogonMasterSession(oraSes);
  f_db.ReQuery(oraExpList,false);
end;

procedure TfrmExp2INFIN.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  orases.Commit;
  oraSes.Connected:=false;
  action:=caFree;
end;

procedure TfrmExp2INFIN.acE2IOpenExecute(Sender: TObject);
begin
  inherited;
QueryList.Text:=oraExpList.fieldByName('query_text').AsString;
end;

procedure TfrmExp2INFIN.acE2IExecuteExecute(Sender: TObject);
begin
  inherited;
if oraExp2Inf.Active then oraExp2Inf.Close;
oraExp2Inf.SQL:=QueryList.Lines;
oraExp2Inf.SetVariable(':db',deDateBegin.Text);
oraExp2Inf.SetVariable(':de',deDateEnd.Text);
oraExp2Inf.Open;
end;

procedure TfrmExp2INFIN.acE2IUnloadExecute(Sender: TObject);
begin
  inherited;
  SaveDBGridEhToExportFile(TDBGridEhExportAsXLS, gExp2Inf, 'c:\'+oraExpList.fieldByName('fname').AsString+'.xls', True);
  ShowMessage('Сформирован файл c:\'+oraExpList.fieldByName('fname').AsString+'.xls');
end;

end.
