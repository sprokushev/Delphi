unit azsEff;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, VCFI, AxCtrls, OleCtrls, VCF1, math,
  DBCtrls, Oracle, Mask, DB, OracleData, DBCtrlsEh, DBLookupEh, RxLookup,
  ToolEdit, Grids, DBGrids, ToolWin, DBGridEh, RXGrids, mdiform, ImgList,
  Menus, ActnList, XPStyleActnCtrls, ActnMan, TB2Dock, TB2Toolbar, TB2Item,
  TeeProcs, TeEngine, Chart, Series, GridsEh;

const month: array[1..12] of string = ('января', 'февраля', 'марта', 'апреля',
  'мая', 'июня', 'июля', 'августа', 'сентября', 'октября', 'ноября', 'декабря');

type graphDay=record
  DayName:  string; //полное название дня
  DayShort: string; //короткое название дня
  value:    integer;//объем продаж в этот день
  count:    integer;//счетчик для вычисления среднего арифметического
end;

type
  Tf_azsEff = class(Tf_MDIForm)
    Panel1: TPanel;
    StaticText1: TStaticText;
    OracleSession1: TOracleSession;
    azsListQ: TOracleDataSet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    mainQuery: TOracleDataSet;
    SaveDialog1: TSaveDialog;
    Panel2: TPanel;
    PaintBox1: TPaintBox;
    Panel3: TPanel;
    Splitter1: TSplitter;
    DBGridEh1: TDBGridEh;
    mainQueryS: TFloatField;
    mainQueryDAY: TStringField;
    mainQueryD: TStringField;
    mainQueryHO: TFloatField;
    ListRows: TOracleDataSet;
    ListRowsDAY: TStringField;
    ListRowsD: TStringField;
    ListRowsho1: TFloatField;
    ListRowsho2: TFloatField;
    ListRowsho3: TFloatField;
    ListRowsho4: TFloatField;
    ListRowsho5: TFloatField;
    ListRowsho6: TFloatField;
    ListRowsho9: TFloatField;
    ListRowsho10: TFloatField;
    ListRowsho11: TFloatField;
    ListRowsho14: TFloatField;
    ListRowsho16: TFloatField;
    ListRowsho18: TFloatField;
    ListRowsho19: TFloatField;
    ListRowsho20: TFloatField;
    ListRowsho21: TFloatField;
    ListRowsho22: TFloatField;
    ListRowsho23: TFloatField;
    ListRowsho24: TFloatField;
    ListRowsho7: TFloatField;
    ListRowsho8: TFloatField;
    ListRowsho12: TFloatField;
    ListRowsho13: TFloatField;
    ListRowsho17: TFloatField;
    ListRowsho15: TFloatField;
    ListRowstotal: TFloatField;
    ListRowsavgTotal: TFloatField;
    OracleLogon1: TOracleLogon;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    ActionManager1: TActionManager;
    acCalc: TAction;
    acAZStoXLS: TAction;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    GroupBox1: TGroupBox;
    StaticText2: TStaticText;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    StaticText3: TStaticText;
    RxDBLookupCombo1: TRxDBLookupCombo;
    StaticText4: TStaticText;
    ListRowsDAYN: TStringField;
    InitQ: TOracleQuery;
    ComboBox1: TComboBox;
    Label1: TLabel;
    azsListQAZS_NUMBER: TStringField;
    azsListQRN: TFloatField;
    buffer: TOracleSession;
    RadioGroup1: TRadioGroup;
    Label2: TLabel;
    OracleDataSet1: TOracleDataSet;
    ComboBox2: TComboBox;
    Chart1: TChart;
    decMinsQ: TOracleDataSet;
    Series1: TBarSeries;
    RxDBLookupCombo2: TRxDBLookupCombo;
    StaticText5: TStaticText;
    pbeListQ: TOracleDataSet;
    DataSource3: TDataSource;
    pbeListQRN: TFloatField;
    pbeListQBUNIT_MNEMO: TStringField;
    RadioGroup2: TRadioGroup;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    ListRowsazs: TStringField;
    azsINpbe: TOracleDataSet;
    azsINpbeRN: TFloatField;
    azsINpbeAZS_NUMBER: TStringField;
    mainQueryAZS: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure azsComboChange(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListRowsCalcFields(DataSet: TDataSet);
//    constructor create(Owner: TComponent); override;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure acCalcExecute(Sender: TObject);
    procedure acAZStoXLSExecute(Sender: TObject);
    procedure ListRowsBeforeOpen(DataSet: TDataSet);
    procedure mainQueryBeforeOpen(DataSet: TDataSet);
    procedure decMinsQBeforeOpen(DataSet: TDataSet);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure RxDBLookupCombo2Change(Sender: TObject);

  private
    graphDays:  TList;  //список graphDay, чтобы сдалать график по дням недели
    graphMode:  integer;  //что рисовать на графике
      //1 - по часам
      //2 - по дням недели
    excel:  variant;
    borderColor: TColor;
    maxY: integer;
    needDraw: boolean;  //необходимо рисовать график
    drawRow:  integer;  //строка, по которой надо строить график
    procedure GetStringRange(r1, c1, r2, c2: integer; var str1, str2: string);
    procedure xlDrawCell(r1, c1, r2, c2: integer; text:string; border: boolean);
    procedure xlDrawCell2(str1, str2: string; text:string; border: boolean);
    procedure DrawAxes(var x1, y1, x2, y2, step, stepY: integer);
    procedure DrawAxesForDays(var x1, y1, x2, y2, step, stepY: integer);
    procedure DrawForHours;
    procedure DrawForDays;
    function GetAzsIDFromReport(repID: integer): integer;
    procedure AlignCell(row, col, sc, ec: integer);
    procedure BorderRange(sr, sc, er, ec: integer);
    procedure BorderCell(row, col, l, t, r, b: integer);
    function FormatDate(str: string): string;
    procedure Select(sr, sc, er, ec: integer);
    procedure CreateHeader;
    procedure CreateFooter(row: integer);
    procedure CreateStatistic;
    function GetWaiting(wai: string):string;
    { Private declarations }
  public

  end;

var
  f_azsEff: Tf_azsEff;
  azs_list:string;
  azsRN_list:string;

implementation

uses ComObj, StrUtils;

{$R *.dfm}

procedure Tf_azsEff.Button1Click(Sender: TObject);
var
date:   string;
i, row:    integer;
text:   string;
begin


{
  F1Book1.SelStartCol := 1;
  F1Book1.SelStartRow := 1;
  F1Book1.SelEndCol := F1Book1.MaxCol;
  F1Book1.SelEndRow := F1Book1.MaxRow;
//  F1Book1.SetFont('New Times Roman Cyr', 12, false, false, false, false,
//    RGB(0, 0, 0), false, false);
  F1Book1.SetFont( 'Times New Roman Cyr', 12, false, false, false,
      false, clBlack, false, false );
  F1Book1.SelEndCol := 1;
  F1Book1.SelEndRow := 1;

  Createheader;

  F1Book1.SetFocus;

//заполняем данными
//запоминаем дату
  mainQuery.First;
  row := 4;
  while not mainQuery.Eof do begin
//заполняем строку нулями
    Select(row, 3, row, 28);
    F1Book1.SetAlignment( F1HAlignRight, true, F1VAlignCenter, 0);
    date := mainQuery.FieldValues['d'];
    F1Book1.TextRC[row, 1] := mainQuery.FieldValues['day'];
    F1Book1.TextRC[row, 2] := date;
//заполняем данными
    //пока не изменилась дата

    for i:=3 to 28 do
      F1Book1.NumberRC[row, i] := 0;

    while (mainQuery.FieldValues['d'] = date) and
      (not mainQuery.Eof)
     do begin
      F1Book1.NumberRC[row,
        StrToInt(mainQuery.FieldValues['ho']) + 2] :=
        mainQuery.FieldValues['s'];
      mainQuery.Next;
    end;
//проводим серенькую черту под строкой
    Select(row, 1, row + 1, 28);
    F1Book1.SetBorder(0, 0, 1, 0, 1, 0, rgb(200, 200, 200), rgb(200, 200, 200),
      rgb(200, 200, 200), rgb(200, 200, 200), rgb(200, 200, 200));

//вставляем формулы в конец строки
    F1Book1.FormulaRC[row, 27] := 'sum(c' + IntToStr(row) + ':z' + IntToStr(row) + ')';
    F1Book1.FormulaRC[row, 28] := 'round(aa' + intToStr(row) + '/24; 0)';
    Select(row, 27, row, 28);
    F1Book1.SetBorder( 1, 1, 1, 1, 1, 0, borderColor,
      borderColor, borderColor, borderColor, borderColor);

    Inc(row);
//    mainQuery.Next;
  end;

  Select(4, 1, row + 1, 2);
  F1Book1.SetBorder( 1, 0, 1, 0, 1, 0, 0, borderColor, borderColor,
    borderColor, rgb(200, 200, 200));

  F1Book1.TextRC[row, 1] := 'Итого за 1 час';
  F1Book1.TextRC[row + 1, 1] := 'Среднее значение';

  Select(row, 1, row + 1, 28);
  F1Book1.SetBorder(1, 1, 1, 1, 1, 0, 0, borderColor, borderColor,
    borderColor, borderColor);

//вставляем формулы в основание листа
  for i:=3 to 26 do begin
//    text :=
    F1Book1.FormulaRC[row, i] :=
    'sum(' +
      Chr(ord('a') + i - 1) + '3:' +
      Chr(ord('a') + i - 1) + intToStr(row - 1) + ')';
    F1Book1.FormulaRC[row + 1, i] :=
//    text :=
      'round(' + Chr(Ord('a') + i - 1) + IntToStr(row) + '/' +
      IntToStr(row - 4) + '; 0)';
  end;

  DrawRow := row + 1;

  F1Book1.SetRowHeight(1, 100, 370, false);
  select(1, 1, 1, 1);
}
//  needDraw := true;
//  paintBox1.Repaint;
//  Repaint;
end;

procedure Tf_azsEff.FormShow(Sender: TObject);
var
i:      integer;
begin
  ComboBox1.Text := '';
end;

procedure Tf_azsEff.azsComboChange(Sender: TObject);
begin
  ShowMessage('123');
end;

procedure Tf_azsEff.CreateHeader;
//создаем шапку для отчета
var
i:    integer;
dateStart, dateEnd: string;
begin
//  DBGridEh1.GetFooterValue(1, DBGridEh1.Columns[2] )
{  dateStart := DatetoStr(DateTimePicker1.DateTime);
  dateEnd := DatetoStr(DateTimePicker2.DateTime);

    ColWidth[1] := 5000;
    textRC[2, 1] := 'Дни недели';
    SetAlignment( F1HAlignCenter, true, F1VAlignCenter, 0);
    BorderRange(1, 1, 3, 1);

    Select(3, 1, 3, maxCol);
    SetAlignment( F1HAlignCenter, true, F1VAlignCenter, 0);
    BorderRange(1, 2, 3, 2); 
    

    textRC[2, 2] := 'Число';
    ColWidth[2] := 3000;
    textRC[1, 3] := 'Период проведения анализа с ' + FormatDate(dateStart) +
      ' по ' + FormatDate(dateEnd);

    textRC[2, 3] := '             Часы';

    //рамка для "периода"
    Select(1, 3, 1, 28);
    SetBorder( 1, 0, 0, 0, 0, 0, borderColor, borderColor,
      borderColor, borderColor, borderColor);

    Select(2, 3, 2, 26);
    SetBorder(1, 0, 0, 0, 0, 0, borderColor, borderColor,
      borderColor, borderColor, borderColor);

    //рамка для "итого
    Select(2, 27, 3, 27);
    SetBorder(1, 0, 0, 0, 0, 0, borderColor, borderColor,
      borderColor, borderColor, borderColor);
    TextRC[2, 27] := 'Итого';
    TextRC[3, 27] := 'за день';

    Select(2, 28, 3, 28);
    SetBorder(1, 0, 0, 0, 0, 0, borderColor, borderColor,
      borderColor, borderColor, borderColor);
    TextRC[2, 28] := 'Среднее';
    TextRC[3, 28] := 'значение';


//часы
    borderColor := RGB(0, 0, 0);
    for i:=1 to 24 do begin
      textRC[3, i + 2] := IntToStr(i);
      BorderCell(3, i + 2, 1, 1, 1, 1);
    end;

  end;
}
end;

procedure Tf_azsEff.Select(sr, sc, er, ec: integer);
begin
{  with F1Book1 do begin
    SelStartCol := sc;
    SelStartRow := sr;
    SelEndCol := ec;
    SelEndRow := er;
  end;}
end;

function Tf_azsEff.FormatDate(str: string): string;
//формитирует дату в нужный нам вид
var
res:  string;
m, e: integer;
begin
//  res := str;
  res := str[1] + str[2] + ' ';

  m := StrToInt(str[4] + str[5]);

  res := res + month[m] + ' ';
  res := res + str[7] + str[8] + str[9] + str[10] + 'г.';

  FormatDate := res;
end;

procedure Tf_azsEff.BorderCell(row, col, l, t, r, b: integer);
var
lc, tc, rc, bc: TColor;
begin
//  select(row, col, row, col);
//  F1Book1.SetBorder( 1, l, r, t, b,
//    borderColor, borderColor, borderColor, borderColor, borderColor, borderColor);
end;

procedure Tf_azsEff.BorderRange(sr, sc, er, ec: integer);
//окружает границей целый регион
var
i:  integer;
begin
//верхняя линия

//  select(sr, sc, er, ec);

//  F1Book1.SetBorder( 1, 0, 0, 0, 0,
//    borderColor, borderColor, borderColor, borderColor, borderColor, borderColor);
  
end;

procedure Tf_azsEff.CreateFooter(row: integer);
//делаем всякие ИТОГО
begin

end;

procedure Tf_azsEff.AlignCell(row, col, sc, ec: integer);
//растянуть ячейку по горизонтали так, чтобы она встала в центр межде sc и ec
var
text: string;
i, wT, ws: integer;
begin
//получаем текст сообщения
{  text := F1Book1.TextRC[row, col];
//посчитаем ширину, на которую нам надо растянуть
  WT := 0;
  for i:=sc to ec do
    wt := WT + F1Book1.ColWidth[i];


//определяем длину текущей строки
  select(row, col, row, col);
  ws := F1Book1.GetTextLen;

  ShowMessage('wt = ' + IntToStr(wt) + Chr(13) + Chr(10) +
    'ws=' + IntToStr(ws));
}
end;


function Tf_azsEff.GetAzsIDFromReport(repID: integer): integer;
//возвращает код азс по коду отчета
begin
end;

procedure Tf_azsEff.PaintBox1Paint(Sender: TObject);
begin
  if needDraw = false then
    exit;

  case graphMode of
  1:  DrawForHours;
  2:  DrawForDays;
  end;
end;

procedure Tf_azsEff.DrawAxes(var x1, y1, x2, y2, step, stepY: integer);
//возвращает шаг горизонтальной оси
var
w, h, i:  integer;
textV:    integer;
yx, dy: integer;
max:  integer;  //максимальное значени по оси Y
value:  integer;
begin
//определяем максимальное значение в стреднем значении
  max := 0;
  for i := 3 to 25 do begin
    if DBGridEh1.GetFooterValue(1, DBGridEh1.Columns[i]) <> '' then
      value := StrToInt(DBGridEh1.GetFooterValue(1, DBGridEh1.Columns[i]))
    else
      value := 0;
    if value > max then
      max := value;
  end;

//увеличим максимальное значени на 30% для красоты
  max := max + round((max/100)*30);

//вычисляем размеры под поле графика для шкалы
  with paintBox1.Canvas do begin
    pen.Color := RGB(0, 0, 0);
    yx := TextWidth(IntToStr(max)) + textheight('кг') + 20;
    x1 := yx;
    moveto(yx, 20);
    w := PaintBox1.Width - yx;
    x2 := w - 20 + yx;
    h := PaintBox1.Height - TextHeight('часы')*3;
    y1 := 20;
    y2 := h;

    dy := round(h/(max/1000));  //приращение y
    stepY := dy;

    lineto(yx,
      PaintBox1.Height - TextHeight('часы')*3);
    lineto(w - 20 + yx,
      PaintBox1.Height - TextHeight('часы')*3);
  //градуируем ось Y
    i := PaintBox1.Height - TextHeight('часы')*3 - dy;
    pen.Color := RGB(200, 200, 200);
    textV := 1000;
    while i>20 do begin
      moveto(yx - 3, i);
      lineto(w + yx - 20, i);
      TextOut(yx - TextWidth(IntToStr(textV)) - 4, i, IntToStr(textV));
      i := i - dy;
      textV := textV + 1000;
    end;
  //градуирвем ось X
    dy := round((w - 20)/25);
    i := yx;
    step := dy;
    pen.Color := RGB(150, 150, 150);
    textV := 1000;
    textV := 1;
    while i<w do begin
      moveto(i, PaintBox1.Height - TextHeight('часы')*3 + 1);
      lineto(i, PaintBox1.Height - TextHeight('часы')*3 + 5);
      TextOut(i + round(dy/2), PaintBox1.Height - TextHeight('часы')*3 + 7,
        IntToStr(textV));
      i := i + dy;
      textV := textV + 1;
    end;

  end;
end;

procedure Tf_azsEff.FormCreate(Sender: TObject);
begin
  graphMode := 1;
  needDraw := false;

  if OracleLogon1.Execute = false then begin
    release;
    exit;
  end;
  InitQ.Execute;  
  dateTimePicker1.Date := date - 1;
  dateTimePicker2.Date := date - 1;  
  azsListQ.Open;
  pbelistQ.Open;
end;

procedure Tf_azsEff.ListRowsCalcFields(DataSet: TDataSet);
var
res: Variant;
zap:  integer;
begin
    res := mainQuery.Lookup('azs;d;ho', VarArrayOf([ListRowsazs.AsVariant,ListRowsd.AsVariant, 1]), 's');
    if res = NULL then res := 0;
    ListRowsho1.Value := res;

    res := mainQuery.Lookup( 'azs;d;ho', VarArrayOf([ListRowsazs.AsVariant,ListRowsd.AsVariant, 2]), 's');
    if res = NULL then res := 0;
    ListRowsho2.Value := res;

    res := mainQuery.Lookup( 'azs;d;ho', VarArrayOf([ListRowsazs.AsVariant,ListRowsd.AsVariant, 3]), 's');
    if res = NULL then res := 0;
    ListRowsho3.Value := res;

    res := mainQuery.Lookup( 'azs;d;ho', VarArrayOf([ListRowsazs.AsVariant,ListRowsd.AsVariant, 4]), 's');
    if res = NULL then res := 0;
    ListRowsho4.Value := res;

    res := mainQuery.Lookup( 'azs;d;ho', VarArrayOf([ListRowsazs.AsVariant,ListRowsd.AsVariant, 5]), 's');
    if res = NULL then res := 0;
    ListRowsho5.Value := res;

    res := mainQuery.Lookup( 'azs;d;ho', VarArrayOf([ListRowsazs.AsVariant,ListRowsd.AsVariant, 6]), 's');
    if res = NULL then res := 0;
    ListRowsho6.Value := res;

    res := mainQuery.Lookup( 'azs;d;ho', VarArrayOf([ListRowsazs.AsVariant,ListRowsd.AsVariant, 7]), 's');
    if res = NULL then res := 0;
    ListRowsho7.Value := res;

    res := mainQuery.Lookup( 'azs;d;ho', VarArrayOf([ListRowsazs.AsVariant,ListRowsd.AsVariant, 8]), 's');
    if res = NULL then res := 0;
    ListRowsho8.Value := res;

    res := mainQuery.Lookup( 'azs;d;ho', VarArrayOf([ListRowsazs.AsVariant,ListRowsd.AsVariant, 9]), 's');
    if res = NULL then res := 0;
    ListRowsho9.Value := res;

    res := mainQuery.Lookup( 'azs;d;ho', VarArrayOf([ListRowsazs.AsVariant,ListRowsd.AsVariant, 10]), 's');
    if res = NULL then res := 0;
    ListRowsho10.Value := res;

    res := mainQuery.Lookup( 'azs;d;ho', VarArrayOf([ListRowsazs.AsVariant,ListRowsd.AsVariant, 11]), 's');
    if res = NULL then res := 0;
    ListRowsho11.Value := res;

    res := mainQuery.Lookup( 'azs;d;ho', VarArrayOf([ListRowsazs.AsVariant,ListRowsd.AsVariant, 12]), 's');
    if res = NULL then res := 0;
    ListRowsho12.Value := res;

    res := mainQuery.Lookup( 'azs;d;ho', VarArrayOf([ListRowsazs.AsVariant,ListRowsd.AsVariant, 13]), 's');
    if res = NULL then res := 0;
    ListRowsho13.Value := res;

    res := mainQuery.Lookup( 'azs;d;ho', VarArrayOf([ListRowsazs.AsVariant,ListRowsd.AsVariant, 14]), 's');
    if res = NULL then res := 0;
    ListRowsho14.Value := res;

    res := mainQuery.Lookup( 'azs;d;ho', VarArrayOf([ListRowsazs.AsVariant,ListRowsd.AsVariant, 15]), 's');
    if res = NULL then res := 0;
    ListRowsho15.Value := res;

    res := mainQuery.Lookup( 'azs;d;ho', VarArrayOf([ListRowsazs.AsVariant,ListRowsd.AsVariant, 16]), 's');
    if res = NULL then res := 0;
    ListRowsho16.Value := res;

    res := mainQuery.Lookup( 'azs;d;ho', VarArrayOf([ListRowsazs.AsVariant,ListRowsd.AsVariant, 17]), 's');
    if res = NULL then res := 0;
    ListRowsho17.Value := res;

    res := mainQuery.Lookup( 'azs;d;ho', VarArrayOf([ListRowsazs.AsVariant,ListRowsd.AsVariant, 18]), 's');
    if res = NULL then res := 0;
    ListRowsho18.Value := res;

    res := mainQuery.Lookup( 'azs;d;ho', VarArrayOf([ListRowsazs.AsVariant,ListRowsd.AsVariant, 19]), 's');
    if res = NULL then res := 0;
    ListRowsho19.Value := res;

    res := mainQuery.Lookup( 'azs;d;ho', VarArrayOf([ListRowsazs.AsVariant,ListRowsd.AsVariant, 20]), 's');
    if res = NULL then res := 0;
    ListRowsho20.Value := res;

    res := mainQuery.Lookup( 'azs;d;ho', VarArrayOf([ListRowsazs.AsVariant,ListRowsd.AsVariant, 21]), 's');
    if res = NULL then res := 0;
    ListRowsho21.Value := res;

    res := mainQuery.Lookup( 'azs;d;ho', VarArrayOf([ListRowsazs.AsVariant,ListRowsd.AsVariant, 22]), 's');
    if res = NULL then res := 0;
    ListRowsho22.Value := res;

    res := mainQuery.Lookup( 'azs;d;ho', VarArrayOf([ListRowsazs.AsVariant,ListRowsd.AsVariant, 23]), 's');
    if res = NULL then res := 0;
    ListRowsho23.Value := res;

    res := mainQuery.Lookup( 'azs;d;ho', VarArrayOf([ListRowsazs.AsVariant,ListRowsd.AsVariant, 24]), 's');
    if res = NULL then res := 0;
    ListRowsho24.Value := res;

    ListRowsTotal.Value := RoundTo(
      ListRowsho1.Value + ListRowsho2.Value + ListRowsho3.Value + ListRowsho4.Value +
      ListRowsho5.Value + ListRowsho6.Value + ListRowsho7.Value + ListRowsho8.Value +
      ListRowsho9.Value + ListRowsho10.Value + ListRowsho11.Value + ListRowsho12.Value +
      ListRowsho13.Value + ListRowsho14.Value + ListRowsho15.Value +
      ListRowsho16.Value + ListRowsho17.Value + ListRowsho18.Value +
      ListRowsho19.Value + ListRowsho20.Value + ListRowsho21.Value +
      ListRowsho22.Value + ListRowsho23.Value + ListRowsho24.Value, -2);

    ListRowsAvgTotal.Value := ListRowsTotal.Value/24;

    zap := 0;
    ListRowsHo1.Value := RoundTo(ListRowsHo1.Value, zap);
    ListRowsHo2.Value := RoundTo(ListRowsHo2.Value, zap);
    ListRowsHo3.Value := RoundTo(ListRowsHo3.Value, zap);
    ListRowsHo4.Value := RoundTo(ListRowsHo4.Value, zap);
    ListRowsHo5.Value := RoundTo(ListRowsHo5.Value, zap);
    ListRowsHo6.Value := RoundTo(ListRowsHo6.Value, zap);
    ListRowsHo7.Value := RoundTo(ListRowsHo7.Value, zap);
    ListRowsHo8.Value := RoundTo(ListRowsHo8.Value, zap);
    ListRowsHo9.Value := RoundTo(ListRowsHo9.Value, zap);
    ListRowsHo10.Value := RoundTo(ListRowsHo10.Value, zap);
    ListRowsHo11.Value := RoundTo(ListRowsHo11.Value, zap);
    ListRowsHo12.Value := RoundTo(ListRowsHo12.Value, zap);
    ListRowsHo13.Value := RoundTo(ListRowsHo13.Value, zap);
    ListRowsHo14.Value := RoundTo(ListRowsHo14.Value, zap);
    ListRowsHo15.Value := RoundTo(ListRowsHo15.Value, zap);
    ListRowsHo16.Value := RoundTo(ListRowsHo16.Value, zap);
    ListRowsHo17.Value := RoundTo(ListRowsHo17.Value, zap);
    ListRowsHo18.Value := RoundTo(ListRowsHo18.Value, zap);
    ListRowsHo19.Value := RoundTo(ListRowsHo19.Value, zap);
    ListRowsHo20.Value := RoundTo(ListRowsHo20.Value, zap);
    ListRowsHo21.Value := RoundTo(ListRowsHo21.Value, zap);
    ListRowsHo22.Value := RoundTo(ListRowsHo22.Value, zap);
    ListRowsHo23.Value := RoundTo(ListRowsHo23.Value, zap);
    ListRowsHo24.Value := RoundTo(ListRowsHo24.Value, zap);
end;

procedure Tf_azsEff.xlDrawCell(r1, c1, r2, c2: integer; text: string;
  border: boolean);
var
sheet:  variant;
str1, str2: string;
begin
  sheet := excel.workbooks[1].sheets[1];

  str1 := chr(ord('a') + c1 - 1) + IntToStr(r1);
  str2 := Chr(ord('a') + c2 - 1) + IntToStr(r2);

  sheet.range[str1, str2].merge;
  sheet.range[str1, str2] := text;
  sheet.range[str1, str2].HorizontalAlignment := $FFFFEFF4;
  sheet.range[str1, str2].VerticalAlignment := $FFFFEFF4;
  sheet.range[str1, str2].WrapText := true;
  sheet.range[str1, str2].font.size := 12;

  if border = true then begin
    //правая граница
    sheet.range[str1, str2].Borders[$FFFFEFC8].linestyle := 1;
    sheet.range[str1, str2].Borders[$FFFFEFC8].Weight := 2;
    sheet.range[str1, str2].Borders[$FFFFEFC8].colorindex := $FFFFEFF7;
    //левая
    sheet.range[str1, str2].Borders[$FFFFEFDD].linestyle := 1;
    sheet.range[str1, str2].Borders[$FFFFEFDD].Weight := 2;
    sheet.range[str1, str2].Borders[$FFFFEFDD].colorindex := $FFFFEFF7;
    //верхняя
    sheet.range[str1, str2].Borders[$FFFFEFC0].linestyle := 1;
    sheet.range[str1, str2].Borders[$FFFFEFC0].Weight := 2;
    sheet.range[str1, str2].Borders[$FFFFEFC0].colorindex := $FFFFEFF7;
    //нижняя
    sheet.range[str1, str2].Borders[$FFFFEFF5].linestyle := 1;
    sheet.range[str1, str2].Borders[$FFFFEFF5].Weight := 2;
    sheet.range[str1, str2].Borders[$FFFFEFF5].colorindex := $FFFFEFF7;
  end;

end;

procedure Tf_azsEff.GetStringRange(r1, c1, r2, c2: integer; var str1, str2: string);
var
dc1, dc2: char;
i:        integer;
begin
  str1 := '';
  str2 := '';
  i := + c1;
  while i>26 do begin
    str1 := str1 + Chr(ord('a') + round(c1/26));
    c1 := round(c1/26);
  end;

  dc1 := chr(round(ord('a')/26) + ord('a'));

  str1 := chr(ord('a') + c1 - 1) + IntToStr(r1);
  str2 := Chr(ord('a') + c2 - 1) + IntToStr(r2);
end;

procedure Tf_azsEff.xlDrawCell2(str1, str2, text: string; border: boolean);
var
sheet:  variant;
begin
  sheet := excel.workbooks[1].sheets[1];

  sheet.range[str1, str2].merge;
  sheet.range[str1, str2] := text;
  sheet.range[str1, str2].HorizontalAlignment := $FFFFEFF4;
  sheet.range[str1, str2].VerticalAlignment := $FFFFEFF4;
  sheet.range[str1, str2].WrapText := true;

  if border = true then begin
    //правая граница
    sheet.range[str1, str2].Borders[$FFFFEFC8].linestyle := 1;
    sheet.range[str1, str2].Borders[$FFFFEFC8].Weight := 2;
    sheet.range[str1, str2].Borders[$FFFFEFC8].colorindex := $FFFFEFF7;
    //левая
    sheet.range[str1, str2].Borders[$FFFFEFDD].linestyle := 1;
    sheet.range[str1, str2].Borders[$FFFFEFDD].Weight := 2;
    sheet.range[str1, str2].Borders[$FFFFEFDD].colorindex := $FFFFEFF7;
    //верхняя
    sheet.range[str1, str2].Borders[$FFFFEFC0].linestyle := 1;
    sheet.range[str1, str2].Borders[$FFFFEFC0].Weight := 2;
    sheet.range[str1, str2].Borders[$FFFFEFC0].colorindex := $FFFFEFF7;
    //нижняя
    sheet.range[str1, str2].Borders[$FFFFEFF5].linestyle := 1;
    sheet.range[str1, str2].Borders[$FFFFEFF5].Weight := 2;
    sheet.range[str1, str2].Borders[$FFFFEFF5].colorindex := $FFFFEFF7;
  end;

end;


procedure Tf_azsEff.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  azsListQ.Close;
  pbelistQ.Close;
  OracleSession1.Connected := false;
  Action := cafree;
end;

procedure Tf_azsEff.DrawForDays;
var
i:  integer;
h, w: integer;  //под размеры канвы
x1, y1, x2, y2, step, stepY: integer;
value:  integer;
x, y: integer;
curr: ^graphDay;
begin
//рисуем график
  with paintbox1.Canvas do begin
  //очищаем
    brush.Color := clWhite;
    FillRect(ClipRect);
    pen.Width := 1;
    DrawAxesForDays(x1, y1, x2, y2, step, stepY);

    //ставим первую точку
    curr := graphDays.Items[0];
    value := curr.value;
    moveTo(x1 + round(step/2), y2 - round(stepY*value/100));

    pen.Color := clBlack;
    pen.Width := 2;
    for i:=1 to 6 do begin
      curr := graphDays.Items[i];
      value := curr.value;
      x := x1 + round(step*i) + round(step/2);
      y := y2 - round(stepY*value/100);
      lineTo(x, y);
    end;

//рисуем ромбики
    pen.Width := 1;

    curr := graphDays.Items[0];
    value := curr.value;
    x := x1 + round(step/2);
    y := y2 - round(stepY*value/100);

    Polygon([
      Point(x, y - 4), Point(x + 3, y), Point(x, y + 4), Point(x - 3, y)
    ]);

    pen.Color := clBlack;
    brush.Color := clWhite;

    for i:=1 to 6 do begin
      curr := graphDays.Items[i];
      value := curr.value;

      x := x1 + round(step*i) + round(step/2);
      y := y2 - round(stepY*value/100);

      Polygon([
        Point(x, y - 4), Point(x + 3, y), Point(x, y + 4), Point(x - 3, y)
      ]);
    end;

  end;
end;


procedure Tf_azsEff.DrawForHours;
var
i:  integer;
h, w: integer;  //под размеры канвы
x1, y1, x2, y2, step, stepY: integer;
value:  integer;
x, y: integer;
begin
//рисуем график
  with paintbox1.Canvas do begin
  //очищаем
    brush.Color := clWhite;
    FillRect(ClipRect);
    pen.Width := 1;    
    DrawAxes(x1, y1, x2, y2, step, stepY);

    //ставим первую точку
    if DBGridEh1.GetFooterValue(1, DBGridEh1.Columns[2]) <> '' then
      value := StrToInt(DBGridEh1.GetFooterValue(1, DBGridEh1.Columns[2]))
    else
      value := 0;
    moveTo(x1 + round(step/2), y2 - round(stepY*value/1000));

    pen.Color := clBlack;
    pen.Width := 2;
    for i:=3 to 25 do begin
      if DBGridEh1.GetFooterValue(1, DBGridEh1.Columns[i]) <> '' then
        value := StrToint(DBGridEh1.GetFooterValue(1, DBGridEh1.Columns[i]))
      else
        value := 0;
      x := x1 + round(step*(i - 1)) - round(step/2);
      y := y2 - round(stepY*value/1000);
      lineTo(x, y);
    end;

//рисуем точки в виде ромбов
    pen.Width := 1;

    if DBGridEh1.GetFooterValue(1, DBGridEh1.Columns[2]) <> '' then
      value := StrToInt(DBGridEh1.GetFooterValue(1, DBGridEh1.Columns[2]))
    else
      value := 0;
    x := x1 - round(step/2) + step;
    y := y2 - round(stepY*value/1000);

    Polygon([
      Point(x, y - 4), Point(x + 3, y), Point(x, y + 4), Point(x - 3, y)
    ]);

    pen.Color := clBlack;
    brush.Color := clWhite;

    for i:=3 to 25 do begin
      if DBGridEh1.GetFooterValue(1, DBGridEh1.Columns[i]) <> '' then
        value := StrToint(DBGridEh1.GetFooterValue(1, DBGridEh1.Columns[i]))
      else
        value := 0;
      x := x1 + round(step*(i-1)) - round(step/2);
      y := y2 - round(stepY*value/1000);

      Polygon([
        Point(x, y - 4), Point(x + 3, y), Point(x, y + 4), Point(x - 3, y)
      ]);
    end;
  end;
end;

procedure Tf_azsEff.N1Click(Sender: TObject);
begin
  inherited;

  graphMode := 1;
  Paintbox1.Repaint;
end;

procedure Tf_azsEff.N2Click(Sender: TObject);
begin
  inherited;
  graphMode := 2;
  Paintbox1.Repaint;
end;


procedure Tf_azsEff.DrawAxesForDays(var x1, y1, x2, y2, step,
  stepY: integer);
//рисуем оси для графика по дням недели
var
w, h, i:  integer;
textV:    integer;
yx, dy: integer;
max:  integer;  //максимальное значени по оси Y
value:  integer;
oldPos: integer;
curr: ^graphDay;
s:  string;
begin
//определяем максимальное значение в стреднем значении
  max := 0;
  //запоминаем позицию в таблице
  oldPos := ListRows.RecNo;

  for i := 0 to 6 do begin
    if i >= graphDays.Count then break;
    curr := graphDays.Items[i];
    value := curr.value; //ListRows.FieldValues['avgTotal'];
    if value > max then
      max := value;
  end;

//увеличим максимальное значени на 20% для красоты
  max := max + round((max/100)*30);

//вычисляем размеры под поле графика для шкалы
  with paintBox1.Canvas do begin
    pen.Color := RGB(0, 0, 0);
    yx := TextWidth(IntToStr(max)) + textheight('кг') + 20;
    x1 := yx;
    moveto(yx, 20);
    w := PaintBox1.Width - yx;
    x2 := w - 20 + yx;
    h := PaintBox1.Height - TextHeight('часы')*3;
    y1 := 20;
    y2 := h;

    if max = 0 then
      max := 1;

    dy := round(h/(max/100));  //приращение y
    stepY := dy;

    lineto(yx,
      PaintBox1.Height - TextHeight('часы')*3);
    lineto(w - 20 + yx,
      PaintBox1.Height - TextHeight('часы')*3);

  //градуируем ось Y
    i := PaintBox1.Height - TextHeight('часы')*3 - dy;
    pen.Color := RGB(200, 200, 200);
    textV := 100;
    while i>20 do begin
      moveto(yx - 3, i);
      lineto(w + yx - 20, i);
      TextOut(yx - TextWidth(IntToStr(textV)) - 4, i,
        IntToStr(textV));
      i := i - dy;
      textV := textV + 100;
    end;
//    exit;
  //градуирвем ось X
    dy := round((w - 20)/7);
    i := yx;
    step := dy;
    pen.Color := RGB(150, 150, 150);
    textV := 0;
//    while i<w do begin
    for i:=0 to 6 do begin
      curr := graphDays.Items[textV];
      s := curr.DayShort;
      moveto(i*dy + yx, PaintBox1.Height - TextHeight('часы')*3 + 1);
      lineto(i*dy + yx, PaintBox1.Height - TextHeight('часы')*3 + 5);
      TextOut(i*dy + yx + round(dy/2), PaintBox1.Height - TextHeight('часы')*3 + 7,
        s);
//      i := i + dy;
      textV := textV + 1;
    end;
  end;
end;

procedure Tf_azsEff.CreateStatistic;
//создаем статистику по дням недели
const
//d1: array[0..6] of string=('понедельник',
//  'вторник', 'среда', 'четверг', 'пятница', 'суббота',
//  'воскресенье');
d2: array[0..6] of string =('Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс');
var
d1: array[0..6] of string;

newR, curr:   ^graphDay;
i:      integer;
d:      string;
begin
  if graphDays = nil then
    graphDays := TList.Create
  else
    graphDays.Clear;

//создаем шаблон для накопления статистика
  randomize;
  for i:=0 to 6 do begin
    new(newR);
    newR.DayName := d1[i];
    newR.DayShort := d2[i];
    newR.value := 0;
    newR.count := 0;
    graphDays.Add(newR);
  end;

  //деламем статистику
  ListRows.First;
  while not ListRows.Eof do begin
    //берем день недели
    d := ListRows.FieldValues['day'];
    //ищем его в списке
    for i:=0 to 6 do
      if d1[i] = d then break;

    i := ListRows.FieldValues['dayN'] - 1;

    if i<7 then begin
      curr := graphDays.Items[i];
      curr.value := curr.value + ListRows.FieldValues['avgTotal'];
      Inc(curr.count);
    end;

    ListRows.Next;
  end;

//вычислим среднее арифметическое
  for i:=0 to 6 do begin
    curr := graphDays.Items[i];
    if curr.count > 0 then
      curr.value := round(curr.value/curr.count);
  end;


  ListRows.First;
end;

procedure Tf_azsEff.acCalcExecute(Sender: TObject);
const a:array[0..5] of double = (0, 0.16, 0.33, 0.5, 0.66, 0.83);
var
newI: PInteger;
i:  integer;
dro, curr, prev: double;
begin
  if (RxDBLookupCombo1.Text = '') and (RxDBLookupCombo2.Text='') then begin
    ShowMessage('Выберите АЗС или ПБЕ');
    exit;
  end;

  if ComboBox1.Text = '' then begin
    ShowMessage('Выберите источник данных');
    ComboBox1.SetFocus;
    exit;
  end;
  azsRN_list:='';
  azs_list:='';
  if RxDBLookupCombo2.Text <> '' then
    begin
    azsinpbe.Close;
    azsinpbe.SetVariable(0,pbelistqrn.AsInteger);
    azsinpbe.Open;
    while not azsinpbe.Eof do
      begin
      azs_list:=azs_list+chr(39)+azsinpbeazs_number.AsString;
      if combobox2.Text='ФАСОВКА' then azs_list:=azs_list+'ф';
      azs_list:=azs_list+chr(39)+',';
      azsrn_list:=azsrn_list+azsinpbern.AsString+',';
      azsinpbe.Next;
      end;
      azs_list:=midstr(azs_list,1,length(azs_list)-1);
      azsrn_list:=midstr(azsrn_list,1,length(azsrn_list)-1);
    end;
  if (RxDBLookupCombo1.Text <> '') and ( RxDBLookupCombo1.Text <> 'BCE') then  //BCE - английскими буквами
    begin
    azs_list:=chr(39)+azslistqazs_number.AsString;
    if combobox2.Text='ФАСОВКА' then azs_list:=azs_list+'ф';
    azs_list:=azs_list+chr(39);
    azsrn_list:= azslistQrn.AsString;
    end;
  if RxDBLookupCombo1.Text = 'BCE'  then        //BCE - английскими буквами
    begin
    azslistq.First;
    while not azslistq.Eof do
      begin
      azs_list:=azs_list+chr(39)+azslistqazs_number.AsString;
      if combobox2.Text='ФАСОВКА' then azs_list:=azs_list+'ф';
      azs_list:=azs_list+chr(39)+',';
      azsrn_list:=azsrn_list+azslistqrn.AsString+',' ;
      azslistq.Next;
      end;
    azs_list:=midstr(azs_list,1,length(azs_list)-1);
    azsrn_list:=midstr(azsrn_list,1,length(azsrn_list)-1);
    end;


  mainQuery.Close;
  buffer.connected := false;
  buffer.LogonDatabase := 'BUH';
  buffer.LogonUsername := 'azsbuffer';
  buffer.LogonPassword := 'azsbuffer';
  buffer.connected := true;
//  mainQuery.SetVariable(0, DateTimePicker1.Date);
//  mainQuery.SetVariable(1, DateTimePicker2.Date);
//  mainQuery.SetVariable(2, azsListQ.FieldValues['rn']);
  mainQuery.Open;
//  mainQuery.SQL.SaveToFile('c:\tmp\mainQuery.sql');

  if mainQuery.RecordCount = 0 then begin
    ShowMessage('Данные по данной АЗС отсутствуют');
    exit;
  end;

  ListRows.Close;
  ListRows.Open;
//  ListRows.SQL.SaveToFile('c:\tmp\ListRows.sql');

  if mainQuery.RecordCount = 0 then begin
    ShowMessage('Для выбранных условий ' + Chr(13) + Chr(10) +
      'данные отсутствуют');
    exit;
  end;

  //составим список для графика по неделям
  CreateStatistic;

  chart1.SeriesList[0].Clear;
  decMinsQ.Close;
//  decMinsQ.SetVariable(0, DateTimePicker1.Date);
//  decMinsQ.SetVariable(1, DateTimePicker2.Date);
//  decMinsQ.SetVariable(2, azsListQ.FieldValues['azs_number']);
  decMinsQ.Open;
//  decMinsQ.SQL.SaveToFile('c:\tmp\decMinsQ.sql');

  i := 0;
  prev := 0;
  while not decMinsQ.eof do begin
    curr := StrToFloat(AnsiReplaceStr(decMinsQ.FieldValues['ho'], ':', DecimalSeparator));

    dro := curr - trunc(curr);

    curr := trunc(curr) + a[round(dro*10)];
    if radioGroup1.ItemIndex = 0 then
      chart1.seriesList[0].AddXY(curr, decMinsQ.FieldValues['s']);
    if  radioGroup1.ItemIndex = 1 then
      chart1.seriesList[0].AddXY(curr, decMinsQ.FieldValues['c']);
    if  radioGroup1.ItemIndex = 2 then
      chart1.seriesList[0].AddXY(curr, decMinsQ.FieldValues['m']);

    decMinsQ.next;
    Inc(i);
  end;

//  ShowMessage(IntToStr(i));

//  decMinsQ.Close;
  needDraw := true;
  Repaint;
  PaintBox1.Repaint;
end;

procedure Tf_azsEff.acAZStoXLSExecute(Sender: TObject);
label end1;
var
i, graphRow: integer;  //строка, по которой будет строиться график
sheet:  variant;
s:  string;
curr: ^graphDay;
waiting: string;
begin

  try
    excel := CreateOleObject('excel.application.8');
  except
    try
      excel := CreateOleObject('excel.application.9');
    except
      ShowMessage('Установите Microsoft Excel 97 или выше');
      exit;
    end;
  end;

  excel.workBooks.add;

  sheet := excel.workBooks[1]. sheets[1];

//сохраняем в Excel
  //создаем заголовок
  sheet.cells[2, 3] := 'Анализ интенсивности работы операторов ' + RxDBLookupCombo1.Text;
  xlDrawCell2('a3', 'a5', 'Дни недели', true);
  xlDrawCell(3, 2, 5, 2, 'Число', true);
  xlDrawCell2('c3', 'ab3', 'Период проведения анализа с ' +
    DateToStr(DateTimePicker1.Date) + ' по ' + DateToStr(DateTimePicker2.Date) + '.', true);
  xlDrawCell2('c4', 'z4', 'Часы', true);
  for i:=3 to 26 do
    xlDrawCell(5, i, 5, i, IntToStr(i - 2), true);
  xlDrawCell2('aa4', 'aa5', 'ИТОГО за день', true);
  xlDrawCell2('ab4', 'ab5', 'Среднее значение', true);

  sheet.Columns['A'].ColumnWidth := 15;
  sheet.columns['b'].ColumnWidth := 12;

  ListRows.First;
  graphRow := 6;
  while not ListRows.Eof do begin
    xlDrawCell(graphRow, 1, graphRow, 1, ListRows.FieldValues['day'], true);
    xlDrawCell(graphRow, 2, graphRow, 2, ListRows.FieldValues['d'], true);
    for i:= 2 to 25 do begin
      s := ListRows.Fields[i].Value;
      xlDrawCell(graphRow, i + 1, graphRow, i + 1, s, true);
    end;
    xlDrawCell2('aa' + IntToStr(graphRow), 'aa' + IntToStr(graphRow),
      IntToStr(ListRows.FieldValues['total']), true);
    xlDrawCell2('ab' + IntToStr(graphRow), 'ab' + IntToStr(graphRow),
      IntToStr(ListRows.FieldValues['avgTotal']), true);
    inc(graphRow);
    ListRows.Next;
  end;

//теперь итого по строкам
  xlDrawCell(graphRow, 1, graphRow, 2, 'ИТОГО за 1 час', true);
  for i:=2 to 25 do begin
    s := DBGridEh1.GetFooterValue(0, DBGridEh1.Columns[i]);
    if s = '' then s := '0';
    xlDrawCell(graphRow, i + 1, graphRow, i + 1, s, true);
  end;
  xlDrawCell2('aa' + IntToStr(graphRow), 'aa' + IntToStr(graphRow),
    DBGridEh1.GetFooterValue(0, DBGridEh1.Columns[26]), true);

  Inc(graphRow);
  xlDrawCell(graphRow, 1, graphRow, 2, 'Среднее значение', true);
  for i:=2 to 25 do begin
    s := DBGridEh1.GetFooterValue(1, DBGridEh1.Columns[i]);
    if s = '' then s := '0';
    xlDrawCell(graphRow, i + 1, graphRow, i + 1,
      s, true);
  end;
  xlDrawCell2('aa' + IntToStr(graphRow), 'aa' + IntToStr(graphRow),
    DBGridEh1.GetFooterValue(1, DBGridEh1.Columns[26]), true);

  sheet.Range['c6', 'z' + IntToStr(graphrow)].HorizontalAlignment := $FFFFEFC8;

  excel.workbooks[1].sheets[1].name := 'sheet1';

//добавляем график
  excel.charts.add;
  excel.activeChart.chartType :=  $00000041;
  excel.activeChart.location($00000002, 'sheet1');

  excel.activeChart.SetSourceData(
    excel.workBooks[1].sheets[1].range['c' + IntToStr(graphRow), 'z' + IntToStr(graphRow)],
    $00000001);

  excel.ActiveChart.HasTiTle := false;
  excel.ActiveChart.axes(1, 1).hasTitle := true;
  excel.ActiveChart.axes(1, 1).axisTitle.characters.text := 'часы';
  excel.ActiveChart.Haslegend := false;

  excel.ActiveChart.axes(2, 1).hasTitle := true;
  excel.ActiveChart.axes(2, 1).axisTitle.characters.text := 'кг';
  excel.ActiveChart.Haslegend := false;

  excel.workbooks[1].sheets[1].PageSetup.Orientation := 2;

//сохраним второй график
//вставим для него данные в невидимые ячейки
  for i:=0 to 6 do begin
    curr := graphDays.Items[i];
    xlDrawCell2('af' + IntToStr(i + 1), 'af' + IntToStr(i + 1),
      IntToStr(curr.value), false);
    xlDrawCell2('ae' + IntToStr(i + 1), 'ae' + IntToStr(i + 1),
      curr.DayShort, false);
  end;

  sheet.Range['ae1', 'af7'].font.colorindex := 2;

  excel.charts.add;
  excel.activeChart.chartType :=  $00000041;
  excel.activeChart.location($00000002, 'sheet1');
  excel.activeChart.SetSourceData(
    excel.workBooks[1].sheets[1].range['ae1', 'af7'],
    $00000002);
  excel.ActiveChart.HasTiTle := false;
  excel.ActiveChart.axes(1, 1).hasTitle := true;
  excel.ActiveChart.axes(1, 1).axisTitle.characters.text := 'дни недели';
  excel.ActiveChart.Haslegend := false;

  excel.ActiveChart.axes(2, 1).hasTitle := true;
  excel.ActiveChart.axes(2, 1).axisTitle.characters.text := 'кг';
  excel.ActiveChart.Haslegend := false;

//здесь сохраняем информацию по 10-минутным графикам.
  decMinsQ.First;

  i := 0;
  waiting := '00:0';
  while not decminsQ.Eof do begin
    if waiting <> DecMinsQ.FieldValues['ho'] then begin
      xlDrawCell2('ag' + IntToStr(i + 1), 'ag' + IntToStr(i + 1),
        waiting, false);
      xlDrawCell2('ah' + IntToStr(i + 1), 'ah' + IntToStr(i + 1),
        '0', false);
      waiting := GetWaiting(waiting);
      Inc(i);
      continue;
    end;
    xlDrawCell2('ag' + IntToStr(i + 1), 'ag' + IntToStr(i + 1),
      DecMinsQ.FieldValues['ho'] + '0', false);
    if radiogroup1.ItemIndex = 0 then
      xlDrawCell2('ah' + IntToStr(i + 1), 'ah' + IntToStr(i + 1),
        DecMinsQ.FieldValues['s'], false)
    else
      xlDrawCell2('ah' + IntToStr(i + 1), 'ah' + IntToStr(i + 1),
        DecMinsQ.FieldValues['c'], false);

    Inc(i);
    waiting := GetWaiting(waiting);
    decminsQ.Next;
  end;
//выводим график
  sheet.Range['ag1', 'ah' + IntToStr(i)].font.colorindex := 2;

  excel.charts.add;
  excel.activeChart.chartType :=  $00000033;
  excel.activeChart.location($00000002, 'sheet1');
  excel.activeChart.SetSourceData(
    excel.workBooks[1].sheets[1].range['ag1', 'ah' + IntToStr(i)],
    $00000002);
  excel.ActiveChart.HasTiTle := false;
  excel.ActiveChart.axes(1, 1).hasTitle := true;
  excel.ActiveChart.axes(1, 1).axisTitle.characters.text := 'время';
  excel.ActiveChart.Haslegend := false;

  excel.ActiveChart.axes(2, 1).hasTitle := true;
  excel.ActiveChart.axes(2, 1).axisTitle.characters.text := 'кг';
  excel.ActiveChart.Haslegend := false;

  excel.ActiveChart.ChartGroups(1).GapWidth := 0;
  excel.ActiveChart.Axes(1).Select;
//  excel.Selection.TickLabels.Orientation := $FFFFEFB5;
end1:
  excel.visible := true;
  excel := null;
end;

procedure Tf_azsEff.ListRowsBeforeOpen(DataSet: TDataSet);
begin
  inherited;

  if ComboBox1.text = 'Из Паруса' then begin
    with ListRows do begin
      Session := OracleSession1;
      SQL.Clear;
      SQL.Add('select /*+ INDEX(azsrepout I_AZSREPOUT_REP_DATE_I) */distinct to_char(rep_date, ''day'') as day,');
      SQL.Add('to_char(rep_date, ''dd.mm.yyyy'') as d,azsazslistmt.azs_number as azs, to_char(rep_date, ''D'') as dayN');
      SQL.Add('from azsrepout, azssreportmain,azsazslistmt');
      SQL.Add('where rep_date >= to_date(''' + DateToStr(DateTimePicker1.Date) + ''', ''dd.mm.yyyy'')');
      SQL.Add('and rep_date < to_date(''' + DateToStr(DateTimePicker2.Date+1) + ''', ''dd.mm.yyyy'')');
      SQL.Add('and azsrepout.company =2');
      SQL.add('and azsrepout.prn = azssreportmain.rn');
      SQL.add('and azssreportmain.azs_number = azsazslistmt.rn');
      SQL.Add('and azssreportmain.azs_number in( ' + azsrn_list+')');
      SQL.Add('order by azs,to_date(d, ''dd.mm.yyyy'')');
    end;
  end;

  if ComboBox1.text = 'Из Буфера' then begin
    ListRows.SQL.Clear;
    with ListRows do begin
      session := buffer;
      buffer.Connected := true;
//найти идешник АЗС
{      SQL.Add('select distinct to_char(rep_date, ''day'') as day,');
      SQL.Add('to_char(rep_date, ''dd.mm.yyyy'') as d, to_char(rep_date, ''D'') as dayN');
      SQL.Add('from azsrepout, files');
      SQL.Add('where rep_date >= to_date(''' + DateToStr(DateTimePicker1.Date) + ''', ''dd.mm.yyyy'')');
      SQL.Add('and rep_date <= to_date(''' + DateToStr(DateTimePicker2.Date) + ''', ''dd.mm.yyyy'')');
      SQL.Add('and azsrepout.prn = files.rn');
      SQL.Add('and files.azs = ''' + AzsListQ.FieldValues['azs_number'] + '''');
      SQL.Add('order by to_date(d, ''dd.mm.yyyy'')');}

    {  SQL.Add('select distinct to_char(rep_date, ''day'') as day, to_char(rep_date, ''dd.mm.yyyy'') as d, to_char(rep_date, ''D'') as dayN, trunc(rep_date) as d_ord');
      SQL.Add('from arh_azsrepout azsrepout, arh_files files');
      SQL.Add('where rep_date >= to_date(''' + DateToStr(DateTimePicker1.Date) + ''', ''dd.mm.yyyy'')');
      SQL.Add('  and rep_date < to_date(''' + DateToStr(DateTimePicker2.Date+1) + ''', ''dd.mm.yyyy'')');
      SQL.Add('  and rep_date < TO_DATE(''01.02.2006'',''dd.mm.yyyy'')');
      SQL.Add('  and azsrepout.prn = files.rn');
      SQL.Add('  and files.azs = ''' + AzsListQ.FieldValues['azs_number'] + '''');
      SQL.Add('union all');  }
      SQL.Add('select distinct azs_r as azs,to_char(date_r, ''day'') as day,to_char(date_r, ''dd.mm.yyyy'') as d,to_char(date_r, ''D'') as dayN, trunc(date_r) as d_ord');
      SQL.Add('from azs_r');
      SQL.Add('where date_r >= to_date(''' + DateToStr(DateTimePicker1.Date) + ''', ''dd.mm.yyyy'')');
      SQL.Add('  and date_r < to_date(''' + DateToStr(DateTimePicker2.Date+1) + ''', ''dd.mm.yyyy'')');
      {if RxDBLookupCombo1.Text<>'' then
      SQL.Add('  and azs_r = ''' + AzsListQ.FieldValues['azs_number'] + '''')
      else }
      SQL.Add(' and azs_r in( '+azs_list+')');
      SQL.Add('  and date_r >= TO_DATE(''01.02.2006'',''dd.mm.yyyy'')');
      SQL.Add('  and modepay_r >0');
      SQL.Add('  and fvol_r>0');
      SQL.Add('order by azs,d_ord');

    end;
  end;
//  ListRows.Close;
//  ListRows.SetVariable(0, DateToStr(DateTimePicker1.Date));
//  ListRows.SetVariable(1, DateToStr(DateTimePicker2.Date));
//  ListRows.SetVariable(2, azsListQrn.Value);

end;

procedure Tf_azsEff.decMinsQBeforeOpen(DataSet: TDataSet);
begin
  inherited;

  if ComboBox1.text = 'Из Паруса' then begin
    decMinsQ.SQL.Clear;
    with decMinsQ do begin
      Session := OracleSession1;

      SQL.Add('select sum(volume*pl) as s, count(rn) as c,  h as ho from');
      SQL.Add('(');
      SQL.Add('select /*+ INDEX(azsrepout I_AZSREPOUT_REP_DATE_I) */');
      SQL.Add('   azsrepout.rn,');
      SQL.Add('   volume,');
      SQL.Add('   substr(to_char(rep_date, ''HH24:MI''), 1, 4) as h, pl');
      SQL.Add('from azsrepout, azssreportmain, dicnomns dn');
      SQL.Add('where rep_date >= to_date(''' + DateToStr(DateTimePicker1.Date) + ''', ''dd.mm.yyyy'')');
      SQL.Add('and rep_date < to_date(''' + DateToStr(DateTimePicker2.Date+1) + ''', ''dd.mm.yyyy'')');
      SQL.Add('and azsrepout.company =2');
      SQL.Add('and azsrepout.prn = azssreportmain.rn and azsrepout.NOMEN=dn.rn');
      SQL.Add('and azssreportmain.azs_number in ( '+azsrn_list+')' );
      SQL.Add('and NLS_UPPER(dn.nomen_code) like ''' + ComboBox2.Text + '''');
      SQL.Add(')');
      SQL.Add('group by h order by h');
    end;
  end;

  if ComboBox1.text = 'Из Буфера' then begin
    decMinsQ.SQL.Clear;
    with decMinsQ do begin
      session := buffer;
      buffer.Connected := true;

{      SQL.Add('select sum(volume*pl) as s, count(rn) as c, h as ho from');
      SQL.Add('(');
      SQL.Add('select /*+ INDEX(azsrepout I_AZSREPOUT_REP_DATE_I) */');
      SQL.Add('   azsrepout.rn,');
      SQL.Add('		decode(scriptcode, 0, volume, 3, 0, 10, -volume, 11, -volume, volume/100) as volume,');
      SQL.Add('--to_char(rep_date, ''day'') as day, to_char(rep_date, ''dd.mm.yyyy'') as d,');
      SQL.Add('substr(to_char(rep_date, ''HH24:MI''), 1, 4) as h, pl');
      SQL.Add('from azsrepout, files');
      SQL.Add('where rep_date >= to_date(''' + DateToStr(DateTimePicker1.Date) + ''', ''dd.mm.yyyy'')');
      SQL.Add('and rep_date <= to_date(''' + DateToStr(DateTimePicker2.Date) + ''', ''dd.mm.yyyy'')');
      SQL.Add('and azsrepout.prn = files.rn');
      SQL.Add('and files.azs = ''' + AzsListQ.FieldValues['azs_number'] + '''');
      SQL.Add('');
      SQL.Add('and type <> ''F''');
      SQL.Add('and scriptcode <> 3');
      SQL.Add('and NLS_UPPER(snomen) like ''' + ComboBox2.Text + '''');
      SQL.Add(')');
      SQL.Add('group by h');}

      SQL.Add('select sum(volume*pl) as s, count(rn) as c,sum(sum) as m, h as ho');
      SQL.Add('from (');
      {SQL.Add('select /*+ INDEX(azsrepout I_AZSREPOUT_REP_DATE_I) */');
      SQL.Add('   azsrepout.rowid as rn,');
      SQL.Add('   decode(scriptcode, 0, volume, 3, 0, 10, -volume, 11, -volume, volume/100) as volume,');
      SQL.Add('   substr(to_char(rep_date, ''HH24:MI''), 1, 4) as h,');
      SQL.Add('   pl');
      SQL.Add('from arh_azsrepout azsrepout, arh_files files');
      SQL.Add('where rep_date >= to_date(''' + DateToStr(DateTimePicker1.Date) + ''', ''dd.mm.yyyy'')');
      SQL.Add('  and rep_date < to_date(''' + DateToStr(DateTimePicker2.Date+1) + ''', ''dd.mm.yyyy'')');
      SQL.Add('  and rep_date < TO_DATE(''01.02.2006'',''dd.mm.yyyy'')');
      SQL.Add('  and azsrepout.prn = files.rn');
      SQL.Add('  and files.azs = ''' + AzsListQ.FieldValues['azs_number'] + '''');
      SQL.Add('  and type <> ''F''');
      SQL.Add('  and scriptcode <> 3');
      SQL.Add('  and NLS_UPPER(snomen) like ''' + ComboBox2.Text + '''');
      SQL.Add('union all');}
      SQL.Add('select');
      SQL.Add('  rowid as rn,');
      SQL.Add('  summdisc_r as sum,');
      SQL.Add('  fvol_r as volume,');
      SQL.Add('  substr(to_char(date_r, ''HH24:MI''), 1, 4) as h,');
      SQL.Add('  pl_r as pl');
      SQL.Add('from azs_r');
      SQL.Add('where date_r >= to_date(''' + DateToStr(DateTimePicker1.Date) + ''', ''dd.mm.yyyy'')');
      SQL.Add('  and date_r < to_date(''' + DateToStr(DateTimePicker2.Date+1) + ''', ''dd.mm.yyyy'')');
      SQL.Add('  and date_r >= TO_DATE(''01.02.2006'',''dd.mm.yyyy'')');
      {if RxDBLookupCombo1.Text<>'' then
      SQL.Add('  and azs_r = ''' + AzsListQ.FieldValues['azs_number'] + '''')
      else}
      SQL.Add(' and azs_r in('+azs_list+')');
      SQL.Add('  and modepay_r >0');
      SQL.Add('  and fvol_r>0');
      if  RadioGroup2.ItemIndex = 0 then
      SQL.Add('    and fvol_r between '+edit1.Text+' and '+ edit2.Text)
      else
      SQL.Add('    and summdisc_r between '+edit1.Text+' and '+ edit2.Text);
      if   ComboBox2.Text<>'ФАСОВКА' then
      SQL.Add('  and NLS_UPPER(snomen_r) like ''' + ComboBox2.Text + '''');
      SQL.Add(')');
      SQL.Add('group by h order by h');

    end;
  end;

end;

procedure Tf_azsEff.mainQueryBeforeOpen(DataSet: TDataSet);
begin
  inherited;

  if ComboBox1.text = 'Из Паруса' then begin
    with mainQuery do begin
      Session := OracleSession1;
      SQL.Clear;
      SQL.Add('select azs,sum(volume*pl) as s, day, d, h + 1 as ho from');
      SQL.Add('(select /*+ INDEX(azsrepout I_AZSREPOUT_REP_DATE_I) */ azsazslistmt.azs_number as azs,volume,');
      SQL.Add('to_char(rep_date, ''day'') as day, to_char(rep_date, ''dd.mm.yyyy'') as d,');
      SQL.Add('to_char(rep_date, ''HH24'') as h, pl');
      SQL.Add('from azsrepout, azssreportmain, dicnomns dn,azsazslistmt');
      SQL.Add('where rep_date >= to_date(''' + DateToStr(DateTimePicker1.Date) + ''', ''dd.mm.yyyy'')');
      SQL.Add('and rep_date < to_date(''' + DateToStr(DateTimePicker2.Date+1) + ''', ''dd.mm.yyyy'')');
      SQL.Add('and azsrepout.company =2');
      SQL.Add('and azsrepout.prn = azssreportmain.rn and azsrepout.NOMEN=dn.rn');
      SQL.Add('and azssreportmain.azs_number=azsazslistmt.rn' );
      SQL.Add('and azssreportmain.azs_number in ('+azsrn_list+')' );
      SQL.Add('and NLS_UPPER(dn.nomen_code) like ''' + ComboBox2.Text + '''');
      SQL.Add(')');
      SQL.Add('group by azs,day, d, h');
      SQL.Add('order by to_date(d, ''dd.mm.yyyy''), h');
    end;
  end;

  if ComboBox1.text = 'Из Буфера' then begin
    MainQuery.SQL.Clear;
//    buffer.connected := false;
//    buffer.Connected := true;
    with MainQuery do begin
      session := buffer;
      if RadioGroup1.ItemIndex = 0 then
        SQL.Add('select azs as azs ,sum(volume*pl) as s, day, d, h + 1 as ho from');
      if RadioGroup1.ItemIndex = 1 then
        SQL.Add('select azs as azs , count(rn) as s, day, d, h + 1 as ho from');
       if RadioGroup1.ItemIndex = 2 then
       SQL.Add('select azs as azs , sum(sum) as s, day, d, h + 1 as ho from');


      SQL.Add('(');
     { SQL.Add('  select /*+ INDEX(azsrepout I_AZSREPOUT_REP_DATE_I) */');
      SQL.Add('    azsrepout.rowid as rn,');
      SQL.Add('    decode(scriptcode, 0, volume, 3, 0, 10, -volume, 11, -volume, volume/100) as volume,');
      SQL.Add('    to_char(rep_date, ''day'') as day,');
      SQL.Add('    to_char(rep_date, ''dd.mm.yyyy'') as d,');
      SQL.Add('    to_number(to_char(rep_date, ''HH24'')) as h,');
      SQL.Add('    pl,summ as sum');
      SQL.Add('  from arh_azsrepout azsrepout, arh_files files');
      SQL.Add('  where rep_date >= to_date(''' + DateToStr(DateTimePicker1.Date) + ''', ''dd.mm.yyyy'')');
      SQL.Add('    and rep_date < to_date(''' + DateToStr(DateTimePicker2.Date+1) + ''', ''dd.mm.yyyy'')');
      SQL.Add('    and rep_date < TO_DATE(''01.02.2006'',''dd.mm.yyyy'')');
      SQL.Add('    and azsrepout.prn = files.rn');
      SQL.Add('    and files.azs = ''' + AzsListQ.FieldValues['azs_number'] + '''');
      SQL.Add('    and type <> ''F''');
      SQL.Add('    and scriptcode <> 3');
      SQL.Add('    and NLS_UPPER(snomen) like ''' + ComboBox2.Text + '''');
      SQL.Add('  UNION ALL');   }
      SQL.Add('  select');
      SQL.Add('    rowid as rn,');
      SQL.Add('    azs_r as azs,');
      SQL.Add('	   fvol_r as volume,');
      SQL.Add('	   to_char(date_r, ''day'') as day,');
      SQL.Add('	   to_char(date_r, ''dd.mm.yyyy'') as d,');
      SQL.Add('	   to_number(to_char(date_r, ''HH24'')) as h,');      // было 'ho' !!!!
      SQL.Add('	   pl_r as pl, summdisc_r as sum');
      SQL.Add('  from azs_r');
      SQL.Add('  where date_r >= to_date(''' + DateToStr(DateTimePicker1.Date) + ''', ''dd.mm.yyyy'')');
      SQL.Add('    and date_r < to_date(''' + DateToStr(DateTimePicker2.Date+1) + ''', ''dd.mm.yyyy'')');
      SQL.Add('    and date_r >= TO_DATE(''01.02.2006'',''dd.mm.yyyy'')');
      {if RxDBLookupCombo1.Text<>'' then
      SQL.Add('  and azs_r = ''' + AzsListQ.FieldValues['azs_number'] + '''')
      else}
      SQL.Add(' and azs_r in( '+azs_list+')');
      SQL.Add('    and modepay_r >0');
      SQL.Add('    and fvol_r>0');
      if   ComboBox2.Text<>'ФАСОВКА' then
      SQL.Add('    and NLS_UPPER(snomen_r) like ''' + ComboBox2.Text + '''');
      if  RadioGroup2.ItemIndex = 0 then
      SQL.Add('    and fvol_r between '+edit1.Text+' and '+ edit2.Text)
      else
      SQL.Add('    and summdisc_r between '+edit1.Text+' and '+ edit2.Text);
      SQL.Add(')');
      SQL.Add('group by azs,day, d, h');
      SQL.Add('order by azs,to_date(d, ''dd.mm.yyyy''), h');
      
    end;
  end;

end;

function Tf_azsEff.GetWaiting(wai: string): string;
//выводит следующее ожидаемое значение
var
st: integer;
h, m: integer;
begin
  st := AnsiPos(':', wai);
  Result := wai;

  if st = 0 then begin
    exit;
  end;

  h := StrToInt(MidStr(wai, 1, st - 1));
  m := StrToInt(MidStr(wai, st + 1, 1));

  if m = 5 then begin
    h := h + 1;
    m := 0;
  end
  else
    m := m + 1;

  Result := IntToStr(h) + ':' + IntToStr(m);
  if h < 10 then
    Result := '0' + Result;
end;


procedure Tf_azsEff.RxDBLookupCombo1Change(Sender: TObject);
begin
  inherited;
if RxDBLookupCombo2.Text<>'' then
RxDBLookupCombo2.ClearValue;
end;

procedure Tf_azsEff.RxDBLookupCombo2Change(Sender: TObject);
begin
  inherited;
if RxDBLookupCombo1.Text<>'' then
RxDBLookupCombo1.ClearValue;
end;

end.
