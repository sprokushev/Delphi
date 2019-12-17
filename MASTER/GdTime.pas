unit GdTime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MdiForm, DB, ADODB, Grids, DBGridEh, ComCtrls, StdCtrls,
  RXCtrls, DBCtrls, ExtCtrls, XPStyleActnCtrls, ActnList, ActnMan, TB2Item,
  TB2Dock, TB2Toolbar,DateUtils;

type
  Tf_GdTime = class(Tf_MDIForm)
    TBDock1: TTBDock;
    TBToolbar2: TTBToolbar;
    ActionManager2: TActionManager;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    RxSpeedButton1: TRxSpeedButton;
    Label3: TLabel;
    ed_BeginDate: TDateTimePicker;
    Label4: TLabel;
    ed_EndDate: TDateTimePicker;
    Panel2: TPanel;
    gridPost: TDBGridEh;
    ado_Session: TADOConnection;
    q_GdTime: TADOQuery;
    ds_GdTime: TDataSource;
    q_GdTimenum_otgr: TStringField;
    q_GdTimedate_otgr: TDateField;
    q_GdTimenp_data_o: TDateField;
    q_GdTimenp_timep: TStringField;
    q_GdTimename: TStringField;
    acAddGgTime: TAction;
    acChangeGdTime: TAction;
    acDelGdTime: TAction;
    q_cmn: TADOQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    DateField1: TDateField;
    DateField2: TDateField;
    StringField3: TStringField;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    acRefreshGdTime: TAction;
    q_GdTimemesto: TIntegerField;
    procedure acAddGgTimeExecute(Sender: TObject);
    procedure acChangeGdTimeExecute(Sender: TObject);
    procedure acDelGdTimeExecute(Sender: TObject);
    procedure acRefreshGdTimeExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure q_GdTimeBeforeOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_GdTime: Tf_GdTime;

implementation

uses AddGdTime, ForDB;

{$R *.dfm}

procedure Tf_GdTime.acAddGgTimeExecute(Sender: TObject);
begin
  inherited;
  AddGdTime.OperKind:='ADD';
  with tf_AddGdTime.Create(Self) do
  try
    if not q_GdTime.Eof then
    Begin
    cb_Mesto.KeyValue:=q_GdTime.FieldValues['MESTO'];
    ed_NumOtgr.Text:='';
    ed_DateOtgr.Date:=q_GdTime.FieldValues['DATE_OTGR'];
    ed_NP_DATA_O.Date:=q_GdTime.FieldValues['NP_DATA_O'];
    ed_NP_TIMEP.Text:=q_GdTime.FieldValues['NP_TIMEP'];
    end
    else
    Begin
      cb_Mesto.KeyValue:=1;
      ed_NumOtgr.Text:='';
      ed_DateOtgr.Date:=Now;
      ed_NP_DATA_O.Date:=Now;
      ed_NP_TIMEP.Text:='12:00';
    end;
    ShowModal;
    if ModalResult=mrOk then
    Begin
      with q_cmn do
      try
        Close;
        SQL.Clear;
        SQL.Add('INSERT INTO gd_time (mesto,num_otgr,date_otgr,np_data_o,np_timep) '+
                'VALUES ('+VarToStr(cb_Mesto.KeyValue)+','''+ed_NumOtgr.Text+''','+
                '{'+FormatDateTime('mm/dd/yyyy',ed_DateOtgr.Date)+'},'+
                '{'+FormatDateTime('mm/dd/yyyy',ed_NP_DATA_O.Date)+'},'+
                ''''+ed_NP_TIMEP.Text+''')');
        ExecSQL;
        SQL.Clear;
        SQL.Add('UPDATE kvit SET np_data_o={'+FormatDateTime('mm/dd/yyyy',ed_NP_DATA_O.Date)+'},'+
                'np_timep='''+ed_NP_TIMEP.Text+''' '+
                'WHERE id='+IntToStr(KvitId));
        ExecSQL;
        SQL.Clear;
        SQL.Add('UPDATE ''U:\LUK\OTGR\OPERDATA\reestr'' SET np_data_o={'+FormatDateTime('mm/dd/yyyy',ed_NP_DATA_O.Date)+'},'+
                'np_timep='''+ed_NP_TIMEP.Text+''' '+
                'WHERE id='+IntToStr(ReestrId));
        ExecSQL;
      except
        Application.MessageBox('Внимание!','Время не изменилось - Возможно данные заняты!',MB_OK);
      end;
      f_db.ReQueryADO(q_GdTime,true);
    end;
  except
    Free;
  end;
end;

procedure Tf_GdTime.acChangeGdTimeExecute(Sender: TObject);
begin
  inherited;
  AddGdTime.OperKind:='CHANGE';
  if not q_GdTime.Eof then
  with tf_AddGdTime.Create(Self) do
  try
    cb_Mesto.KeyValue:=q_GdTime.FieldValues['MESTO'];
    ed_NumOtgr.Text:=q_GdTime.FieldValues['NUM_OTGR'];
    ed_DateOtgr.Date:=q_GdTime.FieldValues['DATE_OTGR'];
    ed_NP_DATA_O.Date:=q_GdTime.FieldValues['NP_DATA_O'];
    ed_NP_TIMEP.Text:=q_GdTime.FieldValues['NP_TIMEP'];
    ShowModal;
    if ModalResult=mrOk then
    Begin
      with q_cmn do
      try
        Close;
        SQL.Clear;
        SQL.Add('UPDATE gd_time SET mesto='+VarToStr(cb_Mesto.KeyValue)+','+
                'num_otgr='''+ed_NumOtgr.Text+''','+
                'date_otgr={'+FormatDateTime('mm/dd/yyyy',ed_DateOtgr.Date)+'},'+
                'np_data_o={'+FormatDateTime('mm/dd/yyyy',ed_NP_DATA_O.Date)+'},'+
                'np_timep='''+ed_NP_TIMEP.Text+''' '+
                'WHERE mesto='+VarToStr(q_GdTime.FieldValues['MESTO'])+' AND num_otgr='''+
                 VarToStr(q_GdTime.FieldValues['NUM_OTGR'])+''' AND date_otgr={'+FormatDateTime('mm/dd/yyyy',VarToDateTime(q_GdTime.FieldValues['DATE_OTGR']))+'}');
        ExecSQL;
        SQL.Clear;
        SQL.Add('UPDATE kvit SET np_data_o={'+FormatDateTime('mm/dd/yyyy',ed_NP_DATA_O.Date)+'},'+
                'np_timep='''+ed_NP_TIMEP.Text+''' '+
                'WHERE id='+IntToStr(KvitId));
        ExecSQL;
        SQL.Clear;
        SQL.Add('UPDATE ''U:\LUK\OTGR\OPERDATA\reestr'' SET np_data_o={'+FormatDateTime('mm/dd/yyyy',ed_NP_DATA_O.Date)+'},'+
                'np_timep='''+ed_NP_TIMEP.Text+''' '+
                'WHERE id='+IntToStr(ReestrId));
        ExecSQL;
      except
        Application.MessageBox('Внимание!','Время не изменилось - Возможно данные заняты!',MB_OK);
      end;
      f_db.ReQueryADO(q_GdTime,true);
    end;
  except
    Free;
  end;
end;

procedure Tf_GdTime.acDelGdTimeExecute(Sender: TObject);
begin
  inherited;
  if not q_GdTime.Eof then
  if (Application.MessageBox('Удалить?','ВНИМАНИЕ!',MB_YESNO)=IDYES) Then
  Begin
    with q_cmn do
    try
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM gd_time WHERE mesto='+VarToStr(q_GdTime.FieldValues['MESTO'])+' AND num_otgr='''+
               VarToStr(q_GdTime.FieldValues['NUM_OTGR'])+''' AND date_otgr={'+FormatDateTime('mm/dd/yyyy',VarToDateTime(q_GdTime.FieldValues['DATE_OTGR']))+'}');
      ExecSQL;
      f_db.ReQueryADO(q_GdTime,true);
    finally
      f_db.ReQueryADO(q_GdTime,true);
    end;
  End;
end;

procedure Tf_GdTime.acRefreshGdTimeExecute(Sender: TObject);
begin
  f_db.ReQueryADO(q_GdTime,true);
end;

procedure Tf_GdTime.FormShow(Sender: TObject);
begin
  inherited;
  ado_Session.Open;
  ed_BeginDate.Date:=StartOfTheMonth(Now-DayOfTheMonth(Now));
  ed_EndDate.Date:=Now+1;
  f_db.ReQueryADO(q_GdTime,true);
end;

procedure Tf_GdTime.q_GdTimeBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  q_GdTime.SQL[3]:='(DATE_OTGR>={'+FormatDateTime('mm/dd/yyyy',ed_BeginDate.Date)+'} and DATE_OTGR<={'+FormatDateTime('mm/dd/yyyy',ed_EndDate.Date)+'}))';
end;

procedure Tf_GdTime.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  q_GdTime.Close;
  Action:=caFree;
end;

end.


