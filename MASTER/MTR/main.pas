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
    MasterPath:String; // Путь к каталогу MASTER
    MasterCRPEPath, // Путь к библиотекам Crystal Reports
    MasterRPTPath, // Путь к каталогу с шаблонами rpt-отчетов
    MasterXLSPath, // Путь к каталогу с шаблонами xls-отчетов
    MasterDBFPath, // Путь к каталогу с шаблонами dbf-файлов
    MasterMDBPath:String; // Путь к каталогу с mdb-файлами}
//    EMailPath, // Путь к почтовому каталогу
//    TempNetPath, // Каталог временных файлов в сети
//    TempLocalPath:string; // Каталог временных файлов на локальной машине
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
  // После отправки сообщения
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
  // Читаем INI-файл
  IniName:=ExtractFilePath(ParamStr(0))+APPLICATION_NAME+'.ini';
  try
    Ini := TIniFile.Create(IniName);
    with Ini do
    begin
      // Читаем LOGIN
      //ReplInit.gUSERNAME:= ReadString('Common', 'Username', '');
      //ReplInit.gPASSWORD:= ReadString('Common', 'Password', '');
      //ReplInit.gDATABASE:= ReadString('Common', 'Database', '');
      //ReplInit.gIniFile:=IniName;
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

  TimerStart.Enabled:=true;

end;

end.
