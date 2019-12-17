unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Oracle, ForSESS,
  ExceptionLog, RXShell, AppEvent, ECore;

const
  APPLICATION_NAME='REPLICATOR';

type
  Tf_main = class(TForm)
    TimerStart: TTimer;
    EurekaLog1: TEurekaLog;
    ora_Session: TOracleSession;
    AppEvents1: TAppEvents;
    rxtiMain: TRxTrayIcon;
    procedure TimerStartTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EurekaLog1ExceptionActionNotify(
      EurekaExceptionRecord: TEurekaExceptionRecord;
      EurekaAction: TEurekaActionType; var Execute: Boolean);
  private
    { Private declarations }
    LogToMail:boolean; // ���� �������� �� �����
    MailHost:string; // SMTP-������
    MailPort:integer; // ����
    MailFromAddr:string; // �������� ����� �����������
    MailErrorRecipient1:string; {1-�� ���������� ������ � ���������� �� ������ }
    MailErrorRecipient2:string; {2-�� ���������� ������ � ���������� �� ������ }
    MailErrorRecipient3:string; {3-�� ���������� ������ � ���������� �� ������ }
    MailErrorRecipient4:string; {4-�� ���������� ������ � ���������� �� ������ }
    MailErrorRecipient5:string; {5-�� ���������� ������ � ���������� �� ������ }
    ApplLogPath: string;
  public
    { Public declarations }
    // ����������
    MasterPath:String; // ���� � �������� MASTER
    MasterCRPEPath, // ���� � ����������� Crystal Reports
    MasterRPTPath, // ���� � �������� � ��������� rpt-�������
    MasterXLSPath, // ���� � �������� � ��������� xls-�������
    MasterDBFPath, // ���� � �������� � ��������� dbf-������
    MasterMDBPath:String; // ���� � �������� � mdb-�������}
//    EMailPath, // ���� � ��������� ��������
//    TempNetPath, // ������� ��������� ������ � ����
//    TempLocalPath:string; // ������� ��������� ������ �� ��������� ������
    UserAdmin:boolean;
  end;

var
  f_main: Tf_main;

implementation

uses inifiles, ReplInit, ForSystem;

{$R *.dfm}



procedure Tf_main.TimerStartTimer(Sender: TObject);
var vStatus:integer;
begin
  TimerStart.Enabled:=false;

  with tf_ReplInit.Create(Self) do
  Begin
    if ReplInit.gMODE=amFull then
    Begin
      ShowModal;
    end
    else
    Begin
      if oraSess.Connected then
      Begin
        rxtiMain.Animated := True;
        // ������ ����������
        // �������� ������ �������� �� ������� �������� ��������
        vStatus:=oraPackage.CallFloatFunction('EXECUTE_READY_CALL',[ReplSession.GetSessionId]);
        if (vStatus<>sesReplRowNotFound) and replMain then
        Begin
          // �������� ��������� ���������� ��� ������� ������ �������� ��������
          ExecuteRepl(vMODE,'CALL_IN')
        end;
        // �������� ��������� ���������� ���������

        if AnsiUpperCase(F_ForSystem.ParamStrByName('MODE'))='FULL_IMPORT' then
          ExecuteRepl(vMODE,'FULL_IMPORT')
        else
        if AnsiUpperCase(F_ForSystem.ParamStrByName('MODE'))='FULL_EXPORT' then
          ExecuteRepl(vMODE,'FULL_EXPORT')
        else
          ExecuteRepl(vMODE,'FULL');
        rxtiMain.Animated := False;
      End;
      Close;
    End;
    Free;
  end;

  close;
end;

procedure Tf_main.FormCreate(Sender: TObject);
var
  ini:TIniFile;
  IniName:string;
begin
  // ������ INI-����
  IniName:=ExtractFilePath(ParamStr(0))+APPLICATION_NAME+'.ini';
  try
    Ini := TIniFile.Create(IniName);
    with Ini do
    begin
      // ������ LOGIN
      ReplInit.gUSERNAME:= ReadString('Common', 'Username', '');
      ReplInit.gPASSWORD:= ReadString('Common', 'Password', '');
      ReplInit.gDATABASE:= ReadString('Common', 'Database', '');
      ReplInit.gIniFile:=IniName;
      // ������ ��������� �����
      MailHost:=ReadString('MAIL','MailHost','');
      MailPort:=ReadInteger('MAIL','MailPort',0);
      MailFromAddr:=ReadString('MAIL','MailFromAddr','');
      MailErrorRecipient1:=ReadString('MAIL','MailErrorRecipient1', '');
      MailErrorRecipient2:=ReadString('MAIL','MailErrorRecipient2', '');
      MailErrorRecipient3:=ReadString('MAIL','MailErrorRecipient3', '');
      MailErrorRecipient4:=ReadString('MAIL','MailErrorRecipient4', '');
      MailErrorRecipient5:=ReadString('MAIL','MailErrorRecipient5', '');
      LogToMail:=(MailHost<>'') and (mailPort<>0) and (MailFromAddr<>'') AND
              ((MailErrorRecipient1<>'') OR (MailErrorRecipient2<>'') OR (MailErrorRecipient3<>'') OR
               (MailErrorRecipient4<>'') OR (MailErrorRecipient5<>''));
      ApplLogPath:=ReadString('LOG','ApplLogPath', '');
    end;
    Ini.Free;
  except
  end;

  // ���������� �����
  if AnsiUpperCase(F_ForSystem.ParamStrByName('MODE'))='INIT' then
    ReplInit.gMODE:=amFull
  else
    ReplInit.gMODE:=amAuto;

  rxtiMain.Hint:=Caption;
  TimerStart.Enabled:=true;

end;

procedure Tf_main.EurekaLog1ExceptionActionNotify(
  EurekaExceptionRecord: TEurekaExceptionRecord;
  EurekaAction: TEurekaActionType; var Execute: Boolean);
begin
  // �� ���������� ���������
  if EurekaAction = atShowingExceptionInfo then
  begin
    Execute := false;
  end;
  // ��������� �����
  if EurekaAction = atSendingEmail then
    begin
      Execute:=LogToMail;
      EurekaExceptionRecord.CurrentModuleOptions.SMTPHost:=MailHost;
      EurekaExceptionRecord.CurrentModuleOptions.SMTPPort:=MailPort;
      EurekaExceptionRecord.CurrentModuleOptions.SMTPFrom:=MailFromAddr;
      EurekaExceptionRecord.CurrentModuleOptions.EMailAddresses:=MailErrorRecipient1+';'+MailErrorRecipient2+';'+MailErrorRecipient3+';'+MailErrorRecipient4+';'+MailErrorRecipient5;
    end;
  // LOG-����
  if EurekaAction = atSavingLogFile then
  Begin
    Execute := true;
    EurekaExceptionRecord.CurrentModuleOptions.OutputPath:=ApplLogPath;
  end;
  // ����� �������� ���������
  if EurekaAction = atSentEmail then
  Begin
    ForceApplicationTermination(tbTerminate);
  End;

end;

end.
