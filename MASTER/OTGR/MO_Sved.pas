unit MO_Sved;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MdiForm, Placemnt, ExtCtrls, Grids, DBGridEh, ComCtrls,
  RxLookup, Buttons, StdCtrls, TB2Dock, TB2Toolbar, TB2Item, ActnList,
  XPStyleActnCtrls, ActnMan, TB2ExtItems, Menus, Oracle, DB, OracleData, DBGrids,
  PropFilerEh, PropStorageEh, MemTableDataEh, DataDriverEh, MemTableEh,DateUtils,DBGridEhImpExp,RxShell,
  GridsEh;

// �������� �� ��������

type
  Tf_Sved = class(Tf_MDIForm)
    GroupBox1: TGroupBox;
    Splitter1: TSplitter;
    ActionManager1: TActionManager;
    acToXLS: TAction;
    PopupTitle: TTBPopupMenu;
    tbTitleFilterTitle: TTBItem;
    acMOSvedAdd: TAction;
    acMOSvedEdit: TAction;
    acMOSvedDel: TAction;
    acMOSvedCopy: TAction;
    acMOSvedRowsAdd: TAction;
    acMOSvedRowsEdit: TAction;
    acMOSvedRowsCopy: TAction;
    acMOSvedRowsDel: TAction;
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
    pkgFOR_SVED: TOraclePackage;
    PropStorageEh1: TPropStorageEh;
    lc_Prod: TRxDBLookupCombo;
    ds_Prod: TDataSource;
    q_VagonType: TOracleDataSet;
    q_VagonTypeID: TIntegerField;
    q_VagonTypeNAME: TStringField;
    q_Prod: TOracleDataSet;
    q_VagOwner: TOracleDataSet;
    q_VagOwnerID: TFloatField;
    q_VagOwnerNAME: TStringField;
    q_VagOwnerSORTBY: TFloatField;
    q_VetkaPod: TOracleDataSet;
    acRowsPost: TAction;
    TBItem19: TTBItem;
    acRowsCancel: TAction;
    pageTitle: TPageControl;
    tabTitleDetail: TTabSheet;
    tabTitleItogs: TTabSheet;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    bRefresh: TTBItem;
    TBItem3: TTBItem;
    TBItem2: TTBItem;
    TBItem4: TTBItem;
    TBItem1: TTBItem;
    GridTitle: TDBGridEh;
    pageRows: TPageControl;
    tabRowsDetail: TTabSheet;
    tabRowsItogs: TTabSheet;
    TBDock2: TTBDock;
    TBToolbar2: TTBToolbar;
    TBDock4: TTBDock;
    TBToolbar4: TTBToolbar;
    TBItem21: TTBItem;
    GridRows: TDBGridEh;
    q_VetkaNapr: TOracleDataSet;
    q_VetkaNaprID: TFloatField;
    q_VetkaNaprNAME: TStringField;
    q_VetkaPodID: TFloatField;
    q_VetkaPodNAME: TStringField;
    q_VagStatus: TOracleDataSet;
    q_ProdID_NPR: TStringField;
    q_ProdNAME_NPR: TStringField;
    TBDock3: TTBDock;
    TBToolbar3: TTBToolbar;
    TBItem20: TTBItem;
    rg_KindOfDate: TRadioGroup;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Time2: TDateTimePicker;
    Time1: TDateTimePicker;
    Date2: TDateTimePicker;
    Date1: TDateTimePicker;
    lbProdName: TLabel;
    q_titleID: TStringField;
    q_titleSVED_NUM: TFloatField;
    q_titleSVED_DATE: TDateTimeField;
    q_titleMESTO_ID: TFloatField;
    q_titleLOAD_TYPE_ID: TFloatField;
    q_titleTECH_TIME: TDateTimeField;
    q_titleGOTOV_TIME: TDateTimeField;
    q_titleBEG_NALIV_TIME: TDateTimeField;
    q_titleEND_NALIV_TIME: TDateTimeField;
    q_titleDATE_OFORML: TDateTimeField;
    q_titleSVED_VES: TFloatField;
    q_titleSVED_CNT: TIntegerField;
    q_titleVES_CIST: TFloatField;
    q_titleKOL_NET: TFloatField;
    q_titleVES_ALL: TFloatField;
    q_titleDEFI_MASS_ID: TFloatField;
    q_titlePASP_ID: TStringField;
    q_titleSVED_ID_NPR: TStringField;
    q_titleSVED_PROD_NAME: TStringField;
    q_titleSVED_PASP_NUM: TStringField;
    q_titleSVED_REZ_NUM: TStringField;
    q_titleSVED_PASP_DATE: TDateTimeField;
    q_titleSVED_NOM_ZD: TStringField;
    q_titleSVED_CENA: TFloatField;
    q_titleSVED_CENA_OTP: TFloatField;
    q_titleSVED_DATE_CENA: TDateTimeField;
    q_titleIS_EXP: TIntegerField;
    q_titleNOM_ETRAN: TStringField;
    q_titleSOBSTV_NAME: TStringField;
    q_titleDOG_NUMBER: TStringField;
    q_titlePLAT_NAME: TStringField;
    q_titlePOLUCH_NAME: TStringField;
    q_titlePOLUCH_GD_KOD: TStringField;
    q_titlePOLUCH_OKPO: TStringField;
    q_titleSTAN_KOD: TIntegerField;
    q_titleSTAN_NAME: TStringField;
    q_titlePL20: TFloatField;
    q_titlePL15: TFloatField;
    q_titleP_SER: TFloatField;
    q_titleT_VSP: TFloatField;
    q_titleP_VOD: TFloatField;
    q_titleP_DIRT: TFloatField;
    q_titleP_SOL: TFloatField;
    q_titleMG_SOL: TFloatField;
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
    q_rowsNUM_PROP: TIntegerField;
    q_rowsFIO_DRIVER: TStringField;
    q_rowsFORMNAKL_ID: TFloatField;
    q_rowsNUM_KVIT: TStringField;
    q_rowsDATE_KVIT: TDateTimeField;
    q_rowsTARIF: TFloatField;
    q_rowsTARIF_GUARD: TFloatField;
    q_rowsVOLUME: TFloatField;
    q_rowsVED_POD_NUM: TStringField;
    q_rowsVAGONTYPE_NAME: TStringField;
    q_rowsVAGOWNER_NAME: TStringField;
    q_rowsVETKA_POD_NAME: TStringField;
    q_VetkaOtp: TOracleDataSet;
    q_rowsVETKA_OTP_NAME: TStringField;
    q_rowsVETKA_NAPR_NAME: TStringField;
    q_rowsVAG_STATUS_NAME: TStringField;
    q_Upak: TOracleDataSet;
    q_rowsUPAK_NAME: TStringField;
    q_ZpuType1: TOracleDataSet;
    q_ZpuType1ID: TFloatField;
    q_ZpuType1NAME: TStringField;
    q_UpakID: TFloatField;
    q_UpakNAME: TStringField;
    q_VetkaOtpID: TFloatField;
    q_VetkaOtpNAME: TStringField;
    q_VagStatusID: TFloatField;
    q_VagStatusNAME: TStringField;
    q_ZpuType2: TOracleDataSet;
    q_ZpuType2ID: TFloatField;
    q_ZpuType2NAME: TStringField;
    q_rowsZPU_TYPE1_NAME: TStringField;
    q_rowsZPU_TYPE2_NAME: TStringField;
    q_titleDEFI_MASS_NAME: TStringField;
    q_FormNakl: TOracleDataSet;
    q_FormNaklID: TIntegerField;
    q_FormNaklNAME: TStringField;
    q_rowsFORMNAKL_NAME: TStringField;
    q_rowsNAR_LINE_ID: TFloatField;
    q_rowsNAKL_ID: TFloatField;
    q_rowsNARIAD_NUM: TStringField;
    q_rowsNAKL_NUM: TStringField;
    q_titlePOD_DATE: TDateTimeField;
    ds_VagonType: TDataSource;
    ds_VagOwner: TDataSource;
    ds_VetkaPod: TDataSource;
    ds_VetkaOtp: TDataSource;
    ds_VetkaNapr: TDataSource;
    ds_VagStatus: TDataSource;
    ds_Upak: TDataSource;
    ds_ZpuType1: TDataSource;
    ds_ZpuType2: TDataSource;
    ds_FormNakl: TDataSource;
    acMOSvedRowsCalc: TAction;
    pkgFor_cist: TOraclePackage;
    pkgFor_ves: TOraclePackage;
    q_rowsBAD_NUM: TIntegerField;
    q_rowsGOST_ID: TIntegerField;
    q_rowsCTLV: TFloatField;
    q_rowsVOLUME15: TIntegerField;
    acMOSvedAddVagons: TAction;
    ds_Ved: TDataSource;
    q_Ved: TOracleDataSet;
    q_VedVETKA_OTP_ID: TFloatField;
    q_VedTREENODE1: TStringField;
    q_VedVED_POD_ID: TFloatField;
    q_VedVED_POD_ROW_ID: TFloatField;
    q_VedPOD_NUM: TFloatField;
    q_VedPOD_DATE: TDateTimeField;
    q_VedPOD_POS: TFloatField;
    q_VedTREECHILD1: TStringField;
    q_VedNUM_CIST: TStringField;
    q_VedKALIBR_ID: TStringField;
    q_VedVAG_STATUS_ID: TFloatField;
    q_VedVAG_STATUS_NAME: TStringField;
    q_VedRAZMET: TStringField;
    q_NarLines: TOracleDataSet;
    ds_NarLines: TDataSource;
    q_NarLinesNARIAD_ID: TFloatField;
    q_NarLinesTN: TStringField;
    q_NarLinesNAR_LINE_ID: TFloatField;
    q_NarLinesNUM_NAR: TStringField;
    q_NarLinesDATE_NAR: TDateTimeField;
    q_NarLinesDATE_END: TDateTimeField;
    q_NarLinesNOM_ZD: TStringField;
    q_NarLinesRASPOR_VES: TFloatField;
    q_NarLinesRASPOR_KOL: TFloatField;
    q_NarLinesMONTH_VES: TFloatField;
    q_NarLinesMONTH_KOL: TFloatField;
    q_NarLinesPROD_NAME: TStringField;
    q_NarLinesSTAN_NAME: TStringField;
    q_NarLinesPOLUCH_NAME: TStringField;
    q_NarLinesIMAGEINDEX1: TFloatField;
    q_VedLOOKUP: TStringField;
    mteNariad: TMemTableEh;
    dsdNariad: TDataSetDriverEh;
    TBDock5: TTBDock;
    TBToolbar5: TTBToolbar;
    TBItem30: TTBItem;
    TBItem31: TTBItem;
    TBItem32: TTBItem;
    TBItem33: TTBItem;
    TBItem34: TTBItem;
    TBItem35: TTBItem;
    TBItem36: TTBItem;
    TBItem37: TTBItem;
    acMOSvedAddress: TAction;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    acMOSvedNewNakl: TAction;
    TBItem7: TTBItem;
    pkgFOR_DOCUMENTS: TOraclePackage;
    acFindSved: TAction;
    TBItem8: TTBItem;
    acMOUvedAdd: TAction;
    TBItem18: TTBItem;
    q_rowsNAKL_POS: TIntegerField;
    q_rowsUVED_ID: TFloatField;
    q_rowsUVED_POS: TIntegerField;
    q_temp_ves: TOracleDataSet;
    q_rowsUVED_NUM: TStringField;
    acMOSvedView: TAction;
    TBItem22: TTBItem;
    acRowsSprav: TAction;
    acMOSvedRowsView: TAction;
    TBItem23: TTBItem;
    q_rowsIS_AUTO: TIntegerField;
    q_titlePLAT_ID: TIntegerField;
    q_Gost: TOracleDataSet;
    ds_Gost: TDataSource;
    q_GostID: TIntegerField;
    q_GostNAME: TStringField;
    q_cist_deni: TOracleDataSet;
    q_titleMG_VOD: TFloatField;
    TBItem28: TTBItem;
    acLastReis: TAction;
    TBItem38: TTBItem;
    q_rowsVybor: TIntegerField;
    TBSubmenuItem3: TTBSubmenuItem;
    TBItem10: TTBItem;
    TBSeparatorItem9: TTBSeparatorItem;
    TBItem39: TTBItem;
    TBSeparatorItem10: TTBSeparatorItem;
    TBItem40: TTBItem;
    SaveDialog1: TSaveDialog;
    q_titleTEX_PD_ID: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acToXLSExecute(Sender: TObject);
    procedure acMOSvedAddExecute(Sender: TObject);
    procedure acMOSvedEditExecute(Sender: TObject);
    procedure acMOSvedRowsAddExecute(Sender: TObject);
    procedure acMOSvedRowsEditExecute(Sender: TObject);
    procedure acMOSvedRowsCopyExecute(Sender: TObject);
    procedure acMOSvedRowsDelExecute(Sender: TObject);
    procedure acPrintExecute(Sender: TObject);
    procedure acFilterExecute(Sender: TObject);
    procedure acNoFilterExecute(Sender: TObject);
    procedure acMOSvedCopyExecute(Sender: TObject);
    procedure acMOSvedDelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridTitleColumns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
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
    procedure q_rowsAfterPost(DataSet: TDataSet);
    procedure q_rowsAfterInsert(DataSet: TDataSet);
    procedure q_rowsBeforeScroll(DataSet: TDataSet);
    procedure q_titleBeforeOpen(DataSet: TDataSet);
    procedure acRowsPostExecute(Sender: TObject);
    procedure q_rowsAfterScroll(DataSet: TDataSet);
    procedure GridRowsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure acRowsCancelExecute(Sender: TObject);
    procedure q_rowsKALIBR_IDValidate(Sender: TField);
    procedure acMOSvedRowsCalcExecute(Sender: TObject);
    procedure q_rowsVZLIVValidate(Sender: TField);
    procedure acMOSvedAddVagonsExecute(Sender: TObject);
    procedure GridRowsCellClick(Column: TColumnEh);
    procedure acMOSvedAddressExecute(Sender: TObject);
    procedure acMOSvedNewNaklExecute(Sender: TObject);
    procedure ExecuteSearch();
    procedure acFindSvedExecute(Sender: TObject);
    procedure acMOUvedAddExecute(Sender: TObject);
    procedure InitVagonParams;
    procedure CheckTime(Sender: TObject);
    procedure acMOSvedViewExecute(Sender: TObject);
    procedure acRowsSpravExecute(Sender: TObject);
    procedure acMOSvedRowsViewExecute(Sender: TObject);
    procedure GridRowsGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure q_rowsTEMPERValidate(Sender: TField);
    procedure acLastReisExecute(Sender: TObject);
    procedure q_rowsCalcFields(DataSet: TDataSet);
    procedure TBItem39Click(Sender: TObject);
    procedure TBItem40Click(Sender: TObject);
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
    //���������� ����������
    dbg:integer;
    Vybor:array [1..100] of byte;
    VagTypes:set of 1..20;

{    vPrevRazmet:variant;
    vPrevNcistdop:variant;
    vPrevVagowner:variant;
    vPrevProd:variant;
    vPrevVPod:variant;
    vPrevVNapr:variant;
    vPrevStatus:variant;}
  public
    { Public declarations }
    QueryBegin,QueryEnd:TDateTime;
    DocMestoId:integer; // ����� ��������
    DocLoadTypeId:integer; // ��� ���������������
    DocType:integer; // ��� ���������
    DocMode:integer; // 1-�������������� ����, 2-�����������������
    DocTitleID:string;//ID �����. ���-�� ��� ��������� ������
    NarLineId:integer;
  end;

var
  f_Sved: Tf_Sved;
  gLinkMode:integer; // ����� ���������: 1-������ �� ������ 0-����������� ��������
  gLinkFilter:string; // ������ ��� ������� �� ������
  gMesto:integer; // ����� ��������
  gLoadType:integer; // ��� ���������������
  gMode:integer; // 1-�������������� ����, 2-�����������������

implementation

uses main, ForDB, MO_SvedNew, ForSESS, KlsMisc2, MO_SvedAddVagon, MO_SvedAddVagonVedPod, MO_SvedAddress, MO_NaklNew, MO_UvedNew,  MO_Find,
  ForTemp, ForFiles;

{$R *.dfm}

{ TODO -oPSV -c����� : ************************* ������ ����� ************************* }

{ TODO -oPSV -c����� : �������� ����� }
procedure Tf_Sved.FormCreate(Sender: TObject);
//var i:integer;
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
  Time1.Time:=StrToTime('00:00:00');
  Time2.Time:=StrToTime('23:59:59');
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
  // ��� ��������� - �������� �� ��������
  DocType:=3;
  DocLoadTypeId:=gLoadType;
  gLoadType:=-1;
  DocMode:=gMode;
  // ������
  f_db.LogonMasterSession(ora_Session);
  f_db.SetUserGrants(ActionManager1);

  // ��������� �����
  if f_db.CheckGrant('acMOSvedRowsEdit') then
  Begin
    q_Rows.ReadOnly:=false;
  End
  else
  Begin
    q_Rows.ReadOnly:=true;
  end;

  // �������� ��������
  q_prod.Open;
  q_VetkaPod.Open;
  q_VetkaNapr.Open;
  q_Vagontype.Open;
  q_VagStatus.Open;

  q_VagOwner.SetVariable('LOAD_TYPE_ID',DocLoadTypeId);
  q_VagOwner.Open;

  q_VetkaOtp.SetVariable('LOAD_TYPE_ID',DocLoadTypeId);
  q_VetkaOtp.SetVariable('MESTO_ID',DocMestoId);
  q_VetkaOtp.Open;

  q_title.SetVariable('LOAD_TYPE_ID',DocLoadTypeId);
  q_title.SetVariable('MESTO_ID',DocMestoId);
  IsRefresh:=true;
  q_title.Open;
  IsRefresh:=false;
  //���� ������� ���������� ���������(��� �������� ��������)
  VagTypes:=[1,6];
  q_titleAfterScroll(q_title);

  // ����� ������
{  if DocMode=2 then
  Begin
    // ����� "�����������������"
    for i:=1 to GridRows.Columns.Count do
    Begin
      with GridRows.Columns[i-1] do
      Begin
        Visible:=((FieldName='NUM_CIST') or (FieldName='VAGOWNER_NAME') or (FieldName='NUM_KVIT') or (FieldName='DATE_KVIT') or
                  (FieldName='VES_KVIT') or (FieldName='TARIF') or (FieldName='DATE_IN_STAN') or (FieldName='DATE_VOZ') or
                  (FieldName='EMPTY_VOZ') or (FieldName='KVIT_VOZ') or (FieldName='STAN_VOZ_KOD') or (FieldName='STAN_VOZ_NAME') or
                  (FieldName='ID') or (FieldName='SVED_IN_ID') or (FieldName='SVED_POS') or (FieldName='VES'));
        ReadOnly:=((FieldName='ID') or (FieldName='SVED_IN_ID') or (FieldName='VES'));
      End;
    End;
  End;}
end;

{ TODO -oPSV -c����� : �������� ����� }
procedure Tf_Sved.FormClose(Sender: TObject; var Action: TCloseAction);
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





{ TODO -oPSV -cTitle_Actions: ************************* ��������� ���������� - ������� ************************* }

{ TODO -oPSV -cTitle_Actions : �������� q_title}
procedure Tf_Sved.bRefreshClick(Sender: TObject);
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
procedure Tf_Sved.acToXLSExecute(Sender: TObject);
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
procedure Tf_Sved.acPrintExecute(Sender: TObject);
begin
  inherited;
  // ��������
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  // ��������� ID ��������
  TempVari.SetVariChar('SVED_ID_XLS', q_titleID.AsString, 'MASTER', 'MO_SVED.XLS');
  // ����������� XLS �� ��������� �������
  F_FileUtils.CheckReport('MO_sved.XLS',f_main.TempNetPath+'MO_sved.XLS');
  // ������� Excel
  F_FileUtils.OpenWorkbook(f_main.TempNetPath+'MO_sved.XLS',DocType);
end;

{ TODO -oPSV -cTitle_Actions : ��������� ����� }
procedure Tf_Sved.acFilterExecute(Sender: TObject);
begin
  inherited;
  {}
end;

{ TODO -oPSV -cTitle_Actions : �������� ����� }
procedure Tf_Sved.acNoFilterExecute(Sender: TObject);
begin
  inherited;
  {}
end;

{ TODO -cTitle_Actions -oPSV : �������� �������� }
procedure Tf_Sved.acMOSvedAddExecute(Sender: TObject);
begin
  inherited;
  // ��������
  if not q_title.Active then exit;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // ���������� ���������
  with tf_SvedNew.create(self) do
  Begin
    EditId:='';
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

{ TODO -cTitle_Actions -oPSV : ����������� �������� }
procedure Tf_Sved.acMOSvedEditExecute(Sender: TObject);
begin
  inherited;
  // ��������
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // �������������� ���������
  with tf_SvedNew.create(self) do
  Begin
    EditId:=q_title.FieldByName('ID').AsString;
    EditMode:=1;
    if ShowModal=mrOk then
    Begin
      if IsNeedReCalcVes then acMOSvedRowsCalcExecute(Sender);
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

{ TODO -oPSV -cTitle_Actions : ���������� �������� }
procedure Tf_Sved.acMOSvedCopyExecute(Sender: TObject);
begin
  inherited;
  // ��������
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // ����������� ���������
  with tf_SvedNew.create(self) do
  Begin
    EditId:=q_title.FieldByName('ID').AsString;
    EditMode:=0;
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

{ TODO -oPSV -cTitle_Actions : ������� �������� }
procedure Tf_Sved.acMOSvedDelExecute(Sender: TObject);
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
      pkgFOR_SVED.CallProcedure('DelTitle',[1,q_Title.FieldByName('ID').AsString]);
      q_Title.Next;
    except
      on E:Exception do
      Begin
        f_main.ApplSession.WriteToLog(amFull,'SVED',sesError,E.Message,0,'');
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

{ TODO -oPSV -cTitle_Actions : ����� ��������� }
procedure Tf_Sved.acMOSvedNewNaklExecute(Sender: TObject);
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

  // �������� ����������
  if (q_titleSVED_NOM_ZD.AsString='') then
  Begin
    Application.MessageBox(PChar('� �������� � '+q_titleSVED_NUM.AsString+' �� ������ � �������!'),'��������',MB_OK);
    exit;
  End;
  if (q_titlePASP_ID.IsNull) then
  Begin
    Application.MessageBox(PChar('� �������� � '+q_titleSVED_NUM.AsString+' �� ������ ������� �� ����������� ���������!'),'��������',MB_OK);
    exit;
  End;
  if (q_titleSVED_ID_NPR.AsString='') then
  Begin
    Application.MessageBox(PChar('� �������� � '+q_titleSVED_NUM.AsString+' �� ������ �������!'),'��������',MB_OK);
    exit;
  End;
  if (q_rowsNAR_LINE_ID.IsNull) then
  Begin
    Application.MessageBox(PChar('�� ������ � '+q_rowsNUM_CIST.AsString+' ��� ���������� �� ��������!'),'��������',MB_OK);
    exit;
  End;
  if (NOT q_rowsNAKL_ID.IsNull) then
  Begin
    Application.MessageBox(PChar('����� � '+q_rowsNUM_CIST.AsString+' ��� ������ � ��������� � '+q_rowsNAKL_NUM.AsString+'!'),'��������',MB_OK);
    exit;
  End;
  if (q_rowsVAG_STATUS_ID.AsInteger<>0) then
  Begin
    Application.MessageBox(PChar('����� � '+q_rowsNUM_CIST.AsString+' �� ���������!'),'��������',MB_OK);
    exit;
  End;
  if (q_rowsVES.AsFloat=0) then
  Begin
    Application.MessageBox(PChar('����� � '+q_rowsNUM_CIST.AsString+' ��� ���� �����!'),'��������',MB_OK);
    exit;
  End;

  // �������� ����� ���������
  with tf_NaklNew.create(self) do
  Begin
    ParentFormName:='SVED';
    DocMestoId:=Self.DocMestoId;
    DocLoadTypeId:=Self.DocLoadTypeId;
    DocType:=6;
    DocMode:=Self.DocMode;
    EditMode:=0;
    EditId:=q_rowsNAKL_ID.AsFloat;
    ReestrId:=q_rowsID.AsFloat;
//    FormNakl:=q_rowsFORMNAKL_ID.AsFloat;
    if ShowModal=mrOk then
    Begin
      f_db.ReQuery(q_Rows,true);
    end;
    Free;
  end;
end;

{ TODO -oPSV -cTitle_Actions : �������� ��������� }
procedure Tf_Sved.acMOSvedViewExecute(Sender: TObject);
begin
  inherited;
  // ��������
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // �������� ��������
  with tf_SvedNew.create(self) do
  Begin
    EditId:=q_title.FieldByName('ID').AsString;
    EditMode:=2;
    ShowModal;
    Free;
  end;
end;

{ TODO -oPSV -cTitle_Actions : ����� ����������� }
procedure Tf_Sved.acMOUvedAddExecute(Sender: TObject);
begin
  inherited;
  // ��������
  if q_Rows.ReadOnly then exit;
  if not q_title.Active then exit;
  if not q_rows.Active then exit;
  if q_title.IsEmpty then exit;
  if q_rows.IsEmpty then exit;

  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  GridRows.SetFocus;

  // �������� ������ �����������
  with tf_UvedNew.create(self) do
  Begin
    ParentFormName:='SVED';
    DocMestoId:=Self.DocMestoId;
    DocLoadTypeId:=Self.DocLoadTypeId;
    DocType:=7;
    DocMode:=Self.DocMode;
    EditMode:=0;
    EditId:=0;
    if ShowModal=mrOk then
    Begin
      f_db.ReQuery(q_Rows,true);
    end;
    Free;
  end;
end;

{ TODO -oPSV -cTitle_Query : ************************* ��������� ���������� - ������ q_title ************************* }

{ TODO -oPSV -cTitle_Query : �������� �� �������� q_title }
procedure Tf_Sved.q_titleBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  // ��������� ������ �� �����
  q_title.SQL[29]:=' AND s.sved_date>=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date1.Date)+''',''dd.mm.yyyy'')';
  q_title.SQL[30]:=' AND s.sved_date<=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date2.Date)+''',''dd.mm.yyyy'')';
  IF lc_Prod.Value='0' THEN
    q_title.SQL[31]:=' AND s.PROD_ID_NPR IS NULL'
  else
    IF lc_Prod.Value='-1' THEN
      q_title.SQL[31]:=' AND 1=1'
    else
      q_title.SQL[31]:=' AND s.PROD_ID_NPR='''+VarToStr(lc_Prod.KeyValue)+'''';
  q_title.SQL.SaveToFile('c:\tmp\1.sql');
end;

{ TODO -oPSV -cTitle_Query : �������� ����� �������� q_title }
procedure Tf_Sved.q_titleAfterOpen(DataSet: TDataSet);
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

{ TODO -oPSV -cTitle_Query : ����� ����� ������� ������ q_title }
procedure Tf_Sved.q_titleAfterScroll(DataSet: TDataSet);
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
  tabRowsDetail.Caption:=' ������� �������� � '+q_title.FieldByName('SVED_NUM').AsString+' ';
  tabRowsItogs.Caption:=' ����� �������� � '+q_title.FieldByName('SVED_NUM').AsString+' ';

  if NOT Active then exit;
  // �������� ������ � �������� �����

end;

{ TODO -oPSV -cTitle_Query : ��������� ������ � ������� }
procedure Tf_Sved.q_titleFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept:=f_db.AcceptFilterRecord(gridTitle,filter2title);
end;


{ TODO -oPSV -cTitle_Filter : ************************* ��������� ���������� - ������ ************************* }

{ TODO -oPSV -cTitle_Filter : �������� ������� }
procedure Tf_Sved.CheckTime(Sender: TObject);
begin
  inherited;
  if (DateOf(Date2.DateTime)<DateOf(Date1.DateTime)) then
    Date2.DateTime:=Date1.DateTime;

  if (TimeOf(Time2.DateTime)<TimeOf(Time1.DateTime)) and
     (DateOf(Date2.DateTime)=DateOf(Date1.DateTime)) then
    Date2.DateTime:=Date1.DateTime+1;
end;




{ TODO -oPSV -cTitle_Grid : ************************* ��������� ���������� - GridTitle ************************* }

{ TODO -oPSV -cTitle_Grid : �������� ������� "� �/�" (GridTitle)}
procedure Tf_Sved.GridTitleColumns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
  inherited;
  try
    Params.Text:=IntToStr(q_title.RecNo);
  except
    Params.Text:='0';
  end;
end;

{ TODO -oPSV -cTitle_Grid : ������� ��� ������ �� GridTitle
     ��������� ��������� � ������� (q_title.Post)
}
procedure Tf_Sved.GridTitleExit(Sender: TObject);
begin
  inherited;
  if q_title.Active and (q_title.State<>dsBrowse) then q_title.Post;
end;

{ TODO -oPSV -cTitle_Grid : ���������� � GridTitle }
procedure Tf_Sved.GridTitleSortMarkingChanged(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.SortInGrid(q_title,q_title.SQL.Count-1,GridTitle);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

{ TODO -oPSV -cTitle_Popup : ************************* ��������� ���������� - Popup ************************* }

{ TODO -oPSV -cTitle_Popup : ������ ����� ��� ������� }
procedure Tf_Sved.tbTitleFilterEditAcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterAcceptText(gridTitle,filter2title,NewText,Accept);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;


procedure Tf_Sved.tbTitleFilterSelectionClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCurrentValue(gridTitle,filter2title);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

{ TODO -oPSV -cTitle_Popup : �������� ������  }
procedure Tf_Sved.tbTitleFilterClearClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCLear(gridtitle,filter2title);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

{ TODO -oPSV -cTitle_Popup : ������������� � ���� }
procedure Tf_Sved.tbTitleWinEditClick(Sender: TObject);
begin
  inherited;
  f_db.EditInMemo(gridTitle);
end;


{ TODO -oPSV -cRows_Actions : ************************* ������� ���������� - ������� ************************* }

{ TODO -oPSV -cRows_Actions : �������� q_rows }
procedure Tf_Sved.bRefreshRowsClick(Sender: TObject);
begin
  inherited;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);
  // ��������� ������
  f_db.ReQuery(q_rows,true);
end;

{ TODO -oPSV -cRows_Actions : ���������� ������� }
procedure Tf_Sved.acMOSvedRowsAddExecute(Sender: TObject);
begin
  inherited;
  // ��������
  if q_Rows.ReadOnly then exit;
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
  with tf_AddVagon.create(self) do
  Begin
    EditId:=0;
    EditMode:=0;
    isLoading:=True;
    ShowModal;
    if ModalResult=mrOk then
    Begin
      // ������� ���������
      IsRefresh:=true;
      f_db.ReQuery(q_Title,true);
      IsRefresh:=false;
      // ��������������� �� ����������� ��������
      f_db.ReQuery(q_Rows,false);
      q_Rows.Locate('ID',EditId,[]);
    end;
    Free;
  end;
end;

{ TODO -oPSV -cRows_Actions : ��������������  ������� }
procedure Tf_Sved.acMOSvedRowsEditExecute(Sender: TObject);
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

  // ����� ������
  q_rows.Edit;

  // ������� ����� ��� �������������� � �����
  with tf_AddVagon.create(self) do
  Begin
    EditId:=q_rows.FieldByName('ID').AsFloat;
    EditMode:=1;
    isLoading:=True;
    ShowModal;
    q_Rows.Cancel; // �������� ������
    if ModalResult=mrOk then
    Begin
      // ������� ���������
      IsRefresh:=true;
      f_db.ReQuery(q_Title,true);
      IsRefresh:=false;
      // ��������������� �� ��������
      f_db.ReQuery(q_Rows,false);
      q_Rows.Locate('ID',EditId,[]);
    end;
    free;
  end;
//���������� ������������� ������

// �������������� �������
end;

{ TODO -oPSV -cRows_Actions : �����������  ������� }
procedure Tf_Sved.acMOSvedRowsCopyExecute(Sender: TObject);
begin
  inherited;
  // ��������
  if q_Rows.ReadOnly then exit;
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

  // ����������� �������
  with tf_AddVagon.create(self) do
  Begin
    EditId:=q_rows.FieldByName('ID').AsFloat;
    EditMode:=0;
    isLoading:=True;
    ShowModal;
    if ModalResult=mrOk then
    Begin
      // ������� ���������
      IsRefresh:=true;
      f_db.ReQuery(q_Title,true);
      IsRefresh:=false;
      // ��������������� �� ����������� ��������
      f_db.ReQuery(q_Rows,false);
      q_Rows.Locate('ID',EditId,[]);
    end;
    Free;
  end;
end;

{ TODO -oPSV -cRows_Actions : �������� ������� }
procedure Tf_Sved.acMOSvedRowsViewExecute(Sender: TObject);
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

  // ������� ����� ��� ��������� � �����
  with tf_AddVagon.create(self) do
  Begin
    EditId:=q_rows.FieldByName('ID').AsFloat;
    EditMode:=2;
    isLoading:=True;
    ShowModal;
    free;
  end;
end;

{ TODO -oPSV -cRows_Actions : ��������  ������� }
procedure Tf_Sved.acMOSvedRowsDelExecute(Sender: TObject);
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
      pkgFOR_SVED.CallProcedure('DelRow',[1,q_Rows.FieldByName('ID').AsFloat]);
      q_Rows.Next;
    except
      on E:Exception do
      Begin
        f_main.ApplSession.WriteToLog(amFull,'SVED',sesError,E.Message,0,'');
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

{ TODO -oPSV -cRows_Actions : ��������� ��������� � ������� � ��������� }
procedure Tf_Sved.acRowsPostExecute(Sender: TObject);
begin
  inherited;
  // ��������� ���������
  if q_Rows.ReadOnly then exit;
  GridTitleExit(Sender);
  GridRowsExit(Sender);
end;

{ TODO -oPSV -cRows_Actions : �������� ��������� � ������� � ��������� }
procedure Tf_Sved.acRowsCancelExecute(Sender: TObject);
begin
  inherited;
  if q_title.Active and (q_title.State<>dsBrowse) then q_title.Cancel;
  if q_rows.Active and (q_rows.State<>dsBrowse) then q_rows.Cancel;
end;

{ TODO -oPSV -cRows_Actions : ��������� ��� ��������� ���� }
procedure Tf_Sved.acMOSvedRowsCalcExecute(Sender: TObject);
var CurrId:double;
begin
  inherited;
  // ��������
  if q_Rows.ReadOnly then exit;
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  if q_rows.IsEmpty then exit;

  if (q_titleDefi_mass_id.Value<>1) then
  begin
    application.MessageBox('��� ����� ����������� ������ � ����� "F4-�������������"!','��������!');
    exit;
  end;//if

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
        q_rowsVes.Value:=pkgFor_ves.CallFloatFunction('calc_ves',[DateOf(q_titleSVED_DATE.Value),DocLoadTypeId,q_rowsVagonType_id.Value,DocMestoId,q_titleDefi_mass_id.AsInteger]);
        q_temp_ves.Open;

        if q_temp_ves.Locate('TAG','GOST',[loCaseInsensitive]) then
           q_rowsGOST_ID.AsInteger:=q_temp_ves.FieldByName('VALUE').AsInteger;
        if q_temp_ves.Locate('TAG','FACT_PL',[loCaseInsensitive])then
           q_rowsFakt_pl.Value:=q_temp_ves.FieldByName('VALUE').AsFloat;
        if q_temp_ves.Locate('TAG','CTLV',[loCaseInsensitive])then
          q_rowsCTLV.Value:=q_temp_ves.FieldByName('VALUE').AsFloat;
        if q_temp_ves.Locate('TAG','KOL_NET',[loCaseInsensitive])then
          q_rowsKol_net.Value:=q_temp_ves.FieldByName('VALUE').AsFloat;
        if q_temp_ves.Locate('TAG','VES',[loCaseInsensitive])then
          q_rowsVES.Value:=q_temp_ves.FieldByName('VALUE').AsFloat;
        if q_temp_ves.Locate('TAG','VOLUME15',[loCaseInsensitive])then
          q_rowsVOLUME15.Value:=q_temp_ves.FieldByName('VALUE').AsInteger;

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
procedure Tf_Sved.InitVagonParams;
begin
  //������� ������� temp_ves
  pkgFOR_VES.CallProcedure('empty_temp_ves',[]);

  pkgFor_ves.CallProcedure('set_param',['VZLIV',q_rowsVzliv.AsString,NULL]);
  pkgFor_ves.CallProcedure('set_param',['VOLUME',q_RowsVolume.AsString,NULL]);
  pkgFor_ves.CallProcedure('set_param',['TEMPER',q_rowsTemper.AsString,NULL]);
  pkgFor_ves.CallProcedure('set_param',['VES_CIST',q_rowsVes_cist.AsString,NULL]);
  pkgFor_ves.CallProcedure('set_param',['PL15',q_titlePL15.AsString,NULL]);
  pkgFor_ves.CallProcedure('set_param',['PL20',q_titlePL20.AsString,NULL]);
  pkgFor_ves.CallProcedure('set_param',['VES',q_rowsVes.AsString,NULL]);
  pkgFor_ves.CallProcedure('set_param',['VES_ALL',q_rowsVes_all.AsString,NULL]);
  pkgFor_ves.CallProcedure('set_param',['KOL_NET',q_rowsKOL_NET.AsString,NULL]);
  pkgFor_ves.CallProcedure('set_param',['VES_ED',q_rowsVes_ed.AsString,NULL]);
  pkgFor_ves.CallProcedure('set_param',['KOL_ED',q_rowsKol_ed.AsString,NULL]);
  pkgFor_ves.CallProcedure('set_param',['UPAK_VES',q_rowsUpak_ves.AsString,NULL]);
  pkgFor_ves.CallProcedure('set_param',['UPAK_VES_ED',q_rowsUpak_ves_ed.AsString,NULL]);
  pkgFor_ves.CallProcedure('set_param',['PODDONS',q_rowsPoddons.AsString,NULL]);
  pkgFor_ves.CallProcedure('set_param',['PODDON_VES',q_rowsPoddon_ves.AsString,NULL]);
  pkgFor_ves.CallProcedure('set_param',['SHIELDS',q_rowsShields.AsString,NULL]);
  pkgFor_ves.CallProcedure('set_param',['SHIELD_VES',q_rowsShield_ves.AsString,NULL]);

  pkgFor_ves.CallProcedure('set_param',['PROD_ID_NPR',q_titleSVED_ID_NPR.AsString,NULL]);
  pkgFor_ves.CallProcedure('set_param',['PLAT_ID',q_titlePLAT_ID.AsString,NULL]);
  pkgFor_ves.CallProcedure('set_param',['KALIBR_ID',q_rowsKalibr_ID.AsString,NULL]);
  pkgFor_ves.CallProcedure('set_param_valsved',[q_titleID.AsString]);
end;


{ TODO -oPSV -cRows_Actions : ����� ������������ }
procedure Tf_Sved.acRowsSpravExecute(Sender: TObject);
begin
  inherited;
  // ��������
  if q_Rows.ReadOnly then exit;
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;

  // ��������� ���������
  GridTitleExit(Sender);
  if (q_rows.State = dsBrowse) and (acMOSvedRowsEdit.Enabled) and not q_rows.IsEmpty then q_rows.Edit;

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

  if GridRows.Columns[GridRows.Col-1].FieldName='VETKA_OTP_NAME' then
  Begin
    // �������� ������ ����� ��������
    KlsMisc2.SetKLSParam('KLS_VETKA_OTP_SVED','CHOOSE',fsNormal,q_rows.FieldByName('VETKA_OTP_ID').AsString,'',true);
    with TF_KlsMisc.Create(Self) do
    begin
      if ShowModal=mrOk then
      if (q_rows.State <> dsBrowse) then
      begin
        q_rows.FieldByName('VETKA_OTP_ID').AsString:=KlsMisc2.vIdToSeek;
      end;
      Free;
    end;
  end;

end;

{ TODO -oPSV -cRows_Actions : ����� }
procedure Tf_Sved.acFindSvedExecute(Sender: TObject);
begin
  inherited;
  if not q_rows.Active then exit;
  if not q_title.Active then exit;

  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);
  ExecuteSearch;
end;

procedure Tf_Sved.ExecuteSearch();
begin
  // �����
  with tf_FindVagon.create(self) do
  Begin
    DocTitleID:='';
    q_Source.Session:=ora_Session;
    q_Structure.Session:=ora_Session;
    q_Structure.SetVariable(':STRUCTURE','FIND_VAGON_SVED');
    ShowModal;
    if ModalResult=mrOk then
    Begin
      // �������������� �� ��������� ��������
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

{ TODO -oPSV -cRows_Actions : ������������� ������� }
procedure Tf_Sved.acMOSvedAddressExecute(Sender: TObject);
var CurrId:double;
    IsVybor:boolean;
    i:integer;
begin
  inherited;
  if q_Rows.ReadOnly then exit;
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  if q_rows.IsEmpty then exit;

  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  GridRows.SetFocus;
  CurrId:=q_rowsID.AsFloat;

  // ������� ����� ��� �������������� � �����
  with tf_SvedAddress.create(self) do
  Begin
    ShowModal;
    if ModalResult=mrOk then
    Begin
      // ���������� ������ ������ �������
      IsVybor:=false;

      for i:=1 to q_Rows.RecordCount do
      begin
        if (Vybor[i]=1) then IsVybor:=true;
      end;

      if IsVybor then
      Begin
        // ������� ������� ���������� "������"
        try
          q_Rows.DisableControls;
          q_Rows.First;
          while not q_Rows.Eof do
          begin
            if Vybor[q_Rows.RecNo]=1 then
            Begin
              try
                pkgFOR_SVED.CallProcedure('SetNarLineId',[1,q_titleID.Value,q_rowsID.Value,NarLineId]);
              except
                on E:Exception do
                Begin
                  f_main.ApplSession.WriteToLog(amFull,'SVED',sesError,E.Message,0,'');
                end;
              end;
              q_rowsVybor.Value:=0;
              Vybor[q_Rows.RecNo]:=0;
            end;
            q_Rows.Next;
          end;
        finally
          q_Rows.EnableControls;
        end;
      end
      else
      Begin
        try
          pkgFOR_SVED.CallProcedure('SetNarLineId',[1,q_titleID.Value,q_rowsID.Value,NarLineId]);
        except
          on E:Exception do
            Begin
              f_main.ApplSession.WriteToLog(amFull,'SVED',sesError,E.Message,0,'');
            end;
        end;
      End;

      // ������� ���������
      IsRefresh:=true;
      f_db.ReQuery(q_Title,true);
      IsRefresh:=false;
      // ��������������� �� �������
      f_db.ReQuery(q_Rows,false);
      q_Rows.Locate('ID',CurrId,[]);
    end;
    free;
  end;
end;

{ TODO -oPSV -cRows_Actions : ���������� ������� �� ��������� ������ }
procedure Tf_Sved.acMOSvedAddVagonsExecute(Sender: TObject);
begin
  inherited;
  // ��������
  if q_Rows.ReadOnly then exit;
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  GridRows.SetFocus;

  // ������� ����� ��� �������������� � �����
  with tf_AddVagonVedPod.create(self) do
  Begin
    ShowModal;
    if ModalResult=mrOk then
    Begin
      // ������� ���������
      IsRefresh:=true;
      f_db.ReQuery(q_Title,true);
      IsRefresh:=false;
      // ������� �������
      f_db.ReQuery(q_Rows,false);
    end;
    free;
  end;
end;



{ TODO -oPSV -cRows_Query : ************************* ������� ���������� - ������ q_rows ************************* }

{ TODO -oPSV -cRows_Query : ��������� ������ � q_rows }
procedure Tf_Sved.q_rowsFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept:=f_db.AcceptFilterRecord(gridRows,filter2rows);
end;

{ TODO -oPSV -cRows_Query : �������� ����� �������� �� q_rows }
procedure Tf_Sved.q_rowsAfterDelete(DataSet: TDataSet);
begin
  inherited;
  // �������� ���������
  IsRefresh:=true;
  f_db.ReQuery(q_title,true);
  IsRefresh:=false;
end;

{ TODO -oPSV -cRows_Query : �������� ����� �������� ��������� (Post) q_rows }
procedure Tf_Sved.q_rowsAfterPost(DataSet: TDataSet);
begin
  inherited;
  // �������� ���������
  IsRefresh:=true;
  f_db.ReQuery(q_title,true);
  IsRefresh:=false;
end;

{ TODO -oPSV -cRows_Query : �������� ����� ���������� ������ � q_rows }
procedure Tf_Sved.q_rowsAfterInsert(DataSet: TDataSet);
begin
  inherited;
  // �������� �� ���������
  q_rows.FieldByName('SVED_ID').AsString:=q_title.FieldByName('ID').AsString;
  q_rows.FieldByName('SVED_POS').AsFloat:=pkgFOR_SVED.CallFloatFunction('GetMaxNumPos',[q_title.FieldByName('ID').AsString]);
{  q_rows.FieldByName('VAG_STATUS_ID').AsInteger:=0;
  q_rows.FieldByName('VETKA_POD_ID').AsInteger:=100;
  q_rows.FieldByName('VETKA_NAPR_ID').AsInteger:=100;}

{  q_rows.FieldByName('NCISTDOP').AsVariant:=vPrevNcistdop;
  q_rows.FieldByName('RAZMET_FACT').AsVariant:=vPrevRazmet;
  q_rows.FieldByName('PROD_ID_NPR').AsVariant:=vPrevProd;}
end;

{ TODO -oPSV -cRows_Query : �������� ����� ������ ������� ������ � q_rows }
procedure Tf_Sved.q_rowsBeforeScroll(DataSet: TDataSet);
var i:integer;
begin
  inherited;
  // �������� ���������� ������
{  vPrevRazmet:=q_rows.FieldByName('RAZMET_FACT').AsVariant;
  vPrevNcistdop:=q_rows.FieldByName('NCISTDOP').AsVariant;
  vPrevVagowner:=q_rows.FieldByName('VAGOWNER_ID').AsVariant;
  vPrevProd:=q_rows.FieldByName('PROD_ID_NPR').AsVariant;
  vPrevVPod:=q_rows.FieldByName('VETKA_POD_ID').AsVariant;
  vPrevVNapr:=q_rows.FieldByName('VETKA_NAPR_ID').AsVariant;
  vPrevStatus:=q_rows.FieldByName('VAG_STATUS_ID').AsVariant;}
end;

{ TODO -oPSV -cRows_Query : �������� ����� ����� ������� ������ � q_rows }
procedure Tf_Sved.q_rowsAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if (vNextState=dsEdit) and (q_rows.State=dsBrowse) then
  Begin
    // �������� � ������ �������������� ��������� ���� ��������� �� ������ ����
    vNextState:=dsBrowse;
    q_rows.Edit;


{    if GridRows.Columns[GridRows.Col-1].FieldName='RAZMET_FACT' then
      if q_rows.FieldByName('RAZMET_FACT').IsNull then
        q_rows.FieldByName('RAZMET_FACT').AsVariant:=vPrevRazmet;
    if GridRows.Columns[GridRows.Col-1].FieldName='NCISTDOP' then
      if q_rows.FieldByName('NCISTDOP').IsNull then
        q_rows.FieldByName('RAZMET_FACT').AsVariant:=vPrevRazmet;
    if GridRows.Columns[GridRows.Col-1].FieldName='VAGOWNER_NAME' then
      if q_rows.FieldByName('VAGOWNER_ID').IsNull then
        q_rows.FieldByName('VAGOWNER_ID').AsVariant:=vPrevVagowner;
    if GridRows.Columns[GridRows.Col-1].FieldName='PROD_NAME' then
      if q_rows.FieldByName('PROD_ID_NPR').IsNull then
        q_rows.FieldByName('PROD_ID_NPR').AsVariant:=vPrevProd;
    if GridRows.Columns[GridRows.Col-1].FieldName='VETKA_POD_ID' then
      if q_rows.FieldByName('VETKA_POD_ID').IsNull then
        q_rows.FieldByName('VETKA_POD_ID').AsVariant:=vPrevVPod;
    if GridRows.Columns[GridRows.Col-1].FieldName='VETKA_NAPR_ID' then
      if q_rows.FieldByName('VETKA_NAPR_ID').IsNull then
        q_rows.FieldByName('VETKA_NAPR_ID').AsVariant:=vPrevVNapr;
    if GridRows.Columns[GridRows.Col-1].FieldName='VAG_STATUS_ID' then
      if q_rows.FieldByName('VAG_STATUS_ID').IsNull then
        q_rows.FieldByName('VAG_STATUS_ID').AsVariant:=vPrevStatus;}
  End;

end;

{ TODO -oPSV -cRows_Query : ��������� ����������� }
procedure Tf_Sved.q_rowsTEMPERValidate(Sender: TField);
begin
  inherited;
  // �������� ��� ��� ����� �����������
  if q_titleDefi_mass_id.Value=1 then
  Begin
    q_rowsVes.Value:=0;
  end;
end;

{ TODO -oPSV -cRows_Query : ��������� ���� ������ }
procedure Tf_Sved.q_rowsKALIBR_IDValidate(Sender: TField);
begin
  inherited;
  q_rowsCAPACITY.Value:=pkgFor_cist.CallStringFunction('GET_CAPACITY',[q_rowsNum_cist.Value,q_rowsKalibr_Id.Text,DocLoadTypeId,q_rows.FieldByName('VAGONTYPE_ID').AsInteger]);
  q_rowsAXES.Value:=pkgFor_cist.CallIntegerFunction('GET_AXES',[q_rowsNum_cist.Value,q_rowsKalibr_Id.Text,q_rowsVes.Value,DocLoadTypeId,q_rows.FieldByName('VAGONTYPE_ID').AsInteger]);
end;

{ TODO -oPSV -cRows_Query : ��������� ������ }
procedure Tf_Sved.q_rowsVZLIVValidate(Sender: TField);
begin
  inherited;
  // �������� ��� ��� ����� ������
  if q_titleDefi_mass_id.Value=1 then
  Begin
    q_rowsVes.Value:=0;
  end;
end;



{ TODO -oPSV -cRows_Grid : ************************* ������� ���������� - GridRows ************************* }

{ TODO -oPSV -cRows_Grid :
������� ��� ������ �� GridRows
     ��������� ��������� � ������� (q_rows.Post) }
procedure Tf_Sved.GridRowsExit(Sender: TObject);
begin
  inherited;
  if q_rows.Active and (q_rows.State<>dsBrowse) then q_rows.Post;
end;

{ TODO -oPSV -cRows_Grid : ���������� ������� � GridRows }
procedure Tf_Sved.GridRowsSortMarkingChanged(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.SortInGrid(q_rows,q_rows.SQL.Count-1,GridRows);
  IsRefresh:=false;
end;

{ TODO -oPSV -cRows_Grid : �������� �� ������� ������� (GridRows) }
procedure Tf_Sved.GridRowsKeyDown(Sender: TObject; var Key: Word;
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
end;

{ TODO -oPSV -cRows_Grid : ������� ����� }
procedure Tf_Sved.GridRowsGetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  inherited;
  if q_rowsBad_num.Value=1 then Background:=clRed
  else if q_rowsVAG_STATUS_ID.Value<>0 then Background:=clSilver;
end;

{ TODO -oPSV -cRows_Grid : ����� ������� }
procedure Tf_Sved.GridRowsCellClick(Column: TColumnEh);
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


{ TODO -oPSV -cRows_Popup : ************************* ������� ���������� - Popup ************************* }

{ TODO -oPSV -cRows_Popup : ��������� ������ (GridRows) }
procedure Tf_Sved.tbRowsFilterEditAcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterAcceptText(gridRows,filter2rows,NewText,Accept);
  IsRefresh:=false;
end;

{ TODO -oPSV -cRows_Popup : ������  �� ����������� (GridRows) }
procedure Tf_Sved.tbRowsFilterSelectionClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCurrentValue(gridRows,filter2rows);
  IsRefresh:=false;
end;

{ TODO -oPSV -cRows_Popup : �������� ������ (GridRows) }
procedure Tf_Sved.tbRowsFilterClearClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCLear(gridRows,filter2rows);
  IsRefresh:=false;
end;

{ TODO -oPSV -cRows_Popup : ������������� � ���� (GridRows) }
procedure Tf_Sved.tbRowsWinEditClick(Sender: TObject);
begin
  inherited;
  f_db.EditInMemo(gridRows);
end;

procedure Tf_Sved.acLastReisExecute(Sender: TObject);
begin
  inherited;
  with tf_FindVagon.create(self) do
  Begin
    DocTitleID:='';
    q_Source.Session:=ora_Session;
    q_Structure.Session:=ora_Session;
    q_Structure.SetVariable(':STRUCTURE','FIND_LAST_REIS');
    acSelPosition.Enabled:=false;
    acSelPosition.Visible:=false;
    memo1.Lines:=q_title.SQL;
    cbSearchStr.text:=q_rowsNUM_CIST.AsString;
    ShowModal;
    Free;
  end;

end;

procedure Tf_Sved.q_rowsCalcFields(DataSet: TDataSet);
begin
  inherited;
  q_rowsVybor.Value:=0;
end;

procedure Tf_Sved.TBItem39Click(Sender: TObject);
begin
  inherited;
  F_DB.GridSQL(Self,gridTitle,q_title.SQL.Text,q_title);
end;

procedure Tf_Sved.TBItem40Click(Sender: TObject);
begin
  inherited;
  F_DB.GridSQL(Self,gridRows,q_rows.SQL.Text,q_rows);
end;

end.
