unit ForREPL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

// Константы


type
  TF_Repl = class(TForm)
    conn_META:TDB_Conn;
    ReplSession: TReplSession;

    CurSite: integer; // Узел на котором выполняется текущая репликация
    ReplId: integer; // Текущая репликация
    FileName: string; // Закачиваемый файл
    Param1:string; // параметр 1
    Param2:string; // параметр 2
    Param3:string; // параметр 3
    ORAFlags: string; // Каталог флагов (загрузка)
    DelFlags: string; // Каталог флагов (удаление загруженных файлов)
    function InitRepl(ReplTAG:string;pFileName:string;pParam1,pParam2,pParam2:string):integer; // Инициализация репликации
    procedure DoneRepl;
  end;

implementation

uses main;

{$R *.dfm}

// Работы с коннекциями
function TDB_Conn.InitConnection(pType,pConnection,pDatabase,pUsername,pPassword:string;pReplSession:TReplSession):integer;
Begin
  Conn_Type:=pType;
  Conn_Str:=pConnection;
  Database:=pDatabase;
  Username:=pUsername;
  Password:=pPassword;
  ReplSession:=pReplSession;
  if ReplSession=nil then
    ReplSession:=DefaultSession; // Если сессия еще не инициализирована

  Result:=connOk;
  try
    If (Conn_Type='DOA') Then
    Begin
      Connection:=TOracleSession.Create
      TOracleSession(Connection).LogonDatabase:=Database;
      TOracleSession(Connection).LogonUserName:=Username;
      TOracleSession(Connection).LogonPassword:=Password;
      TOracleSession(Connection).Logon;
    End
    Else
    Begin
      Connection:=TADOConnection;
      TADOConnection(Connection).ConnectionString := Conn_Str;
      if Conn_Type<>'ORACLE' then
        TADOConnection(Connection).DefaultDatabase := Database
      else
        TADOConnection(Connection).DefaultDatabase := '';
      TADOConnection(Connection).Open;
    End;
  except
    on E: Exception do
    Begin
      If (Conn_Type='DOA') Then
        WriteToLog('Ошибка',E.Message+#13#10+'Не удалось получить доступ к базе данных '+NameConn+' через DOA: '+Database_conn+' '+Username_conn+' '+Password_conn,FlagMGRSRFind,ID,FILENAME)
      else If (Type_Conn='HLC') Then
             WriteToLog('Ошибка',E.Message+#13#10+'Не удалось получить доступ к базе данных '+NameConn+' через Halcion: '+Database_conn+' '+Username_conn+' '+Password_conn,FlagMGRSRFind,ID,FILENAME)
           Else
             WriteToLog('Ошибка',E.Message+#13#10+'Не удалось получить доступ к базе данных '+NameConn+' через ADO: '+Str_Conn+' '+Database_Conn,FlagMGRSRFind,ID,FILENAME);
      Result:=false;
    end;
  end;

End;

// Работа с журналом сессий

// Инициализация сессии:
// pApplMode - режим работы приложения
// pApplId - идентификатор приложения
// pIniFile - INI-файл с настройками приложения
function TApplSession.InitSession(pApplMode:integer;pApplId:string;pModuleId;pIniFile:string):integer;
var
  Reg: TIniFile;
  LogUseEnv:boolean;
  MailUseEnv:boolean;
Begin
  ApplMode:=pApplMode;
  ApplId:=pApplId;

  MailSend:=false;
  LogToFile:=true;
  LogToScreen:=(ApplMode=amVisual) or (ApplMode=amFull);
  LogUseEnv:=true;
  MailUseEnv:=true;
  LogSize:=1048576;
  LogPath:='';
  LogName:=APPLICATION_NAME+'.LOG';
  MailHost:='';
  MailPort:=0;
  MailFromName:='';
  MailFromAddr:='';
  MailErrorRecipient1:='';
  MailErrorRecipient2:='';
  MailErrorRecipient3:='';

  // Возьмем из IniFile настройки программы
  // по умолчанию (лог и отсылка почты)
  if pIniFile<>'' then
  try
    Reg := TIniFile.Create(pIniFile);

    MetaType:=Reg.ReadString('META','TYPE', MetaType);
    MetaConnection:=Reg.ReadString('META','CONNECTION', MetaConnection);
    MetaDatabase:=F_FileUtils.FillFilePath(Reg.ReadString('META','DATABASE', MetaDatabase));

    LogSize:=Reg.ReadInteger('LOG','ApplLogSize', LogSize );
    LogPath:=F_FileUtils.FillFilePath(Reg.ReadString('LOG','ApplLogPath', LogPath));
    LogName:=Reg.ReadString('LOG','ApplLogName', LogName);
    s:=Trim(UpperCase(Reg.ReadString('LOG','USE_ENVIRONMENT', '')));
    LogUseEnv:=((s='ДА') or (s='YES') or (s='TRUE') or (s='1') or (s='OK'));
    LogToFile:=(LogName<>'');

    MailHost:=Reg.ReadString('COMMON','MailHost', MailHost);
    MailPort:=Reg.ReadInteger('COMMON','MailPort',MailPort);
    MailFromName:=Reg.ReadString('COMMON','MailFromName', MailFromName);
    MailFromAddr:=Reg.ReadString('COMMON','MailFromAddr', MailFromAddr);
    MailErrorRecipient1:=Reg.ReadString('COMMON','ErrorRecipient1', MailErrorRecipient1);
    MailErrorRecipient2:=Reg.ReadString('COMMON','ErrorRecipient2', MailErrorRecipient2);
    MailErrorRecipient3:=Reg.ReadString('COMMON','ErrorRecipient3', MailErrorRecipient3);
    s:=Trim(UpperCase(Reg.ReadString('MAIL','USE_ENVIRONMENT', '')));
    MailUseEnv:=((s='ДА') or (s='YES') or (s='TRUE') or (s='1') or (s='OK'));
    MailSend:=(MailHost<>'') and (mailPort<>0) and (MailFromName<>'') and (MailFromAddr<>'') AND
              ((MailErrorRecipient1<>'') OR (MailErrorRecipient2<>'') OR (MailErrorRecipient3<>''));
  finally
    Reg.Free;
  end;

  // Инициализируем служебную коннекцию
  cnn_Meta:=TDB_Conn.Create;
  if NOT (cnn_Env.InitConnection(MetaType,MetaConnection,MetaDatabase,'','',Self)=connOk) then
    try
      cnn_Meta.Free;
    finally
      cnn_Meta:=nil;
    End
  else cnn_Meta.Logon;

  // Возьмем из таблицы ENVIRONMENT настройки программы
  // о почте (забивают значения из INI-файла)
  if MailUseEnv AND (cnn_Meta<>nil) then
  try
    q_Env:=TADOQuery.Create;
    q_Env.Connection:=cnn_Meta.Connection;
    q_Env.SQL.Add('SELECT ENV_VALUE FROM '+cnn_Meta.F_TABLENAME('ENVIRONMENT'));
    q_Env.SQL.Add(' WHERE '+cnn_Meta.F_UPPER+'(ENV_NAME) = '+cnn_Meta.F_UPPER+'(:ENV_NAME)');
    q_Env.SQL.Add('   AND ENV_TYPES_ID=1');
    q_Env.SQL.Add('   AND '+cnn_Meta.F_UPPER+'(APPL_NAME) = '''+APPLICATION_NAME+'''');
    q_Env.SQL.Add('   AND NETUSER IS NULL');

    // Почта
    s:=Get_Env('MailHost');
    if s<>'' then MailHost:=s;
    try
      i:=StrToInt(Get_Env('MailPort'));
    except
      i:=0
    end;
    if i<>0 then MailPort:=i;
    s:=Get_Env('MailFromName');
    if s<>'' then MailHost:=s;
    s:=Get_Env('MailFromAddr');
    if s<>'' then MailHost:=s;
    s:=Get_Env('MailErrorRecipient1');
    if s<>'' then MailHost:=s;
    s:=Get_Env('MailErrorRecipient2');
    if s<>'' then MailHost:=s;
    s:=Get_Env('MailErrorRecipient3');
    if s<>'' then MailHost:=s;
    MailSend:=(MailHost<>'') and (mailPort<>0) and (MailFromName<>'') and (MailFromAddr<>'') AND
              ((MailErrorRecipient1<>'') OR (MailErrorRecipient2<>'') OR (MailErrorRecipient3<>''));

  finally
    q_Env.Close;
    q_Env.SQL.Clear;
    q_Env.Free;
  end;

  // Возьмем из таблицы ENVIRONMENT настройки программы
  // о журнале событий (забивают значения из INI-файла)
  if LogUseEnv AND (cnn_Meta<>nil) then
  try
    q_Env:=TADOQuery.Create;
    q_Env.Connection:=cnn_Meta.Connection;
    q_Env.SQL.Add('SELECT ENV_VALUE FROM '+cnn_Meta.F_TABLENAME('ENVIRONMENT'));
    q_Env.SQL.Add(' WHERE '+cnn_Meta.F_UPPER+'(ENV_NAME) = '+cnn_Meta.F_UPPER+'(:ENV_NAME)');
    q_Env.SQL.Add('   AND ENV_TYPES_ID=1');
    q_Env.SQL.Add('   AND '+cnn_Meta.F_UPPER+'(APPL_NAME) = '''+APPLICATION_NAME+'''');
    q_Env.SQL.Add('   AND NETUSER IS NULL');

    // Log
    s:=Get_Env('ApplLogPath');
    if s<>'' then LogPath:=F_FileUtils.FillFilePath(s);
    s:=Get_Env('ApplLogName');
    if s<>'' then LogName:=s;
    try
      i:=StrToInt(Get_Env('ApplLogSize'));
    except
      i:=0
    end;
    if i<>0 then LogSize:=i;
    LogToFile:=(LogName<>'');

  finally
    q_Env.Close;
    q_Env.SQL.Clear;
    q_Env.Free;
  end;

  if cnn_Meta<>nil then cnn_Meta.Logoff;

  // Запишем в LOG информацию о начале сессии
  WriteToLog(pModuleID,sesStart,'Запуск приложения',0);
End;

// Запись в лог
procedure TApplSession.WriteToLog(pModule:string;pStatus:integer;pErrStr:string;pReplId:integer);
Begin

  // Пишем в БД
  if cnn_Meta<>nil then
  Begin
    q_tmp:=TADOQuery.Create;
    q_tmp.Connection:=cnn_Meta.Connection;
    if pStatus=sesStart then
    Begin
      q_tmp.SQL.Add('INSERT INTO '+cnn_Meta.F_TABLENAME('REPL_SESSION')+' VALUES(');
      q_tmp.SQL.Add(' WHERE '+cnn_Meta.F_UPPER+'(ENV_NAME) = '+cnn_Meta.F_UPPER+'(:ENV_NAME)');
    q_Env.SQL.Add('   AND ENV_TYPES_ID=1');
    q_Env.SQL.Add('   AND '+cnn_Meta.F_UPPER+'(APPL_NAME) = '''+APPLICATION_NAME+'''');
    q_Env.SQL.Add('   AND NETUSER IS NULL');



  if LogToFile then
  Begin
    {создание файла-протокола}
    IF NOT FileExists(LogPath+LogName) Then
    try
      FileClose(FileCreate(LogPath+LogName));
    except
      exit;
    end;

  {открытие файла-протокола}
  {$I-}
  AssignFile(ErrF, Protokol);
  FileMode := 2;  {Set file access to read/write }
  If GetFileSize(Protokol)>=ProtokolSize Then Rewrite(ErrF)
  Else Append(ErrF);
  {$I+}
  If (IOResult <> 0) then
  begin
    exit;
  end;

  IF (Title='Старт') then
  Begin
    WriteLn(ErrF,'-----------------------------------------------------------');
    WriteLn(ErrF,ErrStr+': '+DateTimeToStr(Now));
  End
  Else
    If (Title = 'Финиш') Then
    Begin
      WriteLn(ErrF,ErrStr+': '+DateTimeToStr(Now));
    end
    Else
    Begin
      WriteLn(ErrF,Title+': ' + DateTimeToStr(Now));
      WriteLn(ErrF,ErrStr);
    End;

  CloseFile(ErrF);

  If (Title<>'Внимание') AND (Title<>'Результат') AND (Title<>'Старт') AND (Title<>'Финиш')Then
  try
    if idSMTP.Connected then
      idSMTP.Disconnect
    else
      begin
        idSMTP.Host := MailHost;
        idSMTP.Port := MailPort;
        idSMTP.Username := MailUserID;
        idSMTP.Connect;
      end;

    if idSMTP.Connected then
    Begin
      with IdMessage do
      begin
        Clear;
        CharSet := 'windows-1251';
        ContentType:='text/plain';
        From.Text := MailFromName;
        Sender.Text := MailFromAddress;
        s:=Recipient1;
        if Recipient2<>'' then s:=s+';'+Recipient2;
        if Recipient3<>'' then s:=s+';'+Recipient3;
        if Recipient4<>'' then s:=s+';'+Recipient4;
        if Recipient5<>'' then s:=s+';'+Recipient5;
        Recipients.EMailAddresses := s;
        Subject := 'Error DBFTOORA.EXE';
        Body.Add(ParamStr(0)+CHR(13)+CHR(10)+'Дата и время:' + DateTimeToStr(Now)+CHR(13)+CHR(10)+ErrStr);
        idSMTP.Send(IdMessage);
        idSMTP.Disconnect;
      end;
(*    try
        taLogTask.Open;
        taLogTask.Append;
        taLogTask['ID']:=ID;
        taLogTask['FILENAME']:=FILENAME;
        taLogTask.FieldByName('LASTDATE').AsDateTime:=DATE;
        taLogTask.FieldByName('LASTTIME').AsString:=TimeToStr(TIME);
        taLogTask.FieldByName('ERROR').AsBoolean:=(Title='Ошибка');
        taLogTask.FieldByName('INFO').AsString:='Отправлено письмо на адрес:'+Recipient1+' и '+Recipient2;
        taLogTask.Post;
      except
        taLogTask.Cancel;
      end;*)
    end;
  finally
  end;

  If WriteToLogTask then
  try
    taLogTask.Open;
    taLogTask.Append;
    taLogTask['ID']:=ID;
    taLogTask['FILENAME']:=FILENAME;
    taLogTask.FieldByName('LASTDATE').AsDateTime:=DATE;
    taLogTask.FieldByName('LASTTIME').AsString:=TimeToStr(TIME);
    taLogTask.FieldByName('ERROR').AsBoolean:=(Title='Ошибка');
    taLogTask.FieldByName('INFO').AsString:=ErrStr;
    taLogTask.Post;
  except
    taLogTask.Cancel;
  end;
End;

// Работа с репликацией
function TRepl.InitRepl;
Begin
  // Пока не инициализировалась коннекция к хранилищу метаданных о репликациях,
  // необходимо иметь возможность хотя бы писать об ошибках в текстовый лог
  if DefaultSession=nil then
  Begin
    DefSession.Create;
  End;
  DefSession.SessionId:=0;
  DefSession.MailHost:=DefMailHost;
  DefSession.MailPort:=DefMailPort;
  DefSession.MailFromName:=DefMailFromName;
  DefSession.MailFromAddr:=DefMailFromAddr;
  DefSession.Recipient1:=DefRecipient1;
  DefSession.Recipient2:=DefRecipient2;
  DefSession.Recipient3:=DefRecipient3;
  DefSession.LogSize:=DefLogSize;
  DefSession.LogPath:=DefLogPath;
End;

end.
