unit main_srv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPServer, StdCtrls, ICMP, Math,
  DB, ADODB, Oracle, IniFiles;

const
  APPLICATION_NAME='TESTIP';
  APPLICATION_VERSION='beta';

const
  MAX_PING=5;

type
  TServiceInfo = record
    Name:string[50];
    Host:string[50];
    Tip:string[20];
    Query:string[250];
    Caption:TLabel;
    Result:TMemo;
  end;

  Tf_main = class(TForm)
    IdTCPServer: TIdTCPServer;
    PingICMP: Ticmp;
    ADOQuery: TADOQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure IdTCPServerExecute(AThread: TIdPeerThread);
  private
    { Private declarations }
  public
    { Public declarations }
    fServerRunning : boolean;
    MasterConn:string;
    BitumConn:string;
    DispsvodkaConn:string;
    PasportConn:string;
    InfinConn:string;
    ARSCISConn:string;
    DBFConn:string;
    function StartServer:Boolean;
    function StopServer:Boolean;
    function FillFilePath(f_name:string; IsCheck:boolean):string;
  end;

var
  f_main: Tf_main;

implementation

{$R *.dfm}


{ Дополнить маршрут к файлу }
function Tf_main.FillFilePath(f_name:string; IsCheck:boolean):string;
var i:integer;
Begin
  if f_name='' then
    Result:=''
  else
  Begin
    if f_name[Length(f_name)]<>'\' then f_name:=f_name+'\';
    If IsCheck Then
    Begin
      {Проверить наличие и создать каталог}
      CreateDir(f_name);
    End;
    Result:=f_name;
  end;
End;

function Tf_main.StartServer:boolean;
begin
  if not StopServer then
  begin
    Result := false;
    fServerRunning := result;
    exit;
  end;

  try
    IdTCPServer.Active := true;
    result := IdTCPServer.Active;
    fServerRunning := result;
  except
    on E : Exception do
    begin
//    fErrors.append(E.Message);
    Result := false;
    fServerRunning := result;
    end;
  end;
end;

function Tf_main.StopServer: Boolean;
begin
  IdTCPServer.Active := false;
  Result := not IdTCPServer.Active;
  fServerRunning := result;
end;

procedure Tf_main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if fServerRunning then
 Begin
   StopServer;
 End
end;

procedure Tf_main.FormCreate(Sender: TObject);
var ApplIni:TIniFile;
    ApplIniName:string;
begin
  ApplIniName:=ExtractFilePath(ParamStr(0))+'ti_server.ini';
  ApplIni:=TIniFile.Create(ApplIniName);
  MasterConn:=ApplIni.ReadString('MASTER','Connection', '');
  BitumConn:=ApplIni.ReadString('BITUM','Connection', '');
  DispsvodkaConn:=ApplIni.ReadString('DISPSVODKA','Connection', '');
  PasportConn:=ApplIni.ReadString('PASPORT','Connection', '');
  InfinConn:=ApplIni.ReadString('INFIN','Connection', '');
  ARSCISConn:=ApplIni.ReadString('ARSCIS','Connection', '');
  DBFConn:=ApplIni.ReadString('DBF','Connection', '');
  FreeAndNil(ApplIni);

  StartServer;
end;

procedure Tf_main.IdTCPServerExecute(AThread: TIdPeerThread);
var si:TServiceInfo;
    st:TStringList;
    s,fname,ErrorStr: string;
    ErrorPing,SumPingRTT,FileHandle: Integer;
    l,X: Integer;
    Y: Integer;
begin
  // Считать команду
  AThread.connection.ReadBuffer(si,SizeOf(si));
  st:=TStringList.Create;

  with si do
  Begin
    { проверка доступности сервера (PING) }
    ErrorStr:='';
    ErrorPing:=0;
    SumPingRTT:=0;
    if Host<>'' then
    Begin
      PingICMP.TimeOut := 1000;
      PingICMP.HostName :=Host;
      PingICMP.HostIP := '';
      for l:=1 to MAX_PING do
      Begin
        if (PingICMP.ping = nil) then begin
          if PingICMP.status = CICMP_RESOLVE_ERROR then begin
            ErrorStr:='no resolve';
            ErrorPing:=MAX_PING;
            break; // Cancel any repeat Pings
          end else if PingICMP.status = CICMP_NO_RESPONSE then begin
            ErrorStr:='нет ответа';
            ErrorPing:=ErrorPing+1;
          end else begin
            ErrorStr:='error '+inttostr(PingICMP.status);
            ErrorPing:=MAX_PING;
            break; // Cancel any repeat Pings
          end;
        end else begin
          SumPingRTT:=SumPingRTT+PingICMP.pIPEchoReply^.RTT;
        end;
      end;
      if ErrorPing=MAX_PING then
      Begin
        st.Add('Узел '+Host+' - Ошибка ('+ErrorStr+')');
      end
      else if ErrorPing=0 then
      Begin
        st.Add('Узел '+Host+' - Ок ('+FloatToStr(RoundTo(SumPingRTT/MAX_PING,1))+' мс)');
      end
      else
      Begin
        st.Add('Узел '+Host+' - Потери ('+IntToStr(ErrorPing)+' из '+IntToStr(MAX_PING)+')');
      end;
    end
    else
    Begin
      st.Add('Узел не известен!!!');
    End;

    { проверка сервисов }
    if Tip='EMAIL' then
    Begin

    End
    else
    if Tip='ARSCIS' then
    try
      ADOQuery.Close;
      ADOQuery.ConnectionString:=ARSCISConn;
      ADOQuery.SQL.Clear;
      ADOQuery.SQL.Add(Query);
      ADOQuery.Open;
      if ADOQuery.Active then st.Add('Сервис - Ок')
      else Exception.Create('bad');
    except
      st.Add('База данных ('+Query+') НЕ доступна!')
    End
    else
    if Tip='INFIN' then
    try
      ADOQuery.Close;
      ADOQuery.ConnectionString:=InfinConn;
      ADOQuery.SQL.Clear;
      ADOQuery.SQL.Add(Query);
      ADOQuery.Open;
      if ADOQuery.Active then st.Add('Сервис - Ок')
      else Exception.Create('bad');
    except
      st.Add('База данных ('+Query+') НЕ доступна!')
    End
    else
    if Tip='DISPSVODKA' then
    try
      ADOQuery.Close;
      ADOQuery.ConnectionString:=DispSvodkaConn;
      ADOQuery.SQL.Clear;
      ADOQuery.SQL.Add(Query);
      ADOQuery.Open;
      if ADOQuery.Active then st.Add('Сервис - Ок')
      else Exception.Create('bad');
    except
      st.Add('База данных ('+Query+') НЕ доступна!')
    End
    else
    if Tip='PASPORT' then
    try
      ADOQuery.Close;
      ADOQuery.ConnectionString:=PASPORTConn;
      ADOQuery.SQL.Clear;
      ADOQuery.SQL.Add(Query);
      ADOQuery.Open;
      if ADOQuery.Active then st.Add('Сервис - Ок')
      else Exception.Create('bad');
    except
      st.Add('База данных ('+Query+') НЕ доступна!')
    End
    else
    if Tip='BITUM' then
    try
      ADOQuery.Close;
      ADOQuery.ConnectionString:=BITUMConn;
      ADOQuery.SQL.Clear;
      ADOQuery.SQL.Add(Query);
      ADOQuery.Open;
      if ADOQuery.Active then st.Add('Сервис - Ок')
      else Exception.Create('bad');
    except
      st.Add('База данных ('+Query+') НЕ доступна!')
    End
    else
    if Tip='MASTER' then
    try
      ADOQuery.Close;
      ADOQuery.ConnectionString:=MASTERConn;
      ADOQuery.SQL.Clear;
      ADOQuery.SQL.Add(Query);
      ADOQuery.Open;
      if ADOQuery.Active then st.Add('Сервис - Ок')
      else Exception.Create('bad');
    except
      st.Add('База данных ('+Query+') НЕ доступна!')
    End
    else
    if Tip='DBF' then
    try
      ADOQuery.Close;
      ADOQuery.ConnectionString:=DBFConn;
      ADOQuery.SQL.Clear;
      ADOQuery.SQL.Add(Query);
      ADOQuery.Open;
      if ADOQuery.Active then st.Add('Сервис - Ок')
      else Exception.Create('bad');
    except
      st.Add('База данных ('+Query+') НЕ доступна!')
    End
    else
    if Tip='FILESERVER' then
    try
      fname:=FillFilePath(Query,false)+'test.txt';
      if FileExists(fname) then
      begin
        DeleteFile(fname);
      end;
      FileHandle := FileCreate(fname);
      s:='test string';
      FileWrite(FileHandle,s,SizeOf(s));
      FileClose(FileHandle);
      DeleteFile(fname);
      st.Add('Сервис - Ок');
    except
      st.Add('Файлсервер '+Host+' ('+Query+') НЕ доступен!');
    end
    else
    Begin
      st.Add('Сервис '+Tip+' неизвестен!!!');
    End;
  end;
  AThread.Connection.WriteLn(st.Text);
  FreeAndNil(St);
end;

end.
