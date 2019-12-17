unit PolyLine;

interface
uses objectDraw, graphics, types, global;

type TPolyLine = class(TDrawObject)

  procedure Draw(pDC: TCanvas);override;
end;

implementation

{ TPolyLine }

procedure TPolyLine.Draw(pDC: TCanvas);
var
i:  integer;
p:  ^TPoint;
begin
//  inherited;
  if vertexes.Count = 0 then
    exit;

  if visible = false then
    exit;

  CalcScreenCoord;
  pDC.Pen.Width := round(width*glViewMatrix.scale);
  pDC.Pen.Color := color1;

  p := screenCoord.Items[0];
  pDC.MoveTo(p^.X, p^.Y);    
  for i:=1 to screenCoord.Count - 1 do begin
    p := screenCoord.Items[i];
    pDC.LineTo(p^.X, p^.Y);
  end;
end;

end.
 