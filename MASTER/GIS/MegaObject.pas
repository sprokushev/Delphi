unit MegaObject;

interface
uses Objectdraw, global, graphics, classes, types, sysutils, windows;

type TMegaObject = class(TDrawObject)
  primitives: TList;
  screenPrimitives: TList;

  procedure SetPosition(xx, yy: integer);override;
  function IsMouse(x, y: integer): boolean;override;  
  constructor Create;
  destructor free;
end;

implementation

{ TMegaObject }

constructor TMegaObject.Create;
begin
  primitives := TList.Create;
end;


destructor TMegaObject.free;
var
o:  ^TDrawObject;
i:  integer;
begin
  for i:=0 to primitives.Count - 1 do begin
    o := primitives.Items[i];
    Dispose(o);
  end;
  primitives.Clear;
  primitives.Free;
end;

function TMegaObject.IsMouse(x, y: integer): boolean;
//возвращает истину, если координаты попадают в полигон
var
p1, p2: ^TPoint;
x11, y11, x12, y12: double;
x21, y21, x22, y22: double;
i: integer;
count:  integer;
o:  ^TDrawObject;
begin
  o := primitives.Items[0];
  o.CalcScreenCoord;
  o.CalcHitBox;
  if o.screenCoord.Count = 0 then begin
    IsMouse := false;
    exit;
  end;

{  if visible = false then begin
    IsMouse := false;
    exit;
  end;}
    
{проверяем на хитбоксе}
  if (x < o.screenHitBox.Left) or (x > o.screenHitBox.Right) or
    (y < o.screenHitBox.Top) or (y > o.screenHitBox.Bottom) then begin
      IsMouse := false;
      exit;
  end;

  count := 0;
  x21 := x;
  y21 := y + 0.5;
  x22 := o.screenHitBox.Right + 100;
  y22 := y + 0.5;

  for i := 0 to o.screenCoord.Count - 2 do begin
  //получаем вершины
    p1 := o.screenCoord.Items[i];
    p2 := o.screenCoord.Items[i + 1];

  //координаты отрезка
    x11 := p1.X; x12 := p2.X;
    y11 := p1.Y; y12 := p2.Y;
    if o.IsCrossSegment(x11, y11, x12, y12, x + 0.5, y + 0.5) = true then
      Inc(count);
  end;
  //последний отрезок
  p2 := o.screenCoord.Items[i];
  x12 := p2.X;
  y12 := p2.Y;

  p1 := o.screenCoord.Items[0];
  x11 := p1.X;
  y11 := p1.Y;
  if o.IsCrossSegment(x11, y11, x12, y12, x + 0.5, y + 0.5) = true then
    Inc(count);

  if (count mod 2 = 1) then
    IsMouse := true
  else
    isMouse := false;
end;

procedure TMegaObject.SetPosition(xx, yy: integer);
var
o:  ^TDrawObject;
i:  integer;
begin
  x := xx;
  y := yy;
  for i:=0 to primitives.Count - 1 do begin
    o := primitives.Items[i];
    o.SetPosition(xx, yy);
  end;
end;

end.
 