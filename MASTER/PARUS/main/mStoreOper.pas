unit mStoreOper;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ToolEdit, Buttons, Mask, ExtCtrls, DB, OracleData,
  QExport3, QExport3DBF, Oracle, XPStyleActnCtrls, ActnList, ActnMan,
  Grids, DBGridEh, GridsEh;

type
  TfrmStoreOper = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    deBeg: TDateEdit;
    deEnd: TDateEdit;
    BitBtn1: TBitBtn;
    edPath: TDirectoryEdit;
    edStore: TEdit;
    Label4: TLabel;
    BitBtn3: TBitBtn;
    ActionManager1: TActionManager;
    oraParus: TOracleSession;
    ex: TQExport3DBF;
    oraStoreOper: TOracleDataSet;
    dsStoreOper: TDataSource;
    DBGridEh1: TDBGridEh;
    acFilter: TAction;
    acUnload: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acUnloadExecute(Sender: TObject);
    procedure acFilterExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStoreOper: TfrmStoreOper;

implementation

uses MAIN;

{$R *.dfm}

procedure TfrmStoreOper.FormCreate(Sender: TObject);
begin
  oraParus.LogonUsername := frmMain.oraParusMain.LogonUsername;
  oraParus.LogonPassword := frmMain.oraParusMain.LogonPassword;
  oraParus.LogonDatabase := frmMain.oraParusMain.LogonDatabase;
  oraParus.LogOn;
//  docsFull.SQL[4] := 'and v.ddocdate between TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deBeg.Date) + ''',''dd.mm.yyyy'')';
//  docsFull.SQL[5] := 'and TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deEnd.Date) + ''',''dd.mm.yyyy'')';
end;

procedure TfrmStoreOper.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  oraParus.Connected := false;
{
  If mLog.Lines.Count > 1 Then
  With frmMain.IdMessage Do
    Begin
      From.Text := oraParus.LogonUsername + '@' + oraParus.LogonDatabase;
      Sender.Text := oraParus.LogonUsername + '@' + oraParus.LogonDatabase;
      Subject := 'LUK-SNP Request for consummers Pechora';
      Body := mLog.Lines;
      frmMain.acSendmail.Execute;
    End;
    }
  action := caFree;

end;

procedure TfrmStoreOper.acUnloadExecute(Sender: TObject);
Var
  iFileHandle                           : Integer;
  s                                     : char;
begin
  If oraStoreOper.Active Then
  begin
  ex.DataSet := oraStoreOper;
  ex.FileName := edPath.Text + '\storeope.dbf';
  ex.Execute;
  //процедура смены кодовой страницы
  s := chr(201); //кодовая страница 1251 для foxpro
  iFileHandle := FileOpen(edPath.Text + '\storeope.dbf', fmOpenWrite);
  FileSeek(iFileHandle, 29, 0);
  FileWrite(iFileHandle, s, 1);
  fileClose(iFileHandle);
  end;
end;

procedure TfrmStoreOper.acFilterExecute(Sender: TObject);
begin
  If oraStoreOper.Active Then
    oraStoreOper.Close;
  oraStoreOper.SQL[14] := 'and DOPERDATE between TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deBeg.Date) + ''',''dd.mm.yyyy'')';
  oraStoreOper.SQL[15] := 'and TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deEnd.Date) + ''',''dd.mm.yyyy'')';
  oraStoreOper.SQL[16] := 'AND NSTORE in (select RN from AZSAZSLISTMT where AZS_NUMBER like'''+trim(edStore.Text)+'%'')';
  oraStoreOper.Open;
end;

end.
