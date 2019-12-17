unit DocStream;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Oracle, DB, OracleData, Grids, DBGridEh, ExtCtrls, TB2Dock,
  TB2Toolbar, StdCtrls, DBCtrls, DBGrids, MdiForm, Placemnt, RXSplit,
  ActnList, XPStyleActnCtrls, ActnMan, TB2Item, Menus;

type
  Tf_DocStream = class(Tf_MDIForm)
    Panel1: TPanel;
    grid_nextValue: TDBGridEh;
    ora_Session: TOracleSession;
    q_list: TOracleDataSet;
    ds_list: TDataSource;
    q_tmp: TOracleDataSet;
    q_currInfo: TOracleDataSet;
    q_nextValue: TOracleDataSet;
    ds_nextValue: TDataSource;
    q_currValue: TOracleDataSet;
    q_nextInfo: TOracleDataSet;
    q_masterInfo: TOracleDataSet;
    q_masterValue: TOracleDataSet;
    q_listDOC_NAME: TStringField;
    q_listDOC_ORD: TFloatField;
    grid_list: TDBGridEh;
    lb_Info: TListBox;
    RxSplitter1: TRxSplitter;
    FormStorage1: TFormStorage;
    q_listDOC_STAGE: TStringField;
    q_listDOC_COND: TStringField;
    ds_nextInfo: TDataSource;
    ActionManager1: TActionManager;
    acDSGoStage: TAction;
    acDSGoDoc: TAction;
    q_currStru: TOracleDataSet;
    q_nextStru: TOracleDataSet;
    q_listDOC_ROWID: TStringField;
    acDSGoBack: TAction;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    tb_GoBack: TTBItem;
    tb_GoDoc: TTBItem;
    Panel2: TPanel;
    lb_DocCaption: TLabel;
    TBDock2: TTBDock;
    TBToolbar2: TTBToolbar;
    TBItem3: TTBItem;
    acDSToXLS: TAction;
    SaveDialog1: TSaveDialog;
    TBPopupMenu1: TTBPopupMenu;
    TBItem9: TTBItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grid_listGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure acDSGoStageExecute(Sender: TObject);
    procedure acDSGoDocExecute(Sender: TObject);
    procedure q_listBeforeScroll(DataSet: TDataSet);
    procedure acDSGoBackExecute(Sender: TObject);
    procedure acDSToXLSExecute(Sender: TObject);
  private
    { Private declarations }
    procedure FillList(curStage:string;curCond:string); // Заполнение списка этапов потока
  public
    { Public declarations }
    StreamTag:string; // ТЕГ потока документов
    StageTag:string; // ТЕГ текущего этапа
    StageCondition:string; // Текущее условие
    LastRowId:string;
  end;

var
  f_DocStream: Tf_DocStream;
  StartStream:string;
  StartStage:string;
  StartCondition:string;

implementation

uses ForDB,DBGridEhImpExp,RxShell, main;

{$R *.dfm}

procedure Tf_DocStream.FormCreate(Sender: TObject);
begin
  StreamTag:=AnsiUpperCase(StartStream);
  StageTag:=AnsiUpperCase(StartStage);
  StageCondition:=AnsiUpperCase(StartCondition);
  f_db.LogonMasterSession(Ora_session);
  FillList(StageTag,StageCondition);
end;

// Заполнение списка с этапами потока текущего документа
procedure Tf_DocStream.FillList(curStage:string;curCond:string);
var row_str:string;
    IsOk:boolean;
    s:string;
    row_ord:integer;
    master_id:integer;
    master_cond:string;
    next_id:integer;
    next_cond:string;
    cond_str:string;
    t_lookup:TOracleDataSet;
    nf_s:TStringField;
    nf_i:TIntegerField;
    nf_f:TFloatField;
    nf_b:TBooleanField;
    nf_d:TDateTimeField;
    i:integer;
    Save_Cursor: TCursor;
    IsFound:boolean;
    Row_Id:string;

Begin
  Save_Cursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;    { Show hourglass cursor }
  StageCondition:=AnsiUpperCase(curCond);
  StageTAG:=AnsiUpperCase(curStage);

  try
    q_list.DisableControls;
    q_nextValue.DisableControls;
    q_nextInfo.Close;
    q_nextValue.Close;
    q_masterInfo.Close;
    q_list.Close;

    // Очистка списка
    with q_tmp do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM V_TEMPTABLE WHERE APP_NAME='''+APPLICATION_NAME+''' AND UNIT_NAME=''STREAM'' AND TABLE_NAME=''LIST_STAGES''');
      ExecSQL;
      SQL.Clear;
      SQL.Add('COMMIT');
      ExecSQL;
    end;

    // Определяем параметры текущего этапа
    with q_currInfo do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT A.*, B.NAME as STREAM_NAME, C.* FROM DOC_STREAM_STAGES A, DOC_STREAM B, MASTER_KLS_STRUCTURE C '+
              'WHERE A.stream_id=B.id AND A.TABLE_TAG=C.ID AND B.TAG='''+StreamTAG+''' AND A.TABLE_TAG='''+StageTAG+'''');
      Open;
    end;

    if q_currInfo.Eof then
    Begin
      q_currInfo.Close;
      Application.MessageBox('Неверное описание документа или потока документов!','Внимание!',MB_OK);
      exit;
    End;

    Caption:=q_currInfo.FieldByName('STREAM_NAME').AsString;

    // Текущий документ
    with q_currValue do
    Begin
      Close;
      SQL.Clear;
      s:=AnsiUpperCase(q_currInfo.FieldByName('QUERY').AsString);
      if pos('WHERE',s)>0 then s:=s+' AND ('+StageCondition+')'
      else s:=s+' WHERE '+StageCondition;
      // Проверка права на просмотр документа
      if not f_db.CheckGrant(q_currInfo.FieldByName('RIGHT_ID').AsString) then s:=s+' AND (1=0)';
      SQL.Add(s);
      Open;
    end;

    if q_currValue.eof then
    Begin
      q_currInfo.Close;
      q_currValue.Close;
      Application.MessageBox('Данного документа не существует!','Внимание!',MB_OK);
    end;

    // Описание текущего документа добавляем в список этапов
    row_str:=F_DB.FillMask(q_currInfo.FieldByName('TITLE_MASK').AsString,q_currValue,IsOk,0);
    IF (q_currValue.FieldDefs.IndexOf('ROW_ID')<>-1) then
      Row_Id:=q_currValue.FieldByName('ROW_ID').AsString
    Else
      Row_Id:='';
    with q_tmp do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO V_TEMPTABLE (APP_NAME,UNIT_NAME,TABLE_NAME,NUM1,CHAR1,CHAR4) '+
              'VALUES ('''+APPLICATION_NAME+''',''STREAM'',''LIST_STAGES'',1000,'''+row_str+''','''+Row_Id+''')');
      ExecSQL;
//      SQL.SaveToFile('c:\tmp\2.sql');
      SQL.Clear;
      SQL.Add('COMMIT');
      ExecSQL;
    end;

    // Перебираем родительские документы
    row_ord:=1000;
    master_id:=q_currInfo.FieldByName('master_id').AsInteger;
    master_cond:=q_currInfo.FieldByName('master_condition').AsString;
    with q_masterValue do
    Begin
      Close;
      SQL.Clear;
      SQL.AddStrings(q_currValue.SQL);
      Open;
    end;

    // Перебор родительских документов
    while master_id>0 do
    Begin
      // описание родительского документа
      with q_masterInfo do
      Begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT A.*, B.NAME as STREAM_NAME, C.* FROM DOC_STREAM_STAGES A, DOC_STREAM B, MASTER_KLS_STRUCTURE C '+
                'WHERE A.stream_id=B.id AND A.TABLE_TAG=C.ID AND B.TAG='''+StreamTAG+''' AND A.ID='+IntToStr(master_id));
        Open;
      end;

      if q_masterInfo.Eof then master_id:=0
      else
      Begin
        // Условие к родительскому документу
        cond_str:=F_DB.FillMask(master_cond,q_masterValue,IsOk,2);
        if not IsOk then master_id:=0
        else
        Begin
          // Родительский документ
          with q_masterValue do
          Begin
            Close;
            SQL.Clear;
            s:=AnsiUpperCase(q_masterInfo.FieldByName('QUERY').AsString);
            if pos('WHERE',s)>0 then s:=s+' AND ('+cond_str+')'
            else s:=s+' WHERE '+cond_str;
            // Проверка права на просмотр документа
            if not f_db.CheckGrant(q_masterInfo.FieldByName('RIGHT_ID').AsString) then s:=s+' AND (1=0)';
            SQL.Add(s);
            Open;
          end;

          if q_masterValue.eof then master_id:=0
          else
          Begin
            // Описание родительского документа добавляем в список этапов
            row_str:=F_DB.FillMask(q_masterInfo.FieldByName('TITLE_MASK').AsString,q_masterValue,IsOk,0);
            IF (q_masterValue.FieldDefs.IndexOf('ROW_ID')<>-1) then
              Row_Id:=q_masterValue.FieldByName('ROW_ID').AsString
            Else
              Row_Id:='';
            row_ord:=row_ord-1;
            with q_tmp do
            Begin
              Close;
              SQL.Clear;
              cond_str:=StringReplace(cond_str,'''','''''',[rfReplaceAll]);
              SQL.Add('INSERT INTO V_TEMPTABLE (APP_NAME,UNIT_NAME,TABLE_NAME,NUM1,CHAR1,CHAR2,CHAR3,CHAR4) '+
                      'VALUES ('''+APPLICATION_NAME+''',''STREAM'',''LIST_STAGES'','+IntToStr(row_ord)+','''+row_str+''','''+
                      q_masterInfo.FieldByName('TABLE_TAG').AsString+''','''+cond_str+''','''+RowId+''')');
              ExecSQL;
              SQL.Clear;
              SQL.Add('COMMIT');
              ExecSQL;
            end;
            master_id:=q_masterInfo.FieldByName('master_id').AsInteger;
            master_cond:=q_masterInfo.FieldByName('master_condition').AsString;
          End;
        end; // IsOk
      end; // not q_masterInfo.Eof
    end; // while


    // Перебираем дочерние документы
    row_ord:=1000;
    next_id:=q_currInfo.FieldByName('next_id').AsInteger;

    // Перебор дочерних документов
    while next_id>0 do
    Begin
      // описание дочернего документа
      with q_nextInfo do
      Begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT A.*, B.NAME as STREAM_NAME, C.* FROM DOC_STREAM_STAGES A, DOC_STREAM B, MASTER_KLS_STRUCTURE C '+
                'WHERE A.stream_id=B.id AND A.TABLE_TAG=C.ID AND B.TAG='''+StreamTAG+''' AND A.ID='+IntToStr(next_id));
        Open;
      end;

      if q_nextInfo.Eof then next_id:=0
      else
      Begin
        // Описание дочернего документа добавляем в список этапов
        row_str:=q_nextInfo.FieldByName('CAPTION').AsString;
        row_ord:=row_ord+1;
        with q_tmp do
        Begin
          Close;
          SQL.Clear;
          SQL.Add('INSERT INTO V_TEMPTABLE (APP_NAME,UNIT_NAME,TABLE_NAME,NUM1,CHAR1) VALUES ('''+APPLICATION_NAME+''',''STREAM'',''LIST_STAGES'','+IntToStr(row_ord)+','''+row_str+''')');
          ExecSQL;
          SQL.Clear;
          SQL.Add('COMMIT');
          ExecSQL;
        end;
        next_id:=q_nextInfo.FieldByName('next_id').AsInteger;
      end; // not q_nextInfo.Eof
    end; // while

    // Список этапов
    q_list.Open;
    q_list.locate('DOC_ORD',1000,[]);

    // Информация о текущем документе
    f_db.RowInList(StageTag,q_currValue,lb_Info.Items);

    // Дочерние документы (список)
    next_id:=q_currInfo.FieldByName('next_id').AsInteger;
    next_cond:=q_currInfo.FieldByName('next_condition').AsString;
    with q_nextInfo do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT A.*, B.NAME as STREAM_NAME, C.* FROM DOC_STREAM_STAGES A, DOC_STREAM B, MASTER_KLS_STRUCTURE C '+
              'WHERE A.stream_id=B.id AND A.TABLE_TAG=C.ID AND B.TAG='''+StreamTAG+''' AND A.ID='+IntToStr(next_id));
      Open;
    end;

    if not q_nextInfo.Eof then
    Begin
      // Условие к дочернему документу
      row_str:=F_DB.FillMask(next_cond,q_currValue,IsOk,2);
      if IsOk then
      Begin
        // Дочерние документы
        with q_tmp do
        Begin
          Close;
          SQL.Clear;
          s:=AnsiUpperCase(q_nextInfo.FieldByName('QUERY').AsString);
          if pos('WHERE',s)>0 then s:=s+' AND (1=0)'
          else s:=s+' WHERE 1=0';
          SQL.Add(s);
          Open;
        end;

        // Оформить GRID
        // Структура документов
        with q_nextStru do
        Begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM MASTER_KLS_FIELD_STRUCTURE WHERE structure_id='''+q_nextInfo.FieldByName('TABLE_TAG').AsString+''' ORDER BY FIELD_ID');
          Open;
        End;

        If not q_nextStru.Eof then
        Begin
          q_nextValue.Fields.Clear;

          for i:=1 to q_tmp.FieldDefs.Count do
          begin
            case q_tmp.FieldDefs[i-1].DataType of
              ftString:
                begin
                  nf_s:=TStringField.Create(q_nextValue);
                  nf_s.FieldName := q_tmp.FieldDefs[i-1].Name;
                  nf_s.Name := 'q_nextValue'+nf_s.FieldName;
                  nf_s.Size:=q_tmp.FieldDefs[i-1].Size;
                  nf_s.Index:=q_nextValue.FieldCount;
                  nf_s.DataSet:=q_nextValue;
                end;
              ftDate,ftDateTime:
                begin
                  nf_d:=TDateTimeField.Create(q_nextValue);
                  nf_d.FieldName := q_tmp.FieldDefs[i-1].Name;
                  nf_d.Name := 'q_nextValue'+nf_d.FieldName;
                  nf_d.Index:=q_nextValue.FieldCount;
                  nf_d.DataSet:=q_nextValue;
                end;
              ftFloat:
                Begin
                  nf_f:=TFloatField.Create(q_nextValue);
                  nf_f.FieldName := q_tmp.FieldDefs[i-1].Name;
                  nf_f.Name := 'q_nextValue'+nf_f.FieldName;
                  nf_f.Index:=q_nextValue.FieldCount;
                  nf_f.DataSet:=q_nextValue;
                end;
              ftInteger:
                begin
                  nf_i:=TIntegerField.Create(q_nextValue);
                  nf_i.FieldName := q_tmp.FieldDefs[i-1].Name;
                  nf_i.Name := 'q_nextValue'+nf_i.FieldName;
                  nf_i.Index:=q_nextValue.FieldCount;
                  nf_i.DataSet:=q_nextValue;
                end;
              ftBoolean:
                begin
                  nf_b:=TBooleanField.Create(q_nextValue);
                  nf_b.FieldName := q_tmp.FieldDefs[i-1].Name;
                  nf_b.Name := 'q_nextValue'+nf_b.FieldName;
                  nf_b.Index:=q_nextValue.FieldCount;
                  nf_b.DataSet:=q_nextValue;
                  nf_b.DisplayValues := 'Да;Нет';
                end;
            end;
            q_nextValue.FieldDefs.Update;
          end;

          // Подготовка LOOKUP-полей
          q_nextStru.First;
          while not q_nextStru.Eof do
          begin
            If q_nextStru.FieldByName('FIELD_KIND').AsInteger=1 Then
            Begin
              t_lookup:=TOracleDataSet.Create(Self);
              with t_lookup do
              Begin
                Session:=f_main.ora_Session;
                SQL.Add(q_nextStru.FieldByName('LOOKUP_SOURCE_QUERY').AsString);
                t_lookup.Open;
                IF (FieldDefs.IndexOf(q_nextStru.FieldByName('LOOKUP_KEY_FIELD').AsString)<>-1) then
                If (FieldDefs.IndexOf(q_nextStru.FieldByName('LOOKUP_DISPLAY_FIELD').AsString)<>-1) then
                Begin
                  nf_s:=TStringField.Create(q_nextValue);
                  nf_s.FieldName := q_nextStru.FieldByName('FIELD_NAME').AsString+'_'+q_nextStru.FieldByName('LOOKUP_TABLE').AsString+'_'+q_nextStru.FieldByName('LOOKUP_DISPLAY_FIELD').AsString;
                  nf_s.Name := nf_s.FieldName;
                  nf_s.Index:=q_nextValue.FieldCount;
                  nf_s.DataSet := q_nextValue;
                  nf_s.Size:=t_lookup.FieldDefs.Find(q_nextStru.FieldByName('LOOKUP_DISPLAY_FIELD').AsString).Size;
                  nf_s.DisplayWidth:=nf_s.Size;
                  if nf_s.DisplayWidth>50 then nf_s.DisplayWidth:=50;
                  nf_s.LookupDataSet:=t_lookup;
                  nf_s.FieldKind:=fkLookup;
                  nf_s.KeyFields:=q_nextStru.FieldByName('FIELD_NAME').AsString;
                  nf_s.LookupKeyFields:=q_nextStru.FieldByName('LOOKUP_KEY_FIELD').AsString;
                  nf_s.LookupResultField:=q_nextStru.FieldByName('LOOKUP_DISPLAY_FIELD').AsString;
                end;
              end;
            end;
            q_nextStru.Next;
          end;

          // открытие
          with q_nextValue do
          Begin
            Close;
            SQL.Clear;
            s:=AnsiUpperCase(q_nextInfo.FieldByName('QUERY').AsString);
            if pos('WHERE',s)>0 then s:=s+' AND ('+row_str+')'
            else s:=s+' WHERE '+row_str;
            // Проверка права на просмотр документа
            if not f_db.CheckGrant(q_nextInfo.FieldByName('RIGHT_ID').AsString) then s:=s+' AND (1=0)';
            SQL.Add(s);
            if q_nextInfo.FieldByName('START_ORDER').AsString<>'' then
              SQL.Add('ORDER BY '+q_nextInfo.FieldByName('START_ORDER').AsString)
            else
              SQL.Add('');
            Open;
          end;

          // Заполнение GRID
          grid_nextValue.Columns.Clear;
          q_nextStru.First;
          while not q_nextStru.Eof do
          begin
            if q_nextStru.FieldByName('DISPLAY_WIDTH').AsInteger<>0 then
               q_nextValue.FieldByName(q_nextStru.FieldByName('FIELD_NAME').AsString).DisplayWidth:=q_nextStru.FieldByName('DISPLAY_WIDTH').AsInteger;
            with grid_nextValue.Columns.Add do
            begin
              If q_nextStru.FieldByName('FIELD_KIND').AsInteger=1 Then // Lookup-поле
              Begin
                FieldName:=q_nextStru.FieldByName('FIELD_NAME').AsString+'_'+q_nextStru.FieldByName('LOOKUP_TABLE').AsString+'_'+q_nextStru.FieldByName('LOOKUP_DISPLAY_FIELD').AsString;
              End
              Else
              Begin
                FieldName:=q_nextStru.FieldByName('FIELD_NAME').AsString;
              End;
              If q_nextStru.FieldByName('FIELD_KIND').AsInteger=2 Then // Checkbox-поле
              Begin
                Checkboxes:=true;
                DblClickNextVal:=true;
                KeyList.Add('1');
                KeyList.Add('0');
              End;
              ReadOnly:=(q_nextStru.FieldByName('FIELD_READONLY').AsInteger=1);
              Title.Caption:=q_nextStru.FieldByName('FIELD_CAPTION').AsString;
              Title.TitleButton:=True;
            end;
            q_nextStru.Next;
          end;
        end;
      end; // IsOk
    end; // not q_nextInfo.Eof

    lb_DocCaption.Caption:=q_nextInfo.FieldByName('CAPTION').AsString+' по документу '+q_list.FieldByName('DOC_NAME').AsString;
    tb_GoBack.Caption:=acDSGoBack.Caption+' "'+q_list.FieldByName('DOC_NAME').AsString+'"';
    tb_GoDoc.Caption:=acDSGoDoc.Caption+' "'+q_nextInfo.FieldByName('CAPTION').AsString+'"';

  finally
    q_list.EnableControls;
    q_nextValue.EnableControls;
  end;
  Screen.Cursor := crDefault;  { Always restore to normal }
End;


procedure Tf_DocStream.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ora_Session.LogOff;
  Action:=caFree;
end;

procedure Tf_DocStream.grid_listGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if q_list.FieldByName('DOC_ORD').AsInteger=1000 then
    AFont.Style:=[fsBold];
end;

procedure Tf_DocStream.acDSGoStageExecute(Sender: TObject);
begin
  inherited;
  if q_list.FieldByName('DOC_ORD').AsInteger=1000 then
  Begin
    f_db.ReQuery(q_nextValue,true);
    f_db.ReQuery(q_list,true);
  End
  else
    if q_list.FieldByName('DOC_ORD').AsInteger<1000 then
    Begin
      FillList(q_list.FieldByName('DOC_STAGE').AsString,q_list.FieldByName('DOC_COND').AsString);
      IF (q_nextValue.FieldDefs.IndexOf('ROW_ID')<>-1) then
      Begin
        if not q_nextValue.locate('ROW_ID',LastRowId,[]) then q_nextValue.First;
      End;
    End
    else
      if (q_list.FieldByName('DOC_ORD').AsInteger=1001) and (not q_nextInfo.eof) then
      Begin
        acDSGoDocExecute(Sender);
      End
      else
        Application.MessageBox(PChar('Вначале выберите документ '+q_nextInfo.FieldByName('CAPTION').AsString),'Внимание!',MB_OK);
end;

procedure Tf_DocStream.acDSGoDocExecute(Sender: TObject);
var row_str:string;
    IsOk:boolean;
begin
  inherited;
  if not q_nextValue.eof and not q_nextInfo.eof then
  Begin
    row_str:=F_DB.FillMask(q_nextInfo.FieldByName('CONDITION').AsString,q_nextValue,IsOk,2);
    FillList(q_nextInfo.FieldByName('TABLE_TAG').AsString,row_str);
  end;
end;

procedure Tf_DocStream.q_listBeforeScroll(DataSet: TDataSet);
begin
  inherited;
  if q_list.FieldByName('DOC_ORD').AsInteger=1000 then
    LastRowId:=q_list.FieldByName('DOC_ROWID').AsString;
end;

procedure Tf_DocStream.acDSGoBackExecute(Sender: TObject);
begin
  inherited;
  q_list.Prior;
  if not q_list.Bof then acDSGoStageExecute(Sender);
end;

procedure Tf_DocStream.acDSToXLSExecute(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
    if not FileExists(SaveDialog1.FileName) then
      begin
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,grid_nextValue,SaveDialog1.FileName,True);
        FileExecute(SaveDialog1.FileName,'','',esMaximized);
      end
    else
      if MessageDlg('Файл уже существует! Переписать?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,grid_nextValue,SaveDialog1.FileName,True);
          FileExecute(SaveDialog1.FileName,'','',esMaximized);
        end

end;

end.
