unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Oracle, ForSESS,
  ExceptionLog, RXShell, AppEvent;

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
    procedure EurekaLog1ExceptionErrorNotify(
      EurekaExceptionRecord: TEurekaExceptionRecord;
      EurekaAction: TEurekaActionType; var Retry: Boolean);
  private
    { Private declarations }
    LogToMail:boolean; // Флаг отправки по почте
    MailHost:string; // SMTP-сервер
    MailPort:integer; // порт
    MailFromAddr:string; // почтовый адрес отправителя
    MailErrorRecipient1:string; {1-ый получатель письма с сообщением об ошибке }
    MailErrorRecipient2:string; {2-ый получатель письма с сообщением об ошибке }
    MailErrorRecipient3:string; {3-ый получатель письма с сообщением об ошибке }
    MailErrorRecipient4:string; {4-ый получатель письма с сообщением об ошибке }
    MailErrorRecipient5:string; {5-ый получатель письма с сообщением об ошибке }
    ApplLogPath: string;
  public
    { Public declarations }
  end;

var
  f_main: Tf_main;

implementation

uses inifiles, ReplInit, ForSystem;

{$R *.dfm}



procedure Tf_main.TimerStartTimer(Sender: TObject);
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
        Hint:=Caption;
        rxtiMain.Animated := True;
        sleep(10000);
        rxtiMain.Animated := False;
      End;
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
  // Читаем INI-файл
  IniName:=ExtractFilePath(ParamStr(0))+APPLICATION_NAME+'.ini';
  try
    Ini := TIniFile.Create(IniName);
    with Ini do
    begin
      // Читаем LOGIN
      ReplInit.gUSERNAME:= ReadString('Common', 'Username', 'SNP_REPL');
      ReplInit.gPASSWORD:= ReadString('Common', 'Password', 'SNP_REPL');
      ReplInit.gDATABASE:= ReadString('Common', 'Database', 'P5');
      ReplInit.gIniFile:=IniName;
      // Читаем настройки почты
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

  // Определяем режим
  if AnsiUpperCase(F_ForSystem.ParamStrByName('MODE'))='INIT' then
    ReplInit.gMODE:=amFull
  else
    ReplInit.gMODE:=amAuto
end;

procedure Tf_main.EurekaLog1ExceptionActionNotify(
  EurekaExceptionRecord: TEurekaExceptionRecord;
  EurekaAction: TEurekaActionType; var Execute: Boolean);
begin
  // Не показывать сообщений
  if EurekaAction = atShowingExceptionInfo then
  begin
    Execute := false;
  end;
  // Настроить почту
  if EurekaAction = atSendingEmail then
    begin
      Execute:=LogToMail;
      EurekaExceptionRecord.CurrentModuleOptions.SMTPHost:=MailHost;
      EurekaExceptionRecord.CurrentModuleOptions.SMTPPort:=MailPort;
      EurekaExceptionRecord.CurrentModuleOptions.SMTPFrom:=MailFromAddr;
      EurekaExceptionRecord.CurrentModuleOptions.EMailAddresses:=MailErrorRecipient1+';'+MailErrorRecipient2+';'+MailErrorRecipient3+';'+MailErrorRecipient4+';'+MailErrorRecipient5;
    end;
  // LOG-файл
  if EurekaAction = atSavingLogFile then
  Begin
    Execute := true;
    EurekaExceptionRecord.CurrentModuleOptions.OutputPath:=ApplLogPath;
  end;
end;

procedure Tf_main.EurekaLog1ExceptionErrorNotify(
  EurekaExceptionRecord: TEurekaExceptionRecord;
  EurekaAction: TEurekaActionType; var Retry: Boolean);
begin
  Retry:=false;
end;

end.
