unit ObjectDraw;

interface
uses types, graphics, classes, global, dialogs, sysutils, windows;

//{$define DEBUG_DRAWHITBOX} 


//класс - родитель для всех рисуемых объектов
type TDrawObject = class
  ID:     integer;  //идентификатор
  systemID: integer;
  typeObj: integer;
  x, y: integer;  //позиция объекта
  screenX, screenY: integer;
  text:   string;   //строка (если это текст)
  vertexes: TList;    //список координат объекта (структуры TPoint);
  screenCoord: TList; //вершины для отображения на экран
  width:  integer;  //ширина линии
  color1: TColor;   //цвет объекта
  color2: TColor;   //цвет заливки (если нужно)
  hitBox: TRect;    //прямоугольник в который вписывается объект целиком
  screenHitBox: TRect;  
  penStyle: TPenStyle;
  visible:  boolean;  //видим ли объект
  select:   boolean;  //выбран ли объект
  colorSelect:  TColor; //цвет для объведения выбранного объекта
  brushStyle: TBrushStyle;
  font: TLogFont;
  angle:  double;   //угол поворота (для текста)
  size: integer;    //размер шрифта
  count:  integer;  //счетчик (для мега-объекта)
  showCaption: boolean; //показывать ли текст (для мега-объектов)
  alarm:  boolean;  //на тот случай, если надо привлечь внимание к объекту
  animateCount: integer;  //переменная для счетчика кадров
  alarmTexts: TList; //список предупреждений (тип string)
  drawed: boolean;  //признак того, что фигура уже рисовалась
  function ReCalcHitBox: TRect; //приводит HitBox к экранным координатам
  function CheckView: boolean;  //надо ли отрисовывать объект
  procedure CreateHitBox;virtual;       //создает хитбокс

  procedure AddAlarmText(text: string);
  procedure ClearAlarm;
  function GetAlarmAsString(separator: string): string;

  procedure Draw(pDC: TCanvas);virtual;
  procedure DrawIfSelect(pDC: TCanvas);virtual;
  procedure SetPosition(xx, yy: integer);virtual;  //для мега объектов  
  procedure AddCoord(x, y: integer);
  procedure CalcScreenCoord;
  procedure CalcHitBox;virtual;
  function IsMouse(x, y: integer): boolean;virtual;
  function IsCrossSegment(x1, y1, x2, y2, x3, y3: double): boolean;
  procedure Animate;virtual;
  constructor Create;
  destructor  free;
end;

implementation

uses StrUtils;

{ TDrawObject }

procedure TDrawObject.AddAlarmText(text: string);
//добавить сообщение объекту
var
s:  ^string;
begin
  if alarmTexts = nil then
    alarmTexts := TList.Create;

  new(s);
  s^ := text;
  alarmTexts.Add(s);
  alarm := true;
end;

procedure TDrawObject.AddCoord(x, y: integer);
var
newP: ^TPoint;
begin
  new(newP);
  newP^.X := x;
  newP^.Y := y;
  vertexes.Add(newP);
end;

procedure TDrawObject.Animate;
begin

end;

procedure TDrawObject.CalcHitBox;
var
halfY, halfX: double;
begin
  halfX := glViewMatrix.size.cx/2;
  halfY := glViewMatrix.size.cy/2;
//пересчитываем hitBox;
  screenHitBox.Left := Round(halfX + (HitBox.Left)*glViewMatrix.scale) +
      glViewMatrix.scroll.cx;
  screenHitBox.Right := Round(halfX + (HitBox.Right)*glViewMatrix.scale) +
      glViewMatrix.scroll.cx;
  screenHitBox.Top := Round(halfY + (HitBox.Top)*glViewMatrix.scale) +
      glViewMatrix.scroll.cy;
  screenHitBox.Bottom := Round(halfY + (HitBox.Bottom)*glViewMatrix.scale) +
      glViewMatrix.scroll.cy;
end;

procedure TDrawObject.CalcScreenCoord;
var
curr, newC: ^TPoint;
i:  integer;
halfX, halfY: double;
begin
  halfX := glViewMatrix.size.cx/2;
  halfY := glViewMatrix.size.cy/2;

//очистим список вершин
{
  for i:=0 to screenCoord.Count - 1 do begin
    curr := screenCoord.Items[i];
    Dispose(curr);
  end;
  screenCoord.Clear;
}
//если уже рисовалаи, то список вершин сформирован
  if drawed = false then begin
    for i:=0 to vertexes.Count - 1 do begin
      curr := vertexes.Items[i];
      new(newC);
      newC.x := Round(halfX + (curr.x)*glViewMatrix.scale) +
        glViewMatrix.scroll.cx;
      newC.y := Round(halfY + (curr.y)*glViewMatrix.scale) +
        glViewMatrix.scroll.cy;
      screenCoord.Add(newC);
    end;
    drawed := true;
  end
  else
    for i:=0 to vertexes.Count - 1 do begin
      curr := vertexes.Items[i];
      newC := screenCoord.Items[i];
      newC^.x := Round(halfX + (curr.x)*glViewMatrix.scale) +
        glViewMatrix.scroll.cx;
      newC^.y := Round(halfY + (curr.y)*glViewMatrix.scale) +
        glViewMatrix.scroll.cy;
    end;
end;

function TDrawObject.CheckView: boolean;
var
res:  boolean;
begin

  CheckView := res;
end;

procedure TDrawObject.ClearAlarm;
//очистить все сообщения об опасности
var
i:  integer;
s:  ^string;
begin
  if alarmTexts = nil then
    exit;
  for i:=0 to alarmTexts.Count - 1 do begin
    s := alarmTexts.Items[i];
    Dispose(s);
  end;

  alarmTexts.Clear;

  alarm := false;
end;

constructor TDrawObject.Create;
begin
  drawed := false;
  FillChar(font, SizeOf(font), #0);
  vertexes := TList.Create;
  screenCoord := TList.Create;
  visible := true;
end;

procedure TDrawObject.CreateHitBox;
var
curr: ^TPoint;
left, right, top, bottom, i: integer;
begin
  for i:=0 to vertexes.Count - 1 do begin
    curr := vertexes.Items[i];  
    if i = 0 then begin
      left := curr.X;
      right := curr.X;
      top := curr.Y;
      bottom := curr.Y;
    end;
    if left > curr.X then left := curr.X;
    if right < curr.X then right := curr.X;
    if top > curr.Y then top := curr.Y;
    if bottom < curr.Y then bottom := curr.Y;
  end;
  hitBox := Rect(left, top, right, bottom);
end;

procedure TDrawObject.Draw(pDC: TCanvas);
begin
//рисуем хитбокс
{$ifdef DEBUG_DRAWHITBOX}
  pDC.moveto(screenHitBox.Left,  screenHitBox.Top);
  pDC.LineTo(screenHitBox.Right, screenHitBox.Top);
  pDC.LineTo(screenHitBox.Right, screenHitBox.Bottom);
  pDC.LineTo(screenHitBox.Left, screenHitBox.Bottom);
  pDC.LineTo(screenHitBox.Left, screenHitBox.Top);
{$endif}
//  pDC.Rectangle(screenHitBox.Left, screenhitBox.Top,
//    screenHitBox.Right, screenHitBox.Bottom);
end;

procedure TDrawObject.DrawIfSelect(pDC: TCanvas);
begin

end;

destructor TDrawObject.free;
var
p:  ^TPoint;
i:  integer;
begin
  for i:=0 to vertexes.Count - 1 do begin
    p := vertexes.Items[i];
    Dispose(p);
  end;
  for i:=0 to ScreenCoord.Count - 1 do begin
    p := vertexes.Items[i];
    Dispose(p);
  end;

  vertexes.Free;
  screenCoord.Free;
end;

function TDrawObject.GetAlarmAsString(separator: string): string;
//возвращает информацию о предупреждениях в виде строки
var
i:  integer;
s:  ^string;
res:  string;
begin
  res := '';
  if alarmTexts = nil then
    exit;
  for i:=0 to alarmTexts.Count - 1 do begin
    s := alarmTexts.Items[i];
    res := res + s^ + separator;
  end;
  //убираем последний сепаратор
  res := AnsiMidStr(res, 0, Length(res) - length(separator));

  GetAlarmAsString := res; 
end;

function TDrawObject.IsCrossSegment(x1, y1, x2, y2, x3, y3: double): boolean;
//определяет факт пересечения двух отрезков
var
sa, ax, ay, bx, by: double;
res : boolean;
begin
  if (y3 < y1) and (y3<y2) then begin
    IsCrossSegment := false;
    exit;
  end;

  if (y3 > y1) and (y3 > y2) then begin
    IsCrossSegment := false;
    exit;
  end;

  if (x3 > x2) and (x3 > x1) then begin
    IsCrossSegment := false;
    exit;
  end;

  ax := (y3 - y1)/(y2 - y1)*(x2 - x1) + x1;
  if ax>x3 then res := true
  else res := false;

//  ax := x2 - x1;
//  ay := y2 - y1;
//  bx := x3 - x1;
//  by := y3 - y1;
//  sa := ax*by - bx*ay;

//  if sa>0 then res := true;
//  if sa<0 then res := false;

  IsCrossSegment := res;
end;

function TDrawObject.IsMouse(x, y: integer): boolean;
//возвращает истину, если координаты попадают в полигон
var
p1, p2: ^TPoint;
x11, y11, x12, y12: double;
x21, y21, x22, y22: double;
i: integer;
count:  integer;
begin
  if screenCoord.Count = 0 then
    exit;

{проверяем на хитбоксе}
  if (x < screenHitBox.Left) or (x > screenHitBox.Right) or
    (y < screenHitBox.Top) or (y > screenHitBox.Bottom) then begin
      IsMouse := false;
      exit;
  end;

  count := 0;
  x21 := x; 
  y21 := y + 0.5;
  x22 := screenHitBox.Right + 100;
  y22 := y + 0.5;
  
  for i := 0 to screenCoord.Count - 2 do begin
  //получаем вершины
    p1 := screenCoord.Items[i];
    p2 := screenCoord.Items[i + 1];

  //координаты отрезка
    x11 := p1.X; x12 := p2.X;
    y11 := p1.Y; y12 := p2.Y;
    if IsCrossSegment(x11, y11, x12, y12, x + 0.5, y + 0.5) = true then
      Inc(count);
  end;
  //последний отрезок
  p2 := screenCoord.Items[i];
  x12 := p2.X;
  y12 := p2.Y;
    
  p1 := screenCoord.Items[0];
  x11 := p1.X;
  y11 := p1.Y;
  if IsCrossSegment(x11, y11, x12, y12, x + 0.5, y + 0.5) = true then
    Inc(count);

  if (count mod 2 = 1) then
    IsMouse := true
  else
    isMouse := false;
end;

function TDrawObject.ReCalcHitBox: TRect;
//приводим hitBox к экранных координатам
var
res:  TRect;
begin
  res.Left := Round(glViewMatrix.size.cx/2 + (hitBox.Left)*glViewMatrix.scale) +
      glViewMatrix.scroll.cx;
  res.Top := Round(glViewMatrix.size.cy/2 + (hitBox.Top)*glViewMatrix.scale) +
      glViewMatrix.scroll.cy;

  res.Right := Round(glViewMatrix.size.cx/2 + (hitBox.Right)*glViewMatrix.scale) +
      glViewMatrix.scroll.cx;
  res.Bottom := Round(glViewMatrix.size.cy/2 + (hitBox.Bottom)*glViewMatrix.scale) +
      glViewMatrix.scroll.cy;

  ReCalcHitBox := res;
end;

procedure TDrawObject.SetPosition(xx, yy: integer);
var
p:  ^Tpoint;
i:  integer;
begin
  x := xx;
  y := yy;
  for i:=0 to vertexes.Count - 1 do begin
    p := vertexes.Items[i];
    p.X := p.X + x;
    p.y := p.y + y;
  end;

  hitBox.Left := hitBox.Left + x;
  hitBox.Right := hitBox.Right + x;
  hitBox.Top := hitBox.Top + y;
  hitBox.Bottom := hitBox.Bottom + y;
end;

end.
