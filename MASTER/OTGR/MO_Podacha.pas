unit MO_Podacha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MdiForm, Placemnt, ExtCtrls, Grids, DBGridEh, ComCtrls,
  RxLookup, Buttons, StdCtrls, TB2Dock, TB2Toolbar, TB2Item, ActnList,
  XPStyleActnCtrls, ActnMan, TB2ExtItems, Menus, Oracle, DB, OracleData, DBGrids,
  PropFilerEh, PropStorageEh,DBGridEhImpExp,RxShell,DateUtils;

// ВЕДОМОСТЬ подачи

type
  Tf_Podacha = class(Tf_MDIForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Date1: TDateTimePicker;
    Date2: TDateTimePicker;
    Splitter1: TSplitter;
    ActionManager1: TActionManager;
    acToXLS: TAction;
    PopupTitle: TTBPopupMenu;
    tbTitleFilterTitle: TTBItem;
    acMOPodachaAdd: TAction;
    acMOPodachaEdit: TAction;
    acMOPodachaDel: TAction;
    acMOPodachaCopy: TAction;
    acMOPodachaRowsAdd: TAction;
    acMOPodachaRowsEdit: TAction;
    acMOPodachaRowsCopy: TAction;
    acMOPodachaRowsDel: TAction;
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
    pkgFOR_PODACHA: TOraclePackage;
    PropStorageEh1: TPropStorageEh;
    lc_Track: TRxDBLookupCombo;
    lbProdName: TLabel;
    q_Track: TOracleDataSet;
    ds_Track: TDataSource;
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
    Time1: TDateTimePicker;
    Time2: TDateTimePicker;
    q_titleID: TFloatField;
    q_titleMESTO_ID: TFloatField;
    q_titleLOAD_TYPE_ID: TFloatField;
    q_titleVETKA_OTP_ID: TFloatField;
    q_titlePOD_NUM: TFloatField;
    q_titlePOD_DATE: TDateTimeField;
    q_titleTECH_TIME: TDateTimeField;
    q_titleGOTOV_TIME: TDateTimeField;
    q_titleBEG_NALIV_TIME: TDateTimeField;
    q_titleEND_NALIV_TIME: TDateTimeField;
    q_titleKOL: TIntegerField;
    q_titleVES_CIST: TFloatField;
    q_titleVETKA_OTP_NAME: TStringField;
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
    bRefreshRows: TTBItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    TBItem18: TTBItem;
    TBItem8: TTBItem;
    TBDock4: TTBDock;
    TBToolbar4: TTBToolbar;
    TBItem21: TTBItem;
    GridRows: TDBGridEh;
    q_TrackID: TFloatField;
    q_TrackNAME: TStringField;
    q_rowsID: TFloatField;
    q_rowsVED_POD_ID: TFloatField;
    q_rowsPOD_POS: TFloatField;
    q_rowsRAZMET_FACT: TStringField;
    q_rowsNUM_CIST: TStringField;
    q_rowsNCISTDOP: TIntegerField;
    q_rowsAXES: TIntegerField;
    q_rowsCAPACITY: TStringField;
    q_rowsVES_CIST: TFloatField;
    q_rowsVAGONTYPE_ID: TFloatField;
    q_rowsKALIBR_ID: TStringField;
    q_rowsVAGOWNER_ID: TFloatField;
    q_rowsVETKA_POD_ID: TFloatField;
    q_rowsVETKA_NAPR_ID: TFloatField;
    q_rowsVAG_STATUS_ID: TFloatField;
    q_rowsPROD_ID_NPR: TStringField;
    q_rowsVAGONTYPE_NAME: TStringField;
    q_rowsVAGOWNER_NAME: TStringField;
    q_rowsVETKA_POD_NAME: TStringField;
    q_VetkaNapr: TOracleDataSet;
    q_VetkaNaprID: TFloatField;
    q_VetkaNaprNAME: TStringField;
    q_VetkaPodID: TFloatField;
    q_VetkaPodNAME: TStringField;
    q_rowsVETKA_NAPR_NAME: TStringField;
    q_VagStatus: TOracleDataSet;
    FloatField1: TFloatField;
    StringField1: TStringField;
    q_rowsVAG_STATUS_NAME: TStringField;
    q_ProdID_NPR: TStringField;
    q_ProdNAME_NPR: TStringField;
    q_rowsPROD_NAME: TStringField;
    TBDock3: TTBDock;
    TBToolbar3: TTBToolbar;
    TBItem20: TTBItem;
    TBItem22: TTBItem;
    pkgFOR_CIST: TOraclePackage;
    q_rowsVZLIV: TFloatField;
    q_rowsTEMPER: TFloatField;
    q_rowsVOLUME: TFloatField;
    q_rowsBAD_NUM: TIntegerField;
    q_rowsZPU_TYPE1: TFloatField;
    q_rowsZPU_TYPE2: TFloatField;
    q_rowsPLOMBA1: TStringField;
    q_rowsPLOMBA2: TStringField;
    q_rowsROSINSPL1: TStringField;
    q_rowsROSINSPL2: TStringField;
    q_ZpuType1: TOracleDataSet;
    q_ZpuType1ID: TFloatField;
    q_ZpuType1NAME: TStringField;
    q_ZpuType2: TOracleDataSet;
    q_ZpuType2ID: TFloatField;
    q_ZpuType2NAME: TStringField;
    q_rowsZPU_TYPE1_NAME: TStringField;
    q_rowsZPU_TYPE2_NAME: TStringField;
    q_rowsVED_OSMOTR_ROW_ID: TFloatField;
    q_rowsLAST_PROD_ID_NPR: TStringField;
    q_rowsLAST_PROD_NAME: TStringField;
    acRowsSprav: TAction;
    TBItem23: TTBItem;
    acMOPodachaRowsAddVedOsm: TAction;
    q_Ved: TOracleDataSet;
    ds_Ved: TDataSource;
    q_VedVED_OSMOTR_ROW_ID: TFloatField;
    q_VedVED_NUM: TFloatField;
    q_VedVED_DATE: TDateTimeField;
    q_VedPOD_POS: TFloatField;
    q_VedTREECHILD1: TStringField;
    q_VedNUM_CIST: TStringField;
    q_VedKALIBR_ID: TStringField;
    q_VedRAZMET: TStringField;
    q_VedLOOKUP: TStringField;
    q_VedVED_OSMOTR_ID: TFloatField;
    q_VedTREENODE1: TStringField;
    TBDock5: TTBDock;
    TBToolbar5: TTBToolbar;
    TBItem28: TTBItem;
    q_rowsVED_OSMOTR_NUM: TStringField;
    SaveDialog1: TSaveDialog;
    q_rowsVED_POD_NUM: TStringField;
    acMOPodachaToDBF: TAction;
    TBItem30: TTBItem;
    acMOPodachaMoveVagon: TAction;
    TBItem31: TTBItem;
    acFind: TAction;
    TBItem32: TTBItem;
    q_rowsSVED_NUMDATE: TStringField;
    q_cist_deni: TOracleDataSet;
    acLastReis: TAction;
    TBItem33: TTBItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acToXLSExecute(Sender: TObject);
    procedure acMOPodachaAddExecute(Sender: TObject);
    procedure acMOPodachaEditExecute(Sender: TObject);
    procedure acMOPodachaRowsAddExecute(Sender: TObject);
    procedure acMOPodachaRowsEditExecute(Sender: TObject);
    procedure acMOPodachaRowsCopyExecute(Sender: TObject);
    procedure acMOPodachaRowsDelExecute(Sender: TObject);
    procedure acPrintExecute(Sender: TObject);
    procedure acFilterExecute(Sender: TObject);
    procedure acNoFilterExecute(Sender: TObject);
    procedure acMOPodachaCopyExecute(Sender: TObject);
    procedure acMOPodachaDelExecute(Sender: TObject);
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
    procedure q_rowsBeforePost(DataSet: TDataSet);
    procedure q_rowsNUM_CISTChange(Sender: TField);
    procedure q_rowsBeforeOpen(DataSet: TDataSet);
    procedure acRowsSpravExecute(Sender: TObject);
    procedure acMOPodachaRowsAddVedOsmExecute(Sender: TObject);
    procedure acMOPodachaToDBFExecute(Sender: TObject);
    procedure acMOPodachaMoveVagonExecute(Sender: TObject);
    procedure ExecuteSearch();
    procedure acFindExecute(Sender: TObject);
    procedure CheckTime(Sender: TObject);
    procedure GridRowsGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure acLastReisExecute(Sender: TObject);
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
    vPrevRazmet:variant;
    vPrevTemper:variant;
    vPrevZpuType1:variant;
    vPrevZpuType2:variant;
    vPrevPlomba1:variant;
    vPrevPlomba2:variant;
    vPrevRosinspl1:variant;
    vPrevRosinspl2:variant;
    vPrevNcistdop:variant;
    vPrevVagowner:variant;
    vPrevProd:variant;
    vPrevVPod:variant;
    vPrevVNapr:variant;
    vPrevStatus:variant;
  public
    { Public declarations }
    QueryBegin,QueryEnd:TDateTime;
    DocMestoId:integer; // Место отгрузки
    DocLoadTypeId:integer; // Тип транспортировки
    DocType:integer; // Тип документа
    DocMode:integer; // 1-Первоначальный ввод, 2-Раскредитовывание
    ReturnID:double;//ID который возвращает форма по перемещению вагонов из 1 док-та в другой
    DocTitleID:double;//ID шапки. Исп-ся для процедуры поиска
  end;

var
  f_Podacha: Tf_Podacha;
  gLinkMode:integer; // Режим просмтора: 1-фильтр по связям 0-стандартный просмотр
  gLinkFilter:string; // Строка для фильтра по связям
  gMesto:integer; // Место отгрузки
  gLoadType:integer; // Тип транспортировки
  gMode:integer; // 1-Первоначальный ввод, 2-Раскредитовывание

implementation

uses main, ForDB, MO_PodachaNew, ForSESS, KlsMisc2, MO_PodachaAddVedOsm,
  ForTemp, ForFiles, OraToDbf, MO_MoveVagon, ForSystem, MO_Find;

{$R *.dfm}

{ DONE -oPSV -cФорма : ************************* Методы формы ************************* }

{ DONE -oPSV -cФорма : Создание формы }
procedure Tf_Podacha.FormCreate(Sender: TObject);
var i:integer;
begin
  inherited;
  // Popup-Фильтр
  Filter2title:=TStringList.Create;
  Filter2title.Clear;
  Filter2rows:=TStringList.Create;
  Filter2rows.Clear;
  // Фильтр на форме (первоначальные значения)
  Time1.Time:=StrToTime('00:00:00');
  Time2.Time:=StrToTime('23:59:59');
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
  DocLoadTypeId:=gLoadType;
  gLoadType:=-1;
  // Тип документа - Ведомость подачи
  DocType:=4;
  DocMode:=gMode;
  gMode:=-1;

  // Сессия
  f_db.LogonMasterSession(ora_Session);
  f_db.SetUserGrants(ActionManager1);

  // Проверяем права
  if f_db.CheckGrant('acMOPodachaRowsEdit') then
  Begin
    q_Rows.ReadOnly:=false;
  End
  else
  Begin
    q_Rows.ReadOnly:=true;
  end;

  // Открытие запросов
  f_db.ReQuery(q_prod,false);
  f_db.ReQuery(q_VetkaPod,false);
  f_db.ReQuery(q_VetkaNapr,false);
  f_db.ReQuery(q_Vagontype,false);
  f_db.ReQuery(q_VagStatus,false);

  q_Track.SetVariable('LOAD_TYPE_ID',DocLoadTypeId);
  f_db.ReQuery(q_Track,false);

  q_VagOwner.SetVariable('LOAD_TYPE_ID',DocLoadTypeId);
  f_db.ReQuery(q_VagOwner,false);

  q_title.SetVariable('LOAD_TYPE_ID',DocLoadTypeId);
  q_title.SetVariable('MESTO_ID',DocMestoId);
  IsRefresh:=true;
  f_db.ReQuery(q_title,false);
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
procedure Tf_Podacha.FormClose(Sender: TObject; var Action: TCloseAction);
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
procedure Tf_Podacha.bRefreshClick(Sender: TObject);
begin
  inherited;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);
  // Обновляем запрос
  IsRefresh:=true;
  q_title.SetVariable(':TITLE_ID',0);
  f_db.ReQuery(q_title,true);
  IsRefresh:=false;
  // Приводим в соответствие подчиненную таблицу
  q_titleAfterScroll(q_title);
end;

{ TODO -cTitle_Actions -oPSV : Сохранение в Excel }
procedure Tf_Podacha.acToXLSExecute(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
    if not FileExists(SaveDialog1.FileName) then
      begin
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,gridRows,SaveDialog1.FileName,True);
        FileExecute(SaveDialog1.FileName,'','',esMaximized);
      end
    else
      if MessageDlg('Файл уже существует! Переписать?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,gridRows,SaveDialog1.FileName,True);
          FileExecute(SaveDialog1.FileName,'','',esMaximized);
        end;
end;

{ TODO -oPSV -cTitle_Actions : Печать документа }
procedure Tf_Podacha.acPrintExecute(Sender: TObject);
var RepFileName:string;
begin
  inherited;
  // Проверка
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  if q_rows.IsEmpty then exit;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  RepFileName:='MO_PODACHA.XLS';

  with TempVari do
  begin
    SetVariNum('LOAD_TYPE_ID',DocLoadTypeId,APPLICATION_NAME,RepFileName);
    SetVariNum('MESTO_ID',DocMestoId,APPLICATION_NAME,RepFileName);
    SetVariNum('VED_POD_ID',q_title.FieldByName('ID').AsFloat,APPLICATION_NAME,RepFileName);
  end;

  F_FileUtils.CheckReport(RepFileName,f_main.TempNetPath+RepFileName);
  try
    F_FileUtils.ExecAndWait(f_main.TempNetPath+RepFileName,'',SW_SHOWMAXIMIZED,false);
  except
  end;
end;

{ TODO -oPSV -cTitle_Actions : Применить Отбор }
procedure Tf_Podacha.acFilterExecute(Sender: TObject);
begin
  inherited;
  {}
end;

{ TODO -oPSV -cTitle_Actions : Отменить Отбор }
procedure Tf_Podacha.acNoFilterExecute(Sender: TObject);
begin
  inherited;
  {}
end;

{ DONE -cTitle_Actions -oPSV : Добавить документ }
procedure Tf_Podacha.acMOPodachaAddExecute(Sender: TObject);
begin
  inherited;
  // Проверка
  if not q_title.Active then exit;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // Добавление ведомости
  with tf_PodachaNew.create(self) do
  Begin
    EditId:=0;
    IsAdd:=true;
    ShowModal;
    if ModalResult=mrOk then
    Begin
      // Позиционируемся на добавленный документ
      IsRefresh:=true;
      f_db.ReQuery(q_Title,false);
      q_Title.Locate('ID',EditId,[]);
      IsRefresh:=false;
      // Приводим в соответствие подчиненную таблицу
      q_titleAfterScroll(q_title);
    end;
    Free;
  end;
end;

{ DONE -cTitle_Actions -oPSV : Редактируем документ }
procedure Tf_Podacha.acMOPodachaEditExecute(Sender: TObject);
begin
  inherited;
  // Проверка
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // Редактирование ведомости
  with tf_PodachaNew.create(self) do
  Begin
    EditId:=q_title.FieldByName('ID').AsFloat;
    IsAdd:=false;
    ShowModal;
    if ModalResult=mrOk then
    Begin
      // Позиционируемся на документ
      IsRefresh:=true;
      f_db.ReQuery(q_Title,false);
      q_Title.Locate('ID',EditId,[]);
      IsRefresh:=false;
      // Приводим в соответствие подчиненную таблицу
      q_titleAfterScroll(q_title);
    end;
    Free;
  end;
end;

{ DONE -oPSV -cTitle_Actions : Копировать документ }
procedure Tf_Podacha.acMOPodachaCopyExecute(Sender: TObject);
begin
  inherited;
  // Проверка
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // Копирование документа
  with tf_PodachaNew.create(self) do
  Begin
    EditId:=q_title.FieldByName('ID').AsFloat;
    IsAdd:=true;
    ShowModal;
    if ModalResult=mrOk then
    Begin
      // Позиционируемся на документ
      IsRefresh:=true;
      f_db.ReQuery(q_Title,false);
      q_Title.Locate('ID',EditId,[]);
      IsRefresh:=false;
      // Приводим в соответствие подчиненную таблицу
      q_titleAfterScroll(q_title);
    end;
    Free;
  end;
end;

{ DONE -oPSV -cTitle_Actions : Удалить документ }
procedure Tf_Podacha.acMOPodachaDelExecute(Sender: TObject);
var NextId:double;
begin
  inherited;
  // Проверка
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // Удаление документа
  if Application.MessageBox('Удалить запись?','Внимание!',MB_YESNO)=IDYES then
  Begin
    try
      q_Title.DisableControls;
      pkgFOR_PODACHA.CallProcedure('DelTitle',[1,q_Title.FieldByName('ID').AsString]);
      q_Title.Next;
    except
      on E:Exception do
      Begin
        f_main.ApplSession.WriteToLog(amFull,'VED_POD',sesError,E.Message,0,'');
      end;
    end;
    // Позиционируемся на следующий документ
    NextID:=q_Title.FieldByName('ID').AsFloat;
    IsRefresh:=true;
    f_db.ReQuery(q_Title,false);
    q_Title.Locate('ID',NextId,[]);
    IsRefresh:=false;
    q_titleAfterScroll(q_title);
    q_Title.EnableControls;
  End;
end;

{ DONE -oPSV -cTitle_Query : ************************* Заголовки документов - Запрос q_title ************************* }

{ DONE -oPSV -cTitle_Query : Действия до открытия q_title }
procedure Tf_Podacha.q_titleBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  // Учитываем фильтр на форме
  q_title.SQL[7]:=' AND a.pod_date>=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date1.Date)+' '+FormatDateTime('hh:mm',time1.Time)+':00'',''dd.mm.yyyy hh24:mi:ss'')';
  q_title.SQL[8]:=' AND a.pod_date<=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date2.Date)+' '+FormatDateTime('hh:mm',time2.Time)+':59'',''dd.mm.yyyy hh24:mi:ss'')';
  if VarType(lc_Track.KeyValue)<>varNull then
  Begin
    q_title.SQL[9]:=' AND a.VETKA_OTP_ID='+VarToStr(lc_Track.KeyValue);
  end
  else
  Begin
    q_title.SQL[9]:=' AND 1=1';
  End;
end;

{ DONE -oPSV -cTitle_Query : Действия после открытия q_title }
procedure Tf_Podacha.q_titleAfterOpen(DataSet: TDataSet);
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
procedure Tf_Podacha.q_titleAfterScroll(DataSet: TDataSet);
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

  if q_title.IsEmpty then exit;
  tabRowsDetail.Caption:=' Позиции ведомости № '+q_title.FieldByName('POD_NUM').AsString+' ';
  tabRowsItogs.Caption:=' Итоги ведомости № '+q_title.FieldByName('POD_NUM').AsString+' ';

  if NOT Active then exit;
  // Действия только в активной форме

end;

{ DONE -oPSV -cTitle_Query : Применить фильтр к запросу }
procedure Tf_Podacha.q_titleFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept:=f_db.AcceptFilterRecord(gridTitle,filter2title);
end;


{ DONE -oPSV -cTitle_Grid : ************************* Заголовки документов - GridTitle ************************* }

{ DONE -oPSV -cTitle_Grid : Значения столбца "№ п/п" (GridTitle)}
procedure Tf_Podacha.GridTitleColumns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
end;

{ DONE -oPSV -cTitle_Grid : Событие при выходе из GridTitle
     Фиксируем изменения в таблице (q_title.Post)
}
procedure Tf_Podacha.GridTitleExit(Sender: TObject);
begin
  inherited;
  if q_title.Active and (q_title.State<>dsBrowse) then q_title.Post;
end;

{ DONE -oPSV -cTitle_Grid : Сортировка в GridTitle }
procedure Tf_Podacha.GridTitleSortMarkingChanged(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.SortInGrid(q_title,q_title.SQL.Count-1,GridTitle);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

{ DONE -oPSV -cTitle_Popup : ************************* Заголовки документов - Popup ************************* }

{ DONE -oPSV -cTitle_Popup : Строка ввода для фильтра }
procedure Tf_Podacha.tbTitleFilterEditAcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterAcceptText(gridTitle,filter2title,NewText,Accept);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

{ DONE -oPSV -cTitle_Popup : Фильтр по выделенному  }
procedure Tf_Podacha.tbTitleFilterSelectionClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCurrentValue(gridTitle,filter2title);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

{ DONE -oPSV -cTitle_Popup : Очистить фильтр  }
procedure Tf_Podacha.tbTitleFilterClearClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCLear(gridtitle,filter2title);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

{ DONE -oPSV -cTitle_Popup : Редактировать в окне }
procedure Tf_Podacha.tbTitleWinEditClick(Sender: TObject);
begin
  inherited;
  f_db.EditInMemo(gridTitle);
end;


{ DONE -oPSV -cRows_Actions : ************************* Позиции документов - События ************************* }

{ DONE -oPSV -cRows_Actions : Обновить q_rows }
procedure Tf_Podacha.bRefreshRowsClick(Sender: TObject);
begin
  inherited;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);
  // Обновляем запрос
  f_db.ReQuery(q_rows,true);
end;

{ DONE -oPSV -cRows_Actions : Добавление позиции }
procedure Tf_Podacha.acMOPodachaRowsAddExecute(Sender: TObject);
begin
  inherited;
  // Проверка
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // Добавление позиции
  GridRows.SetFocus;
  q_rows.Append;
end;

{ DONE -oPSV -cRows_Actions : Редактирование  позиции }
procedure Tf_Podacha.acMOPodachaRowsEditExecute(Sender: TObject);
begin
  inherited;
  // Проверка
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  if q_rows.IsEmpty then exit;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  GridRows.SetFocus;
  
  // Редактирование позиции 
  q_rows.Edit;
end;

{ DONE -oPSV -cRows_Actions : Копирование  позиции }
procedure Tf_Podacha.acMOPodachaRowsCopyExecute(Sender: TObject);
begin
  inherited;
  // Проверка
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  if q_rows.IsEmpty then exit;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  GridRows.SetFocus;
  
  // Копирование позиции
  q_rows.Append;
  // Заполняем предыдущими значениями
  q_rows.FieldByName('RAZMET_FACT').AsVariant:=vPrevRazmet;
  q_rows.FieldByName('VETKA_POD_ID').AsVariant:=vPrevVPod;
  q_rows.FieldByName('VETKA_NAPR_ID').AsVariant:=vPrevVNapr;
  q_rows.FieldByName('VAG_STATUS_ID').AsVariant:=vPrevStatus;
end;

{ DONE -oPSV -cRows_Actions : Удаление  позиции }
procedure Tf_Podacha.acMOPodachaRowsDelExecute(Sender: TObject);
var NextId:double;
begin
  inherited;
  // Проверка
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  if q_rows.IsEmpty then exit;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  GridRows.SetFocus;

  // Удаление позиции
  if Application.MessageBox(PChar('Удалить вагон '+q_rowsNUM_CIST.AsString+' ?'),'Внимание!',MB_YESNO)=IDYES then
  Begin
    try
      q_Rows.DisableControls;
      pkgFOR_PODACHA.CallProcedure('DelRow',[1,q_Rows.FieldByName('ID').AsFloat]);
      q_Rows.Next;
    except
      on E:Exception do
      Begin
        f_main.ApplSession.WriteToLog(amFull,'VED_POD',sesError,E.Message,0,'');
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
procedure Tf_Podacha.acRowsPostExecute(Sender: TObject);
begin
  inherited;
  // Сохранить изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);
end;

{ DONE -oPSV -cRows_Actions : Отменить изменения в позиции и документе }
procedure Tf_Podacha.acRowsCancelExecute(Sender: TObject);
begin
  inherited;
  if q_title.Active and (q_title.State<>dsBrowse) then q_title.Cancel;
  if q_rows.Active and (q_rows.State<>dsBrowse) then q_rows.Cancel;
end;

{ DONE -oPSV -cRows_Query : ************************* Позиции документов - Запрос q_rows ************************* }

{ DONE -oPSV -cRows_Query : Применить фильтр к q_rows }
procedure Tf_Podacha.q_rowsFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept:=f_db.AcceptFilterRecord(gridRows,filter2rows);
end;

{ DONE -oPSV -cRows_Query : Действия после удаления из q_rows }
procedure Tf_Podacha.q_rowsAfterDelete(DataSet: TDataSet);
begin
  inherited;
  // Обновить заголовок
  IsRefresh:=true;
  f_db.ReQuery(q_title,true);
  IsRefresh:=false;
end;

{ DONE -oPSV -cRows_Query : Действия после фиксации изменений (Post) q_rows }
procedure Tf_Podacha.q_rowsAfterPost(DataSet: TDataSet);
begin
  inherited;
  // Обновить заголовок
//  q_rows.RefreshRecord;
  IsRefresh:=true;
  f_db.ReQuery(q_title,true);
  IsRefresh:=false;
end;

{ DONE -oPSV -cRows_Query : Действия после добавления записи в q_rows }
procedure Tf_Podacha.q_rowsAfterInsert(DataSet: TDataSet);
begin
  inherited;
  // Значения по умолчанию
  q_rows.FieldByName('VED_POD_ID').AsFloat:=q_title.FieldByName('ID').AsFloat;
  q_rows.FieldByName('POD_POS').AsFloat:=pkgFOR_PODACHA.CallFloatFunction('GetMaxNumPos',[q_title.FieldByName('ID').AsFloat]);
  q_rows.FieldByName('VAG_STATUS_ID').AsInteger:=0;
  q_rows.FieldByName('VETKA_POD_ID').AsInteger:=100;
  q_rows.FieldByName('VETKA_NAPR_ID').AsInteger:=100;

  GridRows.SelectedField:=q_Rows.FieldByName('NUM_CIST');
end;

{ DONE -oPSV -cRows_Query : Действия перед сменой текущей записи в q_rows }
procedure Tf_Podacha.q_rowsBeforeScroll(DataSet: TDataSet);
begin
  inherited;
  // Значение предыдущей записи
  vPrevRazmet:=q_rows.FieldByName('RAZMET_FACT').AsVariant;
  vPrevTemper:=q_rows.FieldByName('TEMPER').AsVariant;
  vPrevNcistdop:=q_rows.FieldByName('NCISTDOP').AsVariant;
  vPrevVagowner:=q_rows.FieldByName('VAGOWNER_ID').AsVariant;
  vPrevProd:=q_rows.FieldByName('PROD_ID_NPR').AsVariant;
  vPrevVPod:=q_rows.FieldByName('VETKA_POD_ID').AsVariant;
  vPrevVNapr:=q_rows.FieldByName('VETKA_NAPR_ID').AsVariant;
  vPrevStatus:=q_rows.FieldByName('VAG_STATUS_ID').AsVariant;
  vPrevZpuType1:=q_rows.FieldByName('ZPU_TYPE1').AsVariant;
  vPrevZpuType2:=q_rows.FieldByName('ZPU_TYPE2').AsVariant;
  vPrevPlomba1:=q_rows.FieldByName('PLOMBA1').AsVariant;
  vPrevPlomba2:=q_rows.FieldByName('PLOMBA2').AsVariant;
  vPrevRosinspl1:=q_rows.FieldByName('ROSINSPL1').AsVariant;
  vPrevRosinspl2:=q_rows.FieldByName('ROSINSPL2').AsVariant;
end;

{ DONE -oPSV -cRows_Query : Действия после смены текущей записи в q_rows }
procedure Tf_Podacha.q_rowsAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if (vNextState=dsEdit) and (q_rows.State=dsBrowse) then
  Begin
    // Находясь в режиме редактирования заполнить поле значением из строки выше
    vNextState:=dsBrowse;
    q_rows.Edit;
{    if GridRows.Columns[GridRows.Col-1].FieldName='RAZMET_FACT' then
      if q_rows.FieldByName('RAZMET_FACT').IsNull then
        q_rows.FieldByName('RAZMET_FACT').AsVariant:=vPrevRazmet;}
    if GridRows.Columns[GridRows.Col-1].FieldName='TEMPER' then
      if q_rows.FieldByName('TEMPER').IsNull then
        q_rows.FieldByName('TEMPER').AsVariant:=vPrevTemper;
    if GridRows.Columns[GridRows.Col-1].FieldName='NCISTDOP' then
      if q_rows.FieldByName('NCISTDOP').IsNull then
        q_rows.FieldByName('NCISTDOP').AsVariant:=vPrevNcistdop;
{    if GridRows.Columns[GridRows.Col-1].FieldName='VAGOWNER_NAME' then
      if q_rows.FieldByName('VAGOWNER_ID').IsNull then
        q_rows.FieldByName('VAGOWNER_ID').AsVariant:=vPrevVagowner;}
{    if GridRows.Columns[GridRows.Col-1].FieldName='PROD_NAME' then
      if q_rows.FieldByName('PROD_ID_NPR').IsNull then
        q_rows.FieldByName('PROD_ID_NPR').AsVariant:=vPrevProd;}
    if GridRows.Columns[GridRows.Col-1].FieldName='VETKA_POD_ID' then
      if q_rows.FieldByName('VETKA_POD_ID').IsNull then
        q_rows.FieldByName('VETKA_POD_ID').AsVariant:=vPrevVPod;
    if GridRows.Columns[GridRows.Col-1].FieldName='VETKA_NAPR_ID' then
      if q_rows.FieldByName('VETKA_NAPR_ID').IsNull then
        q_rows.FieldByName('VETKA_NAPR_ID').AsVariant:=vPrevVNapr;
    if GridRows.Columns[GridRows.Col-1].FieldName='VAG_STATUS_ID' then
      if q_rows.FieldByName('VAG_STATUS_ID').IsNull then
        q_rows.FieldByName('VAG_STATUS_ID').AsVariant:=vPrevStatus;
    if GridRows.Columns[GridRows.Col-1].FieldName='ZPU_TYPE1_NAME' then
      if q_rows.FieldByName('ZPU_TYPE1').IsNull then
        q_rows.FieldByName('ZPU_TYPE1').AsVariant:=vPrevZpuType1;
    if GridRows.Columns[GridRows.Col-1].FieldName='ZPU_TYPE2_NAME' then
      if q_rows.FieldByName('ZPU_TYPE2').IsNull then
        q_rows.FieldByName('ZPU_TYPE2').AsVariant:=vPrevZpuType2;
    if GridRows.Columns[GridRows.Col-1].FieldName='PLOMBA1' then
      if q_rows.FieldByName('PLOMBA1').IsNull then
      try
        if q_rows.FieldByName('AXES').AsInteger>4 then
          q_rows.FieldByName('PLOMBA1').AsVariant:=vPrevPlomba1+2
        else
          q_rows.FieldByName('PLOMBA1').AsVariant:=vPrevPlomba1+1;
      except
      end;
    if GridRows.Columns[GridRows.Col-1].FieldName='PLOMBA2' then
      if q_rows.FieldByName('PLOMBA2').IsNull then
      try
        if q_rows.FieldByName('AXES').AsInteger>4 then
          q_rows.FieldByName('PLOMBA2').AsVariant:=vPrevPlomba2+2
        else
          q_rows.FieldByName('PLOMBA2').AsVariant:=vPrevPlomba2+1;
      except
      end;
    if GridRows.Columns[GridRows.Col-1].FieldName='ROSINPL1' then
      if q_rows.FieldByName('ROSINPL1').IsNull then
      try
        if q_rows.FieldByName('AXES').AsInteger>4 then
          q_rows.FieldByName('ROSINSPL1').AsVariant:=vPrevRosinspl1+2
        else
          q_rows.FieldByName('ROSINSPL1').AsVariant:=vPrevRosinspl1+1;
      except
      end;
    if GridRows.Columns[GridRows.Col-1].FieldName='ROSINPL2' then
      if q_rows.FieldByName('ROSINPL2').IsNull then
      try
        if q_rows.FieldByName('AXES').AsInteger>4 then
          q_rows.FieldByName('ROSINSPL2').AsVariant:=vPrevRosinspl2+2
        else
          q_rows.FieldByName('ROSINSPL2').AsVariant:=vPrevRosinspl2+1;
      except
      end;
  End;
end;


{ DONE -oPSV -cRows_Grid : ************************* Позиции документов - GridRows ************************* }

{ DONE -oPSV -cRows_Grid :
Событие при выходе из GridRows
     Фиксируем изменения в таблице (q_rows.Post) }
procedure Tf_Podacha.GridRowsExit(Sender: TObject);
begin
  inherited;
  if q_rows.Active and (q_rows.State<>dsBrowse) then q_rows.Post;
end;

{ DONE -oPSV -cRows_Grid : Сортировка записей в GridRows }
procedure Tf_Podacha.GridRowsSortMarkingChanged(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.SortInGrid(q_rows,q_rows.SQL.Count-1,GridRows);
  IsRefresh:=false;
end;

{ DONE -oPSV -cRows_Grid : Действия по нажатию клавиши (GridRows) }
procedure Tf_Podacha.GridRowsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  // Проверка
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  if q_rows.IsEmpty then exit;

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
procedure Tf_Podacha.tbRowsFilterEditAcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterAcceptText(gridRows,filter2rows,NewText,Accept);
  IsRefresh:=false;
end;

{ DONE -oPSV -cRows_Popup : Фильтр  по выделенному (GridRows) }
procedure Tf_Podacha.tbRowsFilterSelectionClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCurrentValue(gridRows,filter2rows);
  IsRefresh:=false;
end;

{ DONE -oPSV -cRows_Popup : Очистить фильтр (GridRows) }
procedure Tf_Podacha.tbRowsFilterClearClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCLear(gridRows,filter2rows);
  IsRefresh:=false;
end;

{ DONE -oPSV -cRows_Popup : Редактировать в окне (GridRows) }
procedure Tf_Podacha.tbRowsWinEditClick(Sender: TObject);
begin
  inherited;
  f_db.EditInMemo(gridRows);
end;




procedure Tf_Podacha.q_rowsBeforePost(DataSet: TDataSet);
begin
  inherited;
  if q_rows.Active and (q_rows.FieldByName('NUM_CIST').AsString='') then
    q_rows.Cancel;
end;

procedure Tf_Podacha.q_rowsNUM_CISTChange(Sender: TField);
var str:string;
begin
  inherited;
  if not q_title.Active then exit;
  if not q_rows.Active then exit;

  if (q_rows.State<>dsBrowse) then
  Begin
    // Вызывать справочник цистерн
    try
      // 1.Определяем вид вагона
      q_rows.FieldByName('VAGONTYPE_ID').AsFloat:=pkgFOR_CIST.CallFloatFunction('GET_VAGONTYPE',[Sender.Value,DocLoadTypeId]);
      // 2. Проверяем номер вагона
      IF pkgFOR_CIST.CallIntegerFunction('CHECK_NUM_CIST',[Sender.Value,DocLoadTypeId,q_rows.FieldByName('VAGONTYPE_ID').AsFloat])=0 then
      Begin
        f_main.ApplSession.WriteToLog(amFull,'VED_POD',sesError,'Неверный номер вагона: '+Sender.Value+' !',0,'');
      End;
      // 3.Определяем реквизиты вагона
      q_rows.FieldByName('KALIBR_ID').AsString:=pkgFOR_CIST.CallStringFunction('GET_KALIBR',[Sender.Value,DocLoadTypeId,q_rows.FieldByName('VAGONTYPE_ID').AsFloat]);
      q_rows.FieldByName('NCISTDOP').AsFloat:=pkgFOR_CIST.CallFloatFunction('GET_NCISTDOP',[Sender.Value,DocLoadTypeId,q_rows.FieldByName('VAGONTYPE_ID').AsFloat]);
      q_rows.FieldByName('VES_CIST').AsFloat:=pkgFOR_CIST.CallFloatFunction('GET_VES_CIST',[Sender.Value,DocLoadTypeId,q_rows.FieldByName('VAGONTYPE_ID').AsFloat]);
      q_rows.FieldByName('VAGOWNER_ID').AsFloat:=pkgFOR_CIST.CallFloatFunction('GET_VAGOWNER',[Sender.Value,DocLoadTypeId,q_rows.FieldByName('VAGONTYPE_ID').AsFloat]);
      q_rows.FieldByName('CAPACITY').AsString:=pkgFOR_CIST.CallStringFunction('GET_CAPACITY',[Sender.Value,q_rows.FieldByName('KALIBR_ID').AsString,DocLoadTypeId,q_rows.FieldByName('VAGONTYPE_ID').AsFloat]);
      q_rows.FieldByName('AXES').AsFloat:=pkgFOR_CIST.CallFloatFunction('GET_AXES',[Sender.Value,q_rows.FieldByName('KALIBR_ID').AsString,0,DocLoadTypeId,q_rows.FieldByName('VAGONTYPE_ID').AsFloat]);
      q_rows.FieldByName('PROD_ID_NPR').AsString:=pkgFOR_CIST.CallFloatFunction('GET_ID_NPR',[Sender.Value,DocLoadTypeId]);
    except
      on E:Exception do
      Begin
        f_main.ApplSession.WriteToLog(amFull,'VED_POD',sesError,E.Message,0,'');
      end;
    end;

    // Вызываем список собственников вагонов
    IF q_rowsVAGOWNER_ID.AsFloat=0 then
    Begin
      GridRows.SelectedField:=q_Rows.FieldByName('VAGOWNER_NAME');
      acRowsSpravExecute(Self);
    end;

    q_Rows.Post;
    q_Rows.Edit;

    // Определяем, под какой продукт пригоден
    IF q_rowsLAST_PROD_ID_NPR.AsString<>'' then
    Begin
      q_rowsPROD_ID_NPR.AsString:=q_rowsLAST_PROD_ID_NPR.AsString;
      if (q_rowsLAST_PROD_ID_NPR.AsString='23950') or
         (q_rowsLAST_PROD_ID_NPR.AsString='23951') or
         (q_rowsLAST_PROD_ID_NPR.AsString='23971') then
      begin
        q_rowsPROD_ID_NPR.AsString:='11516';
      end;
    end;
    //Выведем предупреждения по вагону если они есть
    q_cist_deni.SetVariable(':NUM_CIST',q_rowsNum_cist.Value);
    f_db.ReQuery(q_cist_deni,false);
    while not q_cist_deni.Eof do
    begin
      str:=str+q_cist_deni.FieldByName('num_cist').AsString+' '+q_cist_deni.FieldByName('beg_deni').AsString+' '+q_cist_deni.FieldByName('prim').AsString+#13#10;
      q_cist_deni.Next;
    end;
    if not q_cist_deni.IsEmpty then
    begin
        f_main.ApplSession.WriteToLog(amFull,'MO_PODACHA',sesInfo,Str,0,'');
        Application.MessageBox(Pchar(str),'Внимание!');
    end;
    q_cist_deni.Close;

  end;
end;

procedure Tf_Podacha.q_rowsBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  q_rows.SetVariable('POD_DATE',q_titlePOD_DATE.AsDateTime);
  q_rows.SetVariable('POD_NUM',q_titlePOD_NUM.AsFloat);
end;

procedure Tf_Podacha.acRowsSpravExecute(Sender: TObject);
var NewProd:string;
begin
  inherited;
  // Проверка
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;

  // Фиксируем изменения
  GridTitleExit(Sender);
  if (q_rows.State = dsBrowse) and (acMOPodachaRowsEdit.Enabled) and not q_rows.IsEmpty then q_rows.Edit;

  if GridRows.Columns[GridRows.Col-1].FieldName='VAGOWNER_NAME' then
  Begin
    // Вызываем список собственников вагонов
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

  if GridRows.Columns[GridRows.Col-1].FieldName='PROD_NAME' then
  Begin

    if q_rows.FieldByName('PROD_ID_NPR').AsString='' then
      NewProd:=q_rows.FieldByName('LAST_PROD_ID_NPR').AsString
    else
      NewProd:=q_rows.FieldByName('PROD_ID_NPR').AsString;

    // Вызываем список продуктов
    KlsMisc2.SetKLSParam('KLS_PROD_VED_OSMOTR','CHOOSE',fsNormal,NewProd,'',true);
    with TF_KlsMisc.Create(Self) do
    begin
      if ShowModal=mrOk then
      if (q_rows.State <> dsBrowse) then
      begin
        q_rows.FieldByName('PROD_ID_NPR').AsString:=KlsMisc2.vIdToSeek;
      end;
      Free;
    end;
  end;

  if GridRows.Columns[GridRows.Col-1].FieldName='NUM_CIST' then
  Begin
    // Вызываем список вагонов
    KlsMisc2.SetKLSParam('KLS_CIST_VED_OSMOTR','CHOOSE',fsNormal,q_rows.FieldByName('NUM_CIST').AsString,'',true);
    with TF_KlsMisc.Create(Self) do
    begin
      if ShowModal=mrOk then
      if (q_rows.State <> dsBrowse) then
      begin
        q_rows.FieldByName('NUM_CIST').AsString:=KlsMisc2.vIdToSeek;
      end;
      Free;
    end;
  end;

end;

procedure Tf_Podacha.acMOPodachaRowsAddVedOsmExecute(Sender: TObject);
begin
  inherited;
  // Проверка
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  GridRows.SetFocus;

  // Откроем вагон для редактирования в форме
  with tf_PodachaAddVedOsm.create(self) do
  Begin
    ShowModal;
    if ModalResult=mrOk then
    Begin
      // Обновим заголовок
      IsRefresh:=true;
      f_db.ReQuery(q_Title,true);
      IsRefresh:=false;
      // Обновим позиции
      f_db.ReQuery(q_Rows,false);
    end;
    free;
  end;
end;

procedure Tf_Podacha.acMOPodachaToDBFExecute(Sender: TObject);
begin
  inherited;
  // Проверка
  if not q_title.Active then exit;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  with tf_ORAToDBF.Create(Self) do
    begin
      DBFtoORAid:='VED_POD';
      DontAsk:=true;
      Title:='на Эстакаду';
      Param1:='TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date1.Date)+' '+FormatDateTime('hh:mm',time1.Time)+''',''dd.mm.yyyy hh24:mi'')';
      Param2:='TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date2.Date)+' '+FormatDateTime('hh:mm',time2.Time)+''',''dd.mm.yyyy hh24:mi'')';
      ShowModal;
    end;
end;

procedure Tf_Podacha.acMOPodachaMoveVagonExecute(Sender: TObject);
var ExceptId,tmp:double;
    i,c:integer;
begin
  inherited;
  // Проверка
  if not q_rows.Active then exit;
  if q_title.IsEmpty then exit;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // Откроем вагон для редактирования в форме
  with tf_MoveVagon.create(self) do
  Begin
    ReturnID:=-1;
    q_Source.Session:=ora_Session;
    q_Source.SQL:=q_Title.SQL;
    ExceptID:=q_TitleID.Value;
    c:=-1;
    for i:=0 to q_Source.SQL.Count-1 do
      if Trim(q_Source.SQL[i])='AND 1=1' then c:=i;
    if c<>-1 then q_Source.SQL[c]:='AND ID<>'+F_ForSystem.RealToStr(ExceptId);
    q_Source.DeclareVariable(':MESTO_ID',otInteger);
    q_Source.DeclareVariable(':LOAD_TYPE_ID',otInteger);
    q_Source.DeclareVariable(':TITLE_ID',otInteger);
    q_Source.SetVariable(':MESTO_ID',DocMestoID);
    q_Source.SetVariable(':LOAD_TYPE_ID',DocLoadTypeID);
    q_Source.SetVariable(':TITLE_ID',DocTitleID);
    ParentFormName:=Self.Name;
    Caption:='Перемещение вагона '+q_RowsNUM_CIST.AsString+' в другую ведомость подачи';
    ShowModal;
    if ModalResult=mrOk then
    try
      q_title.DisableControls;
      tmp:=pkgFOR_PODACHA.CallFloatFunction('MoveRow',[1,q_rowsID.Value,ReturnId]);
      IsRefresh:=true;
      f_db.ReQuery(q_Title,false);
      q_Title.Locate('ID',ReturnId,[]);
      IsRefresh:=false;
      q_titleAfterScroll(q_title);
    finally  
      q_Title.EnableControls;
    end;
    free;
  end;
  //Обновление характеристик вагона

end;

procedure Tf_Podacha.ExecuteSearch();
begin
  with tf_FindVagon.create(self) do
  Begin
    DocTitleID:=0;
    q_Source.Session:=ora_Session;
    q_Structure.Session:=ora_Session;
    q_Structure.SetVariable(':STRUCTURE','FIND_VAGON_PODACHA');
    memo1.Lines:=q_title.SQL;
    ShowModal;
    if ModalResult=mrOk then
    Begin
      // Позиционируемся на найденный документ
      DocTitleid:=TempVari.GetAsNum('TITLE_ID_FIND');
      //ВО ИЗБЕЖАНИЕ ПРОБЛЕМ ЗАПОЛНИМ ПЕРЕМЕННУЮ НЕРЕАЛЬНЫМ ЗНАЧЕНИЕМ Т.К. ОНА БУДЕТ ХРАНИТЬСЯ 1 ДЕНЬ В БАЗЕ
      TempVari.SetVariNum('TITLE_ID_FIND',-1);
      try
        q_Title.DisableControls;
        q_Title.SetVariable(':TITLE_ID',DocTitleId);
        IsRefresh:=true;
        f_db.ReQuery(q_Title,false);
        q_title.Locate('ID',DocTitleID,[loCaseInsensitive]);
        IsRefresh:=false;
        // Приводим в соответствие подчиненную таблицу
        q_titleAfterScroll(q_title);
      finally
        q_Title.EnableControls;
      end;

    end;
    Free;
  end;
end;

procedure Tf_Podacha.acFindExecute(Sender: TObject);
begin
  inherited;
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  ExecuteSearch;

end;

procedure Tf_Podacha.CheckTime(Sender: TObject);
begin
  inherited;
  if (DateOf(Date2.DateTime)<DateOf(Date1.DateTime)) then
    Date2.DateTime:=Date1.DateTime;

  if (TimeOf(Time2.DateTime)<TimeOf(Time1.DateTime)) and
     (DateOf(Date2.DateTime)=DateOf(Date1.DateTime)) then
    Date2.DateTime:=Date1.DateTime+1;
end;

procedure Tf_Podacha.GridRowsGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if q_rowsBad_num.Value=1 then Background:=clRed
  else if q_rowsVAG_STATUS_ID.Value<>0 then Background:=clSilver;
end;

procedure Tf_Podacha.acLastReisExecute(Sender: TObject);
begin
  inherited;
  with tf_FindVagon.create(self) do
  Begin
    DocTitleID:=0;
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

end.
