unit trk_eff;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, mdiform, ExtCtrls, StdCtrls, RxLookup, ComCtrls, Oracle, DB,
  OracleData, Grids, TB2Item, TB2Dock, TB2Toolbar, dateUtils, strutils,
  TeEngine, Series, TeeProcs, Chart, DBGrids;

type
  Tf_trkEff = class(TF_MDIForm)
    GroupBox1: TGroupBox;
    StaticText2: TStaticText;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    StaticText3: TStaticText;
    RxDBLookupCombo1: TRxDBLookupCombo;
    StaticText4: TStaticText;
    DataSource1: TDataSource;
    OracleSession1: TOracleSession;
    azsListQ: TOracleDataSet;
    azsListQAZS_NUMBER: TStringField;
    azsListQRN: TFloatField;
    OracleLogon1: TOracleLogon;
    grid: TStringGrid;
    MainDataQ: TOracleDataSet;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem2: TTBItem;
    trkListQ: TOracleDataSet;
    Label1: TLabel;
    UpDown1: TUpDown;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Chart1: TChart;
    Series1: TBarSeries;
    Series2: TBarSeries;
    Splitter2: TSplitter;
    Panel2: TPanel;
    Label2: TLabel;
    trkCombo: TComboBox;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Edit2: TEdit;
    UpDown3: TUpDown;
    DBGrid1: TDBGrid;
    DataSource2: TDataSource;
    Edit1: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure TBItem2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure trkComboChange(Sender: TObject);
    procedure visClick(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown3Click(Sender: TObject; Button: TUDBtnType);
    procedure Edit1Change(Sender: TObject);
  private
    list: TList;  //список дней (oneDay)
    trkList: TList; //список работы ТРК
    maxWidth: integer;
    procedure FormatTRK;
    function CompareTRK(curr:string; trk: string): string;
    procedure AddHour(trk: integer; work: boolean);
    function IsTRKWork(trk: integer; data: string):boolean;
    function GetTRKStatus(trk: integer; data: string):char;
    procedure SetTRKStatus(var data: string; trk: integer; status: char);
    procedure SetPeriods;
  public
    { Public declarations }
  end;

type trkRec = record
  number: integer;  //номер АЗС
  work:   integer;  //Сколько часов работала
  stay:   integer;  //сколько часов стояла
end;

type oneDay = record  //описывает один день
  dat: TDate;         //дата
  weekDay: string;    //день недели
  trk: array[0..23] of string;  //описания ТРК в определенный час
end;

var
  f_trkEff: Tf_trkEff;

implementation

{$R *.dfm}

procedure Tf_trkEff.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  azslistQ.close;
  mainDataQ.close;
  Action := cafree;
end;

procedure Tf_trkEff.FormCreate(Sender: TObject);
begin
  if OracleLogon1.Execute = false then begin
    release;
    exit;
  end;

  AzsListQ.Open;

  list := TList.Create;
end;

procedure Tf_trkEff.TBItem2Click(Sender: TObject);
var
j, i, k: integer;
newR: ^oneDay;
count, currHour: integer;
f: boolean;
str, currDat, s: string;
currDay: integer;
dat: TDateTime;
newT: ^trkRec;
begin
  List.clear;

  DateTimePicker1.Time := 0;
  DateTimePicker2.Time := 0;

  With mainDataQ do begin
    close;
    SetVariable(0, RxDBLookupCombo1.Text);
    SetVariable(1, DateTimePicker1.Date);
    SetVariable(2, DateTimePicker2.Date);
    Open;
  end;
//заполняем массив дней по полученным данным
  currDat := '';
  currHour := -1;
  newR := nil;
  while not mainDataQ.eof do begin
    dat := mainDataQ.FieldValues['dat'];
    if currDat <> DateTimeToStr(dat) then begin //если изменилась дата
    //сменилась дата
      if (HourOfTheDay(dat) <> currHour) and //если сменился только час
        (DayOfWeek (dat) = currDay) then begin
//        newR^.trk[currHour] := midStr(newR^.trk[currHour], 1, length(newR^.trk[currHour]) - 1);
        currHour := HourOfTheDay(dat);
        newR.trk[currHour] := '|' + IntToStr(mainDataQ.FieldValues['m']);
        MainDataQ.next;
        continue;
      end;

      if DayOfWeek(dat) <> currDay then begin //сменился день
        if newR <> nil then begin
//          if currHour <> -1 then
//            newR^.trk[currHour] := midStr(newR^.trk[currHour], 1, length(newR^.trk[currHour]) - 1);
          List.add(newR); //заносим получившуюся запись в список
        end;
        currHour := HourOfTheDay(dat);
        currDay := DayOfWeek(dat);
        currDat := DateToStr(dat);
        new(newR);
        newR^.dat := dat;
        newR^.weekDay := IntToStr(DayOfWeek(dat));
        newR^.trk[currHour] := newR^.trk[currHour] + '|' + IntToStr(mainDataQ.FieldValues['m']);
        MainDataQ.next;
        continue;
      end;
    end;
    newR^.trk[currHour] := newR^.trk[currHour] + '|' + IntToStr(mainDataQ.FieldValues['m']);
    mainDataQ.next;
  end;
  grid.RowCount := List.count + 1;

  for i:=0 to 23 do //делаем шапку
    Grid.Cells[i + 2, 0] := IntToStr(i);

  FormatTRK; //форматируем ТРК 


  //соберем данные для графика
  if trkList = nil then
    trkList := TList.Create;
  trkList.Clear;
  for i:=0 to list.count - 1 do begin
    newR := list.Items[i];
    for j:=0 to 23 do begin
      str := newR.trk[j];
      for k:=length(str) downto 1 do begin
        if str[k] = '|' then begin
          if s <> '' then begin
            AddHour(StrToInt(s), true);
            s := '';
          end;
          continue;
        end;
        if (str[k] = '!') or (str[k] = '?') then begin
          if s <> '' then begin
            AddHour(StrToInt(s), false);
            s := '';
          end;
          continue;
        end;
        s := str[k] + s;
      end;
    end;
  end;

  grid.SetFocus;
  grid.Repaint;

  grid.DefaultColWidth := UpDown1.Position;
  grid.colWidths[0] := 100;
  grid.colWidths[1] := 100;  

  Chart1.SeriesList[0].Clear;
  Chart1.SeriesList[1].Clear;
  trkCombo.Items.clear;

  for i:=0 to trkList.count - 1 do begin
    newT := trkList.Items[i];
    Chart1.SeriesList[0].AddXY(newT^.number, newT^.work, '', clGreen);
    Chart1.SeriesList[1].AddXY(newT^.number, newT^.stay, '', clRed);
    trkCombo.Items.Insert(0, IntToStr(newT^.number));
  end;
  trkCombo.Items.Insert(0, 'Все');
  trkCombo.ItemIndex := 0;

  SetPeriods;
end;

procedure Tf_trkEff.FormShow(Sender: TObject);
begin
  DateTimePicker1.Date := Date;
  DateTimePicker2.date := Date;
end;

procedure Tf_trkEff.FormatTRK;
var
currTRK: string;  //список АЗС работавщих час назад
i, j: integer;
curr: ^oneDay;
begin
//составим список доступных АЗС
  trkListQ.Close;
  trkListQ.SetVariable(0, DateTimePicker1.date - 30);
  trkListQ.SetVariable(1, DateTimePicker1.date);
  trkListQ.Setvariable(2, RxDBLookupCombo1.Text);
  trkListQ.Open;
//инициализируем список АЗС
  currTRK := '';
  while not trkListQ.eof do begin
    currTRK := currTRK + '|' + trkListQ.FieldValues['m'];
    trkListQ.next;
  end;
//  currTRK := MidStr(currTRK, 1, length(currTRK) - 1);
//теперь начинаем идти по списку АЗС и определять их работу
  for i:=0 to list.count - 1 do begin
    curr := list.items[i];
    for j:=0 to 23 do begin //сравниваем все трк в этом днес предыдущим часом
      curr^.trk[j] := compareTRK(currTRK, curr^.trk[j]);
      currTRK := curr^.trk[j];
    end;
  end;

//идем от начала к концу и выставляем периоды

end;

function Tf_trkEff.CompareTRK(curr, trk: string): string;
//сравниваем curr с trk
var
i, j, tmp: integer;
f: boolean;
str: string;
currList, trkList: TList;
newI: ^integer;
c, t: ^integer;
begin
  currList := TList.Create;
  trkList := TList.Create;
  Result := trk;

  //разбираем на список колонки предыдущего часа
  if length(curr) > 0 then begin
    str := '';
    for i := length(curr) downto 1 do begin
      if ((curr[i] = '|') or (curr[i] = '!') or ((curr[i] = '?'))) and (str <> '') then begin
      //ищем эту колонку в trk
        new(newI);
        if curr[i] = '!' then
          newI^ := -(StrToInt(str))
        else
          newI^ := StrToInt(str);
        currList.Add(newI);
        str := '';
        continue;
      end;
      str := curr[i] + str;
    end;
  end;

  //разбираем на список колонки текущего часа
  if length(trk) > 0 then begin
    str := '';
    for i := length(trk) downto 1 do begin
      if ((trk[i] = '|') or (trk[i] = '!') or (curr[i] = '?')) and (str <> '') then begin
      //ищем эту колонку в trk
        new(newI);
        if trk[i] = '!' then
          newI^ := -(StrToInt(str))
        else
          newI^ := StrToInt(str);
        trkList.Add(newI);
        str := '';
        continue;
      end;
      str := trk[i] + str;
    end;
  end;

//начинаем сравнивать предыдущий час и текущий
  for i:=0 to currList.Count - 1 do begin
    c := currList.Items[i];
    f := false;
    for j:=0 to trkList.Count - 1 do begin
      t := trkList.Items[j];
      if abs(t^) = abs(c^) then begin
        f := true;
        break;
      end;
    end;
    if f = false then begin //колонка пропала
      new(newI);
      newI^ := -abs(c^);
      trkList.Add(newI);
    end;
  end;

//сортируем новый список ТРК
  for i:=0 to trkList.Count - 2 do begin
    c := trkList.Items[i];
    for j:=i + 1 to trkList.Count - 1 do begin
      t := trkList.Items[j];
      if abs(t^) < abs(c^) then begin
        tmp := t^;
        t^ := c^;
        c^ := tmp;
      end;
    end;
  end;

//строим новую строку
  Result := '';  

  for i:=0 to trkList.Count - 1 do begin
    c := trkList.Items[i];
    if c^ < 0 then
      Result := Result + '?'
    else
      Result := Result + '|';
    Result := Result + IntToStr(abs(c^));
  end;

  currList.clear; currList.free;
  trkList.clear; trkList.free;
end;

procedure Tf_trkEff.gridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
const w: array[1..7] of string = ('Понедельник', 'Вторник',
  'Среда', 'Четверг', 'Пятница', 'Суббота', 'Воскресенье'); 
var
d:  ^oneDay;
trk, str: string;
x, i: integer;
begin
//  inherited;

//  if aRow = 0 then
//    exit;
//  if list = nil then
//    exit;
//  if list.count <= aRow - 1 then
//    exit;

  str := grid.Cells[aCol, aRow];  
//  d := list.Items[aRow - 1];

//  str := d^.trk[aCol - 1];

  Grid.Canvas.Brush.Color := clWhite;
  Grid.Canvas.FillRect(rect);
//  Grid.Canvas.Brush.Color := clBlack;

  if (aCol = 1) or (aRow = 0) then begin
    SetTextColor(grid.canvas.Handle, clBlack);
    SetBkColor(grid.canvas.Handle, clWhite);
    Grid.Canvas.TextOut(rect.Left, rect.top, str);
    exit;
  end;

  if (aCol = 0) and (aRow > 0) and (str <> '') then begin
    Grid.Canvas.TextOut(rect.Left, rect.top, w[StrToInt(str)]);
    exit;
  end;

//начинаем разбирать строку с ТРК

  SetTextColor(grid.canvas.Handle, clWhite);
//  Grid.Canvas.TextOut(rect.Left, rect.top, str);
  x := 0;
  for i:=1 to length(str) do begin
    if str[i] = '|' then begin
      if trk <> '' then begin
        if ((trkCombo.Text = 'Все') or (trk = trkCombo.Text))
        then begin
          Grid.Canvas.TextOut(rect.Left + x, rect.top + 1, ' ' + trk + ' ');
          x := x + grid.Canvas.TextWidth(trk) + 7;
        end;
      end;
      SetBkColor(grid.canvas.Handle, clGreen);
      SetTextColor(grid.canvas.handle, clWhite);
      trk := '';
      continue;
    end;
    if str[i] = '?' then begin
      if trk <> '' then begin
        if (trkCombo.Text = 'Все') or (trk = trkCombo.Text)
          then begin
          Grid.Canvas.TextOut(rect.Left + x, rect.top + 1, ' ' + trk + ' ');
          x := x + grid.Canvas.TextWidth(trk) + 7;
        end;
      end;
      SetBkColor(grid.canvas.Handle, clYellow);
      SetTextColor(grid.canvas.handle, clBlack);
      trk := '';
      continue;
    end;
    if str[i] = '!' then begin
      if trk <> '' then begin
        if (trkCombo.Text = 'Все') or (trk = trkCombo.Text)
          then begin
          Grid.Canvas.TextOut(rect.Left + x, rect.top + 1, ' ' + trk + ' ');
          x := x + grid.Canvas.TextWidth(trk) + 7;
        end;
      end;
      SetBkColor(grid.canvas.Handle, clRed);
      SetTextColor(grid.canvas.handle, clWhite);
      trk := '';
      continue;
    end;

    trk := trk + str[i];
  end;
  if (trkCombo.Text = 'Все') or (trk = trkCombo.Text) then begin
    Grid.Canvas.TextOut(rect.Left + x, rect.top + 1, ' ' + trk + ' ');
  end;

  maxWidth := 130;
end;

procedure Tf_trkEff.AddHour(trk: integer; work: boolean);
var
curr: ^trkRec;
i: integer;
begin
  for i:=0 to trkList.count - 1 do begin
    curr := trkList.Items[i];
    if curr^.number = trk then begin
      if work = true then
        Inc(curr^.work)
      else
        Inc(curr^.stay);
      exit;
    end;
  end;

  new(curr);
  curr^.number := trk;
  curr^.work := 0;
  curr^.stay := 0;
  if work = true then
    Inc(curr^.work)
  else
    Inc(curr^.stay);
  trkList.Add(curr);
end;

procedure Tf_trkEff.trkComboChange(Sender: TObject);
begin
  inherited;
  grid.repaint;
end;

procedure Tf_trkEff.visClick(Sender: TObject);
begin
  inherited;
  grid.repaint;
end;

function Tf_trkEff.IsTRKWork(trk: integer; data: string): boolean;
//смотрим знак перед ТРК в строке data
var
i: integer;
str: string;
begin
  for i:=length(data) downto 1 do begin
    if (data[i] = '|') or (data[i] = '!') or (data[i] = '?') then begin
      if StrToInt(str) = trk then begin
        case (data[i]) of
          '|': begin Result := true; exit; end;
          '?': begin Result := false; exit; end;
          '!': begin Result := false; exit; end;
        end;
      end
      else begin
        str := '';
        continue;
      end;
    end;
    str := data[i] + str;
  end;
end;

procedure Tf_trkEff.SetTRKStatus(var data: string; trk: integer;
  status: char);
//выставить в строке data новый статус ТРК
var
i: integer;
str: string;
begin
  for i:=length(data) downto 1 do begin
    if (data[i] = '|') or (data[i] = '!') or (data[i] = '?') then begin
      if StrToInt(str) = trk then begin
        data[i] := status;
        exit;
      end
      else begin
        str := '';
        continue;
      end;
    end;
    str := data[i] + str;
  end;
end;

procedure Tf_trkEff.SetPeriods;
var
count, i, j, k: integer;
newT: ^trkRec;
newR: ^oneDay;
f: boolean;
max: integer;
begin
  max := StrToInt(Edit2.text);
  //превращаем все ? в !
  for j:=0 to list.count - 1 do begin
    newR := list.Items[j];
    for i:=0 to 23 do
      newR.trk[i] := AnsiReplaceStr(newR.trk[i], '!', '?');
  end;

//теперь отлавливаем периоды по ТРК
  //Сначало идем в одну сторону
  for i:=0 to trkList.count - 1 do begin //цикл по ТРК
    newT := trkList.Items[i];
    count := 0;
    for j:=0 to list.count - 1 do begin//идем по данным  
      newR := list.Items[j];//берем одни сутки
      for k:=0 to 23 do begin
        if IsTRKWork(newT^.number, newR^.trk[k]) = false then begin //простаиваем
          inc(count); //считаем часы простоя ТРК
          if count >= max then begin //простой критический
            SetTRKStatus(newR.trk[k], newT^.number, '!');
          end;
          continue;
        end
        else begin //ТРК работает
          f := false;
          count := 0;
        end;
      end;
    end;
  end;

  //Теперь идем в другую сторону
  for i:=trkList.count - 1 downto 0 do begin //цикл по ТРК
    newT := trkList.Items[i];
    f := false;
    for j:=list.count - 1 downto 0 do begin//идем по данным
      newR := list.Items[j];//берем одни сутки
      for k:=23 downto 0 do begin
        if getTRKStatus(newT^.number, newR^.trk[k]) = '!' then begin
        //поймали начало периода
          f := true;
          continue;
        end;
        if (IsTRKWork(newT^.number, newR^.trk[k]) = false) and
          (f = true) then begin //продолжение периода
          SetTrkStatus(newR^.trk[k], newT^.number, '!');
          continue;
        end;
        if IsTRKWork(newT^.number, newR^.trk[k]) = true then
        //конец периода
          f := false;
      end;
    end;
  end;



  //заполняем таблицу
  for i:=0 to list.count - 1 do begin
    newR := list.Items[i];
    grid.Cells[1, i + 1] := DateToStr(newR^.dat);
    grid.Cells[0, i + 1] := IntToStr(DayOfTheWeek(newR^.dat));
    for j:=0 to 23 do
      grid.Cells[j + 2, i + 1] := newR^.trk[j];
  end;
  
end;

function Tf_trkEff.GetTRKStatus(trk: integer; data: string): char;
var
i: integer;
str: string;
begin
  for i:=length(data) downto 1 do begin
    if (data[i] = '|') or (data[i] = '!') or (data[i] = '?') then begin
      if StrToInt(str) = trk then begin
        Result := data[i];
        exit;
      end
      else begin
        str := '';
        continue;
      end;
    end;
    str := data[i] + str;
  end;
end;

procedure Tf_trkEff.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  inherited;
  Edit1.Text := IntToStr(UpDown1.Position);
  Grid.DefaultColWidth := UpDown1.Position;
  grid.colWidths[0] := 100;
  grid.colWidths[1] := 100;
  Grid.repaint;
end;

procedure Tf_trkEff.UpDown3Click(Sender: TObject; Button: TUDBtnType);
begin
  inherited;
  Edit2.Text := IntToStr(UpDown3.Position);
  SetPeriods;
  grid.repaint;
end;

procedure Tf_trkEff.Edit1Change(Sender: TObject);
begin
  inherited;
  UpDown1.position := StrToInt(edit1.text);
  Edit1.Text := IntToStr(UpDown1.Position);
  Grid.DefaultColWidth := UpDown1.Position;
  grid.colWidths[0] := 100;
  grid.colWidths[1] := 100;
  Grid.repaint;
end;

end.
