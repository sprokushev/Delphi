unit MO_Pasp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MdiForm, Placemnt, ExtCtrls, Grids, DBGridEh, ComCtrls,
  RxLookup, Buttons, StdCtrls, TB2Dock, TB2Toolbar, TB2Item, ActnList,
  XPStyleActnCtrls, ActnMan, TB2ExtItems, Menus, Oracle, DB, OracleData, DBGrids,
  PropFilerEh, PropStorageEh, MemTableDataEh, DataDriverEh, MemTableEh,DateUtils,
  DBTables;

// ПАСПОРТА

type
  Tf_Pasp = class(Tf_MDIForm)
    Splitter1: TSplitter;
    GroupBox1: TGroupBox;
    lbProdName: TLabel;
    lc_Prod: TRxDBLookupCombo;
    pageTitle: TPageControl;
    tabTitleDetail: TTabSheet;
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
    GridRows: TDBGridEh;
    TBDock5: TTBDock;
    TBToolbar5: TTBToolbar;
    btRefreshRows: TTBItem;
    ActionManager1: TActionManager;
    acToXLS: TAction;
    acRowsCancel: TAction;
    acRowsPost: TAction;
    acMOPaspAdd: TAction;
    acMOPaspEdit: TAction;
    acMOPaspCopy: TAction;
    acMOPaspDel: TAction;
    acPrint: TAction;
    acFilter: TAction;
    acNoFilter: TAction;
    PopupTitle: TTBPopupMenu;
    TBItem16: TTBItem;
    TBItem17: TTBItem;
    tbTitleFilterTitle: TTBItem;
    tbTitleFilterEdit: TTBEditItem;
    tbTitleFilterSelection: TTBItem;
    tbTitleFilterClear: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    tbTitleWinEdit: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBItem9: TTBItem;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    TBItem13: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBSubmenuItem1: TTBSubmenuItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBItem14: TTBItem;
    TBItem15: TTBItem;
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
    TBItem19: TTBItem;
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
    PropStorageEh1: TPropStorageEh;
    ds_Prod: TDataSource;
    q_Prod: TOracleDataSet;
    q_ProdID_NPR: TStringField;
    q_ProdNAME_NPR: TStringField;
    pkgFor_environment: TOraclePackage;
    pkgFor_init: TOraclePackage;
    acMOPaspFind: TAction;
    TBItem6: TTBItem;
    q_kodif: TOracleDataSet;
    q_perer: TOracleDataSet;
    ds_perer: TDataSource;
    pkgFor_pasp: TOraclePackage;
    acMOPaspRefresh: TAction;
    Label3: TLabel;
    Date1: TDateTimePicker;
    Label4: TLabel;
    Date2: TDateTimePicker;
    acMOPaspView: TAction;
    q_titleID: TStringField;
    q_titlePASP_NUM: TStringField;
    q_titleREZ_NUM: TStringField;
    q_titlePASP_DATE: TDateTimeField;
    q_titleINSPEKTOR: TStringField;
    q_titlePROD_ID_NPR: TStringField;
    q_titleDATE_VIR: TDateTimeField;
    q_titlePERER_ID: TFloatField;
    q_titleMESTO_ID: TFloatField;
    q_titlePRIM: TStringField;
    q_titleIS_PASP_UNP: TFloatField;
    q_titleSHORT_NAME: TStringField;
    q_titleABBR_NPR: TStringField;
    q_titlePL20: TFloatField;
    q_titlePL15: TFloatField;
    TBItem5: TTBItem;
    TBSeparatorItem9: TTBSeparatorItem;
    TBItem7: TTBItem;
    TBSeparatorItem10: TTBSeparatorItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acToXLSExecute(Sender: TObject);
    procedure acMOSvedRowsAddExecute(Sender: TObject);
    procedure acMOSvedRowsEditExecute(Sender: TObject);
    procedure acMOPokCopyExecute(Sender: TObject);
    procedure acMOSvedRowsDelExecute(Sender: TObject);
    procedure acFilterExecute(Sender: TObject);
    procedure acNoFilterExecute(Sender: TObject);
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
    procedure GridRowsColumns33EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure GridRowsColumns33UpdateData(Sender: TObject;
      var Text: String; var Value: Variant; var UseText, Handled: Boolean);
    procedure acMOPaspAddExecute(Sender: TObject);
    procedure acMOPaspEditExecute(Sender: TObject);
    procedure acMOPaspCopyExecute(Sender: TObject);
    procedure ExecuteSearch();
    procedure acMOPaspFindExecute(Sender: TObject);
    procedure acMOPaspRefreshExecute(Sender: TObject);
    procedure acMOPaspDelExecute(Sender: TObject);
    procedure acMOPaspViewExecute(Sender: TObject);
    procedure btRefreshRowsClick(Sender: TObject);
    procedure TBItem7Click(Sender: TObject);
    procedure TBItem5Click(Sender: TObject);
    procedure CheckDate(Sender: TObject);

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
    //ОТЛАДОЧНАЯ ПЕРЕМЕННАЯ
    dbg:integer;
    DrawTitleID:string;//ID шапки. Исп-ся для отображения
    FindTitleID:string;//ID шапки. Исп-ся для процедуры поиска
  public
    { Public declarations }
    QueryBegin,QueryEnd:TDateTime;
    DocMestoId:integer; // Место отгрузки
    DocLoadTypeId:integer; // Тип транспортировки
    DocMode:integer; // 1-Первоначальный ввод, 2-Раскредитовывание
  end;

var
  f_Pasp: Tf_Pasp;
  gLinkMode:integer; // Режим просмтора: 1-фильтр по связям 0-стандартный просмотр
  gLinkFilter:string; // Строка для фильтра по связям
  gMesto:integer; // Место отгрузки
  gLoadType:integer; // Тип транспортировки
  gMode:integer; // 1-Первоначальный ввод, 2-Раскредитовывание

implementation

uses main, ForDB, ForSESS, KlsMisc2, MO_Find, ForTemp, MO_PaspAdd;

{$R *.dfm}

{ DONE -oPSV -cФорма : ************************* Методы формы ************************* }

{ DONE -oPSV -cФорма : Создание формы }
procedure Tf_Pasp.FormCreate(Sender: TObject);
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
  DocLoadTypeId:=gLoadType;
  gLoadType:=-1;
  DocMode:=gMode;
  // Сессия
  f_db.LogonMasterSession(ora_Session);
  f_db.SetUserGrants(ActionManager1);

  // Открытие запросов
  q_prod.Open;
  q_kodif.Open;
  q_perer.Open;
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
procedure Tf_Pasp.FormClose(Sender: TObject; var Action: TCloseAction);
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
procedure Tf_Pasp.bRefreshClick(Sender: TObject);
begin
  inherited;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);
  // Обновляем запрос
  IsRefresh:=true;
  q_title.SetVariable(':TITLE_ID','');
  f_db.ReQuery(q_title,true);
  IsRefresh:=false;
  // Приводим в соответствие подчиненную таблицу
  q_titleAfterScroll(q_title);
end;

{ TODO -cTitle_Actions -oPSV : Сохранение в Excel }
procedure Tf_Pasp.acToXLSExecute(Sender: TObject);
begin
  inherited;
  {}
end;

{ TODO -oPSV -cTitle_Actions : Применить Отбор }
procedure Tf_Pasp.acFilterExecute(Sender: TObject);
begin
  inherited;
  {}
end;

{ TODO -oPSV -cTitle_Actions : Отменить Отбор }
procedure Tf_Pasp.acNoFilterExecute(Sender: TObject);
begin
  inherited;
  {}
end;


{ DONE -oPSV -cTitle_Actions : Удалить документ }
procedure Tf_Pasp.acMOSvedDelExecute(Sender: TObject);
var NextId:string;
begin
  inherited;
  // Проверка
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  f_db.ReQuery(q_Title,false);
  q_Title.Locate('ID',NextId,[]);
  q_Title.EnableControls;
end;

{ DONE -oPSV -cTitle_Query : ************************* Заголовки документов - Запрос q_title ************************* }

{ DONE -oPSV -cTitle_Query : Действия до открытия q_title }
procedure Tf_Pasp.q_titleBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  // Учитываем фильтр на форме
  q_title.SQL[8]:=' V_PASP.pasp_date>=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date1.Date)+''',''dd.mm.yyyy'')';
  q_title.SQL[9]:=' AND V_PASP.pasp_date<=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date2.Date)+''',''dd.mm.yyyy'')';
  if VarType(lc_Prod.KeyValue)<>varNull then
      q_title.SQL[10]:=' AND V_PASP.PROD_ID_NPR='''+VarToStr(lc_Prod.KeyValue)+''''
  else
    q_title.SQL[10]:=' AND 1=1';
end;

{ DONE -oPSV -cTitle_Query : Действия после открытия q_title }
procedure Tf_Pasp.q_titleAfterOpen(DataSet: TDataSet);
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
procedure Tf_Pasp.q_titleAfterScroll(DataSet: TDataSet);
var i:integer;
begin
  inherited;
  if IsRefresh then exit;
  // обновляем позиции
  DrawTitleId:=q_title.FieldByName('ID').AsString;
  if q_title.FieldByName('IS_PASP_UNP').AsInteger=1 then
  Begin
    q_rows.SQL[1]:='V_VALPASP_UNP';
    q_rows.SetVariable('PASP_ID',q_title.FieldByName('ID').AsFloat);
  end
  else
  Begin
    q_rows.SQL[1]:='V_VALPASP';
    q_rows.SetVariable('PASP_ID',q_title.FieldByName('ID').AsString);
  end;
  f_db.ReQuery(q_rows,false);

  // Подготовка Popup-фильтра
  if filter2rows.Count=0 then
    for i:=1 to q_rows.FieldCount+1 do
    Begin
      Filter2rows.Add('');
    end;

  if q_title.IsEmpty then exit;
  tabRowsDetail.Caption:=' Позиции паспорта № '+q_title.FieldByName('PASP_NUM').AsString+' ';

  if NOT Active then exit;
  // Действия только в активной форме

end;

{ DONE -oPSV -cTitle_Query : Применить фильтр к запросу }
procedure Tf_Pasp.q_titleFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept:=f_db.AcceptFilterRecord(gridTitle,filter2title);
end;


{ DONE -oPSV -cTitle_Grid : ************************* Заголовки документов - GridTitle ************************* }

{ DONE -oPSV -cTitle_Grid : Значения столбца "№ п/п" (GridTitle)}
procedure Tf_Pasp.GridTitleColumns0GetCellParams(Sender: TObject;
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
procedure Tf_Pasp.GridTitleExit(Sender: TObject);
begin
  inherited;
  if q_title.Active and (q_title.State<>dsBrowse) then q_title.Post;
end;

{ DONE -oPSV -cTitle_Grid : Сортировка в GridTitle }
procedure Tf_Pasp.GridTitleSortMarkingChanged(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.SortInGrid(q_title,q_title.SQL.Count-1,GridTitle);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

{ TODO -oPSV -cTitle_Grid : Выделение активной строки }
procedure Tf_Pasp.GridRowsColumns33EditButtonClick(Sender: TObject;
  var Handled: Boolean);
var
  vOldState:TDataSetState;
  vOldStan:string;
begin
  inherited;
end;

procedure Tf_Pasp.GridRowsColumns33UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
begin
  inherited;
end;

{ DONE -oPSV -cTitle_Popup : ************************* Заголовки документов - Popup ************************* }

{ DONE -oPSV -cTitle_Popup : Строка ввода для фильтра }
procedure Tf_Pasp.tbTitleFilterEditAcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterAcceptText(gridTitle,filter2title,NewText,Accept);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;


procedure Tf_Pasp.tbTitleFilterSelectionClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCurrentValue(gridTitle,filter2title);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

{ DONE -oPSV -cTitle_Popup : Очистить фильтр  }
procedure Tf_Pasp.tbTitleFilterClearClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCLear(gridtitle,filter2title);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

{ DONE -oPSV -cTitle_Popup : Редактировать в окне }
procedure Tf_Pasp.tbTitleWinEditClick(Sender: TObject);
begin
  inherited;
  f_db.EditInMemo(gridTitle);
end;


{ DONE -oPSV -cRows_Actions : ************************* Позиции документов - События ************************* }

{ DONE -oPSV -cRows_Actions : Обновить q_rows }
procedure Tf_Pasp.bRefreshRowsClick(Sender: TObject);
begin
  inherited;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);
  // Обновляем запрос
  f_db.ReQuery(q_rows,true);
end;

procedure Tf_Pasp.acMOSvedRowsAddExecute(Sender: TObject);
begin

end;

{ DONE -oPSV -cRows_Actions : Редактирование  позиции }
procedure Tf_Pasp.acMOSvedRowsEditExecute(Sender: TObject);
begin
  inherited;
{  // Проверка
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  if q_rows.IsEmpty then exit;
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

// Редактирование позиции}
end;

{ DONE -oPSV -cRows_Actions : Копирование  позиции }
procedure Tf_Pasp.acMOPokCopyExecute(Sender: TObject);
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

{  // Копирование позиции
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
procedure Tf_Pasp.acMOSvedRowsDelExecute(Sender: TObject);
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
{  // Позиционируемся на следующую запись
  NextID:=q_Rows.FieldByName('ID').AsFloat;
  f_db.ReQuery(q_Rows,false);
  q_Rows.Locate('ID',NextId,[]);
  q_Rows.EnableControls;
  q_rowsAfterDelete(q_rows);}
end;

{ DONE -oPSV -cRows_Actions : Сохранить изменения в позиции и документе }
procedure Tf_Pasp.acRowsPostExecute(Sender: TObject);
begin
  inherited;
  // Сохранить изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);
end;

{ DONE -oPSV -cRows_Actions : Отменить изменения в позиции и документе }
procedure Tf_Pasp.acRowsCancelExecute(Sender: TObject);
begin
  inherited;
  if q_title.Active and (q_title.State<>dsBrowse) then q_title.Cancel;
  if q_rows.Active and (q_rows.State<>dsBrowse) then q_rows.Cancel;
end;

{ DONE -oPSV -cRows_Query : ************************* Позиции документов - Запрос q_rows ************************* }

{ DONE -oPSV -cRows_Query : Применить фильтр к q_rows }
procedure Tf_Pasp.q_rowsFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept:=f_db.AcceptFilterRecord(gridRows,filter2rows);
end;

{ DONE -oPSV -cRows_Query : Действия после удаления из q_rows }
procedure Tf_Pasp.q_rowsAfterDelete(DataSet: TDataSet);
begin
  inherited;
  // Обновить заголовок
  IsRefresh:=true;
  f_db.ReQuery(q_title,true);
  IsRefresh:=false;
end;

{ DONE -oPSV -cRows_Query : Действия после фиксации изменений (Post) q_rows }
procedure Tf_Pasp.q_rowsAfterPost(DataSet: TDataSet);
begin
  inherited;
  // Обновить заголовок
  IsRefresh:=true;
  f_db.ReQuery(q_title,true);
  IsRefresh:=false;
end;

{ DONE -oPSV -cRows_Query : Действия после добавления записи в q_rows }
procedure Tf_Pasp.q_rowsAfterInsert(DataSet: TDataSet);
begin
  inherited;
  // Значения по умолчанию
  q_rows.FieldByName('PASP_ID').AsString:=q_title.FieldByName('ID').AsString;
{  q_rows.FieldByName('VAG_STATUS_ID').AsInteger:=0;
  q_rows.FieldByName('VETKA_POD_ID').AsInteger:=100;
  q_rows.FieldByName('VETKA_NAPR_ID').AsInteger:=100;}

{  q_rows.FieldByName('NCISTDOP').AsVariant:=vPrevNcistdop;
  q_rows.FieldByName('RAZMET_FACT').AsVariant:=vPrevRazmet;
  q_rows.FieldByName('PROD_ID_NPR').AsVariant:=vPrevProd;}
end;

{ DONE -oPSV -cRows_Query : Действия перед сменой текущей записи в q_rows }
procedure Tf_Pasp.q_rowsBeforeScroll(DataSet: TDataSet);
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
procedure Tf_Pasp.q_rowsAfterScroll(DataSet: TDataSet);
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
procedure Tf_Pasp.GridRowsExit(Sender: TObject);
begin
  inherited;
  if q_rows.Active and (q_rows.State<>dsBrowse) then q_rows.Post;
end;

{ DONE -oPSV -cRows_Grid : Сортировка записей в GridRows }
procedure Tf_Pasp.GridRowsSortMarkingChanged(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.SortInGrid(q_rows,q_rows.SQL.Count-1,GridRows);
  IsRefresh:=false;
end;

{ DONE -oPSV -cRows_Grid : Действия по нажатию клавиши (GridRows) }
procedure Tf_Pasp.GridRowsKeyDown(Sender: TObject; var Key: Word;
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
procedure Tf_Pasp.tbRowsFilterEditAcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterAcceptText(gridRows,filter2rows,NewText,Accept);
  IsRefresh:=false;
end;

{ DONE -oPSV -cRows_Popup : Фильтр  по выделенному (GridRows) }
procedure Tf_Pasp.tbRowsFilterSelectionClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCurrentValue(gridRows,filter2rows);
  IsRefresh:=false;
end;

{ DONE -oPSV -cRows_Popup : Очистить фильтр (GridRows) }
procedure Tf_Pasp.tbRowsFilterClearClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCLear(gridRows,filter2rows);
  IsRefresh:=false;
end;

{ DONE -oPSV -cRows_Popup : Редактировать в окне (GridRows) }
procedure Tf_Pasp.tbRowsWinEditClick(Sender: TObject);
begin
  inherited;
  f_db.EditInMemo(gridRows);
end;




procedure Tf_Pasp.acMOPaspAddExecute(Sender: TObject);
begin
  inherited;
  // Проверка
  if not q_title.Active then exit;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // Добавление паспорта
  with tf_PaspAdd.create(self) do
  Begin
    EditId:='';
    EditMode:=0;
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

procedure Tf_Pasp.acMOPaspEditExecute(Sender: TObject);
begin
  inherited;
  // Проверка
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  if q_title.FieldByName('IS_PASP_UNP').AsInteger=1 then exit;

  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // Редактрование паспорта
  with tf_PaspAdd.create(self) do
  Begin
    EditId:=q_title.FieldByName('ID').AsString;
    EditMode:=1;
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

procedure Tf_Pasp.acMOPaspCopyExecute(Sender: TObject);
begin
  inherited;
  // Проверка
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // Копирование паспорта
  with tf_PaspAdd.create(self) do
  Begin
    EditId:=q_title.FieldByName('ID').AsString;
    EditMode:=0;
    if ShowModal=mrOk then
    Begin
      // Поиционируемся на документ
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

procedure Tf_Pasp.ExecuteSearch();
begin
  with tf_FindVagon.create(self) do
  Begin
    FindTitleID:='0';
    Caption:='Поиск паспорта по дате, номеру или номеру резервуара';
    q_Source.Session:=ora_Session;
    q_Structure.Session:=ora_Session;
    q_Structure.SetVariable(':STRUCTURE','FIND_PASP');
    memo1.Lines:=q_title.SQL;
    if ShowModal=mrOk then
    Begin
      // Позиционируемся на добавленный документ
      FindTitleid:=TempVari.GetAsChar('TITLE_ID_FIND');
      //ВО ИЗБЕЖАНИЕ ПРОБЛЕМ ЗАПОЛНИМ ПЕРЕМЕННУЮ НЕРЕАЛЬНЫМ ЗНАЧЕНИЕМ Т.К. ОНА БУДЕТ ХРАНИТЬСЯ 1 ДЕНЬ В БАЗЕ
      TempVari.SetVariChar('TITLE_ID_FIND','-1');
      try
        q_Title.DisableControls;
        q_Title.SetVariable(':TITLE_ID',FindTitleId);
        IsRefresh:=true;
        f_db.ReQuery(q_Title,false);
        q_title.Locate('ID',FindTitleID,[loCaseInsensitive]);
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

procedure Tf_Pasp.acMOPaspFindExecute(Sender: TObject);
begin
  inherited;
  if not q_rows.Active then exit;
  if not q_title.Active then exit;

  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);
  ExecuteSearch;
end;

procedure Tf_Pasp.acMOPaspRefreshExecute(Sender: TObject);
begin
  inherited;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);
  // Обновляем запрос
  IsRefresh:=true;
  q_title.SetVariable(':TITLE_ID','');
  f_db.ReQuery(q_title,true);
  IsRefresh:=false;
  // Приводим в соответствие подчиненную таблицу
  q_titleAfterScroll(q_title);
end;

procedure Tf_Pasp.acMOPaspDelExecute(Sender: TObject);
var
  NextID:string;
begin
  inherited;
  // Проверка
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // Удаление документа
  if Application.MessageBox(PChar('Удалить паспорт № '+q_titlePASP_NUM.AsString+' ?'),'Внимание!',MB_YESNO)=IDYES then
  Begin
    try
      q_Title.DisableControls;
      pkgFOR_PASP.CallProcedure('DelTitle',[1,q_Title.FieldByName('ID').AsString]);
      q_Title.Next;
    except
      on E:Exception do
      Begin
        f_main.ApplSession.WriteToLog(amFull,'PASP',sesError,E.Message,0,'');
      end;
    end;
    // Позиционируемся на следующий документ
    NextID:=q_Title.FieldByName('ID').AsString;
    IsRefresh:=true;
    f_db.ReQuery(q_Title,false);
    q_Title.Locate('ID',NextId,[]);
    IsRefresh:=false;
    q_titleAfterScroll(q_title);
    q_Title.EnableControls;
  End;

end;

procedure Tf_Pasp.acMOPaspViewExecute(Sender: TObject);
begin
  inherited;
  // Проверка
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // Просмотр паспорта
  with tf_PaspAdd.create(self) do
  Begin
    EditId:=q_title.FieldByName('ID').AsString;
    EditMode:=2;
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

procedure Tf_Pasp.btRefreshRowsClick(Sender: TObject);
begin
  inherited;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);
  // Обновляем запрос
  f_db.ReQuery(q_rows,true);
end;

procedure Tf_Pasp.TBItem7Click(Sender: TObject);
begin
  inherited;
  F_DB.GridSQL(Self,gridTitle,q_title.SQL.Text,q_title);
end;

procedure Tf_Pasp.TBItem5Click(Sender: TObject);
begin
  inherited;
  F_DB.GridSQL(Self,gridRows,q_rows.SQL.Text,q_rows);
end;

procedure Tf_Pasp.CheckDate(Sender: TObject);
begin
  inherited;
  if (DateOf(Date2.DateTime)<DateOf(Date1.DateTime)) then
    Date2.DateTime:=Date1.DateTime;
end;

end.
