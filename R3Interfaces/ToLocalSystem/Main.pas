unit Main;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,Oracle,CSVToDB, ExtCtrls, ForSess, ForEnv,ForFiles, DB,
  ADODB;

const
  APPLICATION_NAME='ISU2MASTER';
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
    function LoadCSV(filename: string):integer;
    procedure Information(Info:string; Error:boolean);
  public
    { Public declarations }
    ApplSession:TApplSession; // ������ ������� ����������
    ApplIniName:string; // ini-����
    UserADMIN:boolean; // legacy
    MasterXLSPath, // legacy
    MasterRPTPath:string; // legacy
    LoadPath:string; // ������� ��������
    LoadFile:string; // ����� ������������ �����
    ArhFrom:string; // �������� �������
    ListFields:string; // �������� �����
    BufferTable:string; // �������� �������
    PostProcedure:string; // ����-���������
    Load1,Load2,Load3,Load4,Load5:string; // ��������� ���� ������
    ToLoad:string; // ����������� ���
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
    begin
    ApplSession.WriteToLog(amDefault,'MAIN',sesError,Info,0,'');
    Application.Terminate;
    end
    else
    ApplSession.WriteToLog(amAuto,'MAIN',sesOk,Info,0,'');
end;


function Tf_main.LoadCSV(filename: string):integer;
const _SQL_GUARD_='select count(*) as acount from $tableName$ where filename=:Afilename';
var CSVToDBMapper:TCSVToDBMapper;
    ORASQLEXPRESSION:TORASQLEXPRESSION;

begin
  result:=CONST_EXCEPTION;
  Information('��������� ����� '+filename,false);
  OracleQuery1.DeleteVariables;
  OracleQuery1.SQL.clear;

//�������� ������������� �����
  OracleQuery1.SQL.Add(StringReplace(_SQL_GUARD_,'$tableName$',BufferTable,[rfIgnoreCase]));
  OracleQuery1.DeclareAndSet(':Afilename',otSubst,QuotedStr(ExtractFileName(filename)));
  OracleQuery1.Execute;
  if OracleQuery1.FieldAsInteger('acount')>0 then
      begin
      ApplSession.WriteToLog(amDefault,'MAIN',sesError,'������� �������� �����, ������� ��� ��� ��������. ���� '+ExtractFileName(filename)+' �� ����� ���������',0,'');
      result:=CONST_OK;
      exit;
      end;


  ORASQLEXPRESSION:=TORASQLEXPRESSION.create(OracleQuery1,self);
  try
    if ToLoad='R3ZKERP' then
    begin
      CSVToDBMapper:=TCSVToDBMapper.create(BufferTable,TFieldsMapDefault.create(
                  [
                  ConvertMap(5,TConversionDateClass.Create('YYYYMMDD','dd.mm.yyyy')),
                  ConvertMap(27,TConversionDateClass.Create('YYYYMMDD','dd.mm.yyyy')),
                  ConvertMap(40,TConversionDateClass.Create('YYYYMMDD','dd.mm.yyyy'))
                  ]
                  ,ListFields))
    end
    else
    if ToLoad='R3ZVZAV' then
    begin
      CSVToDBMapper:=TCSVToDBMapper.create(BufferTable,TFieldsMapDefault.create(
                    [
                    ConvertMap(3,TConversionDateClass.Create('DDMMYYYY','dd.mm.yyyy')),
                    ConvertMap(4,TConversionDateClass.Create('DDMMYYYY','dd.mm.yyyy')),
                    ConvertMap(36,TConversionDateClass.Create('YYYYMMDD','dd.mm.yyyy'))
                    ]
                  ,ListFields))
    end
    else
    if ToLoad='BDRVOTGR' then
    begin
      CSVToDBMapper:=TCSVToDBMapper.create(BufferTable,TFieldsMapDefault.create(
                    [
                    ConvertMap(1,TConversionDateClass.Create('YYYYMMDD','dd.mm.yyyy')),
                    ConvertMap(6,TConversionDateClass.Create('DD.MM.YYYY','dd.mm.yyyy')),
                    ConvertMap(8,TConversionDateClass.Create('DD.MM.YYYY','dd.mm.yyyy')),
                    ConvertMap(10,TConversionDateClass.Create('DD.MM.YYYY','dd.mm.yyyy')),
                    ConvertMap(12,TConversionDateClass.Create('DD.MM.YYYY','dd.mm.yyyy')),
                    ConvertMap(14,TConversionDateClass.Create('DD.MM.YYYY','dd.mm.yyyy')),
                    ConvertMap(16,TConversionDateClass.Create('DD.MM.YYYY','dd.mm.yyyy'))
                    ]
                  ,ListFields))
    end
    else
    begin
      CSVToDBMapper:=TCSVToDBMapper.create(BufferTable,TFieldsMapDefault.create([],ListFields))
    end;
    try
      CSVToDBMapper.MapFile(filename,ORASQLEXPRESSION,'filename=$filename$;ParseDateTime=$date$');
      Information('������������� ���������',false);
      Information('��������� � ��',false);
      ORASQLEXPRESSION.Execute;
      ora_Session.Commit;
      Information('��������� � �� ���������',false);
      OracleQuery1.Clear;
      result:=CONST_OK;
    except
      on E: Exception do
      Begin
        Information(E.Message+#13#10+'������ �������� ������',true);
      end;
    end;
    CSVToDBMapper.Free;
  except
    on E: Exception do
    Begin
      Information(E.Message+#13#10+'������ �������� ������',true);
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
  Par2:=AnsiUpperCase(ParamStr(2));
  // �������������� ��������
  if (ParCnt>1) and (Par2='/AUTO') then
    begin
      if FindFirst(LoadPath+LoadFile, faArchive, sr) = 0 then
      begin
        repeat
          if LoadCSV(LoadPath+sr.Name)=CONST_OK then
          begin
            // ������� ����� � �����
            F_FileUtils.SafeCopyFile(LoadPath+sr.Name,ArhFrom+sr.Name);
            DeleteFile(LoadPath+sr.Name);
          end;
        until FindNext(sr) <> 0;
      end;
      FindClose(sr);
      if PostProcedure<>'' then
      Begin
        Information('������ ���� ���������: '+PostProcedure,false);
        OracleQuery1.SQL.Add('BEGIN');
        OracleQuery1.SQL.Add(PostProcedure+';');
        OracleQuery1.SQL.Add('END;');
         try
         OracleQuery1.Execute;
         ora_Session.Commit;
         Information('���� ��������� ���������',false);
         except
         on E: Exception do
            Begin
            Information(E.Message+#13#10+'������ ��� ���� ���������',true);
            end;
          end;
      end;
      Information('���������� ���������',false);
      Close;
      exit;
    end;
end;

procedure Tf_main.ProcessButtonClick(Sender: TObject);
begin
  if OpenDialog.Execute then LoadCSV(OpenDialog.FileName);
end;

procedure Tf_main.FormCreate(Sender: TObject);
var
  ParCnt:integer;
  Par1,Par2,Par3:string;
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
        Load1:= AnsiUpperCase(ReadString('Common', 'LOAD1', ''));
        Load2:= AnsiUpperCase(ReadString('Common', 'LOAD2', ''));
        Load3:= AnsiUpperCase(ReadString('Common', 'LOAD3', ''));
        Load4:= AnsiUpperCase(ReadString('Common', 'LOAD4', ''));
        Load5:= AnsiUpperCase(ReadString('Common', 'LOAD5', ''));

        ParCnt:=ParamCount;
        Par1:=AnsiUpperCase(ParamStr(1));
        // ��������� ��������� ������������ �����
        if (ParCnt>0) and
           ((Par1=Load1) or (Par1=Load2) or (Par1=Load3) or (Par1=Load4) or (Par1=Load5)) then
        begin
          ToLoad:=Par1;
          LoadPath:= ReadString(ToLoad, 'LOAD_PATH', '');
          ArhFrom:= ReadString(ToLoad, 'ARH_PATH', '');
          LoadFile:= ReadString(ToLoad, 'LOAD_FILE', '');
          ListFields:= trim(ReadString(ToLoad, 'LIST_FIELDS', ''))+
                       trim(ReadString(ToLoad, 'LIST_FIELDS1', ''))+
                       trim(ReadString(ToLoad, 'LIST_FIELDS2', ''))+
                       trim(ReadString(ToLoad, 'LIST_FIELDS3', ''))+
                       trim(ReadString(ToLoad, 'LIST_FIELDS4', ''))+
                       trim(ReadString(ToLoad, 'LIST_FIELDS5', ''));
          BufferTable:= ReadString(ToLoad, 'BUFFER_TABLE', '');
          PostProcedure:= ReadString(ToLoad, 'POST_PROCEDURE', '');
        end;
      end;

    // �������� ������ � ��
    ora_Session.LogOn;

    // ������� ������
    ApplSession.InitSession(amAuto,APPLICATION_NAME,SCHEMA_NAME,'MAIN',ApplIniName,'������ ����������',ora_Session);
    Information('����������� ���������� � Oracle',false);
  except
    on E: Exception do
    Begin
      // ������� ������
      ApplSession.InitSession(amAuto,APPLICATION_NAME,SCHEMA_NAME,'MAIN',ApplIniName,'������ ����������',nil);
      Information(E.Message+#13#10+'�� ������� �������� ������ � ��',true);
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
