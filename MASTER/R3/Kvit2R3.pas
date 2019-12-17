unit Kvit2R3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MdiForm, ActnList, XPStyleActnCtrls, ActnMan, TB2Item, TB2Dock,
  TB2Toolbar, StdCtrls, ComCtrls, RXCtrls, DBCtrls, ExtCtrls, DB, ADODB,
  Grids, DBGridEh, RxLookup, OracleData;

type
  Tf_Kvit2R3 = class(Tf_MDIForm)
    ActionManager2: TActionManager;
    acR3_DelPostFile: TAction;
    acR3_SendOperOF: TAction;
    acR3_DelPostNoFile: TAction;
    acR3_SendDocOF: TAction;
    acR3_SendOS: TAction;
    acR3_SendSU: TAction;
    acR3_RefreshPost: TAction;
    acR3_SendQQ: TAction;
    acR3_SeekPost: TAction;
    acR3_InfoPost: TAction;
    TBDock1: TTBDock;
    TBToolbar2: TTBToolbar;
    TBItem13: TTBItem;
    TBItem14: TTBItem;
    TBItem15: TTBItem;
    TBItem16: TTBItem;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    RxSpeedButton1: TRxSpeedButton;
    Label3: TLabel;
    ed_BeginDate: TDateTimePicker;
    Label4: TLabel;
    ed_EndDate: TDateTimePicker;
    cb_FilterKind: TComboBox;
    ed_Filter: TEdit;
    Panel2: TPanel;
    gridPost: TDBGridEh;
    ado_Session: TADOConnection;
    q_Kvit2R3: TADOQuery;
    q_Kvit2R3kvit_id: TIntegerField;
    q_Kvit2R3bednr: TBCDField;
    q_Kvit2R3id_sap: TStringField;
    q_Kvit2R3od_zzzz_id: TStringField;
    q_Kvit2R3id_ms: TBCDField;
    q_Kvit2R3ves: TBCDField;
    q_Kvit2R3id_sap_psn: TStringField;
    q_Kvit2R3oper: TStringField;
    q_Kvit2R3lastoper: TStringField;
    q_Kvit2R3send_oper: TBooleanField;
    q_Kvit2R3t_oper: TStringField;
    q_Kvit2R3of_file: TStringField;
    q_Kvit2R3t_del: TStringField;
    q_Kvit2R3send_doc: TBooleanField;
    q_Kvit2R3t_doc: TStringField;
    q_Kvit2R3of_file_d: TStringField;
    q_Kvit2R3os: TStringField;
    q_Kvit2R3lastos: TStringField;
    q_Kvit2R3send_os: TBooleanField;
    q_Kvit2R3t_os: TStringField;
    q_Kvit2R3os_file: TStringField;
    q_Kvit2R3su: TStringField;
    q_Kvit2R3lastsu: TStringField;
    q_Kvit2R3send_su: TBooleanField;
    q_Kvit2R3t_su: TStringField;
    q_Kvit2R3su_file: TStringField;
    q_Kvit2R3qq: TStringField;
    q_Kvit2R3lastqq: TStringField;
    q_Kvit2R3send_qq: TBooleanField;
    q_Kvit2R3t_qq: TStringField;
    q_Kvit2R3qq_file: TStringField;
    q_Kvit2R3logfile: TStringField;
    q_Kvit2R3is_exp: TBooleanField;
    q_Kvit2R3tip_otgr: TIntegerField;
    q_Kvit2R3nom_zd: TStringField;
    q_Kvit2R3kod_npr: TStringField;
    q_Kvit2R3np: TIntegerField;
    q_Kvit2R3num_kvit: TBCDField;
    q_Kvit2R3num_otgr: TStringField;
    q_Kvit2R3prod_name: TStringField;
    ds_Kvit2R3: TDataSource;
    q_Kvit2R3d_oper: TDateField;
    q_Kvit2R3d_del: TDateField;
    q_Kvit2R3d_doc: TDateField;
    q_Kvit2R3d_os: TDateField;
    q_Kvit2R3d_su: TDateField;
    q_Kvit2R3d_qq: TDateField;
    q_Kvit2R3date_otgr: TDateField;
    q_Kvit2R3exp_name: TStringField;
    q_Update: TADOQuery;
    acR3_NoDelPost: TAction;
    TBDock2: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem4: TTBItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    TBItem10: TTBItem;
    acR3_NoSendOperOF: TAction;
    acR3_NoSendDocOF: TAction;
    acR3_NoSendOS: TAction;
    acR3_NoSendSU: TAction;
    acR3_NoSendQQ: TAction;
    cb_NOT_Filter: TCheckBox;
    q_Sobstv: TOracleDataSet;
    ds_Sobstv: TDataSource;
    ed_Sobstv: TRxDBLookupCombo;
    cb_Sobstv: TCheckBox;
    cb_Prod: TCheckBox;
    ed_Prod: TRxDBLookupCombo;
    q_prod: TOracleDataSet;
    ds_Prod: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acR3_RefreshPostExecute(Sender: TObject);
    procedure acR3_DelPostNoFileExecute(Sender: TObject);
    procedure gridPostGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure acR3_DelPostFileExecute(Sender: TObject);
    procedure acR3_NoDelPostExecute(Sender: TObject);
    procedure acR3_SendOperOFExecute(Sender: TObject);
    procedure acR3_NoSendOperOFExecute(Sender: TObject);
    procedure acR3_SendDocOFExecute(Sender: TObject);
    procedure acR3_NoSendDocOFExecute(Sender: TObject);
    procedure acR3_SendOSExecute(Sender: TObject);
    procedure acR3_NoSendOSExecute(Sender: TObject);
    procedure acR3_SendSUExecute(Sender: TObject);
    procedure acR3_NoSendSUExecute(Sender: TObject);
    procedure acR3_SendQQExecute(Sender: TObject);
    procedure acR3_NoSendQQExecute(Sender: TObject);
    procedure gridPostSortMarkingChanged(Sender: TObject);
    procedure gridPostColumns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure cb_SobstvClick(Sender: TObject);
    procedure cb_ProdClick(Sender: TObject);
  private
    { Private declarations }
    procedure ExecuteOpers(KindOper:string);
  public
    { Public declarations }
  end;

var
  f_Kvit2R3: Tf_Kvit2R3;

implementation

uses ForDB;

{$R *.dfm}

procedure Tf_Kvit2R3.FormCreate(Sender: TObject);
begin
  inherited;
  ado_Session.Open;
  ed_BeginDate.Date:=Now;
  ed_EndDate.Date:=Now;
  q_Sobstv.Open;
  q_Prod.Open;
  acR3_RefreshPostExecute(Sender);
end;

procedure Tf_Kvit2R3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ado_Session.Close;
  q_Update.SQL.Clear;
  Action:=caFree;
end;

procedure Tf_Kvit2R3.acR3_RefreshPostExecute(Sender: TObject);
var Sign:string;
  Save_Cursor: TCursor;
begin
  inherited;
  // Проверка на запущенный экспорт отгрузки
  If FileExists('U:\LUK\DBA\MP\FLAGS\export_to_R3.sem') then
  Begin
    Application.MessageBox('В данный момент идет формирование файлов для загрузки в R/3!','Внимание!',MB_OK);
    Self.Close;
    exit;
  end;
  // Обновление
  Save_Cursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;    { Show hourglass cursor }
  with q_Kvit2R3 do
  try
{    DisableControls;}
    Close;
    SQL[4]:='(DATE_OTGR>={'+FormatDateTime('mm/dd/yyyy',ed_BeginDate.Date)+'} and DATE_OTGR<={'+FormatDateTime('mm/dd/yyyy',ed_EndDate.Date)+'}))';
    SQL[5]:='AND 1=1';
    SQL[6]:='AND 1=1';
    SQL[7]:='AND 1=1';
    SQL[8]:='AND 1=1';
    SQL[9]:='AND 1=1';
    SQL[10]:='AND 1=1';
    SQL[11]:='AND 1=1';
    SQL[12]:='AND 1=1';
    SQL[13]:='AND 1=1';
    SQL[14]:='AND 1=1';
    SQL[15]:='AND 1=1';
    SQL[16]:='AND 1=1';
    SQL[17]:='AND 1=1';
    SQL[18]:='AND 1=1';
    SQL[19]:='AND 1=1';
    try
      if cb_NOT_Filter.Checked then Sign:='NOT' else Sign:='';
      case cb_FilterKind.ItemIndex of
        1: if ed_Filter.Text<>'' then SQL[5]:='AND '+Sign+' (ALLT(ID_SAP) = '''+ed_Filter.Text+''')';
        2: if ed_Filter.Text<>'' then SQL[6]:='AND '+Sign+' (SUBSTR(OD_ZZZZ_ID,2,'+IntToStr(Length(ed_Filter.Text))+')='''+ed_Filter.Text+''')';
        3: if ed_Filter.Text<>'' then SQL[7]:='AND '+Sign+' (ALLT(K2R3.NOM_ZD) = '''+ed_Filter.Text+''')';
        4: if ed_Filter.Text<>'' then SQL[8]:='AND '+Sign+' (NUM_KVIT = '+ed_Filter.Text+')';
        5: SQL[9]:='AND '+Sign+' SEND_OPER';
        6: SQL[10]:='AND '+Sign+' SEND_DOC';
        7: SQL[11]:='AND '+Sign+' SEND_OS';
        8: SQL[12]:='AND '+Sign+' SEND_SU';
        9: SQL[13]:='AND '+Sign+' SEND_QQ';
        10: SQL[14]:='AND '+Sign+' IS_EXP';
        11: SQL[15]:='AND '+Sign+' (LASTOPER=''D'')';
        12: SQL[16]:='AND '+Sign+' (OPER=''D'')';
        13: SQL[5]:='AND '+Sign+' (EMPTY(ID_SAP))';
        14: if ed_Filter.Text<>'' then SQL[17]:='AND '+Sign+' (MONTH.N_DOG = '''+ed_Filter.Text+''')';
      end;
      if cb_Sobstv.Checked then
        SQL[18]:='AND (MONTH.KOD_SOBS = '+q_Sobstv.FieldByName('FOX_KOD').AsString+')';
      if cb_Prod.Checked then
        SQL[19]:='AND (K2R3.KOD_NPR = '''+q_Prod.FieldByName('ID_NPR').AsString+''')';
      Open;
    except
      SQL[5]:='AND 1=1';
      SQL[6]:='AND 1=1';
      SQL[7]:='AND 1=1';
      SQL[8]:='AND 1=1';
      SQL[9]:='AND 1=1';
      SQL[10]:='AND 1=1';
      SQL[11]:='AND 1=1';
      SQL[12]:='AND 1=1';
      SQL[13]:='AND 1=1';
      SQL[14]:='AND 1=1';
      SQL[15]:='AND 1=1';
      SQL[16]:='AND 1=1';
      SQL[17]:='AND 1=1';
      SQL[18]:='AND 1=1';
      SQL[19]:='AND 1=1';
      try
        Open;
      except
        Application.MessageBox('Невозможно получить доступ к таблице связи поставок. Возможна она сейчас занята.','Внимание!',MB_OK);
        Self.Close;
      end;
    end;
  finally
{    EnableControls;}
    if Self.Visible then gridPost.SetFocus;
    Screen.Cursor := Save_Cursor;  { Always restore to normal }
  end;
end;

procedure Tf_Kvit2R3.ExecuteOpers(KindOper:string);
var MsgTxt:string;
    bm:TBookmarkStr;
    i:integer;
  procedure FillQuery;
  Begin
    try
      q_Update.Close;
      q_Update.SQL.Clear;
      if KindOper='DEL_POST_NO_FILE' then
        q_Update.SQL.Add('UPDATE ''U:\FOX2R3\ARCHIV\kvit2r3.dbf'' SET lastoper=''D'' WHERE id_ms=:id_ms');
      if KindOper='DEL_POST_WITH_FILE' then
        q_Update.SQL.Add('UPDATE ''U:\FOX2R3\ARCHIV\kvit2r3.dbf'' SET lastoper=''U'',oper=''D'',send_oper=.F. WHERE id_ms=:id_ms');
      if KindOper='UNDO_DEL_POST' then
        q_Update.SQL.Add('UPDATE ''U:\FOX2R3\ARCHIV\kvit2r3.dbf'' SET lastoper=''U'',oper=IIF(send_doc,''N'',''U''),send_oper=.T. WHERE id_ms=:id_ms');
      if KindOper='SEND_OPER_OF' then
        q_Update.SQL.Add('UPDATE ''U:\FOX2R3\ARCHIV\kvit2r3.dbf'' SET lastoper=''U'',oper=''U'',send_oper=.F. WHERE id_ms=:id_ms');
      if KindOper='UNDO_SEND_OPER_OF' then
        q_Update.SQL.Add('UPDATE ''U:\FOX2R3\ARCHIV\kvit2r3.dbf'' SET lastoper=''U'',oper=IIF(send_doc,''N'',''U''),send_oper=.T. WHERE id_ms=:id_ms');
      if KindOper='SEND_DOC_OF' then
        q_Update.SQL.Add('UPDATE ''U:\FOX2R3\ARCHIV\kvit2r3.dbf'' SET lastoper=''U'',oper=''U'',send_doc=.F. WHERE id_ms=:id_ms');
      if KindOper='UNDO_SEND_DOC_OF' then
        q_Update.SQL.Add('UPDATE ''U:\FOX2R3\ARCHIV\kvit2r3.dbf'' SET lastoper=''U'',oper=''N'',send_doc=.T. WHERE id_ms=:id_ms');
      if KindOper='SEND_OS' then
        q_Update.SQL.Add('UPDATE ''U:\FOX2R3\ARCHIV\kvit2r3.dbf'' SET lastoper=''U'',os=''U'',send_os=.F. WHERE id_ms=:id_ms');
      if KindOper='UNDO_SEND_OS' then
        q_Update.SQL.Add('UPDATE ''U:\FOX2R3\ARCHIV\kvit2r3.dbf'' SET lastoper=''U'',os=''N'',send_os=.T. WHERE id_ms=:id_ms');
      if KindOper='SEND_SU' then
        q_Update.SQL.Add('UPDATE ''U:\FOX2R3\ARCHIV\kvit2r3.dbf'' SET lastoper=''U'',su=''U'',send_su=.F. WHERE id_ms=:id_ms');
      if KindOper='UNDO_SEND_SU' then
        q_Update.SQL.Add('UPDATE ''U:\FOX2R3\ARCHIV\kvit2r3.dbf'' SET lastoper=''U'',su=''N'',send_su=.T. WHERE id_ms=:id_ms');
      if KindOper='SEND_QQ' then
        q_Update.SQL.Add('UPDATE ''U:\FOX2R3\ARCHIV\kvit2r3.dbf'' SET lastoper=''U'',qq=''U'',send_qq=.F. WHERE id_ms=:id_ms');
      if KindOper='UNDO_SEND_QQ' then
        q_Update.SQL.Add('UPDATE ''U:\FOX2R3\ARCHIV\kvit2r3.dbf'' SET lastoper=''U'',qq=''N'',send_qq=.T. WHERE id_ms=:id_ms');
      q_Update.ExecSQL;
    except
    end;
  End;
Begin
  with gridPost do
  Begin
    if Selection.SelectionType = gstNon then Exit;
    if Datasource.Dataset.Eof then exit;

    MsgTxt:='Выполнить операцию?';
    if KindOper='DEL_POST_NO_FILE' then
      MsgTxt:='Удалить поставку(и) без отправки файла OF?';
    if KindOper='DEL_POST_WITH_FILE' then
      MsgTxt:='Удалить поставку(и) и сформировать файл OF для передачи в R3?';
    if KindOper='UNDO_DEL_POST' then
      MsgTxt:='Отменить удаление поставки(ок)?';
    if KindOper='SEND_OPER_OF' then
      MsgTxt:='Отправить поставку(и) в файле с оперативной отгрузкой (OF)?';
    if KindOper='UNDO_SEND_OPER_OF' then
      MsgTxt:='Отменить отправку поставки(ок) в файле с оперативной отгрузкой (OF)?';
    if KindOper='SEND_DOC_OF' then
      MsgTxt:='Отправить поставку(и) в файле с документированной отгрузкой (OF)?';
    if KindOper='UNDO_SEND_DOC_OF' then
      MsgTxt:='Отменить отправку поставки(ок) в файле с документированной отгрузкой (OF)?';
    if KindOper='SEND_OS' then
      MsgTxt:='Отправить поставку(и) в файле с услугами (OS)?';
    if KindOper='UNDO_SEND_OS' then
      MsgTxt:='Отменить отправку поставки(ок) в файле с услугами (OS)?';
    if KindOper='SEND_SU' then
      MsgTxt:='Отправить поставку(и) в файле с провозной платой (SU)?';
    if KindOper='UNDO_SEND_SU' then
      MsgTxt:='Отменить отправку поставки(ок) в файле с провозной платой (SU)?';
    if KindOper='SEND_QQ' then
      MsgTxt:='Отправить поставку(и) в файле с сертификатами (QQ)?';
    if KindOper='UNDO_SEND_QQ' then
      MsgTxt:='Отменить отправку поставки(ок) в файле с сертификатами (QQ)?';

    if Application.MessageBox(PChar(MsgTxt),'Внимание!',MB_YESNO)=IDYES then
    if (Selection.SelectionType = gstRecordBookmarks) or (Selection.SelectionType = gstAll) then
    with Datasource.Dataset do
    try
      bm := Bookmark;
      DisableControls;
      try
        if Selection.SelectionType = gstRecordBookmarks then
          for I := 0 to Selection.Rows.Count-1 do
          begin
            Bookmark := Selection.Rows[I];
            FillQuery;
          end
        else
          Begin
            First;
            while NOT EOF do
            begin
              FillQuery;
              Next;
            end;
          end;  
      finally
        Close;
        Open;
        Bookmark := bm;
        EnableControls;
      end;
    finally
    end;
    SetFocus;
  end;
End;

procedure Tf_Kvit2R3.acR3_DelPostNoFileExecute(Sender: TObject);
begin
  inherited;
  ExecuteOpers('DEL_POST_NO_FILE');
end;

procedure Tf_Kvit2R3.gridPostGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  If Column.FieldName='d_doc' then
  If Column.Field.AsString='30.12.1899' then
    AFont.Color:=Background
  Else
    AFont.Color:=clWindowText;

  If Column.FieldName='date_otgr' then
  If Column.Field.AsString='30.12.1899' then
    AFont.Color:=Background
  Else
    AFont.Color:=clWindowText;

  If Column.FieldName='d_oper' then
  If Column.Field.AsString='30.12.1899' then
    AFont.Color:=Background
  Else
    AFont.Color:=clWindowText;

  If Column.FieldName='d_os' then
  If Column.Field.AsString='30.12.1899' then
    AFont.Color:=Background
  Else
    AFont.Color:=clWindowText;

  If Column.FieldName='d_su' then
  If Column.Field.AsString='30.12.1899' then
    AFont.Color:=Background
  Else
    AFont.Color:=clWindowText;

  If Column.FieldName='d_qq' then
  If Column.Field.AsString='30.12.1899' then
    AFont.Color:=Background
  Else
    AFont.Color:=clWindowText;

  If Column.FieldName='lastoper' then
  If Column.Field.AsString<>'D' then
    AFont.Color:=Background
  Else
    AFont.Color:=clWindowText;

  If Column.FieldName='oper' then
  If Column.Field.AsString<>'D' then
    AFont.Color:=Background
  Else
    AFont.Color:=clWindowText;

end;

procedure Tf_Kvit2R3.acR3_DelPostFileExecute(Sender: TObject);
begin
  inherited;
  ExecuteOpers('DEL_POST_WITH_FILE');
end;

procedure Tf_Kvit2R3.acR3_NoDelPostExecute(Sender: TObject);
begin
  inherited;
  ExecuteOpers('UNDO_DEL_POST');
end;

procedure Tf_Kvit2R3.acR3_SendOperOFExecute(Sender: TObject);
begin
  inherited;
  ExecuteOpers('SEND_OPER_OF');
end;

procedure Tf_Kvit2R3.acR3_NoSendOperOFExecute(Sender: TObject);
begin
  inherited;
  ExecuteOpers('UNDO_SEND_OPER_OF');
end;

procedure Tf_Kvit2R3.acR3_SendDocOFExecute(Sender: TObject);
begin
  inherited;
  ExecuteOpers('SEND_DOC_OF');
end;

procedure Tf_Kvit2R3.acR3_NoSendDocOFExecute(Sender: TObject);
begin
  inherited;
  ExecuteOpers('UNDO_SEND_DOC_OF');
end;

procedure Tf_Kvit2R3.acR3_SendOSExecute(Sender: TObject);
begin
  inherited;
  ExecuteOpers('SEND_OS');
end;

procedure Tf_Kvit2R3.acR3_NoSendOSExecute(Sender: TObject);
begin
  inherited;
  ExecuteOpers('UNDO_SEND_OS');
end;

procedure Tf_Kvit2R3.acR3_SendSUExecute(Sender: TObject);
begin
  inherited;
  ExecuteOpers('SEND_SU');
end;

procedure Tf_Kvit2R3.acR3_NoSendSUExecute(Sender: TObject);
begin
  inherited;
  ExecuteOpers('UNDO_SEND_SU');
end;

procedure Tf_Kvit2R3.acR3_SendQQExecute(Sender: TObject);
begin
  inherited;
  ExecuteOpers('SEND_QQ');
end;

procedure Tf_Kvit2R3.acR3_NoSendQQExecute(Sender: TObject);
begin
  inherited;
  ExecuteOpers('UNDO_SEND_QQ');
end;

procedure Tf_Kvit2R3.gridPostSortMarkingChanged(Sender: TObject);
begin
  inherited;
  f_db.SortInGridADO(q_Kvit2R3,20,gridPost);
end;

procedure Tf_Kvit2R3.gridPostColumns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
  inherited;
  Params.Text:=IntToStr(q_Kvit2R3.RecNo);
end;

procedure Tf_Kvit2R3.cb_SobstvClick(Sender: TObject);
begin
  inherited;
  ed_Sobstv.Enabled:=cb_Sobstv.Checked;
end;

procedure Tf_Kvit2R3.cb_ProdClick(Sender: TObject);
begin
  inherited;
  ed_Prod.Enabled:=cb_Prod.Checked;
end;

end.
