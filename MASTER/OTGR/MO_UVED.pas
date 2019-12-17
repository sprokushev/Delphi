unit MO_UVED;
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MdiForm, Placemnt, ExtCtrls, Grids, DBGridEh, ComCtrls,
  RxLookup, Buttons, StdCtrls, TB2Dock, TB2Toolbar, TB2Item, ActnList,
  XPStyleActnCtrls, ActnMan, TB2ExtItems, Menus, Oracle, DB, OracleData, DBGrids,
  PropFilerEh, PropStorageEh, MemTableDataEh, DataDriverEh, MemTableEh, ComObj,
  GridsEh;

// Уведомления об уборке

type
  Tf_Uved = class(Tf_MDIForm)
    GroupBox1: TGroupBox;
    Splitter1: TSplitter;
    ActionManager1: TActionManager;
    acToXLS: TAction;
    PopupTitle: TTBPopupMenu;
    tbTitleFilterTitle: TTBItem;
    acMOUvedEdit: TAction;
    acMOUvedDel: TAction;
    acMOUvedRowsDel: TAction;
    acPrintUvedUnp: TAction;
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
    pkgFor_uved: TOraclePackage;
    PropStorageEh1: TPropStorageEh;
    TBItem19: TTBItem;
    pageTitle: TPageControl;
    tabTitleDetail: TTabSheet;
    tabTitleItogs: TTabSheet;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    bRefresh: TTBItem;
    TBItem2: TTBItem;
    TBItem1: TTBItem;
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
    TBDock5: TTBDock;
    TBToolbar5: TTBToolbar;
    TBItem30: TTBItem;
    TBItem34: TTBItem;
    TBItem35: TTBItem;
    TBItem36: TTBItem;
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
    q_rowsFORMNAKL_NAME: TStringField;
    pkgFOR_DOCUMENTS: TOraclePackage;
    q_titleID: TFloatField;
    q_titleMESTO_ID: TFloatField;
    q_titleMESTO_NAME: TStringField;
    q_titleLOAD_TYPE_ID: TFloatField;
    q_titleTYPE_OTGR_NAME: TStringField;
    q_titleUVED_NUM: TFloatField;
    q_titleUVED_DATE: TDateTimeField;
    q_titleLUKOMA_NUM: TFloatField;
    q_titleMPS_NUM: TFloatField;
    q_titleCHER_NUM: TFloatField;
    q_titleVETL_NUM: TFloatField;
    q_rowsUVED_ID: TFloatField;
    q_rowsUVED_POS: TIntegerField;
    TBSubmenuItem3: TTBSubmenuItem;
    TBItem3: TTBItem;
    acPrintUvedVetl: TAction;
    acPrintUvedLukoma: TAction;
    acPrintUvedMPS: TAction;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    acPrintUvedCher: TAction;
    TBItem7: TTBItem;
    Label1: TLabel;
    Time1: TDateTimePicker;
    Date1: TDateTimePicker;
    Label4: TLabel;
    Time2: TDateTimePicker;
    Date2: TDateTimePicker;
    q_rowsIS_AUTO: TIntegerField;
    q_rowsSVED_NUM: TStringField;
    q_rowsNOM_ZD: TStringField;
    q_rowsPROD_NAME: TStringField;
    q_rowsPASP_NUM: TStringField;
    q_rowsREZ_NUM: TStringField;
    q_rowsPASP_DATE: TDateTimeField;
    q_rowsDATE_PLAN: TDateTimeField;
    q_rowsNAKL_NUM: TStringField;
    q_rowsVAGONTYPE_NAME: TStringField;
    q_rowsZPU_TYPE1_NAME: TStringField;
    q_rowsZPU_TYPE2_NAME: TStringField;
    q_rowsVAGOWNER_NAME: TStringField;
    q_rowsVAG_STATUS_NAME: TStringField;
    acMOUvedView: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acToXLSExecute(Sender: TObject);
    procedure acMOUvedAddExecute(Sender: TObject);
    procedure acMOUvedEditExecute(Sender: TObject);
    procedure acMOUvedRowsDelExecute(Sender: TObject);
    procedure acPrintUvedUnpExecute(Sender: TObject);
    procedure acFilterExecute(Sender: TObject);
    procedure acNoFilterExecute(Sender: TObject);
    procedure acMOUvedCopyExecute(Sender: TObject);
    procedure acMOUvedDelExecute(Sender: TObject);
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
    procedure acPrintUvedVetlExecute(Sender: TObject);
    procedure acPrintUvedLukomaExecute(Sender: TObject);
    procedure acPrintUvedMPSExecte(Sender: TObject);
    procedure acPrintUvedCherExecute(Sender: TObject);
    procedure CheckTime(Sender: TObject);
    procedure acMOUvedViewExecute(Sender: TObject);
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
  public
    { Public declarations }
    QueryBegin,QueryEnd:TDateTime;
    DocMestoId:integer; // Место отгрузки
    DocLoadTypeId:integer; // Тип транспортировки
    DocType:integer; // Тип документа
    DocMode:integer; // 1-Первоначальный ввод, 2-Раскредитовывание
  end;

var
  f_Uved: Tf_Uved;
  gLinkMode:integer; // Режим просмтора: 1-фильтр по связям 0-стандартный просмотр
  gLinkFilter:string; // Строка для фильтра по связям
  gMesto:integer; // Место отгрузки
  gLoadType:integer; // Тип транспортировки
  gMode:integer; // 1-Первоначальный ввод, 2-Раскредитовывание

implementation

uses main, ForDB, ForSESS, ForFiles, KlsMisc2, MO_UvedNew, DateUtils;

{$R *.dfm}

{ DONE -oPSV -cФорма : ************************* Методы формы ************************* }

{ DONE -oPSV -cФорма : Создание формы }
procedure Tf_Uved.FormCreate(Sender: TObject);
//var i:integer;
begin
  inherited;
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
  // Тип документа - Уведомления
  DocType:=7;
  DocLoadTypeId:=gLoadType;
  gLoadType:=-1;
  DocMode:=gMode;
  // Сессия
  f_db.LogonMasterSession(ora_Session);
  f_db.SetUserGrants(ActionManager1);

  // Открытие запросов
  q_title.SetVariable('LOAD_TYPE_ID',DocLoadTypeId);
  q_title.SetVariable('MESTO_ID',DocMestoId);
  IsRefresh:=true;
  q_title.Open;
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

{ DONE -oPSV -cФорма : Закрытие формы }
procedure Tf_Uved.FormClose(Sender: TObject; var Action: TCloseAction);
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
procedure Tf_Uved.bRefreshClick(Sender: TObject);
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
procedure Tf_Uved.acToXLSExecute(Sender: TObject);
begin
  inherited;
  {}
end;

{ TODO -oPSV -cTitle_Actions : Печать документа }
procedure Tf_Uved.acPrintUvedUnpExecute(Sender: TObject);
var ExcelApp:Variant;
begin
  inherited;
  F_FileUtils.OpenWorkbook('U:\master\xls\MO_uved_unp.xls','OpenPrintUved',q_titleUVED_NUM.Value);
end;

{ TODO -oPSV -cTitle_Actions : Применить Отбор }
procedure Tf_Uved.acFilterExecute(Sender: TObject);
begin
  inherited;
  {}
end;

{ TODO -oPSV -cTitle_Actions : Отменить Отбор }
procedure Tf_Uved.acNoFilterExecute(Sender: TObject);
begin
  inherited;
  {}
end;

{ DONE -cTitle_Actions -oPSV : Добавить документ }
procedure Tf_Uved.acMOUvedAddExecute(Sender: TObject);
begin
end;

{ DONE -cTitle_Actions -oPSV : Редактируем документ }
procedure Tf_Uved.acMOUvedEditExecute(Sender: TObject);
begin
  inherited;
  // Проверка
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // Редактирование ведомости
  with tf_UvedNew.create(self) do
  Begin
    ParentFormName:='UVED';
    EditId:=q_title.FieldByName('ID').AsFloat;
    EditMode:=1;
    DocMestoId:=Self.DocMestoId;
    DocLoadTypeId:=Self.DocLoadTypeId;
    DocType:=Self.DocType;
    DocMode:=Self.DocMode;
    if ShowModal=mrOk then
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
procedure Tf_Uved.acMOUvedCopyExecute(Sender: TObject);
begin
end;

{ DONE -oPSV -cTitle_Actions : Удалить документ }
procedure Tf_Uved.acMOUvedDelExecute(Sender: TObject);
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
  if Application.MessageBox(PChar('Удалить уведомление № '+q_titleUVED_NUM.AsString+' ?'),'Внимание!',MB_YESNO)=IDYES then
  Begin
    try
      q_Title.DisableControls;
      pkgFOR_UVED.CallProcedure('DelTitle',[1,q_Title.FieldByName('ID').AsString]);
      q_Title.Next;
    except
      on E:Exception do
      Begin
        f_main.ApplSession.WriteToLog(amFull,'UVED',sesError,E.Message,0,'');
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
procedure Tf_Uved.q_titleBeforeOpen(DataSet: TDataSet);
var str:string;
begin
  inherited;
  // Учитываем фильтр на форме
  q_title.SQL[17]:=' AND s.UVED_date>=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date1.Date)+''',''dd.mm.yyyy'')';
  q_title.SQL[18]:=' AND s.UVED_date<=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date2.Date)+''',''dd.mm.yyyy'')';
end;

{ DONE -oPSV -cTitle_Query : Действия после открытия q_title }
procedure Tf_Uved.q_titleAfterOpen(DataSet: TDataSet);
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
procedure Tf_Uved.q_titleAfterScroll(DataSet: TDataSet);
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
  tabRowsDetail.Caption:=' Позиции уведомления № '+q_title.FieldByName('UVED_NUM').AsString+' ';
  tabRowsItogs.Caption:=' Итоги уведомления № '+q_title.FieldByName('UVED_NUM').AsString+' ';

  if NOT Active then exit;
  // Действия только в активной форме

end;

{ DONE -oPSV -cTitle_Query : Применить фильтр к запросу }
procedure Tf_Uved.q_titleFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept:=f_db.AcceptFilterRecord(gridTitle,filter2title);
end;


{ DONE -oPSV -cTitle_Grid : ************************* Заголовки документов - GridTitle ************************* }

{ DONE -oPSV -cTitle_Grid : Событие при выходе из GridTitle
     Фиксируем изменения в таблице (q_title.Post)
}
procedure Tf_Uved.GridTitleExit(Sender: TObject);
begin
  inherited;
  if q_title.Active and (q_title.State<>dsBrowse) then q_title.Post;
end;

{ DONE -oPSV -cTitle_Grid : Сортировка в GridTitle }
procedure Tf_Uved.GridTitleSortMarkingChanged(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.SortInGrid(q_title,q_title.SQL.Count-1,GridTitle);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

{ DONE -oPSV -cTitle_Popup : ************************* Заголовки документов - Popup ************************* }

{ DONE -oPSV -cTitle_Popup : Строка ввода для фильтра }
procedure Tf_Uved.tbTitleFilterEditAcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterAcceptText(gridTitle,filter2title,NewText,Accept);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

{ DONE -oPSV -cTitle_Popup : Фильтр по выделенному  }
procedure Tf_Uved.tbTitleFilterSelectionClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCurrentValue(gridTitle,filter2title);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

{ DONE -oPSV -cTitle_Popup : Очистить фильтр  }
procedure Tf_Uved.tbTitleFilterClearClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCLear(gridtitle,filter2title);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

{ DONE -oPSV -cTitle_Popup : Редактировать в окне }
procedure Tf_Uved.tbTitleWinEditClick(Sender: TObject);
begin
  inherited;
  f_db.EditInMemo(gridTitle);
end;


{ DONE -oPSV -cRows_Actions : ************************* Позиции документов - События ************************* }

{ DONE -oPSV -cRows_Actions : Обновить q_rows }
procedure Tf_Uved.bRefreshRowsClick(Sender: TObject);
begin
  inherited;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);
  // Обновляем запрос
  f_db.ReQuery(q_rows,true);
end;

{ DONE -oPSV -cRows_Actions : Удаление  позиции }
procedure Tf_Uved.acMOUVEDRowsDelExecute(Sender: TObject);
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

  // Удаление позиции
  if Application.MessageBox('Удалить запись?','Внимание!',MB_YESNO)=IDYES then
  Begin
    try
      q_Rows.DisableControls;
      pkgFOR_UVED.CallProcedure('DelRow',[1,q_Rows.FieldByName('ID').AsFloat]);
      q_Rows.Next;
    except
      on E:Exception do
      Begin
        f_main.ApplSession.WriteToLog(amFull,'UVED',sesError,E.Message,0,'');
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

{ DONE -oPSV -cRows_Query : ************************* Позиции документов - Запрос q_rows ************************* }

{ DONE -oPSV -cRows_Query : Применить фильтр к q_rows }
procedure Tf_Uved.q_rowsFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept:=f_db.AcceptFilterRecord(gridRows,filter2rows);
end;

{ DONE -oPSV -cRows_Query : Действия после удаления из q_rows }
procedure Tf_Uved.q_rowsAfterDelete(DataSet: TDataSet);
begin
  inherited;
  // Обновить заголовок
  IsRefresh:=true;
  f_db.ReQuery(q_title,true);
  IsRefresh:=false;
end;


{ DONE -oPSV -cRows_Grid : ************************* Позиции документов - GridRows ************************* }

{ DONE -oPSV -cRows_Grid :
Событие при выходе из GridRows
     Фиксируем изменения в таблице (q_rows.Post) }
procedure Tf_Uved.GridRowsExit(Sender: TObject);
begin
  inherited;
  if q_rows.Active and (q_rows.State<>dsBrowse) then q_rows.Post;
end;

{ DONE -oPSV -cRows_Grid : Сортировка записей в GridRows }
procedure Tf_Uved.GridRowsSortMarkingChanged(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.SortInGrid(q_rows,q_rows.SQL.Count-1,GridRows);
  IsRefresh:=false;
end;


{ DONE -oPSV -cRows_Popup : ************************* Позиции документов - Popup ************************* }

{ DONE -oPSV -cRows_Popup : Применить фильтр (GridRows) }
procedure Tf_Uved.tbRowsFilterEditAcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterAcceptText(gridRows,filter2rows,NewText,Accept);
  IsRefresh:=false;
end;

{ DONE -oPSV -cRows_Popup : Фильтр  по выделенному (GridRows) }
procedure Tf_Uved.tbRowsFilterSelectionClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCurrentValue(gridRows,filter2rows);
  IsRefresh:=false;
end;

{ DONE -oPSV -cRows_Popup : Очистить фильтр (GridRows) }
procedure Tf_Uved.tbRowsFilterClearClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCLear(gridRows,filter2rows);
  IsRefresh:=false;
end;

{ DONE -oPSV -cRows_Popup : Редактировать в окне (GridRows) }
procedure Tf_Uved.tbRowsWinEditClick(Sender: TObject);
begin
  inherited;
  f_db.EditInMemo(gridRows);
end;

{procedure Tf_Uved.OpenWorkbook(StrPath:string);
var
  ExcelApp:variant;
  Arg:OleVariant;
begin
  // Проверка
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  // открытие Excel
  Arg:=q_titleUVED_NUM.Value;
  ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.Workbooks.Open(StrPath);
  ExcelApp.Visible:=true;
  // Запуск макроса
  ExcelApp.Run('OpenPrintUved',Arg);
  //Освобождение переменной
  ExcelApp := UnAssigned;
end;
}

procedure Tf_Uved.acPrintUvedVetlExecute(Sender: TObject);
begin
  inherited;
  F_FileUtils.OpenWorkbook('U:\master\xls\MO_uved_vetl.xls','OpenPrintUved',q_titleUVED_NUM.Value);
end;

procedure Tf_Uved.acPrintUvedLukomaExecute(Sender: TObject);
begin
  inherited;
  F_FileUtils.OpenWorkbook('U:\master\xls\MO_uved_lukoma.xls','OpenPrintUved',q_titleUVED_NUM.Value);
end;

procedure Tf_Uved.acPrintUvedMPSExecte(Sender: TObject);
begin
  inherited;
  F_FileUtils.OpenWorkbook('U:\master\xls\MO_uved_MPS.xls','OpenPrintUved',q_titleUVED_NUM.Value);
end;

procedure Tf_Uved.acPrintUvedCherExecute(Sender: TObject);
begin
  inherited;
  F_FileUtils.OpenWorkbook('U:\master\xls\MO_uved_cher.xls','OpenPrintUved',q_titleUVED_NUM.Value);
end;

procedure Tf_Uved.CheckTime(Sender: TObject);
begin
  inherited;
  if (DateOf(Date2.DateTime)<DateOf(Date1.DateTime)) then
    Date2.DateTime:=Date1.DateTime;

  if (TimeOf(Time2.DateTime)<TimeOf(Time1.DateTime)) and
     (DateOf(Date2.DateTime)=DateOf(Date1.DateTime)) then
    Date2.DateTime:=Date1.DateTime+1;
end;

procedure Tf_Uved.acMOUvedViewExecute(Sender: TObject);
begin
  inherited;
  // Проверка
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // Просмотр уведомления
  with tf_UvedNew.create(self) do
  Begin
    ParentFormName:='UVED';
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

end.
