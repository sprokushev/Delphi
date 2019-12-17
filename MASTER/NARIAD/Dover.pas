unit Dover;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ToolWin, ActnMan, ActnCtrls, DBCtrls, StdCtrls,
  ExtCtrls, Oracle, DB, OracleData, ActnList, ActnMenus, DateUtil, MDIForm,
  CustomizeDlg, Menus, OracleNavigator, ComCtrls,
  TB2Dock, TB2Toolbar, TB2Item, XPStyleActnCtrls;

type
  TF_Dover = class(Tf_MDIForm)
    grid_Dovers: TDBGridEh;
    ora_Session: TOracleSession;
    q_Dovers: TOracleDataSet;
    ds_Dovers: TDataSource;
    Panel1: TPanel;
    cb_Pokup: TCheckBox;
    lcbox_Pokup: TDBLookupComboBox;
    q_DoversID: TFloatField;
    q_DoversNUM_DOVER: TStringField;
    q_DoversDATE_DOVER: TDateTimeField;
    q_DoversDATE_END: TDateTimeField;
    q_DoversFIO_DOVER: TStringField;
    q_DoversDOLJ_DOVER: TStringField;
    q_DoversPREDPR_ID: TIntegerField;
    q_DoversPREDPR_NAME: TStringField;
    q_ListPokup: TOracleDataSet;
    ds_ListPokup: TDataSource;
    q_DoversVES: TFloatField;
    q_ListPokupInDover: TOracleDataSet;
    ds_ListPokupInDover: TDataSource;
    StatusBar1: TStatusBar;
    q_Tmp: TOracleDataSet;
    TBDock1: TTBDock;
    ActionManager1: TActionManager;
    ac_NewDov: TAction;
    ac_ChangeDov: TAction;
    ac_DelDov: TAction;
    ac_SeekDov: TAction;
    ac_ChoosePeriodDov: TAction;
    ac_RefreshDov: TAction;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBItem7: TTBItem;
    OracleNavigator1: TOracleNavigator;
    procedure grid_DoversSortMarkingChanged(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure grid_DoversDblClick(Sender: TObject);
    procedure cb_PokupClick(Sender: TObject);
    procedure lcbox_PokupCloseUp(Sender: TObject);
    procedure mi_CloseClick(Sender: TObject);
    procedure ac_NewDovExecute(Sender: TObject);
    procedure ac_ChangeDovExecute(Sender: TObject);
    procedure ac_DelDovExecute(Sender: TObject);
    procedure ac_SeekDovExecute(Sender: TObject);
    procedure ac_ChoosePeriodDovExecute(Sender: TObject);
    procedure ac_RefreshDovExecute(Sender: TObject);
    procedure TBItem7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Dover: TF_Dover;

implementation

uses AskPeriod, FindDov, EdDover, ForDB;

{$R *.dfm}

procedure TF_Dover.grid_DoversSortMarkingChanged(Sender: TObject);
begin
  f_db.SortInGrid(q_Dovers,9,grid_Dovers);
end;

procedure TF_Dover.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Ora_session.LogOff;
  q_ListPokup.Close;
  q_ListPokup.SQL.Clear;
  q_ListPokupInDover.Close;
  q_ListPokupInDover.SQL.Clear;
  q_Dovers.Close;
  q_Dovers.SQL.Clear;
  q_Tmp.Close;
  q_Tmp.SQL.Clear;
  Action:=caFree;
end;

procedure TF_Dover.FormCreate(Sender: TObject);
begin
  f_db.SetUserGrants(ActionManager1);
  f_db.LogonMasterSession(ora_Session);
  q_ListPokupInDover.Open;
  q_ListPokup.Open;
  ac_ChoosePeriodDovExecute(Sender);
end;

procedure TF_Dover.grid_DoversDblClick(Sender: TObject);
begin
  IF ac_ChangeDov.Enabled then ac_ChangeDovExecute(Self);
end;

procedure TF_Dover.cb_PokupClick(Sender: TObject);
begin
  IF cb_Pokup.Checked then
  Begin
    q_ListPokupInDover.Close;
    q_ListPokupInDover.Open;
  end;
  lcbox_Pokup.Enabled:=cb_Pokup.Checked;
  If lcbox_Pokup.Enabled then
  Begin
    lcbox_Pokup.SetFocus;
    lcbox_Pokup.DropDown;
  end
  Else
  Begin
    with q_Dovers do
    try
      DisableControls;
      Close;
      SQL[7]:=' AND 1=1 ';
      Open;
    finally
      EnableControls;
    End;
  End;
end;

procedure TF_Dover.lcbox_PokupCloseUp(Sender: TObject);
begin
  with q_Dovers do
  try
    DisableControls;
    Close;
    try
      SQL[7]:=' AND (KLS_DOVER.PREDPR_ID='+IntToStr(lcbox_Pokup.KeyValue) + ')';
      Open;
    except
      SQL[7]:=' 1=1 ';
      Open;
    end;
  finally
    EnableControls;
  End;
end;

procedure TF_Dover.mi_CloseClick(Sender: TObject);
begin
  close;
end;

procedure TF_Dover.ac_NewDovExecute(Sender: TObject);
var OldPokup:integer;
    OldId:integer;
begin
  with TF_EdDover.Create(Self) do
  Begin
    IF NOT q_Dovers.Eof Then OldPokup:=q_Dovers.FieldByName('PREDPR_ID').AsInteger
    Else OldPokup:=1;
    q_Dovers.Insert;
    OldId:=q_Dovers.FieldByName('ID').AsInteger;
    try
      If cb_Pokup.Checked Then
        q_Dovers.FieldByName('PREDPR_ID').AsInteger:=lcbox_Pokup.KeyValue
      Else
        q_Dovers.FieldByName('PREDPR_ID').AsInteger:=OldPokup;
    except
    end;
    ed_FIO.Text:='';
    ed_Dolj.Text:='';
    If ShowModal=mrOk then
    Begin
      f_db.ReQuery(q_Dovers,True);
      q_Dovers.Locate('ID',OldId,[]);
    End;
    Free;
  End;
end;

procedure TF_Dover.ac_ChangeDovExecute(Sender: TObject);
begin
  with TF_EdDover.Create(Self) do
  Begin
    q_Dovers.Edit;
    If ShowModal=mrOk then f_db.ReQuery(q_Dovers,True);
    Free;
  End;
end;

procedure TF_Dover.ac_DelDovExecute(Sender: TObject);
begin
  If NOT q_Dovers.Eof Then
  If Application.MessageBox('Удалить доверенность?','Внимание',MB_YESNO)=IDYES Then
  try
    q_Tmp.SQL.Clear;
    q_Tmp.SQL.Add('DELETE FROM KLS_DOVER WHERE ID='+q_Dovers.FieldByName('ID').AsString);
    q_Tmp.ExecSQL;
    q_Tmp.SQL.Clear;
    q_Tmp.SQL.Add('COMMIT');
    q_Tmp.ExecSQL;
    q_Dovers.Next;
    IF q_Dovers.EOF Then q_Dovers.Prior;
  except
    on E: Exception do
    Begin
      IF Pos('NARIAD_DOVER_FK) violated - child record found',E.Message)<>0 Then
        Application.MessageBox(PChar('Удалить доверенность не удалось: На нее ссылаются наряды'),'Внимание',MB_OK)
      Else
        IF Pos('DOV_LINE_DOVER_FK) violated - child record found',E.Message)<>0 Then
          Application.MessageBox(PChar('Удалить доверенность не удалось: Удалите сперва позиции доверенности'),'Внимание',MB_OK)
        Else
          Application.MessageBox(PChar('Удалить доверенность не удалось: '+#13#10+E.Message),'Внимание',MB_OK);
      q_Tmp.SQL.Clear;
      q_Tmp.SQL.Add('ROLLBACK');
      q_Tmp.ExecSQL;
    end;
  End;
  f_db.ReQuery(q_Dovers,True);
end;

procedure TF_Dover.ac_SeekDovExecute(Sender: TObject);
var FindID:integer;
begin
  with TF_FindDov.Create(Self) do
  Begin
    ShowModal;
    If ModalResult=mrYes then
    with q_Dovers do
    Begin
      FindID:=0;

      {Дата доверенности}
      IF FindID=0 Then
      try
        If Locate('date_dover',StrToDate(SeekStr),[]) Then FindID:=1;
      except
        FindID:=0;
      end;

      {№ доверенности}
      IF FindID=0 Then
      try
        If Locate('num_dover',StrToInt(SeekStr),[]) Then FindID:=1;
      except
        FindID:=0;
      end;

      {Вес}
      IF FindID=0 Then
      try
        If Locate('ves',StrToFloat(SeekStr),[]) Then FindID:=1;
      except
        FindID:=0;
      end;

      {Дата окончания}
      IF FindID=0 Then
      try
        If Locate('date_end',StrToDate(SeekStr),[]) Then FindID:=1;
      except
        FindID:=0;
      end;

      {ФИО}
      IF FindID=0 Then
      try
        If Locate('fio_dover',SeekStr,[loCaseInsensitive,loPartialKey]) Then FindID:=1;
      except
        FindID:=0;
      end;

      {Должность}
      IF FindID=0 Then
      try
        If Locate('dolj_dover',SeekStr,[loCaseInsensitive,loPartialKey]) Then FindID:=1;
      except
        FindID:=0;
      end;

      {Покупатель}
      IF FindID=0 Then
      try
        If Locate('predpr_name',SeekStr,[loCaseInsensitive,loPartialKey]) Then FindID:=1;
      except
        FindID:=0;
      end;

      If FindID=0 Then Application.MessageBox('Искомое значение не найдено','Внимание',MB_OK);
    end;
    Free;
  end;
end;

procedure TF_Dover.ac_ChoosePeriodDovExecute(Sender: TObject);
begin
  with TF_AskPeriod.Create(Self) do
  Begin
    FromDate:=NOW-ExtractDay(NOW)+1;
    ToDate:=NOW;
    ShowModal;
    IF ModalResult=mrOk Then
    with q_Dovers do
    try
      DisableControls;
      Close;
      SQL[3]:='  AND ((KLS_DOVER.DATE_DOVER BETWEEN TO_DATE('''+
        IntToStr(ExtractDay(FromDate))+'.'+
        IntToStr(ExtractMonth(FromDate))+'.'+
        IntToStr(ExtractYear(FromDate))+''',''dd.mm.yyyy'') AND TO_DATE('''+
        IntToStr(ExtractDay(ToDate))+'.'+
        IntToStr(ExtractMonth(ToDate))+'.'+
        IntToStr(ExtractYear(ToDate))+''',''dd.mm.yyyy'')) OR ';
      SQL[4]:='      (KLS_DOVER.DATE_END BETWEEN TO_DATE('''+
        IntToStr(ExtractDay(FromDate))+'.'+
        IntToStr(ExtractMonth(FromDate))+'.'+
        IntToStr(ExtractYear(FromDate))+''',''dd.mm.yyyy'') AND TO_DATE('''+
        IntToStr(ExtractDay(ToDate))+'.'+
        IntToStr(ExtractMonth(ToDate))+'.'+
        IntToStr(ExtractYear(ToDate))+''',''dd.mm.yyyy'')) OR ';
      SQL[5]:='      (TO_DATE('''+
        IntToStr(ExtractDay(FromDate))+'.'+
        IntToStr(ExtractMonth(FromDate))+'.'+
        IntToStr(ExtractYear(FromDate))+''',''dd.mm.yyyy'') BETWEEN KLS_DOVER.DATE_DOVER AND KLS_DOVER.DATE_END) OR ';
      SQL[6]:='      (TO_DATE('''+
        IntToStr(ExtractDay(ToDate))+'.'+
        IntToStr(ExtractMonth(ToDate))+'.'+
        IntToStr(ExtractYear(ToDate))+''',''dd.mm.yyyy'') BETWEEN KLS_DOVER.DATE_DOVER AND KLS_DOVER.DATE_END)) ';
      try
        Open;
      except
        SQL[3]:=' AND (1=1 OR ';
        SQL[4]:='      1=1 OR ';
        SQL[5]:='      1=1 OR ';
        SQL[6]:='      1=1) ';
        Open;
      end;
    finally
      EnableControls;
    End;
  end;
end;

procedure TF_Dover.ac_RefreshDovExecute(Sender: TObject);
begin
  f_db.ReQuery(q_Dovers,True);
end;

procedure TF_Dover.TBItem7Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.
