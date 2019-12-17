unit INF2PBAL;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGridEh, OracleData, Oracle,
  StdCtrls, RXSpin, Menus, Placemnt, ComCtrls,
  PrnDbgeh, ToolWin, ActnMan, ActnCtrls, ExtCtrls, ActnList,MDIForm,
  Buttons, TB2Item, TB2Dock, TB2Toolbar,DBGridEhImpExp, Mask, DBCtrls,
  OracleNavigator, ADODB, variants, DBGrids, XPStyleActnCtrls;

type
  Tf_Inf2Pbal = class(Tf_MDIForm)
    ora_Session: TOracleSession;
    q_Inf2PB_accounts: TOracleDataSet;
    DBGridEh1: TDBGridEh;
    ds_Inf2PB_accounts: TDataSource;
    pm_Grid: TPopupMenu;
    F41_OLD_OLD_OLD: TMenuItem;
    N2_OLD_OLD_OLD: TMenuItem;
    FormStorage1: TFormStorage;
    ActionManager1: TActionManager;
    ac_Inf2PBNewProv: TAction;
    ac_Inf2PBDelProv: TAction;
    Panel1: TPanel;
    q_Inf2PB_sch: TOracleDataSet;
    q_Inf2PB_accountsID: TFloatField;
    q_Inf2PB_accountsINF2PB_SCH_ID: TFloatField;
    q_Inf2PB_accountsCONT_ID: TStringField;
    q_Inf2PB_accountsRAS_ID: TStringField;
    q_Inf2PB_schID: TFloatField;
    q_Inf2PB_schSCH: TStringField;
    q_Inf2PB_schCONT_AN: TIntegerField;
    q_Inf2PB_schRAS_AN: TIntegerField;
    ds_Inf2PB_sch: TDataSource;
    cnn_Infin: TADOConnection;
    q_Kls_ch: TADOQuery;
    q_kls_cont: TADOQuery;
    q_kls_ras: TADOQuery;
    q_kls_contn_kls: TStringField;
    q_kls_contnaim_kls: TStringField;
    q_kls_rasn_kls: TStringField;
    q_kls_rasnaim_kls: TStringField;
    q_Kls_chan1: TIntegerField;
    q_Kls_chan2: TIntegerField;
    q_Kls_chan3: TIntegerField;
    q_Kls_chan4: TIntegerField;
    q_Kls_chan5: TIntegerField;
    ds_kls_cont: TDataSource;
    ds_kls_ras: TDataSource;
    q_Inf2PB_accountsContName: TStringField;
    q_Inf2PB_accountsRasName: TStringField;
    pbal_Session: TOracleSession;
    q_Inf2PB_accountsAccName: TStringField;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    F41_OLD: TTBItem;
    N2_OLD: TTBItem;
    q_Accounts: TOracleDataSet;
    q_seek_sch: TOracleDataSet;
    q_append_acc: TOracleDataSet;
    nav_acc: TOracleNavigator;
    q_Inf2PB_accountsPROMIS: TStringField;
    q_Inf2PB_accountsSTATUS: TStringField;
    q_Inf2PB_accountsPAY_TYPE: TStringField;
    q_Inf2PB_accountsDEB: TStringField;
    q_Inf2PB_accountsKRED: TStringField;
    Panel2: TPanel;
    Label5: TLabel;
    seek_sch: TMaskEdit;
    nav_sch: TOracleNavigator;
    Label1: TLabel;
    ed_sch: TDBEdit;
    ac_Inf2PBDelSch: TAction;
    N1_OLD: TMenuItem;
    N1: TTBItem;
    q_Kls_chch_naim: TStringField;
    q_Inf2PB_schSCH_NAME: TStringField;
    ed_sch_name: TDBEdit;
    q_analize: TADOQuery;
    DataSource1: TDataSource;
    bt_Analize: TButton;
    ed_mon: TMaskEdit;
    ud_mon: TUpDown;
    ed_year: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    ud_year: TUpDown;
    bt_DelAll: TButton;
    ac_Inf2PBDelAll: TAction;
    ac_Inf2PBAnalize: TAction;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    ac_Inf2PBToDBF: TAction;
    N2: TMenuItem;
    N3: TMenuItem;
    DBF1: TMenuItem;
    TBItem3: TTBItem;
    q_Inf2PB_schDOG_AN: TIntegerField;
    q_Inf2PB_schNUM_AN: TIntegerField;
    q_Inf2PB_schPAYOFF_AN: TIntegerField;
    GroupBox1: TGroupBox;
    rg_cont: TDBRadioGroup;
    rg_ras: TDBRadioGroup;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    DBRadioGroup3: TDBRadioGroup;
    GroupBox2: TGroupBox;
    lcbox_Cont: TDBLookupComboBox;
    cb_Cont: TCheckBox;
    cb_Ras: TCheckBox;
    lcbox_Ras: TDBLookupComboBox;
    Label10: TLabel;
    Label11: TLabel;
    ed_deb: TEdit;
    ed_kred: TEdit;
    q_Inf2PB_accountsACC_CODE: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ac_Inf2PBNewProvExecute(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure ac_Inf2PBDelProvExecute(Sender: TObject);
    procedure DBGridEh1SortMarkingChanged(Sender: TObject);
    procedure q_Inf2PB_schAfterScroll(DataSet: TDataSet);
    procedure lcbox_ContCloseUp(Sender: TObject);
    procedure cb_ContClick(Sender: TObject);
    procedure cb_RasClick(Sender: TObject);
    procedure lcbox_RasCloseUp(Sender: TObject);
    procedure seek_schKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure q_Inf2PB_schBeforeScroll(DataSet: TDataSet);
    procedure q_Inf2PB_schBeforeClose(DataSet: TDataSet);
    procedure q_Inf2PB_accountsAfterPost(DataSet: TDataSet);
    procedure q_Inf2PB_accountsAfterDelete(DataSet: TDataSet);
    procedure ac_Inf2PBDelSchExecute(Sender: TObject);
    procedure q_Inf2PB_accountsBeforeInsert(DataSet: TDataSet);
    procedure q_Inf2PB_schBeforeDelete(DataSet: TDataSet);
    procedure q_Inf2PB_schAfterDelete(DataSet: TDataSet);
    procedure q_Inf2PB_schDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure q_Inf2PB_accountsBeforeDelete(DataSet: TDataSet);
    procedure q_Inf2PB_accountsDeleteError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure q_Inf2PB_schAfterPost(DataSet: TDataSet);
    procedure ac_Inf2PBAnalizeExecute(Sender: TObject);
    procedure ac_Inf2PBDelAllExecute(Sender: TObject);
    procedure ac_Inf2PBToDBFExecute(Sender: TObject);
    procedure ed_debKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_kredKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    InfinDBFPath,InfinMonPath:string;
  end;

var
  f_Inf2Pbal: Tf_Inf2Pbal;

implementation
uses ForDB, ORATODBF, Math,DateUtil, main;
{$R *.DFM}

function CopyInfinDBF(FromFile,ToFile:string):boolean;
var
  iFileHandle: Integer;
  Buf:char;
begin
  Result:=false;
  DeleteFile(ToFile);
  CopyFile(PChar(FromFile),PChar(ToFile),false);

  iFileHandle := FileOpen(ToFile, fmOpenReadWrite);
  if iFileHandle=-1 then exit;
  if FileSeek(iFileHandle,29,0)=-1 then begin FileClose(iFileHandle);exit; end;
  Buf:=CHR(101);
  if FileWrite(iFileHandle,Buf,1)=-1 then begin FileClose(iFileHandle);exit; end;
  FileClose(iFileHandle);
  If NOT FileExists(ToFile) then exit;
  Result:=true;
end;

procedure Tf_Inf2Pbal.FormCreate(Sender: TObject);
var yy,mm:integer;
    mm_str:string;
begin
  ora_Session.LogonUsername:=f_main.ora_Session.LogonUsername;
  ora_Session.LogonPassword:=f_main.ora_Session.LogonPassword;
  ora_Session.LogonDataBase:=f_main.ora_Session.LogonDataBase;
  Ora_session.LogOn;
  Pbal_session.LogOn;
  f_db.SetUserGrants(ActionManager1);
  cnn_Infin.Open;
  yy:=ExtractYear(Now-51);
  mm:=ExtractMonth(Now-51);
  ud_mon.Position:=mm;
  ud_year.Position:=yy;
  repeat
    IF NOT DirectoryExists(f_main.GetApplVari('InfinPath')+'G'+IntToStr(yy)) Then yy:=yy-1
    Else break;
  until yy<=1990;
  repeat
    if mm<10 then mm_str:='0'+IntToStr(mm) else mm_str:=IntToStr(mm);
    IF NOT DirectoryExists(f_main.GetApplVari('InfinPath')+'G'+IntToStr(yy)+'\M'+mm_str) Then mm:=mm-1
    Else break;
  until mm<=0;
  InfinDBFPath:=f_main.GetApplVari('InfinPath')+'G'+IntToStr(yy)+'\DBF\';
  if mm<10 then mm_str:='0'+IntToStr(mm) else mm_str:=IntToStr(mm);
  InfinMonPath:=f_main.GetApplVari('InfinPath')+'G'+IntToStr(yy)+'\M'+mm_str+'\';
  CopyInfinDBF(InfinMonPath+'kls_ch.dbf',f_main.TempNetPath+'kls_ch.dbf');
  q_INF2PB_sch.Open;
  q_Inf2PB_accounts.Open;
end;

procedure Tf_Inf2Pbal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  q_INF2PB_sch.Close;
  q_INF2PB_Accounts.Close;
  Ora_session.LogOff;
  PBal_session.LogOff;
  cnn_Infin.Close;
  Action:=caFree;
end;

procedure Tf_Inf2Pbal.ac_Inf2PBNewProvExecute(Sender: TObject);
var s:string;
    Cont_Id,Ras_Id,Promis,Pay_Type,acc_code,deb,kred:string;
begin
  if q_Inf2PB_accounts.State<>dsBrowse then q_Inf2PB_accounts.Post;
  If NOT q_Inf2PB_accounts.Eof then
  Begin
    Cont_id:=Trim(q_Inf2PB_accounts.FieldByName('cont_id').AsString);
    Ras_id:=Trim(q_Inf2PB_accounts.FieldByName('ras_id').AsString);
    promis:=Trim(q_Inf2PB_accounts.FieldByName('promis').AsString);
    pay_type:=Trim(q_Inf2PB_accounts.FieldByName('pay_type').AsString);
{    deb:=Trim(q_Inf2PB_accounts.FieldByName('deb').AsString);
    kred:=Trim(q_Inf2PB_accounts.FieldByName('kred').AsString);}
    acc_code:=Trim(q_Inf2PB_accounts.FieldByName('acc_code').AsString);
  end
  else
  Begin
    IF cb_Cont.Checked then Cont_id:=Trim(lcbox_Cont.KeyValue)
    Else Cont_id:=' ';
    IF cb_Ras.Checked then Ras_id:=Trim(lcbox_Ras.KeyValue)
    Else Ras_id:=' ';
    promis:='0';
    pay_type:='11';
{    deb:=q_inf2pb_sch.fieldByName('sch').asString;
    kred:=q_inf2pb_sch.fieldByName('sch').asString;}
    acc_code:=' ';
  end;
  If Trim(Cont_id)='' then cont_id:=' ';
  If Trim(ras_id)='' then ras_id:=' ';
  If Trim(promis)='' then promis:='0';
  If Trim(pay_type)='' then pay_type:='11';
  if Trim(deb)='' then deb:=' ';
  if Trim(kred)='' then kred:=' ';
  if Trim(acc_code)='' then acc_code:=' ';

  with q_append_acc do
  try
    Close;
    SQL.CLear;
    s:='INSERT INTO inf2pb_accounts (INF2PB_SCH_ID,CONT_ID,RAS_ID,deb,kred,PROMIS,PAY_TYPE,acc_code,STATUS) '+
    ' VALUES ('+q_Inf2PB_sch.FieldByName('id').AsString+','''+Cont_Id+''','''+Ras_Id+''',''' +
    deb+''','''+kred+''','''+Promis+''','''+Pay_type+''','''+acc_code+''',''0'')';
    SQL.Add(s);
    ExecSQL;
    Close;
    SQL.CLear;
    s:='COMMIT';
    SQL.Add(s);
    ExecSQL;
  except
    ShowMessage('Проводку не удалось добавить - скорее всего она уже существует!');
    Close;
  End;
  q_Inf2PB_accounts.Close;
  q_Inf2PB_accounts.Open;
  q_Inf2PB_accounts.Locate('INF2PB_SCH_ID;CONT_ID;RAS_ID;deb;kred',
    VarArrayOf([q_Inf2PB_sch.FieldByName('id').AsString,Cont_Id,Ras_ID,deb,kred]),[]);
end;

procedure Tf_Inf2Pbal.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if q_Inf2PB_accounts.RecNo mod 2=0 then
    Background:=clInfoBk;
  if gdSelected in State then
    Background:=clNavy;
end;

procedure Tf_Inf2Pbal.ac_Inf2PBDelProvExecute(Sender: TObject);
begin
  q_Inf2PB_accounts.Delete;
end;

procedure Tf_Inf2Pbal.DBGridEh1SortMarkingChanged(Sender: TObject);
begin
{  f_main.SortInGrid(q_Inf2PB_accounts,6,DBGridEh1);}
end;

procedure Tf_Inf2Pbal.q_Inf2PB_schAfterScroll(DataSet: TDataSet);
var s:string;
    OldState:boolean;
begin
  inherited;
  If (q_inf2PB_sch.State<>dsBrowse) and (q_inf2PB_sch.State<>dsEdit) then exit;
  q_Kls_ch.Close;
  q_Kls_cont.Close;
  q_Kls_ras.Close;

  with q_Kls_ch do
  begin
    SQL[1]:='FROM '''+f_main.TempNetPath+'kls_ch.dbf''';
    SQL[2]:='WHERE chet='''+q_INF2PB_sch.FieldByName('sch').AsString+'''';
    Open;
  end;
  if q_Inf2PB_sch.FieldByName('sch_name').AsString<>VarToStr(q_kls_ch.FieldValues['ch_naim']) then
  Begin
    OldState:=(q_inf2PB_sch.State=dsBrowse);
    If OldState then q_inf2PB_sch.Edit;
    q_Inf2PB_sch.FieldByName('sch_name').AsString:=VarToStr(q_kls_ch.FieldValues['ch_naim']);
    If OldState then q_inf2PB_sch.Post;
  End;
  If q_Inf2PB_sch.FieldByName('cont_an').AsString<>'0' Then
  Begin
    s:='kls_'+VarToStr(q_kls_ch.FieldValues['an'+q_Inf2PB_sch.FieldByName('cont_an').AsString])+'.dbf';
    CopyInfinDBF(InfinDBFPath+s,f_main.TempNetPath+s);
    with q_Kls_cont do
    begin
      SQL[1]:='FROM '''+f_main.TempNetPath+s+'''';
      Open;
    end;
  end;
  If q_Inf2PB_sch.FieldByName('ras_an').AsString<>'0' Then
  Begin
    s:='kls_'+VarToStr(q_kls_ch.FieldValues['an'+q_Inf2PB_sch.FieldByName('ras_an').AsString])+'.dbf';
    CopyInfinDBF(InfinDBFPath+s,f_main.TempNetPath+s);
    with q_Kls_ras do
    begin
      SQL[1]:='FROM '''+f_main.TempNetPath+s+'''';
      Open;
    end;
  end;
  q_Inf2PB_accounts.Close;
  q_Inf2PB_accounts.Open;

end;

procedure Tf_Inf2Pbal.lcbox_ContCloseUp(Sender: TObject);
begin
  inherited;
  with q_Inf2PB_Accounts do
  try
    DisableControls;
    Close;
    try
      SQL[4]:=' AND Trim(CONT_ID) || '' ''='''+Trim(lcbox_Cont.KeyValue)+''' || '' ''';
      Open;
    except
      SQL[4]:=' AND 1=1 ';
      Open;
    end;
  finally
    EnableControls;
  End;
end;

procedure Tf_Inf2Pbal.cb_ContClick(Sender: TObject);
begin
  inherited;
  IF cb_Cont.Checked then
  Begin
    q_Kls_cont.Close;
    q_Kls_cont.Open;
  end;
  lcbox_Cont.Enabled:=cb_Cont.Checked;
  If lcbox_Cont.Enabled then
  Begin
    lcbox_Cont.SetFocus;
    lcbox_Cont.DropDown;
  end
  Else
  Begin
    with q_Inf2PB_accounts do
    try
      DisableControls;
      Close;
      SQL[4]:=' AND 1=1 ';
      Open;
    finally
      EnableControls;
    End;
  End;
end;

procedure Tf_Inf2Pbal.cb_RasClick(Sender: TObject);
begin
  inherited;
  IF cb_Ras.Checked then
  Begin
    q_Kls_ras.Close;
    q_Kls_ras.Open;
  end;
  lcbox_Ras.Enabled:=cb_Ras.Checked;
  If lcbox_Ras.Enabled then
  Begin
    lcbox_Ras.SetFocus;
    lcbox_Ras.DropDown;
  end
  Else
  Begin
    with q_Inf2PB_accounts do
    try
      DisableControls;
      Close;
      SQL[5]:=' AND 1=1 ';
      Open;
    finally
      EnableControls;
    End;
  End;
end;

procedure Tf_Inf2Pbal.lcbox_RasCloseUp(Sender: TObject);
begin
  inherited;
  with q_Inf2PB_Accounts do
  try
    DisableControls;
    Close;
    try
      SQL[5]:=' AND Trim(RAS_ID) || '' ''='''+Trim(lcbox_ras.KeyValue)+''' || '' ''';
      Open;
    except
      SQL[5]:=' AND 1=1 ';
      Open;
    end;
  finally
    EnableControls;
  End;

end;

procedure Tf_Inf2Pbal.seek_schKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var IsFound:boolean;
begin
  inherited;
  If Key=VK_RETURN then
  Begin
    IF seek_sch.Text='' then exit;
    IsFound:=false;
    q_seek_sch.Close;
    q_seek_sch.open;
    if NOT q_seek_sch.locate('SCH',seek_sch.Text,[]) then
    Begin
      if MessageDlg('Счет '+seek_sch.Text+' не найден. Добавить?',mtConfirmation,[mbYes, mbNo],0)=mrYes then
      try
        q_INF2PB_sch.Append;
        q_INF2PB_sch.FieldByName('SCH').AsString:=seek_sch.Text;
        q_INF2PB_sch.FieldByName('CONT_AN').AsInteger:=1;
        q_INF2PB_sch.FieldByName('RAS_AN').AsInteger:=2;
        q_INF2PB_sch.FieldByName('DOG_AN').AsInteger:=3;
        q_INF2PB_sch.FieldByName('NUM_AN').AsInteger:=4;
        q_INF2PB_sch.FieldByName('PAYOFF_AN').AsInteger:=5;
        q_INF2PB_sch.Post;
        ora_Session.ApplyUpdates([q_INF2PB_sch], False);
        ora_Session.CommitUpdates([q_INF2PB_sch]);
        ShowMessage('Счет успешно добавлен!');
        IsFound:=true;
      except
        q_INF2PB_sch.Cancel;
        ora_Session.CancelUpdates([q_INF2PB_sch]);
        ShowMessage('Счет НЕ добавлен из-за внутренней ошибки!');
      End;
    End
    Else IsFound:=true;
    q_seek_sch.Close;

    If IsFound then
    begin
      q_Inf2PB_sch.Locate('sch',seek_sch.Text,[]);
    end;

    seek_sch.Text:='';
  end;
end;

procedure Tf_Inf2Pbal.q_Inf2PB_schBeforeScroll(DataSet: TDataSet);
begin
  inherited;
  try
    ora_Session.ApplyUpdates([q_INF2PB_accounts], False);
    ora_Session.CommitUpdates([q_INF2PB_accounts]);
  except
    ora_Session.CancelUpdates([q_INF2PB_accounts]);
  End;
end;

procedure Tf_Inf2Pbal.q_Inf2PB_schBeforeClose(DataSet: TDataSet);
begin
  inherited;
  try
    ora_Session.ApplyUpdates([q_INF2PB_sch], False);
    ora_Session.CommitUpdates([q_INF2PB_sch]);
  except
    ora_Session.CancelUpdates([q_INF2PB_sch]);
  End;
end;

procedure Tf_Inf2Pbal.q_Inf2PB_accountsAfterPost(DataSet: TDataSet);
begin
  inherited;
  try
    ora_Session.ApplyUpdates([q_INF2PB_accounts], False);
    ora_Session.CommitUpdates([q_INF2PB_accounts]);
  except
    ora_Session.CancelUpdates([q_INF2PB_accounts]);
  End;
end;

procedure Tf_Inf2Pbal.q_Inf2PB_accountsAfterDelete(DataSet: TDataSet);
begin
  inherited;
  try
    ora_Session.ApplyUpdates([q_INF2PB_accounts], False);
    ora_Session.CommitUpdates([q_INF2PB_accounts]);
  except
    ora_Session.CancelUpdates([q_INF2PB_accounts]);
    ShowMessage('Проводка НЕ удалена из-за внутренней ошибки!');
  End;
end;

procedure Tf_Inf2Pbal.ac_Inf2PBDelSchExecute(Sender: TObject);
begin
  inherited;
  q_INF2PB_sch.Delete;
end;

procedure Tf_Inf2Pbal.q_Inf2PB_accountsBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  ac_Inf2PBNewProvExecute(Self);
  Abort;
end;

procedure Tf_Inf2Pbal.q_Inf2PB_schBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if q_Inf2PB_accounts.State<>dsBrowse then q_Inf2PB_accounts.Post;
  if q_Inf2PB_sch.State<>dsBrowse then q_Inf2PB_sch.Post;
  if MessageDlg('Вы действительно хотите удалить счет?',mtConfirmation,[mbYes, mbNo],0)=mrNo then Abort;
end;

procedure Tf_Inf2Pbal.q_Inf2PB_schAfterDelete(DataSet: TDataSet);
begin
  inherited;
  try
    ora_Session.ApplyUpdates([q_INF2PB_sch], False);
    ora_Session.CommitUpdates([q_INF2PB_sch]);
  except
    ora_Session.CancelUpdates([q_INF2PB_sch]);
    ShowMessage('Счет НЕ удален из-за внутренней ошибки!');
  End;
end;

procedure Tf_Inf2Pbal.q_Inf2PB_schDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  ShowMessage('Счет НЕ удален из-за внутренней ошибки!');
  Action:=daAbort;
end;

procedure Tf_Inf2Pbal.q_Inf2PB_accountsBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if q_Inf2PB_accounts.State<>dsBrowse then q_Inf2PB_accounts.Post;
  if MessageDlg('Вы действительно хотите удалить проводку?',mtConfirmation,[mbYes, mbNo],0)=mrNo then Abort;
end;

procedure Tf_Inf2Pbal.q_Inf2PB_accountsDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  ShowMessage('Проводка НЕ удалена из-за внутренней ошибки!');
  Action:=daAbort;
end;

procedure Tf_Inf2Pbal.q_Inf2PB_schAfterPost(DataSet: TDataSet);
begin
  inherited;
  try
    ora_Session.ApplyUpdates([q_INF2PB_sch], False);
    ora_Session.CommitUpdates([q_INF2PB_sch]);
  except
    ora_Session.CancelUpdates([q_INF2PB_sch]);
  End;
  q_Inf2PB_schAfterScroll(DataSet);
end;

procedure Tf_Inf2Pbal.ac_Inf2PBAnalizeExecute(Sender: TObject);
Var Sch:string;
    s,promis,pay_type,deb,kred,sch_id,cont_an,ras_an,cont_id,ras_id:string;
    mm_str,InfinDbfPath,InfinMonPath:string;
begin
  inherited;
  If (q_inf2PB_sch.State<>dsBrowse) then q_inf2PB_sch.Post;
  If (q_inf2PB_accounts.State<>dsBrowse) then q_inf2PB_accounts.Post;
  Sch:=Trim(q_Inf2PB_sch.FieldByName('sch').AsString);
  Sch_id:=Trim(q_Inf2PB_sch.FieldByName('id').AsString);
  Cont_an:=Trim(q_Inf2PB_sch.FieldByName('cont_an').AsString);
  Ras_an:=Trim(q_Inf2PB_sch.FieldByName('ras_an').AsString);


  if ud_mon.Position<10 then mm_str:='0'+IntToStr(ud_mon.Position) else mm_str:=IntToStr(ud_mon.Position);
  InfinMonPath:=f_main.GetApplVari('InfinPath')+'G'+IntToStr(ud_year.Position)+'\M'+mm_str+'\';
  InfinDbfPath:=f_main.GetApplVari('InfinPath')+'G'+IntToStr(ud_year.Position)+'\DBF\';

  If NOT FileExists(InfinMonPath+'s'+Sch+'.dbf') then
  Begin
    ShowMessage('Файла проводок по этому счету за выбранный период не существует!');
    exit;
  End;

  CopyInfinDBF(InfinMonPath+'s'+Sch+'.dbf',f_main.TempNetPath+'s'+Sch+'.dbf');
  with q_analize do
  begin
    Close;
    SQL[5]:='FROM '''+f_main.TempNetPath+'s'+Sch+'.dbf'' schet, '''+
            f_main.TempNetPath+'kls_'+VarToStr(q_kls_ch.FieldValues['an'+cont_an])+'.dbf'' kls_cont, '''+
            f_main.TempNetPath+'kls_'+VarToStr(q_kls_ch.FieldValues['an'+ras_an])+'.dbf'' kls_ras ';
    SQL[7]:=' AND schet.an'+cont_an+'=kls_cont.rec';
    SQL[9]:=' AND schet.an'+ras_an+'=kls_ras.rec';
    if cb_Cont.Checked then
      SQL[8]:=' AND ALLT(kls_cont.n_kls)='''+VarToStr(lcbox_Cont.KeyValue)+''''
    Else
      SQL[8]:=' AND 1=1';
    if cb_Ras.Checked then
      SQL[10]:=' AND ALLT(kls_ras.n_kls)='''+VarToStr(lcbox_Ras.KeyValue)+''''
    Else
      SQL[10]:=' AND 1=1';
    if Trim(ed_deb.Text)<>'' then
      SQL[11]:=' AND ((schet.dt_kt AND '''+Sch+'''='''+Trim(ed_deb.Text)+''') OR (NOT schet.dt_kt AND schet.korr='''+Trim(ed_deb.Text)+'''))'
    Else
      SQL[11]:=' AND 1=1';
    if Trim(ed_kred.Text)<>'' then
      SQL[12]:=' AND ((NOT schet.dt_kt AND '''+Sch+'''='''+Trim(ed_kred.Text)+''') OR (schet.dt_kt AND schet.korr='''+Trim(ed_kred.Text)+'''))'
    Else
      SQL[12]:=' AND 1=1';
    s:=SQL.Text;
    Open;
    First;
    while not Eof do
    Begin
      if FieldByName('dt_kt').AsBoolean then
      Begin
        deb:=Sch;
        kred:=Trim(FieldByName('korr').AsString);
        promis:='0';
        pay_type:='11';
      end
      Else
      Begin
        deb:=Trim(FieldByName('korr').AsString);
        kred:=Sch;
        promis:='1';
        pay_type:='1';
      end;
      cont_id:=Trim(FieldByName('cont_id').AsString);
      ras_id:=Trim(FieldByName('ras_id').AsString);
      If Trim(Cont_id)='' then cont_id:=' ';
      If Trim(ras_id)='' then ras_id:=' ';
      if Trim(deb)='' then deb:=' ';
      if Trim(kred)='' then kred:=' ';

      if NOT q_Inf2PB_accounts.Locate('cont_id;ras_id;deb;kred',VarArrayOf([cont_id,ras_id,deb,kred]),[]) then
      Begin
        with q_append_acc do
        try
          Close;
          SQL.CLear;
          s:='INSERT INTO inf2pb_accounts (INF2PB_SCH_ID,CONT_ID,RAS_ID,deb,kred,PROMIS,PAY_TYPE,acc_code,STATUS) '+
             ' VALUES ('+sch_id+','''+cont_id+''','''+Ras_Id+''',''' +
                         deb+''','''+kred+''','''+Promis+''','''+Pay_type+''','' '',''0'')';
          SQL.Add(s);
          ExecSQL;
          Close;
          SQL.CLear;
          s:='COMMIT';
          SQL.Add(s);
          ExecSQL;
        except
          Close;
        End;
      End;

(*      { Добавляем сальдо }
      If (deb<>' ') and (kred<>sch) then
      if NOT q_Inf2PB_accounts.Locate('cont_id;ras_id;deb;kred',VarArrayOf([cont_id,ras_id,' ',sch]),[]) then
      Begin
        with q_append_acc do
        try
          Close;
          SQL.CLear;
          s:='INSERT INTO inf2pb_accounts (INF2PB_SCH_ID,CONT_ID,RAS_ID,deb,kred,PROMIS,PAY_TYPE,acc_code,STATUS) '+
             ' VALUES ('+sch_id+','''+cont_id+''','''+ras_id+''','''+
                         ' '','''+sch+''',''1'',''1'','' '',''0'')';
          SQL.Add(s);
          ExecSQL;
          Close;
          SQL.CLear;
          s:='COMMIT';
          SQL.Add(s);
          ExecSQL;
        except
          Close;
        End;
      End;

      If (deb<>sch) and (kred<>' ') then
      if NOT q_Inf2PB_accounts.Locate('cont_id;ras_id;deb;kred',VarArrayOf([cont_id,ras_id,sch,' ']),[]) then
      Begin
        with q_append_acc do
        try
          Close;
          SQL.CLear;
          s:='INSERT INTO inf2pb_accounts (INF2PB_SCH_ID,CONT_ID,RAS_ID,deb,kred,PROMIS,PAY_TYPE,acc_code,STATUS) '+
             ' VALUES ('+sch_id+','''+cont_id+''','''+Ras_Id+''',''' +
                         sch+''','' '',''0'',''11'','' '',''0'')';
          SQL.Add(s);
          ExecSQL;
          Close;
          SQL.CLear;
          s:='COMMIT';
          SQL.Add(s);
          ExecSQL;
        except
          Close;
        End;
      End;*)

      Next;
    End;
    Close;
  end;
  q_Inf2PB_accounts.Close;
  q_Inf2PB_accounts.Open;
end;

procedure Tf_Inf2Pbal.ac_Inf2PBDelAllExecute(Sender: TObject);
begin
  inherited;
  if MessageDlg('Вы действительно хотите удалить все ТЕКУЩИЕ проводки по счету?',mtConfirmation,[mbYes, mbNo],0)=mrYes then
  with q_Inf2PB_accounts do
  Begin
    First;
    while not eof do
    begin
      try
        Delete;
      except
      end;
    end;
  end;
end;

procedure Tf_Inf2Pbal.ac_Inf2PBToDBFExecute(Sender: TObject);
begin
  inherited;
  with tf_ORAToDBF.Create(Self) do
  begin
    DBFtoORAid:='RASH_SCH';
    DontAsk:=True;
    ShowModal;
  end;
  with tf_ORAToDBF.Create(Self) do
  begin
    DBFtoORAid:='RASH_ACC';
    DontAsk:=True;
    ShowModal;
  end;
end;

procedure Tf_Inf2Pbal.ed_debKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key=VK_RETURN then
  Begin
    with q_Inf2PB_Accounts do
    try
      DisableControls;
      Close;
      try
        If Trim(ed_deb.Text)<>'' Then
          SQL[6]:=' AND Trim(DEB) || '' ''='''+Trim(ed_deb.Text)+''' || '' '''
        Else
          SQL[6]:=' AND 1=1';
        Open;
      except
        SQL[6]:=' AND 1=1 ';
        Open;
      end;
    finally
      EnableControls;
    End;
  end;
end;

procedure Tf_Inf2Pbal.ed_kredKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key=VK_RETURN then
  Begin
    with q_Inf2PB_Accounts do
    try
      DisableControls;
      Close;
      try
        If Trim(ed_kred.Text)<>'' Then
          SQL[7]:=' AND Trim(KRED) || '' ''='''+Trim(ed_kred.Text)+''' || '' '''
        Else
          SQL[7]:=' AND 1=1';
        Open;
      except
        SQL[7]:=' AND 1=1 ';
        Open;
      end;
    finally
      EnableControls;
    End;
  end;
end;

end.

