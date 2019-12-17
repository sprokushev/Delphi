unit Polygon;

interface
uses objectDraw, graphics, types, global;

type TPolygon = class(TDrawObject)
  procedure Draw(pDC: TCanvas);override;
  procedure DrawIfSelect(pDC: TCanvas);override;
end;

implementation

{ TPolygon }

procedure TPolygon.Draw(pDC: TCanvas);
var
mas:  array of TPoint;
i:  integer;
curr: ^TPoint;
oldP: TPoint;
count, x, y: integer;
begin
  if vertexes.Count = 0 then
    exit;

  if visible = false then
    exit;

  CalcHitBox;

  pDC.Brush.Color := color2;
  pDC.Pen.Color := color1;

  if screenHitBox.Right < 0 then
    exit;
  if screenHitBox.Left > glViewMatrix.size.cx then
    exit;
  if screenHitBox.Bottom < 0 then
    exit;
  if screenHitBox.Top > glViewMatrix.size.cy then
    exit;

  CalcScreenCoord;    
  SetLength(mas, screenCoord.Count);

  curr := screenCoord.Items[0];
  oldP := curr^;
  mas[0] := oldP;

  count := 1;
  for i:=1 to screenCoord.Count - 1 do begin
    curr := screenCoord.Items[i];

    //если новая точка не попадает в старую, то мы ее запоминаем
    if (OldP.x <> curr^.X) or (OldP.Y <> curr^.Y) then begin
        mas[count] := curr^;
        Inc(count);
        OldP := curr^;
    end;
  end;

  SetLength(mas, count);
  pDC.Polygon(mas);

  if select = true then begin //если объект выбран, то обводим его линией
    pDC.Pen.Width := width;
    pDC.Pen.Color := colorSelect;
    pDC.Polyline(mas);
  end;

//  inherited;
//рисуем надпись по центру
{  x := (screenhitBox.Right + screenhitBox.Left) div 2;
  y := (screenhitBox.Bottom + screenhitBox.Top) div 2;
  pDC.TextOut(x, y, text );
}
end;

procedure TPolygon.DrawIfSelect(pDC: TCanvas);
var
mas:  array of TPoint;
i:  integer;
curr: ^TPoint;
x, y: integer;
begin

  if vertexes.Count = 0 then
    exit;

  CalcScreenCoord;
  pDC.Brush.Color := color2;
  pDC.Pen.Color := color1;

  SetLength(mas, screenCoord.Count);

  for i:=0 to screenCoord.Count - 1 do begin
    curr := screenCoord.Items[i];
    mas[i].X := curr.X;
    mas[i].Y := curr.Y;
  end;

  if select = true then begin //если объект выбран, то обводим его линией
    pDC.Pen.Width := width;
    pDC.Pen.Color := colorSelect;
    pDC.Polyline(mas);
  end;

end;

end.
