unit MO_nakl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MdiForm, Placemnt, ExtCtrls, Grids, DBGridEh, ComCtrls,
  RxLookup, Buttons, StdCtrls, TB2Dock, TB2Toolbar, TB2Item, ActnList,
  XPStyleActnCtrls, ActnMan, TB2ExtItems, Menus, Oracle, DB, OracleData, DBGrids,
  PropFilerEh, PropStorageEh, MemTableDataEh, DataDriverEh, MemTableEh, ComObj,Printers,
  GridsEh;

/////////������ ���������� ��������� ����� �� �������(��� ��������)/////////////
type
  TEnvelope=record
    Kind:string;
    W   :real;
    H   :real;
  end;
const
  PaperSizeArray:array[1..2] of TEnvelope =
      ((Kind:'A4';W:8.5;H:11),(Kind:'A3';W:17;H:11));
///////////////////////////////////////////////////////////////////////////////

// ���������
type
  Tf_Nakl = class(Tf_MDIForm)
    GroupBox1: TGroupBox;
    Splitter1: TSplitter;
    ActionManager1: TActionManager;
    acToXLS: TAction;
    PopupTitle: TTBPopupMenu;
    tbTitleFilterTitle: TTBItem;
    acMONaklEdit: TAction;
    acMONaklDel: TAction;
    acMONaklRowsDel: TAction;
    acPrint: TAction;
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
    pkgFor_nakl: TOraclePackage;
    PropStorageEh1: TPropStorageEh;
    lc_ProdGU12: TRxDBLookupCombo;
    ds_ProdGU12: TDataSource;
    q_ProdGU12: TOracleDataSet;
    TBItem19: TTBItem;
    pageTitle: TPageControl;
    tabTitleDetail: TTabSheet;
    tabTitleItogs: TTabSheet;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    bRefresh: TTBItem;
    TBItem2: TTBItem;
    TBItem1: TTBItem;
    TBItem10: TTBItem;
    GridTitle: TDBGridEh;
    pageRows: TPageControl;
    tabRowsDetail: TTabSheet;
    tabRowsItogs: TTabSheet;
    TBDock4: TTBDock;
    TBToolbar4: TTBToolbar;
    TBItem21: TTBItem;
    TBDock3: TTBDock;
    TBToolbar3: TTBToolbar;
    TBItem20: TTBItem;
    lbProdName: TLabel;
    TBDock5: TTBDock;
    TBToolbar5: TTBToolbar;
    TBItem30: TTBItem;
    TBItem34: TTBItem;
    q_titleID: TFloatField;
    q_titleMESTO_ID: TFloatField;
    q_titleLOAD_TYPE_ID: TFloatField;
    q_titleNAKL_NUM: TFloatField;
    q_titleNAKL_DATE: TDateTimeField;
    q_titlePROD_GU12_ID: TStringField;
    q_titleSHABNAKL_ID: TFloatField;
    q_titleUPAK_VES: TFloatField;
    q_titleVES: TFloatField;
    q_titleVES_ALL: TFloatField;
    q_titleVES_CIST: TFloatField;
    GridRows: TDBGridEh;
    q_rowsID: TFloatField;
    q_rowsSVED_ID: TStringField;
    q_rowsSVED_POS: TIntegerField;
    q_rowsVED_POD_ROW_ID: TFloatField;
    q_rowsNUM_CIST: TStringField;
    q_rowsNCISTDOP: TIntegerField;
    q_rowsAXES: TIntegerField;
    q_rowsCAPACITY: TStringField;
    q_rowsWES1: TStringField;
    q_rowsVES_CIST: TFloatField;
    q_rowsVAGONTYPE_ID: TFloatField;
    q_rowsKALIBR_ID: TStringField;
    q_rowsTIP1: TStringField;
    q_rowsVAGOWNER_ID: TFloatField;
    q_rowsVETKA_POD_ID: TFloatField;
    q_rowsVETKA_OTP_ID: TFloatField;
    q_rowsVETKA_NAPR_ID: TFloatField;
    q_rowsVAG_STATUS_ID: TFloatField;
    q_rowsVZLIV: TFloatField;
    q_rowsTEMPER: TFloatField;
    q_rowsFAKT_PL: TFloatField;
    q_rowsVES: TFloatField;
    q_rowsKOL_NET: TFloatField;
    q_rowsVES_ALL: TFloatField;
    q_rowsVES_ED: TFloatField;
    q_rowsKOL_ED: TIntegerField;
    q_rowsUPAK_ID: TFloatField;
    q_rowsUPAK_VES: TFloatField;
    q_rowsUPAK_VES_ED: TFloatField;
    q_rowsPODDONS: TIntegerField;
    q_rowsPODDON_VES: TFloatField;
    q_rowsSHIELDS: TIntegerField;
    q_rowsSHIELD_VES: TFloatField;
    q_rowsZPU_TYPE1: TFloatField;
    q_rowsZPU_TYPE2: TFloatField;
    q_rowsPLOMBA1: TStringField;
    q_rowsPLOMBA2: TStringField;
    q_rowsROSINSPL1: TStringField;
    q_rowsROSINSPL2: TStringField;
    q_rowsNAR_LINE_ID: TFloatField;
    q_rowsNUM_PROP: TIntegerField;
    q_rowsFIO_DRIVER: TStringField;
    q_rowsNAKL_ID: TFloatField;
    q_rowsFORMNAKL_ID: TFloatField;
    q_rowsNUM_KVIT: TStringField;
    q_rowsDATE_KVIT: TDateTimeField;
    q_rowsTARIF: TFloatField;
    q_rowsTARIF_GUARD: TFloatField;
    q_rowsVOLUME: TFloatField;
    q_rowsBAD_NUM: TIntegerField;
    q_rowsGOST_ID: TIntegerField;
    q_rowsCTLV: TFloatField;
    q_rowsVOLUME15: TIntegerField;
    q_rowsNAKL_POS: TIntegerField;
    pkgFOR_DOCUMENTS: TOraclePackage;
    Label1: TLabel;
    Time1: TDateTimePicker;
    Date1: TDateTimePicker;
    Label4: TLabel;
    Time2: TDateTimePicker;
    Date2: TDateTimePicker;
    q_titleFORMNAKL_ID: TFloatField;
    q_titleSHABEXP_ID: TFloatField;
    q_titleK_TAR: TStringField;
    q_titleFORMNAKL_NAME: TStringField;
    q_titleFORMSHAB_NAME: TStringField;
    q_titleNAME_GU12: TStringField;
    q_titleEXP_CONTRACT: TStringField;
    q_titlePRIM_DOG: TStringField;
    q_titleEXP_PROD: TStringField;
    q_rowsUVED_ID: TFloatField;
    q_rowsUVED_POS: TIntegerField;
    q_rowsIS_AUTO: TIntegerField;
    q_rowsSVED_NUM: TStringField;
    q_rowsUVED_NUM: TStringField;
    q_rowsVAGOWNER_NAME: TStringField;
    q_rowsNOM_ZD: TStringField;
    q_rowsPROD_NAME: TStringField;
    q_rowsZPU_TYPE1_NAME: TStringField;
    q_rowsZPU_TYPE2_NAME: TStringField;
    q_rowsPASP_NUM: TStringField;
    q_rowsREZ_NUM: TStringField;
    q_rowsPASP_DATE: TDateTimeField;
    q_ProdGU12ID: TStringField;
    q_ProdGU12NAME: TStringField;
    acMONaklView: TAction;
    TBItem3: TTBItem;
    q_rowsDATE_PLAN: TDateTimeField;
    q_print_exp: TOracleDataSet;
    q_titleNOM_ZD: TStringField;
    q_titlePROD_ID_NPR: TStringField;
    q_titleSHABVOZ_ID: TFloatField;
    q_titleIS_EXP: TIntegerField;
    q_titleOPERNALIV_ID: TFloatField;
    q_titleDOG_ID: TFloatField;
    q_titleSTAN_ID: TFloatField;
    q_print_expDOG_NUMBER: TStringField;
    q_print_expDOG_DATE: TDateTimeField;
    q_print_expNOM_ZD: TStringField;
    q_print_expPASP_NUM: TStringField;
    q_print_expNUM_CIST: TStringField;
    q_print_expKOL_ED: TIntegerField;
    q_print_expKOL_NET: TFloatField;
    q_print_expVES: TFloatField;
    q_print_expVES_ALL: TFloatField;
    q_print_expPLOMBA1: TStringField;
    q_print_expPLOMBA2: TStringField;
    q_print_expNCISTDOP: TIntegerField;
    q_print_expKALIBR_ID: TStringField;
    q_print_expAXES: TIntegerField;
    q_print_expCAPACITY: TStringField;
    q_print_expVES_CIST: TFloatField;
    q_print_expNAME: TStringField;
    q_print_expSTAN_KOD: TIntegerField;
    q_print_expSTAN_NAME: TStringField;
    q_print_expGDOR_NAME: TStringField;
    q_print_expSTRANA: TStringField;
    q_print_expBANK: TStringField;
    q_print_expGROTP_OKPO: TStringField;
    q_print_expGROTP_SHORT_NAME: TStringField;
    q_print_expGROTP_ID: TIntegerField;
    q_print_expPLATTARIF_ID: TIntegerField;
    q_print_expPLATTAR_SHORT_NAME: TStringField;
    q_print_expRS: TStringField;
    q_print_expTEX_PD_NAME: TStringField;
    q_print_expGROTP_GD_KOD: TStringField;
    q_print_expGROTP_INDEX: TStringField;
    q_print_expGROTP_CITY: TStringField;
    q_print_expGROTP_ADDRESS: TStringField;
    q_print_expID: TFloatField;
    q_print_expFLG_DOSTUP: TIntegerField;
    q_print_expDOG_ID: TIntegerField;
    q_print_expPROD_ID_NPR: TStringField;
    q_print_expSTAN_ID: TFloatField;
    q_print_expPRIM_DOG: TStringField;
    q_print_expOSOB1: TStringField;
    q_print_expOSOB2: TStringField;
    q_print_expOSOB3: TStringField;
    q_print_expOSOB4: TStringField;
    q_print_expPOL1: TStringField;
    q_print_expPOL2: TStringField;
    q_print_expPOL3: TStringField;
    q_print_expPOL4: TStringField;
    q_print_expNEOB1: TStringField;
    q_print_expNEOB2: TStringField;
    q_print_expNEOB3: TStringField;
    q_print_expNEOB4: TStringField;
    q_print_expSTAN1: TStringField;
    q_print_expSTAN2: TStringField;
    q_print_expSTAN3: TStringField;
    q_print_expSTAN4: TStringField;
    q_print_expDORST1: TStringField;
    q_print_expDORST2: TStringField;
    q_print_expNM_GR1: TStringField;
    q_print_expNM_GR2: TStringField;
    q_print_expNM_GR3: TStringField;
    q_print_expNM_GR4: TStringField;
    q_print_expNM_GR5: TStringField;
    q_print_expNM_GR6: TStringField;
    q_print_expNM_GR7: TStringField;
    q_print_expNM_GR8: TStringField;
    q_print_expNM_GR9: TStringField;
    q_print_expPLT_OT1: TStringField;
    q_print_expPLT_OT2: TStringField;
    q_print_expPLT_OT3: TStringField;
    q_print_expPLT_OT4: TStringField;
    q_print_expDOCS1: TStringField;
    q_print_expDOCS2: TStringField;
    q_print_expDOCS3: TStringField;
    q_print_expDOCS4: TStringField;
    q_print_expTAM1: TStringField;
    q_print_expTAM2: TStringField;
    q_print_expPOS33: TStringField;
    q_print_expPOS34: TStringField;
    q_print_expPOS35: TStringField;
    q_print_expPOS36: TStringField;
    q_print_expSHTAMP1: TStringField;
    q_print_expSHTAMP2: TStringField;
    q_print_expSHTAMP3: TStringField;
    q_print_expSHTAMP4: TStringField;
    q_print_expSHTAMP5: TStringField;
    q_print_expGR1_TXT_EX: TStringField;
    q_print_expGR2_TXT_EX: TStringField;
    q_print_expMESTO_PAY: TStringField;
    q_print_expCNT_VED: TIntegerField;
    q_print_expINSNUM: TStringField;
    q_print_expINSDAT: TDateTimeField;
    q_print_expTEX_PD_ID: TFloatField;
    q_print_expTEX_PD_ID_1: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acToXLSExecute(Sender: TObject);
    procedure acMONaklAddExecute(Sender: TObject);
    procedure acMONaklEditExecute(Sender: TObject);
    procedure acMONaklRowsDelExecute(Sender: TObject);
    procedure acPrintExecute(Sender: TObject);
    procedure acFilterExecute(Sender: TObject);
    procedure acNoFilterExecute(Sender: TObject);
    procedure acMONaklDelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure q_titleAfterScroll(DataSet: TDataSet);
    procedure bRefreshClick(Sender: TObject);
    procedure bRefreshRowsClick(Sender: TObject);
    procedure GridTitleExit(Sender: TObject);
    procedure GridRowsExit(Sender: TObject);
    procedure GridTitleSortMarkingChanged(Sender: TObject);
    procedure GridRowsSortMarkingChanged(Sender: TObject);
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
    procedure q_titleBeforeOpen(DataSet: TDataSet);
    procedure GridTitleGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure CheckTime(Sender: TObject);
    procedure acMONaklViewExecute(Sender: TObject);
    procedure PrintExpNakl;
//    procedure OpenWorkbook(StrPath:string);
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
////////////////////////////��� ������ �� �������//////////////////////////////
    PaperSize:TPoint;
    LabelPos:TRect;
    function GetEnvelopeSize:TPoint;
    //���������� ���������� ����� �� �������� �� ����� �����. �,� - �������� � ��
    function CoordsByDisplacement(x,y:integer):TPoint;
///////////////////////////////////////////////////////////////////////////////

  public
    { Public declarations }
    QueryBegin,QueryEnd:TDateTime;
    DocMestoId:integer; // ����� ��������
    DocLoadTypeId:integer; // ��� ���������������
    DocType:integer; // ��� ���������
    DocMode:integer; // 1-�������������� ����, 2-�����������������
  end;

var
  f_Nakl: Tf_Nakl;
  gLinkMode:integer; // ����� ���������: 1-������ �� ������ 0-����������� ��������
  gLinkFilter:string; // ������ ��� ������� �� ������
  gMesto:integer; // ����� ��������
  gLoadType:integer; // ��� ���������������
  gMode:integer; // 1-�������������� ����, 2-�����������������

implementation

uses main, ForDB, ForSESS, ForFiles, KlsMisc2, MO_NaklNew, DateUtils;

{$R *.dfm}

{ DONE -oPSV -c����� : ************************* ������ ����� ************************* }

{ DONE -oPSV -c����� : �������� ����� }
procedure Tf_Nakl.FormCreate(Sender: TObject);
//var i:integer;
begin
  inherited;
  // Popup-������
  Filter2title:=TStringList.Create;
  Filter2title.Clear;
  Filter2rows:=TStringList.Create;
  Filter2rows.Clear;
  // ������ �� ����� (�������������� ��������)
  Date1.Date:=Date-1;
  Date2.Date:=Date+1;
  // ������ �� ������
  ViewLinkMode:=gLinkMode;
  ViewLinkFilter:=gLinkFilter;
  gLinkMode:=0;
  gLinkFilter:='';
  // ����� ��������
  DocMestoId:=gMesto;
  gMesto:=-1;
  // ��� ��������� - ���������
  DocType:=6;
  DocLoadTypeId:=gLoadType;
  gLoadType:=-1;
  DocMode:=gMode;
  // ������
  f_db.LogonMasterSession(ora_Session);
  f_db.SetUserGrants(ActionManager1);

  // �������� ��������
  f_db.ReQuery(q_prodGU12,false);

  q_title.SetVariable('LOAD_TYPE_ID',DocLoadTypeId);
  q_title.SetVariable('MESTO_ID',DocMestoId);
  IsRefresh:=true;
  f_db.ReQuery(q_title,false);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

{ DONE -oPSV -c����� : �������� ����� }
procedure Tf_Nakl.FormClose(Sender: TObject; var Action: TCloseAction);
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
procedure Tf_Nakl.bRefreshClick(Sender: TObject);
begin
  inherited;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);
  // ��������� ������
  IsRefresh:=true;
  f_db.ReQuery(q_title,true);
  IsRefresh:=false;
  // �������� � ������������ ����������� �������
  q_titleAfterScroll(q_title);
end;

{ TODO -cTitle_Actions -oPSV : ���������� � Excel }
procedure Tf_Nakl.acToXLSExecute(Sender: TObject);
begin
  inherited;
  {}
end;

{procedure Tf_Nakl.OpenWorkbook(StrPath:string);
var
  ExcelApp:variant;
  Arg:OleVariant;
begin
  // ��������
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  // �������� Excel
  Arg:=q_titleID.Value;
  ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.Workbooks.Open(StrPath);
  ExcelApp.Visible:=true;
  // ������ �������
  ExcelApp.Run('OpenPrintNakl',Arg);
  //������������ ����������
  ExcelApp := UnAssigned;
end;
}

{ TODO -oPSV -cTitle_Actions : ������ ��������� }
procedure Tf_Nakl.acPrintExecute(Sender: TObject);
begin
  inherited;
  if q_titleIs_exp.Value<>1 then
    begin
      if (q_titleFORMNAKL_ID.Value=6) then
        F_FileUtils.OpenWorkbook('U:\master\xls\MO_GU27E_ora.xls','OpenPrintNakl',q_titleID.Value,0);
      if (q_titleFORMNAKL_ID.Value=2) then
        F_FileUtils.OpenWorkbook('U:\master\xls\MO_GU27_ora.xls','OpenPrintNakl',q_titleID.Value);
    end
  else PrintExpNakl;
end;

{ TODO -oPSV -cTitle_Actions : ��������� ����� }
procedure Tf_Nakl.acFilterExecute(Sender: TObject);
begin
  inherited;
  {}
end;

{ TODO -oPSV -cTitle_Actions : �������� ����� }
procedure Tf_Nakl.acNoFilterExecute(Sender: TObject);
begin
  inherited;
  {}
end;

{ DONE -cTitle_Actions -oPSV : �������� �������� }
procedure Tf_Nakl.acMONaklAddExecute(Sender: TObject);
begin
  inherited;
end;

{ DONE -cTitle_Actions -oPSV : ����������� �������� }
procedure Tf_Nakl.acMONaklEditExecute(Sender: TObject);
begin
  inherited;
  // ��������
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // �������������� ���������
  with tf_NaklNew.create(self) do
  Begin
    ParentFormName:='NAKL';
    EditId:=q_title.FieldByName('ID').AsFloat;
//    FormNakl:=q_titleFORMNAKL_ID.AsFloat;
    ReestrId:=q_rowsID.AsFloat;
    EditMode:=1;
    DocMestoId:=Self.DocMestoId;
    DocLoadTypeId:=Self.DocLoadTypeId;
    DocType:=Self.DocType;
    DocMode:=Self.DocMode;
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

{ DONE -oPSV -cTitle_Actions : ������� �������� }
procedure Tf_Nakl.acMONaklDelExecute(Sender: TObject);
var NextId:double;
begin
  inherited;
  // ��������
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // �������� ���������
  if Application.MessageBox(PChar('������� ��������� � '+q_titleNAKL_NUM.AsString+' ?'),'��������!',MB_YESNO)=IDYES then
  Begin
    try
      q_Title.DisableControls;
      pkgFOR_NAKL.CallProcedure('DelTitle',[1,q_Title.FieldByName('ID').AsString]);
      q_Title.Next;
    except
      on E:Exception do
      Begin
        f_main.ApplSession.WriteToLog(amFull,'NAKL',sesError,E.Message,0,'');
      end;
    end;
    // ��������������� �� ��������� ��������
    NextID:=q_Title.FieldByName('ID').AsFloat;
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
procedure Tf_Nakl.q_titleBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  // ��������� ������ �� �����
  q_title.SQL[12]:=' AND s.NAKL_date>=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date1.Date)+' '+FormatDateTime('hh:mm',time1.Time)+':00'',''dd.mm.yyyy hh24:mi:ss'')';
  q_title.SQL[13]:=' AND s.NAKL_date<=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date2.Date)+' '+FormatDateTime('hh:mm',time2.Time)+':59'',''dd.mm.yyyy hh24:mi:ss'')';
  IF lc_ProdGU12.Value='-1' THEN
    q_title.SQL[14]:=' AND s.PROD_GU12_ID IS NULL'
  else
    IF lc_ProdGU12.Value='0' THEN
      q_title.SQL[14]:=' AND 1=1'
    else
      q_title.SQL[14]:=' AND s.PROD_GU12_ID='''+VarToStr(lc_ProdGU12.KeyValue)+'''';
end;

{ DONE -oPSV -cTitle_Query : �������� ����� �������� q_title }
procedure Tf_Nakl.q_titleAfterOpen(DataSet: TDataSet);
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
procedure Tf_Nakl.q_titleAfterScroll(DataSet: TDataSet);
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
  tabRowsDetail.Caption:=' ������� ��������� � '+q_title.FieldByName('NAKL_NUM').AsString+' ';
  tabRowsItogs.Caption:=' ����� ��������� � '+q_title.FieldByName('NAKL_NUM').AsString+' ';

  if NOT Active then exit;
  // �������� ������ � �������� �����

end;

{ DONE -oPSV -cTitle_Query : ��������� ������ � ������� }
procedure Tf_Nakl.q_titleFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept:=f_db.AcceptFilterRecord(gridTitle,filter2title);
end;


{ DONE -oPSV -cTitle_Grid : ************************* ��������� ���������� - GridTitle ************************* }

{ DONE -oPSV -cTitle_Grid : ������� ��� ������ �� GridTitle
     ��������� ��������� � ������� (q_title.Post)
}
procedure Tf_Nakl.GridTitleExit(Sender: TObject);
begin
  inherited;
  if q_title.Active and (q_title.State<>dsBrowse) then q_title.Post;
end;

{ DONE -oPSV -cTitle_Grid : ���������� � GridTitle }
procedure Tf_Nakl.GridTitleSortMarkingChanged(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.SortInGrid(q_title,q_title.SQL.Count-1,GridTitle);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

{ TODO -oPSV -cTitle_Grid : ��������� �������� ������ }
procedure Tf_Nakl.GridTitleGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if (q_title.FieldByName('ID').AsString=q_rows.FieldByName('NAKL_ID').AsString) then
  Begin
    AFont.Style:=[fsBold];
  End;
end;

{ DONE -oPSV -cTitle_Popup : ************************* ��������� ���������� - Popup ************************* }

{ DONE -oPSV -cTitle_Popup : ������ ����� ��� ������� }
procedure Tf_Nakl.tbTitleFilterEditAcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterAcceptText(gridTitle,filter2title,NewText,Accept);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

{ DONE -oPSV -cTitle_Popup : ������ �� �����������  }
procedure Tf_Nakl.tbTitleFilterSelectionClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCurrentValue(gridTitle,filter2title);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

{ DONE -oPSV -cTitle_Popup : �������� ������  }
procedure Tf_Nakl.tbTitleFilterClearClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCLear(gridtitle,filter2title);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

{ DONE -oPSV -cTitle_Popup : ������������� � ���� }
procedure Tf_Nakl.tbTitleWinEditClick(Sender: TObject);
begin
  inherited;
  f_db.EditInMemo(gridTitle);
end;


{ DONE -oPSV -cRows_Actions : ************************* ������� ���������� - ������� ************************* }

{ DONE -oPSV -cRows_Actions : �������� q_rows }
procedure Tf_Nakl.bRefreshRowsClick(Sender: TObject);
begin
  inherited;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);
  // ��������� ������
  f_db.ReQuery(q_rows,true);
end;

{ DONE -oPSV -cRows_Actions : ��������  ������� }
procedure Tf_Nakl.acMONaklRowsDelExecute(Sender: TObject);
var NextId:double;
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

  GridRows.SetFocus;

  // �������� �������
  if Application.MessageBox('������� ������?','��������!',MB_YESNO)=IDYES then
  Begin
    try
      q_Rows.DisableControls;
      pkgFOR_NAKL.CallProcedure('DelRow',[1,q_Rows.FieldByName('ID').AsFloat]);
      q_Rows.Next;
    except
      on E:Exception do
      Begin
        f_main.ApplSession.WriteToLog(amFull,'NAKL',sesError,E.Message,0,'');
      end;
    end;
    // ��������������� �� ��������� ������
    NextID:=q_Rows.FieldByName('ID').AsFloat;
    f_db.ReQuery(q_Rows,false);
    q_Rows.Locate('ID',NextId,[]);
    q_Rows.EnableControls;
    q_rowsAfterDelete(q_rows);
  End;
end;




{ DONE -oPSV -cRows_Query : ************************* ������� ���������� - ������ q_rows ************************* }

{ DONE -oPSV -cRows_Query : ��������� ������ � q_rows }
procedure Tf_Nakl.q_rowsFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept:=f_db.AcceptFilterRecord(gridRows,filter2rows);
end;

{ DONE -oPSV -cRows_Query : �������� ����� �������� �� q_rows }
procedure Tf_Nakl.q_rowsAfterDelete(DataSet: TDataSet);
begin
  inherited;
  // �������� ���������
  IsRefresh:=true;
  f_db.ReQuery(q_title,true);
  IsRefresh:=false;
end;



{ DONE -oPSV -cRows_Grid : ************************* ������� ���������� - GridRows ************************* }

{ DONE -oPSV -cRows_Grid :
������� ��� ������ �� GridRows
     ��������� ��������� � ������� (q_rows.Post) }
procedure Tf_Nakl.GridRowsExit(Sender: TObject);
begin
  inherited;
  if q_rows.Active and (q_rows.State<>dsBrowse) then q_rows.Post;
end;

{ DONE -oPSV -cRows_Grid : ���������� ������� � GridRows }
procedure Tf_Nakl.GridRowsSortMarkingChanged(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.SortInGrid(q_rows,q_rows.SQL.Count-1,GridRows);
  IsRefresh:=false;
end;



{ DONE -oPSV -cRows_Popup : ************************* ������� ���������� - Popup ************************* }

{ DONE -oPSV -cRows_Popup : ��������� ������ (GridRows) }
procedure Tf_Nakl.tbRowsFilterEditAcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterAcceptText(gridRows,filter2rows,NewText,Accept);
  IsRefresh:=false;
end;

{ DONE -oPSV -cRows_Popup : ������  �� ����������� (GridRows) }
procedure Tf_Nakl.tbRowsFilterSelectionClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCurrentValue(gridRows,filter2rows);
  IsRefresh:=false;
end;

{ DONE -oPSV -cRows_Popup : �������� ������ (GridRows) }
procedure Tf_Nakl.tbRowsFilterClearClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCLear(gridRows,filter2rows);
  IsRefresh:=false;
end;

{ DONE -oPSV -cRows_Popup : ������������� � ���� (GridRows) }
procedure Tf_Nakl.tbRowsWinEditClick(Sender: TObject);
begin
  inherited;
  f_db.EditInMemo(gridRows);
end;

procedure Tf_Nakl.CheckTime(Sender: TObject);
begin
  inherited;
  if (DateOf(Date2.DateTime)<DateOf(Date1.DateTime)) then
    Date2.DateTime:=Date1.DateTime;

  if (TimeOf(Time2.DateTime)<TimeOf(Time1.DateTime)) and
     (DateOf(Date2.DateTime)=DateOf(Date1.DateTime)) then
    Date2.DateTime:=Date1.DateTime+1;
end;

procedure Tf_Nakl.acMONaklViewExecute(Sender: TObject);
begin
  inherited;
  // ��������
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // �������� ���������
  with tf_NaklNew.create(self) do
  Begin
    ParentFormName:='NAKL';
    EditId:=q_title.FieldByName('ID').AsFloat;
    EditMode:=2;
    DocMestoId:=Self.DocMestoId;
    DocLoadTypeId:=Self.DocLoadTypeId;
    DocType:=Self.DocType;
    DocMode:=Self.DocMode;
    ShowModal;
    Free;
  end;
end;

/////////������ ���������� ��������� ����� �� �������(��� ��������)/////////////
function Tf_Nakl.GetEnvelopeSize:TPoint;
var
  PaperW,PaperH       :integer;//������ � ������ ����� � ��������
  PixPerInX,PixPerInY :integer;//���������� ��������
begin
  PixPerInX:=GetDeviceCaps(Printer.Handle,LOGPIXELSX);
  PixPerInY:=GetDeviceCaps(Printer.Handle,LOGPIXELSY);
  PaperW:=Trunc(PaperSizeArray[1].W*PixPerInX);
  PaperH:=Trunc(PaperSizeArray[1].H*PixPerInY);
  Result:=Point(PaperW,PaperH);
end;

//��������� ������ ��� �4 ���� ���
function Tf_Nakl.CoordsByDisplacement(x,y:integer):TPoint;
const
  PaperW=210;
  PaperH=297;
var
  x1,y1:integer;
begin
x1:=Trunc((PaperSize.X/PaperW)*x);
y1:=Trunc((PaperSize.Y/PaperH)*y);
Result:=Point(x1,y1)
end;

procedure Tf_Nakl.PrintExpNakl;
const
  Displacement=6;
var
  LP,RP:TPoint;//����� ������� � ������ ������ ���� ������������� �������(pixels)
  TempStr:string;

begin
//������������� ��������
  if q_print_exp.Active then q_print_exp.Close;
  q_print_exp.SetVariable(':nakl_id',q_titleID.Value);
  q_print_exp.Open;
//������
  PaperSize:=GetEnvelopeSize;
  Printer.BeginDoc;
  try
    Printer.Canvas.Font.Name:='ArialNarrow';
    Printer.Canvas.Font.Size:=10;
//(�����������,�������� �����) �� ���-�����
    LP:=CoordsByDisplacement(74,17-Displacement);
    TempStr:=Trim(q_Print_exp.FieldByName('grotp_gd_kod').AsString)+'-'+Trim(q_Print_exp.FieldByName('tex_pd_id').AsString);
    Printer.Canvas.TextOut(LP.X,LP.Y,TempStr);
//(�����������,�������� �����)
    LP:=CoordsByDisplacement(20,21-Displacement);
    TempStr:=Trim(q_Print_exp.FieldByName('grotp_short_name').AsString);
//    Application.MessageBox(PChar('X='+IntToStr(LabelPos.Left)+' Y='+IntToStr(LabelPos.Top)),'!');
    Printer.Canvas.TextOut(LP.X,LP.Y,TempStr);
    TempStr:='���� '+q_Print_exp.FieldByName('grotp_okpo').AsString;
    LP.Y:=LP.Y+Printer.Canvas.TextHeight(TempStr)-2;
    Printer.Canvas.TextOut(LP.X,LP.Y,TempStr);

    TempStr:='�/� '+Trim(q_Print_exp.FieldByName('RS').AsString);
    LP.Y:=LP.Y+Printer.Canvas.TextHeight(TempStr)-2;
    Printer.Canvas.TextOut(LP.X,LP.Y,TempStr);

    TempStr:=Trim(q_Print_exp.FieldByName('bank').AsString);
    LP.Y:=LP.Y+Printer.Canvas.TextHeight(TempStr)-2;
    Printer.Canvas.TextOut(LP.X,LP.Y,TempStr);

    TempStr:=Trim(q_Print_exp.FieldByName('grotp_index').AsString)+', '+
                Trim(q_Print_exp.FieldByName('grotp_city').AsString)+', '+
                  Trim(q_Print_exp.FieldByName('grotp_address').AsString);
    LP.Y:=LP.Y+Printer.Canvas.TextHeight(TempStr)-2;
    Printer.Canvas.TextOut(LP.X,LP.Y,TempStr);

{    LabelPos.Top:=LabelPos.Bottom+10;
    LabelPos.Right:=LabelPos.Left+Printer.Canvas.TextWidth(edText2.Text);
    LabelPos.Bottom:=LabelPos.Top+Printer.Canvas.TextHeight(edText2.Text);
    Printer.Canvas.TextRect(LabelPos,LabelPos.Left,LabelPos.Top,edText2.Text);
    LabelPos.Top:=LabelPos.Bottom+10;
    LabelPos.Right:=LabelPos.Left+Printer.Canvas.TextWidth(edText3.Text);
    LabelPos.Bottom:=LabelPos.Top+Printer.Canvas.TextHeight(edText3.Text)+10;
    Printer.Canvas.TextRect(LabelPos,LabelPos.Left,LabelPos.Top,edText3.Text);}
  finally
    Printer.EndDoc;
  end;

end;
///////////////////////////////////////////////////////////////////////////////
end.
