unit KlsStruEd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls, TB2Item, TB2Dock,
  TB2Toolbar, ActnList, XPStyleActnCtrls, ActnMan, StdCtrls, ComCtrls,
  CurrEdit, Mask, ToolEdit, RxLookup, Buttons, DB, OracleData, MdiForm,
  Menus, Oracle;

type
  Tf_KlsStruEd = class(TForm)
    PageControl1: TPageControl;
    tabInfo: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    edID: TEdit;
    edCaption: TEdit;
    edTABLE_NAME: TRxLookupEdit;
    edSortby: TRxCalcEdit;
    edUNIQUE_FIELD: TRxLookupEdit;
    edQUERY: TRichEdit;
    edSTART_ORDER: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    edNAME_FIELD: TRxLookupEdit;
    edNAME_FIELD_2: TRxLookupEdit;
    edDATE_FIELD_BEGIN: TRxLookupEdit;
    edDATE_FIELD_END: TRxLookupEdit;
    edSEQUENCES: TRxLookupEdit;
    cbVIEW_TIME: TCheckBox;
    btCheckQuery: TBitBtn;
    tabVisual: TTabSheet;
    tabFields: TTabSheet;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    edFILTER_1: TRxLookupEdit;
    edFILTER_1_CAPTION: TEdit;
    edFILTER_2: TRxLookupEdit;
    edFILTER_2_CAPTION: TEdit;
    edFILTER_3: TRxLookupEdit;
    edFILTER_3_CAPTION: TEdit;
    edADD_FORM: TEdit;
    Panel3: TPanel;
    tabDBF: TTabSheet;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edFOX_UPDATE_QUERY: TRichEdit;
    edFOX_INSERT_QUERY: TRichEdit;
    edFOX_DELETE_QUERY: TRichEdit;
    edUNIQID_SELECT_QUERY: TRichEdit;
    edUNIQID_UPDATE_QUERY: TRichEdit;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    q_ListTables: TOracleDataSet;
    ds_ListTables: TDataSource;
    q_ListFields: TOracleDataSet;
    ds_ListFields: TDataSource;
    q_ListRights: TOracleDataSet;
    ds_ListRights: TDataSource;
    btCreateQuery: TBitBtn;
    edRIGHTS_ID: TRxDBLookupCombo;
    gridFields: TDBGridEh;
    tFields: TOracleDataSet;
    tFieldsSTRUCTURE_ID: TStringField;
    tFieldsFIELD_ID: TIntegerField;
    tFieldsFIELD_NAME: TStringField;
    tFieldsFIELD_CAPTION: TStringField;
    tFieldsFIELD_KIND: TIntegerField;
    tFieldsLOOKUP_SOURCE_QUERY: TStringField;
    tFieldsLOOKUP_DISPLAY_FIELD: TStringField;
    tFieldsLOOKUP_KEY_FIELD: TStringField;
    tFieldsLOOKUP_TABLE: TStringField;
    tFieldsFIELD_READONLY: TIntegerField;
    tFieldsMASK: TStringField;
    tFieldsDISPLAY_WIDTH: TIntegerField;
    dsFields: TDataSource;
    tFieldsID: TFloatField;
    q_tmp: TOracleDataSet;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    TBPopupMenu1: TTBPopupMenu;
    TBItem2: TTBItem;
    ActionManager1: TActionManager;
    acCreateQuery: TAction;
    acCheckQuery: TAction;
    acApply: TAction;
    acCancel: TAction;
    acAddFields: TAction;
    acCheckLookup: TAction;
    acViewMemo: TAction;
    BitBtn2: TBitBtn;
    q_maxFIELD_ID: TOracleDataSet;
    acSaveAndExit: TAction;
    BitBtn3: TBitBtn;
    q_Comments: TOracleDataSet;
    q_CommentsTABLE_NAME: TStringField;
    q_CommentsCOLUMN_NAME: TStringField;
    q_CommentsCOMMENTS: TStringField;
    q_cmn: TOracleQuery;
    acDelField: TAction;
    BitBtn4: TBitBtn;
    TBItem1: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    acRefreshFields: TAction;
    BitBtn5: TBitBtn;
    edCHILD_FORM: TEdit;
    Label27: TLabel;
    q_Sequences: TOracleDataSet;
    ds_Sequences: TDataSource;
    Label28: TLabel;
    edCHILD_NAME: TEdit;
    Label29: TLabel;
    edFROZEN_COLS: TEdit;
    Label30: TLabel;
    edMASTER_FIELD: TRxLookupEdit;
    tFieldsFIELD_TYPE: TStringField;
    tFieldsREL_OPER: TStringField;
    procedure FormShow(Sender: TObject);
    procedure edTABLE_NAMEChange(Sender: TObject);
    procedure acCreateQueryExecute(Sender: TObject);
    procedure acCheckQueryExecute(Sender: TObject);
    procedure acApplyExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure acAddFieldsExecute(Sender: TObject);
    procedure acViewMemoExecute(Sender: TObject);
    procedure acSaveAndExitExecute(Sender: TObject);
    procedure edIDChange(Sender: TObject);
    procedure tabFieldsShow(Sender: TObject);
    procedure acDelFieldExecute(Sender: TObject);
    procedure acCheckLookupExecute(Sender: TObject);
    procedure acRefreshFieldsExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    t_kls_data:TOracleDataSet;
  end;

var
  f_KlsStruEd: Tf_KlsStruEd;

implementation

uses RunQuery, MemoEdit, ForDB, main;

{$R *.dfm}

procedure Tf_KlsStruEd.FormShow(Sender: TObject);
begin
  q_ListTables.Session:=f_main.ora_Session;
  q_ListFields.Session:=f_main.ora_Session;
  q_ListRights.Session:=f_main.ora_Session;
  tFields.Session:=f_main.ora_Session;
  q_tmp.Session:=f_main.ora_Session;
  q_maxFIELD_ID.Session:=f_main.ora_Session;
  q_Comments.Session:=f_main.ora_Session;
  q_cmn.Session:=f_main.ora_Session;
  q_Sequences.Session:=f_main.ora_Session;

  q_ListTables.Open;
  q_ListFields.Open;
  q_ListRights.Open;
  q_Sequences.Open;


  If t_kls_data.State<>dsInsert then
  Begin
    Caption:='Редактирование записи в справочнике "Запросы к БД"';
  end
  else
  Begin
    Caption:='Добавление записи в справочник "Запросы к БД"';
    tabFields.tabVisible:=false;
  End;

  with t_kls_data do
  Begin
    edID.Text:=FieldByName('ID').AsString;
    edTABLE_NAME.Text:=FieldByName('TABLE_NAME').AsString;
    edCaption.Text:=FieldByName('CAPTION').AsString;
    edSORTBY.Value:=FieldByName('SORTBY').AsFloat;
    edQuery.Lines.Text:=FieldByName('QUERY').AsString;
    edUNIQUE_FIELD.Text:=FieldByName('UNIQUE_FIELD').AsString;
    edMASTER_FIELD.Text:=FieldByName('MASTER_FIELD').AsString;
    edFOX_UPDATE_QUERY.Lines.Text:=FieldByName('FOX_UPDATE_QUERY').AsString;
    edFOX_INSERT_QUERY.Lines.Text:=FieldByName('FOX_INSERT_QUERY').AsString;
    edFOX_DELETE_QUERY.Lines.Text:=FieldByName('FOX_DELETE_QUERY').AsString;
    edUNIQID_SELECT_QUERY.Lines.Text:=FieldByName('UNIQID_SELECT_QUERY').AsString;
    edUNIQID_UPDATE_QUERY.Lines.Text:=FieldByName('UNIQID_UPDATE_QUERY').AsString;
    edSTART_ORDER.Text:=FieldByName('START_ORDER').AsString;
    edNAME_FIELD.Text:=FieldByName('NAME_FIELD').AsString;
    edNAME_FIELD_2.Text:=FieldByName('NAME_FIELD_2').AsString;
    edADD_FORM.Text:=FieldByName('ADD_FORM').AsString;
    edCHILD_FORM.Text:=FieldByName('CHILD_FORM').AsString;
    edCHILD_NAME.Text:=FieldByName('CHILD_NAME').AsString;
    edSEQUENCES.Text:=FieldByName('SEQUENCES').AsString;
    edFILTER_1.Text:=FieldByName('FILTER_1').AsString;
    edFILTER_1_CAPTION.Text:=FieldByName('FILTER_1_CAPTION').AsString;
    edFILTER_2.Text:=FieldByName('FILTER_2').AsString;
    edFILTER_2_CAPTION.Text:=FieldByName('FILTER_2_CAPTION').AsString;
    edFILTER_3.Text:=FieldByName('FILTER_3').AsString;
    edFILTER_3_CAPTION.Text:=FieldByName('FILTER_3_CAPTION').AsString;
    edRIGHTS_ID.KeyValue:=FieldByName('RIGHTS_ID').AsString;
    edDATE_FIELD_BEGIN.Text:=FieldByName('DATE_FIELD_BEGIN').AsString;
    edDATE_FIELD_END.Text:=FieldByName('DATE_FIELD_END').AsString;
    cbVIEW_TIME.Checked:=(FieldByName('VIEW_TIME').AsInteger<>0);
    edFROZEN_COLS.Text:=FieldByName('FROZEN_COLS').AsString;
  End;

end;

procedure Tf_KlsStruEd.edTABLE_NAMEChange(Sender: TObject);
begin
  inherited;
  if NOT q_ListTables.Locate('TAB_NAME',edTABLE_NAME.Text,[]) then
    q_ListFields.Close
  else
    q_ListFields.Open;
  if edID.Text='' then edID.Text:=edTABLE_NAME.Text;
  q_Comments.SetVariable('TABLE_NAME',edTABLE_NAME.Text);
end;

procedure Tf_KlsStruEd.acCreateQueryExecute(Sender: TObject);
begin
  edQuery.Text:='SELECT '+#13#10+
                '  ''[''||'+edTABLE_NAME.Text+'.rowid||'']'' as row_id, '+#13#10+
                '  '+edTABLE_NAME.Text+'.rowid, '+#13#10+
                '  '+edTABLE_NAME.Text+'.* '+#13#10+
                'FROM '+edTABLE_NAME.Text;
end;

procedure Tf_KlsStruEd.acCheckQueryExecute(Sender: TObject);
begin
  RunQuery.AFormStyle:=fsNormal;
  with tf_Query.Create(Self) do
  begin
    querySQL:=edQuery.Text;
    queryDescription:='Проверка запроса '+edCaption.Text;
    ShowModal;
    Free;
  end;
end;

procedure Tf_KlsStruEd.acApplyExecute(Sender: TObject);
begin
  inherited;
  with t_kls_data do
  try
    if State=dsBrowse then Edit;
    FieldByName('ID').AsString:=edID.Text;
    FieldByName('TABLE_NAME').AsString:=edTABLE_NAME.Text;
    FieldByName('CAPTION').AsString:=edCaption.Text;
    FieldByName('SORTBY').AsFloat:=edSORTBY.Value;
    FieldByName('QUERY').AsString:=edQuery.Lines.Text;
    FieldByName('UNIQUE_FIELD').AsString:=edUNIQUE_FIELD.Text;
    FieldByName('MASTER_FIELD').AsString:=edMASTER_FIELD.Text;
    FieldByName('FOX_UPDATE_QUERY').AsString:=edFOX_UPDATE_QUERY.Lines.Text;
    FieldByName('FOX_INSERT_QUERY').AsString:=edFOX_INSERT_QUERY.Lines.Text;
    FieldByName('FOX_DELETE_QUERY').AsString:=edFOX_DELETE_QUERY.Lines.Text;
    FieldByName('UNIQID_SELECT_QUERY').AsString:=edUNIQID_SELECT_QUERY.Lines.Text;
    FieldByName('UNIQID_UPDATE_QUERY').AsString:=edUNIQID_UPDATE_QUERY.Lines.Text;
    FieldByName('START_ORDER').AsString:=edSTART_ORDER.Text;
    FieldByName('NAME_FIELD').AsString:=edNAME_FIELD.Text;
    FieldByName('NAME_FIELD_2').AsString:=edNAME_FIELD_2.Text;
    FieldByName('ADD_FORM').AsString:=edADD_FORM.Text;
    FieldByName('CHILD_FORM').AsString:=edCHILD_FORM.Text;
    FieldByName('CHILD_NAME').AsString:=edCHILD_NAME.Text;
    FieldByName('SEQUENCES').AsString:=edSEQUENCES.Text;
    FieldByName('FILTER_1').AsString:=edFILTER_1.Text;
    FieldByName('FILTER_1_CAPTION').AsString:=edFILTER_1_CAPTION.Text;
    FieldByName('FILTER_2').AsString:=edFILTER_2.Text;
    FieldByName('FILTER_2_CAPTION').AsString:=edFILTER_2_CAPTION.Text;
    FieldByName('FILTER_3').AsString:=edFILTER_3.Text;
    FieldByName('FILTER_3_CAPTION').AsString:=edFILTER_3_CAPTION.Text;
    FieldByName('RIGHTS_ID').AsString:=VarToStr(edRIGHTS_ID.KeyValue);
    FieldByName('DATE_FIELD_BEGIN').AsString:=edDATE_FIELD_BEGIN.Text;
    FieldByName('DATE_FIELD_END').AsString:=edDATE_FIELD_END.Text;
    FieldByName('FROZEN_COLS').AsString:=edFROZEN_COLS.Text;
    if cbVIEW_TIME.Checked then
      FieldByName('VIEW_TIME').AsInteger:=1
    else
      FieldByName('VIEW_TIME').AsInteger:=0;

    Post;
    tabFields.TabVisible:=true;
  except
    on E:Exception do
    Begin
      Application.MessageBox(PChar(E.Message),'Внимание!',MB_OK);
    End;
  end;
end;

procedure Tf_KlsStruEd.acCancelExecute(Sender: TObject);
begin
  t_kls_data.Cancel;
  ModalResult:=mrCancel;
end;

procedure Tf_KlsStruEd.acAddFieldsExecute(Sender: TObject);
var i:integer;
    s:string;
    maxFIELD_ID:integer;
    FIELD_NAME,FIELD_CAPTION,FIELD_TYPE:string;
begin
  q_tmp.Close;
  q_tmp.SQL.Clear;
  q_tmp.SQL.Add(edQuery.Text);
  q_tmp.Open;
  q_Comments.Close;
  q_Comments.Open;

  for i:=0 to q_tmp.Fields.Count-1 do
  Begin
    FIELD_NAME:=q_tmp.Fields[i].FieldName;
    case q_tmp.FieldDefs[i].DataType of
      ftString: FIELD_TYPE:='C';
      ftDate,ftDateTime: FIELD_TYPE:='D';
      ftCurrency,ftFloat,ftInteger: FIELD_TYPE:='N';
      else FIELD_TYPE:='';
    end;
    if (FIELD_NAME<>'ROWID') and (FIELD_NAME<>'ROW_ID') then
    if not tFields.Locate('FIELD_NAME',FIELD_NAME,[]) then
    Begin
      with q_maxFIELD_ID do
      Begin
        Close;
        Open;
        if Eof then maxFIELD_ID:=0 else maxFIELD_ID:=FieldByName('MAX_FIELD_ID').AsInteger;
        Close;
      End;
      FIELD_CAPTION:='';
      if q_Comments.Locate('COLUMN_NAME',FIELD_NAME,[]) then
        FIELD_CAPTION:=q_Comments.FieldByName('COMMENTS').AsString;
      if FIELD_CAPTION='' then FIELD_CAPTION:=FIELD_NAME;
      FIELD_CAPTION:=System.Copy(FIELD_CAPTION,1,50);
      s:='INSERT INTO MASTER_KLS_FIELD_STRUCTURE (STRUCTURE_ID,FIELD_ID,FIELD_NAME,FIELD_CAPTION,FIELD_KIND,FIELD_TYPE)'+
         'VALUES('''+edId.Text+''','+IntToStr(maxFIELD_ID+1)+','''+FIELD_NAME+''','''+
         FIELD_CAPTION+''',0,'''+FIELD_TYPE+''')';
      q_cmn.Close;
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add(s);
      q_cmn.Execute;
      q_cmn.Close;
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('COMMIT');
      q_cmn.Execute;
      q_cmn.Close;
    End;
  End;
  q_cmn.Close;
  q_cmn.SQL.Clear;
  q_tmp.Close;
  q_Comments.Close;
  f_db.ReQuery(tFields,false);
end;

procedure Tf_KlsStruEd.acViewMemoExecute(Sender: TObject);
begin
  if NOT tFields.Eof then
  with tf_MemoEdit.Create(Self) do
  begin
    EditValue:=gridFields.SelectedField.AsString;
    EditDescription:='Редактирование '+gridFields.SelectedField.FieldName;
    ShowModal;
    if ModalResult=mrOk then
    Begin
      if tFields.State=dsBrowse then tFields.Edit;
      gridFields.SelectedField.AsString:=EditValue;
      tFields.Post;
    End;
    Free;
  end;
end;

procedure Tf_KlsStruEd.acSaveAndExitExecute(Sender: TObject);
begin
  acApplyExecute(Sender);
  ModalResult:=mrOk;
end;

procedure Tf_KlsStruEd.edIDChange(Sender: TObject);
begin
  tFields.SetVariable('STRUCTURE_ID',edId.text);
  q_maxFIELD_ID.SetVariable('STRUCTURE_ID',edId.text);
end;

procedure Tf_KlsStruEd.tabFieldsShow(Sender: TObject);
begin
  tFields.Close;
  tFields.Open;
end;

procedure Tf_KlsStruEd.acDelFieldExecute(Sender: TObject);
begin
  if not tFields.Eof then
  if Application.MessageBox('Удалить запись?','Внимание!',MB_YESNO)=IDYES then
  Begin
    if tFields.State<>dsBrowse then tFields.Cancel;
    tFields.Delete;
  End;  
end;

procedure Tf_KlsStruEd.acCheckLookupExecute(Sender: TObject);
begin
  RunQuery.AFormStyle:=fsNormal;
  if NOT tFields.Eof then
  if tFieldsLOOKUP_SOURCE_QUERY.AsString<>'' then
  with tf_Query.Create(Self) do
  begin
    querySQL:=tFieldsLOOKUP_SOURCE_QUERY.AsString;
    queryDescription:='Проверка LOOKUP-запроса для поля '+tFieldsFIELD_NAME.AsString;
    ShowModal;
    Free;
  end;
end;

procedure Tf_KlsStruEd.acRefreshFieldsExecute(Sender: TObject);
begin
  f_db.ReQuery(tFields,true);
end;

end.
