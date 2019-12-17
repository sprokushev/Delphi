unit extGrid;

interface
uses graphics, grids, classes, types, windows, sysutils, dialogs;

type SCell=record //структура дл€ описани€ €чейки таблицы
  id: integer;    //некий уникальный идентификатор
  MergeWidth: integer;  //сколько €чеек объединено вправо
  MergeHeight: integer; //—кольок €чеек объединено вниз
  text: string; //текст в €чейке
  r, c: integer;  //строка и столбец, где находитс€ €чейка
  selected: boolean;  //выделена ли €чейка
  fixed: boolean;     //€чейка фиксированна
  draw: boolean;      //надо ли рисовать €чейку
  halign: integer;    //горизонтальное выравниваение
  valign: integer;    //вертикальное выравнивание
end;

type PSCell = ^SCell;

type TExtGrid = class
protected
  canvas: TCanvas;  //канава таблицы, где будем рисовать
  grid: TStringGrid;
  cells: TList; //список €чеек (типа SCell)
  uniID: integer; //уникальный идентификатор
  function GetID: integer; //получить следующий идентификатор
  procedure DrawCellSys(c: PSCell; rect: TRect); //рисование €чейки
  function FindCell(r, c: integer):PSCell;  //найти €чейку
  function GetRect(c: PSCell):TRect;
  function GetText(c: PSCell):string;
public
  constructor Create(grid1: TStringGrid);//конструктор
  destructor Free;  //деструктор

  procedure Merge(r1, c1, r2, c2: integer);//объединить €чейки

  procedure DrawCell(r, c: integer);//нарисовать €чейку

  function AddRow: integer; //добавить строку
  function AddCol: integer; //добавить столбец
  procedure SetHAlign(col, row, align: integer);
  procedure SetVAlign(col, row, align: integer);  
end;

implementation
{ TExtGrid }

function TExtGrid.AddCol: integer;
begin

  Result := grid.ColCount;
end;

function TExtGrid.AddRow: integer;
begin

  Result := grid.RowCount;
end;

constructor TExtGrid.Create(grid1: TStringGrid);
var
newC: ^SCell;
i, j: integer;
begin
  uniID := 0;
  grid := grid1;
  canvas := grid1.Canvas;
  cells := TList.Create;

//сканируем таблицу и заносим все €чейки в пам€ть
  for j:=0 to grid1.RowCount - 1 do begin
    for i:=0 to grid1.ColCount - 1 do begin
      new(newC);
      newC^.id := GetID;
      newC^.r := j;
      newC^.c := i;
      newC^.MergeWidth := 0; //ни с чем не объединено
      newC^.MergeHeight := 0;
      newC^.text := Grid1.Cells[i, j];
      newC^.selected := false;
      newC^.draw := true;
      newC^.halign := 2;
      newC^.valign := 2;
      if (i < grid1.FixedCols) or (j < grid1.FixedRows) then
        newC^.fixed := true //фиксированна€ €чейка
      else
        newC^.fixed := false;
      cells.Add(newC);
    end;
  end;

end;

procedure TExtGrid.DrawCell(r, c: integer);
var
i: integer;
curr: PSCell;
rect: TRect;
begin
  //ищем нужную нам €чейку
  curr := FindCell(r, c);
//  if curr.draw = false then
//    exit;
  rect := GetRect(curr);
  DrawCellSys(curr, rect);

{  for i:=0 to cells.Count - 1 do begin
    curr := cells[i];
    if (curr^.r = r) and (curr^.c = c) then begin
    //рисуем €чейку
      rect := grid.CellRect(c, r);
      DrawCellSys(curr, rect);
    end;
  end;}
end;

procedure TExtGrid.DrawCellSys(c: PSCell; rect: TRect);
//рисуем €чейку более подробно
var
str: string;
x, y: integer;
begin
  if (c.c <> grid.FixedCols) or (c.r < grid.FixedRows) then
      Dec(rect.Left);
  if (c.r <> grid.FixedRows) or (c.c < grid.FixedCols)then
    Dec(rect.Top);
//поработать на рамочкой
  if c.fixed = true then begin
    Canvas.Brush.Color := grid.FixedColor;
    Canvas.Pen.Color := clBlack;
  end
  else begin
    Canvas.Brush.Color := grid.Color;
    Canvas.pen.Color := grid.FixedColor;
  end;

  str := GetText(c);
  Canvas.Rectangle(rect);

//рисуем текст
  str := grid.Cells[c.c, c.r];

  y := rect.top;
//горизонтальное выравнивание
  case c.halign of
  1:  begin
        x := rect.left + 3;
        SetTextAlign(canvas.Handle, TA_LEFT);
      end;
  2:  begin
        x := (rect.right + rect.left) shr 1;
        SetTextAlign(canvas.Handle, TA_CENTER);
      end;
  3:  begin
        x := rect.right - 3;
        SetTextAlign(canvas.Handle, TA_RIGHT);
      end;
  end;

  //вертикальное выравнивание
  case c.valign of
  1: y := rect.top + 1;
  2:  begin
        y := (rect.Bottom + rect.top) shr 1;
        y := y - (Canvas.TextHeight(str) shr 1);
      end;
  3: y := rect.Bottom - 1 - Canvas.TextHeight(str);
  end;

  canvas.TextOut(x, y, str);
end;

function TExtGrid.FindCell(r, c: integer): PSCell;
var
i: integer;
curr: PSCell;
begin
  Result := nil;
  for i:=0 to cells.Count - 1 do begin
    curr := cells[i];
    if (curr^.r = r) and (curr^.c = c) then begin
      Result := curr;
      break;
    end;
  end;
end;

destructor TExtGrid.Free;
begin

end;

function TExtGrid.GetID: integer;
begin
  Inc(uniID);
  Result := uniID;
end;

function TExtGrid.GetRect(c: PSCell): TRect;
//определ€ем регион, где рисуетс€ €чейка
var
i, j: integer;
tmp: PSCell;
rect: TRect;
str: string;
f: boolean;
begin
  Result := grid.CellRect(c.c, c.r);
  if c.Draw = true then begin //если €чейка рисуетс€ по определению
    if (c.MergeWidth > 0) or (c.MergeHeight > 0) then begin
      tmp := FindCell(c.r + c.MergeHeight, c.c + c.MergeWidth);
      rect := grid.CellRect(tmp.c, tmp.r);
      Result.Right := rect.Right;
      Result.Bottom := rect.Bottom;
    end;
    exit;
  end
  else begin  //если €чейка входит в состав других €чеек
    f := false;
      for j:=c.r downto 0 do begin
        if f = true then
          break;
        for i:=c.c downto 0 do begin
          tmp := FindCell(j, i);
          if tmp.draw = true then begin
            Result.left := grid.CellRect(i, j).Left;
            Result.top := grid.CellRect(i, j).top;
            f := true;
            break;
          end;
        end;
      end;
//      Result.right := Result.left + 3;
//      Result.bottom := Result.top + 3;
  end;
end;


function TExtGrid.GetText(c: PSCell): string;
//определ€ем текст в €чейке
var
i, j: integer;
tmp: PSCell;
rect: TRect;
str: string;
f: boolean;
begin
  Result := grid.Cells[c.c, c.r];
  if c.Draw = false then begin //если €чейка рисуетс€ по определению
    f := false;
    for j:=c.r downto 0 do begin
      if f = true then
        break;
      for i:=c.c downto 0 do begin
        tmp := FindCell(j, i);
        if tmp.draw = true then begin
          Result := grid.Cells[i, j];
          f := true;
          break;
        end;
      end;
    end;
  end;

end;

procedure TExtGrid.Merge(r1, c1, r2, c2: integer);
//объедин€ем €чейки
var
i, j: integer;
cell1, cell2: PSCell;
begin
  if (r1 >= grid.RowCount) or (c1 >= grid.ColCount) then
    exit;

  if r2 >= grid.RowCount then
    r2 := grid.RowCount - 1;
  if c2 >= grid.ColCount then
    c2 := grid.ColCount - 1;

  //объедин€ем €чейки
  cell1 := FindCell(r1, c1);
  cell1.MergeWidth := c2 - c1;
  cell1.MergeHeight := r2 - r1;
  for j:=r1 to r2 do
    for i:=c1 to c2 do begin
      if (i = c1) and (j = r1) then
        continue;
      cell2 := FindCell(j, i);
      cell2.draw := false;
    end;

  grid.repaint;
end;

procedure TExtGrid.SetHAlign(col, row, align: integer);
var
c: PSCell;
begin
  c := FindCell(row, col);
  c.halign := align;
end;

procedure TExtGrid.SetVAlign(col, row, align: integer);
var
c: PSCell;
begin
  c := FindCell(row, col);
  c.valign := align;
end;

end.
