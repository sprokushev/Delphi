unit ScriptGen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MdiForm, StdCtrls, DB, OracleData, DBCtrls,main, Mask, ToolEdit,
  ActnList, XPStyleActnCtrls, ActnMan, ExtCtrls, Grids, DBGrids, Oracle;

type
  Tf_ScriptGen = class(Tf_MDIForm)
    q_Tables: TOracleDataSet;
    q_Columns: TOracleDataSet;
    ds_tables: TDataSource;
    ActionManager1: TActionManager;
    ac_SG_Generate: TAction;
    ac_SG_CreateShadow: TAction;
    q_PrimaryKeys: TOracleDataSet;
    q_Sequences: TOracleDataSet;
    ds_Columns: TDataSource;
    ds_PrimaryKeys: TDataSource;
    ds_Sequences: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    lcb_table: TDBLookupComboBox;
    Label1: TLabel;
    Panel2: TPanel;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    Panel3: TPanel;
    ed_trg_bef: TEdit;
    ed_trg_aft: TEdit;
    ed_shadow: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    cb_Shadow: TCheckBox;
    Label2: TLabel;
    ed_dirs: TDirectoryEdit;
    bt_generate: TButton;
    bt_shadow: TButton;
    q_cmn: TOracleQuery;
    cb_Logging: TCheckBox;
    cb_CheckPK: TCheckBox;
    ed_Sequence: TEdit;
    cb_Sequence: TCheckBox;
    bt_Sequences: TButton;
    q_ForeignKeys: TOracleDataSet;
    ds_ForeignKeys: TDataSource;
    cb_CheckFK: TCheckBox;
    DBGrid4: TDBGrid;
    Label6: TLabel;
    ed_scheme: TEdit;
    cb_ShadowInLogScheme: TCheckBox;
    cb_2WayUsing: TCheckBox;
    cb_CheckAKInShadow: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure q_ColumnsBeforeOpen(DataSet: TDataSet);
    procedure ac_SG_CreateShadowExecute(Sender: TObject);
    procedure q_PrimaryKeysBeforeOpen(DataSet: TDataSet);
    procedure q_SequencesBeforeOpen(DataSet: TDataSet);
    procedure q_TablesAfterScroll(DataSet: TDataSet);
    procedure cb_ShadowClick(Sender: TObject);
    procedure ac_SG_GenerateExecute(Sender: TObject);
    procedure q_SequencesAfterScroll(DataSet: TDataSet);
    procedure cb_SequenceClick(Sender: TObject);
    procedure q_ForeignKeysBeforeOpen(DataSet: TDataSet);
    procedure bt_SequencesClick(Sender: TObject);
    procedure cb_2WayUsingClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure InsDeleteLog(VAR F:TextFile;Margin:integer);
    procedure InsInsertLog(VAR F:TextFile;Margin:integer);
    procedure InsUpdateLog(VAR F:TextFile;Margin:integer);
  end;

var
  f_ScriptGen: Tf_ScriptGen;

implementation
uses StrUtils;
{$R *.dfm}

procedure Tf_ScriptGen.FormCreate(Sender: TObject);
begin
  inherited;
  q_Tables.Open;
  lcb_table.DropDown;
end;

procedure Tf_ScriptGen.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  q_Tables.Close;
  q_Columns.Close;
  q_PrimaryKeys.Close;
  q_Sequences.Close;
  Action:=caFree;
end;

procedure Tf_ScriptGen.q_ColumnsBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  If Self.Active then
  with q_Columns do
    begin
      SQL[1]:='WHERE tab_name='''+q_Tables.FieldValues['TAB_NAME']+'''';
    end;
end;

procedure Tf_ScriptGen.ac_SG_CreateShadowExecute(Sender: TObject);
var s,s1:string;
    scheme:string;
begin
  inherited;
  // Схема, где будет находиться теневая таблица
  if cb_ShadowInLogScheme.Checked AND (ed_scheme.Text<>'') then
    scheme:=ed_scheme.Text
  else
    scheme:=SCHEMA_NAME;

  if cb_Shadow.Checked AND q_Tables.Active then
  If NOT q_Tables.Eof then
  Begin
    // Пересоздать теневую таблицу
    with q_cmn do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('ALTER TABLE '+scheme+'.'+ed_shadow.Text+' DROP PRIMARY KEY CASCADE');
      try
        Execute;
      except
      end;
      SQL.Clear;
      SQL.Add('DROP TABLE '+scheme+'.'+ed_shadow.Text+' CASCADE CONSTRAINTS');
      try
        Execute;
      except
      end;
      s:='CREATE TABLE '+scheme+'.'+ed_shadow.Text;
      s1:='(';
      q_Columns.First;
      while not q_Columns.Eof do
      Begin
        s:=s+s1+q_Columns.FieldValues['COL_NAME']+' '+q_Columns.FieldValues['DATATYPE'];
        if q_Columns.FieldValues['DATATYPE']='NUMBER' then
        Begin
          if NOT VarIsNull(q_Columns.FieldValues['MAXIMUM_LENGTH']) then
            s:=s+'('+IntToStr(q_Columns.FieldValues['MAXIMUM_LENGTH'])+','+IntToStr(q_Columns.FieldValues['DECIMAL_PLACES'])+')'
        End
        else
          if q_Columns.FieldValues['DATATYPE']='VARCHAR2' then
            s:=s+'('+IntToStr(q_Columns.FieldValues['MAXIMUM_LENGTH'])+')';
        s1:=',';
        q_Columns.Next;
      End;
      s:=s+') LOGGING NOCACHE NOPARALLEL';
      SQL.Clear;
      SQL.Add(s);
      try
        Execute;
      except
      end;
      SQL.Clear;
      SQL.Add('INSERT INTO '+scheme+'.'+ed_shadow.Text+' SELECT * FROM '+q_Tables.FieldValues['TAB_NAME']);
      try
        Execute;
      except
      end;
      SQL.Clear;
      SQL.Add('COMMIT');
      try
        Execute;
      except
      end;
      SQL.Clear;
    end;
  End;
end;

procedure Tf_ScriptGen.q_PrimaryKeysBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  If Self.Active then
  with q_PrimaryKeys do
    begin
      SQL[1]:='WHERE tab_name='''+q_Tables.FieldValues['TAB_NAME']+'''';
    end;
end;

procedure Tf_ScriptGen.q_SequencesBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  If Self.Active then
  with q_Sequences do
    begin
      SQL[1]:='WHERE tab_name='''+q_Tables.FieldValues['TAB_NAME']+'''';
    end;
end;

procedure Tf_ScriptGen.q_TablesAfterScroll(DataSet: TDataSet);
var ApplTag:boolean;
begin
  inherited;
  q_Columns.Close;
  q_Columns.Open;
  q_PrimaryKeys.Close;
  q_PrimaryKeys.Open;
  q_ForeignKeys.Close;
  q_ForeignKeys.Open;
  q_Sequences.Close;
  q_Sequences.Open;
  if q_Sequences.EOF AND cb_Sequence.Checked Then
  Begin
    ed_Sequence.Text:='SEQ_'+q_Tables.FieldValues['TAB_NAME'];
  End;
  ed_trg_bef.Text:='TRG_BIUDR_'+q_Tables.FieldValues['TAB_NAME'];
  ed_trg_aft.Text:='TRG_AIUDR_'+q_Tables.FieldValues['TAB_NAME'];
  ed_shadow.Text:=q_Tables.FieldValues['TAB_NAME']+'_SHADOW';
  q_Columns.First;
  ApplTag:=false;
  while not q_Columns.Eof do
  Begin
    if q_Columns.FieldValues['COL_NAME']='APPL_TAG' then ApplTag:=true;
    q_Columns.Next;
  End;
  q_Columns.First;
  If NOT ApplTag Then cb_2WayUsing.Checked:=false
  Else cb_2WayUsing.Checked:=cb_Logging.Checked;
end;

procedure Tf_ScriptGen.cb_ShadowClick(Sender: TObject);
begin
  inherited;
  bt_Shadow.Enabled:=cb_Shadow.Checked;
end;

procedure Tf_ScriptGen.ac_SG_GenerateExecute(Sender: TObject);
var
  F: TextFile;
  DirFN,FN:string;
  s1,S: string;
  scheme:string;
begin
  inherited;

  if cb_ShadowInLogScheme.Checked AND (ed_scheme.Text<>'') then
    scheme:=ed_scheme.Text
  else
    scheme:=SCHEMA_NAME;

  DirFN := ed_dirs.Text;
  If DirFN[Length(DirFN)]<>'\' then DirFN:=DirFN+'\';

  // Триггер ДО
  q_Columns.First;
  q_PrimaryKeys.First;
  q_Sequences.First;
  AssignFile(F, DirFN + ed_trg_bef.Text+'.sql'); { File selected in dialog }
  Rewrite(F);
  WriteLn(F,'CREATE OR REPLACE TRIGGER '+ed_trg_bef.Text);
  Write(F,' BEFORE DELETE OR INSERT OR UPDATE');
  WriteLn(F,' ON '+q_Tables.FieldValues['TAB_NAME']);
  WriteLn(F,' FOR EACH ROW');
  WriteLn(F,'/* ---------------------------------------------');
  WriteLn(F,'  Генератор скриптов для MASTER');
  WriteLn(F,'  PSV v1.04');
  WriteLn(F,'--------------------------------------------- */');
  WriteLn(F,'DECLARE');
  WriteLn(F,'  v_old '+q_Tables.FieldValues['TAB_NAME']+'%ROWTYPE;');
  WriteLn(F,'  v_new '+q_Tables.FieldValues['TAB_NAME']+'%ROWTYPE;');
  WriteLn(F,'  v_tmp NUMBER;');
  WriteLn(F,'BEGIN');
  WriteLn(F);
  WriteLn(F,'  IF DELETING() OR UPDATING() THEN');
  WriteLn(F,'    -- Старые значения');
  q_Columns.First;
  while not q_Columns.Eof do
  Begin
    WriteLn(F,'    v_old.'+q_Columns.FieldValues['COL_NAME']+' := :OLD.'+q_Columns.FieldValues['COL_NAME']+';');
    q_Columns.Next;
  End;
  WriteLn(F,'  END IF;');
  WriteLn(F);
  WriteLn(F,'  -- До удаления');
  WriteLn(F,'  IF DELETING() THEN');
  WriteLn(F,'    NULL;');
  WriteLn(F,'  END IF;');
  WriteLn(F);
  WriteLn(F,'  IF INSERTING() OR UPDATING() THEN');
  WriteLn(F,'    -- Новые значения');
  q_Columns.First;
  while not q_Columns.Eof do
  Begin
    WriteLn(F,'    v_new.'+q_Columns.FieldValues['COL_NAME']+' := :NEW.'+q_Columns.FieldValues['COL_NAME']+';');
    q_Columns.Next;
  End;
  WriteLn(F);
  If cb_Sequence.Checked Then
  Begin
    if cb_2WayUsing.Checked then
      WriteLn(F,'    IF v_old.APPL_TAG='''+APPLICATION_NAME+''' THEN')
    else
      WriteLn(F,'    IF 1=1 THEN');
      WriteLn(F,'      -- Уникальный ID');
    q_Sequences.First;
    If NOT q_Sequences.EOF Then
    Begin
      WriteLn(F,'      IF v_new.'+q_Sequences.FieldValues['COL_NAME']+'=0 OR v_new.'+q_Sequences.FieldValues['COL_NAME']+' IS NULL THEN');
      WriteLn(F,'        SELECT '+q_Sequences.FieldValues['SEQ_NAME']+'.nextval INTO v_new.'+q_Sequences.FieldValues['COL_NAME']+' FROM DUAL;');
      WriteLn(F,'      END IF;');
    End
    Else
    Begin
      WriteLn(F,'      IF v_new.ID=0 OR v_new.ID IS NULL THEN');
      WriteLn(F,'        SELECT '+ed_Sequence.Text+'.nextval INTO v_new.ID FROM DUAL;');
      WriteLn(F,'      END IF;');
    End;
    WriteLn(F,'      -- Проверка новых значений');
    WriteLn(F,'      NULL;');
    WriteLn(F,'    END IF;');
  End;
  WriteLn(F);
  WriteLn(F,'    IF UPDATING() THEN');
  WriteLn(F,'      NULL;');
  q_PrimaryKeys.First;
  if cb_CheckPk.Checked AND NOT q_PrimaryKeys.EOF Then
  Begin
    WriteLn(F,'      -- Проверка на изменение PRIMARY KEY');
    s1:='      IF';
    while not q_PrimaryKeys.Eof do
    Begin
      Write(F,s1+' v_old.'+q_PrimaryKeys.FieldValues['COL_NAME']+'<>v_new.'+q_PrimaryKeys.FieldValues['COL_NAME']);
      s1:=' OR';
      q_PrimaryKeys.Next;
    End;
    WriteLn(F,' THEN');
    WriteLn(F,'        raise_application_error(FOR_SCRIPTS.SG$PK_CHANGE, FOR_SCRIPTS.SG$PK_CHANGE_TXT);');
    WriteLn(F,'      END IF;');
    WriteLn(F);
  end;
  q_ForeignKeys.First;
  if cb_CheckFK.Checked AND NOT q_ForeignKeys.EOF Then
  Begin
    WriteLn(F,'      -- Проверка на изменение FOREIGN KEYS');
    while not q_ForeignKeys.Eof do
    Begin
      WriteLn(F,'      IF v_old.'+q_ForeignKeys.FieldValues['COL_NAME']+'<>v_new.'+q_ForeignKeys.FieldValues['COL_NAME']+' THEN');
      WriteLn(F,'        raise_application_error(FOR_SCRIPTS.SG$FK_CHANGE, FOR_SCRIPTS.SG$FK_CHANGE_TXT);');
      WriteLn(F,'      END IF;');
      WriteLn(F);
      q_ForeignKeys.Next;
    End;
  end;
  WriteLn(F,'    END IF;');
  WriteLn(F);
  q_PrimaryKeys.First;
  q_Columns.First;
  IF cb_shadow.Checked AND (NOT q_PrimaryKeys.EOF OR NOT q_Columns.EOF) AND cb_CheckAKInShadow.Checked then
  Begin
    WriteLn(F,'    -- Поиск аналогичных записей в теневой таблице (альтернативный ключ)');
    WriteLn(F,'    BEGIN');
    WriteLn(F,'      SELECT NULL');
    WriteLn(F,'      INTO v_tmp');
    Write(F,'      FROM '+scheme+'.'+ed_shadow.Text);
    s1:='      WHERE (';
    while not q_PrimaryKeys.Eof do
    Begin
      WriteLn(F);
      Write(F,s1+' '+q_PrimaryKeys.FieldValues['COL_NAME']+'<>v_new.'+q_PrimaryKeys.FieldValues['COL_NAME']);
      s1:='         OR';
      q_PrimaryKeys.Next;
    End;
    Write(F,')');
    s1:='        AND';
    while not q_Columns.Eof do
    Begin
      IF NOT q_PrimaryKeys.Locate('COL_NAME',q_Columns.FieldValues['COL_NAME'],[]) then
      Begin
        WriteLn(F);
        Write(F,s1+' '+q_Columns.FieldValues['COL_NAME']+'=v_new.'+q_Columns.FieldValues['COL_NAME']);
        s1:='        AND';
      End;
      q_Columns.Next;
    End;
    WriteLn(F,';');
    WriteLn(F,'      raise_application_error(FOR_SCRIPTS.SG$ROW_EXIST, FOR_SCRIPTS.SG$ROW_EXIST_TXT);');
    WriteLn(F,'    EXCEPTION');
    WriteLn(F,'      WHEN NO_DATA_FOUND THEN');
    WriteLn(F,'        NULL;');
    WriteLn(F,'      WHEN TOO_MANY_ROWS THEN');
    WriteLn(F,'        raise_application_error(FOR_SCRIPTS.SG$ROW_EXIST, FOR_SCRIPTS.SG$ROW_EXIST_TXT);');
    WriteLn(F,'    END;');
    WriteLn(F);
  End;
  WriteLn(F,'    -- До обновления');
  WriteLn(F,'    IF UPDATING() THEN');
  WriteLn(F,'      NULL;');
  WriteLn(F,'    END IF;');
  WriteLn(F);
  WriteLn(F,'    -- До добавления');
  WriteLn(F,'    IF INSERTING() THEN');
  WriteLn(F,'      NULL;');
  WriteLn(F,'    END IF;');
  WriteLn(F);
  WriteLn(F,'    -- Сохранение новых значений');
  q_Columns.First;
  while not q_Columns.Eof do
  Begin
    WriteLn(F,'    :NEW.'+q_Columns.FieldValues['COL_NAME']+' := v_new.'+q_Columns.FieldValues['COL_NAME']+';');
    q_Columns.Next;
  End;
  WriteLn(F,'  END IF;');
  WriteLn(F,'END;');
  CloseFile(F);

  // Триггер ПОСЛЕ
  q_Columns.First;
  q_PrimaryKeys.First;
  q_Sequences.First;
  AssignFile(F, DirFN + ed_trg_aft.Text+'.sql'); { File selected in dialog }
  Rewrite(F);
  WriteLn(F,'CREATE OR REPLACE TRIGGER '+ed_trg_aft.Text);
  Write(F,' AFTER DELETE OR INSERT OR UPDATE');
  WriteLn(F,' ON '+q_Tables.FieldValues['TAB_NAME']);
  WriteLn(F,' FOR EACH ROW');
  WriteLn(F,'/* ---------------------------------------------');
  WriteLn(F,'  Генератор скриптов для MASTER');
  WriteLn(F,'  PSV v1.04');
  WriteLn(F,'--------------------------------------------- */');
  WriteLn(F,'DECLARE');
  WriteLn(F,'  v_old '+q_Tables.FieldValues['TAB_NAME']+'%ROWTYPE;');
  WriteLn(F,'  v_new '+q_Tables.FieldValues['TAB_NAME']+'%ROWTYPE;');
  WriteLn(F,'  v_tmp NUMBER;');
  WriteLn(F,'  LogId NUMBER;');
  WriteLn(F,'  cl_WhatWasDone CLOB;');
  WriteLn(F,'  WriteStr VARCHAR2(250);');
  WriteLn(F,'  WritePos NUMBER;');
  WriteLn(F,'BEGIN');
  WriteLn(F);
  WriteLn(F,'  IF DELETING() OR UPDATING() THEN');
  WriteLn(F,'    -- Старые значения');
  q_Columns.First;
  while not q_Columns.Eof do
  Begin
    WriteLn(F,'    v_old.'+q_Columns.FieldValues['COL_NAME']+' := :OLD.'+q_Columns.FieldValues['COL_NAME']+';');
    q_Columns.Next;
  End;
  WriteLn(F,'  END IF;');
  WriteLn(F);
  WriteLn(F,'  -- После удаления');
  WriteLn(F,'  IF DELETING() THEN');
  WriteLn(F,'    NULL;');
  q_PrimaryKeys.First;
  IF cb_shadow.Checked AND NOT q_PrimaryKeys.EOF Then
  Begin
    WriteLn(F,'    -- Удаление из теневой таблицы');
    Write(F,'    DELETE FROM '+scheme+'.'+ed_shadow.Text);
    s1:='     WHERE';
    while not q_PrimaryKeys.Eof do
    Begin
      WriteLn(F);
      Write(F,s1+' '+q_PrimaryKeys.FieldValues['COL_NAME']+'=v_old.'+q_PrimaryKeys.FieldValues['COL_NAME']);
      s1:='       AND';
      q_PrimaryKeys.Next;
    End;
    WriteLn(F,';');
  End;

  InsDeleteLog(F,4);

  WriteLn(F,'  END IF;');
  WriteLn(F);
  WriteLn(F,'  IF INSERTING() OR UPDATING() THEN');
  WriteLn(F,'    -- Новые значения');
  q_Columns.First;
  while not q_Columns.Eof do
  Begin
    WriteLn(F,'    v_new.'+q_Columns.FieldValues['COL_NAME']+' := :NEW.'+q_Columns.FieldValues['COL_NAME']+';');
    q_Columns.Next;
  End;
  WriteLn(F);
  q_PrimaryKeys.First;
  IF cb_shadow.Checked AND NOT q_PrimaryKeys.EOF Then
  Begin
    WriteLn(F,'    -- Обновление теневой таблицы');
    WriteLn(F,'    UPDATE '+scheme+'.'+ed_shadow.Text+' SET');
    s1:='(';
    s:='';
    q_Columns.First;
    while not q_Columns.Eof do
    Begin
      s:=s+s1+q_Columns.FieldValues['COL_NAME'];
      s1:=',';
      q_Columns.Next;
    End;
    WriteLn(F,'      '+s+')=');
    s1:='';
    s:='';
    q_Columns.First;
    while not q_Columns.Eof do
    Begin
      s:=s+s1+'v_new.'+q_Columns.FieldValues['COL_NAME'];
      s1:=',';
      q_Columns.Next;
    End;
    WriteLn(F,'      (SELECT '+s+' FROM dual)');
    s1:='';
    s:='';
    q_PrimaryKeys.First;
    while not q_PrimaryKeys.Eof do
    Begin
      s:=s+s1+q_PrimaryKeys.FieldValues['COL_NAME']+'=v_old.'+q_PrimaryKeys.FieldValues['COL_NAME'];
      s1:=' AND ';
      q_PrimaryKeys.Next;
    End;
    WriteLn(F,'      WHERE '+s+';');
    WriteLn(F);
    WriteLn(F,'    IF SQL%NOTFOUND THEN');
    WriteLn(F,'      INSERT INTO '+scheme+'.'+ed_shadow.Text);
    s1:='(';
    s:='';
    q_Columns.First;
    while not q_Columns.Eof do
    Begin
      s:=s+s1+q_Columns.FieldValues['COL_NAME'];
      s1:=',';
      q_Columns.Next;
    End;
    WriteLn(F,'        '+s+')');
    WriteLn(F,'        VALUES');
    s1:='(';
    s:='';
    q_Columns.First;
    while not q_Columns.Eof do
    Begin
      s:=s+s1+'v_new.'+q_Columns.FieldValues['COL_NAME'];
      s1:=',';
      q_Columns.Next;
    End;
    WriteLn(F,'        '+s+');');
    WriteLn(F,'    END IF;');
    WriteLn(F);
  End;
  WriteLn(F,'    -- После обновления');
  WriteLn(F,'    IF UPDATING() THEN');
  WriteLn(F,'      NULL;');
  q_PrimaryKeys.First;
  IF cb_Logging.Checked AND NOT q_PrimaryKeys.EOF Then
  Begin
    WriteLn(F,'      -- Запись в лог');
    s:='';
    s1:='';
    q_PrimaryKeys.First;
    while not q_PrimaryKeys.Eof do
    Begin
      s:=s+s1+'V_OLD.'+q_PrimaryKeys.FieldValues['COL_NAME']+'<>'+'V_NEW.'+q_PrimaryKeys.FieldValues['COL_NAME'];
      s1:=' OR ';
      q_PrimaryKeys.Next;
    End;
    WriteLn(F,'      IF '+s+' THEN');
    WriteLn(F,'        -- Изменился PRIMARY KEY, добавляем в лог 2 записи');
    InsDeleteLog(F,8);
    WriteLn(F);
    InsInsertLog(F,8);
    WriteLn(F,'      ELSE');
    WriteLn(F,'        -- PRIMARY KEY не изменился, добавляем в лог 1 запись');
    InsUpdateLog(F,8);
    WriteLn(F,'      END IF;');
  End;
  WriteLn(F,'    END IF;');
  WriteLn(F);
  WriteLn(F,'    -- После добавления');
  WriteLn(F,'    IF INSERTING() THEN');
  WriteLn(F,'      NULL;');

  InsInsertLog(F,6);

  WriteLn(F,'    END IF;');
  WriteLn(F);
  WriteLn(F,'  END IF;');
  WriteLn(F,'END;');
  CloseFile(F);

  Application.MessageBox('Скрипты созданы','Внимание!');
end;

procedure Tf_ScriptGen.InsDeleteLog(VAR F:TextFile;Margin:integer);
var s,s1:string;
    scheme:string;
Begin
  if (ed_scheme.Text<>'') then
    scheme:=ed_scheme.Text
  else
    scheme:=SCHEMA_NAME;

  q_PrimaryKeys.First;
  IF cb_Logging.Checked AND NOT q_PrimaryKeys.EOF Then
  Begin
    WriteLn(F,DupeString(' ',Margin)+'-- Запись в лог');
    if cb_2WayUsing.Checked then
      WriteLn(F,DupeString(' ',Margin)+'IF v_old.APPL_TAG='''+APPLICATION_NAME+''' THEN')
    else
      WriteLn(F,DupeString(' ',Margin)+'IF 1=1 THEN');
    WriteLn(F,DupeString(' ',Margin)+'  SELECT seq_table_activity_log.NEXTVAL INTO LogId FROM dual;');
    WriteLn(F,DupeString(' ',Margin)+'  INSERT INTO '+scheme+'.TABLE_ACTIVITY_LOG (ID,TABLE_NAME,TABLE_ID,OSUSER,TERMINAL,MODULE,EVENT_TYPE)');
    s1:='';
    s:='';
    while not q_PrimaryKeys.Eof do
    Begin
      if q_PrimaryKeys.FieldValues['COL_TYPE']='NUMBER' then
        s:=s+s1+'TO_CHAR(V_OLD.'+q_PrimaryKeys.FieldValues['COL_NAME']+')'
      else
        if q_PrimaryKeys.FieldValues['COL_TYPE']='DATE' then
          s:=s+s1+'TO_CHAR(V_OLD.'+q_PrimaryKeys.FieldValues['COL_NAME']+',''dd.mm.yyyy hh24:mi:ss'')'
        else
          s:=s+s1+'(V_OLD.'+q_PrimaryKeys.FieldValues['COL_NAME']+')';
      s1:=' || ';
      q_PrimaryKeys.Next;
    End;
    WriteLn(F,DupeString(' ',Margin)+'    SELECT LogId,'''+q_Tables.FieldValues['TAB_NAME']+''','+s+',osuser,terminal,MODULE,''D''');
    WriteLn(F,DupeString(' ',Margin)+'      FROM sys.V_$SESSION WHERE audsid=USERENV(''sessionid'');');
    WriteLn(F,DupeString(' ',Margin)+'END IF;');
  End;
End;

procedure Tf_ScriptGen.InsInsertLog(VAR F:TextFile;Margin:integer);
var s,s1:string;
    scheme:string;
Begin
  if (ed_scheme.Text<>'') then
    scheme:=ed_scheme.Text
  else
    scheme:=SCHEMA_NAME;

  q_PrimaryKeys.First;
  IF cb_Logging.Checked AND NOT q_PrimaryKeys.EOF Then
  Begin
    WriteLn(F,DupeString(' ',Margin)+'-- Запись в лог');
    if cb_2WayUsing.Checked then
      WriteLn(F,DupeString(' ',Margin)+'IF v_new.APPL_TAG='''+APPLICATION_NAME+''' THEN')
    else
      WriteLn(F,DupeString(' ',Margin)+'IF 1=1 THEN');
    WriteLn(F,DupeString(' ',Margin)+'  SELECT seq_table_activity_log.NEXTVAL INTO LogId FROM dual;');
    WriteLn(F,DupeString(' ',Margin)+'  INSERT INTO '+scheme+'.TABLE_ACTIVITY_LOG (ID,TABLE_NAME,TABLE_ID,OSUSER,TERMINAL,MODULE,EVENT_TYPE)');
    s1:='';
    s:='';
    while not q_PrimaryKeys.Eof do
    Begin
      s:=s+s1+'TO_CHAR(V_NEW.'+q_PrimaryKeys.FieldValues['COL_NAME']+')';
      s1:=' || ';
      q_PrimaryKeys.Next;
    End;
    WriteLn(F,DupeString(' ',Margin)+'    SELECT LogId,'''+q_Tables.FieldValues['TAB_NAME']+''','+s+',osuser,terminal,MODULE,''I''');
    WriteLn(F,DupeString(' ',Margin)+'      FROM sys.V_$SESSION WHERE audsid=USERENV(''sessionid'');');
    WriteLn(F,DupeString(' ',Margin)+'END IF;');
  End;
End;

procedure Tf_ScriptGen.InsUpdateLog(VAR F:TextFile;Margin:integer);
var s,s1:string;
    scheme:string;
Begin
  if (ed_scheme.Text<>'') then
    scheme:=ed_scheme.Text
  else
    scheme:=SCHEMA_NAME;

  q_PrimaryKeys.First;
  IF cb_Logging.Checked AND NOT q_PrimaryKeys.EOF Then
  Begin
    WriteLn(F,DupeString(' ',Margin)+'-- Запись в лог');
    if cb_2WayUsing.Checked then
      WriteLn(F,DupeString(' ',Margin)+'IF v_new.APPL_TAG='''+APPLICATION_NAME+''' THEN')
    else
      WriteLn(F,DupeString(' ',Margin)+'IF 1=1 THEN');
    WriteLn(F,DupeString(' ',Margin)+'  SELECT seq_table_activity_log.NEXTVAL INTO LogId FROM dual;');
    WriteLn(F,DupeString(' ',Margin)+'  INSERT INTO '+scheme+'.TABLE_ACTIVITY_LOG (ID,TABLE_NAME,TABLE_ID,OSUSER,TERMINAL,MODULE,EVENT_TYPE,WhatWasDone)');
    s1:='';
    s:='';
    while not q_PrimaryKeys.Eof do
    Begin
      s:=s+s1+'TO_CHAR(V_NEW.'+q_PrimaryKeys.FieldValues['COL_NAME']+')';
      s1:=' || ';
      q_PrimaryKeys.Next;
    End;
    WriteLn(F,DupeString(' ',Margin)+'    SELECT LogId,'''+q_Tables.FieldValues['TAB_NAME']+''','+s+',osuser,terminal,MODULE,''U'',EMPTY_CLOB()');
    WriteLn(F,DupeString(' ',Margin)+'      FROM sys.V_$SESSION WHERE audsid=USERENV(''sessionid'');');
    WriteLn(F);
    WriteLn(F,DupeString(' ',Margin)+'  SELECT WhatWasDone INTO cl_WhatWasDone');
    WriteLn(F,DupeString(' ',Margin)+'    FROM '+scheme+'.TABLE_ACTIVITY_LOG');
    WriteLn(F,DupeString(' ',Margin)+'    WHERE ID = LogId');
    WriteLn(F,DupeString(' ',Margin)+'    FOR UPDATE;');
    WriteLn(F);
    WriteLn(F,DupeString(' ',Margin)+'  WritePos:=1;');
    WriteLn(F);

    q_Columns.First;
    while not q_Columns.Eof do
    Begin
      if q_Columns.FieldValues['COL_NAME']<>'APPL_TAG' then
      Begin
        WriteLn(F,DupeString(' ',Margin)+'  IF V_OLD.'+q_Columns.FieldValues['COL_NAME']+'<>V_NEW.'+q_Columns.FieldValues['COL_NAME']+' THEN');
        if q_Columns.FieldValues['DATATYPE']='NUMBER' then
          WriteLn(F,DupeString(' ',Margin)+'    WriteStr:='':OLD.'+q_Columns.FieldValues['COL_NAME']+'='' || TO_CHAR(V_OLD.'+q_Columns.FieldValues['COL_NAME']+') || '' :NEW.'+q_Columns.FieldValues['COL_NAME']+'='' || TO_CHAR(V_NEW.'+q_Columns.FieldValues['COL_NAME']+') || CHR(13);')
        else
          if q_Columns.FieldValues['DATATYPE']='DATE' then
            WriteLn(F,DupeString(' ',Margin)+'    WriteStr:='':OLD.'+q_Columns.FieldValues['COL_NAME']+'='' || TO_CHAR(V_OLD.'+q_Columns.FieldValues['COL_NAME']+',''dd.mm.yyyy hh24:mi:ss'') || '' :NEW.'+q_Columns.FieldValues['COL_NAME']+'='' || TO_CHAR(V_NEW.'+q_Columns.FieldValues['COL_NAME']+',''dd.mm.yyyy hh24:mi:ss'') || CHR(13);')
          else
            WriteLn(F,DupeString(' ',Margin)+'    WriteStr:='':OLD.'+q_Columns.FieldValues['COL_NAME']+'='' || (V_OLD.'+q_Columns.FieldValues['COL_NAME']+') || '' :NEW.'+q_Columns.FieldValues['COL_NAME']+'='' || (V_NEW.'+q_Columns.FieldValues['COL_NAME']+') || CHR(13);');
        WriteLn(F,DupeString(' ',Margin)+'    dbms_lob.WRITE(cl_WhatWasDone, LENGTH(WriteStr),WritePos,WriteStr);');
        WriteLn(F,DupeString(' ',Margin)+'    WritePos:=WritePos+LENGTH(WriteStr);');
        WriteLn(F,DupeString(' ',Margin)+'  END IF;');
      end;
      q_Columns.Next;
    End;
    WriteLn(F,DupeString(' ',Margin)+'END IF;');
  End;
End;

procedure Tf_ScriptGen.q_SequencesAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if NOT q_Sequences.EOF AND cb_Sequence.Checked then
  Begin
    ed_Sequence.Text:=q_Sequences.FieldByName('SEQ_NAME').AsString;
  End;
end;

procedure Tf_ScriptGen.cb_SequenceClick(Sender: TObject);
begin
  inherited;
  if cb_Sequence.Checked AND NOT q_Sequences.EOF then
  Begin
    ed_Sequence.Text:=q_Sequences.FieldByName('SEQ_NAME').AsString;
  end
  else
  Begin
    ed_Sequence.Text:='';
  end;
  ed_Sequence.Enabled:=cb_Sequence.Checked;
end;

procedure Tf_ScriptGen.q_ForeignKeysBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  If Self.Active then
  with q_ForeignKeys do
    begin
      SQL[1]:='WHERE tab_name='''+q_Tables.FieldValues['TAB_NAME']+'''';
    end;
end;

procedure Tf_ScriptGen.bt_SequencesClick(Sender: TObject);
var s,s1:string;
begin
  inherited;
  if cb_Sequence.Checked AND (ed_Sequence.Text<>'') then
  Begin
    // Пересоздать SEQUENCES
    with q_cmn do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('CREATE SEQUENCE '+ed_Sequence.Text+' INCREMENT BY 1 START WITH 1 MINVALUE 1 NOCYCLE NOCACHE NOORDER');
      try
        Execute;
      except
      end;
      SQL.Clear;
    end;
  End;
end;

procedure Tf_ScriptGen.cb_2WayUsingClick(Sender: TObject);
var ApplTag:boolean;
begin
  inherited;
  if cb_2WayUsing.Checked then
  Begin
    q_Columns.First;
    ApplTag:=false;
    while not q_Columns.Eof do
    Begin
      if q_Columns.FieldValues['COL_NAME']='APPL_TAG' then ApplTag:=true;
      q_Columns.Next;
    End;
    q_Columns.First;
    If NOT ApplTag then
    if Application.MessageBox('Добавить поле APPL_TAG - для одновременного заполнения таблицы из интерфейса MASTER и путем закачки?','Внимание!',MB_YESNO)=IDYES then
    // Добавить поле APPL_TAG
    with q_cmn do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('ALTER TABLE '+q_Tables.FieldValues['TAB_NAME']+'	ADD APPL_TAG VARCHAR2(6)');
      try
        Execute;
      except
      end;
      SQL.Clear;
    End
    else cb_2WayUsing.Checked:=false;
  End;

end;

end.
