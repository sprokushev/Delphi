unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ADODB, StdCtrls, ComCtrls, ExtCtrls, Oracle, AppEvent, {Launch,} rxStrUtils,
  MapiControl, Psock, NMsmtp, variants, Halcn6DB;

type
  // Some collection classes to store the import data
  TMyItem = class(TCollectionItem)
  public
    FieldsArray: variant;
  end;
  TMyItems = class(TCollection)
  private
    function GetMyItem(Index: Integer): TMyItem;
  public
    property MyItem[Index: Integer]: TMyItem read GetMyItem; default;
  end;

type
  TFormMain = class(TForm)
    cnn_ADO_SRC: TADOConnection;
    cnn_DBFTOORA: TADOConnection;
    cmm_ADO_Insert: TADOCommand;
    cmm_ADO_SRC_Select: TADOQuery;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    Timer1: TTimer;
    ADOStoredProc1: TADOStoredProc;
    lbTableName: TLabel;
    cmm_DOA_SRC_Select: TOracleQuery;
    cnn_DOA_SRC: TOracleSession;
    cmm_DOA_Insert: TOracleQuery;
    cnn_ADO_SP: TADOConnection;
    qDbfList: TADOQuery;
    cnn_MgrSr: TADOConnection;
    taLogTask: TADOTable;
    slMain: TStatusBar;
    qLoadTask: TADOQuery;
    cnn_ADO_DST: TADOConnection;
    cnn_DOA_DST: TOracleSession;
    cmm_ADO_DST_Select: TADOQuery;
    cmm_DOA_DST_Select: TOracleQuery;
    NMSMTP1: TNMSMTP;
    dpl_DOA_Insert: TOracleDirectPathLoader;
    cmm_DAI_Insert: TOracleQuery;
    cmm_HLC_SRC_Select: THalcyonDataSet;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    ErrF:TextFile;
  public
    { Public declarations }
    MGRSR_Connection: string; {������ �������������� � ���� MGRSR ����� ADO }
    MGRSR_Database:string; {������� � ���� MGRSR}
    DBFTOORA_Connection: string; {������ �������������� � ���� DBFTOORA }
    DBFTOORA_Database:string; {������� � ���� DBFTOORA}
    FlagMGRSRFind:boolean; {���� ����������� ���������}
    FlagOnlyProc:boolean; {���� ���������� ������ �������� ��������}
    FlagViewSQL:boolean; {���� ���������� � ����� lastsql.sql ��������� SQL-��������}

    FileList: string; {���� � DBF-����� �� ������� ����������� ������}
    Protokol: string; {���� � ����� ��������� ��������}
    ProtokolSize: integer; {������������ ������ ��������� ��������}
    CommandLine: string; {��������� ������ }
    MailHost:string;
    MailPort:integer;
    MailUserID:string;
    MailFromAddress:string;
    MailFromName:string;
    Recipient1:string; {1-�� ���������� ������ � ���������� �� ������ }
    Recipient2:string; {2-�� ���������� ������ � ���������� �� ������ }
    Recipient3:string; {3-�� ���������� ������ � ���������� �� ������ }
    Recipient4:string; {4-�� ���������� ������ � ���������� �� ������ }
    Recipient5:string; {5-�� ���������� ������ � ���������� �� ������ }

    OLD_SRC_DSN:string;
    OLD_DST_DSN:string;
    OLD_SP_DSN:string;
    FlagSRCInit:boolean;
    FlagDSTInit:boolean;
    ORAFlags: string;
    DelFlags: string;

    procedure UpdateStLine(pStLineText:string);
    procedure WriteToLog(Title:string; ErrStr:string; WriteToLogTask:boolean; ID:integer; Filename:string); {������ � Log}
    Procedure ExecuteProc(ORA_Sp:string;ExistParam:boolean;DT_Beg,DT_End:TDateTime;Param1,Param2,Param3:string;ID:integer;FILENAME:string);
    Function InitLoading:boolean; {�������������}
    procedure ExecuteLoading; {������� � �������� ������}
    Procedure DoneLoading; {���������������}
    function LoadDBF(DBF_Title:string; GlobalPath:string; VAR CheckIs:boolean; VAR FlagIs:string):boolean;
    function GenerateDate(SDate:String; DefDate:TDateTime):TDateTime;
    function FileChanged(Owner_ID: integer):boolean;
    Function InitConnection(KindConn:string;NameConn:string;ID:integer;FILENAME:string):boolean;
    Procedure DoneConnection(KindConn:string);
    Procedure ProcessTable(SRC_Table,SRC_Fields,SRC_Where,DST_Table,DST_Fields:string;ID:integer;Filename:string);

  end;

type
  TMyObj=class(TObject)
    SearchRec:TSearchRec;
  end;

type
  TLoadParam = record
    Title:string;
    As_Title:string;
    SRC_DSN:string;
    SRC_TABLE:string;
    SRC_FIELDS:string;
    SRC_WHERE:string;
    DST_DSN:string;
    DST_TABLE:string;
    DST_FIELDS:string;
    SP_DSN:string;
    SP_NAME:string;
    STAT_TABLE:string;
    DATE_FIELD:string;
    DATE_BEG:string;
    DATE_END:string;
    PARAM1:string;
    PARAM2:string;
    PARAM3:string;
    MODE_UPD:integer;
    LastDate:TDateTime;
    LastTime:String;
    LastSize:real;
    FLAG_IS:string;
  end;

var
  FormMain: TFormMain;
  SRC_TYPE:string;
  DST_TYPE:string;
  SP_TYPE:string;

type
  TMyFieldType = (foNone,foBoolean,foString,foDateTime,foInteger,foFloat);

type
  TMyFieldObject= class(TObject)
    ADOType:TFieldType;
    DOAType:integer;
    Value:variant;
    Size:integer;
    function GetDOAType:integer;
    function DataType:TMyFieldType;
    function DPLType:TDirectPathColumnType;
    function DPLSize:integer;
    function DPLValue:variant;
    function DAIValue:variant;
    function AsBoolean:boolean;
    function AsString:string;
    function AsInteger:integer;
    function AsFloat:real;
    function AsDateTime:TDateTime;
    function StringValue:string;
  end;
implementation

{$R *.DFM}
uses DateUtil, inifiles, StrUtils, FileUtil;


function TMyItems.GetMyItem(Index: Integer): TMyItem;
begin
  Result := Items[Index] as TMyItem;
end;

function TMyFieldObject.AsBoolean:boolean;
Begin
  Result:=Value;
End;

function TMyFieldObject.AsFloat:real;
Begin
  Result:=Value;
End;

function TMyFieldObject.AsInteger:integer;
Begin
  Result:=Value;
End;

function TMyFieldObject.AsString:string;
Begin
  Result:=VarToStr(Value);
End;

function TMyFieldObject.AsDateTime:TDateTime;
Begin
  Result:=Value;
End;

function TMyFieldObject.DataType:TMyFieldType;
Begin
  IF (SRC_TYPE='DOA') OR (SRC_TYPE='DPL')  OR (SRC_TYPE='DAI') Then
  Begin
    case DOAType of
      otInteger: Result:=foInteger;
      otFloat: Result:=foFloat;
      otString,otLong,otPLSQLString,otChar: Result:=foString;
      otDate: Result:=foDateTime;
      else Result:=foNone;
    end;
  end
  else
  Begin
    case ADOType of
      ftBoolean: Result:=foBoolean;
      ftAutoInc,ftSmallint,ftInteger,ftWord,ftLargeInt: Result:=foInteger;
      ftBCD,ftCurrency,ftFloat: Result:=foFloat;
      ftString,ftMemo,ftFmtMemo,ftFixedChar, ftWideString: Result:=foString;
      ftDate,ftTime,ftDateTime: Result:=foDateTime;
      else Result:=foNone;
    end;
  End;
End;

function TMyFieldObject.GetDOAType:integer;
Begin
  IF (SRC_TYPE='DOA') OR (SRC_TYPE='DPL')  OR (SRC_TYPE='DAI') Then
  Begin
    Result:=DOAType;
  end
  else
  Begin
    case ADOType of
      ftBoolean: Result:=otString;
      ftAutoInc,ftSmallint,ftInteger,ftWord,ftLargeInt: Result:=otInteger;
      ftBCD,ftCurrency,ftFloat: Result:=otFloat;
      ftString,ftMemo,ftFmtMemo,ftFixedChar, ftWideString: Result:=otString;
      ftDate,ftTime,ftDateTime: Result:=otDate;
    end;
  End;
End;

function TMyFieldObject.DPLType:TDirectPathColumnType;
Begin
  IF (SRC_TYPE='DOA') OR (SRC_TYPE='DPL') OR (SRC_TYPE='DAI') Then
  Begin
    case DOAType of
      otInteger: Result:=dpInteger;
      otFloat: Result:=dpFloat;
      otString,otLong,otPLSQLString,otChar: Result:=dpString;
      otDate: Result:=dpString;
      else Result:=dpString;
    end;
  end
  else
  Begin
    case ADOType of
      ftBoolean: Result:=dpString;
      ftAutoInc,ftSmallint,ftInteger,ftWord,ftLargeInt: Result:=dpInteger;
      ftBCD,ftCurrency,ftFloat: Result:=dpFloat;
      ftString,ftMemo,ftFmtMemo,ftFixedChar, ftWideString: Result:=dpString;
      ftDate,ftTime,ftDateTime: Result:=dpString;
      else Result:=dpString;
    end;
  End;
End;

function TMyFieldObject.DPLSize:integer;
Begin
  case DPLType of
    dpInteger: Result:=0;
    dpFloat: Result:=0;
    dpString: Result:=Size;
  End;
End;

function TMyFieldObject.DPLValue:variant;
Begin
  Case DataType of

    foBoolean:
      begin
        If VarIsNull(Value) Then Value:=false;
        if Value then Result:='T' else Result:='F';
      end;

    foString:
      Begin
        If VarIsNull(Value) Then Value:='';
        Result:=ReplaceStr(TrimRight(Value), '''', '"');
      End;

    foDateTime:
      begin
        Result:=FormatDateTime('dd.mm.yyyy',Value);
      end;

    foInteger:
      begin
        Result:=Value;
      end;

    foFloat:
      begin
        Result:=Value;
      end;
  End;
end;

function TMyFieldObject.DAIValue:variant;
Begin
  Case DataType of

    foBoolean:
      begin
        If VarIsNull(Value) Then Value:=false;
        if Value then Result:='T' else Result:='F';
      end;

    foString:
      Begin
        If VarIsNull(Value) Then Value:='';
        Result:=ReplaceStr(TrimRight(Value), '''', '"');
      End;

    foDateTime:
      begin
        Result:=Value;
      end;

    foInteger:
      begin
        Result:=Value;
      end;

    foFloat:
      begin
        Result:=Value;
      end;
  End;
end;

function TMyFieldObject.StringValue:string;
var Res:string;
    YY,MM,DD,Hour,Min,Sec,MSec:word;
    s:string;
Begin
  Res:='';
  Case DataType of

    foBoolean:
      If AsBoolean Then
      Begin
        If (DST_TYPE='DOA') OR (DST_TYPE='DPL') OR (DST_TYPE='DAI') OR (DST_TYPE='ORACLE') Then Res := '''T''';
        If DST_TYPE='DBF' Then Res := '.T.';
        If DST_TYPE='ADO' Then Res := 'True';
      end
      Else
      Begin
        If (DST_TYPE='DOA') OR (DST_TYPE='DPL') OR (DST_TYPE='DAI') OR (DST_TYPE='ORACLE') Then Res := '''F''';
        If DST_TYPE='DBF' Then Res := '.F.';
        If DST_TYPE='ADO' Then Res := 'False';
      End;

    foString:
      Begin
        Res:=TrimRight(AsString);
        Res:=ReplaceStr(Res, '''', '"');
        Res:='''' + Res + '''';
      End;

    foDateTime:
      begin
        try
          DecodeTime(AsDateTime,Hour,Min,Sec,MSec);
        except
          Hour:=0;
          Min:=0;
          Sec:=0;
          MSec:=0;
        end;

        If (DST_TYPE='DOA') OR (DST_TYPE='DPL') OR (DST_TYPE='DAI') OR (DST_TYPE='ORACLE') Then
        try
          DecodeDate(AsDateTime,YY,MM,DD);
          IF (YY=1899) AND (MM=12) AND (DD=30) Then
            Res:='NULL'
          Else
            Res := 'TO_DATE(''' + Trim(IntToStr(YY)) +
                '-' + Trim(IntToStr(MM)) +
                '-' + Trim(IntToStr(DD)) +
                ''',''yyyy-mm-dd'')';
{                ' ' + Trim(IntToStr(Hour)) +
                ':' + Trim(IntToStr(Min)) +
                ':' + Trim(IntToStr(Sec)) + hh24:mi:ss}
        except
          Res:='NULL';
        end;

        If DST_TYPE='DBF' Then
        try
          Res := '{'+Trim(IntToStr(ExtractMonth(AsDateTime))) +
                '/' + Trim(IntToStr(ExtractDay(AsDateTime))) +
                '/' + Trim(IntToStr(ExtractYear(AsDateTime)))+'}';
        except
          Res := '{  /  /    }'
        end;
        If DST_TYPE='ADO' Then
        try
          Res := '#'+Trim(IntToStr(ExtractMonth(AsDateTime))) +
                '/' + Trim(IntToStr(ExtractDay(AsDateTime))) +
                '/' + Trim(IntToStr(ExtractYear(AsDateTime)))+'#';
        except
          Res:='#  /  /    #';
        end;
      end;

    foInteger:
      try
        Res := Trim(IntToStr(AsInteger));
      except
        Res:='0';
      end;

    foFloat:
      try
        str(AsFloat,s);
        Res := Trim(FloatToStr(AsFloat));
      except
        Res:='0';
      end;

  End;
  Result:=Res;
end;

procedure TFormMain.FormCreate(Sender: TObject);
var
  Reg: TIniFile;
  s:string;
begin
  Reg := TIniFile.Create(ExtractFilePath(ParamStr(0))+'DbfToOra.INI');
  try
    MGRSR_Connection:=Reg.ReadString('MGRSR', 'CONNECTION', 'Provider=MSDASQL.1;Persist Security Info=False;Data Source=PF');
    MGRSR_Database:=Trim(Reg.ReadString('MGRSR', 'DATABASE', 'C:\LUK\DBA\MP\DBF'));

    MailHost:=Reg.ReadString('COMMON','MailHost', '');
    MailPort:=Reg.ReadInteger('COMMON','MailPort',0);
    MailUserID:=Reg.ReadString('COMMON','MailUserID', '');
    MailFromAddress:=Reg.ReadString('COMMON','MailFromAddress', '');
    MailFromName:=Reg.ReadString('COMMON','MailFromName', '');
    Recipient1:=Reg.ReadString('COMMON','ErrorRecipient1', '');
    Recipient2:=Reg.ReadString('COMMON','ErrorRecipient2', '');
    Recipient3:=Reg.ReadString('COMMON','ErrorRecipient3', '');
    Recipient4:=Reg.ReadString('COMMON','ErrorRecipient4', '');
    Recipient5:=Reg.ReadString('COMMON','ErrorRecipient5', '');
    s:=Trim(UpperCase(Reg.ReadString('COMMON','Only Proc', '')));
    if (s='��') or (s='YES') or (s='TRUE') or (s='1') or (s='OK') then
      FlagOnlyProc:=True
    Else
      FlagOnlyProc:=False;
    s:=Trim(UpperCase(Reg.ReadString('COMMON','View SQL', '')));
    if (s='��') or (s='YES') or (s='TRUE') or (s='1') or (s='OK') then
      FlagViewSQL:=True
    Else
      FlagViewSQL:=False;
    ORAFlags:=Trim(Reg.ReadString('COMMON','ORAFlags', 'U:\LUK\DBA\MP\ORAFLAGS'));
    IF ORAFlags<>'' Then
      If ORAFlags[Length(ORAFlags)]<>'\' Then ORAFlags:=ORAFlags+'\';
    DelFlags:=Trim(Reg.ReadString('COMMON','DelFlags', 'C:\LUK\DBA\MP\DELFLAGS'));
    IF DelFlags<>'' Then
      If DelFlags[Length(ORAFlags)]<>'\' Then DelFlags:=DelFlags+'\';

    DBFTOORA_Connection:=Reg.ReadString('DBFTOORA', 'CONNECTION', 'Provider=MSDASQL.1;Persist Security Info=False;Data Source=PF');
    DBFTOORA_Database:=Trim(Reg.ReadString('DBFTOORA', 'DATABASE', 'C:\LUK\DBA\MP\DBF'));
    FileList:=Reg.ReadString('DBFTOORA', 'FILELIST', 'DbfToOra.DBF');

    Protokol:=Reg.ReadString('COMMON', 'LOGFILE', 'DbfToOra.LOG');
    IF Pos('\',Protokol)=0 then Protokol:= ExtractFilePath(ParamStr(0))+Protokol;
    ProtokolSize:=Reg.ReadInteger('COMMON','LOGSIZE', 1024);

  finally
    Reg.Free;
  end;
end;

procedure TFormMain.FormActivate(Sender: TObject);
begin
  Label1.Caption:='';
  lbTableName.Caption:='';
  FormMain.Refresh;
  Height:=130;
  Width:=590;
  Top:=Screen.Height-Height-50;
  Left:=Screen.Width-Width-50;
end;

procedure TFormMain.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:=false;
  If InitLoading Then ExecuteLoading;
  DoneLoading;
  Close;
end;

function TFormMain.InitLoading:boolean;
Begin
  UpdateStLine('������ ������ �������');
  WriteToLog('�����','������ ������ �������',false,0,'');

  Result:=true;

  { ���������� � MgrSr }
  Label1.Caption:='���������� � ����� ������ MGRSR';
  FormMain.Refresh;
  try
    cnn_Mgrsr.Close;
    cnn_Mgrsr.ConnectionString := MGRSR_Connection;
    cnn_Mgrsr.DefaultDatabase := MGRSR_Database;
    cnn_Mgrsr.Open;
  except
    on E: Exception do
    Begin
      WriteToLog('������',E.Message+#13#10+'�� ������� �������� ������ � ���� MGRSR: '+MGRSR_Connection,false,0,'');
      cnn_Mgrsr.Close;
    end;
  end;

  { ���������� � DBFTOORA }
  Label1.Caption:='���������� � ����� ������ DBFTOORA';
  FormMain.Refresh;
  If Result Then
    try
      cnn_DbfToOra.Close;
      cnn_DbfToOra.ConnectionString := DbfToOra_Connection;
      cnn_DbfToOra.DefaultDatabase := DBFTOORA_Database;
      cnn_DbfToOra.Open;
    except
      on E: Exception do
      Begin
        WriteToLog('������',E.Message+#13#10+'�� ������� �������� ������ � ���� DBFTOORA: '+DBFTOORA_Connection,false,0,'');
        Result:=false;
        cnn_DbfToOra.Close;
      end;
    end;

  { ������� ������ ����������� ������ }
  If Result Then
  try
    qDbfList.Close;
    qDbfList.SQL.Clear;
    qDbfList.SQL.Add('SELECT * FROM ''' + FileList + '''');
    qDbfList.Open;
  except
    on E: Exception do
    Begin
      WriteToLog('������',E.Message+#13#10+'�� ������� �������� ������ � ����� �� ������� ����������� ������: '+FileList,false,0,'');
      Result:=false;
      qDbfList.Close;
    end;
  end;

end;

function MySort(List: TStringList; Index1, Index2: Integer): Integer;
var Time1,Time2:TDateTime;
Begin
  Time1:=TMyObj(List.Objects[Index1]).SearchRec.Time;
  Time2:=TMyObj(List.Objects[Index2]).SearchRec.Time;
  If Time1<Time2 then MySort:=-1
  else If Time1=Time2 then MySort:=0
       else MySort:=1;
End;

function RndStr(len:integer):string;
var d:double;
    i:integer;
Begin
  d:=Time;
  for i:=1 to len do d:=d*10;
  Result:=FloatToStr(Round(d));
End;

procedure TFormMain.ExecuteLoading;
var DBF_Title,GlobalPath:string;
    sr: TSearchRec;
    lst: TStringList;
    MyObj:TMyObj;
    F: TextFile;
    i:integer;
    CheckIs:boolean;
    s,FlagIs:string;
Begin
  OLD_SRC_DSN:='';
  OLD_DST_DSN:='';
  OLD_SP_DSN:='';
  FlagSRCInit:=false;
  FlagDSTInit:=false;
  DBF_Title:='';
  GlobalPath:='';

  { �������� ������ ������ }
  IF DelFlags<>'' Then
  Begin
    if FindFirst(DelFlags+'*.ok', faArchive, sr) = 0 then
    begin
      repeat
        {$I-}
        AssignFile(F, DelFlags+sr.Name);
        FileMode := 0;  {Set file access to read only }
        Reset(F);
        {$I+}
        if (IOResult = 0) And (DelFlags+sr.Name<>'') then
        Begin
          DBF_Title:='';
          GlobalPath:='';
          IF NOT Eof(F) Then Readln(F, DBF_Title);
          IF NOT Eof(F) Then Readln(F, GlobalPath);
          CloseFile(F);
          DBF_Title:=UpperCase(Trim(DBF_Title));
          GlobalPath:=UpperCase(Trim(GlobalPath));
          If (Copy(GlobalPath,1,6)='C:\TMP') OR (Copy(GlobalPath,1,7)='C:\TEMP') Then
          Begin
            if not SysUtils.DeleteFile(GlobalPath) then
              WriteToLog('��������','���� '+GlobalPath+' �� ������',false,0,'');
            s:=UpperCase(ExtractFileName(GlobalPath));
            s:=copy(s,1,length(s)-4);
            if not SysUtils.DeleteFile(ExtractFilePath(GlobalPath)+s+'.FPT') then
              WriteToLog('��������','���� '+ExtractFilePath(GlobalPath)+s+'.FPT'+' �� ������',false,0,'');
            SysUtils.DeleteFile(DelFlags+sr.Name);
          End;
        end
        else CloseFile(F);
      until FindNext(sr) <> 0;
    end;
    FindClose(sr);
  end;

  { ����� �������� � ������� }
  IF ORAFlags<>'' Then
  Begin
    lst:=TStringList.Create;
    if FindFirst(ORAFlags+'*.ok', faArchive, sr) = 0 then
    begin
      repeat
        MyObj:=TMyObj.Create;
        MyObj.SearchRec:=sr;
        lst.AddObject(sr.Name,MyObj);
      until FindNext(sr) <> 0;
    end;
    FindClose(sr);
    lst.CustomSort(MySort);
    for i:=0 to lst.Count-1 do
    Begin
      sr:=TMyObj(lst.Objects[i]).SearchRec;
      {$I-}
      AssignFile(F, ORAFlags+sr.Name);
      FileMode := 0;  {Set file access to read only }
      Reset(F);
      {$I+}
      if (IOResult = 0) And (ORAFlags+sr.Name<>'') then
      Begin
        DBF_Title:='';
        GlobalPath:='';
        IF NOT Eof(F) Then Readln(F, DBF_Title);
        IF NOT Eof(F) Then Readln(F, GlobalPath);
        CloseFile(F);
        DBF_Title:=UpperCase(Trim(DBF_Title));
        GlobalPath:=UpperCase(Trim(GlobalPath));
        TMyObj(lst.Objects[i]).Free;
        CheckIs:=false;
        LoadDbf(DBF_Title,GlobalPath,CheckIs,FlagIs);
        if NOT CheckIs Then
        Begin
          IF (Copy(GlobalPath,1,6)='C:\TMP') OR (Copy(GlobalPath,1,7)='C:\TEMP') Then
          Begin
            WriteToLog('��������','���� '+GlobalPath+' ����� ������',false,0,'');
            if FileExists(ORAFlags+sr.Name) then
              MoveFile(ORAFlags+sr.Name,DelFlags+sr.Name);
          End;
          SysUtils.DeleteFile(ORAFlags+sr.Name);
        End;
      End
      Else CloseFile(F);
    end;
    lst.Clear;
    lst.Free;
  end;

  { ������� �� ���������� ���������� ������}
  DBF_Title:=UpperCase(Trim(ParamStr(1)));
  GlobalPath:=UpperCase(Trim(ParamStr(2)));
  CheckIs:=false;
  FlagIs:='';
  if DBF_Title<>'' then LoadDbf(DBF_Title,GlobalPath,CheckIs,FlagIs);
  If CheckIs Then
  Begin
    {$I-}
    AssignFile(f,ORAFlags+RndStr(8)+'.ok');
    Rewrite(f);
    {$I+}
    if (IOResult = 0) then
    Begin
      WriteLn(f,DBF_Title);
      WriteLn(f,GlobalPath);
    end;
    CloseFile(f);
  End;

  DoneConnection('SOURCE');
  DoneConnection('DESTINATION');
  DoneConnection('SP');
end;

Procedure TFormMain.DoneConnection(KindConn:string);
Begin
  try
    If KindConn='SOURCE' then
    Begin
      cnn_DOA_SRC.Logoff;
      cnn_ADO_SRC.Close;
    End
    Else If KindConn='DESTINATION' then
         Begin
           cnn_DOA_DST.Logoff;
           cnn_ADO_DST.Close;
         End
         Else
         Begin
           cnn_ADO_SP.Close;
         End;
  except
  end;
End;

Function TFormMain.InitConnection(KindConn:string;NameConn:string;ID:integer;FILENAME:string):boolean;
var
  Reg: TIniFile;
  Str_Conn:string;
  Type_Conn:string;
  Database_Conn:string;
  Password_Conn:string;
  Username_Conn:string;
Begin
  Result:=false;
  KindConn:=Trim(UpperCase(KindConn));
  NameConn:=Trim(UpperCase(NameConn));
  If NameConn='' then exit;

  Reg := TIniFile.Create(ExtractFilePath(ParamStr(0))+'DbfToOra.INI');
  try
    Type_Conn:=Trim(UpperCase(Reg.ReadString(NameConn, 'TYPE', '')));
    Str_Conn:=Trim(UpperCase(Reg.ReadString(NameConn, 'CONNECTION', '')));
    Database_Conn:=Trim(UpperCase(Reg.ReadString(NameConn, 'DATABASE', '')));
    Password_Conn:=Trim(UpperCase(Reg.ReadString(NameConn, 'PASSWORD', '')));
    Username_Conn:=Trim(UpperCase(Reg.ReadString(NameConn, 'USERNAME', '')));
  finally
    Reg.Free;
  end;

  try
    If KindConn='SOURCE' then
    Begin
      If NameConn<>OLD_SRC_DSN Then
      Begin
        If (Type_Conn='DOA') OR (Type_Conn='DPL') OR (Type_Conn='DAI') Then
        Begin
          cnn_DOA_SRC.Logoff;
          cnn_DOA_SRC.LogonDatabase:=Database_Conn;
          cnn_DOA_SRC.LogonUserName:=Username_Conn;
          cnn_DOA_SRC.LogonPassword:=Password_Conn;
          cnn_DOA_SRC.Logon;
          SRC_TYPE:=Type_Conn;
        End
        Else
          If (Type_Conn='HLC') Then
          Begin
            cmm_HLC_SRC_Select.Close;
            cmm_HLC_SRC_Select.DatabaseName:=Database_Conn;
            cmm_HLC_SRC_Select.UseDeleted:=false;
            cmm_HLC_SRC_Select.SetDBFCache(true);
            SRC_TYPE:=Type_Conn;
          End
          Else
          Begin
            cnn_ADO_SRC.Close;
            cnn_ADO_SRC.ConnectionString := Str_Conn;
            if Type_Conn<>'ORACLE' then
              cnn_ADO_SRC.DefaultDatabase := Database_Conn
            else
              cnn_ADO_SRC.DefaultDatabase := '';
            cnn_ADO_SRC.Open;
            SRC_TYPE:=Type_Conn;
          End;
        OLD_SRC_DSN:=NameConn;
      End;
    End
    Else If KindConn='DESTINATION' then
         Begin
           If NameConn<>OLD_DST_DSN Then
           Begin
              If (Type_Conn='DOA') OR (Type_Conn='DPL') OR (Type_Conn='DAI') Then
              Begin
                cnn_DOA_DST.Logoff;
                cnn_DOA_DST.LogonDatabase:=Database_Conn;
                cnn_DOA_DST.LogonUserName:=Username_Conn;
                cnn_DOA_DST.LogonPassword:=Password_Conn;
                cnn_DOA_DST.Logon;
                DST_TYPE:=Type_Conn;
              End
              Else
              Begin
                cnn_ADO_DST.Close;
                cnn_ADO_DST.ConnectionString := Str_Conn;
                if Type_Conn<>'ORACLE' then
                  cnn_ADO_DST.DefaultDatabase := Database_Conn
                else
                  cnn_ADO_DST.DefaultDatabase := '';
                cnn_ADO_DST.Open;
                DST_TYPE:=Type_Conn;
              End;
              OLD_DST_DSN:=NameConn;
           end;
         End
         Else
         Begin
            If NameConn<>OLD_SP_DSN Then
            Begin
              cnn_ADO_SP.Close;
              cnn_ADO_SP.ConnectionString := Str_Conn;
              if Type_Conn<>'ORACLE' then
                cnn_ADO_SP.DefaultDatabase := Database_Conn
              Else
                cnn_ADO_SP.DefaultDatabase := '';
              cnn_ADO_SP.Open;
              SP_TYPE:=Type_conn;
              OLD_SP_DSN:=NameConn;
            end;
         End;
    Result:=true;
  except
    on E: Exception do
    Begin
      If (Type_Conn='DOA') OR (Type_Conn='DPL') OR (Type_Conn='DAI') Then
        WriteToLog('������',E.Message+#13#10+'�� ������� �������� ������ � ���� ������ '+NameConn+' ����� DOA: '+Database_conn+' '+Username_conn+' '+Password_conn,FlagMGRSRFind,ID,FILENAME)
      else If (Type_Conn='HLC') Then
             WriteToLog('������',E.Message+#13#10+'�� ������� �������� ������ � ���� ������ '+NameConn+' ����� Halcion: '+Database_conn+' '+Username_conn+' '+Password_conn,FlagMGRSRFind,ID,FILENAME)
           Else
             WriteToLog('������',E.Message+#13#10+'�� ������� �������� ������ � ���� ������ '+NameConn+' ����� ADO: '+Str_Conn+' '+Database_Conn,FlagMGRSRFind,ID,FILENAME);
      Result:=false;
    end;
  end;
End;

Procedure TFormMain.DoneLoading;
Begin
  Label1.Caption:='';
  lbTableName.Caption:='';
  UpdateStLine('���������� ������ �������');
  { ��� ��������� }
  qDbfList.Close;
  taLogTask.Close;
  cnn_DBFTOORA.Close;
  cnn_MgrSr.Close;
  WriteToLog('�����','���������� ������ �������',false,0,'');
End;

function TFormMain.LoadDBF(DBF_Title:string; GlobalPath:string; VAR CheckIs:boolean; VAR FlagIs:string):boolean;
var
  IsSP:boolean;
  ID:integer;
  FlagLoad:boolean;
  pFileDT:integer;
  pNewSize:real;
  DT_Beg:TDateTime; {���� ������ ������� �������}
  DT_End:TDateTime; {���� ��������� ������� �������}
  q:TADOQuery;
  Filename:string;
  Owner_ID:integer;
  pForOwner:boolean;
  pFileName: string;
  pLastDT: string;
  pLastSize:real;
  pNewDT: string;
  f: file of Byte;
  pModule,pParams: String;
  i:integer;
  As_Title,s:string;
  Reg: TIniFile;
  LoadParam:TLoadParam;

begin
  if (DBF_Title='') OR NOT qDbfList.Locate('TITLE',DBF_Title,[]) Then
  Begin
    Result:=false;
    WriteToLog('������','������� '+DBF_Title+' �� ����������',false,0,'');
    exit;
  End;

  LoadParam.Title:=DBF_Title;
  with qDbfList do
  Begin
    LoadParam.As_Title:=DBF_Title;
    LoadParam.SRC_DSN:=UpperCase(Trim(FieldByName('SRC_DSN').AsString));
    LoadParam.SRC_TABLE:=UpperCase(Trim(FieldByName('SRC_TABLE').AsString));
    LoadParam.SRC_FIELDS:=UpperCase(Trim(FieldByName('SRC_FIELDS').AsString));
    LoadParam.SRC_WHERE:=UpperCase(Trim(FieldByName('SRC_WHERE').AsString));
    LoadParam.DST_DSN:=UpperCase(Trim(FieldByName('DST_DSN').AsString));
    LoadParam.DST_TABLE:=UpperCase(Trim(FieldByName('DST_TABLE').AsString));
    LoadParam.DST_FIELDS:=UpperCase(Trim(FieldByName('DST_FIELDS').AsString));
    LoadParam.SP_DSN:=UpperCase(Trim(FieldByName('SP_DSN').AsString));
    LoadParam.SP_NAME:=UpperCase(Trim(FieldByName('SP_NAME').AsString));
    LoadParam.STAT_TABLE:=UpperCase(Trim(FieldByName('STAT_TABLE').AsString));
    LoadParam.DATE_FIELD:=UpperCase(Trim(FieldByName('DATE_FIELD').AsString));
    LoadParam.DATE_BEG:=UpperCase(Trim(FieldByName('DATE_BEG').AsString));
    LoadParam.DATE_END:=UpperCase(Trim(FieldByName('DATE_END').AsString));
    LoadParam.PARAM1:=UpperCase(Trim(FieldByName('PARAM1').AsString));
    LoadParam.PARAM2:=UpperCase(Trim(FieldByName('PARAM2').AsString));
    LoadParam.PARAM3:=UpperCase(Trim(FieldByName('PARAM3').AsString));
    LoadParam.LASTDATE:=FieldByName('LASTDATE').AsDateTime;
    LoadParam.LASTTIME:=UpperCase(Trim(FieldByName('LASTTIME').AsString));
    LoadParam.LASTSIZE:=FieldByName('LASTSIZE').AsFloat;
    LoadParam.MODE_UPD:=FieldByName('MODE_UPD').AsInteger;
    LoadParam.FLAG_IS:=UpperCase(Trim(FieldByName('FLAG_IS').AsString));
  end;

  As_Title:=UpperCase(Trim(qDbfList.FieldByName('AS_TITLE').AsString));
  if As_Title='' then As_Title:=DBF_Title;

  If qDbfList.Locate('TITLE',AS_Title,[]) then
  with qDbfList do
  Begin
    LoadParam.As_Title:=As_Title;
    IF LoadParam.SRC_DSN='' Then
      LoadParam.SRC_DSN:=UpperCase(Trim(FieldByName('SRC_DSN').AsString));
    IF LoadParam.SRC_TABLE='' Then
      LoadParam.SRC_TABLE:=UpperCase(Trim(FieldByName('SRC_TABLE').AsString));
    IF LoadParam.SRC_FIELDS='' Then
      LoadParam.SRC_FIELDS:=UpperCase(Trim(FieldByName('SRC_FIELDS').AsString));
    IF LoadParam.SRC_WHERE='' Then
      LoadParam.SRC_WHERE:=UpperCase(Trim(FieldByName('SRC_WHERE').AsString));
    IF LoadParam.DST_DSN='' Then
      LoadParam.DST_DSN:=UpperCase(Trim(FieldByName('DST_DSN').AsString));
    IF LoadParam.DST_TABLE='' Then
      LoadParam.DST_TABLE:=UpperCase(Trim(FieldByName('DST_TABLE').AsString));
    IF LoadParam.DST_FIELDS='' Then
      LoadParam.DST_FIELDS:=UpperCase(Trim(FieldByName('DST_FIELDS').AsString));
    IF LoadParam.SP_DSN='' Then
      LoadParam.SP_DSN:=UpperCase(Trim(FieldByName('SP_DSN').AsString));
    IF LoadParam.SP_NAME='' Then
      LoadParam.SP_NAME:=UpperCase(Trim(FieldByName('SP_NAME').AsString));
    IF LoadParam.STAT_TABLE='' Then
      LoadParam.STAT_TABLE:=UpperCase(Trim(FieldByName('STAT_TABLE').AsString));
    IF LoadParam.DATE_FIELD='' Then
      LoadParam.DATE_FIELD:=UpperCase(Trim(FieldByName('DATE_FIELD').AsString));
    IF LoadParam.DATE_BEG='' Then
      LoadParam.DATE_BEG:=UpperCase(Trim(FieldByName('DATE_BEG').AsString));
    IF LoadParam.DATE_END='' Then
      LoadParam.DATE_END:=UpperCase(Trim(FieldByName('DATE_END').AsString));
    IF LoadParam.PARAM1='' Then
      LoadParam.PARAM1:=UpperCase(Trim(FieldByName('PARAM1').AsString));
    IF LoadParam.PARAM2='' Then
      LoadParam.PARAM2:=UpperCase(Trim(FieldByName('PARAM2').AsString));
    IF LoadParam.PARAM3='' Then
      LoadParam.PARAM3:=UpperCase(Trim(FieldByName('PARAM3').AsString));
    IF LoadParam.FLAG_IS='' Then
      LoadParam.FLAG_IS:=UpperCase(Trim(FieldByName('FLAG_IS').AsString));
  End;
  IF LoadParam.SP_NAME='-' Then
      LoadParam.SP_NAME:='';
  IF LoadParam.DATE_FIELD='-' Then
      LoadParam.DATE_FIELD:='';
  IF LoadParam.DATE_BEG='-' Then
      LoadParam.DATE_BEG:='';
  IF LoadParam.DATE_END='-' Then
      LoadParam.DATE_END:='';
  IF LoadParam.PARAM1='-' Then
      LoadParam.PARAM1:='';
  IF LoadParam.PARAM2='-' Then
      LoadParam.PARAM2:='';
  IF LoadParam.PARAM3='-' Then
      LoadParam.PARAM3:='';

  if LoadParam.FLAG_IS='' then
  begin
    s:=ExtractFileName(LoadParam.STAT_TABLE);
    i:=Pos(',',s);
    if i=0 then i:=length(s);
    if i>8 then i:=8;
    LoadParam.Flag_IS:=Copy(s,1,i);
  end;
  if LoadParam.FLAG_IS='' then
  begin
    s:=ExtractFileName(LoadParam.DST_TABLE);
    i:=Pos(',',s);
    if i=0 then i:=length(s);
    if i>8 then i:=8;
    LoadParam.Flag_IS:=Copy(s,1,i);
  end;
  FlagIs:=LoadParam.FLAG_IS;

  { ��������� � ������� ���� ������� }
  If FileAge(ORAFlags+LoadParam.FLAG_IS)<>-1 then  { ������ ������� ��� ������������ }
  Begin
    CheckIs:=true;
    Result:=false;
    WriteToLog('��������','������� '+DBF_Title+' ��� ����������� � ������� ��������.',false,0,'');
    exit;
  End
  Else
  Begin
    If LoadParam.FLAG_IS<>'' Then
    Begin
      AssignFile(f,ORAFlags+LoadParam.FLAG_IS);
      Rewrite(f);
      CloseFile(f);
    end;
  End;

  IsSP:=false;
  Result:=false;

  Label1.Caption:='';
  lbTableName.Caption:=Dbf_Title;
  UpdateStLine('������� '+Dbf_Title);

  FlagMGRSRFind:=false;
  FlagLoad:=false;
  ID:=0;
  pFileDT:=DateTimeToFileDate(Now);
  pNewSize:=0;
  DT_Beg:=NOW-1;
  DT_End:=NOW;

  Reg := TIniFile.Create(ExtractFilePath(ParamStr(0))+'DbfToOra.INI');
  if (LoadParam.SRC_DSN<>'') and (LoadParam.DST_DSN<>'') then
  try
    SRC_TYPE:=Trim(UpperCase(Reg.ReadString(LoadParam.SRC_DSN, 'TYPE', '')));
    DST_TYPE:=Trim(UpperCase(Reg.ReadString(LoadParam.DST_DSN, 'TYPE', '')));
  finally
    Reg.Free;
  end
  else
  begin
    SRC_TYPE:='';
    DST_TYPE:='';
  end;

  IF (LoadParam.MODE_UPD<>3) THEN
  IF cnn_MGRSR.Connected Then
  Begin
    FlagMGRSRFind:=false;
    { �������� �� ������� ������ � ������� ��������� �� ��������� �� ��������� }
    q:=TADOQuery.Create(Self);
    with q do
    try
      Connection:=cnn_MGRSR;
      SQL.Add('SELECT * FROM loadtask WHERE TASK='''+As_Title+'''');
      Open;

      If NOT Eof Then
      Begin
        { � ��������� ���� ���������� � ������ ������� }
        ID:=FieldByName('ID').AsInteger;
        Filename:=Trim(FieldByName('FILENAME').AsString);
        Owner_ID:=FieldByName('Owner_ID').AsInteger;
{        If (FieldByName('RUN').AsBoolean = True) OR (DBF_Title = CommandLine) then
        begin}
          pForOwner:=FieldByName('FOR_OWNER').AsBoolean;
          If (SRC_TYPE='DBF') OR (SRC_TYPE='HLC') Then
          Begin

            IF (DBF_Title=As_Title) Then // ����� ���������� � ����� �� ���������
            Begin
              IF (GlobalPath<>'') Then
              Begin
                If Pos('.DBF',GlobalPath)=0 Then
                  pFileName:=GlobalPath+ExtractFileName(Trim(FieldByName('FILENAME').AsString))
                Else
                  pFileName:=GlobalPath;
              End
              Else pFileName := Trim(FieldByName('FILENAME').AsString);
              pLastDT := DateToStr(FieldByName('LASTDATE').AsDateTime) +
                         FieldByName('LASTTIME').AsString;
              pLastSize := FieldByName('LASTSIZE').AsFloat;
            end
            else // ����� ����� ���������� � ����� �� DBFTOORA
            begin
              IF (GlobalPath<>'') Then
              Begin
                If Pos('.DBF',GlobalPath)=0 Then
                  pFileName:=GlobalPath+ExtractFileName(LoadParam.SRC_TABLE)
                Else
                  pFileName:=GlobalPath;
              End
              Else pFileName := LoadParam.SRC_TABLE;
              pLastDT := DateToStr(LoadParam.LASTDATE)+LoadParam.LASTTIME;
              pLastSize := LoadParam.LASTSIZE;
            end;

            pFileDT:=FileAge(pFileName);
            if pFileDT<>-1 then // ���� ����������� ���� ��������� - �������� ���� � ������� ���������� ���������
            begin
              pNewDT:=DateToStr(FileDateToDateTime(pFileDT)) +
                      TimeToStr(FileDateToDateTime(pFileDT));
             {$I-}
              AssignFile(f, pFileName);
              Reset(f);
              {$I+}
              if (IOResult = 0) then
                pNewSize := FileSize(f)
              else
                pNewSize := 0;
              CloseFile(f);
              IF (LoadParam.MODE_UPD=2) OR
                 ((pNewSize<>pLastSize) OR ((LoadParam.MODE_UPD=0) AND (pNewDT<>pLastDT))) OR
                 (pForOwner AND FileChanged(Owner_ID)) Then // ���� ���������, ��������� �������
              Begin
                pModule:=Trim(FieldByName('MODULE').AsString);
                pParams:=Trim(FieldByName('PARAMS').AsString);
                if pModule<>'' then //���������� ������������� �����
                try
{                  Launcher1.WorkDir:=ExtractFileDir(Trim(pModule));
                  Launcher1.ProgramName:=pModule;
                  Launcher1.Parameters:=pParams;
                  Launcher1.Launch;}
                except
                End;
                FlagLoad:=true;
              end
              else WriteToLog('��������','���� '+pFileName+' �� ���������',FlagMGRSRFind,ID,FILENAME);
            end
            else WriteToLog('��������','���� '+pFileName+' �� ���������',FlagMGRSRFind,ID,FILENAME);
          end
          Else
          Begin
            pFileDT:=DateTimeToFileDate(Now);
            pNewSize:=0;
            FlagLoad:=true;
          end;
        {End;}
        FlagMGRSRFind:=true;
      End;
    finally
      q.Close;
      q.SQL.Clear;
      q.Free;
    end;
  end;

  IF (LoadParam.MODE_UPD<>3) THEN
  if NOT FlagMGRSRFind then
  Begin
    { � ��������� ��� ���������� � ������ ������� }
    FlagMGRSRFind:=false;
    If (SRC_TYPE='DBF') OR (SRC_TYPE='HLC') Then
    Begin
      { �������� - DBF, ������ ��������� �� ������� ��������� }
      IF (GlobalPath<>'') Then
      Begin
        If Pos('.DBF',GlobalPath)=0 Then
          pFileName:=GlobalPath+ExtractFileName(LoadParam.SRC_TABLE)
        Else
          pFileName:=GlobalPath;
      End
      Else pFileName := LoadParam.SRC_TABLE;
      pLastDT := DateToStr(LoadParam.LASTDATE)+LoadParam.LASTTIME;
      pLastSize := LoadParam.LASTSIZE;
      pFileDT:=FileAge(pFileName);
      if pFileDT<>-1 then // ���� ����������� ���� ��������� - �������� ���� � ������� ���������� ���������
      begin
        pNewDT:=DateToStr(FileDateToDateTime(pFileDT)) +
                TimeToStr(FileDateToDateTime(pFileDT));
        {$I-}
        AssignFile(f, pFileName);
        Reset(f);
        {$I+}
        if (IOResult = 0) then
          pNewSize := FileSize(f)
        else
          pNewSize := 0;
        CloseFile(f);
        FlagLoad:=(LoadParam.MODE_UPD=2) OR ((pNewSize<>pLastSize) OR ((LoadParam.MODE_UPD=0) AND (pNewDT<>pLastDT)));
      end
      else WriteToLog('��������','���� '+pFileName+' �� ���������',FlagMGRSRFind,ID,FILENAME);
    end
    Else
    Begin
      pFileDT:=DateTimeToFileDate(Now);
      pNewSize:=0;
      FlagLoad:=true;
    END;
  End;

  { �������� ������� }
  If FlagLoad Then
  Begin
    { ���������� � ����������� }
    FlagSRCInit:=InitConnection('SOURCE',LoadParam.SRC_DSN,ID,FILENAME);
    FlagDSTInit:=InitConnection('DESTINATION',LoadParam.DST_DSN,ID,FILENAME);
    Result:=false;
    If FlagSRCInit AND FlagDSTInit Then
    Begin
      { ������ ���������� � ����������� ������� �� ����� DbfToOra.dbf}
      IF ((SRC_TYPE='DBF') OR (SRC_TYPE='HLC')) AND (GlobalPath<>'') Then
      Begin
        If Pos('.DBF',UpperCase(GlobalPath))=0 Then
          LoadParam.SRC_Table:=GlobalPath+ExtractFileName(LoadParam.SRC_Table)
        Else
          LoadParam.SRC_Table:=GlobalPath;
      end;
      IF LoadParam.Date_field<>'' then
      Begin
        s:=LoadParam.DATE_BEG;
        DT_Beg   := GenerateDate(s,NOW-1);
        DT_End   := GenerateDate(LoadParam.DATE_END,NOW);
        If LoadParam.SRC_Where<>'' Then LoadParam.SRC_Where:='('+LoadParam.SRC_Where+') AND ';
        IF SRC_TYPE='DBF' Then
        begin
          LoadParam.SRC_Where  := LoadParam.SRC_Where + '('+LoadParam.Date_field + '>= {' +IntToStr(ExtractMonth(DT_Beg))+'/'+
                      IntToStr(ExtractDay(DT_Beg))+'/'+IntToStr(ExtractYear(DT_Beg))+ '}) AND ('+
                      LoadParam.Date_field + '<= {'+IntToStr(ExtractMonth(DT_End))+'/'+
                      IntToStr(ExtractDay(DT_End))+'/'+IntToStr(ExtractYear(DT_End))+ '})';
        End
        Else
        Begin
          LoadParam.SRC_Where  := LoadParam.SRC_Where + '('+LoadParam.Date_field + '>= #' +IntToStr(ExtractMonth(DT_Beg))+'/'+
                      IntToStr(ExtractDay(DT_Beg))+'/'+IntToStr(ExtractYear(DT_Beg))+ '#) AND ('+
                      LoadParam.Date_field + '<= #'+IntToStr(ExtractMonth(DT_End))+'/'+
                      IntToStr(ExtractDay(DT_End))+'/'+IntToStr(ExtractYear(DT_End))+ '#)';
        End;
      End;

      { ������������ ������� }
      Result:=true;
      try
        If NOT FlagOnlyProc Then
          ProcessTable(LoadParam.SRC_Table,LoadParam.SRC_Fields,LoadParam.SRC_Where,LoadParam.DST_Table,LoadParam.DST_Fields,ID,FILENAME);
        IsSP:=true;
        q:=TADOQuery.Create(Self);
        If FlagMGRSRFind Then
        try
          q.Connection:=cnn_MGRSR;
          q.SQL.Add('UPDATE loadtask SET lastdate=:ld,lasttime=:lt,lastsize=:ls WHERE ID=:CurID');
          q.Parameters.ParamByName('LD').Value:=FileDateToDateTime(pFileDT);
          q.Parameters.ParamByName('LT').Value:=TimeToStr(FileDateToDateTime(pFileDT));
          q.Parameters.ParamByName('LS').Value:=pNewSize;
          q.Parameters.ParamByName('CurID').Value:=ID;
          q.ExecSQL;
        except
        end;

        try
          q.Close;
          q.Connection:=cnn_DBFTOORA;
          q.SQL.Clear;
          q.SQL.Add('UPDATE dbftoora SET lastdate=:ld,lasttime=:lt,lastsize=:ls WHERE TITLE=:TITLE');
          q.Parameters.ParamByName('LD').Value:=FileDateToDateTime(pFileDT);
          q.Parameters.ParamByName('LT').Value:=TimeToStr(FileDateToDateTime(pFileDT));
          q.Parameters.ParamByName('LS').Value:=pNewSize;
          q.Parameters.ParamByName('TITLE').Value:=DBF_Title;
          q.ExecSQL;
        except
        end;
        q.Close;
        q.SQL.Clear;
        q.Free;
      except
        on E: Exception do
        Begin
          WriteToLog('������',E.Message+#13#10+'�� ������� ��������� ������� '+LoadParam.SRC_Table+' � ������� ' +LoadParam.DST_Table,FlagMGRSRFind,ID,FILENAME);
          Result:=false;
        End;
      end;
    End;
  End;

  if Result AND FlagMGRSRFind Then
  Begin
    q:=TADOQuery.Create(Self);
    try
      q.Connection:=cnn_MGRSR;
      { ���������� ��������� ������� }
      q.SQL.Add('SELECT * FROM loadtask WHERE Owner_ID=:CurOwner');
      q.Parameters.ParamByName('CurOwner').Value:=ID;
      q.Open;
      for i:=1 to 1 do { ���-�� �������� }
      begin
        q.First;
        while NOT q.Eof do
        begin
          s:='';
          LoadDbf(q.FieldByName('TASK').AsString,'',CheckIs,s);
          q.Next;
        end;
      end;
    except
      on E: Exception do
      Begin
        WriteToLog('������',E.Message+#13#10+'�� ������� ��������� ��������� ������� �� ��������� (loadtask.dbf)',FlagMGRSRFind,ID,FILENAME);
      end;
    end;
    q.Close;
    q.SQL.Clear;
    q.Free;
  end;

  IF (LoadParam.MODE_UPD=3) THEN
  BEGIN
    IsSP:=true;
    Result:=true;
  END;

 { �������� �������� ��������� }
  if Result AND IsSP AND (LoadParam.SP_NAME<>'') Then
  If InitConnection('SP',LoadParam.SP_DSN,ID,FILENAME) Then
  try
    Label1.Caption:='���������� �������� ��������� '+LoadParam.SP_NAME;
    lbTableName.Caption:=DBF_Title;
    UpdateStLine('���������� �������� ��������� '+LoadParam.SP_NAME);
    ExecuteProc(LoadParam.SP_NAME,True,DT_Beg,DT_End,LoadParam.Param1,LoadParam.Param2,LoadParam.Param3,ID,FILENAME);
    Label1.Caption:='���������� ����������';
    lbTableName.Caption:=LoadParam.STAT_TABLE;
    UpdateStLine('���������� ����������');
    q:=TADOQuery.Create(Self);
    q.Connection:=cnn_ADO_SP;
    repeat
      if LoadParam.STAT_TABLE='' then break;
      i:=Pos(',',LoadParam.STAT_TABLE);
      if i=0 then i:=system.length(LoadParam.STAT_TABLE)+1;
      i:=i-1;
      try
        q.Close;
        q.SQL.Clear;
        q.SQL.Add('ANALYZE TABLE '+System.Copy(LoadParam.STAT_TABLE,1,i)+' COMPUTE STATISTICS');
        q.ExecSQL;
      except
        on E: Exception do
        Begin
          WriteToLog('������',E.Message+#13#10+'�� ������� �������� ���������� �� ������� '+LoadParam.STAT_TABLE,FlagMGRSRFind,ID,FILENAME);
        end;
      end;
      System.Delete(LoadParam.STAT_TABLE,1,i+1);
    until false;
    q.Close;
    q.SQL.Clear;
    q.Free;
  except
    on E: Exception do
    Begin
      Result:=false;
      WriteToLog('������',E.Message+#13#10+'�� ������� ��������� ��������� '+LoadParam.SP_NAME,FlagMGRSRFind,ID,FILENAME);
    end;
  End;
  FlagIs:=LoadParam.FLAG_IS;
  SysUtils.DeleteFile(ORAFlags+FlagIs);
end;

procedure TFormMain.WriteToLog(Title:string; ErrStr:string; WriteToLogTask:boolean; ID:integer; Filename:string);
begin

  {�������� �����-���������}
  IF NOT FileExists(Protokol) Then
  try
    FileClose(FileCreate(Protokol));
  except
    exit;
  end;

  {�������� �����-���������}
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

  IF (Title='�����') then
  Begin
    WriteLn(ErrF,'-----------------------------------------------------------');
    WriteLn(ErrF,ErrStr+': '+DateTimeToStr(Now));
  End
  Else
    If (Title = '�����') Then
    Begin
      WriteLn(ErrF,ErrStr+': '+DateTimeToStr(Now));
    end
    Else
    Begin
      WriteLn(ErrF,Title+': ' + DateTimeToStr(Now));
      WriteLn(ErrF,ErrStr);
    End;

  CloseFile(ErrF);

  If (Title<>'��������') AND (Title<>'���������') AND (Title<>'�����') AND (Title<>'�����')Then
  try
    if NMSMTP1.Connected then
      NMSMTP1.Disconnect
    else
    begin
      NMSMTP1.Host := MailHost;
      NMSMTP1.Port := MailPort;
      NMSMTP1.UserID := MailUserID;
      NMSMTP1.Connect;
    end;

    if NMSMTP1.Connected then
    Begin
      NMSMTP1.ClearParameters;
      NMSMTP1.PostMessage.FromAddress := MailFromAddress;
      NMSMTP1.PostMessage.FromName := MailFromName;
      NMSMTP1.PostMessage.Subject := 'Error DBFTOORA.EXE';
      NMSMTP1.PostMessage.ToAddress.Clear;
      NMSMTP1.PostMessage.ToAddress.Add(Recipient1);
      NMSMTP1.PostMessage.ToAddress.Add(Recipient2);
      NMSMTP1.PostMessage.ToAddress.Add(Recipient3);
      NMSMTP1.PostMessage.ToAddress.Add(Recipient4);
      NMSMTP1.PostMessage.ToAddress.Add(Recipient5);
      NMSMTP1.PostMessage.Body.Clear;
      NMSMTP1.PostMessage.Body.Text:=ParamStr(0)+CHR(13)+CHR(10)+'���� � �����:' + DateTimeToStr(Now)+CHR(13)+CHR(10)+ErrStr;
      NMSMTP1.PostMessage.LocalProgram:='DBFTOORA.EXE';
      NMSMTP1.SendMail;
      NMSMTP1.ClearParameters;
      NMSMTP1.Disconnect;
(*      try
        taLogTask.Open;
        taLogTask.Append;
        taLogTask['ID']:=ID;
        taLogTask['FILENAME']:=FILENAME;
        taLogTask.FieldByName('LASTDATE').AsDateTime:=DATE;
        taLogTask.FieldByName('LASTTIME').AsString:=TimeToStr(TIME);
        taLogTask.FieldByName('ERROR').AsBoolean:=(Title='������');
        taLogTask.FieldByName('INFO').AsString:='���������� ������ �� �����:'+Recipient1+' � '+Recipient2;
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
    taLogTask.FieldByName('ERROR').AsBoolean:=(Title='������');
    taLogTask.FieldByName('INFO').AsString:=ErrStr;
    taLogTask.Post;
  except
    taLogTask.Cancel;
  end;

end;

Procedure TFormMain.ExecuteProc(ORA_Sp:string;ExistParam:boolean;DT_Beg,DT_End:TDateTime;Param1,Param2,Param3:string;ID:integer;FILENAME:string);
Begin
  with ADOStoredProc1 do
  try
    ProcedureName:=ORA_Sp;
    Parameters.Clear;
    if ExistParam then
    Begin
      Parameters.CreateParameter('Date_Beg', ftDateTime, pdInput, 20, DT_Beg);
      Parameters.CreateParameter('Date_End', ftDateTime, pdInput, 20, DT_End);
      Parameters.CreateParameter('Param1', ftString, pdInput, 20, Param1);
      Parameters.CreateParameter('Param2', ftString, pdInput, 20, Param2);
      Parameters.CreateParameter('Param3', ftString, pdInput, 20, Param3);
    end;
    ExecProc;
  except
    on E: Exception do WriteToLog('������',E.Message+#13#10+'�� ������� ��������� ��������� '+ORA_Sp,FlagMGRSRFind,ID,Filename);
  end;
End;


Procedure TFormMain.ProcessTable(SRC_Table,SRC_Fields,SRC_Where,DST_Table,DST_Fields:string;ID:integer;Filename:string);
const ArraySize=100;
Var dpl_Row,i: Integer;
    j: Longint;
    str:TStringList;
    str_InsertHead: String;
    str_Insert: String;
    str_InsertTo: String;
{    s: string;}
    SelStr: string;
    IsOk:boolean;
    FromCount: longint;
    ToCount: longint;
    FromFields:TStringList;

    FieldObject:TMyFieldObject;
    FieldsCount:integer;
    FieldName:string;
    IsEof:boolean;
    FieldsValue:variant;
    MyList:TMyItems;
Begin
  FromFields := TStringList.Create;
  try

    { ������� ����� }
    IF (SRC_TYPE='DOA') OR (SRC_TYPE='DPL') OR (SRC_TYPE='DAI') Then
    Begin
      cmm_DOA_SRC_Select.Close;
      cmm_DOA_SRC_Select.SQL.Clear;
      SelStr:='SELECT COUNT(*) AS CNT1 FROM ' + SRC_Table;
      If (SRC_Where <> '') then SelStr:=SelStr+' WHERE ' + SRC_Where;
      cmm_DOA_SRC_Select.SQL.Add(SelStr);
      cmm_DOA_SRC_Select.Execute;
      FromCount:=cmm_DOA_SRC_Select.FieldAsInteger('CNT1');
    end
    else
      IF (SRC_TYPE='HLC') Then
      Begin
        cmm_HLC_SRC_Select.Close;
        cmm_HLC_SRC_Select.DatabaseName:=ExtractFilePath(SRC_Table);
        cmm_HLC_SRC_Select.TableName:=ExtractFileName(SRC_Table);
        cmm_HLC_SRC_Select.Open;
        FromCount:=cmm_HLC_SRC_Select.RecordCount;
      end
      else
      begin
        cmm_ADO_SRC_Select.Close;
        cmm_ADO_SRC_Select.SQL.Clear;
        IF SRC_TYPE='DBF' Then
          SelStr:='SELECT COUNT(*) AS CNT1 FROM ''' + SRC_Table + ''''
        Else
          SelStr:='SELECT COUNT(*) AS CNT1 FROM ' + SRC_Table;
        If (SRC_Where <> '') then SelStr:=SelStr+' WHERE ' + SRC_Where;
        cmm_ADO_SRC_Select.SQL.Add(SelStr);
        cmm_ADO_SRC_Select.Open;
        FromCount:=cmm_ADO_SRC_Select.FieldByName('CNT1').AsInteger;
      end;

    { ��������� �������� ������� }
    IF (SRC_TYPE='DOA') OR (SRC_TYPE='DPL') OR (SRC_TYPE='DAI') Then
    Begin
      cmm_DOA_SRC_Select.Close;
      cmm_DOA_SRC_Select.SQL.Clear;
      SelStr:='SELECT ' + SRC_Fields + ' FROM ' + SRC_Table;
      If (SRC_Where <> '') then SelStr:=SelStr+' WHERE ' + SRC_Where;
      cmm_DOA_SRC_Select.SQL.Add(SelStr);
      cmm_DOA_SRC_Select.Execute;
      FieldsCount:=cmm_DOA_SRC_Select.FieldCount;
    end
    Else
      IF (SRC_TYPE='HLC') Then
      Begin
        FieldsCount:=cmm_HLC_SRC_Select.Fields.Count;
      end
      Else
      Begin
        cmm_ADO_SRC_Select.Close;
        cmm_ADO_SRC_Select.SQL.Clear;
        IF SRC_TYPE='DBF' Then
          SelStr:='SELECT ' + SRC_Fields + ' FROM ''' + SRC_Table + ''''
        Else
          SelStr:='SELECT ' + SRC_Fields + ' FROM ' + SRC_Table;
        If (SRC_Where <> '') then SelStr:=SelStr+' WHERE ' + SRC_Where;
        cmm_ADO_SRC_Select.SQL.Add(SelStr);
        cmm_ADO_SRC_Select.Open;
        FieldsCount:=cmm_ADO_SRC_Select.Fields.Count;
      End;

    { �������� ������ ����� �������-���������}
    IsOk:=true;
    str_InsertTo:='';
    For i := 1 To FieldsCount do
    Begin
      FieldObject:=TMyFieldObject.Create;
      IF (SRC_TYPE='DOA') OR (SRC_TYPE='DPL') OR (SRC_TYPE='DAI') Then
      Begin
        FieldName:=cmm_DOA_SRC_Select.FieldName(i - 1);
        FieldObject.DOAType:=cmm_DOA_SRC_Select.FieldType(i - 1);
        FieldObject.Value:=cmm_DOA_SRC_Select.Field(i - 1);
        FieldObject.Size:=cmm_DOA_SRC_Select.FieldSize(i - 1);
      End
      Else
        IF (SRC_TYPE='HLC') Then
        Begin
          FieldName:=cmm_HLC_SRC_Select.Fields[i - 1].FieldName;
          FieldObject.ADOType:=cmm_HLC_SRC_Select.Fields[i - 1].DataType;
          FieldObject.Value:=cmm_HLC_SRC_Select.Fields[i - 1].Value;
          FieldObject.Size:=cmm_HLC_SRC_Select.Fields[i - 1].Size;
        End
        Else
        Begin
          FieldName:=cmm_ADO_SRC_Select.Fields[i - 1].FieldName;
          FieldObject.ADOType:=cmm_ADO_SRC_Select.Fields[i - 1].DataType;
          FieldObject.Value:=cmm_ADO_SRC_Select.Fields[i - 1].Value;
          FieldObject.Size:=cmm_ADO_SRC_Select.Fields[i - 1].Size;
        End;
      FromFields.Add(FieldName);
      FromFields.Objects[i-1]:=FieldObject;
      Case TMyFieldObject(FromFields.Objects[i-1]).DataType of
        foBoolean: begin end;
        foString: begin end;
        foDateTime: begin end;
        foInteger: begin end;
        foFloat: begin end;
        else
          Begin
            WriteToLog('������','����������� ��� ����!'+#13#10+' �� ������� ��������� ������� '+SRC_Table+' � ������� ' +DST_Table,FlagMGRSRFind,ID,Filename);
            IsOk:=false;
          end;
      End;
      str_InsertTo := str_InsertTo + FieldName + ','
    end;
    str_InsertTo := Copy(str_InsertTo,1,Length(str_InsertTo) - 1);

    If IsOk then
    begin

      { ������� �������-���������� }
      IF (DST_TYPE='DOA') OR (DST_TYPE='DPL') OR (DST_TYPE='DAI') Then
      Begin
        cmm_DOA_Insert.Close;
        cmm_DOA_Insert.SQL.Clear;
        cmm_DOA_Insert.SQL.Add('TRUNCATE TABLE ' + DST_Table);
        cmm_DOA_Insert.Execute;
      End
      Else
        IF DST_TYPE='ORACLE' Then
        Begin
          cmm_ADO_Insert.CommandText := 'TRUNCATE TABLE ' + DST_Table;
          cmm_ADO_Insert.Execute;
        End
        Else
          IF DST_TYPE='DBF' Then
          Begin
            cmm_ADO_Insert.CommandText := 'DELETE FROM ''' + DST_Table + '''';
            cmm_ADO_Insert.Execute;
          End
          Else
          Begin
            cmm_ADO_Insert.CommandText := 'DELETE FROM ' + DST_Table;
            cmm_ADO_Insert.Execute;
          End;

      { �������������� DirectPathLoader � ������� }
      IF DST_TYPE='DPL' Then
      Begin
        dpl_DOA_Insert.TableName := DST_table;
        dpl_DOA_Insert.DateFormat:='dd.mm.yyyy';
{        dpl_DOA_Insert.Columns.Clear;
        for i:=1 to FromFields.Count do
        Begin
          dpl_DOA_Insert.Columns.Add(FromFields.Strings[i-1]);
          dpl_DOA_Insert.Columns[i-1].DataType:=TMyFieldObject(FromFields.Objects[i - 1]).DPLType;
          dpl_DOA_Insert.Columns[i-1].DataSize:=TMyFieldObject(FromFields.Objects[i - 1]).Size;
        End;}
        dpl_DOA_Insert.GetDefaultColumns(False);
        dpl_DOA_Insert.Prepare;
        FieldsValue:= VarArrayCreate([0,dpl_DOA_Insert.MaxRows,1,FromFields.Count],varVariant);
        dpl_Row:=0;
      End
      Else
        IF DST_TYPE='DAI' Then
        Begin
{          FieldsValue:= VarArrayCreate([0,ArraySize-1,1,FromFields.Count],varVariant);}
{          FieldsValue:= VarArrayCreate([1,FromFields.Count],varVariant);}
          MyList:=TMyItems.Create(TMyItem);
          for i:=1 to FromFields.Count do
          Begin
            with TMyItem.Create(MyList) do
            begin
              FieldsArray:=VarArrayCreate([0,ArraySize-1],varVariant);
            end;
          end;
          dpl_Row:=0;
          If DST_Fields<>'*' Then str_InsertTo:=DST_Fields;
          str_InsertHead := 'INSERT INTO /*+ APPEND NOCACHE */ ' + DST_Table + ' (' + str_InsertTo+ ') VALUES(';
          For i := 1 To FromFields.Count do
          Begin
            str_Insert := str_Insert + ':'+FromFields.Strings[i - 1]+',';
          end;
          str_Insert := str_InsertHead + Copy(str_Insert, 1, Length(str_Insert) - 1)+ ')';
          cmm_DAI_Insert.Close;
          cmm_DAI_Insert.SQL.Clear;
          cmm_DAI_Insert.DeleteVariables;
          cmm_DAI_Insert.SQL.Add(str_Insert);
          For i := 1 To FromFields.Count do
          Begin
            cmm_DAI_Insert.DeclareVariable(FromFields.Strings[i - 1], TMyFieldObject(FromFields.Objects[i - 1]).GetDOAType);
          end;
        End
        Else
        Begin
          { ��������� ��������� ������� �� ���������� }
          If DST_Fields<>'*' Then str_InsertTo:=DST_Fields;
          IF DST_TYPE='DBF' Then
            str_InsertHead := Chr(13) + Chr(10) + 'INSERT INTO ''' + DST_Table + ''' (' + str_InsertTo+ ') '+ Chr(13) + Chr(10) + 'VALUES('
          Else
            IF DST_TYPE='DOA' Then
              str_InsertHead := Chr(13) + Chr(10) + 'INSERT INTO /*+ APPEND NOCACHE */ ' + DST_Table + ' (' + str_InsertTo+ ') '+ Chr(13) + Chr(10) + 'VALUES('
            else
              str_InsertHead := Chr(13) + Chr(10) + 'INSERT INTO ' + DST_Table + ' (' + str_InsertTo+ ') '+ Chr(13) + Chr(10) + 'VALUES(';
        End;

      { ���������� ������ }
      lbTableName.Caption := '������� �� '+SRC_Table+' � '+DST_Table;
      FormMain.Refresh;

      IF (SRC_TYPE='DOA') OR (SRC_TYPE='DPL') OR (SRC_TYPE='DAI') Then
      Begin
{        cmm_DOA_SRC_Select.First;}
        IsEof:=cmm_DOA_SRC_Select.Eof;
      End
      Else
        IF (SRC_TYPE='HLC') Then
        Begin
          cmm_HLC_SRC_Select.First;
          IsEof:=cmm_HLC_SRC_Select.Eof;
        End
        Else
        Begin
          cmm_ADO_SRC_Select.First;
          IsEof:=cmm_ADO_SRC_Select.Eof;
        End;

      ProgressBar1.Max := FromCount;
      j := 1;
      While Not IsEof do
      Begin
        str_Insert := '';
        For i := 1 To FromFields.Count do
        Begin
          IF (SRC_TYPE='DOA') OR (SRC_TYPE='DPL') OR (SRC_TYPE='DAI') Then
          Begin
            TMyFieldObject(FromFields.Objects[i - 1]).Value:=cmm_DOA_SRC_Select.Field(i - 1);
          End
          Else
          Begin
            IF SRC_TYPE='HLC' Then
              TMyFieldObject(FromFields.Objects[i - 1]).Value:=cmm_HLC_SRC_Select.Fields[i - 1].Value
            Else
              TMyFieldObject(FromFields.Objects[i - 1]).Value:=cmm_ADO_SRC_Select.Fields[i - 1].Value;
            If DST_TYPE='DPL' Then
            Begin
              case TMyFieldObject(FromFields.Objects[i - 1]).DPLType of
                dpString:
                  Begin
                    FieldsValue[dpl_Row,i]:=TMyFieldObject(FromFields.Objects[i - 1]).DPLValue;
{                    dpl_DOA_Insert.Columns[i-1].SetData(dpl_Row, @STRING(FieldsValue[dpl_Row,i])[1], Length(STRING(FieldsValue[dpl_Row,i])));}
                    dpl_DOA_Insert.Columns[i-1].SetData(dpl_Row, nil, Length(STRING(FieldsValue[dpl_Row,i])));
                  end;
                dpInteger:
                  Begin
                    FieldsValue[dpl_Row,i]:=TMyFieldObject(FromFields.Objects[i - 1]).DPLValue;
                    dpl_DOA_Insert.Columns[i-1].SetData(dpl_Row, nil, 0);
                  end;
                dpFloat:
                  Begin
                    FieldsValue[dpl_Row,i]:=TMyFieldObject(FromFields.Objects[i - 1]).DPLValue;
                    dpl_DOA_Insert.Columns[i-1].SetData(dpl_Row, nil, 0);
                  end;
              end;
            end
            Else
              If DST_TYPE='DAI' Then
              Begin
                MyList[i-1].FieldsArray[dpl_Row]:=TMyFieldObject(FromFields.Objects[i - 1]).DAIValue;
              end
              Else
              Begin
                str_Insert := str_Insert + TMyFieldObject(FromFields.Objects[i - 1]).StringValue+',';
              end;
          End;
        end;

        If (DST_TYPE='DPL') OR (DST_TYPE='DAI') Then
        Begin
          Inc(dpl_Row);
        End
        Else
        Begin
          { ��������� ������ �� ���������� }
          str_Insert := str_InsertHead + Copy(str_Insert, 1, Length(str_Insert) - 1)+ ')';

          { ��������� ��� � ����� }
          IF FlagViewSQL Then
          Begin
            str:=TStringList.Create;
            str.Add(str_Insert);
            str.SaveToFile(ExtractFilePath(ParamStr(0))+'lastsql.sql');
            str.Clear;
            str.Free;
          End;
        end;

        { ��������� ������ }
        try
          IF DST_TYPE='DOA' Then
          Begin
            cmm_DOA_Insert.Close;
            cmm_DOA_Insert.SQL.Clear;
            cmm_DOA_Insert.SQL.Add(str_Insert);
            cmm_DOA_Insert.Execute;
          end
          else
            IF DST_TYPE='DPL' Then
            Begin
              if (dpl_Row = dpl_DOA_Insert.MaxRows) or (j = FromCount) then
              begin
                dpl_DOA_Insert.Load(dpl_Row);
                dpl_Row := 0;
              end;
            end
            else
              IF DST_TYPE='DAI' Then
              Begin
                if (dpl_Row = ArraySize) or (j = FromCount) then
                begin
                  for i:=1 to FromFields.Count do
                  Begin
                    cmm_DAI_Insert.SetVariable(FromFields.Strings[i-1],MyList[i-1].FieldsArray);
                  end;
                  cmm_DAI_Insert.ExecuteArray(0,dpl_Row);
                  cmm_DOA_Insert.Close;
                  cmm_DOA_Insert.SQL.Clear;
                  cmm_DOA_Insert.SQL.Add('commit');
                  cmm_DOA_Insert.Execute;
                  dpl_Row := 0;
                end;
              end
              else
              begin
                cmm_ADO_Insert.CommandText := str_Insert;
                cmm_ADO_Insert.Execute;
              end;
        except
          on E: Exception do
          Begin
            WriteToLog('������',E.Message+#13#10+'�� ������� ��������� '+IntToStr(j)+' ������: '+#13#10+str_Insert,FlagMGRSRFind,ID,Filename);
            IF (DST_TYPE='DPL') Then
            Begin
              dpl_DOA_Insert.Abort;
            end;
          End;
        end;

        { Commit }
        If j Mod ArraySize = 0 Then
        Begin
          ProgressBar1.Position := j;
          Label1.Caption := '�������� ������� '+IntToStr(j) + ' �� ' + IntToStr(ProgressBar1.Max);
          FormMain.Refresh;

          IF DST_TYPE='DOA' Then
          Begin
            cmm_DOA_Insert.Close;
            cmm_DOA_Insert.SQL.Clear;
            cmm_DOA_Insert.SQL.Add('commit');
            cmm_DOA_Insert.Execute;
          end
          else
            IF DST_TYPE='DPL' Then
            Begin
            end
            else
              IF DST_TYPE='DAI' Then
              Begin
              end
              else
              begin
                cmm_ADO_Insert.CommandText := 'commit';
                cmm_ADO_Insert.Execute;
              End;
        end;
        { ��������� ������ }
        IF (SRC_TYPE='DOA') OR (SRC_TYPE='DPL') OR (SRC_TYPE='DAI') Then
        Begin
          cmm_DOA_SRC_Select.Next;
          IsEof:=cmm_DOA_SRC_Select.Eof;
        End
        Else
          IF (SRC_TYPE='HLC') Then
          Begin
            cmm_HLC_SRC_Select.Next;
            IsEof:=cmm_HLC_SRC_Select.Eof;
          End
          Else
          Begin
            cmm_ADO_SRC_Select.Next;
            IsEof:=cmm_ADO_SRC_Select.Eof;
          End;
        j := j + 1;
      end;

      { ������������� Commit }
      IF DST_TYPE='DOA' Then
      Begin
        cmm_DOA_Insert.Close;
        cmm_DOA_Insert.SQL.Clear;
        cmm_DOA_Insert.SQL.Add('commit');
        cmm_DOA_Insert.Execute;
      end
      else
        IF DST_TYPE='DPL' Then
        Begin
          dpl_DOA_Insert.Finish;
        end
        else
          IF DST_TYPE='DAI' Then
          Begin
            for i:=1 to FromFields.Count do
            Begin
              cmm_DAI_Insert.SetVariable(FromFields.Strings[i-1],MyList[i-1].FieldsArray);
            end;
            cmm_DAI_Insert.ExecuteArray(0,dpl_Row);
            cmm_DOA_Insert.Close;
            cmm_DOA_Insert.SQL.Clear;
            cmm_DOA_Insert.SQL.Add('commit');
            cmm_DOA_Insert.Execute;
          end
          else
          begin
            cmm_ADO_Insert.CommandText := 'commit';
            cmm_ADO_Insert.Execute;
          End;

      { ������� ���������� ����� }
      IF (DST_TYPE='DOA') OR (DST_TYPE='DPL') OR (DST_TYPE='DAI') Then
      Begin
        cmm_DOA_DST_Select.Close;
        cmm_DOA_DST_Select.SQL.Clear;
        SelStr:='SELECT COUNT(*) AS CNT1 FROM ' + DST_Table;
        cmm_DOA_DST_Select.SQL.Add(SelStr);
        cmm_DOA_DST_Select.Execute;
        ToCount:=cmm_DOA_DST_Select.FieldAsInteger('CNT1');
      end
      else
      begin
        cmm_ADO_DST_Select.Close;
        cmm_ADO_DST_Select.SQL.Clear;
        if DST_TYPE='DBF' Then
          SelStr:='SELECT COUNT(*) AS CNT1 FROM ''' + DST_Table + ''''
        Else
          SelStr:='SELECT COUNT(*) AS CNT1 FROM ' + DST_Table;
        cmm_ADO_DST_Select.SQL.Add(SelStr);
        cmm_ADO_DST_Select.Open;
        ToCount:=cmm_ADO_DST_Select.FieldByName('CNT1').AsInteger;
      end;

      If FromCount<>ToCount Then
        WriteToLog('������','�� ������� '+SRC_Table+' �������� � ������� ' +DST_Table+' '+IntToStr(ToCount)+' ������� �� '+IntToStr(FromCount),FlagMGRSRFind,ID,Filename)
      Else
        WriteToLog('���������','�� ������� '+SRC_Table+' �������� � ������� ' +DST_Table+' '+IntToStr(ToCount)+' �������',FlagMGRSRFind,ID,Filename);
    end;

  except
    on E: Exception do
    Begin
       WriteToLog('������',E.Message+#13#10+'�� ������� ��������� ������� '+SRC_Table+' � ������� ' +DST_Table,FlagMGRSRFind,ID,Filename);
       IF DST_TYPE='DPL' Then
       try
         dpl_DOA_Insert.Abort;
       except
       end;
    end;
  end;
  cmm_ADO_SRC_Select.Close;
  cmm_HLC_SRC_Select.Close;
  cmm_ADO_DST_Select.Close;
  cmm_DOA_SRC_Select.Close;
  cmm_DOA_DST_Select.Close;
{  cmm_ADO_Insert.Close;}
  cmm_DOA_Insert.Close;
  cmm_DAI_Insert.Close;
  For i := 1 To FromFields.Count do
  Begin
    If TMyFieldObject(FromFields.Objects[i - 1])<>nil then
      TMyFieldObject(FromFields.Objects[i - 1]).Free;
  end;
  FromFields.Free;
  MyList.Free;
End;


function TFormMain.GenerateDate(SDate:String; DefDate:TDateTime):TDateTime;
var Days,i:integer;
Begin
  SDate:=UpperCase(Trim(SDate));
  IF SDate = 'NOW' Then Result:=NOW
  Else
    IF Pos('NOW',SDate)<>0 Then
    Begin
      Result:=NOW;
      i:=Pos('NOW',SDate);
      If Length(SDate)>=(i+2) then
      Begin
        If SDate[i+1]='-' Then
        try
          Result:=NOW-StrToInt(Copy(SDate,i+2,255))
        except
          Result:=NOW;
        end;
        If SDate[i+1]='+' Then
        try
          Result:=NOW+StrToInt(Copy(SDate,i+2,255))
        except
          Result:=NOW;
        end;
      End;
    End
    Else
      If SDate = 'FIRSTDAY' Then Result:=LastDayOfPrevMonth+1
      Else
        If System.Copy(SDate,1,5) = 'FIRST' Then
        Begin
          try
            Days:=StrToInt(System.Copy(SDate,6,2));
          except
            Days:=10
          end;
          if Now<=LastDayOfPrevMonth+Days then
            Result:=FirstDayOfPrevMonth
          else
            Result:=LastDayOfPrevMonth+1;
        End
        Else
          If SDate='' Then result:=DefDate
          Else
          try
            Result := StrToDate(SDate);
          except
            Result := DefDate;
          end;
end;

function TFormMain.FileChanged(Owner_ID: integer):boolean;
var tmpFileName: String;
    tmpLastDT: string;
    tmpNewDT:string;
    tmpFileDT:integer;
    tmpNewSize,tmpLastSize:real;
    f: file of Byte;
 Begin
  Result:=false;
  with qLoadTask do
  try
    Close;
    Parameters.ParamByName('CurID').Value:=Owner_ID;
    Open;
    Result:=FieldByName('RUN').AsBoolean;
    If Result Then
    Begin
      tmpFileName := Trim(FieldByName('FILENAME').AsString);
      tmpLastDT := DateToStr(FieldByName('LASTDATE').AsDateTime) +
                         FieldByName('LASTTIME').AsString;
      tmpLastSize := FieldByName('LASTSIZE').AsFloat;
      tmpFileDT:=FileAge(tmpFileName);
      Result:=(tmpFileDT<>-1);
      if Result then // ���� ����������� ���� ��������� - �������� ���� � ������� ���������� ���������
      begin
        tmpNewDT:=DateToStr(FileDateToDateTime(tmpFileDT)) +
                  TimeToStr(FileDateToDateTime(tmpFileDT));
        {$I-}
        AssignFile(f, tmpFileName);
        Reset(f);
        {$I+}
        if (IOResult = 0) then
          tmpNewSize := FileSize(f)
        else
          tmpNewSize := 0;
        CloseFile(f);
        Result:=(tmpNewDT<>tmpLastDT) OR (tmpNewSize<>tmpLastSize);
      end;
    end;
  finally
    Close;
  end;
End;


procedure TFormMain.UpdateStLine(pStLineText:string);
begin
  FormMain.slMain.Panels[0].Text := pStLineText;
  FormMain.Refresh;
end;


end.
