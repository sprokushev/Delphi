unit ForEnv;

// ����� ������� ��� ������ � ����������� ��������� � ������� MASTER.ENVIRONMENT

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
    // INI-����
    ApplIniName:string;
    UserIniName:string;
    UserNetName:string;
    GrpUseEnv:array[1..MAX_GRP_ENV] of TGrpEnv;
    CntGrpEnv:integer;
  public
    // INI-����
    ApplIni:TIniFile;
    UserIni:TIniFile;
    constructor Create(AOwner: TComponent); override;
    // OpenINI - �������� INI-�����
    procedure OpenINI(pApplIniName,pUserIniName:string);
    // CloseINI - �������� INI-�����
    procedure CloseINI;
    // GetEnv - ������ ���������� �� ������� MASTER.ENVIRONMENT
    // ������� ���� ���������� ��� �������� ������������,
    // ���� �� ������� - ���� ���������� ��� ���� �������������
    function GetEnv(ApplName,SchemaName,GrpName,EnvName:string;pSession:TOracleSession):string;
    // SetEnv - ��������� ���������� � ������� MASTER.ENVIRONMENT
    procedure SetEnv(ApplName,SchemaName,GrpName,EnvName,EnvValue:string;pSession:TOracleSession);
    // SetGrpUseEnv - ������������� ����� �������� ������ ����������
    procedure SetGrpUseEnv(ApplName,SchemaName,GrpName:string;UseEnv:boolean);
    // GetGrpUseEnv - ������������ ����� �������� ������ ����������
    function GetGrpUseEnv(ApplName,SchemaName,GrpName:string):boolean;
    // GetVari - ������ ����������. ����� ������ ����������� �������� - ������������ �� ����� ������
    // � ������ �������������� ��������� SetGrpUseEnv
    function GetVari(ApplName,SchemaName,GrpName,VariName:string;pSession:TOracleSession):string;
    // SetVari - ��������� ����������. ����� ���� ����������� ������ - ������������ �� ����� ������
    // � ������ �������������� ��������� SetGrpUseEnv
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

// OpenINI - �������� INI-�����
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

// CloseINI - �������� INI-�����
procedure TMasterEnv.CloseINI;
Begin
  if ApplIni<>nil then ApplIni.Free;
  ApplIni:=nil;
  if UserIni<>nil then UserIni.Free;
  UserIni:=nil;
End;

// SetGrpUseEnv - ������������� ����� �������� ������ ����������
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

// GetGrpUseEnv - ������������ ����� �������� ������ ����������
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

// GetVari - ������ ����������. ����� ������ ����������� �������� - ������������ �� ����� ������
// � ������ �������������� ��������� SetGrpUseEnv
function TMasterEnv.GetVari(ApplName,SchemaName,GrpName,VariName:string;pSession:TOracleSession):string;
var res:string;
Begin
  res:='';
  if GetGrpUseEnv(ApplName,SchemaName,GrpName) then
  Begin
    // ���� ���������� ��������� ������ ��������� �� �� (������� ENVIRONMENT)
    res:=GetEnv(ApplName,SchemaName,GrpName,VariName,pSession);
  End
  else
  Begin
    // ���� ���������� ��������� ������ ��������� �� INI-�����
    if (res='') and (UserIni<>nil) then
    Begin
      // ��������� �� INI-����� ������������
      res:=UserIni.ReadString(UserNetName, VariName, '');
    end;
    if (res='') and (ApplIni<>nil) then
    Begin
      // ������� �� INI-����� ����������
      res:=ApplIni.ReadString(GrpName, VariName, '');
    end;
  end;
  GetVari:=res;
End;

// SetVari - ��������� ����������. ����� ���� ����������� ������ - ������������ �� ����� ������
// � ������ �������������� ��������� SetGrpUseEnv
procedure TMasterEnv.SetVari(ApplName,SchemaName,GrpName,VariName,EnvValue:string;pSession:TOracleSession);
Begin
  if GetGrpUseEnv(ApplName,SchemaName,GrpName) then
  Begin
    // ���� ���������� ��������� ������ ��������� � �� (������� ENVIRONMENT)
    SetEnv(ApplName,SchemaName,GrpName,VariName,EnvValue,pSession);
  End
  else
  Begin
    // ���� ���������� ��������� ������ ��������� � INI-�����
    if UserIni<>nil then
    Begin
      UserIni.WriteString(UserNetName, VariName, EnvValue);
    end;
  end;
End;


{ ��������� ���������� ��������� �� ������� MASTER.ENVIRONMENT}
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

{ ��������� ���������� ��������� � ������� MASTER.ENVIRONMENT ��� �������� ������������}
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
