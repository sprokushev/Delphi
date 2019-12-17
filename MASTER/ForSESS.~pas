unit ForSESS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Oracle, IdMessage, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP
  {$IFDEF VER90}
    ,IdExplicitTLSClientServerBase, IdSMTPBase
  {$ENDIF};

// Константы
const
  // Режимы работы журнала событий
  amDefault=0; // По умолчанию (заданный при создании сессии)
  amAuto=1; //Автоматический: все сообщения в лог и текстовый файл
  amVisual=2; //Интерактивный: все сообщения в лог и на экран
  amFull=3; //Полный: все сообщения в лог, в текстовый файл и на экран
  amMail=4; //Только сообщение по почте

  MAX_ERRORS=10;

  // Статусы сессии
  sesUnknown=0; // Неопределенное состояние
  sesOk=1; // Ошибок нет
  sesInfo=2; // Ошибок нет, но нужно записать в лог
  sesReplView=-99; // Логин в режиме просмотра
  sesError=-100; // Есть ошибки
  sesErrorNonCritical=-2; // Есть ошибки, но они не критические
  sesReplActive=-101; // Ошибка при логине - такой пользователь уже прилогинился
  sesReplInit=-102; // Ошибка при чтении настроек репликации
  sesReplRowNotFound=-3; // Ошибка при построении оператора: в таблице репликации есть строка, для которой нет записи в реплицируемой таблице
  sesReplSqlEmpty=-105; // Сформированный оператор - пустой
  sesReplDblinkNotSend=-104; // Ошибка передачи операторов через DBLINK
  sesReplNoRepl=-106; // Ошибка при логине - пользователь не имеет права запускать репликацию
  sesReplCallError=-110; // Статус исполнения оператора: ошибка
  sesReplUserDeleted=-111; // Оператор удален пользователем на текущем узле
  sesReplDestUserDeleted=-112; // Оператор удален пользователем на узле-назначении
  sesReplUserRestored=-11; // Оператор восстановлен пользователем на текущем узле
  sesReplDestUserRestored=-113; // Оператор восстановлен пользователем на узле-назначении

  sesStart=1000; // Старт
  sesFinish=1001; // Финиш

// Журнал событий приложения
type
  TApplSession = class(TForm)
    pck_Session: TOraclePackage;
    IdSMTP: TIdSMTP;
    IdMessage: TIdMessage;
  private
    // Идентификация сессии
    SessionId:integer; // Текущая сессия

    // Идентификация приложения
    ApplId:string; // Приложение
    ApplModeDefault:integer; //Режим работы

    // Для отправки сообщений по почте
    LogToMail:boolean; // Флаг отправки по почте
    MailHost:string; // SMTP-сервер
    MailPort:integer; // порт
    MailFromName:string; // отправитель
    MailFromAddr:string; // почтовый адрес отправителя
    MailErrorRecipient1:string; {1-ый получатель письма с сообщением об ошибке }
    MailErrorRecipient2:string; {2-ый получатель письма с сообщением об ошибке }
    MailErrorRecipient3:string; {3-ый получатель письма с сообщением об ошибке }
    MailErrorRecipient4:string; {4-ый получатель письма с сообщением об ошибке }
    MailErrorRecipient5:string; {5-ый получатель письма с сообщением об ошибке }

    // Для записи в текстовый лог
    LogToFile:boolean; // Флаг записи в файл
    LogSize: longint; {Максимальный размер файла-журнала}
    LogPath: string; {Путь к файлу-журналу}
    LogName: string; {Имя файла-журнала}
    ErrF:TextFile;
    ora_Session:TOracleSession;  // Сессия Oracle к хранилищу метаданных
    ora_Use:boolean;  // Использовать Oracle;


  public
    // Методы
    function GetSessionId:integer;
    function InitSession(pApplMode:integer;pApplId:string;pSchema:string;pModuleId:string;pIniFile:string;pDescript:string;pOra_Session:TOracleSession):integer; // Инициализация сессии
    procedure WriteToLog(pApplMode:integer;pModuleId:string;pStatus:integer;pErrStr:string;pSiteRN:integer;pMailRecipient:string;pErrCounter:integer=0); // Запись в журнал
    procedure DoneSession(pModuleId:string); // Закрытие сессии и освобождение памяти
  end;

implementation

uses inifiles, ForSystem, ForFiles, ForEnv, FileUtil;

{$R *.dfm}

// Работа с журналом сессий

// ID текущей сессии
function TApplSession.GetSessionId:integer;
Begin
  Result:=SessionId;
end;

// Инициализация сессии:
// pApplMode - режим работы приложения
// pApplId - идентификатор приложения
// pModuleId - модуль приложения
// pIniFile - INI-файл с настройками приложения
function TApplSession.InitSession(pApplMode:integer;pApplId:string;pSchema:string;pModuleId:string;pIniFile:string;pDescript:string;pOra_Session:TOracleSession):integer;
var
  Reg: TIniFile;
  LogUseEnv:boolean;
  MailUseEnv:boolean;
  s:string;
  i:integer;
Begin
  ApplModeDefault:=pApplMode;
  ApplId:=pApplId;


  if pOra_Session=nil then
  Begin
    ora_Use:=false;
    ora_Session:=nil;
  End
  else if NOT pOra_Session.Connected then
       Begin
         ora_Use:=false;
         ora_Session:=nil;
       end
       else
       Begin
         ora_Use:=true;
         ora_Session:=pOra_Session;
       End;

  LogToMail:=false;
  LogToFile:=true;
  LogUseEnv:=true;
  MailUseEnv:=true;
  LogSize:=1048576;
  LogPath:='';
  LogName:=pApplId+'.LOG';
  MailHost:='';
  MailPort:=0;
  MailFromName:='';
  MailFromAddr:='';
  MailErrorRecipient1:='';
  MailErrorRecipient2:='';
  MailErrorRecipient3:='';
  MailErrorRecipient4:='';
  MailErrorRecipient5:='';

  Result:=sesOk;

  // Возьмем из IniFile настройки программы
  // по умолчанию (лог и отсылка почты)
  if pIniFile<>'' then
  try
    Reg := TIniFile.Create(pIniFile);

    LogSize:=Reg.ReadInteger('LOG','ApplLogSize', LogSize );
    LogPath:=F_FileUtils.FillFilePath(Reg.ReadString('LOG','ApplLogPath', LogPath),true);
    LogName:=Reg.ReadString('LOG','ApplLogName', LogName);
    s:=Trim(UpperCase(Reg.ReadString('LOG','USE_ENVIRONMENT', '')));
    LogUseEnv:=((s='ДА') or (s='YES') or (s='TRUE') or (s='1') or (s='OK'));
    LogToFile:=(LogName<>'');

    MailHost:=Reg.ReadString('MAIL','MailHost', MailHost);
    MailPort:=Reg.ReadInteger('MAIL','MailPort',MailPort);
    MailFromName:=Reg.ReadString('MAIL','MailFromName', MailFromName);
    MailFromAddr:=Reg.ReadString('MAIL','MailFromAddr', MailFromAddr);
    MailErrorRecipient1:=Reg.ReadString('MAIL','MailErrorRecipient1', MailErrorRecipient1);
    MailErrorRecipient2:=Reg.ReadString('MAIL','MailErrorRecipient2', MailErrorRecipient2);
    MailErrorRecipient3:=Reg.ReadString('MAIL','MailErrorRecipient3', MailErrorRecipient3);
    MailErrorRecipient4:=Reg.ReadString('MAIL','MailErrorRecipient4', MailErrorRecipient4);
    MailErrorRecipient5:=Reg.ReadString('MAIL','MailErrorRecipient5', MailErrorRecipient5);
    s:=Trim(UpperCase(Reg.ReadString('MAIL','USE_ENVIRONMENT', '')));
    MailUseEnv:=((s='ДА') or (s='YES') or (s='TRUE') or (s='1') or (s='OK'));
    LogToMail:=(MailHost<>'') and (mailPort<>0) and (MailFromName<>'') and (MailFromAddr<>'') AND
              ((MailErrorRecipient1<>'') OR (MailErrorRecipient2<>'') OR (MailErrorRecipient3<>'') OR
               (MailErrorRecipient4<>'') OR (MailErrorRecipient5<>''));
  finally
    Reg.Free;
  end;

  // Возьмем из таблицы ENVIRONMENT настройки программы
  // о почте (забивают значения из INI-файла)
  if MailUseEnv AND (ora_use) then
  begin
    // Почта
    MailHost:=F_Env.GetEnv(ApplId,pSchema,'MAIL','MailHost',ora_Session);
    try
      i:=StrToInt(F_Env.GetEnv(ApplId,pSchema,'MAIL','MailPort',ora_Session));
    except
      i:=0
    end;
    MailPort:=i;
    MailFromName:=F_Env.GetEnv(ApplId,pSchema,'MAIL','MailFromName',ora_Session);
    MailFromAddr:=F_Env.GetEnv(ApplId,pSchema,'MAIL','MailFromAddr',ora_Session);
    MailErrorRecipient1:=F_Env.GetEnv(ApplId,pSchema,'MAIL','MailErrorRecipient1',ora_Session);
    MailErrorRecipient2:=F_Env.GetEnv(ApplId,pSchema,'MAIL','MailErrorRecipient2',ora_Session);
    MailErrorRecipient3:=F_Env.GetEnv(ApplId,pSchema,'MAIL','MailErrorRecipient3',ora_Session);
    MailErrorRecipient4:=F_Env.GetEnv(ApplId,pSchema,'MAIL','MailErrorRecipient4',ora_Session);
    MailErrorRecipient5:=F_Env.GetEnv(ApplId,pSchema,'MAIL','MailErrorRecipient5',ora_Session);
    LogToMail:=(MailHost<>'') and (mailPort<>0) and (MailFromName<>'') and (MailFromAddr<>'') AND
              ((MailErrorRecipient1<>'') OR (MailErrorRecipient2<>'') OR (MailErrorRecipient3<>'') OR
               (MailErrorRecipient4<>'') OR (MailErrorRecipient5<>''));
  end;

  // Возьмем из таблицы ENVIRONMENT настройки программы
  // о журнале событий (забивают значения из INI-файла)
  if LogUseEnv AND (ora_use) then
  begin
    // Log
    LogPath:=F_FileUtils.FillFilePath(F_Env.GetEnv(ApplId,pSchema,'LOG','ApplLogPath',ora_Session),true);
    LogName:=F_Env.GetEnv(ApplId,pSchema,'LOG','ApplLogName',ora_Session);
    try
      i:=StrToInt(F_Env.GetEnv(ApplId,pSchema,'LOG','ApplLogSize',ora_Session));
    except
      i:=0
    end;
    LogSize:=i;
    LogToFile:=(LogName<>'');
  end;

  // Инициализируем сессию в БД
  SessionId:=0;
  if (ora_use) then
  try
    pck_Session.Session:=ora_Session;
    SessionId:=pck_Session.CallIntegerFunction('StartSession',[pDescript,ApplId,pModuleId]);
  except
    on E:Exception do
    begin
      SessionId:=0;
      Result:=sesErrorNonCritical;
    end;
  end;

  WriteToLog(ApplModeDefault,pModuleId,sesStart,'',0,'');
  Result:=sesOk;
End;

// Запись в лог
// pModuleId - модуль приложения
// pStatus - статус события
// pErrStr - описание события
// pReplId - ID репликации
procedure TApplSession.WriteToLog(pApplMode:integer;pModuleId:string;pStatus:integer;pErrStr:string;pSiteRN:integer;pMailRecipient:string;pErrCounter:integer=0);
var IsOk:boolean;
    ErrorText:string;
    s:string;
    ApplMode:integer;
Begin

 LogToMail:=(MailHost<>'') and (mailPort<>0) and (MailFromName<>'') and (MailFromAddr<>'') AND
            ((MailErrorRecipient1<>'') OR (MailErrorRecipient2<>'') OR (MailErrorRecipient3<>'') OR
             (MailErrorRecipient4<>'') OR (MailErrorRecipient5<>'') OR (pMailRecipient<>''));

  if pApplMode=amDefault then
    ApplMode:=ApplModeDefault
  Else
    ApplMode:=pApplMode;
  IsOk:=true;
  ErrorText:='Статус события: ' + IntToStr(pStatus)+CHR(13)+CHR(10)+
             'Компьютер: '+F_ForSystem.GetTerminalName(true)+CHR(13)+CHR(10)+
             'Приложение: '+ParamStr(0)+CHR(13)+CHR(10)+
             'Moдуль: '+pModuleId+CHR(13)+CHR(10)+
             'Пользователь: '+F_ForSystem.GetUserName(true)+CHR(13)+CHR(10)+
             'Дата и время: ' + DateTimeToStr(Now)+CHR(13)+CHR(10)+CHR(13)+CHR(10)+
             pErrStr;

  // Пишем в БД
  if pApplMode<>amMail then
  if (pStatus<>sesStart) and (pStatus<>sesFinish) then
  if (ora_use) and (SessionId<>0) and (pck_Session<>nil) then
  try
    pck_Session.CallIntegerFunction('WriteToLog',[SessionId,pStatus,ErrorText,pSiteRN,pModuleId]);
  except
  end;

  // Пишем в файл
  if pApplMode<>amMail then
  if LogToFile then
  Begin
    // создание файла-протокола
    IF NOT FileExists(LogPath+LogName) Then
    try
      FileClose(FileCreate(LogPath+LogName));
      IsOk:=true;
    except
      IsOk:=false;
    end;

    If IsOk then
    Begin
      //открытие файла-протокола
      {$I-}
      AssignFile(ErrF, LogPath+LogName);
      FileMode := 2;
      If GetFileSize(LogPath+LogName)>=LogSize Then Rewrite(ErrF)
      Else Append(ErrF);
      {$I+}
      if (IOResult = 0) then
      Begin
        case pStatus of
          sesStart:
            Begin
              WriteLn(ErrF,'-----------------------------------------------------------');
              WriteLn(ErrF,'Запуск приложения '+ApplId+': '+DateTimeToStr(Now)+' пользователь: '+F_ForSystem.GetUserName(true));
            End;
          sesFinish:
            Begin
              WriteLn(ErrF,'Завершение приложения '+ApplId+': '+DateTimeToStr(Now)+' пользователь: '+F_ForSystem.GetUserName(true));
              WriteLn(ErrF);
            end;
          sesOk:
            Begin
              IF ApplId='REPLICATOR' THEN
              Begin
                WriteLn(ErrF,DateTimeToStr(Now)+' '+pErrStr);
              End;
            End;
          else
            Begin
              WriteLn(ErrF);
              WriteLn(ErrF,ErrorText);
              WriteLn(ErrF);
            End;
        end;
        CloseFile(ErrF);
      end;
    end;
  end;

  // Отправляем по почте
  if LogToMail and (idSMTP<>nil) and (idMessage<>nil) then
  if (pStatus<=sesError) then
  try
    if idSMTP.Connected then idSMTP.Disconnect;
    idSMTP.Host := MailHost;
    idSMTP.Port := MailPort;
    idSMTP.Username := F_ForSystem.CheckOnNames(MailFromName);
    idSMTP.Connect;

    if idSMTP.Connected then
    Begin
      with IdMessage do
      begin
        Clear;
        CharSet := 'windows-1251';
        ContentType:='text/plain';
        From.Text := F_ForSystem.CheckOnNames(MailFromName);
        Sender.Text := F_ForSystem.CheckOnNames(MailFromAddr);
        s:=pMailRecipient;
        if MailErrorRecipient1<>'' then s:=s+';'+MailErrorRecipient1;
        if MailErrorRecipient2<>'' then s:=s+';'+MailErrorRecipient2;
        if MailErrorRecipient3<>'' then s:=s+';'+MailErrorRecipient3;
        if MailErrorRecipient4<>'' then s:=s+';'+MailErrorRecipient4;
        if MailErrorRecipient5<>'' then s:=s+';'+MailErrorRecipient5;
        Recipients.EMailAddresses := s;
        Subject := 'Application Error';
        Body.Add(ErrorText);
        idSMTP.Send(IdMessage);
        idSMTP.Disconnect;
      end;
    end;
  except
  end;

  // Выводим на экран
  if (ApplMode=amVisual) or (ApplMode=amFull) then
  if (pStatus<=sesError) then
  Begin
//    Application.NormalizeTopMosts;
    if pErrCounter<MAX_ERRORS then
      Application.MessageBox(PChar(ErrorText),'Внимание! Ошибка!',MB_OK)
    else
      if Application.MessageBox(PChar(ErrorText),'Внимание! Повторяющаяся ошибка! Нажмите ABORT для завершения приложения!',MB_ABORTRETRYIGNORE	)=IDABORT then
      Begin
        System.Halt;
      end;
//    Application.RestoreTopMosts;
  end;

End;

// Закрытие сессии
procedure TApplSession.DoneSession(pModuleId:string);
Begin
  WriteToLog(ApplModeDefault,pModuleId,sesFinish,'',0,'');

  // ДеИнициализируем сессию в БД
  if (ora_use) and (SessionId<>0) and (pck_Session<>nil) then
  try
    pck_Session.CallProcedure('FinishSession',[SessionId,pModuleId]);
  except
    on E:EOracleError do
    Begin
      if (E.ErrorCode = 3114) or (E.ErrorCode = 12571) then
      Begin
        pck_Session.Session.LogOff;
        pck_Session.Session.LogOn;
        try
          pck_Session.CallProcedure('FinishSession',[SessionId,pModuleId]);
        except
        end;
      end;
    end;
  end;

  SessionId:=0;
  Free;
End;


end.
