// ============= Форма для Crystal Reports =================
// ==================== VEV ================================
unit sqlReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,UCrpe32,MDIForm;

type
  Tf_forReportSQL = class(Tf_MDIForm)
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
  f_forReportSQL: Tf_forReportSQL;

implementation

uses main;

{$R *.dfm}

constructor Tf_forReportSQL.Create(Owner:TComponent);
var
  i:integer;
begin
  inherited Create(Owner);
  Crpe:=TCRPE.Create(Self);
  Crpe.CrpePath:=f_main.MasterCRPEPath;
  i:=Crpe.LogOnServer.Add('SQLserver');
  with Crpe.LogOnServer[i] do
    begin
      DLLName := 'PDSSQL.DLL';
      ServerName := f_main.SQLDatabase;
      UserID := f_main.SQLUser;
      Password := f_main.SQLPassword;
      DatabaseName := 'ZARPSNP';  {Not usually req'd for Oracle}
      if not LogOn then
        ShowMessage('Error Logging on to Server'); 
    end;

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

procedure Tf_forReportSQL.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Crpe.CloseWindow;
//  Crpe.Free;
  Action:=caFree;
end;

procedure Tf_forReportSQL.FormResize(Sender: TObject);
var
  WinHandle: hWnd;
begin
  WinHandle := Crpe.ReportWindowHandle;
  SetWindowPos(WinHandle, HWND_TOP, 0, 0, Self.ClientWidth, Self.ClientHeight, SWP_NOZORDER);
end;


procedure Tf_forReportSQL.FormShow(Sender: TObject);
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

procedure Tf_forReportSQL.FormCreate(Sender: TObject);
begin
  inherited;
  Top:=0;
  Left:=0;
  Height:=f_main.ClientHeight-50;
  Width:=f_main.ClientWidth-20;
end;

end.
