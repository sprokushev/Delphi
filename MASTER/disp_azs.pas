unit disp_azs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, mdiform, TB2Item, TB2Dock, TB2Toolbar, Grids, ComCtrls, DBGridEh,
  Oracle, DB, OracleData, selectDep, StdCtrls, ExtCtrls, extGrid, strutils;

type rec = record //запись для хранения изменяемых пользователем строк
//таблицы
  ost: double;  //остаток на начало смены
  zaks: array[1..8] of double; //заказы на отгрузку
  zakP: array[1..8] of boolean;//true - взято из паруса. Инача, введено.
  rez:  array[1..8] of double;  //резервуарный парк
  avgOut: double;               //среднесуточная реализация
end;

type
  Tf_dispazs = class(Tf_MDIForm)
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    par: TOracleSession;
    ParLogon: TOracleLogon;
    mainDataQ: TOracleDataSet;
    DataSource1: TDataSource;
    PrognozGrid: TDBGridEh;
    mainDataQT: TStringField;
    mainDataQSDEP_READY: TStringField;
    mainDataQAZS_NUMBER: TStringField;
    mainDataQFirstColumn: TStringField;
    mainDataQNOMEN: TStringField;
    mainDataQzay1: TFloatField;
    mainDataQROWNUM: TFloatField;
    mainDataQnewOst: TFloatField;
    mainDataQB_VOLUME: TFloatField;
    mainDataQB_MASS: TFloatField;
    azsOutQ: TOracleDataSet;
    azsOutQSDEP_READY: TStringField;
    azsOutQSNUMB: TStringField;
    azsOutQNOMEN_CODE: TStringField;
    azsOutQSUM_V: TFloatField;
    azsOutQSUM_MAS: TFloatField;
    mainDataQavg_out_v: TFloatField;
    mainDataQLAST_REP_DATE: TDateTimeField;
    mainDataQd1_ost: TFloatField;
    mainDataQd1_free: TFloatField;
    mainDataQd1_days: TIntegerField;
    OracleDataSet1: TOracleDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure TBItem1Click(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure InputFieldKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure PrognozGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormDestroy(Sender: TObject);
    procedure PrognozGridTopLeftChanged(Sender: TObject);
    procedure PrognozGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure PrognozGridGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure mainDataQCalcFields(DataSet: TDataSet);
    function GetSpaceStr(w: integer): string;
    procedure mainDataQAfterOpen(DataSet: TDataSet);
  private
    list: TList;
    depName: string; //идентификатор филлиала
    grid: TExtGrid;
    st, en: TDateTime;
  public
    { Public declarations }
  end;

{var
  OldWindowProc: Pointer;
  f_dispazs: Tf_dispazs;}

implementation

{$R *.dfm}
function IsColReadOnly(col: integer): boolean;
begin
  Result := col in [0, 1];
end;

procedure Tf_dispazs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure Tf_dispazs.FormShow(Sender: TObject);
const dweek: array[1..7] of string =('воскресенье','понедельник','вторник', 'среда',
  'четверг','пятница','суббота');
var
f: Tf_selectDep;
start, i: integer;
str: string;
dStart: TDate;
begin
  inherited;
  if parLogon.Execute = false then begin
    Close;
    exit;
  end;

  if par.Connected = false then
    Close;

//выбираем филлиал
  f := Tf_selectDep.Create(nil);
  f.ShowModal;
  depName := f.dep.FieldValues['sdep_ready'];
  st := f.DateTimePicker1.Date;
  en := f.DateTimePicker2.Date;

  f.free;
  MainDataQ.Close;
  MainDataQ.SetVariable(0, depName);
  MainDataQ.Open;

//Оформляем шапку таблицы
  for i:=3 to 10 do begin
    str := PrognozGrid.Columns.Items[i].Title.Caption;
    start := AnsiPos('|', str);
    str := MidStr(str, 1, start) + DateToStr(Date - 5 + i) + Chr(13) + Chr(10) +
      '(' + dweek[DayOfWeek(Date - 5 + i)] + ')';
    PrognozGrid.Columns.Items[i].Title.Caption := str;
  end;

  dStart := Date;
  for i:=1 to 6 do begin
    str := DateToStr(dStart) + Chr(13) + Chr(10) +
      '(' + dweek[DayOfWeek(dStart)] + ')';
    PrognozGrid.Columns.Items[i*3 + 9].Title.Caption := str + '|Наличие продукта';
    PrognozGrid.Columns.Items[i*3 + 10].Title.Caption := str + '|Свободные емкости';
    PrognozGrid.Columns.Items[i*3 + 11].Title.Caption := str + '|Осталось дней';
    dStart := dStart + 1;
  end;

end;

procedure Tf_dispazs.TBItem1Click(Sender: TObject);
var
i: integer;
begin
  inherited;
  grid.Merge(0, 0, 1, 1);
{  if TBItem1.Checked = true then begin
    //скрываем заявки
    for i:=2 to 9 do prognoz.Columns[i].Width := 0;
    TBItem1.Caption := 'Показать заявки';
  end
  else begin
    //показываем заявки
    for i:=2 to 9 do DBGridEh1.Columns[i].Width := 100;
    TBItem1.Caption := 'Скрыть заявки';
  end;}
end;

procedure Tf_dispazs.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
//  BackGround := RGB(255, 200, 200); 
end;

procedure Tf_dispazs.InputFieldKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
//  ShowMessage(IntToStr(Ord(key)));
{  if Ord(key) = 27 then //Esc, просто выходим
    InputPanel.Visible := false;

  if Ord(key) = 13 then begin
    //сохраняем изменения
    InputPanel.Visible := false;
  end;}
end;


procedure Tf_dispazs.FormCreate(Sender: TObject);
begin
  inherited;
  list := TList.Create;
end;

procedure Tf_dispazs.PrognozGridDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  inherited;
  grid.DrawCell(aRow, aCol);
end;


procedure Tf_dispazs.FormDestroy(Sender: TObject);
begin
  inherited;
{  SetWindowLong(PrognozGrid.Handle,
                GWL_WNDPROC,
                LongInt(OldWindowProc));}
end;

procedure Tf_dispazs.PrognozGridTopLeftChanged(Sender: TObject);
begin
  inherited;
//  PrognozGrid.Repaint;
end;

procedure Tf_dispazs.PrognozGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
{  if (Column.field <> nil) and (Column.index = 0) then begin
    if (Column.Field.value <> '2') and (Column.Index = 0) then
      PrognozGrid.Canvas.Brush.Color := clSilver;
    if (Column.Field.value = '2') and (Column.Index = 0) then
            PrognozGrid.Canvas.Brush.Color := clWhite;
  end;

  if PrognozGrid.Columns[0].Field.value = '1' then
    PrognozGrid.Font.Style := PrognozGrid.Font.Style + [fsBold]
  else
    PrognozGrid.Font.Style := PrognozGrid.Font.Style - [fsBold];

  if PrognozGrid.Columns[0].Field.value = '4' then
    exit;

  PrognozGrid.Canvas.FillRect(rect);

//  else
//    PrognozGrid.Font.Style := PrognozGrid.Font.Style + [fsBold];

//  PrognozGrid.Font.Style := [];
  if Column.field <> nil then begin
    PrognozGrid.Canvas.TextOut(rect.left, rect.top, Column.Field.Value);
  end;         }
end;

procedure Tf_dispazs.PrognozGridGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if (PrognozGrid.Columns[0].Field.value = '1') or
    (PrognozGrid.Columns[0].Field.value = '3') then
    AFont.Style := PrognozGrid.Font.Style + [fsBold]
  else
    AFont.Style := PrognozGrid.Font.Style - [fsBold];

  if PrognozGrid.Columns[0].Field.value = '1' then
    BackGround := clSilver
  else
    BackGround := clWhite;

  if PrognozGrid.Columns[0].Field.value = '4' then
    AFont.Color := clWhite
  else
    AFont.Color := clBlack;

//  if PrognozGrid.Columns[0].Field.value = '2' then
//    PrognozGrid.Columns.Items[1].Alignment := taRightJustify
//    SetTextAlign(prognozGrid.Canvas.Handle, TA_CENTER)
//  else
//    SetTextAlign(prognozGrid.Canvas.Handle, TA_LEFT);
end;

procedure Tf_dispazs.mainDataQCalcFields(DataSet: TDataSet);
var
curr: ^rec;
begin
  inherited;
  case mainDataQT.AsInteger of
  1: mainDataQFirstColumn.Value := mainDataQAZS_NUMBER.AsString;
  2: begin
      mainDataQFirstColumn.Value := '     ' + mainDataQNOMEN.AsString;
      end;
  3: mainDataQFirstColumn.Value := 'Итого по ' + mainDataQAZS_NUMBER.AsString;
  4: mainDataQAZS_NUMBER.AsString := '';
  end;

//выцепляем из массива заявки
  if mainDataQRowNum.AsInteger > list.Count then //список не готов
    exit; //выходим

  if mainDataQT.value <> '2' then
    exit;

  curr := list.Items[MainDataQRowNum.AsInteger - 1];
  mainDataQzay1.Value := curr^.zaks[1];
  mainDataQnewOst.Value := curr^.ost;

//наличие НП
  mainDataQd1_ost.Value := curr^.ost;

  mainDataQavg_out_v.Value := curr^.avgOut;
end;

function Tf_dispazs.GetSpaceStr(w: integer): string;
//получис строку пробелов определенной ширины
begin
  Result := '';
  while PrognozGrid.Canvas.TextWidth(Result) < w do
    Result := Result + ' ';
end;

procedure Tf_dispazs.mainDataQAfterOpen(DataSet: TDataSet);
var
i: integer;
newR: ^rec;
begin
  inherited;
  PrognozGrid.Repaint;
//очищаем список, если полный
  for i:=0 to list.Count - 1 do begin
    newR := list.Items[i];
    dispose(newR);
  end;
  list.Clear;

  AzsOutQ.Close;
  AzsOutQ.SetVariable(0, st);
  AzsOutQ.SetVariable(1, en);
  AzsOutQ.SetVariable(2, depName);
  AzsOutQ.Open;

//начинаем заполнять список
  mainDataQ.First;
  while not mainDataQ.eof do begin
    new(newR);
    newR^.ost := mainDataQB_VOLUME.Value;
    for i := 1 to 8 do begin
      newR^.zaks[i] := 0;
      newR^.zakp[i] := true;
    end;
    //узнаем среднесуточную реализацию
    if AzsOutQ.Locate('snumb; nomen_code',
        VarArrayOf([mainDataQAZS_NUMBER.asString, mainDataQNOMEN.asString]),
        []) = true then
    begin//высчитываем среднюю реализацию
      newR^.avgOut := Round(azsOutQSUM_V.AsFloat/
        (mainDataQLAST_REP_DATE.value - st)*1000)/1000;
    end;

    list.add(newR);
    mainDataQ.Next;
  end;

  mainDataQ.First;
end;

end.
