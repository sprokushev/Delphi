unit ForDB;

// Набор методов для работы с БД

interface

uses Windows,Classes,Graphics,DB,SysUtils,Oracle,OracleData,ADODB,StrUtils,DBGrids,DBGridEh,Forms,Controls,
     ActnMan, ActnCtrls, ActnMenus, ActnList, Variants,Dialogs,DateUtils;

type
  TMasterDB = class(TComponent)
  public
    // Заполнение шаблона значениями из полей DataSet
    function FillMask(MaskStr:string;q:TDataSet;var IsOk:boolean;TypeFormat:integer):string;
    // Значения полей текущей записи -> в список строк
    procedure RowInList(TableTag:string;q: TDataSet;list:TStrings);
    { Очистить таблицу через ADO - DELETE}
    function EmptyADOTable(conn:TADOConnection;TableName:string;IsCommit:boolean):integer;
    { Очистить таблицу через DOA - DELETE}
    function EmptyDOATable(conn:TOracleSession;TableName:string;IsCommit:boolean):integer;
    { Очистить таблицу яерез DOA - TRUNCATE}
    function TruncDOATable(conn:TOracleSession;TableName:string):integer;
    { Заполнить DBF-таблицу строками из DataSet }
    procedure FillADOTable(conn:TADOConnection;q_source:TDataSet;ToTable:string;ToDos:boolean;NumRep:double);
    procedure FillDBFTable(q_source:TDataSet;ToTable:string;ToDos:boolean);
    { Открытие сессии }
    function LogonMasterSession(ora_Session:TOracleSession):boolean;
    { Редактировать поле Grid в отдельном окне }
    procedure EditInMemo(pGrid:TDBGridEh; pReadOnly:boolean=false);
    { Сортировка в grid }
    procedure SortInGrid(DataSet:TOracleDataSet;RowNo:Word;Grid: TDBGridEh);
    { Сортировка в ADO-grid }
    procedure SortInGridADO(DataSet:TADOQuery;RowNo:Word;Grid: TDBGridEh);
    { Обновление запроса }
    procedure ReQuery(DataSet:TOracleDataSet;UseBookmark:boolean);
    { Обновление ADO-запроса }
    procedure ReQueryADO(DataSet:TADOQuery;UseBookmark:boolean);
    { Проверка грантов и ограничение доступа к элементам интерфейса }
    procedure SetUserGrants(acMan:TActionManager);
    { Проверка отдельного гранта у текущего пользователя }
    function CheckGrant(ActionName:string):boolean;
    {}
    procedure FilterAcceptText(pGrid:TDBGridEh; pFilter:TStringList; var NewText: String; var Accept: Boolean);
    {}
    procedure FilterCurrentValue(pGrid:TDBGridEh; pFilter:TStringList);
    {}
    procedure FilterClear(pGrid:TDBGridEh; pFilter:TStringList);
    {}
    function AcceptFilterRecord(pGrid:TDBGridEh; pFilter:TStringList): Boolean;
    { Просмотреть текст запроса в грид}
    procedure GridSQL(pForm:TForm;pGrid:TDBGridEh;pSQL:string;pDataSet:TOracleDataSet);
    { Уникальный идентификатор из АРМ Товарный оператор }
    function GetTovOpUniqId(conn:TADOConnection;pDocName:string;pDir:string): string;
    { Номер следующего документа из АРМ Товарный оператор }
    function GetTovOpUniqNum(conn:TADOConnection;pDocName:string;pDir:string;pArh:string;pDate:TDateTime): string;
  published
  end;

var
  F_DB: TMasterDB;

implementation

uses main,ForSystem, MemoEdit;

// Заполнение шаблона значениями из полей DataSet
// В строке MaskStr ищутся имена полей (должны начинаться на :) и
// вместо них подставляются значения этих полей из q
// Если не все поля были заменены: IsOk=False
// TypeFormat - режим форматирования:
// 0 - просто вставить значения (AsString)
// 1 - отформатировать под ADO
// 2 - отформатировать под Oracle
function TMasterDB.FillMask(MaskStr:string;q:TDataSet;var IsOk:boolean;TypeFormat:integer):string;
var res:string;
    fld:string;
    i1,i2:integer;
    fld_val:string;
Begin
  res:=MaskStr;
  IsOk:=true;
  repeat
    i1:=pos(':',res);
    if i1>0 then
    Begin
      i2:=i1+pos(' ',system.copy(res,i1+1,length(res)));
      if i2=i1 then i2:=length(res)+1;
      fld:=system.copy(res,i1+1,i2-i1-1);
      try
        fld_val:=q.FieldByName(fld).AsString;
        if q.FieldByName(fld).DataType in [ftString,ftMemo] then // строки
        Begin
          if TypeFormat<>0 then fld_val:=''''+fld_val+'''';
        end
        else
          if q.FieldByName(fld).DataType in [ftDate,ftTime,ftDateTime] then // даты
          Begin
            if TypeFormat<>0 then
            if TypeFormat=1 then
              fld_val:=FormatDateTime('"{"mm"/"dd"/"yyyy"}"',q.FieldByName(fld).AsDateTime)
            else
              fld_val:='TO_DATE('''+FormatDateTime('dd.mm.yyyy',q.FieldByName(fld).AsDateTime)+''',''dd.mm.yyyy hh24:mi:ss'')';
          end;
        system.delete(res,i1,i2-i1);
        system.Insert(fld_val,res,i1);
      except
        fld_val:='';
        IsOk:=false;
      end;
    end;
  until i1=0;
  FillMask:=res;
End;

// Значения полей текущей записи -> в список строк
procedure TMasterDB.RowInList(TableTag:string;q: TDataSet;list:TStrings);
var
  t_fld:TOracleDataSet;
  t_stru:TOracleDataSet;
  q_tmp:TOracleDataSet;
  row_str,s:string;
  i:integer;
  IsOk:boolean;
Begin
  TableTag:=AnsiUpperCase(TableTag);
  list.Clear;

  t_fld:=TOracleDataSet.Create(Self);
  with t_fld do
  Begin
    Session:=f_main.ora_Session;
    SQL.Add('SELECT * FROM MASTER_KLS_FIELD_STRUCTURE WHERE structure_id='''+TableTag+''' ORDER BY field_id');
    f_db.ReQuery(t_fld,false);
  End;

  t_stru:=TOracleDataSet.Create(Self);
  with t_stru do
  Begin
    Session:=f_main.ora_Session;
    SQL.Add('SELECT * FROM MASTER_KLS_STRUCTURE WHERE id='''+TableTag+'''');
    f_db.ReQuery(t_stru,false);
  End;

  q_tmp:=TOracleDataSet.Create(Self);
  with q_tmp do
  Begin
    Session:=f_main.ora_Session;
  End;

  if t_stru.eof or t_fld.eof then
  Begin
    // Описания данной таблицы нет в метаданных
  End
  Else
    // Перебираем поля
    while not t_fld.Eof do
    begin
      row_str:=t_fld.FieldByName('FIELD_CAPTION').AsString+' : ';

      If t_fld.FieldByName('FIELD_KIND').AsInteger=1 Then
      Begin
        // Lookup-поле
        with q_tmp do
        Begin
          Close;
          SQL.Clear;
          s:=AnsiUpperCase(t_fld.FieldByName('LOOKUP_SOURCE_QUERY').AsString);
          i:=pos(' ORDER ',s);
          if i>0 then system.delete(s,i,length(s));
          i:=pos('WHERE',s);
          if i>0 then
            s:=s+' AND ('+t_fld.FieldByName('LOOKUP_KEY_FIELD').AsString+'=:'+t_fld.FieldByName('FIELD_NAME').AsString+')'
          else
            s:=s+' WHERE '+t_fld.FieldByName('LOOKUP_KEY_FIELD').AsString+'=:'+t_fld.FieldByName('FIELD_NAME').AsString;
          s:=FillMask(s,q,IsOk,2);
          if IsOk then
          Begin
            SQL.Add(s);
            f_db.ReQuery(q_tmp,false);
            if not eof then row_str:=row_str+q_tmp.FieldByName(t_fld.FieldByName('LOOKUP_DISPLAY_FIELD').AsString).AsString;
          end;
        End;
      End
      Else
      Begin
        // Простое поле
        row_str:=row_str+q.FieldByName(t_fld.FieldByName('FIELD_NAME').AsString).AsString;
      End;
      list.Add(row_str);
      t_fld.Next;
    End;

  q_tmp.Close;
  q_tmp.SQL.Clear;
  q_tmp.Free;

  t_fld.Close;
  t_fld.SQL.Clear;
  t_fld.Free;

  t_stru.Close;
  t_stru.SQL.Clear;
  t_stru.Free;

End;

// Очистить таблицу через ADO - DELETE
function TMasterDB.EmptyADOTable(conn:TADOConnection;TableName:string;IsCommit:boolean):integer;
var q_cmn:TADOQuery;
    s:string;
Begin
  q_cmn:=TADOQuery.Create(Self);
  q_cmn.Connection:=conn;
  try
    q_cmn.SQL.Clear;
    q_cmn.SQL.Add('DELETE FROM '+TableName);
    q_cmn.ExecSQL;
    If IsCommit then
    Begin
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('COMMIT');
      q_cmn.ExecSQL;
    End;
    Result:=1;
  except
    Result:=-1;
  end;
  q_cmn.SQL.Clear;
  q_cmn.free;
End;

// Очистить таблицу через DOA - DELETE
function TMasterDB.EmptyDOATable(conn:TOracleSession;TableName:string;IsCommit:boolean):integer;
var q_cmn:TOracleQuery;
Begin
  q_cmn:=TOracleQuery.Create(Self);
  q_cmn.Session:=conn;
  try
    q_cmn.SQL.Clear;
    q_cmn.SQL.Add('BEGIN');
    q_cmn.SQL.Add('  DELETE FROM '+TableName+';');
    If IsCommit then
    Begin
      q_cmn.SQL.Add('  COMMIT;');
    End;
    q_cmn.SQL.Add('END;');
    q_cmn.Execute;
    Result:=1;
  Except
    Result:=-1;
  end;
  q_cmn.SQL.Clear;
  q_cmn.free;
End;

// Очистить таблицу через DOA - TRUNCATE
function TMasterDB.TruncDOATable(conn:TOracleSession;TableName:string):integer;
var q_cmn:TOracleQuery;
Begin
  q_cmn:=TOracleQuery.Create(Self);
  q_cmn.Session:=conn;
  try
    q_cmn.SQL.Clear;
    q_cmn.SQL.Add('TRUNCATE TABLE '+TableName);
    q_cmn.Execute;
    Result:=1;
  except
    Result:=-1
  end;
  q_cmn.SQL.Clear;
  q_cmn.free;
End;

{ Заполнить ADO-таблицу (пока только DBF) строками из DataSet }
procedure TMasterDB.FillADOTable(conn:TADOConnection;q_source:TDataSet;ToTable:string;ToDos:boolean;NumRep:double);
var q_cmn:TADOQuery;
    q_dest:TADOQuery;
    Zpt,s,InsertSQL,SQLValues,SQLFields:string;
    i:integer;
    RowCnt:integer;
Begin

  // Подготовить таблицу-назначение
  q_cmn:=TADOQuery.Create(Self);
  q_cmn.Connection:=conn;

  q_dest:=TADOQuery.Create(Self);
  q_dest.Connection:=conn;
  q_dest.SQL.Clear;
  q_dest.SQL.Add('SELECT * FROM '''+ToTable+'''');
  q_dest.Open;

  // Заполнение
  q_source.DisableControls;

  q_source.First;
  RowCnt:=0;
  try
    while not q_source.Eof do
    Begin
      Inc(RowCnt);
      Zpt:='';
      SQLFields:='';
      SQLValues:='';
      s:='';
      for i:=1 to q_dest.FieldCount do
      Begin
        case q_dest.fields[i-1].DataType of
          ftString,ftMemo,ftFmtMemo,ftFixedChar, ftWideString:
            try
              s:=q_source.FieldByName(q_dest.fields[i-1].FieldName).AsString;
              if (s='%NUM_REP%') and (NumRep>0) then s:=FloatToStr(NumRep);
              if s='%ROW_REP%' then s:=IntToStr(RowCnt);
              System.Copy(s,1,250);
              s:=StrUtils.AnsiReplaceStr(s,':',' ');
              s:=StrUtils.AnsiReplaceStr(s,'''','"');
              if ToDos then s:=F_ForSystem.ToDOS(s);
              s:=''''+s+'''';
            except
              s:=''' ''';
            end;
          ftAutoInc,ftSmallint,ftInteger,ftWord,ftLargeInt:
            try
              s:=q_source.FieldByName(q_dest.fields[i-1].FieldName).AsString;
              if (s='%NUM_REP%') and (NumRep>0) then s:=FloatToStr(NumRep);
              if s='%ROW_REP%' then s:=IntToStr(RowCnt);
            except
              s:='0';
            end;
          ftBoolean:
            try
              If q_source.FieldByName(q_dest.fields[i-1].FieldName).AsBoolean then
                s:='.T.'
              else
                s:='.F.';
            except
              s:='.F.';
            end;
          ftBCD,ftCurrency,ftFloat:
            try
              s:=q_source.FieldByName(q_dest.fields[i-1].FieldName).AsString;
              if (s='%NUM_REP%') and (NumRep>0) then s:=FloatToStr(NumRep);
              if s='%ROW_REP%' then s:=IntToStr(RowCnt);
            except
              s:='0';
            end;
          ftDate,ftTime,ftDateTime:
            try
              if (q_source.FieldByName(q_dest.fields[i-1].FieldName).IsNull) or
                 (q_source.FieldByName(q_dest.fields[i-1].FieldName).AsDateTime=0) then
                s:='ctod("  /  /  ")'
              else
                s:=FormatDateTime('"{"mm"/"dd"/"yyyy"}"',q_source.FieldByName(q_dest.fields[i-1].FieldName).AsDateTime);
            except
              s:='ctod("  /  /  ")';
            end;
          else
            s:='?';
        end;
        if s<>'' then
        Begin
          SQLValues:=SQLValues+Zpt+s;
          SQLFields:=SQLFields+Zpt+q_dest.fields[i-1].FieldName;
          Zpt:=',';
        end;
      end;
      InsertSQL:='INSERT INTO '''+ToTable+''' ('+SQLFields+') VALUES ('+SQLValues+')';
      // Выполняем INSERT
      q_cmn.Close;
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add(InsertSQL);
  //    q_cmn.SQL.SaveToFile('c:\tmp\1.sql');
      q_cmn.ExecSQL;
      // Следующая запись
      q_Source.Next;
    end;
  except
    on E: Exception do
    Begin
      ShowMessage(E.Message);
    end;
  end;

  q_source.EnableControls;
  q_dest.SQL.Clear;
  q_dest.free;
  q_cmn.SQL.Clear;
  q_cmn.free;
End;

{ Заполнить DBF-таблицу строками из DataSet }
procedure TMasterDB.FillDBFTable(q_source:TDataSet;ToTable:string;ToDos:boolean);
var q_cmn:TADOQuery;
    q_dest:TADOQuery;
    Zpt,s,InsertSQL,SQLValues,SQLFields:string;
    i:integer;
Begin

{  // Подготовить таблицу-назначение
  q_cmn:=TADOQuery.Create(Self);
  q_cmn.Connection:=conn;

  q_dest:=TADOQuery.Create(Self);
  q_dest.Connection:=conn;
  q_dest.SQL.Clear;
  q_dest.SQL.Add('SELECT * FROM '''+ToTable+'''');
  q_dest.Open;

  // Заполнение
  q_source.First;
  while not q_source.Eof do
  Begin
    Zpt:='';
    SQLFields:='';
    SQLValues:='';
    s:='';
    for i:=1 to q_dest.FieldCount do
    Begin
      case q_dest.fields[i-1].DataType of
        ftString,ftMemo,ftFmtMemo,ftFixedChar, ftWideString:
          try
            s:=q_source.FieldByName(q_dest.fields[i-1].FieldName).AsString;
            System.Copy(s,1,250);
            s:=StrUtils.AnsiReplaceStr(s,':',' ');
            s:=StrUtils.AnsiReplaceStr(s,'''','"');
            if ToDos then s:=F_ForSystem.ToDOS(s);
            s:=''''+s+'''';
          except
            s:=''' ''';
          end;
        ftAutoInc,ftSmallint,ftInteger,ftWord,ftLargeInt:
          try
            s:=q_source.FieldByName(q_dest.fields[i-1].FieldName).AsString;
          except
            s:='0';
          end;
        ftBoolean:
          try
            If q_source.FieldByName(q_dest.fields[i-1].FieldName).AsBoolean then
              s:='.T.'
            else
              s:='.F.';
          except
            s:='.F.';
          end;
        ftBCD,ftCurrency,ftFloat:
          try
            s:=q_source.FieldByName(q_dest.fields[i-1].FieldName).AsString;
          except
            s:='0';
          end;
        ftDate,ftTime,ftDateTime:
          try }
//            s:=FormatDateTime('"{"mm"/"dd"/"yyyy"}"',q_source.FieldByName(q_dest.fields[i-1].FieldName).AsDateTime)
//          except
//            s:='{}';
{          end;
        else
          s:='?';
      end;
      SQLValues:=SQLValues+Zpt+s;
      SQLFields:=SQLFields+Zpt+q_dest.fields[i-1].FieldName;
      Zpt:=',';
    end;
    InsertSQL:='INSERT INTO '''+ToTable+''' ('+SQLFields+') VALUES ('+SQLValues+')';
    // Выполняем INSERT
    q_cmn.Close;
    q_cmn.SQL.Clear;
    q_cmn.SQL.Add(InsertSQL);
//    q_cmn.SQL.SaveToFile('c:\tmp\1.sql');
    q_cmn.ExecSQL;
    // Следующая запись
    q_Source.Next;
  end;

  q_dest.SQL.Clear;
  q_dest.free;
  q_cmn.SQL.Clear;
  q_cmn.free;}
End;


procedure TMasterDB.SortInGrid(DataSet:TOracleDataSet;RowNo:Word;Grid: TDBGridEh);
var
  i:integer;
  s:String;
  IsMulti,IsRowSelect: boolean;
begin
  with DataSet do
      begin
        DisableControls;
        Close;

        S:='';
        for i:=0 to grid.SortMarkedColumns.Count-1 do
          if grid.SortMarkedColumns[i].Title.SortMarker=smUpEh then
            if grid.SortMarkedColumns[i].Field.FieldKind=fkLookup then
              S:=S+' '+grid.SortMarkedColumns[i].Field.KeyFields+','
            else
              S:=S+' '+grid.SortMarkedColumns[i].FieldName+','
          else
            if grid.SortMarkedColumns[i].Field.FieldKind=fkLookup then
              S:=S+' '+grid.SortMarkedColumns[i].Field.KeyFields+' DESC,'
            else
              S:=S+' '+grid.SortMarkedColumns[i].FieldName+' DESC,';
        if s<>'' then S:='ORDER BY '+system.copy(S,1,length(S)-1);

        IsMulti:=(dgMultiSelect in Grid.Options);
        IsRowSelect:=(dgRowSelect in Grid.Options);
        Grid.Options:=Grid.Options-[dgMultiSelect]-[dgRowSelect];
        DataSet.SQL[RowNo]:=S;
//        DataSet.SQL.SaveToFile('c:\tmp\1.sql');
        f_db.ReQuery(DataSet,false);
        EnableControls;
        If IsRowSelect Then
        Begin
          Grid.Options:=Grid.Options+[dgRowSelect];
        End;
        If IsMulti Then
        Begin
          Grid.Options:=Grid.Options+[dgMultiSelect];
        End;
      end;
end;

procedure TMasterDB.SortInGridADO(DataSet:TADOQuery;RowNo:Word;Grid: TDBGridEh);
var
  i:integer;
  s:String;
  IsMulti,IsRowSelect: boolean;
begin
  with DataSet do
      begin
        DisableControls;
        Close;

        S:='';
        for i:=0 to grid.SortMarkedColumns.Count-1 do
          if grid.SortMarkedColumns[i].Title.SortMarker=smUpEh then
            if (grid.SortMarkedColumns[i].Field<>nil) and (grid.SortMarkedColumns[i].Field.FieldKind=fkLookup) then
              S:=S+' '+grid.SortMarkedColumns[i].Field.KeyFields+','
            else
              S:=S+' '+grid.SortMarkedColumns[i].FieldName+','
          else
            if (grid.SortMarkedColumns[i].Field<>nil) and (grid.SortMarkedColumns[i].Field.FieldKind=fkLookup) then
              S:=S+' '+grid.SortMarkedColumns[i].Field.KeyFields+' DESC,'
            else
              S:=S+' '+grid.SortMarkedColumns[i].FieldName+' DESC,';
        if s<>'' then S:='ORDER BY '+system.copy(S,1,length(S)-1);

        IsMulti:=(dgMultiSelect in Grid.Options);
        IsRowSelect:=(dgRowSelect in Grid.Options);
        Grid.Options:=Grid.Options-[dgMultiSelect]-[dgRowSelect];
        DataSet.SQL[RowNo]:=S;
        Open;
        EnableControls;
        If IsRowSelect Then
        Begin
          Grid.Options:=Grid.Options+[dgRowSelect];
        End;
        If IsMulti Then
        Begin
          Grid.Options:=Grid.Options+[dgMultiSelect];
        End;
      end;
end;

procedure TMasterDB.ReQuery(DataSet:TOracleDataSet;UseBookmark:boolean);
var
  BM:TBookmark;
begin
  Screen.Cursor := crHourGlass;    { Show hourglass cursor }
  with DataSet do
  try
    DisableControls;
    BM:=dataSet.GetBookmark;
    Close;
    {Connection.CommitTrans;}
    try
      Open;
    except
      on E:EOracleError do
      Begin
        if (E.ErrorCode = 3114) or (E.ErrorCode = 12571) then
        Begin
          DataSet.Session.LogOff;
          DataSet.Session.LogOn;
          Open;
        end;
      end;
    end;
    try
      if (DataSet.RecordCount>0) and (UseBookmark) then
        DataSet.GotoBookmark(BM);
    except
      DataSet.First;
    end;
    DataSet.FreeBookmark(BM);
  finally
    EnableControls;
    Screen.Cursor := crDefault;  { Always restore to normal }
  end;
end;

procedure TMasterDB.ReQueryADO(DataSet:TADOQuery;UseBookmark:boolean);
var
  BM:TBookmark;
begin
  Screen.Cursor := crHourGlass;    { Show hourglass cursor }
  with DataSet do
  try
    DisableControls;
    BM:=dataSet.GetBookmark;
    Close;
    {Connection.CommitTrans;}
    Open;
    try
      if (DataSet.RecordCount>0) and (UseBookmark) then
        DataSet.GotoBookmark(BM);
    except
      DataSet.First;
    end;
    DataSet.FreeBookmark(BM);
  finally
    EnableControls;
    Screen.Cursor := crDefault;  { Always restore to normal }
  end;
end;

// Редактировать в окне
procedure TMasterDB.EditInMemo(pGrid:TDBGridEh; pReadOnly:boolean=false);
var
  pTable:TOracleDataSet;
Begin
  pTable:=TOracleDataSet(pGrid.DataSource.DataSet);
	with pGrid do
	Begin
		if NOT pTable.Eof then
		with tf_MemoEdit.Create(Self) do
		begin
			EditValue:=SelectedField.AsString;
			EditDescription:='Редактирование '+SelectedField.DisplayName;
			ShowModal;
			if (ModalResult=mrOk) and (NOT pTable.ReadOnly) and (NOT SelectedField.ReadOnly) and NOT pReadOnly then
			Begin
				if pTable.State=dsBrowse then pTable.Edit;
				SelectedField.AsString:=EditValue;
				pTable.Post;
			End;
			Free;
		end;
	end;
end;

// Показать в окне текст запроса из грида
procedure TMasterDB.GridSQL(pForm:TForm;pGrid:TDBGridEh;pSQL:string;pDataSet:TOracleDataSet);
var
  pTable:TOracleDataSet;
  s:string;
  i:integer;
Begin
  if f_main.UserAdmin then
  Begin
    with tf_MemoEdit.Create(Self) do
  	begin
	  	s:=pSQL;
			EditDescription:='Текст запроса из TForm:TDBGrid = '+pForm.Name+':'+pGrid.Name;
      if pDataSet<>nil then
      if pDataSet.VariableCount>0 then
      with pDataSet.Variables do
      Begin
        s:=s+chr(10)+chr(10)+'Значения переменных:';
        for i:=1 to pDataSet.VariableCount do
        Begin
          s:=s+chr(10)+pDataSet.VariableName(i-1)+'=';
          case pDataSet.VariableType(i-1) of
            otInteger,otFloat,otLong,otString,otChar: s:=s+VarToStr(pDataSet.GetVariable(i-1));
            otDate: s:=s+FormatDateTime('dd.mm.yyyy',DateOf(pDataSet.GetVariable(i-1)))+' '+FormatDateTime('hh:mm',TimeOf(pDataSet.GetVariable(i-1)));
          end;
        end;
      End;
      EditValue:=s;
			ShowModal;
			Free;
		end;
	end;
end;

// Открытие сессии
function TMasterDB.LogonMasterSession(ora_Session:TOracleSession):boolean;
Begin
  ora_Session.LogOff;
  ora_Session.LogonUsername:=f_main.ora_Session.LogonUsername;
  ora_Session.LogonPassword:=f_main.ora_Session.LogonPassword;
  ora_Session.LogonDatabase:=f_main.ora_Session.LogonDatabase;
  ora_Session.AfterLogOn:=f_main.ora_Session.AfterLogOn;
  ora_Session.LogOn;
  LogonMasterSession:=ora_Session.Connected;
End;

procedure TMasterDB.SetUserGrants(acMan:TActionManager);
var
  I:Integer;
  q:TOracleDataSet;
begin
  q:=TOracleDataSet.Create(Self);
  with q do
  try
    Session:=f_main.ora_Session;
    If (ParamCount=2) AND (AnsiUpperCase(ParamStr(1))='/USER') then
      SQL.Add('SELECT GivenRight FROM User_Rights WHERE Username='''+AnsiUpperCase(ParamStr(2))+'''')
    else
      SQL.Add('SELECT GivenRight FROM User_Rights WHERE Username='''+F_ForSystem.GetUserName(True)+'''');
    f_db.ReQuery(q,false);
    for i:=0 to acMan.ActionCount-1 do
      if Locate('GIVENRIGHT',acMan.Actions[i].Name,[]) OR (acMan.Actions[i].Category='FOR_ALL') then
      begin
        TAction(acMan.Actions[i]).Enabled:=True;
        TAction(acMan.Actions[i]).Visible:=True;
      end
      else
      begin
        TAction(acMan.Actions[i]).Enabled:=False;
        TAction(acMan.Actions[i]).Visible:=False;
      end;
  finally
    Close;
    SQL.Clear;
    Free;
  end;
end;

function TMasterDB.CheckGrant(ActionName:string):boolean;
var
 q:TOracleDataSet;
begin
  q:=TOracleDataSet.Create(Self);
  CheckGrant:=false;
  with q do
  try
    Session:=f_main.ora_Session;
    SQL.Add('SELECT GivenRight FROM User_Rights WHERE Username='''+F_ForSystem.GetUserName(True)+''' AND NLS_UPPER(GIVENRIGHT)='''+AnsiUpperCase(ActionName)+'''');
    f_db.ReQuery(q,false);
    CheckGrant:=not Eof;
  finally
    Close;
    SQL.Clear;
    Free;
  end;
end;

procedure TMasterDB.FilterAcceptText(pGrid:TDBGridEh; pFilter:TStringList; var NewText: String; var Accept: Boolean);
begin
  inherited;
  pGrid.Columns[pGrid.Col-1].Title.Font.Style:=
    pGrid.Columns[pGrid.Col-1].Title.Font.Style+[fsBold];
  pFilter[pGrid.Col-1]:=NewText;
  TOracleDataSet(pGrid.DataSource.DataSet).Filtered:=True;
  Accept:=True;
end;

procedure TMasterDB.FilterCurrentValue(pGrid:TDBGridEh; pFilter:TStringList);
var
  FieldValue:String;
begin
  inherited;
  if not TOracleDataSet(pGrid.DataSource.DataSet).eof then
  Begin
    pGrid.Columns[pGrid.Col-1].Title.Font.Style:=
      pGrid.Columns[pGrid.Col-1].Title.Font.Style+[fsBold];
    pFilter[pGrid.Col-1]:=pGrid.SelectedField.AsString;
    TOracleDataSet(pGrid.DataSource.DataSet).Filtered:=True;
    f_db.ReQuery(TOracleDataSet(pGrid.DataSource.DataSet),true);
  end;
end;

procedure TMasterDB.FilterClear(pGrid:TDBGridEh; pFilter:TStringList);
var
  I:Integer;
  Filtered:Boolean;
begin
  Filtered:=False;
  pGrid.Columns[pGrid.Col-1].Title.Font.Style:=
    pGrid.Columns[pGrid.Col-1].Title.Font.Style-[fsBold];
  pFilter[pGrid.Col-1]:='';
  for i:=0 to pFilter.Count-1 do
    if pFilter[i]<>'' then Filtered:=True;
  TOracleDataSet(pGrid.DataSource.DataSet).Filtered:=Filtered;
  f_db.ReQuery(TOracleDataSet(pGrid.DataSource.DataSet),true);
end;

function TMasterDB.AcceptFilterRecord(pGrid:TDBGridEh; pFilter:TStringList): Boolean;
var
  I:Integer;
  FieldValue:String;
begin
  Result:=True;
  for i:=0 to pFilter.Count-1 do
    if pFilter[i]<>'' then
      begin
        FieldValue:=pGrid.Columns[i].Field.AsString;
        case pGrid.Columns[i].Field.DataType of
          ftString,ftMemo,ftFmtMemo,ftFixedChar, ftWideString:
            Result:=Result and (Pos(AnsiUpperCase(pFilter[i]),AnsiUpperCase(FieldValue))<>0);
          ftAutoInc,ftSmallint,ftInteger,ftWord,ftLargeInt,ftBCD,ftCurrency,ftFloat:
            Result:=Result and (pFilter[i]=FieldValue);
          ftDate,ftTime,ftDateTime:
            Result:=Result and (StrToDateTime(pFilter[i])=pGrid.Columns[i].Field.AsDateTime);
        end;
      end;
end;

{ Уникальный идентификатор из АРМ Товарный оператор }
function TMasterDB.GetTovOpUniqId(conn:TADOConnection;pDocName:string;pDir:string): string;
var
  q_tmp:TADOQuery;
  s,TextSQL:string;
  i:integer;
begin
  q_tmp:=TADOQuery.Create(Self);
  q_tmp.Connection:=conn;
  if pDocName='KVIT' then
  begin
{    TextSQL:='SELECT MAX_ID FROM '''+pDir+'uid_kvit.dbf'' WHERE DOC_NAME='''+pDocName+'''';
    // Выполняем
    q_tmp.Close;
    q_tmp.SQL.Clear;
    q_tmp.SQL.Add(TextSQL);
    //    q_tmp.SQL.SaveToFile('c:\tmp\1.sql');
    q_tmp.Open;
    i:=0;
    if not q_tmp.eof then
    Begin
      i:=q_tmp.FieldByName('NEXT_NUM').AsInteger;
    end;
    s:=IntToStr(i+1);
    TextSQL:='UPDATE '''+pDir+'uniq_id.dbf'' SET NEXT_NUM='+s+' WHERE DOC_NAME='''+pDocName+'''';
    // Выполняем
    q_tmp.Close;
    q_tmp.SQL.Clear;
    q_tmp.SQL.Add(TextSQL);
    //    q_tmp.SQL.SaveToFile('c:\tmp\1.sql');
    q_tmp.ExecSql;}
    GetTovOpUniqId:='0';
  end
  else
  begin
    TextSQL:='SELECT NEXT_NUM FROM '''+pDir+'uniq_id.dbf'' WHERE DOC_NAME='''+pDocName+'''';
    // Выполняем
    q_tmp.Close;
    q_tmp.SQL.Clear;
    q_tmp.SQL.Add(TextSQL);
    //    q_tmp.SQL.SaveToFile('c:\tmp\1.sql');
    q_tmp.Open;
    i:=0;
    if not q_tmp.eof then
    Begin
      i:=q_tmp.FieldByName('NEXT_NUM').AsInteger;
    end;
    s:=IntToStr(i+1);
    TextSQL:='UPDATE '''+pDir+'uniq_id.dbf'' SET NEXT_NUM='+s+' WHERE DOC_NAME='''+pDocName+'''';
    // Выполняем
    q_tmp.Close;
    q_tmp.SQL.Clear;
    q_tmp.SQL.Add(TextSQL);
    //    q_tmp.SQL.SaveToFile('c:\tmp\1.sql');
    q_tmp.ExecSql;
    GetTovOpUniqId:='1'+IntToStr(i)+'00';
  end;
  q_tmp.Close;
  q_tmp.SQL.Clear;
  q_tmp.free;
end;


{ Номер следующего документа из АРМ Товарный оператор }
function TMasterDB.GetTovOpUniqNum(conn:TADOConnection;pDocName:string;pDir:string;pArh:string;pDate:TDateTime): string;
var
  q_tmp:TADOQuery;
  s,TextSQL:string;
  i,max_i:integer;
begin
  q_tmp:=TADOQuery.Create(Self);
  q_tmp.Connection:=conn;

  max_i:=0;

  if pDocName='PODACHA' then
  Begin
    TextSQL:='SELECT max(pod_num) as max_i FROM '''+pDir+'podacha.dbf'' WHERE tip_otgr=1 AND mesto=1 AND year(date_pod)='+IntToStr(YearOf(pDate))+
    ' UNION ALL '+
    'SELECT max(pod_num) as max_i FROM '''+pArh+'podacha.dbf'' WHERE tip_otgr=1 AND mesto=1 AND year(date_pod)='+IntToStr(YearOf(pDate));

    //AND date_pod>='+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',pDate-30)+' 
    // Выполняем
    q_tmp.Close;
    q_tmp.SQL.Clear;
    q_tmp.SQL.Add(TextSQL);
    //    q_tmp.SQL.SaveToFile('c:\tmp\1.sql');
    q_tmp.Open;

    i:=0;
    while not q_tmp.eof do
    Begin
      i:=q_tmp.FieldByName('MAX_I').AsInteger;
      if i>=max_i then max_i:=i;
      q_tmp.Next;
    end;
  end;

  q_tmp.Close;
  q_tmp.SQL.Clear;
  q_tmp.free;
  GetTovOpUniqNum:=IntToStr(max_i+1);
end;

end.

