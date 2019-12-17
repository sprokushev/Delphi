unit Town;

interface
uses classes, types, global, megaobject, objectDraw, graphics,
  polygon, polyLine, text, windows, sysutils, dialogs;

type TTown = class(TMegaObject)
  procedure Draw(pDC:TCanvas); override;
  constructor Create(radius1, radius2: integer;
    name: string; systemID: integer;
    underLine, caption_Place: integer);
end;

implementation

constructor TTown.Create(radius1, radius2: integer;
  name: string;
  systemID: integer;
  underLine, caption_place: integer);
const angles: array[1..12] of integer =
  (60, 30, 0, 330, 300, 270, 240, 210, 180, 150, 120, 90);
var
o:  ^TDrawObject;
i:  integer;
begin
  primitives := TList.Create;

  count := 1;
//невидимый контур
  new(o);
  o^ := TPolygon.Create;
  for i:=0 to 8 do begin
    o.AddCoord(Round(100*sin(i*6*3.14/180)), Round(100*Cos(i*6*3.14/180)));
  end;

  o.width := 1;
  o.color1 := clYellow;
  o.color2 := clBlack;
  o.CreateHitBox;
  o.visible := false;
  o.select := true;
  primitives.Add(o);

  new(o);
  o^ := TPolygon.Create;
  for i:=0 to 36 do begin
    o.AddCoord(Round(radius1*sin(i*10*3.14/180)), round(radius1*Cos(i*10*3.14/180)));
  end;
  o.width := 1;
  o.color1 := clBlack;
  o.color2 := clBlack;
  o.CreateHitBox;
  o.visible := true;
  o.select := true;
  primitives.Add(o);

  new(o);
  o^ := TPolygon.Create;
  for i:=0 to 36 do begin
    o.AddCoord(Round(radius2*sin(i*10*3.14/180)), Round(radius2*Cos(i*10*3.14/180)));
  end;
  o.width := 1;
  o.color1 := clWhite;
  o.color2 := clWhite;
  o.CreateHitBox;
  o.visible := true;
  o.select := true;
  primitives.Add(o);

  new(O);
  O^ := TText.Create;
  O.AddCoord(Round(radius1*sin(45*3.14/180)), Round(radius2*cos(45*3.14/180)));
  O^.text := name;
  with o.font do begin
    lfHeight           := radius1*2;
    lfWidth            := 0;
    lfEscapement       := 0;
    lfOrientation      := 0;
    lfWeight           := FW_BOLD;
    lfItalic           := 0;
    lfUnderline        := underLine;
    lfStrikeOut        := 0;
    lfCharSet          := DEFAULT_CHARSET;
    StrPCopy(lfFaceName, 'Arial');
    lfQuality         := DEFAULT_QUALITY;
    lfOutPrecision     := OUT_DEFAULT_PRECIS;
    lfClipPrecision    := CLIP_DEFAULT_PRECIS;
    lfPitchAndFamily := FIXED_PITCH;
  end;
  o.visible := true;
  O.color1 := clBlack;
  O.color2 := clBlack;
  o.ID := 100;
  primitives.Add(o);
end;

procedure TTown.Draw(pDC: TCanvas);
var
o:  ^TDrawObject;
i:  integer;
begin
  for i:=0 to primitives.Count - 1 do begin
    o := primitives.Items[i];
    o.Draw(pDC);
  end;
end;

end.
 