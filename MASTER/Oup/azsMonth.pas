unit azsmonth;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask, ToolEdit, TB2Item, TB2Dock, TB2Toolbar,
  ExtCtrls, Grids, DBGridEh, Oracle, DB, OracleData, ComObj;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    StaticText2: TStaticText;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    StaticText3: TStaticText;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    Oracle: TOracleSession;
    OracleLogon1: TOracleLogon;
    data: TOracleDataSet;
    DataSource1: TDataSource;
    dataAZS_NAME: TStringField;
    dataM1: TFloatField;
    dataM2: TFloatField;
    dataM3: TFloatField;
    dataM4: TFloatField;
    dataM5: TFloatField;
    dataM6: TFloatField;
    dataM7: TFloatField;
    dataM8: TFloatField;
    dataM9: TFloatField;
    dataM10: TFloatField;
    dataM11: TFloatField;
    dataM12: TFloatField;
    dataM13: TFloatField;
    dataM14: TFloatField;
    dataM15: TFloatField;
    dataM16: TFloatField;
    dataM17: TFloatField;
    dataM18: TFloatField;
    dataM19: TFloatField;
    dataM20: TFloatField;
    dataM21: TFloatField;
    dataM22: TFloatField;
    dataM23: TFloatField;
    dataM24: TFloatField;
    dataM25: TFloatField;
    dataM26: TFloatField;
    dataM27: TFloatField;
    dataM28: TFloatField;
    dataM29: TFloatField;
    dataM30: TFloatField;
    dataM31: TFloatField;
    dataavgTotal: TIntegerField;
    Splitter1: TSplitter;
    Panel2: TPanel;
    PaintBox1: TPaintBox;
    TBItem2: TTBItem;
    procedure FormCreate(Sender: TObject);
    procedure dataCalcFields(DataSet: TDataSet);
    procedure TBItem1Click(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure dataAfterScroll(DataSet: TDataSet);
    procedure TBItem2Click(Sender: TObject);
  private
    excel:  variant;
    needDraw: boolean;
    procedure DrawAxes(var x1, y1, x2, y2, step, stepY, deltaD: integer);
    procedure xlDrawCell(r1, c1, r2, c2: integer; text:string; border: boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
newCol: TColumnEh;
i:  integer;
begin
//  graphMode := 1;
//  needDraw := false;

  if OracleLogon1.Execute = false then begin
    release;
    exit;
  end;

  dateTimePicker1.Date := date - 1;
  dateTimePicker2.Date := date - 1;
  with dbgridEh1.Columns do begin
    for i:=1 to 32 do begin
      newCol := Add;
      newCol.Title.Caption := 'ƒни мес€ца|' + IntToStr(i);
      newCol.FieldName := 'M' + IntToStr(i);
    end;
    newCol := newCol;
    newCol.Title.Caption := '—реднее за мес€ц';
    newCol.FieldName := 'avgTotal';
  end;
end;

procedure TForm1.dataCalcFields(DataSet: TDataSet);
begin
  dataavgTotal.AsInteger := Round((datam1.AsInteger + datam2.AsInteger +
    datam3.AsInteger + datam4.AsInteger + datam15.AsInteger +
    datam5.AsInteger + datam6.AsInteger + datam16.AsInteger +
    datam7.AsInteger + datam8.AsInteger + datam17.AsInteger +
    datam9.AsInteger + datam10.AsInteger + datam18.AsInteger +
    datam11.AsInteger + datam12.AsInteger + datam19.AsInteger +
    datam13.AsInteger + datam14.AsInteger + datam20.AsInteger +
    datam21.AsInteger + datam22.AsInteger + datam23.AsInteger +
    datam24.AsInteger + datam25.AsInteger + datam26.AsInteger +
    datam27.AsInteger + datam28.AsInteger + datam29.AsInteger +
    datam30.AsInteger + datam31.AsInteger)/31);
end;

procedure TForm1.TBItem1Click(Sender: TObject);
begin
  data.Close;
  data.SetVariable(0, DateToStr(DateTimePicker1.Date));
  data.SetVariable(1, DateToStr(DateTimePicker2.Date));
  data.Open;
  DBGridEh1.SetFocus;
  needDraw := true;
  paintBox1.Repaint;
end;

procedure TForm1.PaintBox1Paint(Sender: TObject);
var
i:  integer;
h, w: integer;  //под размеры канвы
x1, y1, x2, y2, step, stepY: integer;
value:  integer;
deltaD, x, y: integer;
begin
  if needDraw = false then
    exit;


//рисуем график
  with paintbox1.Canvas do begin
  //очищаем
    brush.Color := clWhite;
    FillRect(ClipRect);
    pen.Width := 1;
    DrawAxes(x1, y1, x2, y2, step, stepY, deltaD);

    //ставим первую точку
    value := data.Fields[1].Value;
    moveTo(x1 + round(step/2), y2 - round(stepY*value/deltaD));

    pen.Color := clBlack;
    pen.Width := 2;
    for i:= 2 to 31 do begin
      value := Data.Fields[i].Value;
      x := x1 + round(step*i) - round(step/2);
      y := y2 - round(stepY*value/deltaD);
      lineTo(x, y);
    end;
  end;

end;

procedure TForm1.DrawAxes(var x1, y1, x2, y2, step, stepY, deltaD: integer);
var
w, h, i:  integer;
textV:    integer;
yx, dy: integer;
max:  integer;  //максимальное значени по оси Y
value:  integer;
begin
//определ€ем максимальное значение в стреднем значении
  max := 0;
  for i := 2 to 32 do begin
      value := data.Fields[i].Value;
    if value > max then
      max := value;
  end;

//увеличим максимальное значени на 30% дл€ красоты
  max := max + round((max/100)*20);

  if max > 5000 then deltaD := 1000;
  if max > 20000 then deltaD := 5000;

//вычисл€ем размеры под поле графика дл€ шкалы
  with paintBox1.Canvas do begin
    pen.Color := RGB(0, 0, 0);
    yx := TextWidth(IntToStr(max)) + textheight('литры') + 20;
    x1 := yx;
    moveto(yx, 20);
    w := PaintBox1.Width - yx;
    x2 := w - 20 + yx;
    h := PaintBox1.Height - TextHeight('часы')*3;
    y1 := 20;
    y2 := h;

    dy := round(h/(max/deltaD));  //приращение y
    stepY := dy;

    lineto(yx,
      PaintBox1.Height - TextHeight('часы')*3);
    lineto(w - 20 + yx,
      PaintBox1.Height - TextHeight('часы')*3);
  //градуируем ось Y
    i := PaintBox1.Height - TextHeight('часы')*3 - dy;
    pen.Color := RGB(200, 200, 200);
    textV := deltaD;
    while i>20 do begin
      moveto(yx - 3, i);
      lineto(w + yx - 20, i);
      TextOut(yx - TextWidth(IntToStr(textV)) - 4, i, IntToStr(textV));
      i := i - dy;
      textV := textV + deltaD;
    end;
  //градуирвем ось X
    dy := round((w - 20)/32);
    i := yx;
    step := dy;
    pen.Color := RGB(150, 150, 150);
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

procedure TForm1.DBGridEh1CellClick(Column: TColumnEh);
begin
  PaintBox1.Repaint;
end;

procedure TForm1.dataAfterScroll(DataSet: TDataSet);
begin
  PaintBox1.Repaint;
end;

procedure TForm1.TBItem2Click(Sender: TObject);
label end1;
var
i, graphRow: integer; 
sheet:  variant;
s:  string;
begin
  excel := CreateOleObject('excel.application.8');

  excel.workBooks.add;

  sheet := excel.workBooks[1]. sheets[1];

//сохран€ем в Excel
  //создаем заголовок
  sheet.cells[2, 3] := 'јнализ интенсивности работы ј«— с ' +
    DateToStr(DateTimePicker1.Date) + ' по ' + DateToStr(DateTimePicker2.Date);
  xlDrawCell(3, 1, 4, 1, 'ј«—', true);
  xlDrawCell(3, 2, 3, 32, 'ƒни мес€ца', true);
  for i:=2 to 32 do
    xlDrawCell(4, i, 4, i, IntToStr(i - 1), true);
  xlDrawCell(3, 33, 4, 33, '—реднее значение', true);

  sheet.Columns['A'].ColumnWidth := 15;
  sheet.columns['ag'].ColumnWidth := 15;

  data.First;
  graphRow := 5;
  while not data.Eof do begin
    xlDrawCell(graphRow, 1, graphRow, 1, data.Fields[0].Value, true);
//    xlDrawCell(graphRow, 2, graphRow, 2, data.FieldValues['d'], true);
    for i:= 1 to 31 do begin
      s := data.Fields[i].Value;
      xlDrawCell(graphRow, i + 1, graphRow, i + 1, s, true);
    end;
    xlDrawCell(graphRow, 33, graphRow, 33,
      IntToStr(data.FieldValues['avgTotal']), true);
{    xlDrawCell2('ab' + IntToStr(graphRow), 'ab' + IntToStr(graphRow),
      IntToStr(ListRows.FieldValues['avgTotal']), true);}
    inc(graphRow);
    data.Next;
    break;
  end;
{
//теперь итого по строкам
  xlDrawCell(graphRow, 1, graphRow, 2, '»“ќ√ќ за 1 час', true);
  for i:=2 to 25 do begin
    s := DBGridEh1.GetFooterValue(0, DBGridEh1.Columns[i]);
    if s = '' then s := '0';
    xlDrawCell(graphRow, i + 1, graphRow, i + 1, s, true);
  end;

  Inc(graphRow);
  xlDrawCell(graphRow, 1, graphRow, 2, '»“ќ√ќ за 1 час', true);
  for i:=2 to 25 do begin
    s := DBGridEh1.GetFooterValue(1, DBGridEh1.Columns[i]);
    if s = '' then s := '0';
    xlDrawCell(graphRow, i + 1, graphRow, i + 1,
      s, true);
  end;

  sheet.Range['c6', 'z' + IntToStr(graphrow)].HorizontalAlignment := $FFFFEFC8;

  excel.workbooks[1].sheets[1].name := 'sheet1';

//добавл€ем график
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
  excel.ActiveChart.axes(2, 1).axisTitle.characters.text := 'литры';
  excel.ActiveChart.Haslegend := false;

  excel.workbooks[1].sheets[1].PageSetup.Orientation := 2;
}
end1:
  excel.visible := true;
  excel := null;

end;

procedure TForm1.xlDrawCell(r1, c1, r2, c2: integer; text: string;
  border: boolean);
const
c: array[1..35] of string =('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
  'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x',
  'y', 'z', 'aa', 'ab', 'ac', 'ad', 'ae', 'af', 'ag', 'ah', 'ai');
var
sheet:  variant;
str1, str2: string; 
begin
  sheet := excel.workbooks[1].sheets[1];

  str1 := c[c1] + IntToStr(r1);
  str2 := c[c2] + IntToStr(r2);

  sheet.range[str1, str2].merge;
  sheet.range[str1, str2] := text;
  sheet.range[str1, str2].HorizontalAlignment := $FFFFEFF4;
  sheet.range[str1, str2].VerticalAlignment := $FFFFEFF4;
  sheet.range[str1, str2].WrapText := true;
  sheet.range[str1, str2].font.size := 12;

  if border = true then begin
    //права€ граница
    sheet.range[str1, str2].Borders[$FFFFEFC8].linestyle := 1;
    sheet.range[str1, str2].Borders[$FFFFEFC8].Weight := 2;
    sheet.range[str1, str2].Borders[$FFFFEFC8].colorindex := $FFFFEFF7;
    //лева€
    sheet.range[str1, str2].Borders[$FFFFEFDD].linestyle := 1;
    sheet.range[str1, str2].Borders[$FFFFEFDD].Weight := 2;
    sheet.range[str1, str2].Borders[$FFFFEFDD].colorindex := $FFFFEFF7;
    //верхн€€
    sheet.range[str1, str2].Borders[$FFFFEFC0].linestyle := 1;
    sheet.range[str1, str2].Borders[$FFFFEFC0].Weight := 2;
    sheet.range[str1, str2].Borders[$FFFFEFC0].colorindex := $FFFFEFF7;
    //нижн€€
    sheet.range[str1, str2].Borders[$FFFFEFF5].linestyle := 1;
    sheet.range[str1, str2].Borders[$FFFFEFF5].Weight := 2;
    sheet.range[str1, str2].Borders[$FFFFEFF5].colorindex := $FFFFEFF7;
  end;
end;

end.
