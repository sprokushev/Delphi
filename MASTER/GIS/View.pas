unit View;

{$define DEBUG}

interface

uses ExtCtrls, types, graphics, classes, layer, global,
  sysutils, objectDraw, controls, StdCtrls, grids;

const mdArrow = 1;
const mdInc = 2;
const mdDec = 3;
const mdHand = 4;

type TView = class
  protected
    layers: TList;  //список слоев (класс TLayer)
    currLayer:  Pointer;  //текущий лист
    pDC:  TPaintBox;
    xPressOld, yPressOld: integer;
    backBuffer: TBitmap;
    function GetLayer(layerID: integer): Pointer;
  public
    m_drag: boolean;
    selected: boolean;  //признак того, что под мышкой есть объект
    mouseMode: integer;

  //дублируем события из вне
    procedure LMouseDown(x, y: integer);
    procedure MouseMove(x, y: integer);
    procedure LMouseUp(x, y: integer);
    procedure SetMouseMode(mode: integer);

  //функции управления слоями
    procedure ClearLayer(layerID: integer);
    function AddLayer: integer; //добавить слой

  //получение доступа к объектам
    function GetObjectCount(layerID: integer): integer;
    function GetObject(layerID, ID: integer): Pointer;
    function GetObjectBySystemID(layerID, systemID: integer): Pointer;    
    function GetObjectID(layerID, x, y: integer): integer;
    function GetObjectByName(layerID: integer; name: string): TDrawObject;
    function GetSystemID(layerID, x, y: integer): integer;
    function GetObjectText(layerID: integer; id: integer): string;
    function GetTextBySystemID(layerID: integer; ID: integer): string;
    procedure GetMultiSystemID(layerID, x, y: integer; list: TList);
    function GetAlarmTexts(layerID, systemID: integer; separator: string):string;
    function IsAlarm(layerID: integer): boolean;

    function SelectObjectByname(layerID: integer; name:string): integer;
    procedure SelectObject(layerID, ID: integer);
    procedure SelectBySystemID(layerID, ID: integer);
    procedure UnselctAll(layerID: integer);
    procedure UnAlarmAll(layerID: integer);

    procedure VisibleEveryOne(layerID: integer; show: boolean);
    procedure SetVisible(layerID, id: integer; show: boolean);
    procedure SetAlarmText(layerID: integer; systemID: integer; text: string);

    procedure ZoomToObject(layerID, id: integer);//увеличение до размеров объекта
    procedure ZoomToAll(layerID: integer);
    procedure Zoom(layerID: integer; scale: double);

    procedure CopyLayer(layerDest, layerSrc, offsetX, offsetY: integer);

  //функции рисования
    //отрисовать все на PaintBox
    procedure Draw;
    procedure Showlayer(id: integer; show: boolean);

    //загрузиться из dxf файла
    procedure LoadDxfAsPolygons(l: integer; fileName: string; col1, col2: TCOLOR);
    procedure LoadDxfAsLines(l: integer; fileName: string; widthDefault: integer; colorDefault: TColor);
    procedure LoadObjects(l: integer; fileName: string);

    //рисование примитивов
    procedure Line(layerID: integer; x1, y1, x2, y2, width: integer; color: TColor);
    procedure PolyLine(layerID: integer; vert:array of TPoint; count: integer; width: integer; col: TColor);
    function Polygon(layerID: integer; vert:array of TPoint; count: integer; width: integer; col1, col2: TColor): integer;
    function Text(layerID, x, y: integer; str, fontName: string; size: integer; ang: integer; col1: TColor): integer;

  //добавление объектов
    function AddAzs(layerID, x, y, ID: integer; name: string; col1, col2: TColor): integer;
    function AddTown(layerID, x, y, ID: integer; name: string; rad1, rad2, under, caption_place: integer): integer;
    function AddRailWay(layerID, x1, y1, x2, y2: integer): integer;    

    procedure CalcLayer(layerID: integer);

    procedure SetText(layerID, index: integer; str: string);
    procedure SetColor(layerID, index: integer; col1, col2: TColor);

    procedure CreateListObject(layerID: integer; grid: TStringGrid);
    procedure Animate(layerID: integer); 

    constructor Create(p: TPaintBox); //конструктор
    destructor Free;    //деструктор
end;

implementation

{ TView }

function TView.AddLayer: integer;
//добавляет один слой и возвращает его идентификатор
var
i, ID: integer;
newL: ^TLayer;
begin
//определяем идентификатор
  ID := 0;
  for i:=0 to layers.Count - 1 do begin
    newL := layers.Items[i];
    if newL.ID > ID then
      ID := newL.ID;
  end;
  Inc(ID);
//создаем новый слой
  new(newL);
  newL^ := TLayer.Create;
  newL^.ID := ID;
  newL^.visible := true;
  layers.Add(newL);
  currLayer := newL;
//рисуем на текущем листе линию
  AddLayer := ID;
end;

procedure TView.PolyLine(layerID: integer; vert: array of TPoint; count,
  width: integer; col: TColor);
var
curr: ^TLayer;
begin
  curr := GetLayer(layerID);
  curr.AddPolyLine(vert, count, width, col);
end;

constructor TView.Create(p: TPaintBox);
begin
  glViewMatrix.scroll.cx := 0;
  glViewMatrix.scroll.cy := 0;
  glViewMatrix.scale := 1;
  P.ControlStyle := P.ControlStyle + [csOpaque];
  layers := TList.Create;
  pDC := p;
end;

procedure TView.Draw;
//рисует содержимое на паинтбох в строго заданном прямоугольнике
var
buf:  TBitmap;
i:    integer;
curr: ^TLayer;
r:  TRect;
begin
  glViewMatrix.size.cx := pDC.Width;
  glViewMatrix.size.cy := pDC.Height;

//создаем буфер для рисования
  buf := TBitmap.Create;
  buf.Width := glViewMatrix.size.cx;
  buf.Height := glViewMatrix.size.cy;

//рисуем в буфер
  With buf.Canvas do begin
    Brush.Color := clWhite;
    FillRect(ClipRect);

    for i:=0 to layers.Count - 1 do begin
      curr := layers.Items[i];
      curr.Draw(buf.Canvas);
    end;

  end;

//выводим буфер на экран
  r := Rect(0, 0, glViewMatrix.size.cx, glViewMatrix.size.cy);
  pDC.Canvas.CopyRect(r, buf.Canvas, RECT(0, 0, buf.Width, buf.Height));

//освобождаем память под буфер
  buf.Free;
end;

destructor TView.Free;
begin
  layers.Free;
  backBuffer.Free;
end;

function TView.GetLayer(layerID: integer): Pointer;
//возвращает указатель на слой с указанных идентификатором
var
i:  integer;
curr: ^TLayer;
begin
  for i:=0 to layers.Count - 1 do begin
    curr := layers.Items[i];
    if curr.ID = layerID then break;
  end;
  GetLayer := curr;
end;

procedure TView.Line(layerID, x1, y1, x2, y2, width: integer;
  color: TColor);
var
curr: ^TLayer;
begin
  curr := GetLayer(layerID);
  curr.AddLine(x1, y1, x2, y2, width, color);
end;

procedure TView.LoadDxfAsPolygons(l: integer; fileName: string; col1, col2: TCOLOR);
var
f:  textFile;
s:  string;
vf: boolean;  //признак того, что читаем вершину
i, x, y: integer;
xx: real;
v:  array of tpoint;
mas: TList;
newP: ^TPoint;
begin
  mas := TList.Create;
  AssignFile(f, fileName);
  Reset(f);

//читаем до полилинии
  repeat
    readln(f, s);
  until s='POLYLINE';

  repeat
    repeat
      while s <> 'VERTEX' do  //топаем до вершины
        readln(f, s);
      x := 0;
      y := 0;
      readln(f, s);
      s := Trim(s);
      vf := false;
      repeat  //читаем вершину
        if s = '10' then begin
          readln(f, s);
          xx := StrToFloat(s);
          x := Round( xx );
          vf := true;
        end;
        if s = '20' then begin
          readln(f, s);
          xx := StrToFloat(s);
          y := Round( xx );
          vf := true;
        end;
        if vf = false then
          readln(f, s);
        readln(f, s);
        s := Trim(s);
      until s = '0';
      new(newP);
      newP^.X := x;
      newP^.Y := y;
      mas.Add(newP);
      readln(f, s);
      s := Trim(s);
    until s='SEQEND';
      readln(f, s);
      readln(f, s);
      readln(f, s);
      readln(f, s);
    //создаем объект
    SetLength(v, mas.Count);
    for i:=0 to mas.Count - 1 do begin
      newP := mas.Items[i];
      v[i].X := newP.X;
      v[i].Y := -newP.Y;
    end;
    Polygon(l, v, mas.Count, 1, col1, col2);
    mas.Clear;
  until s='ENDSEC';
  mas.Free;
end;

function TView.Polygon(layerID: integer; vert: array of TPoint; count,
  width: integer; col1, col2: TColor): integer;
var
curr: ^TLayer;
begin
  curr := GetLayer(layerID);
  polygon := curr.AddPolygon(vert, count, width, col1, col2);
end;

procedure TView.SetColor(layerID, index: integer; col1, col2: TColor);
//изменяет цвет заданного объекта
var
l:  ^TLayer;
begin
  l := GetLayer(layerID);
  l.SetColor(index, col1, col2);

end;

procedure TView.LoadDxfAsLines(l: integer; fileName: string; widthDefault: integer; colorDefault: TColor);
var
f:  textFile;
s:  string;
vf: boolean;  //признак того, что читаем вершину
i, x, y: integer;
xx: real;
v:  array of tpoint;
mas: TList;
newP: ^TPoint;
begin
  mas := TList.Create;
  AssignFile(f, fileName);
  Reset(f);

//читаем до полилинии
  repeat
    readln(f, s);
  until s='POLYLINE';

  repeat
    repeat
      while s <> 'VERTEX' do  //топаем до вершины
        readln(f, s);
      x := 0;
      y := 0;
      readln(f, s);
      s := Trim(s);
      vf := false;
      repeat  //читаем вершину
        if s = '10' then begin
          readln(f, s);
          xx := StrToFloat(s);
          x := Round( xx );
          vf := true;
        end;
        if s = '20' then begin
          readln(f, s);
          xx := StrToFloat(s);
          y := Round( xx );
          vf := true;
        end;
        if vf = false then
          readln(f, s);
        readln(f, s);
        s := Trim(s);
      until s = '0';
      new(newP);
      newP^.X := x;
      newP^.Y := y;
      mas.Add(newP);
      readln(f, s);
      s := Trim(s);
    until s='SEQEND';
      readln(f, s);
      readln(f, s);
      readln(f, s);
      readln(f, s);
    //создаем объект
    SetLength(v, mas.Count);
    for i:=0 to mas.Count - 1 do begin
      newP := mas.Items[i];
      v[i].X := newP.X;
      v[i].Y := -newP.Y;
    end;
    PolyLine(l, v, mas.Count, widthDefault, colorDefault);
    mas.Clear;
  until s='ENDSEC';
  mas.Free; 
end;

procedure TView.Showlayer(id: integer; show: boolean);
var
l:  ^TLayer;
begin
  l := getLayer(id);
  l.visible := show;
end;

function TView.GetObjectID(layerID, x, y: integer): integer;
//возвращает поле текст из слоя, если в него попадают координаты
var
l:  ^TLayer;
res:  string;
begin
  l := GetLayer(layerID);
  if l.visible = true then
    GetObjectID := l.GetObjectID(x, y)
  else
    GetObjectID := 0;
end;

procedure TView.SetText(layerID, index: integer; str: string);
var
l:  ^TLayer;
begin
  l := GetLayer(layerID);
  l.SetText(index, str);
end;

function TView.GetObjectText(layerID: integer; ID: integer): string;
var
l:  ^TLayer;
begin
  l := GetLayer(layerID);
  if l.visible = true then
    GetObjectText := l.GetObjectText(id)
  else
    GetObjectText := '';
end;

procedure TView.VisibleEveryOne(layerID: integer; show: boolean);
var
l:  ^TLayer;
i:  integer;
begin
  for i:=0 to layers.Count - 1 do begin
    l := layers.Items[i];
    if l.ID = layerID then begin
      l.VisibleEveryOne(show);
      break;
    end;
  end;
end;

procedure TView.SetVisible(layerID, id: integer; show: boolean);
var
l:  ^TLayer;
i:  integer;
begin
  for i:=0 to layers.Count - 1 do begin
    l := layers.Items[i];
    if l.ID = layerID then begin
      l.SetVisibleObject(id, show);
      break;
    end;
  end;
end;

procedure TView.ZoomToObject(layerID, id: integer);
var
l:  ^TLayer;
i:  integer;
begin
  for i:=0 to layers.Count - 1 do begin
    l := layers.Items[i];
    if l.ID = layerID then begin
      l.ZoomToobject(id);
      break;
    end;
  end;
end;

procedure TView.LoadObjects(l: integer; fileName: string);
//загружает объекты по карте
var
f:  textFile;
s:  string;
o:  ^TDrawObject;
begin
  AssignFile(f, filename);
  Reset(f);

  while not eof(f) do begin
    readln(f, s);
    if s='{' then begin //новый объект
      delete(s, 1, 1);
      new(o);
      o^ := TDrawObject.Create;
    end;
  end;

end;



procedure TView.ClearLayer(layerID: integer);
//очищает лист
var
l:  ^TLayer;
i:  integer;
begin
  for i:=0 to layers.Count - 1 do begin
    l := layers.Items[i];
    if l.ID = layerID then begin
      l.clear;
      break;
    end;
  end;
end;

procedure TView.CopyLayer(layerDest, layerSrc, offsetX, offsetY: integer);
var
ldest, lSrc, o:  ^TLayer;
descO, srcO: ^TDrawObject;
i:  integer;
begin
//ищем нужные слои
  for i:=0 to layers.Count - 1 do begin
    o := layers.Items[i];
    if o.ID = layerDest then
      lDest := o;
    if o.ID = layerSrc then
      lSrc := 0;
  end;

  lDest^ := lSrc^;
  lDest.objects.Assign(lSrc.objects);  
//копируем объекты
end;

procedure TView.LMouseDown(x, y: integer);
var
r:  TRect;
begin
  xPressOld := X;
  yPressOld := Y;
  m_drag := true;

  if backBuffer = nil then
    backBuffer := TBitmap.Create;
  r := Rect(0, 0, glViewMatrix.size.cx, glViewMatrix.size.cy);
  backBuffer.Width := glViewMatrix.size.cx;
  backBuffer.Height := glViewMatrix.size.cy;
  backBuffer.Canvas.CopyRect(r, pDC.Canvas, r);
end;

procedure TView.MouseMove(x, y: integer);
var
s:  string;
tempBuf:  TBitmap;
rNew, rOld: TRect;
i:  integer;
begin

//смотрим, что это мы выбрали
if m_drag = false then begin

end;

if m_drag = true then begin
  tempBuf := TBitmap.Create;
    case (mouseMode) of
      mdInc, mdDec: begin
          rOld := Rect(0, 0, glViewMatrix.size.cx,  glViewMatrix.size.cy);
          pDC.Canvas.CopyRect(rOld, backBuffer.Canvas, rOld);
          //чертим пунктирную рамочку
          pDC.Canvas.Pen.Color := clBlack;
          pDC.Canvas.Pen.Style := psDot;
          pDC.Canvas.MoveTo(xPressOld, yPressOld);
          pDC.Canvas.LineTo(X, yPressOld);
          pDC.Canvas.LineTo(X, Y);
          pDC.Canvas.LineTo(xPressOld, Y);
          pDC.Canvas.LineTo(xPressOld, yPressOld);
      end;
      mdHand:    begin  //Режим перетаскивания
        tempBuf.Width := glViewMatrix.size.cx;
        tempBuf.Height := glViewMatrix.size.cy;
        rOld := Rect(0, 0, glViewMatrix.size.cx, glViewMatrix.size.cy);
        rNew := Rect(X - xPressOld, Y - yPressOld,
          X - xPressOld + glViewMatrix.size.cx,
          Y - yPressOld + glViewMatrix.size.cy);
        tempBuf.Canvas.Brush.Color := clWhite;
        tempBuf.Canvas.FillRect(pDC.Canvas.ClipRect);
        tempBuf.Canvas.CopyRect(rNew, backBuffer.Canvas, rOld);
        pDC.Canvas.CopyRect(rOld, tempBuf.Canvas, rOld);
      end;
    end;
  tempBuf.Free;
end;

end;

procedure TView.SetMouseMode(mode: integer);
begin
  mouseMode := mode;
  pDC.Repaint;
end;

procedure TView.LMouseUp(x, y: integer);
var
rOld: TRect;
m_xScroll, m_yScroll: integer;
oldScale, k, kt, m_scale, ds :  double;
xCenter, yCenter, newXCenter, newYCenter: integer;
begin

  if ((xPressOld - x) = 0) or ((yPressOld - y) = 0) then begin
    m_drag := false;
    exit;
  end;
  
//если мы что-то таскали, то
  if m_drag = true then begin
    xCenter := round(glViewMatrix.size.cx/2);
    yCenter := round(glViewMatrix.size.cy/2);
    newXCenter := round((X + xPressOld)/2);
    newYCenter := round((Y + yPressOld)/2);
    oldScale := glViewMatrix.scale;

    case (mouseMode) of
    1:  //стрелка
        ;
    mdInc:  begin //увеличение
      m_xScroll := glViewMatrix.scroll.cx;
      m_yScroll := glViewMatrix.scroll.cy;
      m_scale := glViewMatrix.scale;
      //определяем новый центр проекции
      //сначало старый
      m_xScroll := round(m_xScroll/m_scale);
      m_yScroll := round(m_yScroll/m_scale);
      //определяем коэффициент масштабирования
      kt := glViewMatrix.size.cx/glViewMatrix.size.cy;
      k := abs((X - xPressOld)/(Y - yPressOld));
      if k>kt then begin//оперируем горизонталью
        ds := abs(X - xPressOld);
        m_scale := m_scale*(glViewMatrix.size.cx/ds);
//        m_scale *= (PaintBox1->Width/ds);
      end
      else begin //масштабируем по вертикали
        ds := abs(Y - yPressOld);
        m_scale := m_scale*(glViewMatrix.size.cy/ds);
//        m_scale *= (PaintBox1->Height/ds);
      end;
      m_xScroll := m_xScroll - round((newXCenter - xCenter)/oldScale);
      m_xScroll := round(m_xScroll*m_scale);
      m_yScroll := m_yScroll - round((newYCenter - yCenter)/oldScale);
      m_yScroll := round(m_yScroll*m_scale);
      glViewMatrix.scale := m_scale;
      glViewMatrix.scroll.cx := m_xScroll;
      glViewMatrix.scroll.cy := m_yScroll;
      pDC.Repaint;
//      ReScale(m_scale);
//      ReScroll(m_xScroll, m_yScroll);
    end;
    mdDec:  begin//уменьшение
      m_xScroll := glViewMatrix.scroll.cx;
      m_yScroll := glViewMatrix.scroll.cy;
      m_scale := glViewMatrix.scale;
      //определяем новый центр проекции
      //сначало старый
      m_xScroll := round(m_xScroll/m_scale);
      m_yScroll := round(m_yScroll/m_scale);
      //определяем коэффициент масштабирования
      kt := pDC.Width/pDC.Height;
      k := abs((X - xPressOld)/(Y - yPressOld));
      if k>kt then begin//оперируем горизонталью
        ds := abs(X - xPressOld);
        m_scale := m_scale/(glViewMatrix.size.cx/ds);
      end
      else begin //масштабируем по вертикали
        ds := abs(Y - yPressOld);
        m_scale := m_scale/(glViewMatrix.size.cy/ds);
      end;
      m_xScroll := m_xScroll - round((newXCenter - xCenter)/oldScale);
      m_xScroll := round(m_xScroll*m_scale);
      m_yScroll := m_yScroll - round((newYCenter - yCenter)/oldScale);
      m_yScroll := round(m_yScroll*m_scale);
      glViewMatrix.scale := m_scale;
      glViewMatrix.scroll.cx := m_xScroll;
      glViewMatrix.scroll.cy := m_yScroll;
      pDC.Repaint;
//      ReScale(m_scale);
//      ReScroll(m_xScroll, m_yScroll);
    end;
    mdHand:  begin//рука
//m_xScroll += (X - m_xOld);
      glViewMatrix.scroll.cx := glViewMatrix.scroll.cx +
        (X - xPressOld);
      glViewMatrix.scroll.cy := glViewMatrix.scroll.cy +
        (Y - yPressOld);
      pDC.Repaint;
      end;
    end;
  end;
  m_drag := false;
end;

{procedure TView.CreateListObject(layerID: integer; List: TListBox);
//создаем список объектов
begin
  List.Items.Add('123');
end;}

procedure TView.ZoomToAll(layerID:integer);
var
l:  ^TLayer;
i:  integer;
begin
  for i:=0 to layers.Count - 1 do begin
    l := layers.Items[i];
    if l.ID = layerID then begin
      l.ZoomToAll;
      pDC.Repaint;
      break;
    end;
  end;
end;

procedure TView.SelectObject(layerID, ID: integer);
var
l:  ^TLayer;
i:  integer;
begin
  for i:=0 to layers.Count - 1 do begin
    l := layers.Items[i];
    if l.ID = layerID then
      l.SelectObject(ID);
  end;
end;

procedure TView.UnselctAll(layerID: integer);
var
l:  ^TLayer;
i:  integer;
begin
  for i:=0 to layers.Count - 1 do begin
    l := layers.Items[i];
    if l.ID = layerID then
      l.UnselectAll;
  end;
end;

function TView.GetObject(layerID, ID: integer): pointer;
var
l:  ^TLayer;
i:  integer;
o:  ^TDrawObject;
begin
  o := nil;
  for i:=0 to layers.Count - 1 do begin
    l := layers.Items[i];
    if (l.ID = layerID) and (l.visible = true) then begin
      o := l.GetObject(ID);
      break;
    end;
  end;
  GetObject := o;
end;

function TView.Text(layerID, x, y: integer; str, fontName: string; size: integer;
  ang: integer; col1: TColor): integer;
var
curr: ^TLayer;
begin
  curr := GetLayer(layerID);
  Text := curr.Addtext( x, y, str, fontName, size, ang, col1);
end;

function TView.AddAzs(layerID, x, y, ID: integer; name: string; col1, col2: TColor): integer;
var
curr: ^TLayer;
begin
  curr := GetLayer(layerID);
  AddAzs := curr.AddAzs(x, y, ID, name, col1, col2);
end;

function TView.GetSystemID(layerID, x, y: integer): integer;
var
l:  ^TLayer;
res:  string;
begin
  l := GetLayer(layerID);
  if l.visible = true then
    GetSystemID := l.GetSystemID(x, y)
  else
    GetSystemID := 0;
end;

function TView.GetTextBySystemID(layerID, ID: integer): string;
var
l:  ^TLayer;
begin
  l := GetLayer(layerID);
  if l.visible = true then
    GetTextBySystemID := l.GetTextForSystemID(id)
  else
    GetTextBySystemID := '';
end;

procedure TView.CreateListObject(layerID: integer; grid: TStringGrid);
//заполним указанную таблицу названиями объектов
var
l:  ^TLayer;
begin
  l := GetLayer(layerID);
  l.CreateListObject(grid);
end;

function TView.SelectObjectByname(layerID: integer; name: string): integer;
var
l:  ^TLayer;
i:  integer;
res:  integer;
begin
  for i:=0 to layers.Count - 1 do begin
    l := layers.Items[i];
    if l.ID = layerID then begin
      res := l.selectObjectByName(name);
      break;
    end;
  end;
  SelectObjectByName := res;
end;

procedure TView.Zoom(layerID: integer; scale: double);
var
l:  ^TLayer;
i:  integer;
begin
  for i:=0 to layers.Count - 1 do begin
    l := layers.Items[i];
    if l.ID = layerID then begin
      l.Zoom(scale);
      pDC.Repaint;
      break;
    end;
  end;
end;

function TView.GetObjectByName(layerID: integer;
  name: string): TDrawObject;
var
l:  ^TLayer;
i:  integer;
res : TDrawObject;
begin
  res := nil;
  for i:=0 to layers.Count - 1 do begin
    l := layers.Items[i];
    if (l.ID = layerID) and (l.visible = true) then begin
      res := l.GetObjectByName(name);
      break;
    end;
  end;
  GetObjectByName := res;
end;

procedure TView.CalcLayer(layerID: integer);
var
l:  ^TLayer;
i:  integer;
begin
  for i:=0 to layers.Count - 1 do begin
    l := layers.Items[i];
    if l.ID = layerID then begin
      l.CalcCounts;
      break;
    end;
  end;
end;

procedure TView.GetMultiSystemID(layerID, x, y: integer; list: TList);
var
l:  ^TLayer;

begin
  l := GetLayer(layerID);
  if l.visible = true then
    l.GetMultiSystemID(x, y, list)
  else
    list.Clear;
end;

procedure TView.SelectBySystemID(layerID, ID: integer);
var
l:  ^TLayer;
i:  integer;
begin
  for i:=0 to layers.Count - 1 do begin
    l := layers.Items[i];
    if l.ID = layerID then
      l.SelectBySystemID(ID);
  end;
end;

function TView.AddTown(layerID, x, y, ID: integer; name: string; rad1, rad2, under, caption_place: integer): integer;
var
curr: ^TLayer;
begin
  curr := GetLayer(layerID);
  AddTown := curr.AddTown(x, y, ID, name, rad1, rad2, under, caption_place);
end;

function TView.AddRailWay(layerID, x1, y1, x2, y2: integer): integer;
var
curr: ^TLayer;
begin
  curr := GetLayer(layerID);
  AddRailWay := curr.AddRailWay(x1, y1, x2, y2);
end;

function TView.GetObjectCount(layerID: integer): integer;
//возвращает количество объектов в листе
var
l:  ^TLayer;
begin
  l := GetLayer(layerID);
  GetObjectCount := l.objects.Count;
end;

procedure TView.UnAlarmAll(layerID: integer);
var
l:  ^TLayer;
i:  integer;
begin
  for i:=0 to layers.Count - 1 do begin
    l := layers.Items[i];
    if l.ID = layerID then
      l.UnAlarmAll;
  end;
end;

function TView.GetObjectBySystemID(layerID, systemID: integer): Pointer;
var
l:  ^TLayer;
i:  integer;
o:  ^TDrawObject;
begin
  o := nil;
  for i:=0 to layers.Count - 1 do begin
    l := layers.Items[i];
    if (l.ID = layerID) and (l.visible = true) then begin
      o := l.GetObjectBySystemID(systemID);
      break;
    end;
  end;
  GetObjectBySystemID := o;
end;

procedure TView.Animate(layerID: integer);
//анимируем лист
var
l:  ^TLayer;
begin
  l := GetLayer(layerID);
  l.Animate;
end;

procedure TView.SetAlarmText(layerID, systemID: integer; text: string);
//добавить к объекту предупреждение
var
l:  ^TLayer;
o:  ^TDrawObject;
begin
  l := GetLayer(layerID);
  o := l^.GetObjectbySystemID(systemID);

  o^.AddAlarmText(text);
end;

function TView.GetAlarmTexts(layerID, systemID: integer;
  separator: string): string;
var
l:  ^TLayer;
res:  string;
o:  ^TDrawObject;
begin
  l := GetLayer(layerID);

  o := l.GetObjectbySystemID(systemID);
  res := o^.GetAlarmAsString(separator);

  GetAlarmTexts := res;
end;

function TView.IsAlarm(layerID: integer): boolean;
//возвращает истину, если на листе есть отмеченные объекты
var
l:  ^TLayer;
res:  boolean;
begin
  l := GetLayer(layerID);

  if l^.GetAlarmCount > 0 then
    res := true
  else
    res := false;

  IsAlarm := res;
end;

end.
