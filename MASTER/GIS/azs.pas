unit azs;

interface
uses classes, types, global, megaobject, objectDraw, graphics,
  polygon, polyLine, text, windows, sysutils, dialogs;

type Tazs = class(TMegaObject)
  procedure Draw(pDC: TCanvas);override;
  procedure CalcHitBox;override;
  procedure Animate;override;
  constructor Create(col1, col2: TColor);
end;

implementation


procedure Tazs.Animate;
var
d:  integer;
o:  ^TDrawObject;
begin
  Inc(animateCount);
  d := Round(1000*sin(animateCount));

  o := primitives.Items[5];
  o^.SetPosition(d, 0);

  o := primitives.Items[6];
  o^.SetPosition(-d, 0);

  o := primitives.Items[7];
  o^.SetPosition(0, -d);

  o := primitives.Items[8];
  o^.SetPosition(0, d);
end;

procedure Tazs.CalcHitBox;
//считаем экранные координаты (для масштабирования)
var
o:  ^TDrawObject;
begin
//  inherited;
//пересчитываем hitBox;
  o := primitives.Items[0];
  o^.CalcHitBox;

  hitBox := o^.hitBox;

  screenHitBox.Left := Round(glViewMatrix.size.cx/2 + (o^.HitBox.Left)*glViewMatrix.scale) +
      glViewMatrix.scroll.cx;
  screenHitBox.Right := Round(glViewMatrix.size.cx/2 + (o^.HitBox.Right)*glViewMatrix.scale) +
      glViewMatrix.scroll.cx;
  screenHitBox.Top := Round(glViewMatrix.size.cy/2 + (o^.HitBox.Top)*glViewMatrix.scale) +
      glViewMatrix.scroll.cy;
  screenHitBox.Bottom := Round(glViewMatrix.size.cy/2 + (o^.HitBox.Bottom)*glViewMatrix.scale) +
      glViewMatrix.scroll.cy;
end;

constructor Tazs.Create;
var
o:  ^TDrawObject;
dx, dy: integer;
begin
  dx := 11000;
  dy := 20000;
  primitives := TList.Create;

//невидимый контур
  new(o);
  o^ := TPolygon.Create;
  o^.AddCoord( -14653 + dx, -26369 + dy);
  o^.AddCoord( -5378 + dx, -26369 + dy);
  o^.AddCoord( -5378 + dx, -16552 + dy);
  o^.AddCoord( -14653 + dx, -16552 + dy);
  o^.AddCoord( -14653 + dx, -26369 + dy);
  o^.width := 1;
  o^.color1 := clYellow;
  o^.color2 := clBlack;
  o^.CreateHitBox;
  o^.visible := false;
  o^.select := true;
  primitives.Add(o);

  new(o);
  o^ := TPolygon.Create;
  o^.AddCoord( -13371 + dx, -17028 + dy);  o^.AddCoord( -8373 + dx, -17028 + dy);
  o^.AddCoord( -8373 + dx, -17500 + dy);   o^.AddCoord( -8830 + dx, -17505 + dy);
  o^.AddCoord( -8834 + dx, -22174 + dy);   o^.AddCoord( -8220 + dx, -22174 + dy);
  o^.AddCoord( -8164 + dx, -22042 + dy);   o^.AddCoord( -8164 + dx, -21814 + dy);
  o^.AddCoord( -8621 + dx, -19294 + dy);   o^.AddCoord( -8671 + dx, -19029 + dy);
  o^.AddCoord( -8671 + dx, -18836 + dy);   o^.AddCoord( -8646 + dx, -18633 + dy);
  o^.AddCoord( -8570 + dx, -18415 + dy);   o^.AddCoord( -8499 + dx, -18257 + dy);
  o^.AddCoord( -8413 + dx, -18099 + dy);   o^.AddCoord( -8327 + dx, -17987 + dy);
  o^.AddCoord( -8225 + dx, -17877 + dy);   o^.AddCoord( -8103 + dx, -17769 + dy);
  o^.AddCoord( -7987 + dx, -17684 + dy);   o^.AddCoord( -7803 + dx, -17592 + dy);
  o^.AddCoord( -7600 + dx, -17521 + dy);   o^.AddCoord( -7468 + dx, -17505 + dy);
  o^.AddCoord( -7189 + dx, -17500 + dy);   o^.AddCoord( -6975 + dx, -17521 + dy);
  o^.AddCoord( -6802 + dx, -17582 + dy);   o^.AddCoord( -6595 + dx, -17678 + dy);
  o^.AddCoord( -6437 + dx, -17785 + dy);   o^.AddCoord( -6289 + dx, -17927 + dy);
  o^.AddCoord( -6173 + dx, -18059 + dy);   o^.AddCoord( -6071 + dx, -18211 + dy);
  o^.AddCoord( -5980 + dx, -18385 + dy);   o^.AddCoord( -5933 + dx, -18532 + dy);
  o^.AddCoord( -5893 + dx, -18755 + dy);   o^.AddCoord( -5893 + dx, -19029 + dy);
  o^.AddCoord( -6412 + dx, -21977 + dy);   o^.AddCoord( -6442 + dx, -22118 + dy);
  o^.AddCoord( -6523 + dx, -22271 + dy);   o^.AddCoord( -6614 + dx, -22387 + dy);
  o^.AddCoord( -6716 + dx, -22479 + dy);   o^.AddCoord( -6838 + dx, -22535 + dy);
  o^.AddCoord( -6965 + dx, -22581 + dy);   o^.AddCoord( -7183 + dx, -22601 + dy);
  o^.AddCoord( -7286 + dx, -22647 + dy);   o^.AddCoord( -7371 + dx, -22728 + dy);
  o^.AddCoord( -7422 + dx, -22835 + dy);   o^.AddCoord( -7427 + dx, -22921 + dy);
  o^.AddCoord( -7239 + dx, -22921 + dy);   o^.AddCoord( -7239 + dx, -24095 + dy);
  o^.AddCoord( -7458 + dx, -24095 + dy);   o^.AddCoord( -7474 + dx, -24435 + dy);
  o^.AddCoord( -7503 + dx, -24603 + dy);   o^.AddCoord( -7559 + dx, -24801 + dy);
  o^.AddCoord( -7636 + dx, -24964 + dy);   o^.AddCoord( -7738 + dx, -25131 + dy);
  o^.AddCoord( -7844 + dx, -25223 + dy);   o^.AddCoord( -7966 + dx, -25223 + dy);
  o^.AddCoord( -7966 + dx, -24959 + dy);   o^.AddCoord( -7880 + dx, -24913 + dy);
  o^.AddCoord( -7813 + dx, -24745 + dy);   o^.AddCoord( -7763 + dx, -24557 + dy);
  o^.AddCoord( -7732 + dx, -24334 + dy);   o^.AddCoord( -7732 + dx, -24099 + dy);
  o^.AddCoord( -7936 + dx, -24099 + dy);   o^.AddCoord( -8408 + dx, -23866 + dy);
  o^.AddCoord( -8408 + dx, -22916 + dy);   o^.AddCoord( -7803 + dx, -22916 + dy);
  o^.AddCoord( -7799 + dx, -22748 + dy);   o^.AddCoord( -7758 + dx, -22622 + dy);
  o^.AddCoord( -7687 + dx, -22494 + dy);   o^.AddCoord( -7570 + dx, -22372 + dy);
  o^.AddCoord( -7438 + dx, -22266 + dy);   o^.AddCoord( -7270 + dx, -22205 + dy);
  o^.AddCoord( -7026 + dx, -22179 + dy);   o^.AddCoord( -6920 + dx, -22128 + dy);
  o^.AddCoord( -6833 + dx, -22052 + dy);   o^.AddCoord( -6779 + dx, -21930 + dy);
  o^.AddCoord( -6779 + dx, -21930 + dy);   o^.AddCoord( -6748 + dx, -21750 + dy);
  o^.AddCoord( -6717 + dx, -21571 + dy);   o^.AddCoord( -6686 + dx, -21392 + dy);
  o^.AddCoord( -6656 + dx, -21213 + dy);   o^.AddCoord( -6625 + dx, -21033 + dy);
  o^.AddCoord( -6594 + dx, -20854 + dy);   o^.AddCoord( -6563 + dx, -20675 + dy);
  o^.AddCoord( -6532 + dx, -20496 + dy);   o^.AddCoord( -6500 + dx, -20317 + dy);
  o^.AddCoord( -6468 + dx, -20138 + dy);   o^.AddCoord( -6436 + dx, -19959 + dy);
  o^.AddCoord( -6403 + dx, -19780 + dy);   o^.AddCoord( -6370 + dx, -19601 + dy);
  o^.AddCoord( -6336 + dx, -19423 + dy);   o^.AddCoord( -6301 + dx, -19244 + dy);
  o^.AddCoord( -6266 + dx, -18829 + dy);   o^.AddCoord( -6307 + dx, -18640 + dy);
  o^.AddCoord( -6376 + dx, -18466 + dy);   o^.AddCoord( -6474 + dx, -18299 + dy);
  o^.AddCoord( -6612 + dx, -18155 + dy);   o^.AddCoord( -6796 + dx, -18023 + dy);
  o^.AddCoord( -6957 + dx, -17948 + dy);   o^.AddCoord( -7137 + dx, -17907 + dy);
  o^.AddCoord( -7333 + dx, -17902 + dy);   o^.AddCoord( -7551 + dx, -17942 + dy);
  o^.AddCoord( -7730 + dx, -18016 + dy);   o^.AddCoord( -7908 + dx, -18121 + dy);
  o^.AddCoord( -8064 + dx, -18282 + dy);   o^.AddCoord( -8191 + dx, -18490 + dy);
  o^.AddCoord( -8283 + dx, -18772 + dy);   o^.AddCoord( -8283 + dx, -19049 + dy);
  o^.AddCoord( -7961 + dx, -21025 + dy);   o^.AddCoord( -7782 + dx, -22097 + dy);
  o^.AddCoord( -7764 + dx, -22322 + dy);   o^.AddCoord( -7845 + dx, -22454 + dy);
  o^.AddCoord( -7977 + dx, -22541 + dy);   o^.AddCoord( -8834 + dx, -22541 + dy);
  o^.AddCoord( -8839 + dx, -25224 + dy);   o^.AddCoord( -12929 + dx, -25224 + dy);
  o^.AddCoord( -12929 + dx, -17524 + dy);  o^.AddCoord( -13373 + dx, -17519 + dy);
  o^.AddCoord( -13371 + dx, -17028 + dy);
  o^.width := 1;
  o^.color1 := col1;
  o^.color2 := col1;
  o^.CreateHitBox;
  primitives.Add(o);

  new(o);
  o^ := TPolygon.Create;
  o^.AddCoord( -12457 + dx, -24847 + dy);
  o^.AddCoord( -9328 + dx, -24847 + dy);
  o^.AddCoord( -9328 + dx, -22981 + dy);
  o^.AddCoord( -12461 + dx, -22981 + dy);
  o^.AddCoord( -12457 + dx, -24847 + dy);
  o^.width := 1; o.color1 := col2; o.color2 := col2; o.CreateHitBox; primitives.Add(o);


  new(o);
  o^ := TPolygon.Create;
  o^.AddCoord( -8295 + dx, -23715 + dy);
  o^.AddCoord( -7967 + dx, -23892 + dy);
  o^.AddCoord( -7967 + dx, -23122 + dy);
  o^.AddCoord( -8291 + dx, -23122 + dy);
  o^.AddCoord( -8295 + dx, -23715 + dy);
  o^.width := 1; o.color1 := col2; o.color2 := col2; o.CreateHitBox; primitives.Add(o);

  new(O);
  O^ := TText.Create;
  O^.AddCoord(200, 1500);
  with o.font do begin
    lfHeight           := 4000;
    lfWidth            := 0;
    lfEscapement       := 0;
    lfOrientation      := 0;
    lfWeight           := FW_BOLD;
    lfItalic           := 0;
    lfUnderline        := 0;
    lfStrikeOut        := 0;
    lfCharSet          := DEFAULT_CHARSET;
    StrPCopy(lfFaceName, 'Arial');
    lfQuality         := DEFAULT_QUALITY;
    lfOutPrecision     := OUT_DEFAULT_PRECIS;
    lfClipPrecision    := CLIP_DEFAULT_PRECIS;
    lfPitchAndFamily := FIXED_PITCH;
  end;

  o^.visible := true;
  O^.color1 := clWhite;
  O^.color2 := clBlack;
  o^.ID := 100;
  primitives.Add(o);

//штуки для обозначения Аларма
  new(o);
  o^ := TPolygon.Create;
  o^.AddCoord(5700 - 700, -1245);
  o^.AddCoord(8000 - 700, -4224);
  o^.AddCoord(8000 - 700, 1972);
  o^.width := 1; o^.color1 := clRed; o^.color2 := clRed;
  o^.CreateHitBox; o^.visible := false; primitives.Add(o);

  new(o);
  o^ := TPolygon.Create;
  o^.AddCoord(-3500, -1245);
  o^.AddCoord(-5800, 1972);
  o^.AddCoord(-5800, -4224);
  o^.width := 1; o^.color1 := clRed; o^.color2 := clRed;
  o^.CreateHitBox; o^.visible := false; primitives.Add(o);

  new(o);
  o^ := TPolygon.Create;
  o^.AddCoord(-0, -5500);
  o^.AddCoord(-3100, -7800);
  o^.AddCoord(3100, -7800);
  o^.width := 1; o^.color1 := clRed; o^.color2 := clRed;
  o^.CreateHitBox; o^.visible := false; primitives.Add(o);

  new(o);
  o^ := TPolygon.Create;
  o^.AddCoord(-0, 3500);
  o^.AddCoord(-3100, 5800);
  o^.AddCoord(3100, 5800);
  o^.width := 1; o^.color1 := clRed; o^.color2 := clRed;
  o^.CreateHitBox; o^.visible := false; primitives.Add(o);

  showCaption := false;
end;


procedure Tazs.Draw(pDC: TCanvas);
var
o:  ^TDrawObject;
i:  integer;
p:  ^TPoint;
mas:  array of TPoint;
begin
  if primitives.Count = 0 then
    exit;

  o := primitives.Items[0];
  o.CalcHitBox;
    //если контур не попадает, то не рисуем
  if o^.screenHitBox.Right < 0 then
    exit;
  if o^.screenHitBox.Left > glViewMatrix.size.cx then
    exit;
  if o^.screenHitBox.Bottom < 0 then
    exit;
  if o^.screenHitBox.Top > glViewMatrix.size.cy then
    exit;

  o := primitives.Items[5];
  o^.visible := alarm;
  o := primitives.Items[6];
  o^.visible := alarm;
  o := primitives.Items[7];
  o^.visible := alarm;
  o := primitives.Items[8];
  o^.visible := alarm;


  if select = true then begin
    //рисуем активный контур
    o := primitives.Items[0];
    o.CalcHitBox;
    //если контур не попадает, то не рисуем
    o.CalcScreenCoord;
    pDC.Brush.Color := clYellow;
    pDC.Pen.Color := clBlack;
    pDC.Pen.Width := 1;
    SetLength(mas, o.screenCoord.Count);
    for i:=0 to o.screenCoord.Count - 1 do begin
      p := o.screenCoord.Items[i];
      mas[i].X := p.X;
      mas[i].Y := p.Y;
    end;
    pDC.Polygon(mas);
    pDC.Polyline(mas);
  end;

//рисуем номер АЗС  
  o := primitives.Items[primitives.Count - 5];

  o.text := IntToStr(count);

  for i:=1 to primitives.Count - 1 do begin
    if i = 4 then //если это текст, то выравниваем
      SetTextAlign(pDC.Handle, TA_CENTER or TA_BASELINE);    
    o := primitives.Items[i];
    o.Draw(pDC);
  end;


end;

end.
 