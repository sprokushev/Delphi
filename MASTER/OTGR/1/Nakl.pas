unit Sved;

interface
                                                                                    
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MdiForm, Placemnt, ExtCtrls, Grids, DBGridEh, ComCtrls,
  RxLookup, Buttons, StdCtrls, TB2Dock, TB2Toolbar, TB2Item, ActnList,
  XPStyleActnCtrls, ActnMan, TB2ExtItems, Menus, Oracle, DB, OracleData, DBGrids,
  PropFilerEh, PropStorageEh, MemTableDataEh, DataDriverEh, MemTableEh;

// СВЕДЕНИЯ об отгрузке

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
    TBItem10: TTBItem;
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
    q_titleTEX_PD_ID: TIntegerField;
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
    pkgFor_environment: TOraclePackage;
    pkgFor_init: TOraclePackage;
    OraclePackage1: TOraclePackage;
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
    MemTableEh1: TMemTableEh;
    DataSetDriverEh1: TDataSetDriverEh;
    q_rowsVybor: TBooleanField;
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
    procedure GridTitleGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure GridRowsColumns33EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure GridRowsColumns33UpdateData(Sender: TObject;
      var Text: String; var Value: Variant; var UseText, Handled: Boolean);
    procedure q_rowsKALIBR_IDValidate(Sender: TField);
    procedure acMOSvedRowsCalcExecute(Sender: TObject);
    procedure q_rowsVZLIVValidate(Sender: TField);
    procedure q_rowsCAPACITYValidate(Sender: TField);
    procedure q_rowsVES_CISTValidate(Sender: TField);
    procedure q_rowsVAGONTYPE_IDValidate(Sender: TField);
    procedure q_rowsAXESValidate(Sender: TField);
    procedure q_rowsNCISTDOPValidate(Sender: TField);
    procedure acMOSvedAddVagonsExecute(Sender: TObject);
    procedure q_NarLinesBeforeOpen(DataSet: TDataSet);
    procedure q_NarLinesAfterOpen(DataSet: TDataSet);
    procedure q_rowsVyborGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure GridRowsCellClick(Column: TColumnEh);
    procedure acMOSvedAddressExecute(Sender: TObject);
  private
    { Private declarations }
    // Фильтр
    Filter2title: TStringList; // Список для фильтра в GridTitle
    Filter2rows: TStringList; // Список для фильтра в GridRows
    ViewLinkMode:integer; // 1-фильтр по связям
    ViewLinkFilter:string; // Строка Фильтра по связям
    // Для обновления
    IsRefresh: boolean; // В данный момент происходит обновление запроса
    // Значения полей предыдущей записи
    vNextState:TDataSetState;
    //Наличие изменений в гриде
    IsNeedCalc: boolean;
    //ОТЛАДОЧНАЯ ПЕРЕМЕННАЯ
    dbg:integer;
{    vPrevRazmet:variant;
    vPrevNcistdop:variant;
    vPrevVagowner:variant;
    vPrevProd:variant;
    vPrevVPod:variant;
    vPrevVNapr:variant;
    vPrevStatus:variant;}
    Save_cursor: TCursor;
  public
    { Public declarations }
    QueryBegin,QueryEnd:TDateTime;
    DocMestoId:integer; // Место отгрузки
    DocLoadTypeId:integer; // Тип транспортировки
    DocType:integer; // Тип документа
    DocMode:integer; // 1-Первоначальный ввод, 2-Раскредитовывание
    NarLineId:integer;
  end;

var
  f_Sved: Tf_Sved;
  gLinkMode:integer; // Режим просмтора: 1-фильтр по связям 0-стандартный просмотр
  gLinkFilter:string; // Строка для фильтра по связям
  gMesto:integer; // Место отгрузки
  gLoadType:integer; // Тип транспортировки
  gMode:integer; // 1-Первоначальный ввод, 2-Раскредитовывание

implementation

uses main, ForDB, SvedNew, ForSESS, KlsMisc2, SvedAddVagon, ved_pod,SvedAddress;

{$R *.dfm}

{ DONE -oPSV -cФорма : ************************* Методы формы ************************* }

{ DONE -oPSV -cФорма : Создание формы }
procedure Tf_Sved.FormCreate(Sender: TObject);
//var i:integer;
begin
  inherited;
  //Наличие изменение в гриде
  IsNeedCalc:=false;
  // Popup-Фильтр
  Filter2title:=TStringList.Create;
  Filter2title.Clear;
  Filter2rows:=TStringList.Create;
  Filter2rows.Clear;
  // Фильтр на форме (первоначальные значения)
  Date1.Date:=Date-1;
  Date2.Date:=Date+1;
  // Фильтр по связям
  ViewLinkMode:=gLinkMode;
  ViewLinkFilter:=gLinkFilter;
  gLinkMode:=0;
  gLinkFilter:='';
  // Место отгрузки
    DocMestoId:=gMesto;
  gMesto:=-1;
  // Тип документа - Сведения об отгрузке
  DocType:=3;
  DocLoadTypeId:=gLoadType;
  gLoadType:=-1;
  DocMode:=gMode;
  // Сессия
  f_db.LogonMasterSession(ora_Session);
  f_db.SetUserGrants(ActionManager1);

  // Проверяем права
  if f_db.CheckGrant('acMOSvedEdit') then
  Begin
    gridTitle.ReadOnly:=false;
  End
  else
  Begin
    gridTitle.ReadOnly:=true;
  end;

  if f_db.CheckGrant('acMOSvedRowsEdit') then
  Begin
    gridRows.ReadOnly:=false;
  End
  else
  Begin
    gridRows.ReadOnly:=true;
  end;

  // Открытие запросов
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
  q_titleAfterScroll(q_title);

  // режим работы
{  if DocMode=2 then
  Begin
    // Режим "Раскредитовывание"
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

{ DONE -oPSV -cФорма : Закрытие формы }
procedure Tf_Sved.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  // Освобождаем память
  try
    filter2title.Clear;
  except
  end;
  try
    filter2rows.Clear;
  except
  end;
  // Закрываем сессию
  GridRowsExit(Sender);
  GridTitleExit(Sender);
  ora_Session.Commit;
  ora_Session.Connected:=false;
  // Закрываем окно
  Action:=caFree;
end;





{ DONE -oPSV -cTitle_Actions: ************************* Заголовки документов - События ************************* }

{ DONE -oPSV -cTitle_Actions : Обновить q_title}
procedure Tf_Sved.bRefreshClick(Sender: TObject);
begin
  inherited;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);
  // Обновляем запрос
  IsRefresh:=true;
  f_db.ReQuery(q_title,true);
  IsRefresh:=false;
  // Приводим в соответствие подчиненную таблицу
  q_titleAfterScroll(q_title);
end;

{ TODO -cTitle_Actions -oPSV : Сохранение в Excel }
procedure Tf_Sved.acToXLSExecute(Sender: TObject);
begin
  inherited;
  {}
end;

{ TODO -oPSV -cTitle_Actions : Печать документа }
procedure Tf_Sved.acPrintExecute(Sender: TObject);
begin
  inherited;
  {}
end;

{ TODO -oPSV -cTitle_Actions : Применить Отбор }
procedure Tf_Sved.acFilterExecute(Sender: TObject);
begin
  inherited;
  {}
end;

{ TODO -oPSV -cTitle_Actions : Отменить Отбор }
procedure Tf_Sved.acNoFilterExecute(Sender: TObject);
begin
  inherited;
  {}
end;

{ DONE -cTitle_Actions -oPSV : Добавить документ }
procedure Tf_Sved.acMOSvedAddExecute(Sender: TObject);
begin
  inherited;
  // Проверка
  if not q_title.Active then exit;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // Добавление ведомости
  with tf_SvedNew.create(self) do
  Begin
    EditId:='';
    IsAdd:=true;
    ShowModal;
    if ModalResult=mrOk then
    Begin
      // Поиционируемся на добавленный документ
      f_db.ReQuery(q_Title,false);
      q_Title.Locate('ID',EditId,[]);
    end;
    Free;
  end;
end;

{ DONE -cTitle_Actions -oPSV : Редактируем документ }
procedure Tf_Sved.acMOSvedEditExecute(Sender: TObject);
begin
  inherited;
  // Проверка
  if not q_title.Active then exit;
  if q_title.Eof then exit;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // Редактирование ведомости
  with tf_SvedNew.create(self) do
  Begin
    EditId:=q_title.FieldByName('ID').AsString;
    IsAdd:=false;
    ShowModal;
    if ModalResult=mrOk then
    Begin
      f_db.ReQuery(q_Title,true);
    end;
    Free;
  end;
end;

{ DONE -oPSV -cTitle_Actions : Копировать документ }
procedure Tf_Sved.acMOSvedCopyExecute(Sender: TObject);
begin
  inherited;
  // Проверка
  if not q_title.Active then exit;
  if q_title.Eof then exit;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // Копирование документа
  with tf_SvedNew.create(self) do
  Begin
    EditId:=q_title.FieldByName('ID').AsString;
    IsAdd:=true;
    ShowModal;
    if ModalResult=mrOk then
    Begin
      // Поиционируемся на добавленный документ
      f_db.ReQuery(q_Title,false);
      q_Title.Locate('ID',EditId,[]);
    end;
    Free;
  end;
end;

{ DONE -oPSV -cTitle_Actions : Удалить документ }
procedure Tf_Sved.acMOSvedDelExecute(Sender: TObject);
var NextId:string;
begin
  inherited;
  // Проверка
  if not q_title.Active then exit;
  if q_title.Eof then exit;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // Удаление документа
  if Application.MessageBox('Удалить запись?','Внимание!',MB_YESNO)=IDYES then
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
    // Позиционируемся на следующий документ
    NextID:=q_Title.FieldByName('ID').AsString;
    f_db.ReQuery(q_Title,false);
    q_Title.Locate('ID',NextId,[]);
    q_Title.EnableControls;
  End;
end;

{ DONE -oPSV -cTitle_Query : ************************* Заголовки документов - Запрос q_title ************************* }

{ DONE -oPSV -cTitle_Query : Действия до открытия q_title }
procedure Tf_Sved.q_titleBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  // Учитываем фильтр на форме
  q_title.SQL[27]:=' AND s.sved_date>=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date1.Date)+''',''dd.mm.yyyy'')';
  q_title.SQL[28]:=' AND s.sved_date<=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date2.Date)+''',''dd.mm.yyyy'')';
  if VarType(lc_Prod.KeyValue)<>varNull then
  Begin
    IF lc_Prod.KeyValue='-1' THEN
      q_title.SQL[29]:=' AND s.PROD_ID_NPR IS NULL'
    else
      q_title.SQL[29]:=' AND s.PROD_ID_NPR='''+VarToStr(lc_Prod.KeyValue)+'''';
  end
  else
  Begin
    q_title.SQL[29]:=' AND 1=1';
  End;
end;

{ DONE -oPSV -cTitle_Query : Действия после открытия q_title }
procedure Tf_Sved.q_titleAfterOpen(DataSet: TDataSet);
var i:integer;
begin
  inherited;
  // Подготовка Popup-фильтра
  if filter2title.Count=0 then
    for i:=1 to q_title.FieldCount+1 do
    Begin
      Filter2title.Add('');
    end;
end;

{ DONE -oPSV -cTitle_Query : После смены текущей записи q_title }
procedure Tf_Sved.q_titleAfterScroll(DataSet: TDataSet);
var i:integer;
begin
  inherited;
  if IsRefresh then exit;
  // обновляем позиции
  f_db.ReQuery(q_rows,false);
  // Подготовка Popup-фильтра
  if filter2rows.Count=0 then
    for i:=1 to q_rows.FieldCount+1 do
    Begin
      Filter2rows.Add('');
    end;

  if q_title.Eof then exit;
  tabRowsDetail.Caption:=' Позиции сведения № '+q_title.FieldByName('SVED_NUM').AsString+' ';
  tabRowsItogs.Caption:=' Итоги сведения № '+q_title.FieldByName('SVED_NUM').AsString+' ';

  if NOT Active then exit;
  // Действия только в активной форме

end;

{ DONE -oPSV -cTitle_Query : Применить фильтр к запросу }
procedure Tf_Sved.q_titleFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept:=f_db.AcceptFilterRecord(gridTitle,filter2title);
end;


{ DONE -oPSV -cTitle_Grid : ************************* Заголовки документов - GridTitle ************************* }

{ DONE -oPSV -cTitle_Grid : Значения столбца "№ п/п" (GridTitle)}
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

{ DONE -oPSV -cTitle_Grid : Событие при выходе из GridTitle
     Фиксируем изменения в таблице (q_title.Post)
}
procedure Tf_Sved.GridTitleExit(Sender: TObject);
begin
  inherited;
  if q_title.Active and (q_title.State<>dsBrowse) then q_title.Post;
end;

{ DONE -oPSV -cTitle_Grid : Сортировка в GridTitle }
procedure Tf_Sved.GridTitleSortMarkingChanged(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.SortInGrid(q_title,q_title.SQL.Count-1,GridTitle);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

{ TODO -oPSV -cTitle_Grid : Выделение активной строки }
procedure Tf_Sved.GridTitleGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if (q_title.FieldByName('ID').AsString=q_rows.FieldByName('SVED_ID').AsString) then
  Begin
    AFont.Style:=[fsBold];
  End;
end;

procedure Tf_Sved.GridRowsColumns33EditButtonClick(Sender: TObject;
  var Handled: Boolean);
var
  vOldState:TDataSetState;
  vOldStan:string;
begin
  inherited;
end;

procedure Tf_Sved.GridRowsColumns33UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
begin
  inherited;
end;

{ DONE -oPSV -cTitle_Popup : ************************* Заголовки документов - Popup ************************* }

{ DONE -oPSV -cTitle_Popup : Строка ввода для фильтра }
procedure Tf_Sved.tbTitleFilterEditAcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterAcceptText(gridTitle,filter2title,NewText,Accept);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

{ DONE -oPSV -cTitle_Popup : Фильтр по выделенному  }
procedure Tf_Sved.tbTitleFilterSelectionClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCurrentValue(gridTitle,filter2title);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

{ DONE -oPSV -cTitle_Popup : Очистить фильтр  }
procedure Tf_Sved.tbTitleFilterClearClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCLear(gridtitle,filter2title);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

{ DONE -oPSV -cTitle_Popup : Редактировать в окне }
procedure Tf_Sved.tbTitleWinEditClick(Sender: TObject);
begin
  inherited;
  f_db.EditInMemo(gridTitle);
end;


{ DONE -oPSV -cRows_Actions : ************************* Позиции документов - События ************************* }

{ DONE -oPSV -cRows_Actions : Обновить q_rows }
procedure Tf_Sved.bRefreshRowsClick(Sender: TObject);
begin
  inherited;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);
  // Обновляем запрос
  f_db.ReQuery(q_rows,true);
end;

{ DONE -oPSV -cRows_Actions : Добавление позиции }
procedure Tf_Sved.acMOSvedRowsAddExecute(Sender: TObject);
begin
  inherited;
  // Проверка
  if not q_rows.Active then exit;
  if not q_title.Active then exit;

  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // Добавление ведомости
  with tf_AddVagon.create(self) do
  Begin
    EditId:='';
    IsAdd:=true;
    ShowModal;
    if ModalResult=mrOk then
    Begin
// Поиционируемся на добавленный документ
      f_db.ReQuery(q_Rows,false);
      q_Rows.Locate('ID',EditId,[]);
    end;
    Free;
  end;

  // Добавление позиции
//  q_rows.Append;
end;

{ DONE -oPSV -cRows_Actions : Редактирование  позиции }
procedure Tf_Sved.acMOSvedRowsEditExecute(Sender: TObject);
begin
  inherited;
  // Проверка
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  if q_title.Eof then exit;
  if q_rows.Eof then exit;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);
  // Откроем вагон для редактирования в форме
  with tf_AddVagon.create(self) do
  Begin
    EditId:=q_rows.FieldByName('ID').AsString;
    IsAdd:=false;
    isLoading:=True;
    ShowModal;
    if ModalResult=mrOk then
    Begin
      f_db.ReQuery(q_Rows,false);
      q_Title.Locate('ID',EditId,[]);
    end;
    free;
  end;
//Обновление характеристик вагона

// Редактирование позиции
end;

{ DONE -oPSV -cRows_Actions : Копирование  позиции }
procedure Tf_Sved.acMOSvedRowsCopyExecute(Sender: TObject);
begin
  inherited;
  // Проверка
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  if q_title.Eof then exit;
  if q_rows.Eof then exit;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // Копирование позиции
  q_rows.Append;
  // Заполняем предыдущими значениями

{  q_rows.FieldByName('NCISTDOP').AsVariant:=vPrevNcistdop;
  q_rows.FieldByName('RAZMET_FACT').AsVariant:=vPrevRazmet;
  q_rows.FieldByName('PROD_ID_NPR').AsVariant:=vPrevProd;
  q_rows.FieldByName('VETKA_POD_ID').AsVariant:=vPrevVPod;
  q_rows.FieldByName('VETKA_NAPR_ID').AsVariant:=vPrevVNapr;
  q_rows.FieldByName('VAG_STATUS_ID').AsVariant:=vPrevStatus;}

end;

{ DONE -oPSV -cRows_Actions : Удаление  позиции }
procedure Tf_Sved.acMOSvedRowsDelExecute(Sender: TObject);
var NextId:double;
begin
  inherited;
  // Проверка
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  if q_title.Eof then exit;
  if q_rows.Eof then exit;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // Удаление позиции
  if Application.MessageBox('Удалить запись?','Внимание!',MB_YESNO)=IDYES then
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
    // Позиционируемся на следующую запись
    NextID:=q_Rows.FieldByName('ID').AsFloat;
    f_db.ReQuery(q_Rows,false);
    q_Rows.Locate('ID',NextId,[]);
    q_Rows.EnableControls;
    q_rowsAfterDelete(q_rows);
  End;
end;

{ DONE -oPSV -cRows_Actions : Сохранить изменения в позиции и документе }
procedure Tf_Sved.acRowsPostExecute(Sender: TObject);
begin
  inherited;
  // Сохранить изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);
end;

{ DONE -oPSV -cRows_Actions : Отменить изменения в позиции и документе }
procedure Tf_Sved.acRowsCancelExecute(Sender: TObject);
begin
  inherited;
  if q_title.Active and (q_title.State<>dsBrowse) then q_title.Cancel;
  if q_rows.Active and (q_rows.State<>dsBrowse) then q_rows.Cancel;
end;

{ DONE -oPSV -cRows_Query : ************************* Позиции документов - Запрос q_rows ************************* }

{ DONE -oPSV -cRows_Query : Применить фильтр к q_rows }
procedure Tf_Sved.q_rowsFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept:=f_db.AcceptFilterRecord(gridRows,filter2rows);
end;

{ DONE -oPSV -cRows_Query : Действия после удаления из q_rows }
procedure Tf_Sved.q_rowsAfterDelete(DataSet: TDataSet);
begin
  inherited;
  // Обновить заголовок
  IsRefresh:=true;
  f_db.ReQuery(q_title,true);
  IsRefresh:=false;
end;

{ DONE -oPSV -cRows_Query : Действия после фиксации изменений (Post) q_rows }
procedure Tf_Sved.q_rowsAfterPost(DataSet: TDataSet);
begin
  inherited;
  // Обновить заголовок
//  q_rows.RefreshRecord;
  IsRefresh:=true;
  f_db.ReQuery(q_title,true);
  IsRefresh:=false;
end;

{ DONE -oPSV -cRows_Query : Действия после добавления записи в q_rows }
procedure Tf_Sved.q_rowsAfterInsert(DataSet: TDataSet);
begin
  inherited;
  // Значения по умолчанию
  q_rows.FieldByName('SVED_ID').AsString:=q_title.FieldByName('ID').AsString;
  q_rows.FieldByName('SVED_POS').AsFloat:=pkgFOR_SVED.CallFloatFunction('GetMaxNumPos',[q_title.FieldByName('ID').AsString]);
{  q_rows.FieldByName('VAG_STATUS_ID').AsInteger:=0;
  q_rows.FieldByName('VETKA_POD_ID').AsInteger:=100;
  q_rows.FieldByName('VETKA_NAPR_ID').AsInteger:=100;}

{  q_rows.FieldByName('NCISTDOP').AsVariant:=vPrevNcistdop;
  q_rows.FieldByName('RAZMET_FACT').AsVariant:=vPrevRazmet;
  q_rows.FieldByName('PROD_ID_NPR').AsVariant:=vPrevProd;}
end;

{ DONE -oPSV -cRows_Query : Действия перед сменой текущей записи в q_rows }
procedure Tf_Sved.q_rowsBeforeScroll(DataSet: TDataSet);
begin
  inherited;
  // Значение предыдущей записи
{  vPrevRazmet:=q_rows.FieldByName('RAZMET_FACT').AsVariant;
  vPrevNcistdop:=q_rows.FieldByName('NCISTDOP').AsVariant;
  vPrevVagowner:=q_rows.FieldByName('VAGOWNER_ID').AsVariant;
  vPrevProd:=q_rows.FieldByName('PROD_ID_NPR').AsVariant;
  vPrevVPod:=q_rows.FieldByName('VETKA_POD_ID').AsVariant;
  vPrevVNapr:=q_rows.FieldByName('VETKA_NAPR_ID').AsVariant;
  vPrevStatus:=q_rows.FieldByName('VAG_STATUS_ID').AsVariant;}
end;

{ DONE -oPSV -cRows_Query : Действия после смены текущей записи в q_rows }
procedure Tf_Sved.q_rowsAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if (vNextState=dsEdit) and (q_rows.State=dsBrowse) then
  Begin
    // Находясь в режиме редактирования заполнить поле значением из строки выше
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


{ DONE -oPSV -cRows_Grid : ************************* Позиции документов - GridRows ************************* }

{ DONE -oPSV -cRows_Grid :
Событие при выходе из GridRows
     Фиксируем изменения в таблице (q_rows.Post) }
procedure Tf_Sved.GridRowsExit(Sender: TObject);
begin
  inherited;
  if q_rows.Active and (q_rows.State<>dsBrowse) then q_rows.Post;
end;

{ DONE -oPSV -cRows_Grid : Сортировка записей в GridRows }
procedure Tf_Sved.GridRowsSortMarkingChanged(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.SortInGrid(q_rows,q_rows.SQL.Count-1,GridRows);
  IsRefresh:=false;
end;

{ DONE -oPSV -cRows_Grid : Действия по нажатию клавиши (GridRows) }
procedure Tf_Sved.GridRowsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  // Проверка
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  if q_title.Eof then exit;
  if q_rows.Eof then exit;

  if (Key=VK_DOWN) and (q_rows.State<>dsBrowse) then
  begin
    // Нажата кнопка "Вниз" а запись в этот момент находится в режиме редактирования,
    // значит нужно после перехода на следующую запись, также перейти в режим редактирования
    // и заполнить поля значениями из текущей записи (если они пустые)
    vNextState:=dsEdit;
  end
  else
  begin
    vNextState:=dsBrowse;
  end;

end;


{ DONE -oPSV -cRows_Popup : ************************* Позиции документов - Popup ************************* }

{ DONE -oPSV -cRows_Popup : Применить фильтр (GridRows) }
procedure Tf_Sved.tbRowsFilterEditAcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterAcceptText(gridRows,filter2rows,NewText,Accept);
  IsRefresh:=false;
end;

{ DONE -oPSV -cRows_Popup : Фильтр  по выделенному (GridRows) }
procedure Tf_Sved.tbRowsFilterSelectionClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCurrentValue(gridRows,filter2rows);
  IsRefresh:=false;
end;

{ DONE -oPSV -cRows_Popup : Очистить фильтр (GridRows) }
procedure Tf_Sved.tbRowsFilterClearClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCLear(gridRows,filter2rows);
  IsRefresh:=false;
end;

{ DONE -oPSV -cRows_Popup : Редактировать в окне (GridRows) }
procedure Tf_Sved.tbRowsWinEditClick(Sender: TObject);
begin
  inherited;
  f_db.EditInMemo(gridRows);
end;




procedure Tf_Sved.acMOSvedRowsCalcExecute(Sender: TObject);
begin
  inherited;
  {CALC_VES(
0.	pDEFI_MASS_ID NUMBER,
1.	pDATE_OTGR DATE,
2.	pGOST VARCHAR2 DEFAULT '3900-85',
3.	pLOAD_TYPE_ID NUMBER,
4.	pVAGONTYPE_ID NUMBER,
5.	pPROD_ID_NPR VARCHAR2,
6.	pVES_CIST IN OUT NUMBER,
7.	pVOLUME NUMBER,
8.	pVOLUME15 IN OUT NUMBER,
9.	pTEMPER NUMBER,
10.	pPL20 NUMBER,
11.	pPL15 NUMBER,
12.	pP_VOD NUMBER,
13.	pP_DIRT NUMBER,
14.	pP_SOL NUMBER,
15.	pKOL_ED IN OUT NUMBER,
16.	pVES_ED IN OUT NUMBER,
17.	pSHIELDS NUMBER,
18.	pSHIELD_VES NUMBER,
19.	pPODDONS NUMBER,
20.	pPODDON_VES NUMBER,
21.	pFAKT_PL IN OUT NUMBER,
22.	pVES IN OUT NUMBER,
23.	pKOL_NET IN OUT NUMBER,
24.	pUPAK_VES IN OUT NUMBER,
25.	pUPAK_VES_ED IN OUT NUMBER,
26.	pVES_ALL IN OUT NUMBER)
///////////////////////////////////////////////////////////////////////////////
  pkgFor_ves.CallProcedure('calc_ves',[q_titleDEFI_MASS_ID.Value,q_titleEND_NALIV_TIME.value,'3900-85',DocLoadTypeId,q_rowsVAGONTYPE_ID.value,
                            q_titleSVED_ID_NPR.value,q_rowsVES_CIST.value, q_rowsVolume.value,0,q_rowsTemper.value,
                            q_titlePL20.value,q_titleP_VOD.Value,q_titleP_DIRT.Value,q_titleP_SOL.Value,
                            q_rowsKOL_ED.Value,q_rowsVES_ED.Value,q_rowsSHIELDS.Value,q_rowsSHIELD_VES.Value,
                            q_rowsPODDONS.Value,q_rowsPODDON_VES.Value,q_rowsFAKT_PL.Value,q_rowsVES.Value,
                            q_rowsKOL_NET.Value,q_rowsUPAK_VES.Value,q_rowsUPAK_VES_ED.Value,q_rowsVES_ALL.Value]);
  q_rowsVES_CIST.value:=pkgFor_ves.GetParameter(6);
  q_rowsVOLUME15 .value:=pkgFor_ves.GetParameter(8);
  q_rowsKOL_ED.value:=pkgFor_ves.GetParameter(15);
  q_rowsVES_ED .value:=pkgFor_ves.GetParameter(16);
  q_rowsFAKT_PL.value:=pkgFor_ves.GetParameter(21);
  q_rowsVES.value:=pkgFor_ves.GetParameter(22);
  q_rowsKOL_NET.value:=pkgFor_ves.GetParameter(23);
  q_rowsUPAK_VES.value:=pkgFor_ves.GetParameter(24);
  q_rowsUPAK_VES_ED.value:=pkgFor_ves.GetParameter(25);
  q_rowsVES_ALL.value:=pkgFor_ves.GetParameter(26);
}
////////////////////////////ДЛЯ ОТЛАДКИ/////////////////////////////////////////
  inc(dbg);
  q_rowsVES_CIST.value:=dbg+10;
  q_rowsVOLUME15 .value:=dbg+20;
  q_rowsKOL_ED.value:=dbg+30;
  q_rowsVES_ED .value:=dbg+40;
  q_rowsFAKT_PL.value:=dbg+50;
  q_rowsVES.value:= dbg+60;
  q_rowsKOL_NET.value:= dbg+70;
  q_rowsUPAK_VES.value:= dbg+80;
  q_rowsUPAK_VES_ED.value:= dbg+90;
  q_rowsVES_ALL.value:= dbg+100;
////////////////////////КОНЕЦ ОТЛАДКИ///////////////////////////////////////////

end;
//подтверждение изменения(validate) некоторых параметров влечет пересчет характеристик
procedure Tf_Sved.q_rowsKALIBR_IDValidate(Sender: TField);
begin
  inherited;
  q_rowsCAPACITY.Value:=pkgFor_cist.CallStringFunction('GET_CAPACITY',[q_rowsNum_cist.Value,q_rowsKalibr_Id.Text,DocLoadTypeId,q_rows.FieldByName('VAGONTYPE_ID').AsInteger]);
  q_rowsAXES.Value:=pkgFor_cist.CallIntegerFunction('GET_AXES',[q_rowsNum_cist.Value,q_rowsKalibr_Id.Text,q_rowsVes.Value,DocLoadTypeId,q_rows.FieldByName('VAGONTYPE_ID').AsInteger]);
  q_rowsVolume.Value:=pkgFor_cist.CallIntegerFunction('GET_VOLUME',[q_rowsKALIBR_ID.Value,q_rowsVzliv.Value,DocLoadTypeId,q_rows.FieldByName('VAGONTYPE_ID').AsInteger]);
  pkgFor_cist.CallProcedure('SET_CIST_PROPERTY',[1,q_rowsNUM_CIST.Value,DocLoadTypeId,'KALIBR_ID',q_rowsKALIBR_ID.Value]);
end;

procedure Tf_Sved.q_rowsVZLIVValidate(Sender: TField);
begin
  inherited;
  q_rowsVolume.Value:=pkgFor_cist.CallIntegerFunction('GET_VOLUME',[q_rowsKALIBR_ID.Value,q_rowsVzliv.Value,DocLoadTypeId,q_rows.FieldByName('VAGONTYPE_ID').AsInteger]);
end;

procedure Tf_Sved.q_rowsCAPACITYValidate(Sender: TField);
begin
  inherited;
  pkgFor_cist.CallProcedure('SET_CIST_PROPERTY',[1,q_rowsNUM_CIST.Value,DocLoadTypeId,'CAPACITY',q_rowsCAPACITY.Value]);
end;

procedure Tf_Sved.q_rowsVES_CISTValidate(Sender: TField);
begin
  inherited;
  pkgFor_cist.CallProcedure('SET_CIST_PROPERTY',[1,q_rowsNUM_CIST.Value,DocLoadTypeId,'VES_CIST',q_rowsVES_CIST.Value]);
end;

procedure Tf_Sved.q_rowsVAGONTYPE_IDValidate(Sender: TField);
begin
  inherited;
  pkgFor_cist.CallProcedure('SET_CIST_PROPERTY',[1,q_rowsNUM_CIST.Value,DocLoadTypeId,'VAGONTYPE_ID',q_rowsVAGONTYPE_ID.Value]);
end;

procedure Tf_Sved.q_rowsAXESValidate(Sender: TField);
begin
  inherited;
  pkgFor_cist.CallProcedure('SET_CIST_PROPERTY',[1,q_rowsNUM_CIST.Value,DocLoadTypeId,'AXES',q_rowsAXES.Value]);
end;

procedure Tf_Sved.q_rowsNCISTDOPValidate(Sender: TField);
begin
  inherited;
  pkgFor_cist.CallProcedure('SET_CIST_PROPERTY',[1,q_rowsNUM_CIST.Value,DocLoadTypeId,'NCISTDOP',q_rowsNCISTDOP.Value]);
end;

procedure Tf_Sved.acMOSvedAddVagonsExecute(Sender: TObject);
begin
  inherited;
  // Проверка
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  if q_title.Eof then exit;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);
  // Откроем вагон для редактирования в форме
  with tf_Ved_pod.create(self) do
  Begin
    ShowModal;
    if ModalResult=mrOk then
    Begin
      f_db.ReQuery(q_Rows,false);
    end;
    free;
  end;
//Обновление характеристик вагона

// Редактирование позиции
GridRows.SetFocus;
end;

procedure Tf_Sved.q_NarLinesBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  Save_Cursor:=Screen.Cursor;
  Screen.Cursor := crSQLWait;    { Show SQL cursor }
end;

procedure Tf_Sved.q_NarLinesAfterOpen(DataSet: TDataSet);
begin
  inherited;
  Screen.Cursor := Save_cursor;
end;

procedure Tf_Sved.q_rowsVyborGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  inherited;
  if Sender.IsNull then Sender.Value:=0;
end;

procedure Tf_Sved.GridRowsCellClick(Column: TColumnEh);
begin
  inherited;
  if column.Title.Caption='Выбор' then
  if q_rowsVybor.Value=true then q_rowsVybor.Value:=false else q_rowsVybor.Value:=true;
end;

procedure Tf_Sved.acMOSvedAddressExecute(Sender: TObject);
begin
  inherited;
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  if q_title.Eof then exit;
  if q_rows.Eof then exit;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);
  // Откроем вагон для редактирования в форме
  with tf_SvedAddress.create(self) do
  Begin
    ShowModal;
    if ModalResult=mrOk then
    Begin
      q_Rows.DisableControls;
      q_Rows.First;
      while not q_Rows.Eof do
      begin
        if q_rowsVybor.Value then
        begin
          try
            pkgFOR_SVED.CallProcedure('SetNarLineId',[1,q_titleID.Value,q_rowsID.Value,NarLineId]);
          except
            on E:Exception do
            Begin
              f_main.ApplSession.WriteToLog(amFull,'SVED',sesError,E.Message,0,'');
            end;
          end;
          q_rowsVybor.Value:=false;
        end;
        q_Rows.Next
      end;
      q_Rows.First;
      q_Rows.EnableControls;
      f_db.ReQuery(q_Rows,false);
    end;
    free;
  end;

end;

end.
