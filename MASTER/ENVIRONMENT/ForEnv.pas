unit ForEnv;

// Набор методов для работы с переменными окружения в таблице MASTER.ENVIRONMENT

interface

uses Windows,Classes,OracleData,SysUtils,ForSystem,Oracle,StrUtils,IniFiles;

const
  MAX_GRP_ENV=10;

type
  TGrpEnv = record
    ApplName:string[50];
    SchemaName:string[50];
    GrpName:string[50];
    UseEnv:boolean;
  end;

  TMasterEnv = class(TComponent)
  private
    // INI-файл
    ApplIniName:string;
    UserIniName:string;
    UserNetName:string;
    GrpUseEnv:array[1..MAX_GRP_ENV] of TGrpEnv;
    CntGrpEnv:integer;
  public
    // INI-файл
    ApplIni:TIniFile;
    UserIni:TIniFile;
    constructor Create(AOwner: TComponent); override;
    // OpenINI - Открытие INI-файла
    procedure OpenINI(pApplIniName,pUserIniName:string);
    // CloseINI - Закрытие INI-файла
    procedure CloseINI;
    // GetEnv - читает переменные из таблицы MASTER.ENVIRONMENT
    // Сначала ищет переменные для текущего пользователя,
    // если не находит - ищет переменные для всех пользователей
    function GetEnv(ApplName,SchemaName,GrpName,EnvName:string;pSession:TOracleSession):string;
    // SetEnv - сохраняет переменные в таблицу MASTER.ENVIRONMENT
    procedure SetEnv(ApplName,SchemaName,GrpName,EnvName,EnvValue:string;pSession:TOracleSession);
    // SetGrpUseEnv - инициализация места хранения группы переменных
    procedure SetGrpUseEnv(ApplName,SchemaName,GrpName:string;UseEnv:boolean);
    // GetGrpUseEnv - определяется место хранения группы переменных
    function GetGrpUseEnv(ApplName,SchemaName,GrpName:string):boolean;
    // GetVari - читает переменную. Место откуда считывается значение - определяется по имени группы
    // с учетом предварительно вызванных SetGrpUseEnv
    function GetVari(ApplName,SchemaName,GrpName,VariName:string;pSession:TOracleSession):string;
    // SetVari - сохраняет переменные. Место куда сохраняются данные - определяется по имени группы
    // с учетом предварительно вызванных SetGrpUseEnv
    procedure SetVari(ApplName,SchemaName,GrpName,VariName,EnvValue:string;pSession:TOracleSession);
  published
  end;

var
  F_Env: TMasterEnv;

implementation

uses main, ForDB;

constructor TMasterEnv.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);  // Initialize inherited parts
  UserNetName:=F_ForSystem.GetUserName(true);
  ApplIni:=nil;
  UserIni:=nil;
  CntGrpEnv:=0;
end;

// OpenINI - Открытие INI-файла
procedure TMasterEnv.OpenINI(pApplIniName,pUserIniName:string);
Begin
  if pApplIniName<>'' then
  Begin
    ApplIniName:=pApplIniName;
    ApplIni:=TIniFile.Create(ApplIniName);
  end;
  if pUserIniName<>'' then
  Begin
    UserIniName:=pUserIniName;
    UserIni:=TIniFile.Create(UserIniName);
  end;
End;

// CloseINI - Закрытие INI-файла
procedure TMasterEnv.CloseINI;
Begin
  if ApplIni<>nil then ApplIni.Free;
  ApplIni:=nil;
  if UserIni<>nil then UserIni.Free;
  UserIni:=nil;
End;

// SetGrpUseEnv - инициализация места хранения группы переменных
procedure TMasterEnv.SetGrpUseEnv(ApplName,SchemaName,GrpName:string;UseEnv:boolean);
var i:integer;
    IsExist:boolean;
Begin
  IsExist:=false;
  for i:=1 to CntGrpEnv do
  Begin
    If ( AnsiUpperCase(GrpUseEnv[i].ApplName)=AnsiUpperCase(ApplName) ) and
       ( AnsiUpperCase(GrpUseEnv[i].SchemaName)=AnsiUpperCase(SchemaName) ) and
       ( AnsiUpperCase(GrpUseEnv[i].GrpName)=AnsiUpperCase(GrpName) ) then
    Begin
      IsExist:=true;
      break;
    end;
  end;

  if NOT IsExist then
  Begin
    i:=CntGrpEnv+1;
    Inc(CntGrpEnv);
  end;

  GrpUseEnv[i].ApplName:=AnsiUpperCase(ApplName);
  GrpUseEnv[i].SchemaName:=AnsiUpperCase(SchemaName);
  GrpUseEnv[i].GrpName:=AnsiUpperCase(GrpName);
  GrpUseEnv[i].UseEnv:=UseEnv;
End;

// GetGrpUseEnv - определяется место хранения группы переменных
function TMasterEnv.GetGrpUseEnv(ApplName,SchemaName,GrpName:string):boolean;
var i:integer;
Begin
  GetGrpUseEnv:=false;
  for i:=1 to CntGrpEnv do
  Begin
    If ( AnsiUpperCase(GrpUseEnv[i].ApplName)=AnsiUpperCase(ApplName) ) and
       ( AnsiUpperCase(GrpUseEnv[i].SchemaName)=AnsiUpperCase(SchemaName) ) and
       ( AnsiUpperCase(GrpUseEnv[i].GrpName)=AnsiUpperCase(GrpName) ) then
    Begin
      GetGrpUseEnv:=GrpUseEnv[i].UseEnv;
      exit;
    end;
  end;
End;

// GetVari - читает переменную. Место откуда считывается значение - определяется по имени группы
// с учетом предварительно вызванных SetGrpUseEnv
function TMasterEnv.GetVari(ApplName,SchemaName,GrpName,VariName:string;pSession:TOracleSession):string;
var res:string;
Begin
  res:='';
  if GetGrpUseEnv(ApplName,SchemaName,GrpName) then
  Begin
    // Если переменные указанной группы считываем из БД (таблица ENVIRONMENT)
    res:=GetEnv(ApplName,SchemaName,GrpName,VariName,pSession);
  End
  else
  Begin
    // Если переменные указанной группы считываем из INI-файла
    if (res='') and (UserIni<>nil) then
    Begin
      // Попробуем из INI-файла пользователя
      res:=UserIni.ReadString(UserNetName, VariName, '');
    end;
    if (res='') and (ApplIni<>nil) then
    Begin
      // Сначала из INI-файла приложения
      res:=ApplIni.ReadString(GrpName, VariName, '');
    end;
  end;
  GetVari:=res;
End;

// SetVari - сохраняет переменные. Место куда сохраняются данные - определяется по имени группы
// с учетом предварительно вызванных SetGrpUseEnv
procedure TMasterEnv.SetVari(ApplName,SchemaName,GrpName,VariName,EnvValue:string;pSession:TOracleSession);
Begin
  if GetGrpUseEnv(ApplName,SchemaName,GrpName) then
  Begin
    // Если переменные указанной группы сохраняем в БД (таблица ENVIRONMENT)
    SetEnv(ApplName,SchemaName,GrpName,VariName,EnvValue,pSession);
  End
  else
  Begin
    // Если переменные указанной группы сохраняем в INI-файла
    if UserIni<>nil then
    Begin
      UserIni.WriteString(UserNetName, VariName, EnvValue);
    end;
  end;
End;


{ Прочитать переменную окружения из таблицы MASTER.ENVIRONMENT}
function TMasterEnv.GetEnv(ApplName,SchemaName,GrpName,EnvName:string;pSession:TOracleSession):string;
var q_tmp:TOracleDataSet;
    res:string;
    vSchemaName:string;
Begin
  if pSession=nil then
  Begin
    result:='';
    exit;
  end;
  vSchemaName:='';
  if SchemaName<>'' then vSchemaName:=SchemaName+'.';
  q_tmp:=TOracleDataSet.Create(Self);
  q_tmp.Session:=pSession;
  res:='';
  with q_tmp do
  try
    SQL.Clear;
    SQL.Add('SELECT '+vSchemaName+'For_Environment.GET_ENV('''+ApplName+''','''+GrpName+''','''+EnvName+''','''+UserNetName+''') as Env_Value FROM dual');
    f_db.ReQuery(q_tmp,false);
    if not eof then
      res:=q_tmp.FieldByName('ENV_VALUE').AsString;
    Close;
  except
  end;
  q_tmp.SQL.Clear;
  q_tmp.Free;
  if pos('%EMailPath%',res)<>0 then
    res:=StrUtils.AnsiReplaceStr(res,'%EMailPath%',GetEnv(ApplName,SchemaName,'','EMailPath',pSession));
  GetEnv:=res;
end;

{ Сохранить переменную окружения в таблице MASTER.ENVIRONMENT для текущего пользователя}
procedure TMasterEnv.SetEnv(ApplName,SchemaName,GrpName,EnvName,EnvValue:string;pSession:TOracleSession);
var q_tmp:TOracleQuery;
    res:string;
    vSchemaName:string;
Begin
  if pSession=nil then
  Begin
    exit;
  end;
  if SchemaName<>'' then vSchemaName:=SchemaName+'.';
  q_tmp:=TOracleQuery.Create(Self);
  q_tmp.Session:=pSession;
  res:='';
  with q_tmp do
  try
    Close;
    SQL.Clear;
    SQL.Add('BEGIN');
    SQL.Add('  '+vSchemaName+'For_Environment.Set_Env('''+ApplName+''','''+GrpName+''','''+EnvName+''','''+EnvValue+''','''+UserNetName+''');');
    SQL.Add('END;');
    Execute;
    Close;
  finally
    q_tmp.SQL.Clear;
    q_tmp.Free;
  end;
end;

end.
