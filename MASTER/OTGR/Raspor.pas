unit Raspor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MdiForm, Placemnt, ExtCtrls, Grids, DBGridEh, ComCtrls,
  RxLookup, Buttons, StdCtrls, TB2Dock, TB2Toolbar, TB2Item, ActnList,
  XPStyleActnCtrls, ActnMan, TB2ExtItems, Menus, Oracle, DB, OracleData, DBGrids,
  PropFilerEh, PropStorageEh,DBGridEhImpExp,RxShell;

// РАЗРЕШЕНИЯ на отгрузку

type
  Tf_Raspor = class(Tf_MDIForm)
    GroupBox1: TGroupBox;
    Splitter1: TSplitter;
    ActionManager1: TActionManager;
    acToXLS: TAction;
    PopupTitle: TTBPopupMenu;
    tbTitleFilterTitle: TTBItem;
    acRasporAdd: TAction;
    acRasporEdit: TAction;
    acRasporDel: TAction;
    acRasporCopy: TAction;
    acRasporRowsDel: TAction;
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
    pkgFOR_RASPOR: TOraclePackage;
    PropStorageEh1: TPropStorageEh;
    acRowsPost: TAction;
    acRowsCancel: TAction;
    pageTitle: TPageControl;
    tabTitleDetail: TTabSheet;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    bRefresh: TTBItem;
    TBItem3: TTBItem;
    TBItem2: TTBItem;
    TBItem1: TTBItem;
    TBItem10: TTBItem;
    GridTitle: TDBGridEh;
    pageRows: TPageControl;
    tabRowsDetail: TTabSheet;
    TBDock2: TTBDock;
    TBToolbar2: TTBToolbar;
    bRefreshRows: TTBItem;
    TBItem8: TTBItem;
    GridRows: TDBGridEh;
    Label3: TLabel;
    Date1: TDateTimePicker;
    Label4: TLabel;
    Date2: TDateTimePicker;
    q_titleID: TFloatField;
    q_titleNUM_NAR: TStringField;
    q_titleDATE_NAR: TDateTimeField;
    q_titleDATE_END: TDateTimeField;
    q_titleDOVER_ID: TFloatField;
    q_titleMESTO_ID: TIntegerField;
    q_titleIS_LOADED: TIntegerField;
    q_titleLOAD_TYPE_ID: TFloatField;
    q_titleDATE_BEG: TDateTimeField;
    q_rowsID: TFloatField;
    q_rowsNARIAD_ID: TFloatField;
    q_rowsNOM_ZD: TStringField;
    q_rowsIS_LOADED: TIntegerField;
    q_rowsVES: TFloatField;
    q_rowsKOL: TIntegerField;
    q_rowsFACT_VES: TFloatField;
    q_rowsFACT_KOL: TIntegerField;
    q_rowsOST_KOL: TFloatField;
    q_rowsOST_VES: TFloatField;
    q_rowsSTAN_NAME: TStringField;
    q_rowsPROD_NAME: TStringField;
    q_rowsPREDPR_NAME: TStringField;
    SaveDialog1: TSaveDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acToXLSExecute(Sender: TObject);
    procedure acRasporAddExecute(Sender: TObject);
    procedure acRasporEditExecute(Sender: TObject);
    procedure acRasporRowsDelExecute(Sender: TObject);
    procedure acPrintExecute(Sender: TObject);
    procedure acFilterExecute(Sender: TObject);
    procedure acNoFilterExecute(Sender: TObject);
    procedure acRasporCopyExecute(Sender: TObject);
    procedure acRasporDelExecute(Sender: TObject);
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
    procedure q_titleBeforeOpen(DataSet: TDataSet);
    procedure acRowsPostExecute(Sender: TObject);
    procedure acRowsCancelExecute(Sender: TObject);
    procedure GridTitleGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
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
  public
    { Public declarations }
    QueryBegin,QueryEnd:TDateTime;
    DocMestoId:integer; // Место отгрузки
    DocLoadTypeId:integer; // Тип транспортировки
    DocType:integer; // Тип документа
    DocMode:integer; // 1-Первоначальный ввод, 2-Раскредитовывание
  end;

var
  f_Raspor: Tf_Raspor;
  gLinkMode:integer; // Режим просмтора: 1-фильтр по связям 0-стандартный просмотр
  gLinkFilter:string; // Строка для фильтра по связям
  gMesto:integer; // Место отгрузки
  gLoadType:integer; // Тип транспортировки
  gMode:integer; // 1-Первоначальный ввод, 2-Раскредитовывание

implementation

uses main, ForDB, RasporNew, ForSESS, KlsMisc2, ForTemp, ForFiles, DateUtils;

{$R *.dfm}

{ DONE -oPSV -cФорма : ************************* Методы формы ************************* }

{ DONE -oPSV -cФорма : Создание формы }
procedure Tf_Raspor.FormCreate(Sender: TObject);
var i:integer;
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
  // Тип документа - Разрешения на отгрузку
  DocType:=5;
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
procedure Tf_Raspor.FormClose(Sender: TObject; var Action: TCloseAction);
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
procedure Tf_Raspor.bRefreshClick(Sender: TObject);
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
procedure Tf_Raspor.acToXLSExecute(Sender: TObject);
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
procedure Tf_Raspor.acPrintExecute(Sender: TObject);
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

  RepFileName:='MO_RASPOR.XLS';

  with TempVari do
  begin
    SetVariNum('LOAD_TYPE_ID',DocLoadTypeId,APPLICATION_NAME,RepFileName);
    SetVariNum('MESTO_ID',DocMestoId,APPLICATION_NAME,RepFileName);
    SetVariNum('NARIAD_ID',q_title.FieldByName('ID').AsFloat,APPLICATION_NAME,RepFileName);
  end;

  F_FileUtils.CheckReport(RepFileName,f_main.TempNetPath+RepFileName);
  try
    F_FileUtils.ExecAndWait(f_main.TempNetPath+RepFileName,'',SW_SHOWMAXIMIZED,false);
  except
  end;
end;

{ TODO -oPSV -cTitle_Actions : Применить Отбор }
procedure Tf_Raspor.acFilterExecute(Sender: TObject);
begin
  inherited;
  {}
end;

{ TODO -oPSV -cTitle_Actions : Отменить Отбор }
procedure Tf_Raspor.acNoFilterExecute(Sender: TObject);
begin
  inherited;
  {}
end;

{ DONE -cTitle_Actions -oPSV : Добавить документ }
procedure Tf_Raspor.acRasporAddExecute(Sender: TObject);
begin
  inherited;
  // Проверка
  if not q_title.Active then exit;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // Добавление ведомости
  with tf_RasporNew.create(self) do
  Begin
    EditId:=0;
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
procedure Tf_Raspor.acRasporEditExecute(Sender: TObject);
begin
  inherited;
  // Проверка
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // Редактирование ведомости
  with tf_RasporNew.create(self) do
  Begin
    EditId:=q_title.FieldByName('ID').AsFloat;
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
procedure Tf_Raspor.acRasporCopyExecute(Sender: TObject);
begin
  inherited;
  // Проверка
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // Копирование документа
  with tf_RasporNew.create(self) do
  Begin
    EditId:=q_title.FieldByName('ID').AsFloat;
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
procedure Tf_Raspor.acRasporDelExecute(Sender: TObject);
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
  if Application.MessageBox(PChar('Удалить разрешение № '+q_titleNUM_NAR.AsString+' ?'),'Внимание!',MB_YESNO)=IDYES then
  Begin
    try
      q_Title.DisableControls;
      pkgFOR_RASPOR.CallProcedure('DelTitle',[1,q_Title.FieldByName('ID').AsFloat]);
      q_Title.Next;
    except
      on E:Exception do
      Begin
        f_main.ApplSession.WriteToLog(amFull,'RASPOR',sesError,E.Message,0,'');
      end;
    end;
    // Позиционируемся на следующий документ
    NextID:=q_Title.FieldByName('ID').AsFloat;
    f_db.ReQuery(q_Title,false);
    q_Title.Locate('ID',NextId,[]);
    q_Title.EnableControls;
  End;
end;

{ DONE -oPSV -cTitle_Query : ************************* Заголовки документов - Запрос q_title ************************* }

{ DONE -oPSV -cTitle_Query : Действия до открытия q_title }
procedure Tf_Raspor.q_titleBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  // Учитываем фильтр на форме
  q_title.SQL[5]:=' AND a.date_nar>=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date1.Date)+''',''dd.mm.yyyy'')';
  q_title.SQL[6]:=' AND a.date_nar<TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date2.Date)+''',''dd.mm.yyyy'')+1';
end;

{ DONE -oPSV -cTitle_Query : Действия после открытия q_title }
procedure Tf_Raspor.q_titleAfterOpen(DataSet: TDataSet);
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
procedure Tf_Raspor.q_titleAfterScroll(DataSet: TDataSet);
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
  tabRowsDetail.Caption:=' Позиции разрешения № '+q_title.FieldByName('NUM_NAR').AsString+' ';

  if NOT Active then exit;
  // Действия только в активной форме

end;

{ DONE -oPSV -cTitle_Query : Применить фильтр к запросу }
procedure Tf_Raspor.q_titleFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept:=f_db.AcceptFilterRecord(gridTitle,filter2title);
end;


{ DONE -oPSV -cTitle_Grid : ************************* Заголовки документов - GridTitle ************************* }

{ DONE -oPSV -cTitle_Grid : Значения столбца "№ п/п" (GridTitle)}
procedure Tf_Raspor.GridTitleColumns0GetCellParams(Sender: TObject;
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
procedure Tf_Raspor.GridTitleExit(Sender: TObject);
begin
  inherited;
  if q_title.Active and (q_title.State<>dsBrowse) then q_title.Post;
end;

{ DONE -oPSV -cTitle_Grid : Сортировка в GridTitle }
procedure Tf_Raspor.GridTitleSortMarkingChanged(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.SortInGrid(q_title,q_title.SQL.Count-1,GridTitle);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

{ TODO -oPSV -cTitle_Grid : Выделение активной строки }
procedure Tf_Raspor.GridTitleGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if (q_title.FieldByName('ID').AsString=q_rows.FieldByName('NARIAD_ID').AsString) then
  Begin
    AFont.Style:=[fsBold];
  End;
end;

{ DONE -oPSV -cTitle_Popup : ************************* Заголовки документов - Popup ************************* }

{ DONE -oPSV -cTitle_Popup : Строка ввода для фильтра }
procedure Tf_Raspor.tbTitleFilterEditAcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterAcceptText(gridTitle,filter2title,NewText,Accept);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

{ DONE -oPSV -cTitle_Popup : Фильтр по выделенному  }
procedure Tf_Raspor.tbTitleFilterSelectionClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCurrentValue(gridTitle,filter2title);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

{ DONE -oPSV -cTitle_Popup : Очистить фильтр  }
procedure Tf_Raspor.tbTitleFilterClearClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCLear(gridtitle,filter2title);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

{ DONE -oPSV -cTitle_Popup : Редактировать в окне }
procedure Tf_Raspor.tbTitleWinEditClick(Sender: TObject);
begin
  inherited;
  f_db.EditInMemo(gridTitle);
end;


{ DONE -oPSV -cRows_Actions : ************************* Позиции документов - События ************************* }

{ DONE -oPSV -cRows_Actions : Обновить q_rows }
procedure Tf_Raspor.bRefreshRowsClick(Sender: TObject);
begin
  inherited;
  // Фиксируем изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);
  // Обновляем запрос
  f_db.ReQuery(q_rows,true);
end;

{ DONE -oPSV -cRows_Actions : Удаление  позиции }
procedure Tf_Raspor.acRasporRowsDelExecute(Sender: TObject);
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
      pkgFOR_RASPOR.CallProcedure('DelRow',[1,q_Rows.FieldByName('ID').AsFloat]);
      q_Rows.Next;
    except
      on E:Exception do
      Begin
        f_main.ApplSession.WriteToLog(amFull,'RASPOR',sesError,E.Message,0,'');
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
procedure Tf_Raspor.acRowsPostExecute(Sender: TObject);
begin
  inherited;
  // Сохранить изменения
  GridTitleExit(Sender);
  GridRowsExit(Sender);
end;

{ DONE -oPSV -cRows_Actions : Отменить изменения в позиции и документе }
procedure Tf_Raspor.acRowsCancelExecute(Sender: TObject);
begin
  inherited;
  if q_title.Active and (q_title.State<>dsBrowse) then q_title.Cancel;
  if q_rows.Active and (q_rows.State<>dsBrowse) then q_rows.Cancel;
end;

{ DONE -oPSV -cRows_Query : ************************* Позиции документов - Запрос q_rows ************************* }

{ DONE -oPSV -cRows_Query : Применить фильтр к q_rows }
procedure Tf_Raspor.q_rowsFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept:=f_db.AcceptFilterRecord(gridRows,filter2rows);
end;

{ DONE -oPSV -cRows_Query : Действия после удаления из q_rows }
procedure Tf_Raspor.q_rowsAfterDelete(DataSet: TDataSet);
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
procedure Tf_Raspor.GridRowsExit(Sender: TObject);
begin
  inherited;
  if q_rows.Active and (q_rows.State<>dsBrowse) then q_rows.Post;
end;

{ DONE -oPSV -cRows_Grid : Сортировка записей в GridRows }
procedure Tf_Raspor.GridRowsSortMarkingChanged(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.SortInGrid(q_rows,q_rows.SQL.Count-1,GridRows);
  IsRefresh:=false;
end;



{ DONE -oPSV -cRows_Popup : ************************* Позиции документов - Popup ************************* }

{ DONE -oPSV -cRows_Popup : Применить фильтр (GridRows) }
procedure Tf_Raspor.tbRowsFilterEditAcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterAcceptText(gridRows,filter2rows,NewText,Accept);
  IsRefresh:=false;
end;

{ DONE -oPSV -cRows_Popup : Фильтр  по выделенному (GridRows) }
procedure Tf_Raspor.tbRowsFilterSelectionClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCurrentValue(gridRows,filter2rows);
  IsRefresh:=false;
end;

{ DONE -oPSV -cRows_Popup : Очистить фильтр (GridRows) }
procedure Tf_Raspor.tbRowsFilterClearClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCLear(gridRows,filter2rows);
  IsRefresh:=false;
end;

{ DONE -oPSV -cRows_Popup : Редактировать в окне (GridRows) }
procedure Tf_Raspor.tbRowsWinEditClick(Sender: TObject);
begin
  inherited;
  f_db.EditInMemo(gridRows);
end;



procedure Tf_Raspor.CheckDate(Sender: TObject);
begin
  inherited;
  if (DateOf(Date2.DateTime)<DateOf(Date1.DateTime)) then
    Date2.DateTime:=Date1.DateTime;
end;

end.
