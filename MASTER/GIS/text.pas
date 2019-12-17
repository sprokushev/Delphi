unit text;

interface
uses objectDraw, global, graphics, types, windows;

type TText =class( TDrawObject)

  procedure Draw(pDC: TCanvas);override;
end;

implementation

{ TText }

procedure TText.Draw(pDC: TCanvas);
var
p: ^TPoint;
f:  TLogFont;
begin
  CalcScreenCoord;
  CopyMemory(@f, @font, sizeof(font));
  f.lfHeight := Round(f.lfHeight*glViewMatrix.scale) + 1;
  pDC.Font.Handle := CreateFontIndirect(f);
  p := screenCoord.Items[0];

  SetTextColor(pDC.Handle, color1);
  SetBKMode(pDC.Handle, TRANSPARENT);
  pDC.TextOut(p.x , p.y, text);
end;

end.
 