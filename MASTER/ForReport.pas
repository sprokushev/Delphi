// ============= Форма для Crystal Reports =================
// ==================== VEV ================================
unit ForReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,UCrpe32,MDIForm;

type
  Tf_forReport = class(Tf_MDIForm)
    constructor Create(Owner:TComponent);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Crpe:TCrpe;
  end;

var
  f_forReport: Tf_forReport;

implementation

uses main;

{$R *.dfm}

constructor Tf_forReport.Create(Owner:TComponent);
var
  i:integer;
begin
  inherited Create(Owner);
  Crpe:=TCRPE.Create(Self);
  Crpe.CrpePath:=f_main.MasterCRPEPath;
  i:=Crpe.LogOnServer.Add('oracleserver');
  with Crpe.LogOnServer[i] do
    begin
      DLLName := 'PDSORA7.DLL'; {Crystal's Native Oracle Driver}
      ServerName := f_main.ora_session.LogonDatabase;
      UserID := f_main.ora_session.LogonUserName;
      Password := f_main.ora_session.LogonPassword;
      DatabaseName := '';  {Not usually req'd for Oracle}
      if not LogOn then
        ShowMessage('Error Logging on to Server');
    end;

{  Crpe.Connect.ServerName := 'BUH';
  Crpe.Connect.UserID := f_main.ora_session.LogonUserName;
  Crpe.Connect.Password := f_main.ora_session.LogonPassword;;
  Crpe.Connect.DatabaseName := f_main.ora_session.LogonDatabase;
  if not Crpe.Connect.Test then
    ShowMessage('Error Logging on to Server');
}
  Crpe.WindowState := wsNormal;
  Crpe.Output := toWindow;
  Crpe.WindowStyle.BorderStyle := bsNone;
  with Crpe.WindowButtonBar do
    begin
      Visible := True;
      ToolbarTips := True;
      ExportBtn:=True;
      NavigationCtls:=True;
      PrintBtn:=True;
      PrintSetupBtn:=True;
      ProgressCtls:=True;
      Visible:=True;
      ZoomCtl:=True;
      SearchBtn:=True;
      AllowDrillDown:=True;
    end;
  {Attach Crystal Window to Parent Window}
  Crpe.WindowParent := Self;
end;

procedure Tf_forReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Crpe.CloseWindow;
//  Crpe.Free;
  Action:=caFree;
end;

procedure Tf_forReport.FormResize(Sender: TObject);
var
  WinHandle: hWnd;
begin
  WinHandle := Crpe.ReportWindowHandle;
  SetWindowPos(WinHandle, HWND_TOP, 0, 0, Self.ClientWidth, Self.ClientHeight, SWP_NOZORDER);
end;


procedure Tf_forReport.FormShow(Sender: TObject);
begin
  inherited;
  {Crystal Window Size Settings}
  if not (WindowState=wsMaximized) then
    begin
      Crpe.WindowSize.Top := 0;
      Crpe.WindowSize.Left := 0;
      Crpe.WindowSize.Height := Self.Height - 30;
      Crpe.WindowSize.Width := Self.Width - 8;
    end
  else
    begin
      Crpe.WindowSize.Top := 0;
      Crpe.WindowSize.Left := 0;
      Crpe.WindowSize.Height := f_main.ClientHeight-30;
      Crpe.WindowSize.Width := f_main.ClientWidth - 8;
    end;
end;

procedure Tf_forReport.FormCreate(Sender: TObject);
begin
  inherited;
  Top:=0;
  Left:=0;
  Height:=f_main.ClientHeight-50;
  Width:=f_main.ClientWidth-20;
end;

end.
