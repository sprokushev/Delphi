unit ForDBConn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Oracle, DateUtils;

const
  // Коннекция
  connUnknown=0; // Неопределенный статус
  connOk=1; // Коннекция создана успешно
  connError=-1; // Ошибка при создании коннекции
  queryUnknown=0; // Неопределенный статус
  queryOk=1; // Запрос выполнен успешно
  queryError=-1; // Ошибка при выполнении запроса

// Описание коннекции
type
  TDBConn = class(TForm)
    cnn_DOA: TOracleSession;
    cnn_ADO: TADOConnection;
    q_DOA: TOracleQuery;
    q_ADO: TADOQuery;
  private
    { Private declarations }
    Conn_Type:string;
    Conn_Str:string;
    Database:string;
    Username:string;
    Password:string;
  public
    { Public declarations }
    Conn_Status:integer; // Текущий статус коннекции
    Query_Status:integer; // Статус исполнения запроса
    IsFileDB:boolean; // Файловая БД
    cnn_CURRENT: TComponent;
    // Инициализации коннекции
    function InitConnection(pType,pConnection,pDatabase,pUsername,pPassword:string;ReplId:integer):integer;
    // Деинициализация
    procedure DoneConnection(ReplId:integer);
    // Выполнение хранимой процедуры
    function ExecuteProc(SPType:Integer;SPName:string;
                         ExistParam:boolean;DT_Beg,DT_End:TDateTime;Param1,Param2,Param3:string;ReplID:integer):integer;
    // Преобразование имени таблицы для добавления в запрос
    function GetTableName(SchemeName,TableName:string):string;
    // Собрать статистику
    procedure ComputeStatistic(TableList:string;ReplID:integer);
    // Изменить метод доступа с DAI на DOA
    procedure ChangeDAItoDOA;
    // Создать и открыть запрос
    function OpenQuery(QueryText:string;VAR Query:TDataSet;ReplId:integer):integer;
    // Закрыть запрос
    procedure CloseQuery(VAR Query:TDataSet;ReplId:integer);
    // Очистить таблицу
    function EmptyTable(DST_Scheme,DST_Table:string;ReplId:integer):integer;
    // Подготовить список полей
    function GetFieldsList(Query:TDataSet;VAR FieldsList:TStringList;Mask:string;ReplId:integer);
    // Очистить список полей
    function FreeFieldsList(VAR FieldsList:TStringList):integer;
    // Проверить наличие таблицы
    function CheckTable(DST_Scheme,DST_Table:string;ReplId:integer):integer;
  end;

// Преобразование даты в строку
function ReplDateToStr(Conn_Type:string;DT:TDateTime):string;

// Описание поля
type
  TReplFieldType = (foNone,foBoolean,foString,foDateTime,foInteger,foFloat);

type
  TReplField= class(TObject)
    ADOType:TFieldType;
    DOAType:integer;
    Value:variant;
    Size:integer;
    // Значение конкретного типа
    function AsBoolean:boolean;
    function AsString:string;
    function AsInteger:integer;
    function AsFloat:real;
    function AsDateTime:TDateTime;
    function DAIValue(Conn_Type:string):variant;
    function ValueToString(SRC_TYPE,DST_TYPE:string):string;
    // Тип поля
    function GetDOAType(Conn_Type:string):integer;
    function DataType(Conn_Type:string):TReplFieldType;
  end;

implementation

uses main, ForSESS;

{$R *.dfm}

// Описание поля
function TReplFieldObject.AsBoolean:boolean;
Begin
  Result:=Value;
End;

function TReplFieldObject.AsFloat:real;
Begin
  Result:=Value;
End;

function TReplFieldObject.AsInteger:integer;
Begin
  Result:=Value;
End;

function TReplFieldObject.AsString:string;
Begin
  Result:=VarToStr(Value);
End;

function TReplFieldObject.AsDateTime:TDateTime;
Begin
  Result:=Value;
End;

function TReplFieldObject.DataType(Conn_Type:string):TReplFieldType;
Begin
  IF (Conn_Type='DOA') OR (Conn_Type='DAI') Then
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

function TReplFieldObject.GetDOAType(Conn_Type:string):integer;
Begin
  IF (Conn_Type='DOA') OR (Conn_Type='DAI') Then
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

function TReplFieldObject.DAIValue(Conn_Type:string):variant;
Begin
  Case DataType(Conn_Type) of

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

function TReplFieldObject.ValueToString(SRC_TYPE,DST_TYPE:string):string;
var Res:string;
Begin
  Res:='';
  Case DataType(SRC_TYPE) of

    foBoolean:
      If AsBoolean Then
      Begin
        If (DST_TYPE='DOA') OR (DST_TYPE='DAI') OR (DST_TYPE='ORACLE') Then Res := '''T''';
        If DST_TYPE='DBF' Then Res := '.T.';
        If DST_TYPE='ADO' Then Res := 'True';
      end
      Else
      Begin
        If (DST_TYPE='DOA') OR (DST_TYPE='DAI') OR (DST_TYPE='ORACLE') Then Res := '''F''';
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
        Res:=ReplDateToStr(DST_TYPE,AsDateTime);
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

// Инициализация коннекции
function TDBConn.InitConnection(ReplId,pType,pConnection,pDatabase,pUsername,pPassword:string;ReplID:integer):integer;
var ErrStr:string;
Begin
  Conn_Type:=pType;
  Conn_Str:=pConnection;
  Database:=pDatabase;
  Username:=pUsername;
  Password:=pPassword;

  DoneConnection;

  try
    If (Conn_Type='DOA') or (Conn_Type='DAI') Then
    Begin
      cnn_DOA.LogonDatabase:=Database;
      cnn_DOA.LogonUserName:=Username;
      cnn_DOA.LogonPassword:=Password;
      cnn_DOA.Logon;
      cnn_CURRENT:=cnn_DOA;
    End
    Else
    Begin
      cnn_ADO.ConnectionString := Conn_Str;
      cnn_ADO.DefaultDatabase := Database;
      cnn_ADO.Open;
      cnn_CURRENT:=cnn_ADO;
    End;
    Conn_Status:=connOk;
  except
    on E: Exception do
    Begin
      cnn_CURRENT:=nil;
      If (Conn_Type='DOA') or (Conn_Type='DAI') Then
        ErrStr:=E.Message+#13#10+'Не удалось получить доступ к базе данных через DOA: '+Database+' '+Username+' '+Password
      else
        ErrStr:=E.Message+#13#10+'Не удалось получить доступ к базе данных через ADO: '+Conn_str+' '+Database;
      f_main.ApplSession.WriteToLog(amDefault,'ForDBConn',sesError,ErrStr,ReplID);
      Conn_Status:=connError;
    end;
  end;
  If Conn_Type='DBF' then IsFileDB:=true
  else IsFileDB=false;
  Result:=Conn_Status;
End;

// ДеИнициализация коннекции
procedure TDBConn.DoneConnection;
Begin
  If (Conn_Type='DOA') or (Conn_Type='DAI') Then
  Begin
    q_DOA.Close;
    q_DOA.DeleteVariables;
    q_DOA.SQL.Clear;
    cnn_DOA.LogOff;
  End
  Else
  Begin
    cnn_ADO.Close;
  End;
  Conn_Status:=connUnknown;
End;

// Выполнение хранимой процедуры
function TDBConn.ExecuteProc(SPType:Integer;SPName:string;
                         ExistParam:boolean;DT_Beg,DT_End:TDateTime;Param1,Param2,Param3:string;ReplID:integer):integer;
var ProcName:string;
Begin
  if (Conn_Type='DOA') or (Conn_Type='DAI') then // Oracle
  if SPType=1 then // Хранимая процедура
  with q_DOA do
  try
    Close;
    DeleteVariables;
    SQL.Clear;
    SQL.Add('BEGIN');
    ProcName:=SPName;
    if ExistParam then
      ProcName:=ProcName+'(:DB,:DE,:P1,:P2,:P3)';
    SQL.Add(ProcName+';');
    SQL.Add('END;');
    if ExistParam then
    Begin
      DeclareVariable('DB',otDate);
      SetVariable('DB',DT_Beg);
      DeclareVariable('DE',otDate);
      SetVariable('DE',DT_End);
      DeclareVariable('P1',otString);
      SetVariable('P1',Param1);
      DeclareVariable('P2',otString);
      SetVariable('P2',Param1);
      DeclareVariable('P3',otString);
      SetVariable('P3',Param1);
    end;
    Execute;
    Close;
    DeleteVariables;
    SQL.Clear;
  except
    on E: Exception do
      f_main.ApplSession.WriteToLog(amDefault,'ForDBConn',sesError,E.Message+#13#10+'Не удалось запустить процедуру '+SPName,ReplId);
  end;
End;

// Преобразование даты в строку
function ReplDateToStr(Conn_Type:string;DT:TDateTime):string;
var DD,MM,YY:integer;
Begin
  DD:=DayOf(DT);
  MM:=MonthOf(DT);
  YY:=YearOf(DT);

  Result:='';
  if (Conn_Type='DOA') or (Conn_Type='DAI') or (Conn_Type='ORACLE') then // Oracle
  Begin
    IF (YY=1899) AND (MM=12) AND (DD=30) Then
      Result:='NULL'
    Else
      Result:='TO_DATE('''+IntToStr(DD)+'.'+IntToStr(MM)+'.'+IntToStr(YY)+''',''dd.mm.yyyy'')';
  End;

  if (Conn_Type='DBF') then // DBF
  Begin
    IF (YY=1899) AND (MM=12) AND (DD=30) Then
      Result:='{  /  /  }'
    Else
      Result:='{'+IntToStr(MM)+'/'+IntToStr(DD)+'/'+IntToStr(YY)+'}';
  End;

  if (Conn_Type='ADO') then // ADO
  Begin
    IF (YY=1899) AND (MM=12) AND (DD=30) Then
      Result:='#  /  /  #'
    Else
    Result:='#'+IntToStr(MM)+'/'+IntToStr(DD)+'/'+IntToStr(YY)+'#';
  End;
end;

// Преобразование имени таблицы для добавления в запрос
function TDBConn.GetTableName(SchemeName,TableName:string):string;
Begin
  Result:=TableName;

  if (Conn_Type='DOA') or (Conn_Type='DAI') or (Conn_Type='ORACLE') then // Oracle
  Begin
    if SchemeName<>'' then Result:=SchemeName+'.'+Result;
  end;

  if IsFileDB then // DBF
  Begin
    Result:=''''+Result+'''';
  End;

End;

// Собрать статистику
procedure TDBConn.ComputeStatistic(ReplId:integer;TableList:string);
var s:string;
    i:integer;
Begin
  s:=TableList;

  if (Conn_Type='DOA') or (Conn_Type='DAI') then // Oracle
  repeat
    if s='' then break;
    i:=Pos(',',s);
    if i=0 then i:=system.length(s)+1;
    i:=i-1;
    with q_DOA do
    try
      Close;
      DeleteVariables;
      SQL.Clear;
      SQL.Add('ANALYZE TABLE '+System.Copy(s,1,i)+' COMPUTE STATISTICS');
      Execute;
    except
      on E: Exception do
      Begin
        f_main.ApplSession.WriteToLog(amDefault,'ForDBConn',sesError,E.Message+#13#10+'Не удалось обновить статистику по таблице '+s,ReplId);
      end;
    end;
    System.Delete(s,1,i+1);
  until false;
  q_DOA.Close;
  q_DOA.SQL.Clear;
End;

// Изменить метод доступа с DAI на DOA
procedure TDBConn.ChangeDAItoDOA;
Begin
  if Conn_Type='DAI' then Conn_Type='DOA';
End;

// Создать и открыть запрос
function TDBConn.OpenQuery(ReplId:integer;QueryText:string;VAR Query:TDataSet):integer;
Begin
  Result:=queryUnknown;
  IF QueryText='' then
  Begin
    Query:=nil;
    Result:=queryError;
    exit;
  End;

  If (Conn_Type='DOA') or (Conn_Type='DAI') Then
  Begin
    Query:=TOracleDataSet.Create(Self);
    with TOracleDataSet(Query) do
    try
      Session:=cnn_DOA;
      SQL.Add(QueryText);
      Open;
      Result:=queryOk;
    except
      on E: Exception do
      Begin
        f_main.ApplSession.WriteToLog(amDefault,'ForDBConn',sesError,E.Message+#13#10+'Не удалось открыть запрос '+QueryText,ReplId);
        Result:=queryError;
        TOracleDataSet(Query).SQL.Clear;
        TOracleDataSet(Query).Free;
        Query:=nil;
        exit;
      end;
    end;
  End
  Else
  Begin
    Query:=TADOQuery.Create(Self);
    with TADOQuery(Query) do
    try
      Connection:=cnn_ADO;
      SQL.Add(QueryText);
      Open;
      Result:=queryOk;
    except
      on E: Exception do
      Begin
        f_main.ApplSession.WriteToLog(amDefault,'ForDBConn',sesError,E.Message+#13#10+'Не удалось открыть запрос '+QueryText,ReplId);
        Result:=queryError;
        TADOQuery(Query).SQL.Clear;
        TADOQuery(Query).Free;
        Query:=nil;
        exit;
      end;
    end;
  End;
End;

// Закрыть запрос
procedure TDBConn.CloseQuery(ReplId:integer;VAR Query:TDataSet);
Begin
  If (Conn_Type='DOA') or (Conn_Type='DAI') Then
  Begin
    TOracleDataSet(Query).SQL.Clear;
    TOracleDataSet(Query).Free;
    Query:=nil;
  End
  Else
  Begin
    TADOQuery(Query).SQL.Clear;
    TADOQuery(Query).Free;
    Query:=nil;
  End;
End;

// Очистить таблицу
function TDBConn.EmptyTable(ReplId:integer;DST_Scheme,DST_Table:string):integer;
var TableName:string;
Begin
  Result:=queryOk;
  TableName:=GetTableName(DST_Scheme,DST_Table);

  If (Conn_Type='DOA') or (Conn_Type='DAI') Then
  Begin
    Result:=F_DB.TruncDOATable(cnn_DOA,TableName);
  End
  Else
  Begin
    if Conn_Type='ORACLE' then
      Result:=F_DB.EmptyADOTable(cnn_ADO,TableName,true)
    else
      Result:=F_DB.EmptyADOTable(cnn_ADO,TableName,false)
  End;

  If Result<>queryOk then
  Begin
    f_main.ApplSession.WriteToLog(amDefault,'ForDBConn',sesError,'Не удалось очистить таблицу '+TableName,ReplId);
    Result:=queryError;
  End;
End;

// Подготовить список полей
function TDBConn.GetFieldsList(Query:TDataSet;VAR FieldsList:TStringList;Mask:string;ReplId:integer):integer;
var FieldObject:TReplField;
    FieldName:string;
    FieldsCount:integer;
    OnlyFields:string;
Begin
  Result:=queryOk;
  FieldsList:=TStringList.Create;
  If Query=nil then
  Begin
    f_main.ApplSession.WriteToLog(amDefault,'ForDBConn',sesError,'Пустой запрос!'+#13#10+'Не удалось заполнить список полей',ReplId);
    Result:=queryError;
    exit;
  end;

  // Если запрос не открыт - открываем
  if NOT Query.Active then
  try
    If (Conn_Type='DOA') or (Conn_Type='DAI') Then
    Begin
      SQLText:=TOracleDataSet(Query).SQL.Text;
      TOracleDataSet(Query).Open;
    End
    Else
    Begin
      SQLText:=TADOQuery(Query).SQL.Text;
      TADOQuery(Query).Open;
    End;
  except
    on E: Exception do
    Begin
      f_main.ApplSession.WriteToLog(amDefault,'ForDBConn',sesError,E.Message+#13#10+'Не удалось заполнить список полей запроса '+SQLText,ReplId);
      Result:=queryError;
      exit;
    end;
  end;

  // Ограничение на список полей
  OnlyFields:=AnsiUpperCase(Mask);
  If OnlyFields<>'*' then OnlyFields:=','+OnlyFields+',';

  // Перебираем поля
  FieldsCount:=0;
  For i := 1 To Query.FieldCount do
  Begin
    IF (Conn_Type='DOA') OR (Conn_Type='DAI') Then
      FieldName:=AnsiUpperCase(TOracleDataSet(Query).FieldName(i - 1))
    Else
      FieldName:=AnsiUpperCase(TADOQuery(Query).Fields[i - 1].FieldName);
    if FieldName<>'REPL_OPER' then
    if (OnlyFields='*') or (Pos(','+FieldName+',',OnlyFields)<>0) then
    Begin
      FieldObject:=TReplField.Create;
      IF (Conn_Type='DOA') OR (Conn_Type='DAI') Then
      Begin
        FieldObject.DOAType:=TOracleDataSet(Query).FieldType(i - 1);
        FieldObject.Value:=TOracleDataSet(Query).Field(i - 1);
        FieldObject.Size:=TOracleDataSet(Query).FieldSize(i - 1);
      End
      Else
        FieldObject.ADOType:=TADOQuery(Query).Fields[i - 1].DataType;
        FieldObject.Value:=TADOQuery(Query).Fields[i - 1].Value;
        FieldObject.Size:=TADOQuery(Query).Fields[i - 1].Size;
      End;
      Case FieldObject.DataType of
        foBoolean: begin end;
        foString: begin end;
        foDateTime: begin end;
        foInteger: begin end;
        foFloat: begin end;
      else
        Begin
          f_main.ApplSession.WriteToLog(amDefault,'ForDBConn',sesError,'Неизвестный тип поля!'+#13#10+'Не удалось заполнить список полей запроса '+SQLText,ReplId);
          Result:=queryError;
          exit;
        end;
      FieldsList.Add(FieldName);
      FieldsCount:=FieldsCount+1;
      FieldsList.Objects[FieldsCount-1]:=FieldObject;
    end;
  End;
End;

// Очистить список полей
function TDBConn.FreeFieldsList(VAR FieldsList:TStringList):integer;
Begin
  Result:=queryOk;
  If FieldsList=nil then exit;
  For i := 1 To FieldsList.Count do
  Begin
    TReplFieldObject(FieldsList.Objects[i-1]).Free;
  End;
  FieldsList.Free;
  FIeldsList:=nil;
end;

// Проверить наличие таблицы
function TDBConn.CheckTable(DST_Scheme,DST_Table:string;ReplId:integer):integer;
var TableName:string;
    SQLText:string;
Begin
  Result:=queryOk;
  TableName:=GetTableName(DST_Scheme,DST_Table);
  if DST_Table='' then
  Begin
    f_main.ApplSession.WriteToLog(amDefault,'ForDBConn',sesError,'Имя таблицы не указано!',ReplId);
    Result:=queryError;
    exit;
  End;

  SQLText:='SELECT 1 as TEST FROM '+TableName+' WHERE 1=0';
  If (Conn_Type='DOA') or (Conn_Type='DAI') Then
  Begin
    // Тестовый запрос
    with q_DOA do
    try
      Close;
      DeleteVariables;
      SQL.Clear;
      SQL.Add(SQLText);
      Open;
    except
      on E: Exception do
      Begin
        f_main.ApplSession.WriteToLog(amDefault,'ForDBConn',sesError,E.Message+#13#10+'Ошибка при выполнении тестового запроса '+TableName,ReplId);
        Result:=queryError;
      end;
    end;
    q_DOA.SQL.Clear;
    q_DOA.Close;
  end
  Else
  Begin
    // Проверяем наличие файла
    if IsFileDB then
      If NOT FileExist(DST_Table) then
      Begin
        f_main.ApplSession.WriteToLog(amDefault,'ForDBConn',sesError,'Файл '+DST_Table+' не найден!',ReplId);
        Result:=queryError;
      End;

    // Тестовый запрос
    If Result=queryOk then
    Begin
      with q_ADO do
      try
        Close;
        SQL.Clear;
        SQL.Add(SQLText);
        Open;
      except
        on E: Exception do
        Begin
          f_main.ApplSession.WriteToLog(amDefault,'ForDBConn',sesError,E.Message+#13#10+'Ошибка при выполнении тестового запроса '+TableName,ReplId);
          Result:=queryError;
        end;
      end;
      q_ADO.SQL.Clear;
      q_ADO.Close;
    end;
  End;
End;

End;

end.
