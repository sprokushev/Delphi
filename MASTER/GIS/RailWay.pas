unit RailWay;

interface
uses classes, types, global, megaobject, objectDraw, graphics,
  polygon, polyLine, text, windows, sysutils, dialogs, line, math;

type TRailWay = class(TMegaObject)
  procedure Draw(pDC: TCanvas);override;
  constructor Create(x1, y1, x2, y2: integer);
end;

implementation

const pi = 3.1415926535897932384626433832795;

{ TRailWay }

constructor TRailWay.Create(x1, y1, x2, y2: integer);
var
o:    ^TDrawObject;
s, c, s1, c1:  double; //угол наклона линии
ang, l:    double;
w:    integer;
xx1, yy1, xx2, yy2: Double;
count, i:  integer;
dx, dy: int64;
begin
  primitives := TList.Create;

  w := 400;
//определим угол
  dx := x2 - x1;
  dy := y2 - y1;
  l := dx*dx + dy*dy ;
  l := sqrt(l);
  s := (x2 - x1)/l;
  c := (y2 - y1)/l;
  ang := arcsin(s);

  new(o);
  o^ := TPolygon.Create;
  o^.AddCoord(Round(x1 - w*sin(ang + pi/2)), Round(y1 - w*cos(ang + pi/2)));
  o^.AddCoord(Round(x1 + l*s - w*sin(ang + pi/2)),
    Round(y1 + l*c - w*cos(ang + pi/2)));
  o^.AddCoord(Round(x1 + l*s + w*sin(ang + pi/2)),
    Round(y1 + l*c + w*cos(ang + pi/2)));
  o^.AddCoord(Round(x1 + w*sin(ang + pi/2)), Round(y1 + w*cos(ang + pi/2)));
  o^.color1 := clBlack;
  o^.color2 := clBlack;
  o^.CreateHitBox;
  primitives.Add(o);

//пунктирые линии между двумя основными
  i := 0;
  while i<l do begin
    new(o);
    o^ := TPolygon.Create;
    xx1 := x1 + i*s;
    yy1 := y1 + i*c;
    xx2 := x1 + (i + 1000)*s;
    yy2 := y1 + (i + 1000)*c;

    o^.AddCoord(Round(xx1 - w*2*sin(ang + pi/2)),
      Round(yy1 - w*2*cos(ang + pi/2)));
    o^.AddCoord(Round(xx2 - w*2*sin(ang + pi/2)),
      Round(yy2 - w*2*cos(ang + pi/2)));

    o^.AddCoord(Round(xx2 + w*2*sin(ang + pi/2)),
      Round(yy2 + w*2*cos(ang + pi/2)));
    o^.AddCoord(Round(xx1 + w*2*sin(ang + pi/2)),
      Round(yy1 + w*2*cos(ang + pi/2)));

    o^.color1 := clBlack;
    o^.color2 := clBlack;
    o^.CreateHitBox;    
    primitives.Add(o);
    i := i + 3000;
  end;
 
end;

procedure TRailWay.Draw(pDC: TCanvas);
var
o:  ^TDrawObject;
i:  integer;
begin
//  inherited;
  for i:=0 to primitives.Count - 1 do begin
    o := primitives.Items[i];
    o.Draw(pDC);
  end;
end;

end.
 