unit plan_request;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, TB2Item, TB2Dock, TB2Toolbar, AxCtrls,
  OleCtrls, VCF1, comObj, excel2000, Oracle, DB, OracleData;

type
  Tf_LoadPlanRequest = class(TForm)
    Panel1: TPanel;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    Panel2: TPanel;
    OpenDlg: TOpenDialog;
    Grid: TStringGrid;
    Master: TOracleSession;
    TBItem3: TTBItem;
    data: TOracleQuery;
    findQ: TOracleQuery;
    procedure TBItem1Click(Sender: TObject);
    procedure GridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure TBItem2Click(Sender: TObject);
    procedure TBItem3Click(Sender: TObject);
  private
    { Private declarations }
  protected
    filename: string;
    excel:  Variant;  //сервер excelя
    sheet:  Variant;  //лист, с которого читаем
    errors: TList;    //список ячеек с ошибками (TPoint);
    DatePlan: TDateTime; // Плановый месяц
    procedure LoadSheet;
    function ReadRow(row: integer): integer;

    function FindZayavka(date_plan,store_name, input_number: Variant;
      input_date: variant;
      agent, uslopl, nomen: variant): boolean;
    procedure InsertZayavka(date_plan,store_name, input_number: variant;
      input_date: variant; agent, dogovor: variant;
      data_dog: variant; uslopl, nomen: variant; request, executed: variant);

    procedure UpdateZayavka(date_plan,store_name, input_number: variant;
      input_date: variant; agent, dogovor: variant;
      data_dog: variant; uslopl, nomen: variant; request, executed: variant);

    function GetCellAsString(aCol, aRow: integer): Variant;
    function GetCellAsFloat(aCol, aRow: integer): Variant;
    function GetCellAsDate(aCol, aRow: integer): Variant;
    function GetCellAsInteger(aCol, aRow: integer): Variant;
    procedure AddError(aCol, aRow: integer);
    function VarToQuery(v: variant):string;
  public

  end;

var
  f_LoadPlanRequest: Tf_LoadPlanRequest;

implementation

uses selectSheet, StrUtils, DateUtils, ForEnv, ForDB, main;

{$R *.dfm}

procedure Tf_LoadPlanRequest.LoadSheet;
var
i:  integer;
currRow:  integer;
emptyRow: integer;
s:  string;
begin
  Grid.RowCount := 2;

  emptyRow := 1;

//делаем гриду шапку
  Grid.ColWidths[0] := 80; Grid.Cells[0, 0] := 'Месяц';
  Grid.ColWidths[1] := 120; Grid.Cells[1, 0] := 'Нефтебаза';
  Grid.ColWidths[2] := 40; Grid.Cells[2, 0] := '№' + Chr(13) + Chr(10) + 'заявки';
  Grid.ColWidths[3] := 80; Grid.Cells[3, 0] := 'Дата заявки';
  Grid.ColWidths[4] := 200; Grid.Cells[4, 0] := 'Контрагент';
{  Grid.ColWidths[5] := 150; Grid.Cells[5, 0] := 'Договор';
  Grid.ColWidths[6] := 80; Grid.Cells[6, 0] := 'Дата' + Chr(13) + Chr(10) + 'договора';}
  Grid.ColWidths[5] := 100; Grid.Cells[5, 0] := 'Вид оплаты';
  Grid.Cells[6, 0] := 'Продукт';
  Grid.Cells[7, 0] := 'Объем,' + Chr(13) + Chr(10) + 'т.';
  Grid.Cells[8, 0] := 'Исполнение' + Chr(13) + Chr(10) + 'т.';

  Grid.RowHeights[0] := 35;

//бежим по первому столбцу и ищем непустую ячейку
  currRow := 1;
  while emptyRow < 50 do begin
    s := VarToStr(sheet.Cells[currRow, 1]);
    if s <> '' then begin //нашли непустую ячейку - стопудов шапка
      inc(currRow); //переходим к следующей строке
      break;        //начинаем заниматься более серьезными делами
    end;
    inc(currRow);
  end;

  currRow := ReadRow(currRow);
  while currRow <> -1 do begin
    currRow := ReadRow(currRow);
  end;

  Grid.RowCount := Grid.RowCount - 1;
end;

function Tf_LoadPlanRequest.ReadRow(row: integer): integer;
//читаем строку и заполняем грид на форме. Если строка пустаю, то возвращаем -1
var
currRow, i:  integer;
vals: array[1..10] of string;
f:  boolean;
s:  string;
begin
  currRow := row;

//читаем строку с листа
  for i:=1 to 10 do begin
    s := VarToStr(sheet.Cells[currRow, i]);
    vals[i] := s;
  end;

//проверяем, не пустая ли
  f := false;
  for i:=1 to 10 do
    if vals[i] <> '' then
      f := true;

  if f = false then begin
    Result := -1;
    exit;
  end;

//расширяем грид на 1
  Grid.RowCount := Grid.RowCount + 1;
  currRow := Grid.RowCount - 1;
//заполняем грид значениями
  for i:=1 to 10 do begin
    Grid.Cells[i, currRow - 1] := vals[i];
  end;
  Grid.Cells[0, currRow - 1] := FormatDateTime('dd.mm.yyyy',DatePlan);

  Result := row + 1;
end;

procedure Tf_LoadPlanRequest.TBItem1Click(Sender: TObject);
var
i, count:  integer;
begin
  OpenDlg.InitialDir:=F_main.GetApplVari('LOAD_ARH_REQ_DIR');
  if OpenDlg.Execute = false then
    exit;
  F_main.SetApplVari('LOAD_ARH_REQ_DIR',ExtractFilePath(OpenDlg.FileName));
  filename := OpenDlg.FileName;


//присоединяемся к Excelю
//  try
//    excel :=GetActiveOleObject('Excel.Application');
//  except
    excel := CreateOleObject('Excel.Application');
//  end;

//определяем список листов
  excel.workBooks.open(fileName);

  count := excel.workBooks[excel.workbooks.count].workSheets.count;

  f_selectSheet:=Tf_selectSheet.Create(Self);
  f_selectSheet.cbList.items.clear;

  for i:=1 to count do
    f_selectSheet.cbList.Items.Add(Excel.Workbooks[excel.workbooks.count].WorkSheets[i].Name);

  if f_selectSheet.ShowModal = mrCancel then begin
    exit;
  end;

  DatePlan:=f_selectSheet.edDatePlan.Date;

//качаем данные с выбранного листа
  sheet := excel.WorkBooks[excel.WorkBooks.count].sheets[f_selectSheet.cbList.ItemIndex + 1];
  LoadSheet;
  f_selectSheet.Free;
end;

procedure Tf_LoadPlanRequest.GridDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
backCol: TColor;
i, x, y: integer;
flag: Cardinal;
p:  ^TPoint;
begin
  if gdSelected in state then begin
    Grid.Canvas.Brush.Color := clNavy;
    SetTextColor(Grid.Canvas.Handle, clWhite);
    Grid.Canvas.FillRect(Rect);
  end
  else begin
    Grid.Canvas.Brush.Color := clWindow;
    SetTextColor(Grid.Canvas.Handle, clBlack);
    Grid.Canvas.FillRect(Rect);
  end;

//определим, нет ли в этой ячейке ошибки
  for i := 0 to errors.Count - 1 do begin
    p := errors.Items[i];
    if (p^.X = aCol) and (p^.Y = aRow) then begin
      Grid.Canvas.Brush.Color := clRed;
      Grid.Canvas.FillRect(Rect);
      break;
    end;
  end;

//  if gdFocused in state then
//    Grid.Canvas.Font.Style := Grid.Canvas.Font.Style + [fsBold]
//  else
//    Grid.Canvas.Font.Style := Grid.Canvas.Font.Style - [fsBold];

  if aRow > 0 then begin //если это не заголовок, то прост
    SetTextAlign(Grid.Canvas.Handle, TA_LEFT);
    x := rect.Left + 2;
    y := rect.Top;
    case aCol of  //определим выравнивание текста
    1,2,5:  begin
          SetTextAlign(Grid.Canvas.Handle, TA_CENTER);
          x := Round(rect.Left/2 + rect.Right/2);
//          y := rect.Top;
        end;
    8,9:  begin
          SetTextAlign(Grid.Canvas.Handle, TA_RIGHT);
          x := rect.Right - 2;
//          y := rect.Top;
        end;
    end;
    Grid.Canvas.TextOut(x, y, Grid.Cells[aCol, aRow]);
  end;

  if aRow = 0 then begin  //рисуем заголовок
    Grid.Canvas.Brush.Color := clBtnFace;
    Grid.Canvas.FillRect(rect);
    Grid.Canvas.Font.Color := clBlack;
    flag := DT_CENTER or DT_VCENTER;
    if AnsiContainsText(Grid.Cells[aCol, aRow], Chr(13) + Chr(10)) = false then begin
      //если несколько строк, то пересчитываем флаги
      flag := flag or DT_SINGLELINE;
    end;
    DrawText( Grid.Canvas.Handle,
      PChar(Grid.Cells[aCol, aRow]), Length(Grid.Cells[aCol, aRow]),
      rect, flag);
  end;
end;

procedure Tf_LoadPlanRequest.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    excel.WorkBooks[excel.WorkBooks.count].close; //закрываем нашу книгу
    if excel.WorkBooks.count = 0 then //если открытых книг больше нет, то закрываем excel
      excel.quit;
  except
    exit;
  end;
end;

procedure Tf_LoadPlanRequest.FormCreate(Sender: TObject);
begin
  f_db.LogonMasterSession(Master);
  errors := TList.Create;
  excel := null;
end;

procedure Tf_LoadPlanRequest.TBItem2Click(Sender: TObject);
//загружаем в Master
var
i:  integer;
//необходимые данные
date_plan, store_name, input_number: variant;
input_date: variant;
agent, dogovor: variant;
data_dog: variant;
nomen: variant;
uslopl,request, executed: variant;
begin
{  data.Close;
  data.SQL.Clear;
  data.SQL.Add('delete from month_all_tmp');
  data.Execute;}

  for i := 1 to Grid.RowCount - 1 do
  begin
    Grid.Row := i;

    date_plan := GetCellAsDate(0, i);
    if date_plan=null then date_plan:=DatePlan;

    Store_name := AnsiUpperCase(GetCellAsString(1, i));
    if Store_name='' then Store_name:='?';

    input_number := AnsiUpperCase(GetCellAsString(2, i));
    if input_number='' then input_number:='б/н';

    input_date := GetCellAsDate(3, i);
    if input_date=null then input_date:=Now;

    agent := AnsiUpperCase(GetCellAsString(4, i));
    if agent='' then agent:='?';

    {    dogovor := AnsiUpperCase(GetCellAsString(4, i));
    if dogovor='' then }
    dogovor:='?';
    {data_dog := GetCellAsDate(5, i);}
    data_dog:=null;

    uslopl := AnsiUpperCase(Trim(GetCellAsString(5, i)));
    if uslopl='' then uslopl:='0'
    else if System.Copy(uslopl,1,8)='ОТСРОЧКА' then uslopl:='40'
         else if System.Copy(uslopl,1,10)='ПРЕДОПЛАТА' then uslopl:='1'
              else if System.Copy(uslopl,1,11)='ВЗАИМОЗАЧЕТ' then uslopl:='17'
                   else uslopl:='0';
    nomen := AnsiUpperCase(GetCellAsString(6, i));
    if nomen='' then nomen:='?';

    request := GetCellAsString(7, i);
    if request='' then request:='0';

    executed := GetCellAsString(8, i);
    if executed='' then executed:='0';

    if FindZayavka(date_plan,store_name, input_number, input_date, agent, uslopl, nomen) = false then
      try
        InsertZayavka(date_plan,VarToStr(store_name), input_number, input_date, agent,
          dogovor, data_dog, uslopl, nomen, request, executed)
      except
      end
    else
      UpdateZayavka(date_plan,VarToStr(store_name), input_number, input_date, agent,
          dogovor, data_dog, uslopl, nomen, request, executed);
  end;

  master.Commit;
//  ShowMessage('Готово!');
  close;
end;

procedure Tf_LoadPlanRequest.InsertZayavka(date_plan,store_name,
  input_number: variant; input_date: variant; agent, dogovor: variant;
  data_dog: variant; uslopl:variant; nomen: variant; request, executed: variant);
//внести заявку в Парус
var
p:  PVarData;
s:  string;
begin
  data.Close;
  data.SQL.Clear;

  data.SQL.Add('insert into month_all(store_name, input_number, request,');
  data.SQL.Add('date_plan, input_date, poluch_name, parus_agent_name, parus_dogovor, ' +
    'date_dog, usl_opl_id, parus_nomen_rn, parus_nomen_tag, parus_nomen_name, '+
    'parus_modif_rn, parus_modif_tag, parus_modif_name, executed, parus_rn, orgstru_id, payForm_ID, price, load_abbr) ');
  data.SQL.Add('values(' + VarToQuery(store_name) + ', ' +
    VarToQuery(input_number) + ', ' +
    VarToStr(request) + ', ' +
    VarToQuery(date_plan) + ', ' +
    VarToQuery(input_date) + ',' +
    VarToQuery(agent) + ', ' +
    VarToQuery(agent) + ', ' +
    VarToQuery(dogovor) + ', ' +
    VarToQuery(data_dog) + ', ' +
    uslopl+ ', ' +
    '0, ' +
    VarToQuery(nomen) + ', ' +
    VarToQuery(nomen) + ', ' +
    '0, '+
    VarToQuery(nomen) + ', ' +
    VarToQuery(nomen) + ', ' +
    VarToStr(executed) + ', 1, 40, 10, 0, ''САМ'' ' +
    ' )');
{  data.SQL.SaveToFile('c:\tmp\1.sql');}
  data.Execute;
end;

function Tf_LoadPlanRequest.GetCellAsDate(aCol, aRow: integer): Variant;
var s:string;
begin
  ShortDateFormat := 'dd.mm.yyyy';
  try
    s:=Grid.Cells[aCol, aRow];
    Result := StrToDate(s);
  except
    Result := null;
  end;
end;

function Tf_LoadPlanRequest.GetCellAsFloat(aCol, aRow: integer): Variant;
var
s:  string;
begin
  //разберемся с возможным разделителем дробной части
  s := Grid.Cells[aCol, aRow];
  s := AnsiReplaceStr(s, '.', DecimalSeparator);
  s := AnsiReplaceStr(s, ',', DecimalSeparator);
  try
    Result := StrToFloat(s);
  except
    Result := null;
  end;
end;

function Tf_LoadPlanRequest.GetCellAsInteger(aCol, aRow: integer): Variant;
begin
  try
    Result := StrToInt(Grid.Cells[aCol, aRow]);
  except
    Result := null;
  end;
end;

function Tf_LoadPlanRequest.GetCellAsString(aCol, aRow: integer): Variant;
begin
  try
    Result := Grid.Cells[aCol, aRow];
  except
    Result := NULL;
  end;
end;

procedure Tf_LoadPlanRequest.TBItem3Click(Sender: TObject);
//тестируем данные
var
i, j:  integer;
p:  ^TPoint;
begin
//очистим список ошибок
  for i := 0 to errors.Count - 1 do begin
    p := errors.Items[i];
    dispose(p);
  end;
  errors.Clear;

//бежим по всей таблице
  for i:=1 to Grid.RowCount - 1 do begin
    Grid.Row := i;
    if GetCellAsString(0, i) = null then AddError(0, i);
    if GetCellAsString(1, i) = null then AddError(1, i);
    if GetCellAsDate(2, i) = null then AddError(2, i);
    if GetCellAsString(3, i) = null then AddError(3, i);
    if GetCellAsString(4, i) = null then AddError(4, i);
    if GetCellAsDate(5, i) = null then AddError(5, i);
    if GetCellAsString(6, i) = null then AddError(6, i);
    if GetCellAsString(7, i) = null then AddError(7, i);
    if GetCellAsFloat(8, i) = null then AddError(8, i);
    if GetCellAsFloat(9, i) = null then AddError(9, i);
  end;
end;

procedure Tf_LoadPlanRequest.AddError(aCol, aRow: integer);
//добавляем новую ошибку в список
var
p:  ^TPoint;
begin
  new(p);
  p^.X := aCol;
  p^.Y := aRow;
  errors.Add(p);
end;

function Tf_LoadPlanRequest.VarToQuery(v: variant): string;
//преобразует тип variant в строку пригодную для вставки в текст запроса
var
p:  PVarData;
begin
  p := FindVarData(v);
  case p^.VType of
  varNull:    Result := 'null';
  varInteger: Result := IntToStr(v);
  varString:  Result := '''' + VarToStr(v) + '''';
  varDouble:  Result := FloatToStr(p^.VDouble);
  varDate:    Result := 'TO_DATE(''' + FormatDateTime('dd.mm.yyyy',VarToDateTime(v)) + ''',''dd.mm.yyyy'')';
  end;
end;

function Tf_LoadPlanRequest.FindZayavka(date_plan,store_name, input_number: variant;
  input_date: variant; agent, uslopl, nomen: variant): boolean;
//ищем заявку с данными характеристиками + parus_rn = 1
begin
  Result := false;
  with FindQ do
  try
{    SetVariable(0, store_name);}
    Setvariable(0, input_number);
    SetVariable(1, input_date);
    SetVariable(2, agent);
    SetVariable(3, agent);
    SetVariable(4, nomen);
{    SetVariable(6, StrToInt(uslopl));}
    SetVariable(5, date_plan);
    Execute;
    if RowCount > 0 then
      Result := true;
  except
  end;
end;

procedure Tf_LoadPlanRequest.UpdateZayavka(date_plan,store_name, input_number,
  input_date, agent, dogovor, data_dog, uslopl, nomen, request, executed: variant);
var
p:  PVarData;
s:  string;
begin

  data.Close;
  data.SQL.Clear;

  data.SQL.Add('update month_all set ');
  data.SQL.Add('store_name = ' + VarToQuery(store_name) + ', ');
  data.SQL.Add('usl_opl_id = ' + uslopl + ', ');
  data.SQL.Add('executed = ' + VarToStr(executed) + ', ');
  data.SQL.Add('request = ' + VarToStr(request));

  data.SQL.Add('where input_number = ' + VarToQuery(input_number));
  data.SQL.Add('and input_date = ' +  VarToQuery(input_date));
  data.SQL.Add('and date_plan = ' +  VarToQuery(date_plan));
  data.SQL.Add('and poluch_name = ' + VarToQuery(agent));
  data.SQL.Add('and parus_agent_name = ' + VarToQuery(agent));
  data.SQL.Add('and parus_nomen_name = ' + VarToQuery(nomen));
  data.SQL.Add('and parus_rn = 1');
  data.Execute;
end;

end.

