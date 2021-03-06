unit KlsMisc2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, DB, OracleData, Oracle,mdiform, ADODB, TB2Item,
  ActnList, ActnMan, TB2Dock, TB2Toolbar, TB2ExtItems, Menus,
  XPStyleActnCtrls, StdCtrls, RXCtrls, ExtCtrls, DBCtrls,DBGridEhImpExp,RxShell,
  EhLibDOA,PropFilerEh, PropStorageEh, GridsEh, DBGridEhGrouping;

type
  Tf_KlsMisc = class(TForm)
    t_kls_structure: TOracleDataSet;
    t_kls_structureID: TStringField;
    t_kls_structureQUERY: TStringField;
    t_kls_structureCAPTION: TStringField;
    t_kls_structureUNIQUE_FIELD: TStringField;
    t_field_structure: TOracleDataSet;
    t_field_structureSTRUCTURE_ID: TStringField;
    t_field_structureFIELD_ID: TIntegerField;
    t_field_structureFIELD_NAME: TStringField;
    t_field_structureFIELD_CAPTION: TStringField;
    t_field_structureLOOKUP_SOURCE_QUERY: TStringField;
    t_field_structureLOOKUP_DISPLAY_FIELD: TStringField;
    t_field_structureLOOKUP_KEY_FIELD: TStringField;
    t_field_structureLOOKUP_TABLE: TStringField;
    t_kls: TOracleDataSet;
    ds_kls: TDataSource;
    grKlsMisc: TDBGridEh;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    t_kls_structureFOX_UPDATE_QUERY: TStringField;
    t_kls_structureFOX_INSERT_QUERY: TStringField;
    t_kls_structureFOX_DELETE_QUERY: TStringField;
    ADOTable1: TADOTable;
    t_kls_structureUNIQID_SELECT_QUERY: TStringField;
    t_kls_structureUNIQID_UPDATE_QUERY: TStringField;
    t_field_structureFIELD_READONLY: TIntegerField;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    KLSActionManager: TActionManager;
    acKLSNewRecord: TAction;
    acKLSEditRecord: TAction;
    acKLSOK: TAction;
    acKLSCancel: TAction;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    pm_GridColumn: TTBPopupMenu;
    TBItem5: TTBItem;
    e_FieldFilter: TTBEditItem;
    TBItem6: TTBItem;
    panelFilter_1: TPanel;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    btRefresh: TRxSpeedButton;
    acKLSDelRecord: TAction;
    TBItem7: TTBItem;
    t_kls_structureSTART_ORDER: TStringField;
    t_kls_structureNAME_FIELD: TStringField;
    lb_Filter_1: TLabel;
    ed_Filter_1: TEdit;
    PanelFilter_2: TPanel;
    PanelFilter_3: TPanel;
    ed_Filter_3: TEdit;
    lb_Filter_3: TLabel;
    ed_Filter_2: TEdit;
    lb_Filter_2: TLabel;
    t_kls_structureTABLE_NAME: TStringField;
    t_kls_structureNAME_FIELD_2: TStringField;
    t_kls_structureSORTBY: TIntegerField;
    t_kls_structureADD_FORM: TStringField;
    t_field_structureMASK: TStringField;
    t_kls_structureSEQUENCES: TStringField;
    t_kls_structureFILTER_1: TStringField;
    t_kls_structureFILTER_2: TStringField;
    t_kls_structureFILTER_3: TStringField;
    t_kls_structureFILTER_1_CAPTION: TStringField;
    t_kls_structureFILTER_2_CAPTION: TStringField;
    t_kls_structureFILTER_3_CAPTION: TStringField;
    t_field_structureDISPLAY_WIDTH: TIntegerField;
    t_kls_structureRIGHTS_ID: TStringField;
    t_kls_structureDATE_FIELD_BEGIN: TStringField;
    t_kls_structureDATE_FIELD_END: TStringField;
    q_Comments: TOracleDataSet;
    q_CommentsTABLE_NAME: TStringField;
    q_CommentsCOLUMN_NAME: TStringField;
    q_CommentsCOMMENTS: TStringField;
    t_field_structureFIELD_KIND: TIntegerField;
    t_kls_structureVIEW_TIME: TIntegerField;
    t_kls_structureCHILD_FORM: TStringField;
    acKLSChild: TAction;
    TBItem8: TTBItem;
    t_kls_structureCHILD_NAME: TStringField;
    acKlsMemoEdit: TAction;
    TBItem9: TTBItem;
    t_kls_structureFROZEN_COLS: TIntegerField;
    TBSeparatorItem2: TTBSeparatorItem;
    acKlsExportXLS: TAction;
    SaveDialog1: TSaveDialog;
    TBItem10: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    t_kls_structureMASTER_FIELD: TStringField;
    acKLSCopyRecord: TAction;
    TBItem11: TTBItem;
    PropStorageEh1: TPropStorageEh;
    TBSeparatorItem4: TTBSeparatorItem;
    TBItem12: TTBItem;
    TBItem13: TTBItem;
    TBItem14: TTBItem;
    TBItem15: TTBItem;
    TBItem16: TTBItem;
    TBItem17: TTBItem;
    TBItem18: TTBItem;
    TBSeparatorItem5: TTBSeparatorItem;
    constructor Create(AOwner: TComponent);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure t_klsBeforePost(DataSet: TDataSet);
    procedure t_klsBeforeDelete(DataSet: TDataSet);
    procedure grKlsMiscDblClick(Sender: TObject);
    procedure acKLSOKExecute(Sender: TObject);
    procedure e_FieldFilterAcceptText(Sender: TObject; var NewText: String;
      var Accept: Boolean);
    procedure TBItem5Click(Sender: TObject);
    procedure pm_GridColumnPopup(Sender: TObject);
    procedure t_klsFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure acKLSNewRecordExecute(Sender: TObject);
    procedure acKLSEditRecordExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure grKlsMiscKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btRefreshClick(Sender: TObject);
    procedure ed_Filter_1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_Filter_2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_Filter_3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure acKLSDelRecordExecute(Sender: TObject);
    procedure acKLSChildExecute(Sender: TObject);
    procedure acKlsMemoEditExecute(Sender: TObject);
    procedure acKlsExportXLSExecute(Sender: TObject);
    procedure t_klsAfterInsert(DataSet: TDataSet);
    procedure t_klsBeforeInsert(DataSet: TDataSet);
    procedure acKLSCopyRecordExecute(Sender: TObject);
    procedure acKLSCancelExecute(Sender: TObject);
  private
    { Private declarations }
    Filter_1:string;
    Filter_2:string;
    Filter_3:string;
    F_Where:string;
    F_DblClick:string;
    F_BeginDate:TDateTime;
    F_EndDate:TDateTime;
    MasterFieldValue:variant;
    AllFieldsValue:array [1..200] of variant;
    CopyValues:boolean;
    procedure PressKey(Key:Word);
    procedure ExecEditForm(Sender: TObject);
  public
    { Public declarations }
    FieldsFilter:TStringList;
    WhereStr:string;
  end;

var
  vKLS_ID:string;
  vFormStyle:TFormStyle;
  vIdToSeek:String;
  vNameToSeek:String;
  ResultName:String;
  ResultName2:String;
  vReadOnly:boolean;
  vBeginDate:TDateTime;
  vEndDate:TDateTime;
  vWhere:string;
  vDblClick:string;

procedure SetKLSParam(pKLS_ID:string;pDblClick:string='EDIT';pFormStyle:TFormStyle=fsNormal;pIdToSeek:string='';
                      pNameToSeek:string='';pReadOnly:boolean=false;pBeginDate:TDateTime=0;
                      pEndDate:TDateTime=0;pWhere:string='');

implementation

uses predpr, KlsAdd, KlsStruEd, MemoEdit, ReplDep, ForDB, main;

{$R *.dfm}

procedure SetKLSParam(pKLS_ID:string;pDblClick:string='EDIT';pFormStyle:TFormStyle=fsNormal;pIdToSeek:string='';
                      pNameToSeek:string='';pReadOnly:boolean=false;pBeginDate:TDateTime=0;
                      pEndDate:TDateTime=0;pWhere:string='');
Begin
  vKLS_ID:=pKLS_ID;
  vFormStyle:=pFormStyle;
  vIdToSeek:=pIdToSeek;
  vNameToSeek:=pNameToSeek;
  vReadOnly:=pReadOnly;
  vBeginDate:=pBeginDate;
  vEndDate:=pEndDate;
  vWhere:=pWhere;
  vDblClick:=pDblClick;
End;

constructor Tf_KLSMisc.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  if vFormStyle=fsNormal then FormStyle:=fsNormal
    else FormStyle:=fsMDIForm;
end;

procedure Tf_KlsMisc.FormShow(Sender: TObject);
var nf_s:TStringField;
    nf_i:TIntegerField;
    nf_f:TFloatField;
    nf_b:TBooleanField;
    nf_d:TDateTimeField;
    t_lookup:TOracleDataSet;
    t_source:TOracleDataSet;
    i:integer;
    IsFound:boolean;
begin
  Screen.Cursor := crHourGlass;

  F_DblClick:=vDblClick;
  F_BeginDate:=vBeginDate;
  F_EndDate:=vEndDate;
  F_Where:=vWhere;

  t_kls_structure.Close;
  t_kls_structure.SQL.Clear;
  t_kls_structure.SQL.Add('SELECT * FROM MASTER_KLS_STRUCTURE WHERE NLS_UPPER(id)='''+AnsiUpperCase(vKLS_ID)+'''');
  t_kls_structure.Open;

  t_field_structure.Close;
  t_field_structure.SQL.Clear;
  t_field_structure.SQL.Add('SELECT * FROM MASTER_KLS_FIELD_STRUCTURE WHERE NLS_UPPER(structure_id)='''+AnsiUpperCase(vKLS_ID)+'''');
  t_field_structure.SQL.Add('ORDER BY FIELD_ID');
  t_field_structure.Open;

  if t_kls_structureFILTER_1.AsString<>'' then
  Begin
    panelFilter_1.Visible:=true;
    lb_Filter_1.Caption:=t_kls_structureFILTER_1_CAPTION.AsString+':';
    Filter_1:=t_kls_structureFILTER_1.AsString;
  end;
  if t_kls_structureFILTER_2.AsString<>'' then
  Begin
    panelFilter_2.Visible:=true;
    lb_Filter_2.Caption:=t_kls_structureFILTER_2_CAPTION.AsString+':';
    Filter_2:=t_kls_structureFILTER_2.AsString;
  end;
  if t_kls_structureFILTER_3.AsString<>'' then
  Begin
    panelFilter_3.Visible:=true;
    lb_Filter_3.Caption:=t_kls_structureFILTER_3_CAPTION.AsString+':';
    Filter_3:=t_kls_structureFILTER_3.AsString;
  end;

  t_source:=TOracleDataSet.Create(Self);
  with t_source do
  Begin
    Session:=f_main.ora_Session;
    SQL.Add(t_KLS_STRUCTUREQUERY.AsString);
    Open;
  end;

  t_kls.Close;
  t_kls.SQL.Clear;
  t_kls.SQL.Add(t_KLS_STRUCTUREQUERY.AsString);
  if Pos('WHERE',AnsiUpperCase(t_KLS_STRUCTUREQUERY.AsString))<>0 then
    WhereStr:=' AND ' // ��� ��� �������
  else
    WhereStr:=' WHERE '; // ��� ��� �������
  t_kls.SQL.Add(WhereStr+' 1=1 '); // ��� ��� �������
  if t_KLS_STRUCTURESTART_ORDER.AsString<>'' then
    t_kls.SQL.Add('ORDER BY '+t_KLS_STRUCTURESTART_ORDER.AsString) // ��� ��� ORDER BY
  else
    t_kls.SQL.Add(''); // ��� ��� ORDER BY
  t_kls.Fields.Clear;

  for i:=1 to t_source.FieldDefs.Count do
  begin
    case t_source.FieldDefs[i-1].DataType of
      ftString:
        begin
          nf_s:=TStringField.Create(t_kls);
          nf_s.FieldName := t_source.FieldDefs[i-1].Name;
          nf_s.Name := 't_kls'+nf_s.FieldName;
          nf_s.Size:=t_source.FieldDefs[i-1].Size;
          nf_s.Index:=t_kls.FieldCount;
          nf_s.DataSet:=t_kls;
        end;
      ftDate,ftDateTime:
        begin
          nf_d:=TDateTimeField.Create(t_kls);
          nf_d.FieldName := t_source.FieldDefs[i-1].Name;
          nf_d.Name := 't_kls'+nf_d.FieldName;
//          nf_s.Size:=t_source.FieldDefs[i-1].Size;
          nf_d.Index:=t_kls.FieldCount;
          nf_d.DataSet:=t_kls;
        end;
 {     ftCurrency:t_kls.Fields.Add(TCurrencyField(nf));}
{      ftDate:t_kls.Fields.Add(TDateField(nf));}
{      ftDateTime:t_kls.Fields.Add(TDateTimeField(nf));}
      ftFloat:
        Begin
          nf_f:=TFloatField.Create(t_kls);
          nf_f.FieldName := t_source.FieldDefs[i-1].Name;
          nf_f.Name := 't_kls'+nf_f.FieldName;
          nf_f.Index:=t_kls.FieldCount;
          nf_f.DataSet:=t_kls;
        end;
      ftInteger:
        begin
          nf_i:=TIntegerField.Create(t_kls);
          nf_i.FieldName := t_source.FieldDefs[i-1].Name;
          nf_i.Name := 't_kls'+nf_i.FieldName;
          nf_i.Index:=t_kls.FieldCount;
          nf_i.DataSet:=t_kls;
        end;
{      ftLargeInt:{t_kls.Fields.Add(TLargeIntField(nf));}
{      ftMemo:
        begin
          TMemoField(nf).Size:=t_source.FieldDefs[i-1].Size;
          t_kls.Fields.Add(TMemoField(nf));
        end;}
 {     ftSmallint:{t_kls.Fields.Add(TSmallIntField(nf));}
 {     ftTime:{t_kls.Fields.Add(TTimeField(nf));}
 {     ftWideString:
        Begin
          TWideStringField(nf).Size:=t_source.FieldDefs[i-1].Size;
          t_kls.Fields.Add(TWideStringField(nf));
        end;}
{      ftWord:{t_kls.Fields.Add(TWordField(nf));}
      ftBoolean:
        begin
          nf_b:=TBooleanField.Create(t_kls);
          nf_b.FieldName := t_source.FieldDefs[i-1].Name;
          nf_b.Name := 't_kls'+nf_b.FieldName;
          nf_b.Index:=t_kls.FieldCount;
          nf_b.DataSet:=t_kls;
          nf_b.DisplayValues := '��;���';
        end;
    end;
    t_kls.FieldDefs.Update;
  end;
  t_source.Close;
  t_source.SQL.Clear;
  t_source.Free;

  // ���������� LOOKUP-�����
  T_FIELD_STRUCTURE.First;
  while not T_FIELD_STRUCTURE.Eof do
    begin
      If t_field_structureFIELD_KIND.AsInteger=1 Then
      Begin
        t_lookup:=TOracleDataSet.Create(Self);
        with t_lookup do
        Begin
          Session:=f_main.ora_Session;
          SQL.Add(t_field_structureLOOKUP_SOURCE_QUERY.AsString);
          t_lookup.Open;
          IF (FieldDefs.IndexOf(t_field_structureLOOKUP_KEY_FIELD.AsString)<>-1) then
          If (FieldDefs.IndexOf(t_field_structureLOOKUP_DISPLAY_FIELD.AsString)<>-1) then
          Begin
            nf_s:=TStringField.Create(t_kls);
            nf_s.FieldName := t_field_structureLOOKUP_TABLE.AsString+'_'+t_field_structureFIELD_NAME.AsString;
            nf_s.Name := nf_s.FieldName;
            nf_s.Index:=t_kls.FieldCount;
            nf_s.DataSet := t_kls;
            nf_s.Size:=t_lookup.FieldDefs.Find(t_field_structureLOOKUP_DISPLAY_FIELD.AsString).Size;
            nf_s.DisplayWidth:=nf_s.Size;
            if nf_s.DisplayWidth>50 then nf_s.DisplayWidth:=50;
            nf_s.LookupDataSet:=t_lookup;
            nf_s.FieldKind:=fkLookup;
            nf_s.KeyFields:=t_field_structureFIELD_NAME.AsString;
            nf_s.LookupKeyFields:=t_field_structureLOOKUP_KEY_FIELD.AsString;
            nf_s.LookupResultField:=t_field_structureLOOKUP_DISPLAY_FIELD.AsString;
          end;
        end;
      end;
      t_field_structure.Next;
    end;

  t_kls.UpdatingTable:=t_kls_structureTABLE_NAME.AsString;
  t_kls.ReadOnly:=vReadOnly;
  if t_kls_structureSEQUENCES.AsString<>'' then
  Begin
    t_kls.UniqueFields:=t_kls_structureUNIQUE_FIELD.AsString;
    t_kls.SequenceField.Sequence:=t_kls_structureSEQUENCES.AsString;
    t_kls.SequenceField.Field:=t_kls_structureUNIQUE_FIELD.AsString;
    t_kls.SequenceField.ApplyMoment:=amOnNewRecord;
  end;
{  t_kls.Open;}
  btRefreshClick(Sender);

  Caption:=t_kls_structureCAPTION.AsString;
  // ���������� GRID
  FieldsFilter:=TStringList.Create;
  FieldsFilter.Clear;
  T_FIELD_STRUCTURE.First;
  if not t_field_structure.Eof then
  Begin
    grKlsMisc.Columns.Clear;
    while not T_FIELD_STRUCTURE.Eof do
      begin
        if t_field_structureDISPLAY_WIDTH.AsInteger<>0 then
          t_kls.FieldByName(t_field_structureFIELD_NAME.AsString).DisplayWidth:=t_field_structureDISPLAY_WIDTH.AsInteger;
        with grKlsMisc.Columns.Add do
          begin
            If t_field_structureFIELD_KIND.AsInteger=1 Then // Lookup-����
            Begin
              FieldName:=t_field_structureLOOKUP_TABLE.AsString+'_'+t_field_structureFIELD_NAME.AsString;
            End
            Else
            Begin
              FieldName:=t_field_structureFIELD_NAME.AsString;
            End;
            If t_field_structureFIELD_KIND.AsInteger=2 Then // Checkbox-����
            Begin
              Checkboxes:=true;
              DblClickNextVal:=true;
              KeyList.Add('1');
              KeyList.Add('0');
            End;
            ReadOnly:=(t_field_structureFIELD_READONLY.AsInteger=1);
            Title.Caption:=t_field_structureFIELD_CAPTION.AsString;
            Title.TitleButton:=True;
            PopupMenu:=pm_GridColumn;
          end;
        FieldsFilter.Add('');
        t_field_structure.Next;
      end;
  end
  else
  Begin
    // ��� �������� ����� �������
    // ��������� ������������ �����������
    q_Comments.Close;
    q_Comments.SQL.Clear;
    q_Comments.SQL.Add('SELECT * FROM SYS.USER_COL_COMMENTS WHERE TABLE_NAME='''+t_kls_structureTABLE_NAME.AsString+'''');
    q_Comments.Open;

    for i:=1 to grKlsMisc.Columns.Count do
    Begin
      with grKlsMisc.Columns[i-1] do
      Begin
        if q_Comments.Locate('COLUMN_NAME',FieldName,[]) then
        Begin
          Title.Caption:=q_Comments.FieldByName('COMMENTS').AsString;
          Title.TitleButton:=True;
        End;
      End;
    End;
    q_Comments.Close;
    q_Comments.SQL.Clear;
  End;

  if FormStyle=fsNormal then
    begin
      IsFound:=false;
      If vIdToSeek<>'' then
        try
          IF t_kls.FieldByName(t_kls_structureUNIQUE_FIELD.AsString).DataType in [ftString,ftMemo] then
             IsFound:=t_kls.Locate(t_kls_structureUNIQUE_FIELD.AsString,vIdToSeek,[]);
          IF t_kls.FieldByName(t_kls_structureUNIQUE_FIELD.AsString).DataType in [ftInteger,ftFloat,ftSmallint,ftWord,ftCurrency,ftBCD] then
             IsFound:=t_kls.Locate(t_kls_structureUNIQUE_FIELD.AsString,StrToInt(vIdToSeek),[]);
        except
          t_kls.First;
        end
      else
        t_kls.First;
      if NOT IsFound then
      Begin
        vNameToSeek:=StringReplace('*'+AnsiUpperCase(vNameToSeek),' ','*',[rfReplaceAll]);
        vNameToSeek:=StringReplace(vNameToSeek,'"','*',[rfReplaceAll]);
        vNameToSeek:=StringReplace(vNameToSeek,'''','*',[rfReplaceAll]);
        if t_kls_structureFILTER_1.AsString<>'' then
        Begin
          if t_kls_structureFILTER_1.AsString=t_kls_structureNAME_FIELD.AsString then
          begin
            ed_Filter_1.Text:=vNameToSeek;
          end;
        end;
        if t_kls_structureFILTER_2.AsString<>'' then
        Begin
          if t_kls_structureFILTER_2.AsString=t_kls_structureNAME_FIELD.AsString then
          begin
            ed_Filter_2.Text:=vNameToSeek;
          end;
        end;
        if t_kls_structureFILTER_3.AsString<>'' then
        Begin
          if t_kls_structureFILTER_3.AsString=t_kls_structureNAME_FIELD.AsString then
          begin
            ed_Filter_3.Text:=vNameToSeek;
          end;
        end;
      end;
      acKLSOK.Visible:=True;
      acKLSOK.Enabled:=True;
      acKLSCancel.Visible:=True;
      acKLSCancel.Enabled:=True;
    end
  else
    begin
      acKLSOK.Visible:=False;
      acKLSOK.Enabled:=False;
      acKLSCancel.Visible:=False;
      acKLSCancel.Enabled:=False;
    end;

  if t_kls.ReadOnly then
  Begin
    acKLSNewRecord.Visible:=false;
    acKLSNewRecord.Enabled:=false;
    acKLSEditRecord.Visible:=false;
    acKLSEditRecord.Enabled:=false;
    acKLSDelRecord.Visible:=false;
    acKLSDelRecord.Enabled:=false;
    grKlsMisc.OptionsEh:=grKlsMisc.OptionsEh+[dghPreferIncSearch];
  End;

  if t_kls_structureFROZEN_COLS.AsInteger>0 then
    grKlsMisc.FrozenCols:=t_kls_structureFROZEN_COLS.AsInteger;

  if t_kls_structureCHILD_FORM.AsString='' then
  Begin
    acKLSChild.Visible:=false;
    acKLSChild.Enabled:=false;
  End;

  if t_kls_structureCHILD_NAME.AsString<>'' then
  Begin
    acKLSChild.Caption:=t_kls_structureCHILD_NAME.AsString;
  End;

  vBeginDate:=0;
  vEndDate:=0;
  vReadOnly:=false;
  vWhere:='';
  Screen.Cursor := crDefault;
end;

procedure Tf_KlsMisc.FormClose(Sender: TObject; var Action: TCloseAction);
var i:integer;
begin
  vNameToSeek:='';
  t_kls.Close;
  for i:=t_kls.FieldCount-1 downto 1 do
    begin
      if t_kls.Fields[i].FieldKind=fkLookup then t_kls.Fields[i].LookupDataSet.Free;
      t_kls.Fields[i].Free;
    end;
  t_kls_structure.Close;
  t_kls_structure.SQL.Clear;

  t_field_structure.Close;
  t_field_structure.SQL.Clear;
{  Ora_session.LogOff;}
  if FormStyle=fsMDIChild
    then Action:=caFree;
end;

procedure Tf_KlsMisc.t_klsBeforePost(DataSet: TDataSet);
var
  S:String;
  New_ID:integer;
  Pos1,Pos2:Integer;
  FName:String;
begin
  inherited;

  S:=AnsiUpperCase(t_kls_structureUNIQID_UPDATE_QUERY.AsString);

  if DataSet.State=dsInsert then
  If t_kls_structureUNIQID_SELECT_QUERY.AsString<>'' then
  If S<>'' then
  if Pos(':NEW_ID:',S)<>0 then
  Begin
    // ���������� ����� ID
    New_ID:=0;
    with ADOQuery1 do
    try
      SQL.Clear;
      SQL.Add(t_kls_structureUNIQID_SELECT_QUERY.AsString);
      Open;
      If not Eof then New_ID:=Fields[0].AsInteger;
      Close;
      New_ID:=New_ID+1;
      SQL.Clear;
      Pos1:=Pos(':NEW_ID:',S);
      System.Delete(S,Pos1,8);
      IF t_kls.FieldByName(t_kls_structureUNIQUE_FIELD.AsString).DataType in [ftString,ftMemo] then
         System.Insert(''''+IntToStr(New_ID)+'''',S,Pos1);
      IF t_kls.FieldByName(t_kls_structureUNIQUE_FIELD.AsString).DataType in [ftInteger,ftFloat,ftSmallint,ftWord,ftCurrency,ftBCD] then
         System.Insert(IntToStr(New_ID),S,Pos1);
      SQL.Add(S);
      ExecSQL;
      IF t_kls.FieldByName(t_kls_structureUNIQUE_FIELD.AsString).DataType in [ftString,ftMemo] then
        t_kls.FieldByName(t_kls_structureUNIQUE_FIELD.AsString).AsString:=''''+IntToStr(New_ID)+'''';
      IF t_kls.FieldByName(t_kls_structureUNIQUE_FIELD.AsString).DataType in [ftInteger,ftFloat,ftSmallint,ftWord,ftCurrency,ftBCD] then
        t_kls.FieldByName(t_kls_structureUNIQUE_FIELD.AsString).AsInteger:=New_ID;
    except
      New_ID:=0;
    end;
  end;

  if DataSet.State=dsInsert then
    S:=t_kls_structureFOX_INSERT_QUERY.AsString;
  if DataSet.State=dsEdit then
    S:=t_kls_structureFOX_UPDATE_QUERY.AsString;

  IF S<>'' Then
  Begin
    while Pos(':',S)<>0 do
      begin
        Pos1:=Pos(':',S);
        Delete(S,Pos1,1);
        Pos2:=Pos(':',S);
        if Pos2<>0 then
          begin
            Delete(S,Pos2,1);
            FName:=ANSIUpperCase(Copy(S,Pos1,Pos2-Pos1));
            Delete(S,Pos1,Pos2-Pos1);
            if Copy(FName,1,4)<>'OLD_' then
              begin
                if t_kls.FieldByName(FName).DataType in [ftString,ftMemo] then
                  Insert(''''+t_kls.FieldByName(FName).AsString+'''',S,Pos1);
                if t_kls.FieldByName(FName).DataType in [ftInteger,ftFloat,ftSmallint,ftWord,ftCurrency,ftBCD] then
                  Insert(t_kls.FieldByName(FName).AsString,S,Pos1);
                if t_kls.FieldByName(FName).DataType in [ftDate,ftTime,ftDateTime] then
                  Insert('{'+FormatDateTime('mm/dd/yyyy',t_kls.FieldByName(FName).AsDateTime)+'}',S,Pos1);
              end
            else
              begin
                delete(FName,1,4);
                if t_kls.FieldByName(FName).DataType in [ftString,ftMemo] then
                  Insert(''''+t_kls.FieldByName(FName).OldValue+'''',S,Pos1);
                if t_kls.FieldByName(FName).DataType in [ftInteger,ftFloat,ftSmallint,ftWord,ftCurrency,ftBCD] then
                  Insert(FloatToStr(t_kls.FieldByName(FName).OldValue),S,Pos1);
                if t_kls.FieldByName(FName).DataType in [ftDate,ftTime,ftDateTime] then
                  Insert('{'+FormatDateTime('mm/dd/yyyy',t_kls.FieldByName(FName).OldValue)+'}',S,Pos1);
              end
          end;
      end;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add(S);
    ADOQuery1.ExecSQL;
  end;
end;

procedure Tf_KlsMisc.t_klsBeforeDelete(DataSet: TDataSet);
var
  S:String;
  Pos1,Pos2:Integer;
  FName:String;
begin
  inherited;
  if Application.MessageBox('������� ������?','��������!',MB_YESNO)=IDNO then
  Begin
    Abort;
    exit;
  End;

  S:=t_kls_structureFOX_DELETE_QUERY.AsString;
  IF S<>'' then
  Begin
    while Pos(':',S)<>0 do
      begin
        Pos1:=Pos(':',S);
        Delete(S,Pos1,1);
        Pos2:=Pos(':',S);
        if Pos2<>0 then
          begin
            Delete(S,Pos2,1);
            FName:=ANSIUpperCase(Copy(S,Pos1,Pos2-Pos1));
            Delete(S,Pos1,Pos2-Pos1);
            if Copy(FName,1,4)<>'OLD_' then
              begin
                if t_kls.FieldByName(FName).DataType in [ftString,ftMemo] then
                  Insert(''''+t_kls.FieldByName(FName).AsString+'''',S,Pos1);
                if t_kls.FieldByName(FName).DataType in [ftInteger,ftFloat,ftSmallint,ftWord,ftCurrency,ftBCD] then
                  Insert(t_kls.FieldByName(FName).AsString,S,Pos1);
                if t_kls.FieldByName(FName).DataType in [ftDate,ftTime,ftDateTime] then
                  Insert('{'+FormatDateTime('mm/dd/yyyy',t_kls.FieldByName(FName).AsDateTime)+'}',S,Pos1);
              end
            else
              begin
                delete(FName,1,4);
                if t_kls.FieldByName(FName).DataType in [ftString,ftMemo] then
                  Insert(''''+t_kls.FieldByName(FName).OldValue+'''',S,Pos1);
                if t_kls.FieldByName(FName).DataType in [ftInteger,ftFloat,ftSmallint,ftWord,ftCurrency,ftBCD] then
                  Insert(FloatToStr(t_kls.FieldByName(FName).OldValue),S,Pos1);
                if t_kls.FieldByName(FName).DataType in [ftDate,ftTime,ftDateTime] then
                  Insert('{'+FormatDateTime('mm/dd/yyyy',t_kls.FieldByName(FName).OldValue)+'}',S,Pos1);
              end
          end;
      end;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add(S);
    ADOQuery1.ExecSQL;
  end;
end;

procedure Tf_KlsMisc.grKlsMiscDblClick(Sender: TObject);
begin
  inherited;
  if f_DblClick='CHOOSE' then acKLSOKExecute(Self)
  else acKlsEditRecordExecute(Sender);
end;

procedure Tf_KlsMisc.acKLSOKExecute(Sender: TObject);
begin
  vIdToSeek:=t_kls.FieldByName(t_kls_structureUNIQUE_FIELD.AsString).AsString;
  if t_kls_structureNAME_FIELD.AsString<>'' then
  Begin
    ResultName:=t_kls.FieldByName(t_kls_structureNAME_FIELD.AsString).AsString;
  end
  else
  Begin
    ResultName:='';
  end;
  if t_kls_structureNAME_FIELD_2.AsString<>'' then
  Begin
    ResultName2:=t_kls.FieldByName(t_kls_structureNAME_FIELD_2.AsString).AsString
  end
  else
  Begin
    ResultName2:='';
  end;
  ModalResult:=mrOk
end;

procedure Tf_KlsMisc.e_FieldFilterAcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  grKlsMisc.Columns[grKlsMisc.Col-1].Title.Font.Style:=
    grKlsMisc.Columns[grKlsMisc.Col-1].Title.Font.Style+[fsBold];
  FieldsFilter[grKlsMisc.Col-1]:=NewText;
  t_kls.Filtered:=True;
  Accept:=True;
end;

procedure Tf_KlsMisc.TBItem5Click(Sender: TObject);
var
  I:Integer;
  Filtered:Boolean;
begin
  Filtered:=False;
  grKlsMisc.Columns[grKlsMisc.Col-1].Title.Font.Style:=
    grKlsMisc.Columns[grKlsMisc.Col-1].Title.Font.Style-[fsBold];
  FieldsFilter[grKlsMisc.Col-1]:='';
  for i:=0 to FieldsFilter.Count-1 do
    if FieldsFilter[i]<>'' then Filtered:=True;
  t_kls.Filtered:=Filtered;
  t_kls.Refresh;
end;

procedure Tf_KlsMisc.pm_GridColumnPopup(Sender: TObject);
begin
  if grKlsMisc.Columns[grKlsMisc.Col-1].Field.FieldKind=fkLookup then
    e_FieldFilter.Enabled:=False
  else
    e_FieldFilter.Enabled:=True;
  e_FieldFilter.Text:=FieldsFilter[grKlsMisc.Col-1];
end;

procedure Tf_KlsMisc.t_klsFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
  I:Integer;
  FieldValue:String;
begin
  Accept:=True;
  for i:=0 to FieldsFilter.Count-1 do
    if FieldsFilter[i]<>'' then
      begin
//        if grKlsMisc.Columns[i].Field.FieldKind=fkLookup then
//          FieldValue:=grKlsMisc.Columns[i].Field.DisplayText
//          FieldValue:=grKlsMisc.Columns[i].Field.LookupDataSet.FieldByName(grKlsMisc.Columns[i].Field.LookupResultField).AsString
//        else
          FieldValue:=grKlsMisc.Columns[i].Field.AsString;
//        FieldValue:=DataSet.fieldbyname(grKlsMisc.Columns[i].Field.FieldName).AsString;
        case grKlsMisc.Columns[i].Field.DataType of
          ftString:
            Accept:=Accept and (Pos(AnsiUpperCase(FieldsFilter[i]),AnsiUpperCase(FieldValue))<>0);
          ftFloat,ftInteger:
            Accept:=Accept and (FieldsFilter[i]=FieldValue);
          ftDate,ftDateTime:
            Accept:=Accept and (StrToDateTime(FieldsFilter[i])=grKlsMisc.Columns[i].Field.AsDateTime);
        end;
      end;
end;

procedure tf_KlsMisc.ExecEditForm(Sender: TObject);
var f:TForm;
    FormName:string;
Begin
  FormName:=t_kls_structureADD_FORM.AsString;
  if FormName='PREDPR' then
  Begin
    f:=tf_Predpr.Create(Self);
    with TF_Predpr(f) do
    Begin
      t_kls_data:=t_kls;
    end;
  End
  Else
    if FormName='STRUCTURE' then
    Begin
      f:=tf_KlsStruEd.Create(Self);
      with TF_KlsStruEd(f) do
      Begin
        t_kls_data:=t_kls;
      end;
    End
    else
      Begin
        f:=TF_KlsAdd.Create(Self);
        with TF_KlsAdd(f) do
        Begin
          t_kls_stru:=t_kls_structure;
          t_field_stru:=t_field_structure;
          t_kls_data:=t_kls;
        end;
      End;

  with f do
  begin
    if ShowModal=mrOk then
    begin
      if t_kls.State in [dsEdit,dsInsert] then t_kls.Post;
//      f_main.ReQuery(t_kls,true);
    end
    else
    begin
      if t_kls.State in [dsEdit,dsInsert] then t_kls.Cancel;
    end;
    Free;
  end;
End;

procedure Tf_KlsMisc.acKLSNewRecordExecute(Sender: TObject);
begin
  if t_kls.State in [dsEdit,dsInsert] then t_kls.Post;
  t_kls.Insert;
end;

procedure Tf_KlsMisc.acKLSEditRecordExecute(Sender: TObject);
begin
  if not t_kls.eof then
  Begin
    if t_kls.State in [dsEdit,dsInsert] then t_kls.Post;
    t_kls.Edit;
    ExecEditForm(Sender);
  End;
end;

procedure Tf_KlsMisc.FormCreate(Sender: TObject);
begin
  f_db.SetUserGrants(KLSActionManager);
end;

procedure Tf_KlsMisc.grKlsMiscKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=VK_RETURN) AND t_kls.ReadOnly then acKLSOKExecute(Self);
end;

procedure Tf_KlsMisc.PressKey(Key:Word);
Begin
  if (Key=VK_RETURN) Then btRefreshClick(Self);
end;

procedure Tf_KlsMisc.btRefreshClick(Sender: TObject);
var s,AndS:string;
    FilterTxt:string;
begin
  AndS:=WhereStr;
  s:='';
  with t_kls do
  try
    if (t_kls_structureDATE_FIELD_BEGIN.AsString<>'') and (F_EndDate>0) then
    Begin
      s:=s+AndS+t_kls_structureDATE_FIELD_BEGIN.AsString+'<TO_DATE('''+FormatDateTime('dd.mm.yyyy',F_EndDate)+''',''dd.mm.yyyy'')+1';
      AndS:=' AND ';
    End;

    if (t_kls_structureDATE_FIELD_END.AsString<>'') and (F_BeginDate>0) then
    Begin
      s:=s+AndS+t_kls_structureDATE_FIELD_END.AsString+'>TO_DATE('''+FormatDateTime('dd.mm.yyyy',F_BeginDate)+''',''dd.mm.yyyy'')-1';
      AndS:=' AND ';
    End;

    FilterTxt:=StringReplace(ed_Filter_1.Text,'*','%',[rfReplaceAll]);
    If FilterTxt<>'' then
    Begin
      If FilterTxt[Length(FilterTxt)]<>'%' then FilterTxt:=FilterTxt+'%';
      s:=s+AndS+'(NLS_UPPER('+Filter_1+') LIKE '''+AnsiUpperCase(FilterTxt)+''') ';
      AndS:=' AND ';
    end;

    FilterTxt:=StringReplace(ed_Filter_2.Text,'*','%',[rfReplaceAll]);
    If FilterTxt<>'' then
    Begin
      If FilterTxt[Length(FilterTxt)]<>'%' then FilterTxt:=FilterTxt+'%';
      s:=s+AndS+'(NLS_UPPER('+Filter_2+') LIKE '''+AnsiUpperCase(FilterTxt)+''') ';
      AndS:=' AND ';
    end;

    FilterTxt:=StringReplace(ed_Filter_3.Text,'*','%',[rfReplaceAll]);
    If FilterTxt<>'' then
    Begin
      If FilterTxt[Length(FilterTxt)]<>'%' then FilterTxt:=FilterTxt+'%';
      s:=s+AndS+'(NLS_UPPER('+Filter_3+') LIKE '''+AnsiUpperCase(FilterTxt)+''') ';
      AndS:=' AND ';
    end;

    If F_Where<>'' then
    Begin
      s:=s+AndS+F_Where;
      AndS:=' AND ';
    End;

    if s<>WhereStr then SQL[t_kls.SQL.Count-2]:=s;

    f_db.ReQuery(t_kls,True);
  finally
    if Self.Active then grKlsMisc.SetFocus;
  end
end;

procedure Tf_KlsMisc.ed_Filter_1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  PressKey(Key);
end;

procedure Tf_KlsMisc.ed_Filter_2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  PressKey(Key);
end;

procedure Tf_KlsMisc.ed_Filter_3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  PressKey(Key);
end;

procedure Tf_KlsMisc.acKLSDelRecordExecute(Sender: TObject);
begin
  t_kls.Delete;
end;

procedure Tf_KlsMisc.acKLSChildExecute(Sender: TObject);
var FormName:string;
Begin
  if t_kls.State in [dsEdit,dsInsert] then t_kls.Post;
  FormName:=t_kls_structureCHILD_FORM.AsString;
  if FormName='REPORTS_PARAM' then
  Begin
    KlsMisc2.SetKLSParam('REPORTS_PARAM','EDIT',fsNormal,'','',false,0,0,'REPORTS_ID='''+t_kls.FieldByName('ID').AsString+'''');
    with tf_KlsMisc.Create(Self) do
    begin
      ShowModal;
      Free;
    end;
  End;
  if FormName='REPL_DEPENDENCE' then
  Begin
    with tf_ReplDep.Create(Self) do
    begin
      ParentId:=t_kls.FieldByName('ID').AsInteger;
      ParentName:=t_kls.FieldByName('NAME').AsString;
      ShowModal;
      Free;
    end;
  End;
end;

procedure Tf_KlsMisc.acKlsMemoEditExecute(Sender: TObject);
begin
  with grKlsMisc do
  Begin
    if NOT t_kls.Eof then
    with tf_MemoEdit.Create(Self) do
    begin
      EditValue:=SelectedField.AsString;
      EditDescription:='�������������� '+SelectedField.DisplayName;
      ShowModal;
      if (ModalResult=mrOk) and (NOT t_kls.ReadOnly) and (NOT SelectedField.ReadOnly) then
      Begin
        if t_kls.State=dsBrowse then t_kls.Edit;
        SelectedField.AsString:=EditValue;
        t_kls.Post;
      End;
      Free;
    end;
  end;

end;

procedure Tf_KlsMisc.acKlsExportXLSExecute(Sender: TObject);
begin
  if SaveDialog1.Execute then
    if not FileExists(SaveDialog1.FileName) then
      begin
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,grKlsMisc,SaveDialog1.FileName,True);
        FileExecute(SaveDialog1.FileName,'','',esMaximized);
      end
    else
      if MessageDlg('���� ��� ����������! ����������?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,grKlsMisc,SaveDialog1.FileName,True);
          FileExecute(SaveDialog1.FileName,'','',esMaximized);
        end
end;

procedure Tf_KlsMisc.t_klsAfterInsert(DataSet: TDataSet);
var i:integer;
begin
  if CopyValues then
  Begin
    for i:=1 to t_kls.Fields.Count do
    Begin
      if (t_kls.Fields[i-1].FieldName<>t_KLS_STRUCTUREUNIQUE_FIELD.AsString) and
         (t_kls.Fields[i-1].FieldName<>'ROWID') and
         (t_kls.Fields[i-1].FieldName<>'ROW_ID') then
        t_kls.Fields[i-1].AsVariant:=AllFieldsValue[i];
    End;
    CopyValues:=false;
  End;
  if t_KLS_STRUCTUREMASTER_FIELD.AsString<>'' then
  Begin
    t_kls.FieldByName(t_KLS_STRUCTUREMASTER_FIELD.AsString).AsVariant:=MasterFieldValue;
  End;
  ExecEditForm(Self);
end;

procedure Tf_KlsMisc.t_klsBeforeInsert(DataSet: TDataSet);
var i:integer;
begin
  if CopyValues then
  Begin
    for i:=1 to t_kls.Fields.Count do
    Begin
      AllFieldsValue[i]:=t_kls.Fields[i-1].AsVariant;
    End;
  End;
  if t_KLS_STRUCTUREMASTER_FIELD.AsString<>'' then
  Begin
    MasterFieldValue:=t_kls.FieldByName(t_KLS_STRUCTUREMASTER_FIELD.AsString).AsVariant;
  End;
end;

procedure Tf_KlsMisc.acKLSCopyRecordExecute(Sender: TObject);
begin
  if t_kls.State in [dsEdit,dsInsert] then t_kls.Post;
  CopyValues:=true;
  t_kls.Insert;
end;

procedure Tf_KlsMisc.acKLSCancelExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

end.
