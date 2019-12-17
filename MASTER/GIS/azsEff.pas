unit azsEff;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, DB, OracleData, PrnDbgeh, TB2Item,
  TB2Dock, TB2Toolbar, ComCtrls, RpDefine, RpRender, RpRenderHTML,
  OleCtrls, SHDocVw;


type realzRec=record
  nom:  string;
  val:  double;
  summ: double;
end;

type
  TazsEffDlg = class(TForm)
    DBGridEh1: TDBGridEh;
    DataSource1: TDataSource;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    PrintDBGridEh1: TPrintDBGridEh;
    TBControlItem1: TTBControlItem;
    Label1: TLabel;
    WebBrowser1: TWebBrowser;
    src: TOracleDataSet;
    procedure TBItem1Click(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
  private
    f:  textfile;
    function BeginReport: string;
    function EndReport: string;
    function StartRow: string;
    function EndRow: string;
    function Cell(text: string; hAlign, vAlign: integer): string;
    function OneDay(day: string): string;
    function GetType(nom: string): integer;
  public
    startRep, endRep: string; //начало и конец для отчета
    procedure Generate;
  end;

var
  azsEffDlg: TazsEffDlg;

implementation

uses StrUtils;

{$R *.dfm}

procedure TazsEffDlg.TBItem1Click(Sender: TObject);
begin
  PrintDBGridEh1.PageHeader.CenterText.Clear;
  PrintDBGridEh1.PageHeader.CenterText.Add(Caption);
  PrintDBGridEh1.PageFooter.LeftText.Clear;
  PrintDBGridEh1.PageFooter.LeftText.Add('отпечатано - '+FormatDateTime('dd.mm.yyyy hh:nn:ss',Now));
  PrintDBGridEh1.Preview;
end;

procedure TazsEffDlg.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
{  if Src.RecNo mod 2=0 then
    Background:=clInfoBk;
  if gdSelected in State then
    Background:=clNavy;}
end;

procedure TazsEffDlg.Generate;
//возможные варианты названий бензинов
var
url:  string;
s:  string;
v80, v92, v95, vd:  string;
s80, s92, s95, sd:  string;
i:  integer;
oldDate:  string;
flag:  boolean;
begin
  url := GetCurrentDir + '\report.html';

  AssignFile(f, url);
  Rewrite(f);

  src.Open;
//генерируем отчет
//сохраняем шапку
  BeginReport;
    StartRow;
    //идем по строкам запроса
    s := '';
    s80 := '0'; s92 := '0'; s95 := '0'; sd := '0';
    v80 := '0'; v92 := '0'; v95 := '0'; vd := '0';
  if src.RecordCount > 0 then begin
    oldDate := src.FieldValues['dd'];
    flag :=  false;
    while not src.Eof do begin
      if flag = false then begin
        StartRow;
        flag := true;
      end;
      s := src.FieldValues['nomen_code'];
      case GetType(src.FieldValues['nomen_code']) of
      80: begin v80 := FloatToStr(src.FieldValues['vol']);
          s80 := FloatToStr(src.FieldValues['summ']); end;
      92: begin v92 := FloatToStr(src.FieldValues['vol']);
          s92 := FloatToStr(src.FieldValues['summ']); end;
      95: begin v95 := FloatToStr(src.FieldValues['vol']);
          s95 := FloatToStr(src.FieldValues['summ']); end;
      100:begin vd := FloatToStr(src.FieldValues['vol']);
          sd := FloatToStr(src.FieldValues['summ']); end
      end;
      src.Next;
      //если дата изменилась, то выводим строку
      if src.FieldValues['dd'] <> oldDate then begin
        Cell(oldDate, 2, 2);
        Cell(v80, 2, 2); Cell(s80, 2, 2);
        Cell(v92, 2, 2); Cell(s92, 2, 2);
        Cell(v95, 2, 2); Cell(s95, 2, 2);
        Cell(vd, 2, 2); Cell(sd, 2, 2);
        EndRow;
        flag := false;
        s80 := '0'; s92 := '0'; s95 := '0'; sd := '0';
        v80 := '0'; v92 := '0'; v95 := '0'; vd := '0';
        oldDate := src.FieldValues['dd'];
      end;
    end;

    EndRow;
  EndReport;
  end;
  CloseFile(f);

  WebBrowser1.Navigate(url);
end;

function TazsEffDlg.BeginReport: string;
//делаем шапку
var
res:  string;
begin
//оформляем заголовок
writeln(f, '<TABLE border=1 cellPadding=0 cellSpacing=0 width = 100%>');
writeln(f, '<tr>');
writeln(f, '<td rowspan = 2 align=middle> Число </td>');
writeln(f, '<td colspan = 2 align=middle> АИ-80 </td>');
writeln(f, '<td colspan = 2 align=middle> АИ-92 </td>');
writeln(f, '<td colspan = 2 align=middle> АИ-95 </td>');
writeln(f, '<td colspan = 2 align=middle> ДЗУ </td>');
writeln(f, '</tr>');
writeln(f, '<tr>');
writeln(f, '<td align=middle> Объем </td>');
writeln(f, '<td align=middle> Сумма </td>');
writeln(f, '<td align=middle> Объем </td>');
writeln(f, '<td align=middle> Сумма </td>');
writeln(f, '<td align=middle> Объем </td>');
writeln(f, '<td align=middle> Сумма </td>');
writeln(f, '<td align=middle> Объем </td>');
writeln(f, '<td align=middle> Сумма </td>');
writeln(f, '</tr>');
  BeginReport := res;
end;

function TazsEffDlg.EndReport: string;
var
res:  string;
begin
  res := '</table>';

  writeln(f, res);

  EndReport := res;
end;

function TazsEffDlg.EndRow: string;
var
res:  string;
begin
  res := '</tr>';
  writeln(f, res);

  EndRow:= res;
end;

function TazsEffDlg.StartRow: string;
var
res:  string;
begin
  res := '<tr>';
  writeln(f, res);

  StartRow := res;
end;

function TazsEffDlg.Cell(text: string; hAlign, vAlign: integer): string;
var
res:  string;
begin

  res := '<td valign = ';
  case vAlign of
  1:  res := res + 'top ';
  2:  res := res + 'center ';
  3:  res := res + 'bottom ';
  end;
  res := res + 'align = ';
  case vAlign of
  1:  res := res + 'left>';
  2:  res := res + 'middle>';
  3:  res := res + 'right>';
  end;

  res := res + text + '</td>';
  writeln(f, res);

  Cell := res;
end;

function TazsEffDlg.OneDay(day: string): string;
//обрабатывает один день из запроса
var
res:  string;
begin


  OneDay := res;
end;

function TazsEffDlg.GetType(nom: string): integer;
const a80: array[0..1] of string = ('А-80', 'АИ-80');
const a92: array[0..1] of string = ('А-92', 'АИ-92');
const a95: array[0..2] of string = ('ПРЕМИУМ 95', 'АИ-95', 'Премиум 95');
const diz: array[0..1] of string = ('ДИЗТОП', 'ДЗУ');
var
i, res:  integer;
begin
//проверяем на 80
  res := 0;
  for i:=0 to length(a80) - 1 do
    if nom = a80[i] then begin
      GetType := 80;
      exit;
    end;

  for i:=0 to length(a92) - 1 do
    if nom = a92[i] then begin
      GetType := 92;
      exit;
    end;

  for i:=0 to length(a95) - 1 do
    if nom = a95[i] then begin
      GetType := 95;
      exit;
    end;

  for i:=0 to length(diz) - 1 do
    if nom = diz[i] then begin
      GetType := 100;
      exit;
    end;
  GetType := res;
end;

end.
