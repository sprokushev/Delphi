unit Main;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,Oracle,CSVToDB, ExtCtrls, ForSess, ForEnv,ForFiles;

const
  APPLICATION_NAME='R3ZKERP';
  SCHEMA_NAME='MASTER';

type
  Tf_main = class(TForm,IInformation)
    Memo: TMemo;
    ora_Session: TOracleSession;
    OracleQuery1: TOracleQuery;
    Timer: TTimer;
    OpenDialog: TOpenDialog;
    ProcessButton: TButton;
    procedure TimerTimer(Sender: TObject);
    procedure ProcessButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    EnvGrpVari:string; // ������ ����������
    EnvGrpMail:string; // ������ �������� �����
    EnvGrpLog:string; // ������ �������� �������
    function ZKERP(filename: string):integer;
    procedure Information(Info:string; Error:boolean);
  public
    { Public declarations }
    ApplSession:TApplSession; // ������ ������� ����������
    ApplIniName:string;
    UserADMIN:boolean; // legacy
    MasterXLSPath, // legacy
    MasterRPTPath:string; // legacy
    LoadPath:string;
    LoadFile:string;
    ArhFrom:string;
    ListFields:string;
    function GetApplVari(VariName:string):string; // ��������� �������� ���������� ����������
    procedure SetApplVari(VariName,VariValue:string); // ��������� �������� ���������� ����������
    function GetMailVari(VariName:string):string; // ��������� �������� �������� �����
    function GetLogVari(VariName:string):string; // ��������� �������� �������� �������
  end;

var
  f_main: Tf_main;

implementation

{$R *.dfm}

uses CSVToDBOra,SystemConstants;

{ TMainForm }

// ��������� �������� ���������� ����������
function Tf_main.GetApplVari(VariName:string):string;
Begin
  GetApplVari:=F_Env.GetVari(APPLICATION_NAME,SCHEMA_NAME,EnvGrpVari,VariName,ora_Session);
End;

// ��������� �������� ���������� ����������
procedure Tf_main.SetApplVari(VariName,VariValue:string);
Begin
  F_Env.SetVari(APPLICATION_NAME,SCHEMA_NAME,EnvGrpVari,VariName,VariValue,ora_Session);
End;

// ��������� �������� �������� �����
function Tf_main.GetMailVari(VariName:string):string;
Begin
  GetMailVari:=F_Env.GetVari(APPLICATION_NAME,SCHEMA_NAME,EnvGrpMail,VariName,ora_Session);
End;

// ��������� �������� �������� �������
function Tf_main.GetLogVari(VariName:string):string;
Begin
  GetLogVari:=F_Env.GetVari(APPLICATION_NAME,SCHEMA_NAME,EnvGrpLog,VariName,ora_Session);
End;




procedure Tf_main.Information(Info: string; Error:boolean);
begin
  Memo.Lines.Add(Info);
  if Error then
    ApplSession.WriteToLog(amDefault,'MAIN',sesError,Info,0,'');
end;


function Tf_main.ZKERP(filename: string):integer;
var CSVToDBMapper:TCSVToDBMapper;
    ORASQLEXPRESSION:TORASQLEXPRESSION;
begin
  result:=CONST_EXCEPTION;

  Memo.Lines.Add('��������� ����� '+filename);
  ORASQLEXPRESSION:=TORASQLEXPRESSION.create(OracleQuery1,self);
  try
    CSVToDBMapper:=TCSVToDBMapper.create('XX101_ZKERP_DATA',TFieldsMapDefault.create(
                  [
                  ConvertMap(5,TConversionDateClass.Create('YYYYMMDD','dd.mm.yyyy')),
                  ConvertMap(27,TConversionDateClass.Create('YYYYMMDD','dd.mm.yyyy')),
                  ConvertMap(40,TConversionDateClass.Create('YYYYMMDD','dd.mm.yyyy'))
                  ]
                  ,ListFields));
    try
      CSVToDBMapper.MapFile(filename,ORASQLEXPRESSION,'filename=$filename$;ParseDateTime=$date$');


      Memo.Lines.Add('������������� ���������');
      Memo.Lines.Add('��������� � ��');
      ORASQLEXPRESSION.Execute;
      Memo.Lines.Add('��������� � �� ���������');
      OracleQuery1.Clear;

      Memo.Lines.Add('������ ���� ���������');
      OracleQuery1.SQL.Add('BEGIN');
      OracleQuery1.SQL.Add('Xx101_ZKERP_EXEC_PENDINGACTION;');
      OracleQuery1.SQL.Add('END;');
      OracleQuery1.Execute;

      Memo.Lines.Add('���� ��������� ���������');
      ora_Session.Commit;
      Memo.Lines.Add('���������� ���������');
      result:=CONST_OK;
    except
      on E: Exception do
      Begin
        ApplSession.WriteToLog(amDefault,'MAIN',sesError,E.Message+#13#10+'������ �������� ������',0,'');
      end;
    end;
    CSVToDBMapper.Free;
  except
    on E: Exception do
    Begin
      ApplSession.WriteToLog(amDefault,'MAIN',sesError,E.Message+#13#10+'������ �������� ������',0,'');
    end;
  end;
  ORASQLEXPRESSION.free;
end;

procedure Tf_main.TimerTimer(Sender: TObject);
var
  ParCnt:integer;
  Par1,Par2,Par3:string;
  sr: TSearchRec;
begin
  Timer.Enabled:=False;

  if not ora_Session.Connected then
  begin
    // �������, ���� ��� ������� � ��
    Close;
    exit;
  end;

  ParCnt:=ParamCount;
  Par1:=AnsiUpperCase(ParamStr(1));

  // �������������� ��������
  if (ParCnt>0) and (Par1='/AUTO') then
    begin
      if FindFirst(LoadPath+LoadFile, faArchive, sr) = 0 then
      begin
        repeat
          if ZKERP(LoadPath+sr.Name)=CONST_OK then
          begin
            // ������� ����� � �����
            F_FIleUtils.SafeCopyFile(LoadPath+sr.Name,ArhFrom+sr.Name);
            DeleteFile(LoadPath+sr.Name);
          end;
        until FindNext(sr) <> 0;
      end;
      FindClose(sr);

      Close;
      exit;
    end;
end;

procedure Tf_main.ProcessButtonClick(Sender: TObject);
begin
  if OpenDialog.Execute then ZKERP(OpenDialog.FileName);
end;






procedure Tf_main.FormCreate(Sender: TObject);
begin
  DecimalSeparator:='.';

  // ��������� ������
  Timer.Enabled:=false;

  // ������� ������
  ApplSession:=TApplSession.Create(Self);

  // ������������� ����������
  F_Env:=TMasterEnv.Create(Self);

  // ��������� INI-����� ���������� � ������������
  ApplIniName:=ExtractFilePath(ParamStr(0))+APPLICATION_NAME+'.ini';

  try
    F_Env.OpenINI(ApplIniName,'');
    with F_Env.ApplIni do
      begin
        EnvGrpVari:= ReadString('Common', 'GRP_VARI', 'VARI');
        EnvGrpMail:= ReadString('Common', 'GRP_MAIL', 'MAIL');
        EnvGrpLog:= ReadString('Common', 'GRP_LOG', 'LOG');
        F_Env.SetGrpUseEnv(APPLICATION_NAME,SCHEMA_NAME,EnvGrpVari,
              (AnsiUpperCase(ReadString(EnvGrpVari,'USE_ENVIRONMENT','NO'))='YES'));
        F_Env.SetGrpUseEnv(APPLICATION_NAME,SCHEMA_NAME,EnvGrpMail,
              (AnsiUpperCase(ReadString(EnvGrpMail,'USE_ENVIRONMENT','NO'))='YES'));
        F_Env.SetGrpUseEnv(APPLICATION_NAME,SCHEMA_NAME,EnvGrpLog,
              (AnsiUpperCase(ReadString(EnvGrpLog,'USE_ENVIRONMENT','NO'))='YES'));
        LoadPath:= ReadString('Common', 'LOAD_PATH', 'C:\R3\R3ZKERP\');
        ArhFrom:= ReadString('Common', 'ARH_PATH', 'C:\R3\R3ZKERP\ARCHIVE\');
        LoadFile:= ReadString('Common', 'LOAD_FILE', 'SH015_*.csv');
        ListFields:= ReadString('Common', 'LIST_FIELDS', '?');
      end;

    // �������� ������ � ��
    ora_Session.LogOn;

    // ������� ������
    ApplSession.InitSession(amAuto,APPLICATION_NAME,SCHEMA_NAME,'MAIN',ApplIniName,'������ ����������',ora_Session);
    Memo.Lines.Add('����������� ���������� � Oracle');
  except
    on E: Exception do
    Begin
      // ������� ������
      ApplSession.InitSession(amAuto,APPLICATION_NAME,SCHEMA_NAME,'MAIN',ApplIniName,'������ ����������',nil);
      ApplSession.WriteToLog(amDefault,'MAIN',sesError,E.Message+#13#10+'�� ������� �������� ������ � ��',0,'');
      Memo.Lines.Add(E.Message+#13#10+'�� ������� �������� ������ � ��');
    end;
  end;
end;

procedure Tf_main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // ��������� ������
  ApplSession.DoneSession('MAIN');

  // ������� INI-����
  F_Env.CloseINI;
end;

procedure Tf_main.FormActivate(Sender: TObject);
begin
  // �������� ������
  Timer.Enabled:=true;
end;

end.
