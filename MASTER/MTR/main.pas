unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls,
  ExceptionLog, RXShell, AppEvent, ECore, Oracle;

const
  APPLICATION_NAME='MTRLOAD';

type
  Tf_main = class(TForm)
    TimerStart: TTimer;
    EurekaLog1: TEurekaLog;
    AppEvents1: TAppEvents;
    ora_Session: TOracleSession;
    procedure TimerStartTimer(Sender: TObject);
    procedure EurekaLog1ExceptionActionNotify(
      EurekaExceptionRecord: TEurekaExceptionRecord;
      EurekaAction: TEurekaActionType; var Execute: Boolean);
    procedure FormCreate(Sender: TObject);
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


uses inifiles, ForSystem, mtredit;
{$R *.dfm}

procedure Tf_main.TimerStartTimer(Sender: TObject);
var vStatus:integer;
begin
  TimerStart.Enabled:=false;

  with tF_mtredit.Create(Self) do
  Begin
    ShowModal;
    Free;
  end;

  close;
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
      //ReplInit.gUSERNAME:= ReadString('Common', 'Username', '');
      //ReplInit.gPASSWORD:= ReadString('Common', 'Password', '');
      //ReplInit.gDATABASE:= ReadString('Common', 'Database', '');
      //ReplInit.gIniFile:=IniName;
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

  TimerStart.Enabled:=true;

end;

end.
