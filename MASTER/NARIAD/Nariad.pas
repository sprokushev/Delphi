unit Nariad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ToolWin, ActnMan, ActnCtrls, DBCtrls, StdCtrls,
  ExtCtrls, Oracle, DB, OracleData, ActnList, ActnMenus, DateUtil, MDIForm,
  CustomizeDlg, Menus, OracleNavigator, ComCtrls,
  TB2Item, TB2Dock, TB2Toolbar, XPStyleActnCtrls;

type
  TF_Nariad = class(Tf_MDIForm)
    grid_Nariad: TDBGridEh;
    ora_Session: TOracleSession;
    q_Nariad: TOracleDataSet;
    ds_Nariad: TDataSource;
    Panel1: TPanel;
    cb_Pokup: TCheckBox;
    lcbox_Pokup: TDBLookupComboBox;
    q_ListDover: TOracleDataSet;
    ds_ListDover: TDataSource;
    q_ListPokupInDover: TOracleDataSet;
    ds_ListPokupInDover: TDataSource;
    StatusBar1: TStatusBar;
    q_Tmp: TOracleDataSet;
    q_NariadID: TFloatField;
    q_NariadNUM_NAR: TStringField;
    q_NariadDATE_NAR: TDateTimeField;
    q_NariadDATE_END: TDateTimeField;
    q_NariadDOVER_ID: TFloatField;
    q_NariadDATE_DOVER: TDateTimeField;
    q_NariadNUM_DOVER: TStringField;
    q_NariadPREDPR_ID: TIntegerField;
    q_NariadPREDPR_NAME: TStringField;
    q_NariadVES: TFloatField;
    cb_Dover: TCheckBox;
    lcbox_Dover: TDBLookupComboBox;
    q_ListDoverInNariad: TOracleDataSet;
    ds_ListDoverInNariad: TDataSource;
    ActionManager1: TActionManager;
    ac_NewNar: TAction;
    ac_ChangeNar: TAction;
    ac_DelNar: TAction;
    ac_SeekNar: TAction;
    ac_ChoosePeriodNar: TAction;
    ac_RefreshNar: TAction;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    tb_NewNar: TTBItem;
    tb_ChangeNar: TTBItem;
    tb_DelNar: TTBItem;
    tb_SeekNar: TTBItem;
    tb_ChoosePeriod: TTBItem;
    tb_Refresh: TTBItem;
    N7: TTBSeparatorItem;
    TBSeparatorItem1: TTBSeparatorItem;
    tb_Close: TTBItem;
    OracleNavigator1: TOracleNavigator;
    ac_NarToDbf: TAction;
    tb_NarToDbf: TTBItem;
    rg_Mesto: TRadioGroup;
    q_NariadMESTO_ID: TIntegerField;
    procedure grid_NariadSortMarkingChanged(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure grid_NariadDblClick(Sender: TObject);
    procedure cb_PokupClick(Sender: TObject);
    procedure lcbox_PokupCloseUp(Sender: TObject);
    procedure cb_DoverClick(Sender: TObject);
    procedure lcbox_DoverCloseUp(Sender: TObject);
    procedure ac_NewNarExecute(Sender: TObject);
    procedure ac_ChangeNarExecute(Sender: TObject);
    procedure ac_DelNarExecute(Sender: TObject);
    procedure ac_SeekNarExecute(Sender: TObject);
    procedure ac_ChoosePeriodNarExecute(Sender: TObject);
    procedure ac_RefreshNarExecute(Sender: TObject);
    procedure tb_CloseClick(Sender: TObject);
    procedure ac_NarToDbfExecute(Sender: TObject);
    procedure rg_MestoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Nariad: TF_Nariad;

implementation

uses AskPeriod, FindDov, EdDover, EdNariad, NarToDBF, ForDB;

{$R *.dfm}

procedure TF_Nariad.grid_NariadSortMarkingChanged(Sender: TObject);
begin
  f_db.SortInGrid(q_Nariad,14,grid_Nariad);
end;

procedure TF_Nariad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ac_NarToDbfExecute(Sender);
  Ora_session.LogOff;
  q_ListDover.Close;
  q_ListDover.SQL.Clear;
  q_ListPokupInDover.Close;
  q_ListPokupInDover.SQL.Clear;
  q_ListDoverInNariad.Close;
  q_ListDoverInNariad.SQL.Clear;
  q_Nariad.Close;
  q_Nariad.SQL.Clear;
  q_Tmp.Close;
  q_Tmp.SQL.Clear;
  Action:=caFree;
end;

procedure TF_Nariad.FormCreate(Sender: TObject);
begin
  f_db.SetUserGrants(ActionManager1);
  f_db.LogonMasterSession(ora_Session);
  q_ListDoverInNariad.Open;
  q_ListPokupInDover.Open;
  q_ListDover.Open;
  ac_ChoosePeriodNarExecute(Sender);
  rg_MestoClick(Sender);
end;

procedure TF_Nariad.grid_NariadDblClick(Sender: TObject);
begin
  IF ac_ChangeNar.Enabled then ac_ChangeNarExecute(Self);
end;

procedure TF_Nariad.cb_PokupClick(Sender: TObject);
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
    with q_Nariad do
    try
      DisableControls;
      Close;
      SQL[11]:=' AND 1 = 1 ';
      Open;
    finally
      EnableControls;
    End;
    with q_ListDoverInNariad do
    try
      DisableControls;
      Close;
      SQL[6]:=' AND 1 = 1 ';
      Open;
    finally
      EnableControls;
    End;
  End;
end;

procedure TF_Nariad.lcbox_PokupCloseUp(Sender: TObject);
begin
  with q_Nariad do
  try
    DisableControls;
    Close;
    try
      SQL[11]:=' AND (KLS_DOVER.PREDPR_ID='+IntToStr(lcbox_Pokup.KeyValue) + ')';
      Open;
    except
      SQL[11]:=' AND 1 = 1 ';
      Open;
    end;
  finally
    EnableControls;
  End;
  with q_ListDoverInNariad do
  try
    DisableControls;
    Close;
    try
      SQL[6]:=' AND (PREDPR_ID='+IntToStr(lcbox_Pokup.KeyValue) + ')';
      Open;
    except
      SQL[6]:=' AND 1 = 1 ';
      Open;
    end;
  finally
    EnableControls;
  End;
end;

procedure TF_Nariad.cb_DoverClick(Sender: TObject);
begin
  IF cb_Dover.Checked then
  Begin
    q_ListDoverInNariad.Close;
    q_ListDoverInNariad.Open;
  end;
  lcbox_Dover.Enabled:=cb_Dover.Checked;
  If lcbox_Dover.Enabled then
  Begin
    lcbox_Dover.SetFocus;
    lcbox_Dover.DropDown;
  end
  Else
  Begin
    with q_Nariad do
    try
      DisableControls;
      Close;
      SQL[12]:=' AND 1 = 1 ';
      Open;
    finally
      EnableControls;
    End;
  End;
end;

procedure TF_Nariad.lcbox_DoverCloseUp(Sender: TObject);
begin
  with q_Nariad do
  try
    DisableControls;
    Close;
    try
      SQL[12]:=' AND (KLS_NARIAD.DOVER_ID='+IntToStr(lcbox_Dover.KeyValue) + ')';
      Open;
    except
      SQL[12]:=' AND 1 = 1 ';
      Open;
    end;
  finally
    EnableControls;
  End;
end;

procedure TF_Nariad.ac_NewNarExecute(Sender: TObject);
var OldDover:integer;
    OldId:integer;
begin
  with TF_EdNariad.Create(Self) do
  Begin
    IF NOT q_Nariad.Eof Then OldDover:=q_Nariad.FieldByName('DOVER_ID').AsInteger
    Else OldDover:=1;
    q_Nariad.Insert;
    q_Nariad.FieldByName('mesto_id').AsInteger:=rg_Mesto.ItemIndex;
    OldId:=q_Nariad.FieldByName('ID').AsInteger;
    try
      If cb_Dover.Checked Then
        q_Nariad.FieldByName('DOVER_ID').AsInteger:=lcbox_Dover.KeyValue
      Else
        q_Nariad.FieldByName('DOVER_ID').AsInteger:=OldDover;
    except
    end;
    If ShowModal=mrOk then
    Begin
      f_db.ReQuery(q_Nariad,True);
      q_Nariad.Locate('ID',OldId,[]);
    End;
    Free;
  End;
end;

procedure TF_Nariad.ac_ChangeNarExecute(Sender: TObject);
begin
  with TF_EdNariad.Create(Self) do
  Begin
    q_Nariad.Edit;
    If ShowModal=mrOk then f_db.ReQuery(q_Nariad,True);
    Free;
  End;
end;

procedure TF_Nariad.ac_DelNarExecute(Sender: TObject);
begin
  If NOT q_Nariad.Eof Then
  If Application.MessageBox('Удалить наряд?','Внимание',MB_YESNO)=IDYES Then
  try
    q_Tmp.SQL.Clear;
    q_Tmp.SQL.Add('DELETE FROM KLS_NARIAD WHERE ID='+q_Nariad.FieldByName('ID').AsString);
    q_Tmp.ExecSQL;
    q_Tmp.SQL.Clear;
    q_Tmp.SQL.Add('COMMIT');
    q_Tmp.ExecSQL;
    q_Nariad.Next;
    IF q_Nariad.EOF Then q_Nariad.Prior;
  except
    on E: Exception do
    Begin
      IF Pos('NAR_LINE_NARIAD_FK) violated - child record found',E.Message)<>0 Then
        Application.MessageBox(PChar('Удалить наряд не удалось: Удалите сперва позиции наряда'),'Внимание',MB_OK)
      Else
        Application.MessageBox(PChar('Удалить наряд не удалось: '+#13#10+E.Message),'Внимание',MB_OK);
      q_Tmp.SQL.Clear;
      q_Tmp.SQL.Add('ROLLBACK');
      q_Tmp.ExecSQL;
    end;
  End;
  f_db.ReQuery(q_Nariad,True);
end;

procedure TF_Nariad.ac_SeekNarExecute(Sender: TObject);
var FindID:integer;
begin
  with TF_FindDov.Create(Self) do
  Begin
    ShowModal;
    If ModalResult=mrYes then
    with q_Nariad do
    Begin
      FindID:=0;

      {Дата доверенности}
      IF FindID=0 Then
      try
        If Locate('date_dover',StrToDate(SeekStr),[]) Then FindID:=1;
      except
        FindID:=0;
      end;

      {Дата наряда}
      IF FindID=0 Then
      try
        If Locate('date_nar',StrToDate(SeekStr),[]) Then FindID:=1;
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

      {№ наряда}
      IF FindID=0 Then
      try
        If Locate('num_nar',StrToInt(SeekStr),[]) Then FindID:=1;
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

procedure TF_Nariad.ac_ChoosePeriodNarExecute(Sender: TObject);
begin
  with TF_AskPeriod.Create(Self) do
  Begin
    FromDate:=NOW-ExtractDay(NOW)+1;
    ToDate:=NOW;
    ShowModal;
    IF ModalResult=mrOk Then
    Begin
      with q_Nariad do
      try
        DisableControls;
        Close;
        SQL[7]:='  AND ((KLS_NARIAD.DATE_NAR BETWEEN TO_DATE('''+
          IntToStr(ExtractDay(FromDate))+'.'+
          IntToStr(ExtractMonth(FromDate))+'.'+
          IntToStr(ExtractYear(FromDate))+''',''dd.mm.yyyy'') AND TO_DATE('''+
          IntToStr(ExtractDay(ToDate))+'.'+
          IntToStr(ExtractMonth(ToDate))+'.'+
          IntToStr(ExtractYear(ToDate))+''',''dd.mm.yyyy'')) OR ';
        SQL[8]:='      (KLS_NARIAD.DATE_END BETWEEN TO_DATE('''+
          IntToStr(ExtractDay(FromDate))+'.'+
          IntToStr(ExtractMonth(FromDate))+'.'+
          IntToStr(ExtractYear(FromDate))+''',''dd.mm.yyyy'') AND TO_DATE('''+
          IntToStr(ExtractDay(ToDate))+'.'+
          IntToStr(ExtractMonth(ToDate))+'.'+
          IntToStr(ExtractYear(ToDate))+''',''dd.mm.yyyy'')) OR ';
        SQL[9]:='      (TO_DATE('''+
          IntToStr(ExtractDay(FromDate))+'.'+
          IntToStr(ExtractMonth(FromDate))+'.'+
          IntToStr(ExtractYear(FromDate))+''',''dd.mm.yyyy'') BETWEEN KLS_NARIAD.DATE_NAR AND KLS_NARIAD.DATE_END) OR ';
        SQL[10]:='      (TO_DATE('''+
          IntToStr(ExtractDay(ToDate))+'.'+
          IntToStr(ExtractMonth(ToDate))+'.'+
          IntToStr(ExtractYear(ToDate))+''',''dd.mm.yyyy'') BETWEEN KLS_NARIAD.DATE_NAR AND KLS_NARIAD.DATE_END)) ';
        try
          Open;
        except
          SQL[7]:=' AND (1=1 OR ';
          SQL[8]:='      1=1 OR ';
          SQL[9]:='      1=1 OR ';
          SQL[10]:='     1=1) ';
          Open;
        end;
      finally
        EnableControls;
      End;
      with q_ListDoverInNariad do
      try
        DisableControls;
        Close;
        SQL[2]:='  ((DATE_DOVER BETWEEN TO_DATE('''+
          IntToStr(ExtractDay(FromDate))+'.'+
          IntToStr(ExtractMonth(FromDate))+'.'+
          IntToStr(ExtractYear(FromDate))+''',''dd.mm.yyyy'') AND TO_DATE('''+
          IntToStr(ExtractDay(ToDate))+'.'+
          IntToStr(ExtractMonth(ToDate))+'.'+
          IntToStr(ExtractYear(ToDate))+''',''dd.mm.yyyy'')) OR ';
        SQL[3]:='   (DATE_END BETWEEN TO_DATE('''+
          IntToStr(ExtractDay(FromDate))+'.'+
          IntToStr(ExtractMonth(FromDate))+'.'+
          IntToStr(ExtractYear(FromDate))+''',''dd.mm.yyyy'') AND TO_DATE('''+
          IntToStr(ExtractDay(ToDate))+'.'+
          IntToStr(ExtractMonth(ToDate))+'.'+
          IntToStr(ExtractYear(ToDate))+''',''dd.mm.yyyy'')) OR ';
        SQL[4]:='   (TO_DATE('''+
          IntToStr(ExtractDay(FromDate))+'.'+
          IntToStr(ExtractMonth(FromDate))+'.'+
          IntToStr(ExtractYear(FromDate))+''',''dd.mm.yyyy'') BETWEEN DATE_DOVER AND DATE_END) OR ';
        SQL[5]:='   (TO_DATE('''+
          IntToStr(ExtractDay(ToDate))+'.'+
          IntToStr(ExtractMonth(ToDate))+'.'+
          IntToStr(ExtractYear(ToDate))+''',''dd.mm.yyyy'') BETWEEN DATE_DOVER AND DATE_END)) ';
        try
          Open;
        except
          SQL[2]:=' (1=1 OR ';
          SQL[3]:='  1=1 OR ';
          SQL[4]:='  1=1 OR ';
          SQL[5]:='  1=1 OR) ';
          Open;
        end;
      finally
        EnableControls;
      End;
    end;
    Free;
  end;
end;

procedure TF_Nariad.ac_RefreshNarExecute(Sender: TObject);
begin
  f_db.ReQuery(q_Nariad,True);
end;

procedure TF_Nariad.tb_CloseClick(Sender: TObject);
begin
  close;
end;

procedure TF_Nariad.ac_NarToDbfExecute(Sender: TObject);
begin
  inherited;
  with TF_NarToDbf.Create(Self) do
  Begin
    ShowModal;
    Free;
  End;
end;

procedure TF_Nariad.rg_MestoClick(Sender: TObject);
begin
  inherited;
  with q_Nariad do
  try
    DisableControls;
    Close;
    try
      SQL[13]:=' AND (KLS_NARIAD.MESTO_ID='+IntToStr(rg_Mesto.ItemIndex) + ')';
      Open;
    except
      SQL[13]:=' AND KLS_NARIAD.MESTO_ID = 0';
      Open;
    end;
  finally
    EnableControls;
  End;
end;

end.
