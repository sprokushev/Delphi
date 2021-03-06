unit KlsLinks;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, DB, OracleData, Oracle,mdiform, ADODB, TB2Item,
  ActnList, ActnMan, TB2Dock, TB2Toolbar, TB2ExtItems, Menus,
  EhLibDOA,XPStyleActnCtrls, StdCtrls, RXCtrls, ExtCtrls, DBCtrls,
  PropFilerEh, PropStorageEh, GridsEh, DBGridEhGrouping;

type
  Tf_KlsLinks = class(TForm)
    t_kls_stru_left: TOracleDataSet;
    t_kls_stru_leftID: TStringField;
    t_kls_stru_leftQUERY: TStringField;
    t_kls_stru_leftCAPTION: TStringField;
    t_kls_stru_leftUNIQUE_FIELD: TStringField;
    t_field_stru_left: TOracleDataSet;
    t_field_stru_leftSTRUCTURE_ID: TStringField;
    t_field_stru_leftFIELD_ID: TIntegerField;
    t_field_stru_leftFIELD_NAME: TStringField;
    t_field_stru_leftFIELD_CAPTION: TStringField;
    t_field_stru_leftLOOKUP_SOURCE_QUERY: TStringField;
    t_field_stru_leftLOOKUP_DISPLAY_FIELD: TStringField;
    t_field_stru_leftLOOKUP_KEY_FIELD: TStringField;
    t_field_stru_leftLOOKUP_TABLE: TStringField;
    t_kls_left: TOracleDataSet;
    ds_kls_left: TDataSource;
    t_kls_stru_leftFOX_UPDATE_QUERY: TStringField;
    t_kls_stru_leftFOX_INSERT_QUERY: TStringField;
    t_kls_stru_leftFOX_DELETE_QUERY: TStringField;
    t_kls_stru_leftUNIQID_SELECT_QUERY: TStringField;
    t_kls_stru_leftUNIQID_UPDATE_QUERY: TStringField;
    t_field_stru_leftFIELD_READONLY: TIntegerField;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    ActionManager1: TActionManager;
    acKLSNewLink: TAction;
    TBSeparatorItem1: TTBSeparatorItem;
    TBItem4: TTBItem;
    pm_GridColumnLeft: TTBPopupMenu;
    TBItem5: TTBItem;
    e_FieldFilterLeft: TTBEditItem;
    TBItem6: TTBItem;
    acKLSDelLink: TAction;
    TBItem7: TTBItem;
    t_kls_stru_leftSTART_ORDER: TStringField;
    t_kls_stru_leftNAME_FIELD: TStringField;
    t_kls_stru_leftTABLE_NAME: TStringField;
    t_kls_stru_leftNAME_FIELD_2: TStringField;
    t_kls_stru_leftSORTBY: TIntegerField;
    t_kls_stru_leftADD_FORM: TStringField;
    t_field_stru_leftMASK: TStringField;
    t_kls_stru_leftSEQUENCES: TStringField;
    t_kls_stru_leftFILTER_1: TStringField;
    t_kls_stru_leftFILTER_2: TStringField;
    t_kls_stru_leftFILTER_3: TStringField;
    t_kls_stru_leftFILTER_1_CAPTION: TStringField;
    t_kls_stru_leftFILTER_2_CAPTION: TStringField;
    t_kls_stru_leftFILTER_3_CAPTION: TStringField;
    t_field_stru_leftDISPLAY_WIDTH: TIntegerField;
    Panel1: TPanel;
    PanelLeft: TPanel;
    btRefreshLeft: TRxSpeedButton;
    DBNavLeft: TDBNavigator;
    ed_Filter_Left: TEdit;
    gridLeftList: TDBGridEh;
    Splitter2: TSplitter;
    gridLeftLinks: TDBGridEh;
    Panel2: TPanel;
    PanelRight: TPanel;
    btRefreshRight: TRxSpeedButton;
    DBNavRight: TDBNavigator;
    ed_Filter_Right: TEdit;
    gridRightLinks: TDBGridEh;
    gridRightList: TDBGridEh;
    Splitter4: TSplitter;
    rb1_1: TRadioButton;
    rbM_1: TRadioButton;
    rbM_M: TRadioButton;
    pm_GridColumnRight: TTBPopupMenu;
    TBItem1: TTBItem;
    e_FieldFilterRight: TTBEditItem;
    TBItem2: TTBItem;
    t_kls_right: TOracleDataSet;
    ds_kls_right: TDataSource;
    t_field_stru_right: TOracleDataSet;
    t_kls_stru_right: TOracleDataSet;
    t_links: TOracleDataSet;
    t_linksID: TStringField;
    t_linksCAPTION: TStringField;
    t_linksTABLE_LINK: TStringField;
    t_linksTABLE_LINK_PK: TStringField;
    t_linksTABLE_LINK_TYPE: TStringField;
    t_linksTABLE_LINK_ONE_PK: TStringField;
    t_linksTABLE_ONE: TStringField;
    t_linksTABLE_LINK_TWO_PK: TStringField;
    t_linksTABLE_TWO: TStringField;
    t_kls_stru_rightID: TStringField;
    t_kls_stru_rightTABLE_NAME: TStringField;
    t_kls_stru_rightCAPTION: TStringField;
    t_kls_stru_rightSORTBY: TIntegerField;
    t_kls_stru_rightQUERY: TStringField;
    t_kls_stru_rightUNIQUE_FIELD: TStringField;
    t_kls_stru_rightFOX_UPDATE_QUERY: TStringField;
    t_kls_stru_rightFOX_INSERT_QUERY: TStringField;
    t_kls_stru_rightFOX_DELETE_QUERY: TStringField;
    t_kls_stru_rightUNIQID_SELECT_QUERY: TStringField;
    t_kls_stru_rightUNIQID_UPDATE_QUERY: TStringField;
    t_kls_stru_rightSTART_ORDER: TStringField;
    t_kls_stru_rightNAME_FIELD: TStringField;
    t_kls_stru_rightNAME_FIELD_2: TStringField;
    t_kls_stru_rightADD_FORM: TStringField;
    t_kls_stru_rightSEQUENCES: TStringField;
    t_kls_stru_rightFILTER_1: TStringField;
    t_kls_stru_rightFILTER_1_CAPTION: TStringField;
    t_kls_stru_rightFILTER_2: TStringField;
    t_kls_stru_rightFILTER_2_CAPTION: TStringField;
    t_kls_stru_rightFILTER_3: TStringField;
    t_kls_stru_rightFILTER_3_CAPTION: TStringField;
    t_kls_stru_rightRIGHTS_ID: TStringField;
    t_field_stru_rightSTRUCTURE_ID: TStringField;
    t_field_stru_rightFIELD_ID: TIntegerField;
    t_field_stru_rightFIELD_NAME: TStringField;
    t_field_stru_rightFIELD_CAPTION: TStringField;
    t_field_stru_rightLOOKUP_SOURCE_QUERY: TStringField;
    t_field_stru_rightLOOKUP_DISPLAY_FIELD: TStringField;
    t_field_stru_rightLOOKUP_KEY_FIELD: TStringField;
    t_field_stru_rightLOOKUP_TABLE: TStringField;
    t_field_stru_rightFIELD_READONLY: TIntegerField;
    t_field_stru_rightMASK: TStringField;
    t_field_stru_rightDISPLAY_WIDTH: TIntegerField;
    Splitter1: TSplitter;
    t_Link_Left: TOracleDataSet;
    ds_Link_Left: TDataSource;
    t_Link_Right: TOracleDataSet;
    ds_Link_Right: TDataSource;
    lbLeft: TLabel;
    lbRight: TLabel;
    cb_NoLinkLeft: TCheckBox;
    cb_NoLinkRight: TCheckBox;
    acRefreshLeft: TAction;
    acRefreshRight: TAction;
    q_tmp: TOracleDataSet;
    t_linksTABLE_LINK_PK_TYPE: TStringField;
    t_kls_stru_leftRIGHTS_ID: TStringField;
    t_kls_stru_leftDATE_FIELD_BEGIN: TStringField;
    t_kls_stru_leftDATE_FIELD_END: TStringField;
    t_kls_stru_rightDATE_FIELD_BEGIN: TStringField;
    t_kls_stru_rightDATE_FIELD_END: TStringField;
    t_linksSORTBY: TFloatField;
    t_linksQUERY_LINK: TStringField;
    t_field_stru_leftFIELD_KIND: TIntegerField;
    t_field_stru_rightFIELD_KIND: TIntegerField;
    TBItem3: TTBItem;
    TBItem8: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBItem9: TTBItem;
    TBItem10: TTBItem;
    PropStorageEh1: TPropStorageEh;
    constructor Create(AOwner: TComponent);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure e_FieldFilterLeftAcceptText(Sender: TObject; var NewText: String;
      var Accept: Boolean);
    procedure TBItem5Click(Sender: TObject);
    procedure pm_GridColumnLeftPopup(Sender: TObject);
    procedure t_kls_leftFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ed_Filter_LeftKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pm_GridColumnRightPopup(Sender: TObject);
    procedure e_FieldFilterRightAcceptText(Sender: TObject;
      var NewText: String; var Accept: Boolean);
    procedure TBItem2Click(Sender: TObject);
    procedure ed_Filter_RightKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure t_kls_rightFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure FormResize(Sender: TObject);
    procedure rb1_1Click(Sender: TObject);
    procedure t_kls_leftAfterScroll(DataSet: TDataSet);
    procedure t_Link_LeftAfterScroll(DataSet: TDataSet);
    procedure t_kls_rightAfterScroll(DataSet: TDataSet);
    procedure acKLSNewLinkExecute(Sender: TObject);
    procedure acRefreshLeftExecute(Sender: TObject);
    procedure acRefreshRightExecute(Sender: TObject);
    procedure acKLSDelLinkExecute(Sender: TObject);
    procedure TBItem3Click(Sender: TObject);
    procedure TBItem8Click(Sender: TObject);
    procedure TBItem9Click(Sender: TObject);
    procedure TBItem10Click(Sender: TObject);
  private
    { Private declarations }
    Filter_Left:string;
    Filter_Right:string;
    FieldsFilterLeft:TStringList;
    FieldsFilterRight:TStringList;
    WhereStrLeft:string;
    WhereStrRight:string;
    LinkLeftPK:string;
    LinkRightPK:string;
    TableLeft:string;
    TableRight:string;
    IsInitial:boolean;
    procedure PressKeyLeft(Key:Word);
    procedure PressKeyRight(Key:Word);
    procedure DelCurrentLink;
  public
    { Public declarations }
  end;

var
  f_KlsLinks: Tf_KlsLinks;
  LINK_ID:string;
  IdToSeek:string;
  AFormStyle:TFormStyle;

implementation

uses predpr, KlsAdd, ForDB, main;

{$R *.dfm}
constructor Tf_KlsLinks.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  if AFormStyle=fsNormal then FormStyle:=fsNormal
    else FormStyle:=fsMDIForm;
end;

procedure Tf_KlsLinks.FormShow(Sender: TObject);
var nf_s:TStringField;
    nf_i:TIntegerField;
    nf_f:TFloatField;
    nf_d:TDateTimeField;
    t_lookup:TOracleDataSet;
    t_source:TOracleDataSet;
    i:integer;
begin
  IsInitial:=true;

  t_links.Close;
  t_links.SQL[1]:='WHERE NLS_UPPER(ID)='''+AnsiUpperCase(LINK_ID)+'''';
  t_links.Open;
  Caption:=t_linksCAPTION.AsString;

  t_kls_stru_left.Close;
  t_kls_stru_right.Close;
  LinkLeftPK:=t_linksTABLE_LINK_ONE_PK.AsString;
  LinkRightPK:=t_linksTABLE_LINK_TWO_PK.AsString;
  TableLeft:=t_linksTABLE_ONE.AsString;
  TableRight:=t_linksTABLE_TWO.AsString;
  t_kls_stru_left.SQL[1]:='WHERE NLS_UPPER(ID)='''+AnsiUpperCase(TableLeft)+'''';
  t_kls_stru_right.SQL[1]:='WHERE NLS_UPPER(ID)='''+AnsiUpperCase(TableRight)+'''';
  t_kls_stru_left.Open;
  t_kls_stru_right.Open;

  lbLeft.Caption:=t_kls_stru_leftCAPTION.AsString;
  lbRight.Caption:=t_kls_stru_rightCAPTION.AsString;
  gridLeftLinks.Columns[2].Title.Caption:=t_kls_stru_rightCAPTION.AsString;
  gridLeftLinks.Columns[2].Title.Alignment:=taLeftJustify;
  gridRightLinks.Columns[2].Title.Caption:=t_kls_stru_leftCAPTION.AsString;
  gridRightLinks.Columns[2].Title.Alignment:=taLeftJustify;


  t_field_stru_left.Close;
  t_field_stru_left.SQL[1]:='WHERE NLS_UPPER(structure_id)='''+AnsiUpperCase(t_kls_stru_leftID.AsString)+'''';
  t_field_stru_left.Open;

  t_field_stru_right.Close;
  t_field_stru_right.SQL[1]:='WHERE NLS_UPPER(structure_id)='''+AnsiUpperCase(t_kls_stru_rightID.AsString)+'''';
  t_field_stru_right.Open;

  t_link_left.Close;
  t_link_left.SQL[0]:='SELECT DISTINCT B.'+t_linksTABLE_LINK_PK.AsString+' as TABLE_LINK_ID, B.IS_AUTO_LINK, A.'+t_kls_stru_rightUNIQUE_FIELD.AsString+' as ID, A.'+t_kls_stru_rightNAME_FIELD.AsString+' as NAME ';
  t_link_left.SQL[1]:='FROM ('+t_kls_stru_rightQUERY.AsString+') A, '+t_linksTABLE_LINK.AsString+' B';
  t_link_left.SQL[2]:='WHERE A.'+t_kls_stru_rightUNIQUE_FIELD.AsString+'=B.'+LinkRightPK;

  t_link_right.Close;
  t_link_right.SQL[0]:='SELECT DISTINCT B.'+t_linksTABLE_LINK_PK.AsString+' as TABLE_LINK_ID, B.IS_AUTO_LINK, A.'+t_kls_stru_leftUNIQUE_FIELD.AsString+' as ID, A.'+t_kls_stru_leftNAME_FIELD.AsString+' as NAME ';
  t_link_right.SQL[1]:='FROM ('+t_kls_stru_leftQUERY.AsString+') A, '+t_linksTABLE_LINK.AsString+' B';
  t_link_right.SQL[2]:='WHERE A.'+t_kls_stru_leftUNIQUE_FIELD.AsString+'=B.'+LinkLeftPK;

  rb1_1Click(Sender);
  if t_kls_stru_leftFILTER_1.AsString<>'' then
  Begin
    ed_Filter_Left.Enabled:=true;
    Filter_Left:=t_kls_stru_leftFILTER_1.AsString;
  end;

  if t_kls_stru_rightFILTER_1.AsString<>'' then
  Begin
    ed_Filter_Right.Enabled:=true;
    Filter_Right:=t_kls_stru_rightFILTER_1.AsString;
  end;

  // ������ ������
  if Pos('WHERE',AnsiUpperCase(t_kls_stru_rightQUERY.AsString))<>0 then
    WhereStrRight:=' AND '
  else
    WhereStrRight:=' WHERE ';

  t_source:=TOracleDataSet.Create(Self);
  with t_source do
  Begin
    Session:=f_main.ora_Session;
    SQL.Add(t_kls_stru_rightQUERY.AsString+WhereStrRight+'1=0');
    Open;
  end;

  t_kls_right.Close;
  t_kls_right.SQL.Clear;
  t_kls_right.SQL.Add(t_kls_stru_rightQUERY.AsString);

  t_kls_right.SQL.Add(WhereStrRight+' 1=1 '); // ��� ����������� ������� ������
  t_kls_right.SQL.Add(' AND 1=1 '); // ��� ��� �������

  if t_kls_stru_rightSTART_ORDER.AsString<>'' then
    t_kls_right.SQL.Add('ORDER BY '+t_kls_stru_rightSTART_ORDER.AsString) // ��� ��� ORDER BY
  else
    t_kls_right.SQL.Add(''); // ��� ��� ORDER BY
  t_kls_right.Fields.Clear;

  for i:=1 to t_source.FieldDefs.Count do
  begin
    case t_source.FieldDefs[i-1].DataType of
      ftString:
        begin
          nf_s:=TStringField.Create(t_kls_right);
          nf_s.FieldName := t_source.FieldDefs[i-1].Name;
          nf_s.Name := 't_kls_right'+nf_s.FieldName;
          nf_s.Size:=t_source.FieldDefs[i-1].Size;
          nf_s.Index:=t_kls_right.FieldCount;
          nf_s.DataSet:=t_kls_right;
        end;
      ftDate,ftDateTime:
        begin
          nf_d:=TDateTimeField.Create(t_kls_right);
          nf_d.FieldName := t_source.FieldDefs[i-1].Name;
          nf_d.Name := 't_kls_right'+nf_d.FieldName;
          nf_d.Index:=t_kls_right.FieldCount;
          nf_d.DataSet:=t_kls_right;
        end;
      ftFloat:
        Begin
          nf_f:=TFloatField.Create(t_kls_right);
          nf_f.FieldName := t_source.FieldDefs[i-1].Name;
          nf_f.Name := 't_kls_right'+nf_f.FieldName;
          nf_f.Index:=t_kls_right.FieldCount;
          nf_f.DataSet:=t_kls_right;
        end;
      ftInteger:
        begin
          nf_i:=TIntegerField.Create(t_kls_right);
          nf_i.FieldName := t_source.FieldDefs[i-1].Name;
          nf_i.Name := 't_kls_right'+nf_i.FieldName;
          nf_i.Index:=t_kls_right.FieldCount;
          nf_i.DataSet:=t_kls_right;
        end;
    end;
    t_kls_right.FieldDefs.Update;
  end;

  // ���������� LOOKUP-�����
  t_field_stru_right.First;
  while not t_field_stru_right.Eof do
  begin
    If t_field_stru_rightFIELD_KIND.AsInteger=1 Then //Lookup-����
    Begin
      t_lookup:=TOracleDataSet.Create(Self);
      with t_lookup do
      Begin
        Session:=f_main.ora_Session;
        SQL.Add(t_field_stru_rightLOOKUP_SOURCE_QUERY.AsString);
        t_lookup.Open;
        IF (FieldDefs.IndexOf(t_field_stru_rightLOOKUP_KEY_FIELD.AsString)<>-1) then
        If (FieldDefs.IndexOf(t_field_stru_rightLOOKUP_DISPLAY_FIELD.AsString)<>-1) then
        Begin
          nf_s:=TStringField.Create(t_kls_right);
          nf_s.FieldName := t_field_stru_rightLOOKUP_TABLE.AsString+'_'+t_field_stru_rightLOOKUP_DISPLAY_FIELD.AsString;
          nf_s.Name := nf_s.FieldName;
          nf_s.Index:=t_kls_right.FieldCount;
          nf_s.DataSet := t_kls_right;
          nf_s.Size:=t_lookup.FieldDefs.Find(t_field_stru_rightLOOKUP_DISPLAY_FIELD.AsString).Size;
          nf_s.DisplayWidth:=nf_s.Size;
          if nf_s.DisplayWidth>50 then nf_s.DisplayWidth:=50;
          nf_s.LookupDataSet:=t_lookup;
          nf_s.FieldKind:=fkLookup;
          nf_s.KeyFields:=t_field_stru_rightFIELD_NAME.AsString;
          nf_s.LookupKeyFields:=t_field_stru_rightLOOKUP_KEY_FIELD.AsString;
          nf_s.LookupResultField:=t_field_stru_rightLOOKUP_DISPLAY_FIELD.AsString;
        end;
      end;
    end;
    t_field_stru_right.Next;
  end;

  t_kls_right.ReadOnly:=true;
  acRefreshRightExecute(Sender);

  // ���������� GRID
  FieldsFilterRight:=TStringList.Create;
  FieldsFilterRight.Clear;
  gridRightList.Columns.Clear;
  t_field_stru_right.First;
  while not t_field_stru_right.Eof do
  begin
    if t_field_stru_rightDISPLAY_WIDTH.AsInteger<>0 then
      t_kls_right.FieldByName(t_field_stru_rightFIELD_NAME.AsString).DisplayWidth:=t_field_stru_rightDISPLAY_WIDTH.AsInteger;
    with gridRightList.Columns.Add do
    begin
      If t_field_stru_rightFIELD_KIND.AsInteger=1 Then // Lookup-����
      Begin
        FieldName:=t_field_stru_rightLOOKUP_TABLE.AsString+'_'+t_field_stru_rightLOOKUP_DISPLAY_FIELD.AsString;
      End
      Else
      Begin
        FieldName:=t_field_stru_rightFIELD_NAME.AsString;
      End;
      If t_field_stru_rightFIELD_KIND.AsInteger=2 Then // Checkbox-����
      Begin
        Checkboxes:=true;
        DblClickNextVal:=true;
        KeyList.Add('1');
        KeyList.Add('0');
      End;
      Title.Caption:=t_field_stru_rightFIELD_CAPTION.AsString;
      Title.TitleButton:=True;
      PopupMenu:=pm_GridColumnRight;
      if FieldName=t_kls_stru_rightUNIQUE_FIELD.AsString then
      Begin
{        gridRightList.FooterRowCount:=1;
        Footer.ValueType:=fvtCount;
        Footer.Font.Style:=[fsBold];}
      End;
    end;
    FieldsFilterRight.Add('');
    t_field_stru_right.Next;
  end;

  // ����� ������
  if Pos('WHERE',AnsiUpperCase(t_kls_stru_leftQUERY.AsString))<>0 then
    WhereStrLeft:=' AND '
  else
    WhereStrLeft:=' WHERE ';

  t_source:=TOracleDataSet.Create(Self);
  with t_source do
  Begin
    Session:=f_main.ora_Session;
    SQL.Add(t_kls_stru_leftQUERY.AsString+WhereStrLeft+'1=0');
    Open;
  end;

  t_kls_left.Close;
  t_kls_left.SQL.Clear;
  t_kls_left.SQL.Add(t_kls_stru_leftQUERY.AsString);

  t_kls_left.SQL.Add(WhereStrLeft+' 1=1 '); // ��� ����������� ������� ������
  if FormStyle=fsNormal then
  begin
    If IdToSeek<>'' then
    Begin
      IF t_kls_left.FieldByName(t_kls_stru_leftUNIQUE_FIELD.AsString).DataType in [ftString,ftMemo] then
        t_kls_left.SQL[t_kls_left.SQL.Count-1]:=WhereStrLeft+' '+t_kls_stru_leftUNIQUE_FIELD.AsString+'='''+IdToSeek+'''';
      IF t_kls_left.FieldByName(t_kls_stru_leftUNIQUE_FIELD.AsString).DataType in [ftInteger,ftFloat,ftSmallint,ftWord,ftCurrency,ftBCD] then
         t_kls_left.SQL[t_kls_left.SQL.Count-1]:=WhereStrLeft+' '+t_kls_stru_leftUNIQUE_FIELD.AsString+'='+IdToSeek;
    end;
  end;
  t_kls_left.SQL.Add(' AND 1=1 '); // ��� ��� �������

  if t_kls_stru_leftSTART_ORDER.AsString<>'' then
    t_kls_left.SQL.Add('ORDER BY '+t_kls_stru_leftSTART_ORDER.AsString) // ��� ��� ORDER BY
  else
    t_kls_left.SQL.Add(''); // ��� ��� ORDER BY
  t_kls_left.Fields.Clear;

  for i:=1 to t_source.FieldDefs.Count do
  begin
    case t_source.FieldDefs[i-1].DataType of
      ftString:
        begin
          nf_s:=TStringField.Create(t_kls_left);
          nf_s.FieldName := t_source.FieldDefs[i-1].Name;
          nf_s.Name := 't_kls_left'+nf_s.FieldName;
          nf_s.Size:=t_source.FieldDefs[i-1].Size;
          nf_s.Index:=t_kls_left.FieldCount;
          nf_s.DataSet:=t_kls_left;
        end;
      ftDate,ftDateTime:
        begin
          nf_d:=TDateTimeField.Create(t_kls_left);
          nf_d.FieldName := t_source.FieldDefs[i-1].Name;
          nf_d.Name := 't_kls_left'+nf_d.FieldName;
          nf_d.Index:=t_kls_left.FieldCount;
          nf_d.DataSet:=t_kls_left;
        end;
      ftFloat:
        Begin
          nf_f:=TFloatField.Create(t_kls_left);
          nf_f.FieldName := t_source.FieldDefs[i-1].Name;
          nf_f.Name := 't_kls_left'+nf_f.FieldName;
          nf_f.Index:=t_kls_left.FieldCount;
          nf_f.DataSet:=t_kls_left;
        end;
      ftInteger:
        begin
          nf_i:=TIntegerField.Create(t_kls_left);
          nf_i.FieldName := t_source.FieldDefs[i-1].Name;
          nf_i.Name := 't_kls_left'+nf_i.FieldName;
          nf_i.Index:=t_kls_left.FieldCount;
          nf_i.DataSet:=t_kls_left;
        end;
    end;
    t_kls_left.FieldDefs.Update;
  end;

  // ���������� LOOKUP-�����
  t_field_stru_left.First;
  while not t_field_stru_left.Eof do
  begin
    If t_field_stru_leftFIELD_KIND.AsInteger=1 Then
    Begin
      t_lookup:=TOracleDataSet.Create(Self);
      with t_lookup do
      Begin
        Session:=f_main.ora_Session;
        SQL.Add(t_field_stru_leftLOOKUP_SOURCE_QUERY.AsString);
        t_lookup.Open;
        IF (FieldDefs.IndexOf(t_field_stru_leftLOOKUP_KEY_FIELD.AsString)<>-1) then
        If (FieldDefs.IndexOf(t_field_stru_leftLOOKUP_DISPLAY_FIELD.AsString)<>-1) then
        Begin
          nf_s:=TStringField.Create(t_kls_left);
          nf_s.FieldName := t_field_stru_leftLOOKUP_TABLE.AsString+'_'+t_field_stru_leftLOOKUP_DISPLAY_FIELD.AsString;
          nf_s.Name := nf_s.FieldName;
          nf_s.Index:=t_kls_left.FieldCount;
          nf_s.DataSet := t_kls_left;
          nf_s.Size:=t_lookup.FieldDefs.Find(t_field_stru_leftLOOKUP_DISPLAY_FIELD.AsString).Size;
          nf_s.DisplayWidth:=nf_s.Size;
          if nf_s.DisplayWidth>50 then nf_s.DisplayWidth:=50;
          nf_s.LookupDataSet:=t_lookup;
          nf_s.FieldKind:=fkLookup;
          nf_s.KeyFields:=t_field_stru_leftFIELD_NAME.AsString;
          nf_s.LookupKeyFields:=t_field_stru_leftLOOKUP_KEY_FIELD.AsString;
          nf_s.LookupResultField:=t_field_stru_leftLOOKUP_DISPLAY_FIELD.AsString;
        end;
      end;
    end;
    t_field_stru_left.Next;
  end;

  t_kls_left.ReadOnly:=true;
  acRefreshLeftExecute(Sender);

  // ���������� GRID
  FieldsFilterLeft:=TStringList.Create;
  FieldsFilterLeft.Clear;
  gridLeftList.Columns.Clear;
  t_field_stru_left.First;
  while not t_field_stru_left.Eof do
  begin
    if t_field_stru_leftDISPLAY_WIDTH.AsInteger<>0 then
      t_kls_left.FieldByName(t_field_stru_leftFIELD_NAME.AsString).DisplayWidth:=t_field_stru_leftDISPLAY_WIDTH.AsInteger;
    with gridLeftList.Columns.Add do
    begin
      If t_field_stru_leftFIELD_KIND.AsInteger=1 Then // Lookup-����
      Begin
        FieldName:=t_field_stru_leftLOOKUP_TABLE.AsString+'_'+t_field_stru_leftLOOKUP_DISPLAY_FIELD.AsString;
      End
      Else
      Begin
        FieldName:=t_field_stru_leftFIELD_NAME.AsString;
      End;
      If t_field_stru_leftFIELD_KIND.AsInteger=2 Then // Checkbox-����
      Begin
        Checkboxes:=true;
        DblClickNextVal:=true;
        KeyList.Add('1');
        KeyList.Add('0');
      End;
      Title.Caption:=t_field_stru_leftFIELD_CAPTION.AsString;
      Title.TitleButton:=True;
      PopupMenu:=pm_GridColumnLeft;
      if FieldName=t_kls_stru_leftUNIQUE_FIELD.AsString then
      Begin
        gridLeftList.FooterRowCount:=1;
        Footer.ValueType:=fvtCount;
        Footer.Font.Style:=[fsBold];
      End;
    end;
    FieldsFilterLeft.Add('');
    t_field_stru_left.Next;
  end;

  gridLeftList.FrozenCols:=2;
  gridRightList.FrozenCols:=2;

  IsInitial:=false;
  t_kls_left.First;
end;

procedure Tf_KlsLinks.FormClose(Sender: TObject; var Action: TCloseAction);
var i:integer;
begin
  t_kls_left.Close;
  t_kls_right.Close;
  for i:=t_kls_left.FieldCount-1 downto 1 do
    begin
      if t_kls_left.Fields[i].FieldKind=fkLookup then t_kls_left.Fields[i].LookupDataSet.Free;
      t_kls_left.Fields[i].Free;
    end;
  for i:=t_kls_right.FieldCount-1 downto 1 do
    begin
      if t_kls_right.Fields[i].FieldKind=fkLookup then t_kls_right.Fields[i].LookupDataSet.Free;
      t_kls_right.Fields[i].Free;
    end;
  if FormStyle=fsMDIChild
    then Action:=caFree;
end;

procedure Tf_KlsLinks.e_FieldFilterLeftAcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  gridLeftList.Columns[gridLeftList.Col-1].Title.Font.Style:=
    gridLeftList.Columns[gridLeftList.Col-1].Title.Font.Style+[fsBold];
  FieldsFilterLeft[gridLeftList.Col-1]:=NewText;
  t_kls_left.Filtered:=True;
  Accept:=True;
end;

procedure Tf_KlsLinks.TBItem5Click(Sender: TObject);
var
  I:Integer;
  Filtered:Boolean;
begin
  Filtered:=False;
  gridLeftList.Columns[gridLeftList.Col-1].Title.Font.Style:=
    gridLeftList.Columns[gridLeftList.Col-1].Title.Font.Style-[fsBold];
  FieldsFilterLeft[gridLeftList.Col-1]:='';
  for i:=0 to FieldsFilterLeft.Count-1 do
    if FieldsFilterLeft[i]<>'' then Filtered:=True;
  t_kls_left.Filtered:=Filtered;
  t_kls_left.Refresh;
end;

procedure Tf_KlsLinks.pm_GridColumnLeftPopup(Sender: TObject);
begin
  if gridLeftList.Columns[gridLeftList.Col-1].Field.FieldKind=fkLookup then
    e_FieldFilterLeft.Enabled:=False
  else
    e_FieldFilterLeft.Enabled:=True;
  e_FieldFilterLeft.Text:=FieldsFilterLeft[gridLeftList.Col-1];
end;

procedure Tf_KlsLinks.t_kls_leftFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
  I:Integer;
  FieldValue:String;
begin
  Accept:=True;
  for i:=0 to FieldsFilterLeft.Count-1 do
  if FieldsFilterLeft[i]<>'' then
  begin
    FieldValue:=gridLeftList.Columns[i].Field.AsString;
    case gridLeftList.Columns[i].Field.DataType of
      ftString:
        Accept:=Accept and (Pos(AnsiUpperCase(FieldsFilterLeft[i]),AnsiUpperCase(FieldValue))<>0);
      ftFloat,ftInteger:
        Accept:=Accept and (FieldsFilterLeft[i]=FieldValue);
      ftDate,ftDateTime:
        Accept:=Accept and (StrToDateTime(FieldsFilterLeft[i])=gridLeftList.Columns[i].Field.AsDateTime);
    end;
  end;
end;

procedure Tf_KlsLinks.FormCreate(Sender: TObject);
begin
  f_db.SetUserGrants(ActionManager1);
end;

procedure Tf_KlsLinks.PressKeyLeft(Key:Word);
Begin
  if (Key=VK_RETURN) Then acRefreshLeftExecute(Self);
end;

procedure Tf_KlsLinks.PressKeyRight(Key:Word);
Begin
  if (Key=VK_RETURN) Then acRefreshRightExecute(Self);
end;

procedure Tf_KlsLinks.ed_Filter_LeftKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  PressKeyLeft(Key);
end;

procedure Tf_KlsLinks.pm_GridColumnRightPopup(Sender: TObject);
begin
  if gridRightList.Columns[gridRightList.Col-1].Field.FieldKind=fkLookup then
    e_FieldFilterRight.Enabled:=False
  else
    e_FieldFilterRight.Enabled:=True;
  e_FieldFilterRight.Text:=FieldsFilterRight[gridRightList.Col-1];
end;

procedure Tf_KlsLinks.e_FieldFilterRightAcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  gridRightList.Columns[gridRightList.Col-1].Title.Font.Style:=
    gridRightList.Columns[gridRightList.Col-1].Title.Font.Style+[fsBold];
  FieldsFilterRight[gridRightList.Col-1]:=NewText;
  t_kls_right.Filtered:=True;
  Accept:=True;
end;

procedure Tf_KlsLinks.TBItem2Click(Sender: TObject);
var
  I:Integer;
  Filtered:Boolean;
begin
  Filtered:=False;
  gridRightList.Columns[gridRightList.Col-1].Title.Font.Style:=
    gridRightList.Columns[gridRightList.Col-1].Title.Font.Style-[fsBold];
  FieldsFilterRight[gridRightList.Col-1]:='';
  for i:=0 to FieldsFilterRight.Count-1 do
    if FieldsFilterRight[i]<>'' then Filtered:=True;
  t_kls_right.Filtered:=Filtered;
  t_kls_right.Refresh;
end;

procedure Tf_KlsLinks.ed_Filter_RightKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  PressKeyRight(Key);
end;

procedure Tf_KlsLinks.t_kls_rightFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
  I:Integer;
  FieldValue:String;
begin
  Accept:=True;
  for i:=0 to FieldsFilterRight.Count-1 do
  if FieldsFilterRight[i]<>'' then
  begin
    FieldValue:=gridRightList.Columns[i].Field.AsString;
    case gridRightList.Columns[i].Field.DataType of
      ftString:
        Accept:=Accept and (Pos(AnsiUpperCase(FieldsFilterRight[i]),AnsiUpperCase(FieldValue))<>0);
      ftFloat,ftInteger:
        Accept:=Accept and (FieldsFilterRight[i]=FieldValue);
      ftDate,ftDateTime:
        Accept:=Accept and (StrToDateTime(FieldsFilterRight[i])=gridRightList.Columns[i].Field.AsDateTime);
    end;
  end;
end;

procedure Tf_KlsLinks.FormResize(Sender: TObject);
begin
  Panel1.Width:=(Self.Width div 2)-5;
end;

procedure Tf_KlsLinks.rb1_1Click(Sender: TObject);
begin
  if t_linksTABLE_LINK_TYPE.AsString='1-1' then
  Begin
    rb1_1.Checked:=true;
    cb_NoLinkLeft.Checked:=true;
    cb_NoLinkRight.Checked:=true;
  end
  else
    if t_linksTABLE_LINK_TYPE.AsString='M-1' then
    Begin
      rbM_1.Checked:=true;
      cb_NoLinkLeft.Checked:=true;
      cb_NoLinkRight.Checked:=false;
    end
    else
    begin
      rbM_M.Checked:=true;
      cb_NoLinkLeft.Checked:=false;
      cb_NoLinkRight.Checked:=false;
    end;
end;

procedure Tf_KlsLinks.t_kls_leftAfterScroll(DataSet: TDataSet);
begin
  if IsInitial then exit;
  t_Link_Left.Close;
  t_Link_Left.SQL[3]:='AND 1=0';

  if not t_kls_left.eof then
  Begin
    IF t_kls_left.FieldByName(t_kls_stru_leftUNIQUE_FIELD.AsString).DataType in [ftString,ftMemo] then
      t_Link_Left.SQL[3]:='AND B.'+LinkLeftPK+'='''+t_kls_left.FieldByName(t_kls_stru_leftUNIQUE_FIELD.AsString).asString+'''';

    IF t_kls_left.FieldByName(t_kls_stru_leftUNIQUE_FIELD.AsString).DataType in [ftInteger,ftFloat,ftSmallint,ftWord,ftCurrency,ftBCD] then
      t_Link_Left.SQL[3]:='AND B.'+LinkLeftPK+'='+t_kls_left.FieldByName(t_kls_stru_leftUNIQUE_FIELD.AsString).asString;
  end;
  t_Link_Left.Open;
end;

procedure Tf_KlsLinks.t_Link_LeftAfterScroll(DataSet: TDataSet);
begin
  if t_kls_right.Active then
  Begin
    t_kls_right.Locate(t_kls_stru_rightUNIQUE_FIELD.AsString,t_Link_Left.FieldByName('ID').AsVariant,[]);
  End
end;

procedure Tf_KlsLinks.t_kls_rightAfterScroll(DataSet: TDataSet);
begin
  if IsInitial then exit;

  t_Link_Right.Close;
  t_Link_Right.SQL[3]:='AND 1=1';

  IF t_kls_right.FieldByName(t_kls_stru_rightUNIQUE_FIELD.AsString).DataType in [ftString,ftMemo] then
    t_Link_Right.SQL[3]:='AND B.'+LinkRightPK+'='''+t_kls_right.FieldByName(t_kls_stru_rightUNIQUE_FIELD.AsString).asString+'''';

  IF t_kls_Right.FieldByName(t_kls_stru_rightUNIQUE_FIELD.AsString).DataType in [ftInteger,ftFloat,ftSmallint,ftWord,ftCurrency,ftBCD] then
    t_Link_Right.SQL[3]:='AND B.'+LinkRightPK+'='+t_kls_right.FieldByName(t_kls_stru_rightUNIQUE_FIELD.AsString).asString;

//  t_link_Right.SQL.SaveToFile('C:\tmp\1.sql');
  t_Link_Right.Open;
end;

procedure Tf_KlsLinks.acKLSNewLinkExecute(Sender: TObject);
var LinkFound:boolean;
    s:string;
begin
  if not t_kls_left.EOF and not t_kls_right.EOF then
  Begin
    LinkFound:=false;

    if not t_link_left.EOF then
      if t_link_left.FieldValues['ID']=t_kls_right.FieldValues[t_kls_stru_rightUNIQUE_FIELD.AsString] then
        LinkFound:=true;

    If NOT LinkFound then
    if rb1_1.Checked then // ����� ������ 1 � 1
    Begin
      if not t_link_left.EOF or not t_link_right.EOF then
      Begin
        Application.MessageBox(PChar('��� '+lbLeft.Caption+' �������� ����� � '+lbRight.Caption+' ������ � ������ ���� � ������'),'��������!',MB_OK);
        Exit;
      end;
    End;

    If NOT LinkFound then
    if rbM_1.Checked then // ����� ������ M � 1
    Begin
      if not t_link_left.EOF then
      Begin
        Application.MessageBox(PChar('��� '+lbLeft.Caption+' �������� ����� � '+lbRight.Caption+' ������ � ������ ������ � ������'),'��������!',MB_OK);
        Exit;
      end;
    End;

    if Application.MessageBox(PChar('������� '+t_kls_left.FieldByName(t_kls_stru_leftNAME_FIELD.AsString).AsString+
                 ' � '+t_kls_right.FieldByName(t_kls_stru_rightNAME_FIELD.AsString).AsString+' ?'),'��������!',MB_YESNO)=IDYES then
    try
      if (TableLeft=t_linksTABLE_LINK.AsString) OR (TableRight=t_linksTABLE_LINK.AsString) then
        // ������� ����� - ���� �� ������. ������ ��������� � ������� �� ��� ������
      Begin
        if (TableLeft=t_linksTABLE_LINK.AsString) then
        Begin
          s:='UPDATE '+t_linksTABLE_LINK.AsString+' SET IS_AUTO_LINK=0, '+LinkRightPK+'=';

          IF t_kls_right.FieldByName(t_kls_stru_rightUNIQUE_FIELD.AsString).DataType in [ftString,ftMemo] then
            s:=s+'LTRIM(RTRIM('''+t_kls_right.FieldByName(t_kls_stru_rightUNIQUE_FIELD.AsString).asString+'''))';

          IF t_kls_Right.FieldByName(t_kls_stru_rightUNIQUE_FIELD.AsString).DataType in [ftInteger,ftFloat,ftSmallint,ftWord,ftCurrency,ftBCD] then
            s:=s+t_kls_right.FieldByName(t_kls_stru_rightUNIQUE_FIELD.AsString).asString;

          IF t_kls_left.FieldByName(t_kls_stru_leftUNIQUE_FIELD.AsString).DataType in [ftString,ftMemo] then
          Begin
            s:=s+' WHERE LTRIM(RTRIM('+LinkLeftPK+'))=';
            s:=s+'LTRIM(RTRIM('''+t_kls_left.FieldByName(t_kls_stru_leftUNIQUE_FIELD.AsString).asString+'''))';
          End;

          IF t_kls_left.FieldByName(t_kls_stru_leftUNIQUE_FIELD.AsString).DataType in [ftInteger,ftFloat,ftSmallint,ftWord,ftCurrency,ftBCD] then
          Begin
            s:=s+' WHERE '+LinkLeftPK+'=';
            s:=s+t_kls_left.FieldByName(t_kls_stru_leftUNIQUE_FIELD.AsString).asString;
          End;
        end
        else
        Begin // ��������� ������ � ������� �����
          s:='UPDATE '+t_linksTABLE_LINK.AsString+' SET IS_AUTO_LINK=0, '+LinkLeftPK+'=';

          IF t_kls_left.FieldByName(t_kls_stru_leftUNIQUE_FIELD.AsString).DataType in [ftString,ftMemo] then
            s:=s+'LTRIM(RTRIM('''+t_kls_left.FieldByName(t_kls_stru_leftUNIQUE_FIELD.AsString).asString+'''))';

          IF t_kls_left.FieldByName(t_kls_stru_leftUNIQUE_FIELD.AsString).DataType in [ftInteger,ftFloat,ftSmallint,ftWord,ftCurrency,ftBCD] then
            s:=s+t_kls_left.FieldByName(t_kls_stru_leftUNIQUE_FIELD.AsString).asString;

          IF t_kls_right.FieldByName(t_kls_stru_rightUNIQUE_FIELD.AsString).DataType in [ftString,ftMemo] then
          Begin
            s:=s+' WHERE LTRIM(RTRIM('+LinkRightPK+'))=';
            s:=s+'LTRIM(RTRIM('''+t_kls_right.FieldByName(t_kls_stru_rightUNIQUE_FIELD.AsString).asString+'''))';
          End;

          IF t_kls_Right.FieldByName(t_kls_stru_rightUNIQUE_FIELD.AsString).DataType in [ftInteger,ftFloat,ftSmallint,ftWord,ftCurrency,ftBCD] then
          Begin
            s:=s+' WHERE '+LinkRightPK+'=';
            s:=s+t_kls_right.FieldByName(t_kls_stru_rightUNIQUE_FIELD.AsString).asString;
          End;

        End;
        q_tmp.Close;
        q_tmp.SQL.Clear;
        q_tmp.SQL.Add(s);
//        q_tmp.SQL.SaveToFile('c:\tmp\1.sql');
        q_tmp.ExecSQL;
      End
      Else
      Begin
        If NOT LinkFound then // ����� �� ����������� - ���������
        Begin
          s:='INSERT INTO '+t_linksTABLE_LINK.AsString+' (IS_AUTO_LINK,'+LinkLeftPK+','+LinkRightPK+')'+
             ' VALUES (0,';

          IF t_kls_left.FieldByName(t_kls_stru_leftUNIQUE_FIELD.AsString).DataType in [ftString,ftMemo] then
            s:=s+'LTRIM(RTRIM('''+t_kls_left.FieldByName(t_kls_stru_leftUNIQUE_FIELD.AsString).asString+''')),';

          IF t_kls_left.FieldByName(t_kls_stru_leftUNIQUE_FIELD.AsString).DataType in [ftInteger,ftFloat,ftSmallint,ftWord,ftCurrency,ftBCD] then
            s:=s+t_kls_left.FieldByName(t_kls_stru_leftUNIQUE_FIELD.AsString).asString+',';

          IF t_kls_right.FieldByName(t_kls_stru_rightUNIQUE_FIELD.AsString).DataType in [ftString,ftMemo] then
            s:=s+'LTRIM(RTRIM('''+t_kls_right.FieldByName(t_kls_stru_rightUNIQUE_FIELD.AsString).asString+''')))';

          IF t_kls_right.FieldByName(t_kls_stru_rightUNIQUE_FIELD.AsString).DataType in [ftInteger,ftFloat,ftSmallint,ftWord,ftCurrency,ftBCD] then
            s:=s+t_kls_right.FieldByName(t_kls_stru_rightUNIQUE_FIELD.AsString).asString+')';

        End
        Else
        Begin // ����� ����������� - ���������
          s:='UPDATE '+t_linksTABLE_LINK.AsString+' SET IS_AUTO_LINK=0 WHERE '+t_linksTABLE_LINK_PK.AsString+'=';

          if t_linksTABLE_LINK_PK_TYPE.AsString='C' then
            s:=s+'LTRIM(RTRIM('''+t_link_left.FieldByName('TABLE_LINK_ID').AsString+'''))';

          if t_linksTABLE_LINK_PK_TYPE.AsString='N' then
            s:=s+t_link_left.FieldByName('TABLE_LINK_ID').AsString;

        End;
        q_tmp.Close;
        q_tmp.SQL.Clear;
        q_tmp.SQL.Add(s);
//        q_tmp.SQL.SaveToFile('c:\tmp\1.sql');
        q_tmp.ExecSQL;
      End;
      q_tmp.Close;
      q_tmp.SQL.Clear;
      q_tmp.SQL.Add('COMMIT');
      q_tmp.ExecSQL;
    finally
    acRefreshRightExecute(Sender);
    acRefreshLeftExecute(Sender);
//      f_main.ReQuery(t_link_right,True);
//      f_main.ReQuery(t_kls_right,True);
//      f_main.ReQuery(t_link_left,True);
//      f_main.ReQuery(t_kls_left,True);
    end;
  end;
end;

procedure Tf_KlsLinks.acRefreshLeftExecute(Sender: TObject);
var s,AndS:string;
    FilterTxt:string;
    WhereStr:string;
    OldInitial:boolean;
    CheckTable:string;
begin
  WhereStr:=' AND ';
  AndS:=WhereStr;
  s:='';
  with t_kls_left do
  try
    FilterTxt:=StringReplace(ed_Filter_Left.Text,'*','%',[rfReplaceAll]);
    If FilterTxt<>'' then
    Begin
      If FilterTxt[Length(FilterTxt)]<>'%' then FilterTxt:=FilterTxt+'%';
      s:=s+AndS+'(NLS_UPPER('+Filter_Left+') LIKE '''+AnsiUpperCase(FilterTxt)+''') ';
      AndS:=' AND ';
    end;

    If cb_NoLinkLeft.Checked then
    Begin
      if t_linksQUERY_LINK.AsString<>'' then
        CheckTable:='('+t_linksQUERY_LINK.AsString+')'
      else
        CheckTable:=t_linksTABLE_LINK.AsString;
        s:=s+AndS+'(NOT EXISTS (SELECT NULL FROM '+CheckTable+' A WHERE A.'+LinkLeftPK+'='+t_kls_stru_leftTABLE_NAME.AsString+'.'+t_kls_stru_leftUNIQUE_FIELD.AsString+' AND A.'+LinkRightPK+' IS NOT NULL)) ';
      AndS:=' AND ';
    End;

    if s<>WhereStr then SQL[t_kls_left.SQL.Count-2]:=s;
//    SQL.SaveToFile('c:\tmp\1.sql');
    OldInitial:=IsInitial;
    IsInitial:=true;
    f_db.ReQuery(t_kls_left,True);
    IsInitial:=OldInitial;
    if t_kls_left.Active then
      if not t_kls_left.eof then t_kls_leftAfterScroll(t_kls_left);
  finally
    if Self.Active then gridLeftList.SetFocus;
  end
end;

procedure Tf_KlsLinks.acRefreshRightExecute(Sender: TObject);
var s,AndS:string;
    FilterTxt:string;
    CheckTable,WhereStr:string;
    OldInitial:boolean;
begin
  WhereStr:=' AND ';
  AndS:=WhereStr;
  s:='';
  with t_kls_right do
  try
    FilterTxt:=StringReplace(ed_Filter_right.Text,'*','%',[rfReplaceAll]);
    If FilterTxt<>'' then
    Begin
      If FilterTxt[Length(FilterTxt)]<>'%' then FilterTxt:=FilterTxt+'%';
      s:=s+AndS+'(NLS_UPPER('+Filter_right+') LIKE '''+AnsiUpperCase(FilterTxt)+''') ';
      AndS:=' AND ';
    end;

    If cb_NoLinkRight.Checked then
    Begin
      if t_linksQUERY_LINK.AsString<>'' then
        CheckTable:='('+t_linksQUERY_LINK.AsString+')'
      else
        CheckTable:=t_linksTABLE_LINK.AsString;
      s:=s+AndS+'(NOT EXISTS (SELECT NULL FROM '+CheckTable+' A WHERE A.'+LinkRightPK+'='+t_kls_stru_rightTABLE_NAME.AsString+'.'+t_kls_stru_rightUNIQUE_FIELD.AsString+' AND A.'+LinkLeftPK+' IS NOT NULL)) ';
      AndS:=' AND ';
    End;

    if s<>WhereStr then SQL[t_kls_right.SQL.Count-2]:=s;

    OldInitial:=IsInitial;
    IsInitial:=true;
    f_db.ReQuery(t_kls_right,True);
    IsInitial:=OldInitial;
    if t_kls_right.Active then
      if not t_kls_right.eof then t_kls_rightAfterScroll(t_kls_right);
  finally
    if Self.Active then gridRightList.SetFocus;
  end

end;


procedure Tf_KlsLinks.DelCurrentLink;
var s:string;
begin
  if t_link_left.EOF then exit;
  if (TableLeft=t_linksTABLE_LINK.AsString) OR (TableRight=t_linksTABLE_LINK.AsString) then
    // ������� ����� - ���� �� ������. ������ ��������� � ������� �� ��� ������
  Begin
    if (TableLeft=t_linksTABLE_LINK.AsString) then
    Begin
      s:='UPDATE '+t_linksTABLE_LINK.AsString+' SET IS_AUTO_LINK=0, '+LinkRightPK+'=NULL';
      s:=s+' WHERE '+LinkLeftPK+'=';

      IF t_kls_left.FieldByName(t_kls_stru_leftUNIQUE_FIELD.AsString).DataType in [ftString,ftMemo] then
        s:=s+''''+t_kls_left.FieldByName(t_kls_stru_leftUNIQUE_FIELD.AsString).asString+'''';

      IF t_kls_left.FieldByName(t_kls_stru_leftUNIQUE_FIELD.AsString).DataType in [ftInteger,ftFloat,ftSmallint,ftWord,ftCurrency,ftBCD] then
        s:=s+t_kls_left.FieldByName(t_kls_stru_leftUNIQUE_FIELD.AsString).asString;
    end
    else
    Begin // ��������� ������ � ������� �����
      s:='UPDATE '+t_linksTABLE_LINK.AsString+' SET IS_AUTO_LINK=0, '+LinkLeftPK+'=NULL';
      s:=s+' WHERE '+LinkRightPK+'=';

      IF t_kls_right.FieldByName(t_kls_stru_rightUNIQUE_FIELD.AsString).DataType in [ftString,ftMemo] then
        s:=s+''''+t_kls_right.FieldByName(t_kls_stru_rightUNIQUE_FIELD.AsString).asString+'''';

      IF t_kls_Right.FieldByName(t_kls_stru_rightUNIQUE_FIELD.AsString).DataType in [ftInteger,ftFloat,ftSmallint,ftWord,ftCurrency,ftBCD] then
        s:=s+t_kls_right.FieldByName(t_kls_stru_rightUNIQUE_FIELD.AsString).asString;

    End;
    q_tmp.Close;
    q_tmp.SQL.Clear;
    q_tmp.SQL.Add(s);
//    q_tmp.SQL.SaveToFile('c:\tmp\1.sql');
    q_tmp.ExecSQL;
  End
  Else
  Begin
    s:='DELETE FROM '+t_linksTABLE_LINK.AsString+' WHERE '+t_linksTABLE_LINK_PK.AsString+'=';

    if t_linksTABLE_LINK_PK_TYPE.AsString='C' then
      s:=s+''''+t_link_left.FieldByName('TABLE_LINK_ID').AsString+'''';

    if t_linksTABLE_LINK_PK_TYPE.AsString='N' then
      s:=s+t_link_left.FieldByName('TABLE_LINK_ID').AsString;

    q_tmp.Close;
    q_tmp.SQL.Clear;
    q_tmp.SQL.Add(s);
//    q_tmp.SQL.SaveToFile('c:\tmp\1.sql');
    q_tmp.ExecSQL;
  End;
  q_tmp.Close;
  q_tmp.SQL.Clear;
  q_tmp.SQL.Add('COMMIT');
  q_tmp.ExecSQL;
end;

procedure Tf_KlsLinks.acKLSDelLinkExecute(Sender: TObject);
begin
  if t_link_left.EOF then exit;

  if Application.MessageBox(PChar('����������� '+t_kls_left.FieldByName(t_kls_stru_leftNAME_FIELD.AsString).AsString+
               ' � '+t_link_left.FieldByName('NAME').AsString+' ?'),'��������!',MB_YESNO)=IDYES then
  try
    DelCurrentLink;
  finally
    acRefreshRightExecute(Sender);
//    f_main.ReQuery(t_link_right,True);
//    f_main.ReQuery(t_kls_right,True);
    acRefreshLeftExecute(Sender);
//    f_main.ReQuery(t_link_left,True);
//    f_main.ReQuery(t_kls_left,True);
  end;
end;


procedure Tf_KlsLinks.TBItem3Click(Sender: TObject);
begin
  F_DB.GridSQL(Self,gridLeftList,t_kls_left.SQL.Text,t_kls_left);
end;

procedure Tf_KlsLinks.TBItem8Click(Sender: TObject);
begin
  F_DB.GridSQL(Self,gridRightList,t_kls_right.SQL.Text,t_kls_right);
end;

procedure Tf_KlsLinks.TBItem9Click(Sender: TObject);
begin
  f_db.EditInMemo(gridLeftList);
end;

procedure Tf_KlsLinks.TBItem10Click(Sender: TObject);
begin
  f_db.EditInMemo(gridRightList);
end;

end.
