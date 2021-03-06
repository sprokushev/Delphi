unit SvedIn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MdiForm, Placemnt, ExtCtrls, Grids, DBGridEh, ComCtrls,
  RxLookup, Buttons, StdCtrls, TB2Dock, TB2Toolbar, TB2Item, ActnList,
  XPStyleActnCtrls, ActnMan, TB2ExtItems, Menus, Oracle, DB, OracleData, DBGrids,
  PropFilerEh, PropStorageEh,DBGridEhImpExp,RxShell,DateUtils, GridsEh,
  DBGridEhGrouping;

// �������� � ���������/�����

type
  Tf_SvedIn = class(Tf_MDIForm)
    ActionManager1: TActionManager;
    acToXLS: TAction;
    PopupTitle: TTBPopupMenu;
    tbTitleFilterTitle: TTBItem;
    acSvedInAdd: TAction;
    acSvedInEdit: TAction;
    acSvedInDel: TAction;
    acSvedInCopy: TAction;
    acSvedInRowsAdd: TAction;
    acSvedInRowsEdit: TAction;
    acSvedInRowsCopy: TAction;
    acSvedInRowsDel: TAction;
    acPrintSved: TAction;
    acFilter: TAction;
    acNoFilter: TAction;
    tbTitleFilterEdit: TTBEditItem;
    tbTitleFilterSelection: TTBItem;
    tbTitleFilterClear: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    tbTitleWinEdit: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBSubmenuItem1: TTBSubmenuItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBItem9: TTBItem;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    TBItem13: TTBItem;
    TBItem14: TTBItem;
    TBItem15: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBItem16: TTBItem;
    TBItem17: TTBItem;
    PopupRows: TTBPopupMenu;
    tbRowsFilterTitle: TTBItem;
    tbRowsFilterEdit: TTBEditItem;
    tbRowsFilterSelection: TTBItem;
    tbRowsFilterClear: TTBItem;
    TBSeparatorItem5: TTBSeparatorItem;
    tbRowsWinEdit: TTBItem;
    TBSeparatorItem6: TTBSeparatorItem;
    TBItem24: TTBItem;
    TBItem25: TTBItem;
    TBItem26: TTBItem;
    TBItem27: TTBItem;
    TBSeparatorItem7: TTBSeparatorItem;
    TBSubmenuItem2: TTBSubmenuItem;
    TBSeparatorItem8: TTBSeparatorItem;
    TBItem29: TTBItem;
    ora_Session: TOracleSession;
    q_title: TOracleDataSet;
    ds_title: TDataSource;
    q_rows: TOracleDataSet;
    ds_rows: TDataSource;
    pkgFOR_SVED_IN: TOraclePackage;
    PropStorageEh1: TPropStorageEh;
    q_Prod: TOracleDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    ds_Prod: TDataSource;
    q_titleID: TStringField;
    q_titleSVED_DATE: TDateTimeField;
    q_titleSVED_VES: TFloatField;
    q_titleSVED_CNT: TIntegerField;
    q_titleGOTOV_TIME: TDateTimeField;
    q_titleBEG_NALIV_TIME: TDateTimeField;
    q_titleEND_NALIV_TIME: TDateTimeField;
    q_titleDATE_OFORML: TDateTimeField;
    q_titleVES_NETTO: TFloatField;
    q_titleVES_KVIT: TFloatField;
    q_titlePASP_NUM: TStringField;
    q_titleREZ_NUM: TStringField;
    q_titlePASP_DATE: TDateTimeField;
    q_titlePL: TFloatField;
    q_titleP_VOD: TFloatField;
    q_titleP_DIRT: TFloatField;
    q_titleMG_SOL: TFloatField;
    q_titleP_SOL: TFloatField;
    q_titlePROD_ID_NPR: TStringField;
    q_titlePROD_NAME: TStringField;
    q_rowsID: TFloatField;
    q_rowsSVED_IN_ID: TStringField;
    q_rowsMESTO_ID: TIntegerField;
    q_rowsTEX_PD_ID: TFloatField;
    q_rowsGROTP_ID: TFloatField;
    q_rowsSTAN_OTP_ID: TFloatField;
    q_rowsFORMNAKL_ID: TIntegerField;
    q_rowsNUM_KVIT: TFloatField;
    q_rowsDATE_KVIT: TDateTimeField;
    q_rowsPASP_NUM_KVIT: TStringField;
    q_rowsREZ_NUM_KVIT: TStringField;
    q_rowsPASP_DATE_KVIT: TDateTimeField;
    q_rowsVZLIV_KVIT: TIntegerField;
    q_rowsTEMPER_KVIT: TFloatField;
    q_rowsPL_KVIT: TFloatField;
    q_rowsVES_KVIT: TFloatField;
    q_rowsTARIF: TFloatField;
    q_rowsTARIF_GUARD: TFloatField;
    q_rowsDATE_IN_STAN: TDateTimeField;
    q_rowsDATE_OTGR: TDateTimeField;
    q_rowsNUM_CIST: TStringField;
    q_rowsVAGONTYPE_ID: TIntegerField;
    q_rowsKALIBR_ID: TStringField;
    q_rowsVES_CIST: TFloatField;
    q_rowsVAGOWNER_ID: TIntegerField;
    q_rowsCAPACITY: TStringField;
    q_rowsPLOMBA1: TStringField;
    q_rowsPLOMBA2: TStringField;
    q_rowsVZLIV: TIntegerField;
    q_rowsTEMPER: TFloatField;
    q_rowsFAKT_PL: TFloatField;
    q_rowsVES: TFloatField;
    q_rowsVES_NETTO: TFloatField;
    q_rowsDATE_VOZ: TDateTimeField;
    q_rowsKVIT_VOZ: TStringField;
    q_rowsSUM_VOZ: TFloatField;
    q_rowsSTAN_VOZ_ID: TFloatField;
    q_VagOwner: TOracleDataSet;
    ds_VagOwner: TDataSource;
    q_VagOwnerID: TFloatField;
    q_VagOwnerNAME: TStringField;
    q_VagOwnerSORTBY: TFloatField;
    q_StanVoz: TOracleDataSet;
    FloatField1: TFloatField;
    StringField4: TStringField;
    ds_StanVoz: TDataSource;
    q_rowsSTAN_OTP_NAME: TStringField;
    q_rowsVAGOWNER_NAME: TStringField;
    q_rowsSTAN_VOZ_NAME: TStringField;
    q_rowsSTAN_OTP_KOD: TIntegerField;
    q_rowsSTAN_VOZ_KOD: TIntegerField;
    q_rowsSVED_POS: TIntegerField;
    acSvedInRowsPost: TAction;
    TBItem19: TTBItem;
    acSvedInRowsCancel: TAction;
    q_rowsEMPTY_VOZ: TIntegerField;
    q_titleSVED_NUM: TFloatField;
    q_titleMESTO_ID: TFloatField;
    SaveDialog1: TSaveDialog;
    q_rowsVOLUME: TFloatField;
    q_rowsVOLUME15: TFloatField;
    q_rowsCTLV: TFloatField;
    acSvedInView: TAction;
    acFind: TAction;
    acSvedInRowsCalc: TAction;
    q_titlePL15: TFloatField;
    acRowsSprav: TAction;
    q_rowsGOST_ID: TIntegerField;
    q_rowsZPU_TYPE1: TFloatField;
    q_rowsZPU_TYPE2: TFloatField;
    q_rowsVybor: TIntegerField;
    q_temp_ves: TOracleDataSet;
    pkgFor_cist: TOraclePackage;
    pkgFor_ves: TOraclePackage;
    q_ZpuType1: TOracleDataSet;
    q_ZpuType1ID: TFloatField;
    q_ZpuType1NAME: TStringField;
    q_ZpuType2: TOracleDataSet;
    q_ZpuType2ID: TFloatField;
    q_ZpuType2NAME: TStringField;
    q_rowsZPU_TYPE1_NAME: TStringField;
    q_rowsZPU_TYPE2_NAME: TStringField;
    q_rowsBAD_NUM: TIntegerField;
    q_rowsNAKL_ID: TFloatField;
    q_rowsNAKL_NUM: TStringField;
    PageControl1: TPageControl;
    tabTitleInfo: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    lbProdName: TLabel;
    Date1: TDateTimePicker;
    Date2: TDateTimePicker;
    lc_Prod: TRxDBLookupCombo;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    bRefresh: TTBItem;
    TBItem3: TTBItem;
    TBItem2: TTBItem;
    TBItem4: TTBItem;
    TBItem1: TTBItem;
    TBItem10: TTBItem;
    GridTitle: TDBGridEh;
    tabTitleItogs: TTabSheet;
    Splitter1: TSplitter;
    gbRows: TGroupBox;
    TBDock3: TTBDock;
    TBToolbar3: TTBToolbar;
    TBItem22: TTBItem;
    TBItem28: TTBItem;
    TBItem30: TTBItem;
    TBItem31: TTBItem;
    TBItem32: TTBItem;
    TBItem6: TTBItem;
    TBItem33: TTBItem;
    TBItem34: TTBItem;
    TBDock2: TTBDock;
    tbOtgr: TTBToolbar;
    TBItem5: TTBItem;
    TBItem7: TTBItem;
    GridRows: TDBGridEh;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Date3: TDateTimePicker;
    Date4: TDateTimePicker;
    TBDock4: TTBDock;
    TBToolbar4: TTBToolbar;
    bRefreshItogs: TTBItem;
    GridItogs: TDBGridEh;
    q_itogs: TOracleDataSet;
    q_itogsPROD_ID_NPR: TStringField;
    q_itogsPROD_NAME: TStringField;
    q_itogsVAG_CNT: TFloatField;
    q_itogsSUM_VES: TFloatField;
    q_itogsSUM_VES_NETTO: TFloatField;
    q_itogsSUM_VES_KVIT: TFloatField;
    ds_itogs: TDataSource;
    q_itogsSVED_DATE: TDateTimeField;
    PopupItogs: TTBPopupMenu;
    TBItem36: TTBItem;
    TBSeparatorItem10: TTBSeparatorItem;
    TBItem42: TTBItem;
    TBSeparatorItem9: TTBSeparatorItem;
    TBItem8: TTBItem;
    TBItem18: TTBItem;
    TBItem20: TTBItem;
    TBItem23: TTBItem;
    TBItem35: TTBItem;
    TBItem37: TTBItem;
    TBSeparatorItem11: TTBSeparatorItem;
    TBItem38: TTBItem;
    TBSeparatorItem12: TTBSeparatorItem;
    TBItem39: TTBItem;
    q_rowsOSTAT: TIntegerField;
    acSvedInNakl: TAction;
    acSvedInUved: TAction;
    TBItem43: TTBItem;
    q_rowsUVED_ID: TIntegerField;
    q_rowsUVED_NUM: TStringField;
    q_rowsP_VOD_KVIT: TFloatField;
    q_rowsP_DIRT_KVIT: TFloatField;
    q_rowsP_SOL_KVIT: TFloatField;
    q_rowsVES_NETTO_KVIT: TFloatField;
    q_titleVES_NETTO_KVIT: TFloatField;
    q_rowsNUM_KVIT_TXT: TStringField;
    TBItem40: TTBItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acToXLSExecute(Sender: TObject);
    procedure acSvedInAddExecute(Sender: TObject);
    procedure acSvedInEditExecute(Sender: TObject);
    procedure acSvedInRowsAddExecute(Sender: TObject);
    procedure acSvedInRowsEditExecute(Sender: TObject);
    procedure acSvedInRowsCopyExecute(Sender: TObject);
    procedure acSvedInRowsDelExecute(Sender: TObject);
    procedure acPrintSvedExecute(Sender: TObject);
    procedure acFilterExecute(Sender: TObject);
    procedure acNoFilterExecute(Sender: TObject);
    procedure acSvedInCopyExecute(Sender: TObject);
    procedure acSvedInDelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridTitleColumns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure q_titleAfterScroll(DataSet: TDataSet);
    procedure bRefreshClick(Sender: TObject);
    procedure bRefreshRowsClick(Sender: TObject);
    procedure GridTitleExit(Sender: TObject);
    procedure GridRowsExit(Sender: TObject);
    procedure GridTitleSortMarkingChanged(Sender: TObject);
    procedure tbTitleFilterEditAcceptText(Sender: TObject;
      var NewText: String; var Accept: Boolean);
    procedure tbTitleFilterSelectionClick(Sender: TObject);
    procedure tbTitleFilterClearClick(Sender: TObject);
    procedure tbTitleWinEditClick(Sender: TObject);
    procedure tbRowsFilterEditAcceptText(Sender: TObject;
      var NewText: String; var Accept: Boolean);
    procedure tbRowsFilterSelectionClick(Sender: TObject);
    procedure tbRowsFilterClearClick(Sender: TObject);
    procedure tbRowsWinEditClick(Sender: TObject);
    procedure q_titleFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure q_rowsFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure q_titleAfterOpen(DataSet: TDataSet);
    procedure q_rowsAfterDelete(DataSet: TDataSet);
    procedure q_rowsAfterPost(DataSet: TDataSet);
    procedure q_rowsAfterInsert(DataSet: TDataSet);
    procedure q_rowsBeforeScroll(DataSet: TDataSet);
    procedure q_titleBeforeOpen(DataSet: TDataSet);
    procedure acSvedInRowsPostExecute(Sender: TObject);
    procedure q_rowsAfterScroll(DataSet: TDataSet);
    procedure GridRowsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure acSvedInRowsCancelExecute(Sender: TObject);
    procedure GridTitleGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure acSvedInViewExecute(Sender: TObject);
    procedure acFindExecute(Sender: TObject);
    procedure CheckTime(Sender: TObject);
    procedure acSvedInRowsCalcExecute(Sender: TObject);
    procedure acRowsSpravExecute(Sender: TObject);
    procedure q_rowsTEMPERValidate(Sender: TField);
    procedure q_rowsKALIBR_IDValidate(Sender: TField);
    procedure q_rowsVZLIVValidate(Sender: TField);
    procedure GridRowsGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure GridRowsCellClick(Column: TColumnEh);
    procedure q_rowsCalcFields(DataSet: TDataSet);
    procedure q_rowsNUM_CISTChange(Sender: TField);
    procedure q_rowsBeforePost(DataSet: TDataSet);
    procedure GridRowsEmptyField(Sender: TObject;
      var Text: String; var Value: Variant; var UseText, Handled: Boolean);
    procedure acSvedInNaklExecute(Sender: TObject);
    procedure CheckTimeItogs(Sender: TObject);
    procedure bRefreshItogsClick(Sender: TObject);
    procedure q_itogsBeforeOpen(DataSet: TDataSet);
    procedure TBItem36Click(Sender: TObject);
    procedure TBItem42Click(Sender: TObject);
    procedure TBItem15Click(Sender: TObject);
    procedure TBItem8Click(Sender: TObject);
    procedure TBItem38Click(Sender: TObject);
    procedure TBItem39Click(Sender: TObject);
    procedure acSvedInUvedExecute(Sender: TObject);
    procedure GridRowsKeyPress(Sender: TObject; var Key: Char);
    procedure GridRowsSortMarkingChanged(Sender: TObject);
  private
    { Private declarations }
    // ������
    Filter2title: TStringList; // ������ ��� ������� � GridTitle
    Filter2rows: TStringList; // ������ ��� ������� � GridRows
    ViewLinkMode:integer; // 1-������ �� ������
    ViewLinkFilter:string; // ������ ������� �� ������
    // ��� ����������
    IsRefresh: boolean; // � ������ ������ ���������� ���������� �������
    // �������� ����� ���������� ������
    vNextState:TDataSetState;
    //������� ��������� � �����
    IsNeedCalc: boolean;
    vPrevNumKvit:variant;
    vPrevDateKvit:variant;
    vPrevVagowner:variant;
    vPrevDateInStan:variant;
    vPrevDateVoz:variant;
    vPrevKvitVoz:variant;
    vPrevStanVoz:variant;
    vPrevPlomba1:variant;
    vPrevPlomba2:variant;
    vPrevPVodKvit:variant;
    vPrevPSolKvit:variant;
    vPrevPDirtKvit:variant;
    CurrentSTAN_VOZ:string;
    DocTitleID:string;//ID �����. ���-�� ��� ��������� ������
    Vybor:array [1..100] of byte;
    VagTypes:set of 1..20;
    procedure InitVagonParams;
    procedure ExecuteSearch;
  public
    { Public declarations }
    QueryBegin,QueryEnd:TDateTime;
    DocMestoId:integer; // ����� ��������
    DocType:integer; // ��� ���������
    DocNeft:boolean; // true - ���� �����, false - ��������� �������
    DocMode:integer; // 1-�������������� ����, 2-�����������������, 3-��������, 4-���������� ������ �� ���������
    tmp:integer;
  end;

var
  f_SvedIn: Tf_SvedIn;
  gLinkMode:integer; // ����� ���������: 1-������ �� ������ 0-����������� ��������
  gLinkFilter:string; // ������ ��� ������� �� ������
  gMesto:integer; // ����� ��������
  gNeft:boolean; // true - ���� �����, false - ��������� �������
  gMode:integer; // 1-�������������� ����, 2-�����������������, 3-��������

implementation

uses main, ForDB, SvedInNew, ForSESS, KlsMisc2, ForTemp, ForFiles,
  MO_Find, MO_NaklVozNew, MO_UvedVozNew;

{$R *.dfm}

{ DONE -oPSV -c����� : ************************* ������ ����� ************************* }

{ DONE -oPSV -c����� : �������� ����� }
procedure Tf_SvedIn.FormCreate(Sender: TObject);
var i:integer;
begin
  inherited;
  //������� ��������� � �����
  IsNeedCalc:=false;
  // Popup-������
  Filter2title:=TStringList.Create;
  Filter2title.Clear;
  Filter2rows:=TStringList.Create;
  Filter2rows.Clear;
  // ������ �� ����� (�������������� ��������)
  Date1.Date:=Date-1;
  Date2.Date:=Date+1;
  Date3.Date:=Date;
  Date4.Date:=Date;
  // ������ �� ������
  ViewLinkMode:=gLinkMode;
  ViewLinkFilter:=gLinkFilter;
  gLinkMode:=0;
  gLinkFilter:='';
  // ����� ��������
  DocMestoId:=gMesto;
  gMesto:=-1;
  // ��� ��������� - �������� � ��������� (����� �����)
  DocType:=2;
  DocNeft:=gNeft;
  gNeft:=false;
  DocMode:=gMode;
  gMode:=-1;

  // ������
  f_db.LogonMasterSession(ora_Session);
  f_db.SetUserGrants(ActionManager1);

  if f_db.CheckGrant('acSvedInRowsEdit') then
  Begin
    q_Rows.ReadOnly:=false;
  End
  else
  Begin
    q_Rows.ReadOnly:=true;
  end;

  if f_db.CheckGrant('acSvedInRowsAdd') then
  Begin
    GridRows.AllowedOperations := GridRows.AllowedOperations + [alopAppendEh];
  End
  else
  Begin
    GridRows.AllowedOperations := GridRows.AllowedOperations - [alopAppendEh];
  end;

  // �������� ��������
  f_db.ReQuery(q_VagOwner,false);
  f_db.ReQuery(q_StanVoz,false);

  if DocNeft then
  Begin
    q_Prod.SQL[4]:='AND ID_NPR BETWEEN ''90000'' AND ''90099''';
    lbProdName.Caption:='��� �����:';
    q_title.SQL[5]:=' AND PROD_ID_NPR BETWEEN ''90000'' AND ''90099''';
    Caption:='�������� � ����� �����';
  end
  else
  Begin
    q_Prod.SQL[4]:='AND NOT (ID_NPR BETWEEN ''90000'' AND ''90099'')';
    lbProdName.Caption:='����:';
    q_title.SQL[5]:=' AND NOT (PROD_ID_NPR BETWEEN ''90000'' AND ''90099'')';
    Caption:='�������� � ���������';
  end;
  f_db.ReQuery(q_Prod,false);
  q_title.SetVariable('MESTO_ID',DocMestoId);
  IsRefresh:=true;
  f_db.ReQuery(q_title,false);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);

  q_itogs.SetVariable('MESTO_ID',DocMestoId);
  f_db.ReQuery(q_itogs,false);

  // ����� ������
  if DocMode=4 then
  Begin
    Caption:=Caption+' (���������� ������ �� ���������)';
    // ����� "���������� ������ �� ���������"
    for i:=1 to GridRows.Columns.Count do
    Begin
      with GridRows.Columns[i-1] do
      Begin
        Visible:=((FieldName='NUM_CIST') or (FieldName='VZLIV') or (FieldName='TEMPER') or (FieldName='FAKT_PL') or
                  (FieldName='VES') or (FieldName='VES_NETTO') or (FieldName='VES_KVIT') or (FieldName='P_DIRT_KVIT') or (FieldName='P_SOL_KVIT') or (FieldName='P_VOD_KVIT') or (FieldName='VES_NETTO_KVIT') or (FieldName='DATE_IN_STAN') or
                  (FieldName='NUM_KVIT_TXT') or (FieldName='DATE_KVIT') or (FieldName='CTLV') or (FieldName='VOLUME') or (FieldName='VOLUME15') or
                  (FieldName='ID') or (FieldName='SVED_IN_ID') or (FieldName='SVED_POS')or (FieldName='KALIBR_ID'));
        ReadOnly:=not ((FieldName='P_VOD_KVIT') or (FieldName='P_SOL_KVIT') or (FieldName='P_DIRT_KVIT') or (FieldName='VES_NETTO_KVIT'));
      End;
    End;
    GridRows.FrozenCols:=2;
    tbOtgr.Visible:=false;
  End;
  if DocMode=3 then
  Begin
    Caption:=Caption+' (��������)';
    // ����� "��������"
    for i:=1 to GridRows.Columns.Count do
    Begin
      with GridRows.Columns[i-1] do
      Begin
        Visible:=((FieldName='NUM_CIST') or (FieldName='VZLIV') or (FieldName='TEMPER') or (FieldName='FAKT_PL') or
                  (FieldName='VES') or (FieldName='VES_NETTO') or (FieldName='VES_KVIT') or (FieldName='VES_NETTO_KVIT') or (FieldName='DATE_IN_STAN') or
                  (FieldName='NUM_KVIT_TXT') or (FieldName='DATE_KVIT') or (FieldName='CTLV') or (FieldName='VOLUME') or (FieldName='VOLUME15') or
                  (FieldName='ID') or (FieldName='OSTAT') or (FieldName='SVED_IN_ID') or (FieldName='SVED_POS')or (FieldName='KALIBR_ID'));
        ReadOnly:=true;
      End;
    End;
    GridRows.FrozenCols:=2;
    tbOtgr.Visible:=false;
  End;
  // ����� ������
  if DocMode=2 then
  Begin
    Caption:=Caption+' (�����������������)';
    // ����� "�����������������"
    for i:=1 to GridRows.Columns.Count do
    Begin
      with GridRows.Columns[i-1] do
      Begin
        Visible:=((FieldName='NUM_CIST') or (FieldName='VAGOWNER_NAME') or (FieldName='NUM_KVIT_TXT') or (FieldName='DATE_KVIT') or (FieldName='KALIBR_ID') or
                  (FieldName='VES_KVIT') or (FieldName='VES_NETTO_KVIT') or (FieldName='TARIF') or (FieldName='DATE_IN_STAN') or (FieldName='DATE_VOZ') or
                  (FieldName='EMPTY_VOZ') or (FieldName='KVIT_VOZ') or (FieldName='STAN_VOZ_KOD') or (FieldName='STAN_VOZ_NAME') or
                  (FieldName='ID') or (FieldName='SVED_IN_ID') or (FieldName='SVED_POS') or (FieldName='VES'));
        ReadOnly:=((FieldName='ID') or (FieldName='SVED_IN_ID') or (FieldName='VES'));
      End;
    End;
    GridRows.FrozenCols:=2;
    tbOtgr.Visible:=false;
  End;
  // ����� ������
  if DocMode=1 then
  Begin
    Caption:=Caption+' (����)';
    // ����� "����"
    for i:=1 to GridRows.Columns.Count do
    Begin
      with GridRows.Columns[i-1] do
      Begin
        Visible:=((FieldName='Vybor') or (FieldName='SVED_POS') or (FieldName='NUM_CIST') or (FieldName='KALIBR_ID') or
                  (FieldName='CAPACITY') or (FieldName='VES_CIST') or (FieldName='VAGOWNER_NAME') or (FieldName='VES') or (FieldName='VES_NETTO') or
                  (FieldName='VZLIV') or (FieldName='VOLUME') or (FieldName='TEMPER') or (FieldName='FAKT_PL') or (FieldName='CTLV') or
                  (FieldName='VOLUME15')or (FieldName='OSTAT') or (FieldName='ZPU_TYPE1_NAME') or (FieldName='PLOMBA1') or (FieldName='ZPU_TYPE2_NAME') or (FieldName='PLOMBA2') or
                  (FieldName='NAKL_NUM') or (FieldName='UVED_NUM'));
        ReadOnly:=((FieldName='ID') or (FieldName='SVED_IN_ID'));
      End;
    End;
    GridRows.FrozenCols:=3;
  End;
end;

{ DONE -oPSV -c����� : �������� ����� }
procedure Tf_SvedIn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  // ����������� ������
  try
    filter2title.Clear;
  except
  end;
  try
    filter2rows.Clear;
  except
  end;
  // ��������� ������
  GridRowsExit(Sender);
  GridTitleExit(Sender);
  ora_Session.Commit;
  ora_Session.Connected:=false;
  // ��������� ����
  Action:=caFree;
end;





{ DONE -oPSV -cTitle_Actions: ************************* ��������� ���������� - ������� ************************* }

{ DONE -oPSV -cTitle_Actions : �������� q_title}
procedure Tf_SvedIn.bRefreshClick(Sender: TObject);
begin
  inherited;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);
  // ��������� ������
  IsRefresh:=true;
  q_title.SetVariable(':TITLE_ID','');
  f_db.ReQuery(q_title,true);
  IsRefresh:=false;
  // �������� � ������������ ����������� �������
  q_titleAfterScroll(q_title);
end;

{ TODO -cTitle_Actions -oPSV : ���������� � Excel }
procedure Tf_SvedIn.acToXLSExecute(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
    if not FileExists(SaveDialog1.FileName) then
      begin
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,gridRows,SaveDialog1.FileName,True);
        FileExecute(SaveDialog1.FileName,'','',esMaximized);
      end
    else
      if MessageDlg('���� ��� ����������! ����������?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,gridRows,SaveDialog1.FileName,True);
          FileExecute(SaveDialog1.FileName,'','',esMaximized);
        end;
end;

{ TODO -oPSV -cTitle_Actions : ������ ��������� }
procedure Tf_SvedIn.acPrintSvedExecute(Sender: TObject);
begin
  inherited;
  // ��������
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  // ��������� ID ��������
  TempVari.SetVariChar('SVED_ID', q_titleID.AsString, 'MASTER', 'MO_SVED');
  // ����������� XLS �� ��������� �������
  F_FileUtils.CheckReport('MO_sved.XLS',f_main.TempNetPath+'MO_sved.XLS');
  // ������� Excel
  F_FileUtils.OpenWorkbook(f_main.TempNetPath+'MO_sved.XLS',DocType);
end;

{ TODO -oPSV -cTitle_Actions : ��������� ����� }
procedure Tf_SvedIn.acFilterExecute(Sender: TObject);
begin
  inherited;
  {}
end;

{ TODO -oPSV -cTitle_Actions : �������� ����� }
procedure Tf_SvedIn.acNoFilterExecute(Sender: TObject);
begin
  inherited;
  {}
end;

{ DONE -cTitle_Actions -oPSV : �������� �������� }
procedure Tf_SvedIn.acSvedInAddExecute(Sender: TObject);
begin
  inherited;
  // ��������
  if not q_title.Active then exit;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // ���������� ��������
  with tf_SvedInNew.create(self) do
  Begin
    EditId:='';
    IsNeft:=DocNeft;
    EditMode:=0;
    if ShowModal=mrOk then
    Begin
      // ��������������� �� ��������
      IsRefresh:=true;
      f_db.ReQuery(q_Title,false);
      q_Title.Locate('ID',EditId,[]);
      IsRefresh:=false;
      // �������� � ������������ ����������� �������
      q_titleAfterScroll(q_title);
    end;
    Free;
  end;
end;

{ DONE -cTitle_Actions -oPSV : ����������� �������� }
procedure Tf_SvedIn.acSvedInEditExecute(Sender: TObject);
begin
  inherited;
  // ��������
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // �������������� ��������
  with tf_SvedInNew.create(self) do
  Begin
    EditId:=q_title.FieldByName('ID').AsString;
    IsNeft:=DocNeft;
    EditMode:=1;
    if ShowModal=mrOk then
    Begin
      if IsNeedReCalcVes then acSvedInRowsCalcExecute(Sender);
      // ��������������� �� ��������
      IsRefresh:=true;
      f_db.ReQuery(q_Title,false);
      q_Title.Locate('ID',EditId,[]);
      IsRefresh:=false;
      // �������� � ������������ ����������� �������
      q_titleAfterScroll(q_title);
    end;
    Free;
  end;
end;

{ DONE -oPSV -cTitle_Actions : ���������� �������� }
procedure Tf_SvedIn.acSvedInCopyExecute(Sender: TObject);
begin
  inherited;
  // ��������
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // ����������� ���������
  with tf_SvedInNew.create(self) do
  Begin
    EditId:=q_title.FieldByName('ID').AsString;
    EditMode:=0;
    IsNeft:=DocNeft;
    if ShowModal=mrOk then
    Begin
      // �������������� �� ��������
      IsRefresh:=true;
      f_db.ReQuery(q_Title,false);
      q_Title.Locate('ID',EditId,[]);
      IsRefresh:=false;
      // �������� � ������������ ����������� �������
      q_titleAfterScroll(q_title);
    end;
    Free;
  end;
end;

{ DONE -oPSV -cTitle_Actions : ������� �������� }
procedure Tf_SvedIn.acSvedInDelExecute(Sender: TObject);
var NextId:string;
begin
  inherited;
  // ��������
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // �������� ���������
  if Application.MessageBox(PChar('������� �������� � '+q_titleSVED_NUM.AsString+' ?'),'��������!',MB_YESNO)=IDYES then
  Begin
    try
      q_Title.DisableControls;
      pkgFOR_SVED_IN.CallProcedure('DelTitle',[1,q_Title.FieldByName('ID').AsString]);
      q_Title.Next;
    except
      on E:Exception do
      Begin
        f_main.ApplSession.WriteToLog(amFull,'SVED_IN',sesError,E.Message,0,'');
      end;
    end;
    // ��������������� �� ��������� ��������
    NextID:=q_Title.FieldByName('ID').AsString;
    IsRefresh:=true;
    f_db.ReQuery(q_Title,false);
    q_Title.Locate('ID',NextId,[]);
    IsRefresh:=false;
    q_titleAfterScroll(q_title);
    q_Title.EnableControls;
  End;
end;

{ DONE -oPSV -cTitle_Query : ************************* ��������� ���������� - ������ q_title ************************* }

{ DONE -oPSV -cTitle_Query : �������� �� �������� q_title }
procedure Tf_SvedIn.q_titleBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  // ��������� ������ �� �����
  q_title.SQL[6]:=' AND sved_date>=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date1.Date)+''',''dd.mm.yyyy'')';
  q_title.SQL[7]:=' AND sved_date<=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date2.Date)+''',''dd.mm.yyyy'')';
  if VarType(lc_Prod.KeyValue)<>varNull then
  Begin
    q_title.SQL[8]:=' AND PROD_ID_NPR='''+lc_Prod.KeyValue+'''';
  end
  else
  Begin
    q_title.SQL[8]:=' AND 1=1';
  End;
  q_title.SQL.SaveToFile('c:\tmp\1.sql');
end;

{ DONE -oPSV -cTitle_Query : �������� ����� �������� q_title }
procedure Tf_SvedIn.q_titleAfterOpen(DataSet: TDataSet);
var i:integer;
begin
  inherited;
  // ���������� Popup-�������
  if filter2title.Count=0 then
    for i:=1 to q_title.FieldCount+1 do
    Begin
      Filter2title.Add('');
    end;
end;

{ DONE -oPSV -cTitle_Query : ����� ����� ������� ������ q_title }
procedure Tf_SvedIn.q_titleAfterScroll(DataSet: TDataSet);
var i:integer;
begin
  inherited;
  if IsRefresh then exit;
  // ��������� �������
  f_db.ReQuery(q_rows,false);
  // ���������� Popup-�������
  if filter2rows.Count=0 then
    for i:=1 to q_rows.FieldCount+1 do
    Begin
      Filter2rows.Add('');
    end;

  if q_title.IsEmpty then exit;
  gbRows.Caption:=' ������� �������� � '+q_title.FieldByName('SVED_NUM').AsString+' ';

  if NOT Active then exit;
  // �������� ������ � �������� �����

end;

{ DONE -oPSV -cTitle_Query : ��������� ������ � ������� }
procedure Tf_SvedIn.q_titleFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept:=f_db.AcceptFilterRecord(gridTitle,filter2title);
end;


{ DONE -oPSV -cTitle_Grid : ************************* ��������� ���������� - GridTitle ************************* }

{ DONE -oPSV -cTitle_Grid : �������� ������� "� �/�" (GridTitle)}
procedure Tf_SvedIn.GridTitleColumns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
  inherited;
  try
    Params.Text:=IntToStr(q_title.RecNo);
  except
    Params.Text:='0';
  end;
end;

{ DONE -oPSV -cTitle_Grid : ������� ��� ������ �� GridTitle
     ��������� ��������� � ������� (q_title.Post)
}
procedure Tf_SvedIn.GridTitleExit(Sender: TObject);
begin
  inherited;
  if q_title.Active and (q_title.State<>dsBrowse) then q_title.Post;
end;

{ DONE -oPSV -cTitle_Grid : ���������� � GridTitle }
procedure Tf_SvedIn.GridTitleSortMarkingChanged(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.SortInGrid(q_title,q_title.SQL.Count-1,GridTitle);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

{ TODO -oPSV -cTitle_Grid : ��������� �������� ������ }
procedure Tf_SvedIn.GridTitleGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
end;

{ TODO -oPSV -cTitle_Grid : ������� �������� ���� "������� ��������" }
procedure Tf_SvedIn.GridRowsEmptyField(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
var
  vOldState:TDataSetState;
begin
  inherited;

  if (GridRows.Columns[GridRows.Col-1].FieldName='STAN_VOZ_KOD') or
     (GridRows.Columns[GridRows.Col-1].FieldName='STAN_VOZ_NAME') then
  Begin
    if Value='' then
    Begin
        vOldState:=q_rows.State;
        if q_rows.State=dsBrowse then
        Begin
          q_rows.Edit;
        end;
        q_rows.FieldByName('STAN_VOZ_ID').Clear;
        if vOldState=dsBrowse then
        Begin
          q_rows.Post;
        end;
    End;
    Handled:=true;
  end;
end;

{ DONE -oPSV -cTitle_Popup : ************************* ��������� ���������� - Popup ************************* }

{ DONE -oPSV -cTitle_Popup : ������ ����� ��� ������� }
procedure Tf_SvedIn.tbTitleFilterEditAcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterAcceptText(gridTitle,filter2title,NewText,Accept);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

{ DONE -oPSV -cTitle_Popup : ������ �� �����������  }
procedure Tf_SvedIn.tbTitleFilterSelectionClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCurrentValue(gridTitle,filter2title);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

{ DONE -oPSV -cTitle_Popup : �������� ������  }
procedure Tf_SvedIn.tbTitleFilterClearClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCLear(gridtitle,filter2title);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

{ DONE -oPSV -cTitle_Popup : ������������� � ���� }
procedure Tf_SvedIn.tbTitleWinEditClick(Sender: TObject);
begin
  inherited;
  f_db.EditInMemo(gridTitle);
end;


{ DONE -oPSV -cRows_Actions : ************************* ������� ���������� - ������� ************************* }

{ DONE -oPSV -cRows_Actions : �������� q_rows }
procedure Tf_SvedIn.bRefreshRowsClick(Sender: TObject);
begin
  inherited;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);
  // ��������� ������
  f_db.ReQuery(q_rows,true);
end;

{ DONE -oPSV -cRows_Actions : ���������� ������� }
procedure Tf_SvedIn.acSvedInRowsAddExecute(Sender: TObject);
begin
  inherited;
  // ��������
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // ������� ���������
  IsRefresh:=true;
  f_db.ReQuery(q_Title,true);
  IsRefresh:=false;

  GridRows.SetFocus;

  // ���������� �������
  q_rows.Append;
end;

{ DONE -oPSV -cRows_Actions : ��������������  ������� }
procedure Tf_SvedIn.acSvedInRowsEditExecute(Sender: TObject);
begin
  inherited;
  // ��������
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  if q_rows.IsEmpty then exit;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // ������� ���������
  IsRefresh:=true;
  f_db.ReQuery(q_Title,true);
  IsRefresh:=false;

  GridRows.SetFocus;

  // �������������� �������
  q_rows.Edit;
end;

{ DONE -oPSV -cRows_Actions : �����������  ������� }
procedure Tf_SvedIn.acSvedInRowsCopyExecute(Sender: TObject);
begin
  inherited;
  // ��������
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  if q_rows.IsEmpty then exit;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // ������� ���������
  IsRefresh:=true;
  f_db.ReQuery(q_Title,true);
  IsRefresh:=false;

  GridRows.SetFocus;

  // ����������� �������
  q_rows.Append;
  // ��������� ����������� ����������
  q_rows.FieldByName('NUM_KVIT_TXT').AsVariant:=vPrevNumKvit;
  q_rows.FieldByName('DATE_KVIT').AsVariant:=vPrevDateKvit;
  q_rows.FieldByName('VAGOWNER_ID').AsVariant:=vPrevVagowner;
  q_rows.FieldByName('DATE_IN_STAN').AsVariant:=vPrevDateInStan;
  q_rows.FieldByName('DATE_VOZ').AsVariant:=vPrevDateVoz;
  q_rows.FieldByName('KVIT_VOZ').AsVariant:=vPrevKvitVoz;
  q_rows.FieldByName('STAN_VOZ_ID').AsVariant:=vPrevStanVoz;
end;

{ DONE -oPSV -cRows_Actions : ��������  ������� }
procedure Tf_SvedIn.acSvedInRowsDelExecute(Sender: TObject);
var NextId:integer;
begin
  inherited;
  // ��������
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  if q_rows.IsEmpty then exit;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  GridRows.SetFocus;

  // �������� �������
  if Application.MessageBox('������� ������?','��������!',MB_YESNO)=IDYES then
  Begin
    try
      q_Rows.DisableControls;
      pkgFOR_SVED_IN.CallProcedure('DelRow',[1,q_Rows.FieldByName('ID').Value]);
      q_Rows.Next;
    except
      on E:Exception do
      Begin
        f_main.ApplSession.WriteToLog(amFull,'SVED_IN',sesError,E.Message,0,'');
      end;
    end;
    // ��������������� �� ��������� ������
    NextID:=q_Rows.FieldByName('ID').Value;
    f_db.ReQuery(q_Rows,false);
    q_Rows.Locate('ID',NextId,[]);
    q_Rows.EnableControls;
    q_rowsAfterDelete(q_rows);
  End;
end;

{ DONE -oPSV -cRows_Actions : ��������� ��������� � ������� � ��������� }
procedure Tf_SvedIn.acSvedInRowsPostExecute(Sender: TObject);
begin
  inherited;
  // ��������� ���������
  if q_Rows.ReadOnly then exit;
  GridTitleExit(Sender);
  GridRowsExit(Sender);
end;

{ DONE -oPSV -cRows_Actions : �������� ��������� � ������� � ��������� }
procedure Tf_SvedIn.acSvedInRowsCancelExecute(Sender: TObject);
begin
  inherited;
  if q_title.Active and (q_title.State<>dsBrowse) then q_title.Cancel;
  if q_rows.Active and (q_rows.State<>dsBrowse) then q_rows.Cancel;
end;

{ DONE -oPSV -cRows_Query : ************************* ������� ���������� - ������ q_rows ************************* }

{ DONE -oPSV -cRows_Query : ��������� ������ � q_rows }
procedure Tf_SvedIn.q_rowsFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept:=f_db.AcceptFilterRecord(gridRows,filter2rows);
end;

{ DONE -oPSV -cRows_Query : �������� ����� �������� �� q_rows }
procedure Tf_SvedIn.q_rowsAfterDelete(DataSet: TDataSet);
begin
  inherited;
  // �������� ���������
  IsRefresh:=true;
  f_db.ReQuery(q_title,true);
  IsRefresh:=false;
end;

{ DONE -oPSV -cRows_Query : �������� ����� �������� ��������� (Post) q_rows }
procedure Tf_SvedIn.q_rowsAfterPost(DataSet: TDataSet);
begin
  inherited;
  // �������� ���������
  IsRefresh:=true;
  f_db.ReQuery(q_title,true);
  IsRefresh:=false;
end;

{ DONE -oPSV -cRows_Query : �������� ����� ���������� ������ � q_rows }
procedure Tf_SvedIn.q_rowsAfterInsert(DataSet: TDataSet);
begin
  inherited;
  // �������� �� ���������
  q_rows.FieldByName('SVED_IN_ID').AsString:=q_title.FieldByName('ID').AsString;
  q_rows.FieldByName('SVED_POS').AsFloat:=pkgFOR_SVED_IN.CallFloatFunction('GetMaxNumPos',[q_title.FieldByName('ID').AsString]);
  q_rows.FieldByName('MESTO_ID').AsInteger:=DocMestoID;
  q_rows.FieldByName('DATE_OTGR').AsDateTime:=q_title.FieldByName('SVED_DATE').AsDateTime;
  q_rows.FieldByName('NUM_KVIT_TXT').AsVariant:=vPrevNumKvit;
  q_rows.FieldByName('DATE_KVIT').AsVariant:=vPrevDateKvit;
  q_rows.FieldByName('VAGOWNER_ID').AsVariant:=vPrevVagowner;
  q_rows.FieldByName('DATE_IN_STAN').AsVariant:=vPrevDateInStan;
  q_rows.FieldByName('DATE_VOZ').AsVariant:=vPrevDateVoz;
  q_rows.FieldByName('KVIT_VOZ').AsVariant:=vPrevKvitVoz;
  q_rows.FieldByName('STAN_VOZ_ID').AsVariant:=vPrevStanVoz;

  q_rows.FieldByName('EMPTY_VOZ').AsVariant:=0;
  q_rows.FieldByName('GOST_ID').AsVariant:=0;

  GridRows.SelectedField:=q_Rows.FieldByName('NUM_CIST');

end;

{ DONE -oPSV -cRows_Query : �������� ����� ������ ������� ������ � q_rows }
procedure Tf_SvedIn.q_rowsBeforeScroll(DataSet: TDataSet);
begin
  inherited;
    // �������� ���������� ������
  vPrevNumKvit:=q_rows.FieldByName('NUM_KVIT_TXT').AsVariant;
  vPrevDateKvit:=q_rows.FieldByName('DATE_KVIT').AsVariant;
  vPrevVagowner:=q_rows.FieldByName('VAGOWNER_ID').AsVariant;
  vPrevDateInStan:=q_rows.FieldByName('DATE_IN_STAN').AsVariant;
  vPrevDateVoz:=q_rows.FieldByName('DATE_VOZ').AsVariant;
  vPrevKvitVoz:=q_rows.FieldByName('KVIT_VOZ').AsVariant;
  vPrevStanVoz:=q_rows.FieldByName('STAN_VOZ_ID').AsVariant;
  vPrevPlomba1:=q_rows.FieldByName('PLOMBA1').AsVariant;
  vPrevPlomba2:=q_rows.FieldByName('PLOMBA2').AsVariant;
  vPrevPVodKvit:=q_rows.FieldByName('P_VOD_KVIT').AsVariant;
  vPrevPSolKvit:=q_rows.FieldByName('P_SOL_KVIT').AsVariant;
  vPrevPDirtKvit:=q_rows.FieldByName('P_DIRT_KVIT').AsVariant;
end;

{ DONE -oPSV -cRows_Query : �������� ����� ����� ������� ������ � q_rows }
procedure Tf_SvedIn.q_rowsAfterScroll(DataSet: TDataSet);
var PlombaInt: integer;
    PlombaStr: string;
    OrigLen: integer;
    NewLen: integer;
    i: integer;
begin
  //inherited;
  if (vNextState=dsEdit) and (q_rows.State=dsBrowse) then
  Begin
    // �������� � ������ �������������� ��������� ���� ��������� �� ������ ����
    vNextState:=dsBrowse;
    q_rows.Edit;
    if GridRows.Columns[GridRows.Col-1].FieldName='NUM_KVIT_TXT' then
      if q_rows.FieldByName('NUM_KVIT_TXT').IsNull then
        q_rows.FieldByName('NUM_KVIT_TXT').AsVariant:=vPrevNumKvit;
    if GridRows.Columns[GridRows.Col-1].FieldName='DATE_KVIT' then
      if q_rows.FieldByName('DATE_KVIT').IsNull then
        q_rows.FieldByName('DATE_KVIT').AsVariant:=vPrevDateKvit;
    if GridRows.Columns[GridRows.Col-1].FieldName='VAGOWNER_NAME' then
      if q_rows.FieldByName('VAGOWNER_ID').IsNull then
        q_rows.FieldByName('VAGOWNER_ID').AsVariant:=vPrevVagowner;
    if GridRows.Columns[GridRows.Col-1].FieldName='DATE_IN_STAN' then
      if q_rows.FieldByName('DATE_IN_STAN').IsNull then
        q_rows.FieldByName('DATE_IN_STAN').AsVariant:=vPrevDateInStan;
    if GridRows.Columns[GridRows.Col-1].FieldName='DATE_VOZ' then
      if q_rows.FieldByName('DATE_VOZ').IsNull then
        q_rows.FieldByName('DATE_VOZ').AsVariant:=vPrevDateVoz;
    if GridRows.Columns[GridRows.Col-1].FieldName='KVIT_VOZ' then
      if q_rows.FieldByName('KVIT_VOZ').IsNull then
        q_rows.FieldByName('KVIT_VOZ').AsVariant:=vPrevKvitVoz;
    if (GridRows.Columns[GridRows.Col-1].FieldName='STAN_VOZ_KOD') or
       (GridRows.Columns[GridRows.Col-1].FieldName='STAN_VOZ_NAME') then
      if q_rows.FieldByName('STAN_VOZ_ID').IsNull then
        q_rows.FieldByName('STAN_VOZ_ID').AsVariant:=vPrevStanVoz;
    if GridRows.Columns[GridRows.Col-1].FieldName='PLOMBA1' then
      if q_rows.FieldByName('PLOMBA1').IsNull then
      try
        OrigLen:=Length(vPrevPlomba1);
        PlombaInt:=StrToInt(vPrevPlomba1)+1;
        PlombaStr:=IntToStr(PlombaInt);
        NewLen:=Length(PlombaStr);
        for i:=1 to (Origlen-NewLen) do
        begin
          PlombaStr:='0'+PlombaStr;
        end;
        q_rows.FieldByName('PLOMBA1').AsString:=PlombaStr;
      except
      end;
    if GridRows.Columns[GridRows.Col-1].FieldName='PLOMBA2' then
      if q_rows.FieldByName('PLOMBA2').IsNull then
      try
        OrigLen:=Length(vPrevPlomba2);
        PlombaInt:=StrToInt(vPrevPlomba2)+1;
        PlombaStr:=IntToStr(PlombaInt);
        NewLen:=Length(PlombaStr);
        for i:=1 to (Origlen-NewLen) do
        begin
          PlombaStr:='0'+PlombaStr;
        end;
        q_rows.FieldByName('PLOMBA2').AsVariant:=PlombaStr;
      except
      end;
    if GridRows.Columns[GridRows.Col-1].FieldName='P_VOD_KVIT' then
      if q_rows.FieldByName('P_VOD_KVIT').IsNull then
        q_rows.FieldByName('P_VOD_KVIT').AsVariant:=vPrevPVodKvit;
    if GridRows.Columns[GridRows.Col-1].FieldName='P_SOL_KVIT' then
      if q_rows.FieldByName('P_SOL_KVIT').IsNull then
        q_rows.FieldByName('P_SOL_KVIT').AsVariant:=vPrevPSolKvit;
    if GridRows.Columns[GridRows.Col-1].FieldName='P_DIRT_KVIT' then
      if q_rows.FieldByName('P_DIRT_KVIT').IsNull then
        q_rows.FieldByName('P_DIRT_KVIT').AsVariant:=vPrevPDirtKvit;
  End;
end;


{ DONE -oPSV -cRows_Grid : ************************* ������� ���������� - GridRows ************************* }

{ DONE -oPSV -cRows_Grid :
������� ��� ������ �� GridRows
     ��������� ��������� � ������� (q_rows.Post) }
procedure Tf_SvedIn.GridRowsExit(Sender: TObject);
begin
  inherited;
  if q_rows.Active and (q_rows.State<>dsBrowse) then q_rows.Post;
end;

{ DONE -oPSV -cRows_Grid : �������� �� ������� ������� (GridRows) }
procedure Tf_SvedIn.GridRowsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  // ��������
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  if q_rows.IsEmpty then exit;

  if (Key=VK_DOWN) and (q_rows.State<>dsBrowse) then
  begin
    // ������ ������ "����" � ������ � ���� ������ ��������� � ������ ��������������,
    // ������ ����� ����� �������� �� ��������� ������, ����� ������� � ����� ��������������
    // � ��������� ���� ���������� �� ������� ������ (���� ��� ������)
    vNextState:=dsEdit;
  end
  else
  begin
    vNextState:=dsBrowse;
  end;

  if (Key=VK_DECIMAL) then
  Begin
    Key:=VK_DECIMAL;
  End;
end;


{ DONE -oPSV -cRows_Popup : ************************* ������� ���������� - Popup ************************* }

{ DONE -oPSV -cRows_Popup : ��������� ������ (GridRows) }
procedure Tf_SvedIn.tbRowsFilterEditAcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterAcceptText(gridRows,filter2rows,NewText,Accept);
  IsRefresh:=false;
end;

{ DONE -oPSV -cRows_Popup : ������  �� ����������� (GridRows) }
procedure Tf_SvedIn.tbRowsFilterSelectionClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCurrentValue(gridRows,filter2rows);
  IsRefresh:=false;
end;

{ DONE -oPSV -cRows_Popup : �������� ������ (GridRows) }
procedure Tf_SvedIn.tbRowsFilterClearClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCLear(gridRows,filter2rows);
  IsRefresh:=false;
end;

{ DONE -oPSV -cRows_Popup : ������������� � ���� (GridRows) }
procedure Tf_SvedIn.tbRowsWinEditClick(Sender: TObject);
begin
  inherited;
  f_db.EditInMemo(gridRows);
end;

procedure Tf_SvedIn.acSvedInViewExecute(Sender: TObject);
begin
  inherited;
  // ��������
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // �������� ��������
  with tf_SvedInNew.create(self) do
  Begin
    EditId:=q_title.FieldByName('ID').AsString;
    IsNeft:=DocNeft;
    EditMode:=2;
    ShowModal;
    Free;
  end;
end;

procedure Tf_SvedIn.ExecuteSearch;
begin
  // �����
  with tf_FindVagon.create(self) do
  Begin
    DocTitleID:='';
    q_Source.Session:=ora_Session;
    q_Structure.Session:=ora_Session;
    q_Structure.SetVariable(':STRUCTURE','FIND_VAGON_SVED_IN');
    ShowModal;
    if ModalResult=mrOk then
    Begin
      // ��������������� �� ��������� ��������
      DocTitleID:=TempVari.GetAsChar('TITLE_ID_FIND');
      //�� ��������� ������� �������� ���������� ���������� ��������� �.�. ��� ����� ��������� 1 ���� � ����
      TempVari.SetVariNum('TITLE_ID_FIND',-1);
      try
        q_Title.DisableControls;
        q_Title.SetVariable(':TITLE_ID',DocTitleId);
        IsRefresh:=true;
        f_db.ReQuery(q_Title,false);
        q_title.Locate('ID',DocTitleID,[loCaseInsensitive]);
        IsRefresh:=false;
        // �������� � ������������ ����������� �������
        q_titleAfterScroll(q_title);
      finally
        q_Title.EnableControls;
      end;
    end;
    Free;
  end;
end;

procedure Tf_SvedIn.acFindExecute(Sender: TObject);
begin
  inherited;
  if not q_rows.Active then exit;
  if not q_title.Active then exit;

  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);
  ExecuteSearch;
end;

procedure Tf_SvedIn.CheckTime(Sender: TObject);
begin
  inherited;
  if (DateOf(Date2.DateTime)<DateOf(Date1.DateTime)) then
    Date2.DateTime:=Date1.DateTime;
end;

procedure Tf_SvedIn.acSvedInRowsCalcExecute(Sender: TObject);
var CurrId:double;
begin
  inherited;
  // ��������
  if q_Rows.ReadOnly then exit;
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  if q_rows.IsEmpty then exit;

  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // ������� ���������
  IsRefresh:=true;
  f_db.ReQuery(q_Title,true);
  IsRefresh:=false;

  GridRows.SetFocus;
  CurrId:=q_rowsID.AsFloat;

  if Application.MessageBox(PChar('����������� ��� � �������� � '+q_titleSVED_NUM.AsString+' ?'),'��������!',MB_YESNO)=IDYES then
  Begin
    try
      q_Rows.DisableControls;
      q_rows.First;
      while not q_rows.Eof do
      Begin
        // ����� ������
        q_rows.Edit;

        //������� q_temp_ves,������ ������� temp_ves,������� ���,��������� q_temp_ves ��� ������
        q_temp_ves.Close;
        InitVagonParams;
        q_rowsVes.Value:=pkgFor_ves.CallFloatFunction('calc_ves',[DateOf(q_titleSVED_DATE.Value),1,q_rowsVagonType_id.Value,DocMestoId,1]);
        f_db.ReQuery(q_temp_ves,false);

        if q_temp_ves.Locate('TAG','GOST',[loCaseInsensitive]) then
           q_rowsGOST_ID.AsInteger:=q_temp_ves.FieldByName('VALUE').AsInteger;
        if q_temp_ves.Locate('TAG','FACT_PL',[loCaseInsensitive])then
           q_rowsFakt_pl.Value:=q_temp_ves.FieldByName('VALUE').AsFloat;
        if q_temp_ves.Locate('TAG','CTLV',[loCaseInsensitive])then
          q_rowsCTLV.Value:=q_temp_ves.FieldByName('VALUE').AsFloat;
        if q_temp_ves.Locate('TAG','KOL_NET',[loCaseInsensitive])then
          q_rowsVES_NETTO.Value:=q_temp_ves.FieldByName('VALUE').AsFloat;
        if q_temp_ves.Locate('TAG','VES',[loCaseInsensitive])then
          q_rowsVES.Value:=q_temp_ves.FieldByName('VALUE').AsFloat;
        if q_temp_ves.Locate('TAG','VOLUME15',[loCaseInsensitive])then
          q_rowsVOLUME15.Value:=q_temp_ves.FieldByName('VALUE').AsFloat;

        q_rows.Post;
        q_rows.Next;
      end;
    finally
      q_Rows.EnableControls;
      // ������� ���������
      IsRefresh:=true;
      f_db.ReQuery(q_Title,true);
      IsRefresh:=false;
      // ��������������� �� �������
      f_db.ReQuery(q_Rows,false);
      q_Rows.Locate('ID',CurrId,[]);
    end;
  end;
end;

//////////////////////////////////////////////////////////////////////////////
//��������� ��� ������������� ���������� ������� ����                      //
//////////////////////////////////////////////////////////////////////////////
procedure Tf_SvedIn.InitVagonParams;
begin
  //������� ������� temp_ves
  pkgFOR_VES.CallProcedure('empty_temp_ves',[]);

  pkgFor_ves.CallProcedure('set_param',['VZLIV',q_rowsVzliv.AsString,NULL]);
  pkgFor_ves.CallProcedure('set_param',['VOLUME',q_RowsVolume.AsString,NULL]);
  pkgFor_ves.CallProcedure('set_param',['TEMPER',q_rowsTemper.AsString,NULL]);
  pkgFor_ves.CallProcedure('set_param',['VES_CIST',q_rowsVes_cist.AsString,NULL]);
  pkgFor_ves.CallProcedure('set_param',['PL15',q_titlePL15.AsString,NULL]);
  pkgFor_ves.CallProcedure('set_param',['PL20',q_titlePL.AsString,NULL]);
  pkgFor_ves.CallProcedure('set_param',['VES',q_rowsVes.AsString,NULL]);
  pkgFor_ves.CallProcedure('set_param',['VES_ALL','0',NULL]);
  pkgFor_ves.CallProcedure('set_param',['KOL_NET',q_rowsVES_NETTO.AsString,NULL]);
  pkgFor_ves.CallProcedure('set_param',['VES_ED','0',NULL]);
  pkgFor_ves.CallProcedure('set_param',['KOL_ED','0',NULL]);
  pkgFor_ves.CallProcedure('set_param',['UPAK_VES','0',NULL]);
  pkgFor_ves.CallProcedure('set_param',['UPAK_VES_ED','0',NULL]);
  pkgFor_ves.CallProcedure('set_param',['PODDONS','0',NULL]);
  pkgFor_ves.CallProcedure('set_param',['PODDON_VES','0',NULL]);
  pkgFor_ves.CallProcedure('set_param',['SHIELDS','0',NULL]);
  pkgFor_ves.CallProcedure('set_param',['SHIELD_VES','0',NULL]);

  pkgFor_ves.CallProcedure('set_param',['PROD_ID_NPR',q_titlePROD_ID_NPR.AsString,NULL]);
  pkgFor_ves.CallProcedure('set_param',['PLAT_ID','0',NULL]);
  pkgFor_ves.CallProcedure('set_param',['KALIBR_ID',q_rowsKalibr_ID.AsString,NULL]);
  pkgFor_ves.CallProcedure('set_param',['SLIV','9',NULL]);
  pkgFor_ves.CallProcedure('set_param',['P_VOD',q_titleP_VOD.AsString,NULL]);
  pkgFor_ves.CallProcedure('set_param',['MG_SOL',q_titleMG_SOL.AsString,NULL]);
  pkgFor_ves.CallProcedure('set_param',['P_SOL',q_titleP_SOL.AsString,NULL]);
  pkgFor_ves.CallProcedure('set_param',['P_DIRT',q_titleP_DIRT.AsString,NULL]);
end;


procedure Tf_SvedIn.acRowsSpravExecute(Sender: TObject);
var vOldStan:string;
begin
  inherited;
  // ��������
  if q_Rows.ReadOnly then exit;
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;

  // ��������� ���������
  GridTitleExit(Sender);
  if (q_rows.State = dsBrowse) and (acSvedInRowsEdit.Enabled) and not q_rows.IsEmpty then q_rows.Edit;

  if GridRows.Columns[GridRows.Col-1].FieldName='KALIBR_ID' then
  Begin
    // �������� ������ ������������� �������
    KlsMisc2.SetKLSParam('KLS_KALIBR_VED_OSMOTR','CHOOSE',fsNormal,q_rows.FieldByName('KALIBR_ID').AsString,'',true);
    with TF_KlsMisc.Create(Self) do
    begin
      if ShowModal=mrOk then
      if (q_rows.State <> dsBrowse) then
      begin
        q_rows.FieldByName('KALIBR_ID').AsString:=KlsMisc2.vIdToSeek;
      end;
      Free;
    end;
  end;

  if GridRows.Columns[GridRows.Col-1].FieldName='VAGOWNER_NAME' then
  Begin
    // �������� ������ ������������� �������
    KlsMisc2.SetKLSParam('KLS_VAGOWNER_VED_OSMOTR','CHOOSE',fsNormal,q_rows.FieldByName('VAGOWNER_ID').AsString,'',true);
    with TF_KlsMisc.Create(Self) do
    begin
      if ShowModal=mrOk then
      if (q_rows.State <> dsBrowse) then
      begin
        q_rows.FieldByName('VAGOWNER_ID').AsString:=KlsMisc2.vIdToSeek;
      end;
      Free;
    end;
  end;

  if (GridRows.Columns[GridRows.Col-1].FieldName='STAN_VOZ_KOD') or
     (GridRows.Columns[GridRows.Col-1].FieldName='STAN_VOZ_NAME') then
  Begin
    // �������� ������ �������
    vOldStan:=q_rows.FieldByName('STAN_VOZ_ID').AsString;
    if vOldStan='' then vOldStan:=CurrentSTAN_VOZ;
    KlsMisc2.SetKLSParam('KLS_STAN','CHOOSE',fsNormal,vOldStan,'',true);
    with TF_KlsMisc.Create(Self) do
    begin
      if ShowModal=mrOk then
      if (q_rows.State <> dsBrowse) then
      begin
        q_rows.FieldByName('STAN_VOZ_ID').AsString:=KlsMisc2.vIdToSeek;
        CurrentSTAN_VOZ:=KlsMisc2.vIdToSeek;
      end;
      Free;
    end;
  end;

end;

procedure Tf_SvedIn.q_rowsTEMPERValidate(Sender: TField);
begin
  inherited;
  // �������� ��� ��� ����� �����������
  q_rowsVes.Value:=0;
end;

procedure Tf_SvedIn.q_rowsKALIBR_IDValidate(Sender: TField);
begin
  inherited;
  q_rowsCAPACITY.Value:=pkgFor_cist.CallStringFunction('GET_CAPACITY',[q_rowsNum_cist.Value,q_rowsKalibr_Id.Text,1,q_rows.FieldByName('VAGONTYPE_ID').AsInteger]);
//  q_rowsAXES.Value:=pkgFor_cist.CallIntegerFunction('GET_AXES',[q_rowsNum_cist.Value,q_rowsKalibr_Id.Text,q_rowsVes.Value,DocLoadTypeId,q_rows.FieldByName('VAGONTYPE_ID').AsInteger]);
end;

procedure Tf_SvedIn.q_rowsVZLIVValidate(Sender: TField);
begin
  inherited;
  // �������� ��� ��� ����� ������
  q_rowsVes.Value:=0;
end;

procedure Tf_SvedIn.GridRowsGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if q_rowsBad_num.Value=1 then Background:=clRed;
//  else if q_rowsVAG_STATUS_ID.Value<>0 then Background:=clSilver;
end;

procedure Tf_SvedIn.GridRowsCellClick(Column: TColumnEh);
begin
  inherited;
  if column.Title.Caption='+' then
  if q_rowsVybor.Value=1 then
  begin
    q_rowsVybor.Value:=0;
    Vybor[q_Rows.RecNo]:=0
  end
  else
  begin
    q_rowsVybor.Value:=1;
    Vybor[q_Rows.RecNo]:=1;
  end;
end;

procedure Tf_SvedIn.q_rowsCalcFields(DataSet: TDataSet);
begin
  inherited;
  q_rowsVybor.Value:=0;
end;

procedure Tf_SvedIn.q_rowsNUM_CISTChange(Sender: TField);
begin
  inherited;
  if not q_title.Active then exit;
  if not q_rows.Active then exit;

  if (q_rows.State<>dsBrowse) then
  Begin
    // �������� ���������� �������
    try
      // 1.���������� ��� ������
      q_rows.FieldByName('VAGONTYPE_ID').AsFloat:=pkgFOR_CIST.CallFloatFunction('GET_VAGONTYPE',[Sender.Value,1]);
      // 2. ��������� ����� ������
      IF pkgFOR_CIST.CallIntegerFunction('CHECK_NUM_CIST',[Sender.Value,1,q_rows.FieldByName('VAGONTYPE_ID').AsFloat])=0 then
      Begin
        f_main.ApplSession.WriteToLog(amFull,'SVED_IN',sesError,'�������� ����� ������: '+Sender.Value+' !',0,'');
      End;
      // 3.���������� ��������� ������
      q_rows.FieldByName('KALIBR_ID').AsString:=pkgFOR_CIST.CallStringFunction('GET_KALIBR',[Sender.Value,1,q_rows.FieldByName('VAGONTYPE_ID').AsFloat]);
      q_rows.FieldByName('VES_CIST').AsFloat:=pkgFOR_CIST.CallFloatFunction('GET_VES_CIST',[Sender.Value,1,q_rows.FieldByName('VAGONTYPE_ID').AsFloat]);
      q_rows.FieldByName('VAGOWNER_ID').AsFloat:=pkgFOR_CIST.CallFloatFunction('GET_VAGOWNER',[Sender.Value,1,q_rows.FieldByName('VAGONTYPE_ID').AsFloat]);
      q_rows.FieldByName('CAPACITY').AsString:=pkgFOR_CIST.CallStringFunction('GET_CAPACITY',[Sender.Value,q_rows.FieldByName('KALIBR_ID').AsString,1,q_rows.FieldByName('VAGONTYPE_ID').AsFloat]);
    except
      on E:Exception do
      Begin
        f_main.ApplSession.WriteToLog(amFull,'SVED_IN',sesError,E.Message,0,'');
      end;
    end;

    // �������� ������ ������������� �������
    IF (q_rowsVAGOWNER_ID.AsFloat=0) AND (q_titlePROD_ID_NPR.AsString='90002') then
    Begin
      // ���� �������� �����
      q_rows.FieldByName('VAGOWNER_ID').AsFloat:=33;
    end;

    IF q_rowsVAGOWNER_ID.AsFloat=0 then
    Begin
      GridRows.SelectedField:=q_Rows.FieldByName('VAGOWNER_NAME');
      acRowsSpravExecute(Self);
    end;

    q_Rows.Post;
    q_Rows.Edit;

  end;

end;

procedure Tf_SvedIn.q_rowsBeforePost(DataSet: TDataSet);
begin
  inherited;
  if q_rows.Active and (q_rows.FieldByName('NUM_CIST').AsString='') then
    q_rows.Cancel;
end;



procedure Tf_SvedIn.acSvedInNaklExecute(Sender: TObject);
begin
  inherited;
  // ��������
  if q_rows.ReadOnly then exit;
  if not q_title.Active then exit;
  if not q_rows.Active then exit;
  if q_title.IsEmpty then exit;
  if q_rows.IsEmpty then exit;

  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  GridRows.SetFocus;

  // ��������/�������������� ���������
  with tf_NaklVozNew.create(self) do
  Begin
    ParentFormName:='SVED_IN';
    DocMestoId:=Self.DocMestoId;
    DocLoadTypeId:=1;
    DocType:=6;
    DocMode:=Self.DocMode;
    if q_rowsNAKL_ID.AsFloat>0 then EditMode:=1
    else EditMode:=0;
    EditId:=q_rowsNAKL_ID.AsFloat;
    ReestrId:=q_rowsID.AsFloat;
    ShowModal;
    f_db.ReQuery(q_Rows,true);
    Free;
  end;
end;

procedure Tf_SvedIn.CheckTimeItogs(Sender: TObject);
begin
  inherited;
  if (DateOf(Date4.DateTime)<DateOf(Date3.DateTime)) then
    Date4.DateTime:=Date3.DateTime;
end;

procedure Tf_SvedIn.bRefreshItogsClick(Sender: TObject);
begin
  inherited;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);
  // ��������� ������
  IsRefresh:=true;
  f_db.ReQuery(q_itogs,true);
  IsRefresh:=false;
end;

procedure Tf_SvedIn.q_itogsBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  // ��������� ������ �� �����
  q_itogs.SQL[11]:=' AND a.sved_date>=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date3.Date)+''',''dd.mm.yyyy'')';
  q_itogs.SQL[12]:=' AND a.sved_date<=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date4.Date)+''',''dd.mm.yyyy'')';
end;

procedure Tf_SvedIn.TBItem36Click(Sender: TObject);
begin
  inherited;
  f_db.EditInMemo(gridItogs);
end;

procedure Tf_SvedIn.TBItem42Click(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
    if not FileExists(SaveDialog1.FileName) then
      begin
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,gridItogs,SaveDialog1.FileName,True);
        FileExecute(SaveDialog1.FileName,'','',esMaximized);
      end
    else
      if MessageDlg('���� ��� ����������! ����������?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,gridItogs,SaveDialog1.FileName,True);
          FileExecute(SaveDialog1.FileName,'','',esMaximized);
        end;
end;

procedure Tf_SvedIn.TBItem15Click(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
    if not FileExists(SaveDialog1.FileName) then
      begin
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,gridTitle,SaveDialog1.FileName,True);
        FileExecute(SaveDialog1.FileName,'','',esMaximized);
      end
    else
      if MessageDlg('���� ��� ����������! ����������?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,gridTitle,SaveDialog1.FileName,True);
          FileExecute(SaveDialog1.FileName,'','',esMaximized);
        end;
end;

procedure Tf_SvedIn.TBItem8Click(Sender: TObject);
begin
  inherited;
  F_DB.GridSQL(Self,gridTitle,q_title.SQL.Text,q_title);
end;

procedure Tf_SvedIn.TBItem38Click(Sender: TObject);
begin
  inherited;
  F_DB.GridSQL(Self,gridRows,q_rows.SQL.Text,q_rows);
end;

procedure Tf_SvedIn.TBItem39Click(Sender: TObject);
begin
  inherited;
  F_DB.GridSQL(Self,gridItogs,q_itogs.SQL.Text,q_itogs);
end;

procedure Tf_SvedIn.acSvedInUvedExecute(Sender: TObject);
begin
  inherited;
  // ��������
  if q_rows.ReadOnly then exit;
  if not q_title.Active then exit;
  if not q_rows.Active then exit;
  if q_title.IsEmpty then exit;
  if q_rows.IsEmpty then exit;

  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  GridRows.SetFocus;

  // ��������/�������������� �����������
  with tf_UvedVozNew.create(self) do
  Begin
    ParentFormName:='SVED_IN';
    DocMestoId:=Self.DocMestoId;
    DocLoadTypeId:=1;
    DocType:=7;
    DocMode:=Self.DocMode;
    if q_rowsUVED_ID.AsFloat>0 then EditMode:=1
    else EditMode:=0;
    EditId:=q_rowsUVED_ID.AsFloat;
    ReestrId:=q_rowsID.AsFloat;
    ShowModal;
    f_db.ReQuery(q_Rows,true);
    Free;
  end;
end;

procedure Tf_SvedIn.GridRowsKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (GridRows.Columns[GridRows.Col-1].FieldName='TEMPER') or
     (GridRows.Columns[GridRows.Col-1].FieldName='CAPACITY') or
     (GridRows.Columns[GridRows.Col-1].FieldName='VES_CIST') or
     (GridRows.Columns[GridRows.Col-1].FieldName='VES_KVIT') or
     (GridRows.Columns[GridRows.Col-1].FieldName='VES_NETTO_KVIT') or
     (GridRows.Columns[GridRows.Col-1].FieldName='P_VOD_KVIT') or
     (GridRows.Columns[GridRows.Col-1].FieldName='P_SOL_KVIT') or
     (GridRows.Columns[GridRows.Col-1].FieldName='P_DIRT_KVIT') or
     (GridRows.Columns[GridRows.Col-1].FieldName='VZLIV') then
  Begin
    if Key=',' then Key:='.';
  end;
end;

procedure Tf_SvedIn.GridRowsSortMarkingChanged(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.SortInGrid(q_rows,q_rows.SQL.Count-1,GridRows);
  IsRefresh:=false;
  q_titleAfterScroll(q_rows);
end;

end.
