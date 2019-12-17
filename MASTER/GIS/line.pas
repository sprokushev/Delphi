unit line;

interface
uses objectDraw, graphics, types, global;

type TLine = class(TDrawObject)

  procedure Draw(pDC: TCanvas);override;
end;

implementation

{ TLine }

procedure TLine.Draw(pDC: TCanvas);
var
p:  ^TPoint;
begin
  if vertexes.Count = 0 then
    exit;

  if visible = false then
    exit;

  CalcScreenCoord;
  pDC.Pen.Width := round(width*glViewMatrix.scale);
  pDC.Pen.Color := color1;
  pDC.Pen.Style := penStyle;

  p := screenCoord.Items[0];
  pDC.MoveTo(p^.X, p^.Y);

  p := screenCoord.Items[1];
  pDC.LineTo(p^.X, p^.Y);
end;

end.
 