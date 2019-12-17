unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, VCFI, AxCtrls, OleCtrls, VCF1,
  DBCtrls, Oracle, Mask, DB, OracleData, DBCtrlsEh, DBLookupEh, RxLookup,
  ToolEdit, Grids, DBGrids, ToolWin, DBGridEh, RXGrids;

const month: array[1..12] of string = ('������', '�������', '�����', '������',
  '���', '����', '����', '�������', '��������', '�������', '������', '�������');

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    StaticText1: TStaticText;
    DateTimePicker1: TDateTimePicker;
    Bevel1: TBevel;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    DateTimePicker2: TDateTimePicker;
    StaticText4: TStaticText;
    OracleSession1: TOracleSession;
    azsListQ: TOracleDataSet;
    DataSource1: TDataSource;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DataSource2: TDataSource;
    mainQuery: TOracleDataSet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    azsListQRN: TFloatField;
    azsListQAZS_NAME: TStringField;
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
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure azsComboChange(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ListRowsCalcFields(DataSet: TDataSet);
    procedure ToolButton1Click(Sender: TObject);
  private
    excel:  variant;  
    borderColor: TColor;
    maxY: integer;
    needDraw: boolean;  //���������� �������� ������
    drawRow:  integer;  //������, �� ������� ���� ������� ������
    procedure GetStringRange(r1, c1, r2, c2: integer; var str1, str2: string);
    procedure xlDrawCell(r1, c1, r2, c2: integer; text:string; border: boolean);
    procedure xlDrawCell2(str1, str2: string; text:string; border: boolean);    
    procedure DrawAxes(var x1, y1, x2, y2, step, stepY: integer);
    function GetAzsIDFromReport(repID: integer): integer;
    procedure AlignCell(row, col, sc, ec: integer);
    procedure BorderRange(sr, sc, er, ec: integer);
    procedure BorderCell(row, col, l, t, r, b: integer);
    function FormatDate(str: string): string;
    procedure Select(sr, sc, er, ec: integer);
    procedure CreateHeader;
    procedure CreateFooter(row: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses ComObj, StrUtils;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
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

//��������� �������
//���������� ����
  mainQuery.First;
  row := 4;
  while not mainQuery.Eof do begin
//��������� ������ ������
    Select(row, 3, row, 28);
    F1Book1.SetAlignment( F1HAlignRight, true, F1VAlignCenter, 0);
    date := mainQuery.FieldValues['d'];
    F1Book1.TextRC[row, 1] := mainQuery.FieldValues['day'];
    F1Book1.TextRC[row, 2] := date;
//��������� �������
    //���� �� ���������� ����

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
//�������� ��������� ����� ��� �������
    Select(row, 1, row + 1, 28);
    F1Book1.SetBorder(0, 0, 1, 0, 1, 0, rgb(200, 200, 200), rgb(200, 200, 200),
      rgb(200, 200, 200), rgb(200, 200, 200), rgb(200, 200, 200));

//��������� ������� � ����� ������
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

  F1Book1.TextRC[row, 1] := '����� �� 1 ���';
  F1Book1.TextRC[row + 1, 1] := '������� ��������';

  Select(row, 1, row + 1, 28);
  F1Book1.SetBorder(1, 1, 1, 1, 1, 0, 0, borderColor, borderColor,
    borderColor, borderColor);

//��������� ������� � ��������� �����
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

procedure TForm1.FormShow(Sender: TObject);
var
i:      integer;
begin
  azsListQ.Open;

  


end;

procedure TForm1.azsComboChange(Sender: TObject);
begin
  ShowMessage('123');
end;

procedure TForm1.CreateHeader;
//������� ����� ��� ������
var
i:    integer;
dateStart, dateEnd: string;

begin
//  DBGridEh1.GetFooterValue(1, DBGridEh1.Columns[2] )
{  dateStart := DatetoStr(DateTimePicker1.DateTime);
  dateEnd := DatetoStr(DateTimePicker2.DateTime);

    ColWidth[1] := 5000;
    textRC[2, 1] := '��� ������';
    SetAlignment( F1HAlignCenter, true, F1VAlignCenter, 0);
    BorderRange(1, 1, 3, 1);

    Select(3, 1, 3, maxCol);
    SetAlignment( F1HAlignCenter, true, F1VAlignCenter, 0);
    BorderRange(1, 2, 3, 2); 
    

    textRC[2, 2] := '�����';
    ColWidth[2] := 3000;
    textRC[1, 3] := '������ ���������� ������� � ' + FormatDate(dateStart) +
      ' �� ' + FormatDate(dateEnd);

    textRC[2, 3] := '             ����';

    //����� ��� "�������"
    Select(1, 3, 1, 28);
    SetBorder( 1, 0, 0, 0, 0, 0, borderColor, borderColor,
      borderColor, borderColor, borderColor);

    Select(2, 3, 2, 26);
    SetBorder(1, 0, 0, 0, 0, 0, borderColor, borderColor,
      borderColor, borderColor, borderColor);

    //����� ��� "�����
    Select(2, 27, 3, 27);
    SetBorder(1, 0, 0, 0, 0, 0, borderColor, borderColor,
      borderColor, borderColor, borderColor);
    TextRC[2, 27] := '�����';
    TextRC[3, 27] := '�� ����';

    Select(2, 28, 3, 28);
    SetBorder(1, 0, 0, 0, 0, 0, borderColor, borderColor,
      borderColor, borderColor, borderColor);
    TextRC[2, 28] := '�������';
    TextRC[3, 28] := '��������';


//����
    borderColor := RGB(0, 0, 0);
    for i:=1 to 24 do begin
      textRC[3, i + 2] := IntToStr(i);
      BorderCell(3, i + 2, 1, 1, 1, 1);
    end;

  end;
}
end;

procedure TForm1.Select(sr, sc, er, ec: integer);
begin
{  with F1Book1 do begin
    SelStartCol := sc;
    SelStartRow := sr;
    SelEndCol := ec;
    SelEndRow := er;
  end;}
end;

function TForm1.FormatDate(str: string): string;
//����������� ���� � ������ ��� ���
var
res:  string;
m, e: integer;
begin
//  res := str;
  res := str[1] + str[2] + ' ';

  m := StrToInt(str[4] + str[5]);

  res := res + month[m] + ' ';
  res := res + str[7] + str[8] + str[9] + str[10] + '�.';

  FormatDate := res;
end;

procedure TForm1.BorderCell(row, col, l, t, r, b: integer);
var
lc, tc, rc, bc: TColor;
begin
//  select(row, col, row, col);
//  F1Book1.SetBorder( 1, l, r, t, b,
//    borderColor, borderColor, borderColor, borderColor, borderColor, borderColor);
end;

procedure TForm1.BorderRange(sr, sc, er, ec: integer);
//�������� �������� ����� ������
var
i:  integer;
begin
//������� �����

//  select(sr, sc, er, ec);

//  F1Book1.SetBorder( 1, 0, 0, 0, 0,
//    borderColor, borderColor, borderColor, borderColor, borderColor, borderColor);
  
end;

procedure TForm1.CreateFooter(row: integer);
//������ ������ �����
begin

end;

procedure TForm1.AlignCell(row, col, sc, ec: integer);
//��������� ������ �� ����������� ���, ����� ��� ������ � ����� ����� sc � ec
var
text: string;
i, wT, ws: integer;
begin
//�������� ����� ���������
{  text := F1Book1.TextRC[row, col];
//��������� ������, �� ������� ��� ���� ���������
  WT := 0;
  for i:=sc to ec do
    wt := WT + F1Book1.ColWidth[i];


//���������� ����� ������� ������
  select(row, col, row, col);
  ws := F1Book1.GetTextLen;

  ShowMessage('wt = ' + IntToStr(wt) + Chr(13) + Chr(10) +
    'ws=' + IntToStr(ws));
}    
end;


function TForm1.GetAzsIDFromReport(repID: integer): integer;
//���������� ��� ��� �� ���� ������
begin
end;

procedure TForm1.PaintBox1Paint(Sender: TObject);
var
i:  integer;
h, w: integer;  //��� ������� �����
x1, y1, x2, y2, step, stepY: integer;
value:  integer;
x, y: integer;
begin
  if needDraw = false then
    exit;

//������ ������
  with paintbox1.Canvas do begin
  //�������
    brush.Color := clWhite;
    FillRect(ClipRect);
    DrawAxes(x1, y1, x2, y2, step, stepY);

    //������ ������ �����

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

//������ ����� � ���� ������
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

procedure TForm1.DrawAxes(var x1, y1, x2, y2, step, stepY: integer);
//���������� ��� �������������� ���
var
w, h, i:  integer;
textV:    integer;
yx, dy: integer;
max:  integer;  //������������ ������� �� ��� Y
value:  integer;
begin
//���������� ������������ �������� � �������� ��������
  max := 0;
  for i := 3 to 25 do begin
    if DBGridEh1.GetFooterValue(1, DBGridEh1.Columns[i]) <> '' then
      value := StrToInt(DBGridEh1.GetFooterValue(1, DBGridEh1.Columns[i]))
    else
      value := 0;
    if value > max then
      max := value;
  end;

//    if F1Book1.NumberRC[DrawRow, i] > max then
//      max := round(F1Book1.NumberRC[DrawRow, i]);

//�������� ������������ ������� �� 20% ��� �������
  max := max + round((max/100)*20);

//������ ��� Y

//��������� ������� ��� ���� ������� ��� �����
  with paintBox1.Canvas do begin
    pen.Color := RGB(0, 0, 0);
    yx := TextWidth(IntToStr(max)) + textheight('�����') + 20;
    x1 := yx;
    moveto(yx, 20);
    w := PaintBox1.Width - yx;
    x2 := w - 20 + yx;
    h := PaintBox1.Height - TextHeight('����')*3;
    y1 := 20;
    y2 := h;

    dy := round(h/(max/1000));  //���������� y
    stepY := dy;

    lineto(yx,
      PaintBox1.Height - TextHeight('����')*3);
    lineto(w - 20 + yx,
      PaintBox1.Height - TextHeight('����')*3);
  //���������� ��� Y
    i := PaintBox1.Height - TextHeight('����')*3 - dy;
    pen.Color := RGB(200, 200, 200);
    textV := 1000;
    while i>20 do begin
      moveto(yx - 3, i);
      lineto(w + yx - 20, i);
      TextOut(yx - TextWidth(IntToStr(textV)) - 4, i, IntToStr(textV));
      i := i - dy;
      textV := textV + 1000;
    end;
  //���������� ��� X
    dy := round((w - 20)/25); 
    i := yx;
    step := dy;
    pen.Color := RGB(150, 150, 150);
    textV := 1000;
    textV := 1;
    while i<w do begin
      moveto(i, PaintBox1.Height - TextHeight('����')*3 + 1);
      lineto(i, PaintBox1.Height - TextHeight('����')*3 + 5);
      TextOut(i + round(dy/2), PaintBox1.Height - TextHeight('����')*3 + 7,
        IntToStr(textV));
      i := i + dy;
      textV := textV + 1;
    end;

  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  needDraw := false;
end;

procedure TForm1.ToolButton2Click(Sender: TObject);
label end1;
var
i, graphRow: integer;  //������, �� ������� ����� ��������� ������
sheet:  variant;
s:  string;
begin
//��������� ������ � ����
//if saveDialog1.Execute = false then
//  exit;

  excel := CreateOleObject('excel.application.8');

//if AnsiContainsStr(saveDialog1.FileName, '.xls') = false then
//  saveDialog1.FileName := saveDialog1.FileName + '.xls';

  excel.workBooks.add;

//  excel.visible := true;

  sheet := excel.workBooks[1]. sheets[1];

//��������� � Excel
  //������� ���������
  sheet.cells[2, 3] := '������ ������������� ������ ���������� ' + RxDBLookupCombo1.Text;
  xlDrawCell2('a3', 'a5', '��� ������', true);
  xlDrawCell(3, 2, 5, 2, '�����', true);
  xlDrawCell2('c3', 'ab3', '������ ���������� ������� � ' +
    DateToStr(DateTimePicker1.Date) + ' �� ' + DateToStr(DateTimePicker2.Date) + '.', true);
  xlDrawCell2('c4', 'z4', '����', true);
  for i:=3 to 26 do
    xlDrawCell(5, i, 5, i, IntToStr(i - 2), true);
  xlDrawCell2('aa4', 'aa5', '����� �� ����', true);
  xlDrawCell2('ab4', 'ab5', '������� ��������', true);

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

//������ ����� �� �������
  xlDrawCell(graphRow, 1, graphRow, 2, '����� �� 1 ���', true);
  for i:=2 to 25 do begin
    s := DBGridEh1.GetFooterValue(0, DBGridEh1.Columns[i]);
    if s = '' then s := '0';
    xlDrawCell(graphRow, i + 1, graphRow, i + 1, s, true);
  end;

  Inc(graphRow);
  xlDrawCell(graphRow, 1, graphRow, 2, '����� �� 1 ���', true);
  for i:=2 to 25 do begin
    s := DBGridEh1.GetFooterValue(1, DBGridEh1.Columns[i]);
    if s = '' then s := '0';
    xlDrawCell(graphRow, i + 1, graphRow, i + 1,
      s, true);
  end;

  sheet.Range['c6', 'z' + IntToStr(graphrow)].HorizontalAlignment := $FFFFEFC8;

  excel.workbooks[1].sheets[1].name := 'sheet1';

//��������� ������
  excel.charts.add;
  excel.activeChart.chartType :=  $00000041;
  excel.activeChart.location($00000002, 'sheet1');

  excel.activeChart.SetSourceData(
    excel.workBooks[1].sheets[1].range['c' + IntToStr(graphRow), 'z' + IntToStr(graphRow)],
    $00000001);

  excel.ActiveChart.HasTiTle := false;
  excel.ActiveChart.axes(1, 1).hasTitle := true;
  excel.ActiveChart.axes(1, 1).axisTitle.characters.text := '����';
  excel.ActiveChart.Haslegend := false;

  excel.ActiveChart.axes(2, 1).hasTitle := true;
  excel.ActiveChart.axes(2, 1).axisTitle.characters.text := '�����';
  excel.ActiveChart.Haslegend := false;

  excel.workbooks[1].sheets[1].PageSetup.Orientation := 2;

end1:
  excel.visible := true;
  excel := null;
end;

procedure TForm1.ListRowsCalcFields(DataSet: TDataSet);
var
res: Variant;
begin
    res := mainQuery.Lookup( 'd;ho', VarArrayOf([ListRowsd.AsVariant, 1]), 's');
    if res = NULL then res := 0;
    ListRowsho1.Value := res;

    res := mainQuery.Lookup( 'd;ho', VarArrayOf([ListRowsd.AsVariant, 2]), 's');
    if res = NULL then res := 0;
    ListRowsho2.Value := res;

    res := mainQuery.Lookup( 'd;ho', VarArrayOf([ListRowsd.AsVariant, 3]), 's');
    if res = NULL then res := 0;
    ListRowsho3.Value := res;

    res := mainQuery.Lookup( 'd;ho', VarArrayOf([ListRowsd.AsVariant, 4]), 's');
    if res = NULL then res := 0;
    ListRowsho4.Value := res;

    res := mainQuery.Lookup( 'd;ho', VarArrayOf([ListRowsd.AsVariant, 5]), 's');
    if res = NULL then res := 0;
    ListRowsho5.Value := res;

    res := mainQuery.Lookup( 'd;ho', VarArrayOf([ListRowsd.AsVariant, 6]), 's');
    if res = NULL then res := 0;
    ListRowsho6.Value := res;

    res := mainQuery.Lookup( 'd;ho', VarArrayOf([ListRowsd.AsVariant, 7]), 's');
    if res = NULL then res := 0;
    ListRowsho7.Value := res;

    res := mainQuery.Lookup( 'd;ho', VarArrayOf([ListRowsd.AsVariant, 8]), 's');
    if res = NULL then res := 0;
    ListRowsho8.Value := res;

    res := mainQuery.Lookup( 'd;ho', VarArrayOf([ListRowsd.AsVariant, 9]), 's');
    if res = NULL then res := 0;
    ListRowsho9.Value := res;

    res := mainQuery.Lookup( 'd;ho', VarArrayOf([ListRowsd.AsVariant, 10]), 's');
    if res = NULL then res := 0;
    ListRowsho10.Value := res;

    res := mainQuery.Lookup( 'd;ho', VarArrayOf([ListRowsd.AsVariant, 11]), 's');
    if res = NULL then res := 0;
    ListRowsho11.Value := res;

    res := mainQuery.Lookup( 'd;ho', VarArrayOf([ListRowsd.AsVariant, 12]), 's');
    if res = NULL then res := 0;
    ListRowsho12.Value := res;

    res := mainQuery.Lookup( 'd;ho', VarArrayOf([ListRowsd.AsVariant, 13]), 's');
    if res = NULL then res := 0;
    ListRowsho13.Value := res;

    res := mainQuery.Lookup( 'd;ho', VarArrayOf([ListRowsd.AsVariant, 14]), 's');
    if res = NULL then res := 0;
    ListRowsho14.Value := res;

    res := mainQuery.Lookup( 'd;ho', VarArrayOf([ListRowsd.AsVariant, 15]), 's');
    if res = NULL then res := 0;
    ListRowsho15.Value := res;

    res := mainQuery.Lookup( 'd;ho', VarArrayOf([ListRowsd.AsVariant, 16]), 's');
    if res = NULL then res := 0;
    ListRowsho16.Value := res;

    res := mainQuery.Lookup( 'd;ho', VarArrayOf([ListRowsd.AsVariant, 17]), 's');
    if res = NULL then res := 0;
    ListRowsho17.Value := res;

    res := mainQuery.Lookup( 'd;ho', VarArrayOf([ListRowsd.AsVariant, 18]), 's');
    if res = NULL then res := 0;
    ListRowsho18.Value := res;

    res := mainQuery.Lookup( 'd;ho', VarArrayOf([ListRowsd.AsVariant, 19]), 's');
    if res = NULL then res := 0;
    ListRowsho19.Value := res;

    res := mainQuery.Lookup( 'd;ho', VarArrayOf([ListRowsd.AsVariant, 20]), 's');
    if res = NULL then res := 0;
    ListRowsho20.Value := res;

    res := mainQuery.Lookup( 'd;ho', VarArrayOf([ListRowsd.AsVariant, 21]), 's');
    if res = NULL then res := 0;
    ListRowsho21.Value := res;

    res := mainQuery.Lookup( 'd;ho', VarArrayOf([ListRowsd.AsVariant, 22]), 's');
    if res = NULL then res := 0;
    ListRowsho22.Value := res;

    res := mainQuery.Lookup( 'd;ho', VarArrayOf([ListRowsd.AsVariant, 23]), 's');
    if res = NULL then res := 0;
    ListRowsho23.Value := res;

    res := mainQuery.Lookup( 'd;ho', VarArrayOf([ListRowsd.AsVariant, 24]), 's');
    if res = NULL then res := 0;
    ListRowsho24.Value := res;


    ListRowsTotal.Value :=
      ListRowsho1.Value + ListRowsho2.Value + ListRowsho3.Value + ListRowsho4.Value +
      ListRowsho5.Value + ListRowsho6.Value + ListRowsho7.Value + ListRowsho8.Value +
      ListRowsho9.Value + ListRowsho10.Value + ListRowsho11.Value + ListRowsho12.Value +
      ListRowsho13.Value + ListRowsho14.Value + ListRowsho15.Value +
      ListRowsho16.Value + ListRowsho17.Value + ListRowsho18.Value +
      ListRowsho19.Value + ListRowsho20.Value + ListRowsho21.Value +
      ListRowsho22.Value + ListRowsho23.Value + ListRowsho24.Value;

    ListRowsAvgTotal.Value := ListRowsTotal.Value/24;

end;

procedure TForm1.ToolButton1Click(Sender: TObject);
begin
  if RxDBLookupCombo1.Text = '' then begin
    ShowMessage('�������� ���');
    exit;
  end;

  mainQuery.Close;
  mainQuery.SetVariable(0, DateToStr(DateTimePicker1.Date));
  mainQuery.SetVariable(1, DateToStr(DateTimePicker2.Date));
  mainQuery.SetVariable(2, azsListQrn.Value);

  mainQuery.Open;


  ListRows.Close;
  ListRows.SetVariable(0, DateToStr(DateTimePicker1.Date));
  ListRows.SetVariable(1, DateToStr(DateTimePicker2.Date));
  ListRows.SetVariable(2, azsListQrn.Value);

  ListRows.Open;

  if mainQuery.RecordCount = 0 then begin
    ShowMessage('��� ��������� ������� ' + Chr(13) + Chr(10) +
      '������ �����������');
    exit;
  end;

  needDraw := true;
  Repaint;

end;

procedure TForm1.xlDrawCell(r1, c1, r2, c2: integer; text: string;
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
    //������ �������
    sheet.range[str1, str2].Borders[$FFFFEFC8].linestyle := 1;
    sheet.range[str1, str2].Borders[$FFFFEFC8].Weight := 2;
    sheet.range[str1, str2].Borders[$FFFFEFC8].colorindex := $FFFFEFF7;
    //�����
    sheet.range[str1, str2].Borders[$FFFFEFDD].linestyle := 1;
    sheet.range[str1, str2].Borders[$FFFFEFDD].Weight := 2;
    sheet.range[str1, str2].Borders[$FFFFEFDD].colorindex := $FFFFEFF7;
    //�������
    sheet.range[str1, str2].Borders[$FFFFEFC0].linestyle := 1;
    sheet.range[str1, str2].Borders[$FFFFEFC0].Weight := 2;
    sheet.range[str1, str2].Borders[$FFFFEFC0].colorindex := $FFFFEFF7;
    //������
    sheet.range[str1, str2].Borders[$FFFFEFF5].linestyle := 1;
    sheet.range[str1, str2].Borders[$FFFFEFF5].Weight := 2;
    sheet.range[str1, str2].Borders[$FFFFEFF5].colorindex := $FFFFEFF7;
  end;

end;

procedure TForm1.GetStringRange(r1, c1, r2, c2: integer; var str1, str2: string);
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

procedure TForm1.xlDrawCell2(str1, str2, text: string; border: boolean);
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
    //������ �������
    sheet.range[str1, str2].Borders[$FFFFEFC8].linestyle := 1;
    sheet.range[str1, str2].Borders[$FFFFEFC8].Weight := 2;
    sheet.range[str1, str2].Borders[$FFFFEFC8].colorindex := $FFFFEFF7;
    //�����
    sheet.range[str1, str2].Borders[$FFFFEFDD].linestyle := 1;
    sheet.range[str1, str2].Borders[$FFFFEFDD].Weight := 2;
    sheet.range[str1, str2].Borders[$FFFFEFDD].colorindex := $FFFFEFF7;
    //�������
    sheet.range[str1, str2].Borders[$FFFFEFC0].linestyle := 1;
    sheet.range[str1, str2].Borders[$FFFFEFC0].Weight := 2;
    sheet.range[str1, str2].Borders[$FFFFEFC0].colorindex := $FFFFEFF7;
    //������
    sheet.range[str1, str2].Borders[$FFFFEFF5].linestyle := 1;
    sheet.range[str1, str2].Borders[$FFFFEFF5].Weight := 2;
    sheet.range[str1, str2].Borders[$FFFFEFF5].colorindex := $FFFFEFF7;
  end;

end;

end.
