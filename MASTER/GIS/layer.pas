unit layer;

interface
uses graphics, types, sysutils, classes, objectDraw,
  line, global, polyline, polygon, dialogs, text, azs,
  grids, town, railWay;

type TLayer = class
  public
    objects:  TList;  //������ �������� ����� (����� TDrawObject)
    visible:  boolean;
    ID: integer;    //������������� �����
    caption:  string; //�������� �����
    constructor create;
    destructor  free;

    function GetObject(ID: integer): pointer;
    function GetObjectbySystemID(systemID: integer): pointer;
    function GetObjectID(x, y: integer): integer;
    function GetSystemID(x, y: integer): integer;
    function GetObjectText(ID: integer): string;
    function GetTextForSystemID(ID: integer): string;
    function GetObjectByName(name: string): TDrawObject;
    procedure GetMultiSystemID(x, y: integer; list: TList);    

    procedure ZoomToObject(ID: integer);
    procedure ZoomToAll;
    procedure Zoom(scale: double);

    function GetNewID: integer;
    procedure Clear;

    //��� ����������
    procedure Draw(pDC: TCanvas);  //�������� ����
    procedure SetColor(index: integer; col1, col2: integer);
    procedure SetText(index: integer; str: string);

    procedure AddLine(x1, y1, x2, y2, width: integer; col: TColor);
    procedure AddPolyLine(vert:array of TPoint; count: integer; width: integer; col: TColor);
    function AddPolygon(vert:array of TPoint; count: integer; width: integer; col1, col2: TColor): integer;
    function AddText(x, y: integer; text, fontName: string; size: integer; ang: integer; col1: TColor): integer;

    function AddAzs(x, y, ID: integer; name: string; col1, col2: TColor): integer;
    function AddTown(x, y, ID: integer; name: string; rad1, rad2, under, caption_place: integer): integer;
    function AddRailWay(x1, y1, x2, y2: integer): integer;    

    function SelectObjectbyName(name: string): integer;
    procedure SelectObject(ID: integer);
    procedure SelectBySystemID(ID: integer);
    procedure UnselectAll;
    procedure UnAlarmAll;
    function GetAlarmCount: integer;
    procedure Animate;

    procedure CreateListObject(grid: TStringGrid);
    procedure CalcCounts;

  procedure SetVisibleObject(ID: integer; show: boolean);
  procedure VisibleEveryOne(show: boolean);//�������� ��������� ��� ���� �������� �����
end;

implementation

uses Windows, StrUtils;


{ TLayer }

procedure TLayer.AddLine(x1, y1, x2, y2, width: integer; col: TColor);
//�������� �����
var
O:  ^TDrawObject;
begin
  new(O);
  O^ := TLine.Create;
  O^.AddCoord(x1, y1);
  O^.AddCoord(x2, y2);
  O^.width := width;
  O^.color1 := col;
  O^.CreateHitBox;
  o^.ID := GetNewID;

  objects.Add(O);
end;

procedure TLayer.AddPolyLine(vert: array of TPoint; count, width: integer;
  col: TColor);
//������� ���������
var
i: integer;
O:  ^TDrawObject;
begin
  new(O);
  O^ := TPolyLine.Create;

  for i:=0 to count - 1 do begin
    O^.AddCoord(vert[i].X, vert[i].Y);
  end;

  O^.width := width;
  O^.color1 := col;
  O^.CreateHitBox;
  o^.ID := GetNewID;
  objects.Add(O);
end;

function TLayer.AddPolygon(vert: array of TPoint; count, width: integer;
  col1, col2: TColor): integer;
var
i: integer;
O:  ^TDrawObject;
begin
  new(O);
  O^ := TPolygon.Create;

  for i:=0 to count - 1 do begin
    O^.AddCoord(vert[i].X, vert[i].Y);
  end;

  O^.width := width;
  O^.color1 := col1;
  O^.color2 := col2;
  O^.CreateHitBox;
  o^.ID := GetNewID;
  objects.Add(O);
  AddPolygon := o^.ID;
end;

constructor TLayer.create;
var
newO: ^TDrawObject;
begin
  objects := TList.Create;
  visible := true;  
end;

procedure TLayer.Draw(pDC: TCanvas);
var
o:  ^TDrawObject;
i:  integer;
begin
  if visible = false then
    exit;

  for i:=0 to objects.Count - 1 do begin
    o := objects.Items[i];
    o^.Draw(pDC);
  end;

  //���� �����, �� ��� ����������
  for i:=0 to objects.Count - 1 do begin
    o := objects.Items[i];
    if o^.select = true then
      o^.DrawIfSelect(pDC);
  end;
end;

destructor TLayer.free;
var
i:  integer;
o:  ^TObject;
begin
  for i:=0 to objects.Count -1 do begin
    o := objects.Items[i];
    Dispose(o);
  end;
  objects.Clear;
  objects.Free;
end;

procedure TLayer.SetColor(index: integer; col1, col2: integer);
var
o:  ^TDrawObject;
begin
  o := objects.Items[index];

  o^.color1 := col1;
  o^.color2 := col2;
end;

function TLayer.GetObjectID(x, y: integer): integer;
//���������� ��� ������� (���� text) �� ����������� �����
var
o:  ^TDrawObject;
i:  integer;
res:  integer;
begin
  if objects.Count = 0 then
    exit;
//  if visible = false then
//    exit;
  res := 0;
  for i:=0 to objects.Count - 1 do begin
    o := objects.Items[i];
    if o^.IsMouse(x, y) = true then begin
      res := o^.ID;
      break;
    end;
  end;

  GetObjectID := res;
end;

procedure TLayer.SetText(index: integer; str: string);
var
o:  ^TDrawObject;
i:  integer;
begin
  for i:=0 to objects.Count - 1 do begin
    o := objects.Items[i];
    if o^.ID = index then begin
      o^.text := str;
      break;
    end;
  end;
end;

procedure TLayer.VisibleEveryOne(show: boolean);
var
o:  ^TDrawObject;
i:  integer;
begin
  for i:=0 to objects.Count - 1 do begin
    o := objects.Items[i];
    o^.visible := show;
  end;
end;

procedure TLayer.SetVisibleObject(ID: integer; show: boolean);
var
o:  ^TDrawObject;
i:  integer;
begin
  for i:=0 to objects.Count - 1 do begin
    o := objects.Items[i];
    if o^.ID = ID then begin
      o^.visible := show;
      break;
    end;
  end;
end;

function TLayer.GetNewID: integer;
var
res:  integer;
I:    integer;
o:    ^TDrawObject;
begin
  res := 0;
  res := objects.Count + 1;

  GetNewID := res;
end;

function TLayer.GetObjectText(ID: integer): string;
var
o:  ^TDrawObject;
i:  integer;
begin
  for i:=0 to objects.Count - 1 do begin
    o := objects.Items[I];
    if o^.ID = id then begin
      GetObjectText := o^.text;
      break;
    end;
  end;
end;

procedure TLayer.ZoomToobject(ID: integer);
//�������� ���������� ������� ���, ��� ����� ������ ������ ������
var
o:  ^TDrawObject;
i:  integer;
ds, kt, k: double;
begin
  for i:=0 to objects.Count - 1 do begin
    o := objects.Items[I];
    if o^.ID = id then begin
//      o^.CalcScreenCoord;    
      o^.CalcHitBox;

    //������������
      kt := glViewMatrix.size.cx/glViewMatrix.size.cy;
      k := abs((o^.screenHitBox.Right - o^.screenHitBox.Left)/
        (o^.screenHitBox.Bottom - o^.screenHitBox.Top));
      if k>kt then begin//��������� ������������
        ds := abs(o^.screenHitBox.Right - o^.screenHitBox.Left);
        glViewMatrix.scale := glViewMatrix.scale*(glViewMatrix.size.cx/ds);
      end
      else begin //������������ �� ���������
        ds := abs(o^.screenHitBox.Bottom - o^.screenHitBox.Top);
        glViewMatrix.scale := glViewMatrix.scale*(glViewMatrix.size.cy/ds);
      end;
    //������ ������ � ����� ����
      glViewMatrix.scroll.cx := -Round((o^.hitBox.Right*glViewMatrix.scale +
        o^.hitBox.Left*glViewMatrix.scale)/2);
      glViewMatrix.scroll.cy := -Round((o^.hitBox.Top*glViewMatrix.scale +
        o^.hitBox.Bottom*glViewMatrix.scale)/2);
      break;
    end;
  end;
end;

procedure TLayer.Clear;
//������� ��� �������
begin
  objects.Clear;
end;

procedure TLayer.ZoomToAll;
var
r:  TRect;
o:  ^TDrawObject;
i:  integer;
ds, kt, k: double;
begin
  //������ ������ � ����� ����
//���������� ����� ���-����
  for i:=0 to objects.Count - 1 do begin
    o := objects.Items[i];
    o^.CalcHitBox;
//    o^.CalcScreenCoord;
    if i=0 then
      r := Rect(o^.screenHitBox.Left, o^.screenHitBox.Top,
        o^.screenHitBox.Right, o^.screenHitBox.Bottom);
    if r.Left > o^.screenHitBox.Left then r.Left := o^.screenHitBox.Left;
    if r.Right < o^.screenHitBox.Right then r.Right := o^.screenHitBox.Right;
    if r.Top > o^.screenHitBox.Top then r.Top := o^.screenHitBox.Top;
    if r.Bottom < o^.screenHitBox.Bottom then r.Bottom := o^.screenHitBox.Bottom;
  end;

//������ ������ ������� ����
  kt := glViewMatrix.size.cx/glViewMatrix.size.cy;
  k := abs((r.Right - r.Left)/
    (r.Bottom - r.Top));
  if k>kt then begin//��������� ������������
    ds := abs(r.Right - r.Left);
    glViewMatrix.scale := glViewMatrix.scale*(glViewMatrix.size.cx/ds);
  end
  else begin //������������ �� ���������
    ds := abs(r.Bottom - r.Top);
    glViewMatrix.scale := glViewMatrix.scale*(glViewMatrix.size.cy/ds);
  end;

  glViewMatrix.scroll.cx := -Round((r.Right*glViewMatrix.scale +
    r.Left*glViewMatrix.scale)/2);
  glViewMatrix.scroll.cy := -Round((r.Top*glViewMatrix.scale +
    r.Bottom*glViewMatrix.scale)/2);
end;

procedure TLayer.SelectObject(ID: integer);
var
o:  ^TDrawObject;
i:  integer;
begin
  for i:=0 to objects.Count - 1 do begin
    o := objects.Items[i];
    if o^.ID = ID then begin
      o^.select := true;
      break;
    end;
  end;
end;

procedure TLayer.UnselectAll;
var
o:  ^TDrawObject;
i:  integer;
begin
  for i:=0 to objects.Count - 1 do begin
    o := objects.Items[i];
    o^.select := false;
  end;
end;

function TLayer.GetObject(ID: integer): pointer;
var
o:  ^TDrawObject;
i:  integer;
begin
  for i:=0 to objects.Count - 1 do begin
    o := objects.Items[i];
    if o^.ID = ID then
      break;
  end;
  GetObject := o;
end;

function TLayer.AddText(x, y: integer; text, fontName: string;
  size: integer; ang: integer; col1: TColor): integer;
//������� ������ � ���� ������
var
O:  ^TDrawObject;
begin
  new(O);
  O^ := TText.Create;
  O^.AddCoord(x, y);
  with o^.font do begin
    lfHeight           := size;
    lfWidth            := 0;
    lfEscapement       := Ang*10;
    lfOrientation      := 0;
    lfWeight           := FW_BOLD;
    lfItalic           := 0;
    lfUnderline        := 0;
    lfStrikeOut        := 0;
    lfCharSet          := DEFAULT_CHARSET;
    StrPCopy(lfFaceName, fontName);
    lfQuality         := DEFAULT_QUALITY;
    {everything else as default}
    lfOutPrecision     := OUT_DEFAULT_PRECIS;
    lfClipPrecision    := CLIP_DEFAULT_PRECIS;
    lfPitchAndFamily := FIXED_PITCH;
  end;
  O^.color1 := col1;
  O^.text := text;
  O^.CreateHitBox;
  o^.ID := GetNewID;

  objects.Add(O);
  Addtext := o^.ID;
end;

function TLayer.AddAzs(x, y, ID: integer; name: string; col1, col2: TColor): integer;
var
O:  ^TDrawObject;
begin
  new(O);
  O^ := TAzs.Create(col1, col2);
  o^.SetPosition(x, y);
  o^.ID := GetNewID;
  o^.systemID := ID;
  o^.text := name;
  o^.showCaption := false;
  objects.Add(o);

  AddAzs := o^.ID;
end;

function TLayer.GetSystemID(x, y: integer): integer;
var
o:  ^TDrawObject;
i:  integer;
res:  integer;
begin
  if objects.Count = 0 then
    exit;
  res := 0;
  for i:=0 to objects.Count - 1 do begin
    o := objects.Items[i];
    if o^.IsMouse(x, y) = true then begin
      res := o^.systemID;
      break;
    end;
  end;

  GetSystemID := res;
end;

function TLayer.GetTextForSystemID(ID: integer): string;
var
o:  ^TDrawObject;
i:  integer;
begin
  for i:=0 to objects.Count - 1 do begin
    o := objects.Items[I];
    if o^.systemID = id then begin
      GetTextForSystemID := o^.text;
      break;
    end;
  end;
end;

procedure TLayer.CreateListObject(grid: TStringGrid);
var
o:  ^TDrawObject;
i:  integer;
begin
  grid.RowCount := 1;
  for i:=0 to objects.Count - 1 do begin
    o := objects.Items[i];
    grid.Cells[0, i] := o^.text;
    grid.RowCount := grid.RowCount + 1;
  end;
  grid.RowCount := grid.RowCount - 1;
end;

function TLayer.SelectObjectbyName(name: string): integer;
var
o:  ^TDrawObject;
i:  integer;
res:  integer;
begin
  for i:=0 to objects.Count - 1 do begin
    o := objects.Items[i];
    if o^.text = name then begin
      o^.select := true;
      res := o^.ID;
      break;
    end;
  end;

  SelectObjectByName := res;
end;

procedure TLayer.Zoom(scale: double);
//�������� ���� �� ��������.
var
cx, cy: integer;
r:  TRect;
o:  TRect;
k, kt, ds: double;
begin
//���������� �������� ���������� � ����������������

  r.Left := Round(0 + scale);
  r.Right := Round(glViewMatrix.size.cx - scale);
  r.Top := Round(0 + scale);
  r.Bottom := Round(glViewMatrix.size.cy - scale);

//����������� �������������
  o.Left := Round((r.Left - glViewMatrix.scroll.cx - glViewMatrix.size.cx/2)/glViewMatrix.scale);
  o.Right := Round((r.Right - glViewMatrix.scroll.cx - glViewMatrix.size.cx/2)/glViewMatrix.scale);
  o.Top := Round((r.Top - glViewMatrix.scroll.cy - glViewMatrix.size.cy/2)/glViewMatrix.scale);
  o.Bottom := Round((r.Bottom - glViewMatrix.scroll.cy - glViewMatrix.size.cy/2)/glViewMatrix.scale);

  kt := glViewMatrix.size.cx/glViewMatrix.size.cy;
  k := abs((r.Right - r.Left)/(r.Bottom - r.Top));
  if k>kt then begin//��������� ������������
    ds := abs(r.Right - r.Left);
    glViewMatrix.scale := glViewMatrix.scale*(glViewMatrix.size.cx/ds);
  end
  else begin //������������ �� ���������
    ds := abs(r.Bottom - r.Top);
    glViewMatrix.scale := glViewMatrix.scale*(glViewMatrix.size.cy/ds);
  end;
    //������ ������ � ����� ����
    glViewMatrix.scroll.cx := -Round((o.Right*glViewMatrix.scale +
      o.Left*glViewMatrix.scale)/2);
    glViewMatrix.scroll.cy := -Round((o.Top*glViewMatrix.scale +
      o.Bottom*glViewMatrix.scale)/2);
end;

function TLayer.GetObjectByName(name: string): TDrawObject;
var
o:  ^TDrawObject;
i:  integer;
res:  TDrawObject;
begin
  for i:=0 to objects.Count - 1 do begin
    o := objects.Items[i];
    if o^.text = name then begin
      res := o^;
      break;
    end;
  end;

  GetObjectByName := res;
end;

procedure TLayer.CalcCounts;
//��������� �������� �������� (��� ����-��������)
const
number: array[0..9] of char = ('0', '1', '2', '3', '4',
  '5', '6', '7', '8', '9');
var
i, j: integer;
o1, o2: ^TDrawObject;
s:  string;
begin
//��������� ��� �������� �� ������ ��������
  for i:=0 to objects.Count - 1 do begin
    o1 := objects.Items[i];
    //������� ��� ������
    s := AnsiReplaceStr(o1^.text, '���', '');
    s := AnsiReplaceStr(s, '�', '');
    s := AnsiReplaceStr(s, '-', '');
    s := AnsiReplaceStr(s, ' ', '');
    //��������� �� ���������� �������
    if s <> '��������' then
      o1^.count := StrToInt(s)
    else
      o1^.count := 0;
  end;

//������ ���������� ��� �������� � �������� � ����������� ������������
{  for i:=0 to objects.Count - 2 do begin
    o1 := objects.Items[i];
    for j:=i + 1 to objects.Count - 1 do begin
      o2 := objects.Items[j];
      if (o1.x = o2.x) and (o1.y = o2.y) then begin
        o1.count := o1.count + o2.count;
        o2.count := 0;
      end;
    end;
  end;
}
end;

procedure TLayer.GetMultiSystemID(x, y: integer; list: TList);
var
o:  ^TDrawObject;
i:  integer;
res:  integer;
ii: ^integer;
begin
  if objects.Count = 0 then
    exit;
  res := 0;
  for i:=0 to objects.Count - 1 do begin
    o := objects.Items[i];
    if o^.IsMouse(x, y) = true then begin
      new(ii);
      ii^ := o^.systemID;
      list.Add(ii);
    end;
  end;
end;

procedure TLayer.SelectBySystemID(ID: integer);
var
o:  ^TDrawObject;
i:  integer;
begin
  for i:=0 to objects.Count - 1 do begin
    o := objects.Items[i];
    if o^.systemID = ID then begin
      o^.select := true;
      break;
    end;
  end;
end;

function TLayer.AddTown(x, y, ID: integer;
  name: string; rad1, rad2, under, caption_place: integer): integer;
var
O:  ^TDrawObject;
begin
  new(O);
  O^ := TTown.Create(rad1, rad2, name, ID, under, caption_place);
  o^.SetPosition(x, y);
  o^.ID := GetNewID;
  o^.systemID := ID;
  o^.text := name;
  objects.Add(o);

  AddTown := o^.ID;
end;

function TLayer.AddRailWay(x1, y1, x2, y2: integer): integer;
var
O:  ^TDrawObject;
begin
  new(O);
  O^ := TRailWay.Create(x1, y1, x2, y2);
  objects.Add(o);

  AddRailWay := o^.ID;
end;

procedure TLayer.UnAlarmAll;
var
o:  ^TDrawObject;
i:  integer;
begin
  for i:=0 to objects.Count - 1 do begin
    o := objects.Items[i];
    o^.ClearAlarm;
  end;
end;

function TLayer.GetObjectbySystemID(systemID: integer): pointer;
var
o:  ^TDrawObject;
i:  integer;
begin
  for i:=0 to objects.Count - 1 do begin
    o := objects.Items[i];
    if o^.systemID = systemID then
      break;
  end;
  GetObjectBySystemID := o;
end;

procedure TLayer.Animate;
var
o:  ^TDrawObject;
i:  integer;
begin
  for i:=0 to objects.Count - 1 do begin
    o := objects.Items[i];
    o^.Animate;
  end;
end;

function TLayer.GetAlarmCount: integer;
//������� ���������� ��������, ���������� ��������
var
i:  integer;
o:  ^TDrawObject;
res:  integer;
begin
  res := 0;
  for i:=0 to objects.Count - 1 do begin
    o := objects.Items[i];
    if o^.alarm = true then
      Inc(res);
  end;
  GetAlarmCount := res;
end;

end.
