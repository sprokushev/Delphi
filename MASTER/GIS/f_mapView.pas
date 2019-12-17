unit f_mapView;

//{$define DEBUG}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TB2Dock, TB2Toolbar, Oracle, DB, ImgList, ActnList, Grids,
  DBGrids, StdCtrls, ExtCtrls, TB2Item, ComCtrls, ToolWin, view, global,
  OracleData, objectDraw, megaObject, Menus, Buttons;

//курсоры
const crLupaInc = 1;
      crLupaDec = 2;
      crHand1 = 3;
      crHand2 = 4;
      crhand3 = 5;

//типы дорог
const wayRoad = 1;  //обычная дорога
      wayRail = 2;  //железная дорога
      wayHigh = 3;  //шоссе

type
  TMainForm = class(TForm)
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    ActionList1: TActionList;
    PaintBox1: TPaintBox;
    ImageList1: TImageList;
    TBItem1: TTBItem;
    SetModeArrow: TAction;
    SetModeInc: TAction;
    SetModeDec: TAction;
    SetModeHand: TAction;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    ZoomToAll: TAction;
    TBItem5: TTBItem;
    OracleSession1: TOracleSession;
    DataSource1: TDataSource;
    regions: TOracleDataSet;
    vertexes: TOracleDataSet;
    ServiceMenu: TPopupMenu;
    Timer1: TTimer;
    StatusBar1: TStatusBar;
    N1231_OLD: TMenuItem;
    Towns: TOracleDataSet;
    Ways: TOracleDataSet;
    temp: TOracleDataSet;
    N9_OLD: TMenuItem;
    N10_OLD: TMenuItem;
    PopupList: TPopupMenu;
    azs: TOracleDataSet;
    OracleSession2: TOracleSession;
    azsInfo: TOracleDataSet;
    ForFocus: TEdit;
    Timer2: TTimer;
    TBDock2: TTBDock;
    TBPopupMenu1: TTBPopupMenu;
    _OLD: TMenuItem;
    TBToolbar3: TTBToolbar;
    N1: TTBSubmenuItem;
    N2: TTBItem;
    N3: TTBSubmenuItem;
    N4: TTBSubmenuItem;
    N5: TTBItem;
    N6: TTBItem;
    N7: TTBItem;
    N8: TTBItem;
    N11: TTBSubmenuItem;
    N12: TTBItem;
    TBSubmenuItem2: TTBSubmenuItem;
    subRegion: TTBSubmenuItem;
    subAZS: TTBSubmenuItem;
    AZSAlarm_Q1: TOracleDataSet;
    AZSAlarm_Q2: TOracleDataSet;
    AZSAlarm_Q3: TOracleDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SetModeArrowExecute(Sender: TObject);
    procedure SetModeIncExecute(Sender: TObject);
    procedure SetModeDecExecute(Sender: TObject);
    procedure SetModeHandExecute(Sender: TObject);
    procedure ZoomToAllExecute(Sender: TObject);
    procedure OracleQuery1ArrayError(Sender: TOracleQuery; Index,
      ErrorCode: Integer; const ErrorMessage: String;
      var Continue: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure findList1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure findList1DblClick(Sender: TObject);
    procedure PaintBox1DblClick(Sender: TObject);
    procedure findList1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
  private
  //Вид курсоров
    cursors:  array[1..10] of TCursor;
    map:  TView;
  //идентификаторы листов
    azsLayer: integer;  //слой с АЗС
    mainLayer: integer; //слой с регионами республики
    riversLayer: integer; //Реки
    townLayer: integer;   //населенные пункты
    railWayLayer: integer;  //железные дороги

    procedure Createpopupmenu;

    procedure LoadAZS;
    procedure LoadTown;
    procedure LoadRailWay;

    function CheckAlarm: boolean; //фукнция проверяет, не надо ли привлечь
                                  //внимание к какой-нибудь АЗС

    procedure MyClick(Sender: TObject);
    procedure MyMove(Sender: TObject);
  //реагирование на объекты в различныхс слоях
    procedure HotTrackAZS(x, y: integer);

    procedure PrepareAZSInfo(x, y: integer);
    procedure CreateAlarmList;

    procedure CheckAlarm1;
    procedure CheckAlarm2;
    procedure CheckAlarm3;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses splash, AzsInfoDlg, StrUtils, AlarmOptions, DateUtils, AZSQUERYDLG;

{$R *.dfm}
{$R resource.res}

procedure TMainForm.FormCreate(Sender: TObject);
var
//l:  integer;
t, i, j:  integer;
o:  integer;
obj:  TDrawObject;
vert: array of TPoint;
begin
  SplashDlg := TSplashDlg.Create(nil);
  SplashDlg.Show;
  SplashDlg.Update;
  t:=GetTickCount;

  SplashDlg.Label1.Caption := 'Загружаем курсоры';
  splashDlg.Update;
  screen.Cursors[crLupaInc] := LoadCursor(HInstance, 'LUPA');
  screen.Cursors[crLupaDec] := LoadCursor(HInstance, 'LUPA2');
  screen.Cursors[crHand1] := LoadCursor(HInstance, 'HAND1');
  screen.Cursors[crhand2] := LoadCursor(HInstance, 'HAND2');
  screen.Cursors[crhand3] := LoadCursor(HInstance, 'HAND3');

  TBToolBar1.Items[0].Checked := true;

  PaintBox1.Cursor := 1;
  PaintBox1.DragCursor := crHand2;

  splashDlg.Label1.Caption := 'Соединяемся с сервером:';
  splashDlg.PB1.Position := 0;
  splashDlg.Update;
  
  oracleSession1.Connected := true;

  glViewMatrix.size.cx := paintbox1.Width;
  glViewMatrix.size.cy := paintbox1.Height;

  glViewMatrix.scroll.cx := 0;
  glViewMatrix.scroll.cy := 0;
  glViewMatrix.scale := 1;

  map := TView.Create(PaintBox1);
  mainLayer := map.AddLayer;
  riversLayer := map.AddLayer;

//загружаем данные
  splashDlg.Label1.Caption := 'Загружаем координаты:';
  splashDlg.PB1.Position := 0;
  splashDlg.Update;

  regions.Open;
  splashDlg.PB1.Max := regions.RecordCount;

  regions.First;
  for i:=0 to regions.RecordCount - 1 do begin
    vertexes.Close;
    vertexes.SetVariable(0, regions.FieldValues['figure']);
    vertexes.Open;
    SetLength(vert, vertexes.RecordCount);
    //оформляем массив вершин
    for j:=0 to vertexes.RecordCount -1  do begin
      vert[j].X := vertexes.FieldValues['x'];
      vert[j].Y := vertexes.FieldValues['Y'];
      vertexes.Next;
    end;
    o := map.Polygon(mainLayer, vert, j, 1,
      regions.FieldValues['bordercolor'], regions.FieldValues['Fillcolor']);
    map.SetText(mainLayer, o, regions.FieldValues['caption']);
    regions.Next;

    splashDlg.PB1.Position := i;
    splashDlg.Update;
  end;

  if fileExists('rivers.dxf') = true then
    map.LoadDxfAsPolygons(riversLayer, 'rivers.dxf',
      RGB(0, 0, 250), RGB(0, 0, 250));

  railWayLayer := map.AddLayer;
  townLayer := map.AddLayer;
  azsLayer := map.AddLayer;    

  LoadAZS;
  LoadTown;
  LoadRailWay;

  CreateAlarmList;
//  CheckAlarm;

  paintBox1.Width := Round(width*3/4);

  StatusBar1.Panels.Add;

  SetModeArrow.Execute;

  CreatePopupMenu;

  splashDlg.Label1.Caption := 'Почти готово...';
  splashDlg.Update;

  Sleep(1000);
  SplashDlg.Hide;
  SplashDlg.Free;

  glViewMatrix.size.cx := paintbox1.Width;

  ZoomToAll.Execute;
  map.Draw;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  map.Free;
end;

procedure TMainForm.PaintBox1Paint(Sender: TObject);
begin
  map.Draw;

//  PaintBox1.Canvas.Draw(100, 100, LoadCursor(hInstance,'lupa'));
//  DrawIcon(image1.canvas.Handle,10,10,LoadCursor(hInstance,'cur'));
end;

procedure TMainForm.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
p:  TPoint;
begin
  map.LMouseDown(x, y);

//  PaintBox1.PopupMenu.Popup(x, y);
//  if map.mouseMode = mdHand then begin
//    SetCursor(crhand2);
//    ShowCursor(false);
//    PaintBox1.Cursor := crHand2;
//  end;
end;

procedure TMainForm.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
i, j:  integer;
begin
map.MouseMove(x, y);
ForFocus.SetFocus;

if (map.mousemode = mdArrow)// or (map.mousemode = mdHand))
   then begin
  i := map.GetObjectID(mainLayer, x, y);
  if i<>0 then begin
    map.UnselctAll(mainLayer);
    map.SelectObject(mainLayer, i);
    StatusBar1.Panels[0].Text := map.GetObjectText(mainLayer, i);
  end
  else begin
    map.UnselctAll(mainLayer);
  end;
end;

if (map.m_drag = false) and ((map.mouseMode = mdArrow) or (map.mouseMode = mdHand)) then begin
  HotTrackAZS(x, y);
//  PaintBox1.Repaint;
end;

{$ifdef DEBUG}
with paintBox1.canvas do begin
  Brush.color := clSilver;
  FillRect(RECT(5, 10, 100, 40));
  i := Round((x - glViewMatrix.scroll.cx - glViewMatrix.size.cx/2)/glViewMatrix.scale);
  j := Round((y - glViewMatrix.scroll.cy - glViewMatrix.size.cy/2)/glViewMatrix.scale);
  Textout(10, 20, IntToStr(i) + ': ' + IntToStr(j));
  TextOut(10, 35, FloatToStr(glViewMatrix.scale));
end;
{$endif}
end;


procedure TMainForm.PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
i: integer;
p, p2:  TPoint;
begin
  map.LMouseUp(x, y);
//  memo1.Lines.Clear;

  if (map.mouseMode = mdArrow) or ((map.mouseMode = mdhand) and (map.m_drag = false)) then begin
    if Button = mbLeft then begin
      i := map.GetSystemID(azslayer, x, y);
      if i <> 0 then begin
        GetCursorPos(p);
        p2 := PaintBox1.ScreenToClient(p);
        PrepareAZSInfo(p2.x, p2.y);
//      map.GetMultiSystemID(azsLayer, p2.X, p2.Y, IDList);
        AzsInfoF.Left := p.X - 5;
        AzsInfoF.top := p.Y - 5;
        AzsInfoF.Show;
        AzsInfoF.SetFocus;
//      paintbox1.scree
//      AzsInfoF.Left :=
//      memo1.Lines.Add('Информация по АЗС с кодом ' + IntToStr(i));
        exit;
      end;
    end;
  end;

  if map.mouseMode = mdArrow then begin
    i := map.GetObjectID(mainLayer, x, y);
    if i <> 0 then begin
//      memo1.Lines.Clear;
//      memo1.Lines.Add('Информация по региону с кодом ' + IntToStr(i));
      exit;
    end;
  end;

end;

procedure TMainForm.SetModeArrowExecute(Sender: TObject);
begin
  map.SetMouseMode(1);
  PaintBox1.Cursor := crArrow;
end;

procedure TMainForm.SetModeIncExecute(Sender: TObject);
begin
  map.SetMouseMode(2);
  PaintBox1.Cursor := crLupaInc;
end;

procedure TMainForm.SetModeDecExecute(Sender: TObject);
begin
  map.SetMouseMode(3);
  PaintBox1.Cursor := crLupaDec;
end;

procedure TMainForm.SetModeHandExecute(Sender: TObject);
begin
  map.SetMouseMode(4);
  PaintBox1.Cursor := crHand1;
end;

procedure TMainForm.ZoomToAllExecute(Sender: TObject);
begin
  map.ZoomToAll(mainLayer);
  map.Zoom(mainLayer, -20);
end; 

procedure TMainForm.OracleQuery1ArrayError(Sender: TOracleQuery; Index,
  ErrorCode: Integer; const ErrorMessage: String; var Continue: Boolean);
begin
  Showmessage('error');
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
  PaintBox1.Hint := '';
end;


procedure TMainForm.findList1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var
s:  string;
begin
{  s := findList1.Cells[aCol, aRow];

  map.UnselctAll(mainLayer);
  map.SelectObjectByname(mainLayer, s);
  PaintBox1.Repaint;   }
//  ShowMessage(s);
end;

procedure TMainForm.findList1DblClick(Sender: TObject);
var
s:  string;
i:  integer;
begin
{  s := findList1.Cells[findList1.Selection.Left, findList1.Selection.Top];

  i := map.SelectObjectByName(mainLayer, s);
  map.ZoomToObject(mainLayer, i);
  map.Zoom(mainLayer, -20);

  PaintBox1.Repaint;}
end;

procedure TMainForm.PaintBox1DblClick(Sender: TObject);
var
i: integer;
begin
//  i := map.GetObjectID(mainLayer, x, )
end;

procedure TMainForm.LoadAZS;
var
x, y, i, id: integer;
col:  integer;
azsName: string;
o:  ^TDrawObject;
begin
  azs.Open;
  azs.First;
//  clred = 255;
//  clGreen := 32768

  while not azs.Eof do begin
    id := azs.FieldValues['azs_id'];
    x := azs.FieldValues['x'];
    y := azs.FieldValues['y'];
    col := azs.FieldValues['col'];
    //получаем основную информацию об АЗС
    azsInfo.Close;
    azsInfo.SetVariable(0, id);
    azsInfo.Open;
    if azsInfo.RecordCount > 0 then
      azsName := azsinfo.FieldValues['agnabbr']
    else
      azsName := 'Не указан';

    map.AddAzs(azslayer, x, y, id, azsName, col, clWhite);
    azs.Next;
  end;
//  map.AddAzs(azsLayer, 100000, -300000, 1, 'АЗС №1', clRed, clWhite);
//  map.AddAzs(azsLayer, 100000, -300000, 4, 'АЗС №4', clRed, clWhite);
//  map.AddAzs(azsLayer, 0, 0, 2, 'АЗС №2', clGreen, clWhite);
//  map.AddAzs(azsLayer, -50000, 10000, 3, 'АЗС №3', clGreen, clWhite);

//пересчитываем АЗС-ки
  map.CalcLayer(azsLayer);
end;

procedure TMainForm.findList1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
s:  string;
o:  TDrawObject;
begin
//узнаем текст и цвет
{  s := findList1.Cells[aCol, aRow];
  o := map.GetObjectByName(mainLayer, s);
//закрашиваем в нужный цвет
  findList1.Canvas.Brush.Color := o.color2;

  findList1.Canvas.Pen.Color := clBlack;
  findList1.Canvas.FillRect(Rect);

  if (State = [gdSelected]) or (State = [gdFocused]) then begin
    findList1.Canvas.Brush.Color := clBlack;
    findList1.Canvas.Polygon([Point(rect.Left, rect.Top),
      point(10, (rect.Bottom + rect.Top) div 2), Point(rect.Left, rect.Bottom)]);
  end;

//  SetTextColor(findList1.Canvas.Handle, clBlack);
  findList1.Canvas.TextOut(rect.Left + 10, rect.Top, s);
}
end;

procedure TMainForm.HotTrackAZS(x, y: integer);
var
ii: ^integer;
j, i:  integer;
hint: string;
IDList: TList;  //список АЗС
begin
//если режим стрелки или руки
if (map.mouseMode = mdArrow) or (map.mouseMode = mdHand) then begin
  IDList := TList.Create;
  IDList.Clear;
  //узнаем, есть ли что-нибудь под мышкой
  i := map.GetSystemID(azsLayer, x, y);
  if i > 0 then begin //если есть, что
    paintBox1.Cursor := crhand3;
    map.GetMultiSystemID(azsLayer, x, y, IDList);
    map.UnselctAll(azsLayer);
    map.SelectBySystemID(azsLayer, i);  //выделяем этот объект

  //создаем для него хинт
    hint := '';
    for j:=0 to IDList.Count - 1 do begin
      ii := IDList.Items[j];
      hint := hint +
        map.GetTextBySystemID(azsLayer,ii^);
      if map.GetAlarmTexts(azsLayer, ii^, Chr(13) + Chr(10)) <> '' then
        hint := hint + ': ' + map.GetAlarmTexts(azsLayer, ii^, Chr(13) + Chr(10));
      if j <> IDList.Count - 1 then
        hint := hint +
          Chr(13) + Chr(10);
    end;
    //если этот хинт не похож на предыдущий, то выводим его
    if PaintBox1.Hint <> hint then begin//'АЗС № ' + IntToStr(i) then begin
      PaintBox1.Hint := hint;
      Application.ActivateHint(Point(Mouse.CursorPos.x, Mouse.CursorPos.y));
    end;
  end
  else begin//если курсор не попал ни в один объект, то
  //снимаем выделение и изменяем курсор
    map.UnselctAll(azsLayer);
    case map.mouseMode of
    mdArrow: paintBox1.Cursor := crArrow;
    mdHand: PaintBox1.Cursor := crHand1;
    end;
  end;
  IDList.Free;
end;
end;

procedure TMainForm.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  if glViewMatrix.scale > minZoom then begin
    map.Zoom(mainLayer, -30);
  end;
end;

procedure TMainForm.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  if glViewMatrix.scale < maxZoom then begin
    map.Zoom(mainLayer, 30);
  end;
end;

procedure TMainForm.N5Click(Sender: TObject);
begin
  map.Showlayer(azsLayer, N5.Checked);
  map.Draw;
end;

procedure TMainForm.N7Click(Sender: TObject);
begin
  map.Showlayer(riversLayer, N7.Checked);
  map.Draw;
end;

procedure TMainForm.LoadTown;
var
caption_place, ID, s1, s2, x, y, under: integer;
name: string;
begin
  towns.Open;
  towns.First;
  while not towns.Eof do begin
    ID := towns.FieldValues['systemID'];
    x := towns.FieldValues['x'];
    y := towns.FieldValues['y'];
    s1 := towns.FieldValues['size1'];
    s2 := towns.FieldValues['size2'];
    under := towns.FieldValues['under_line'];
    caption_place := towns.FieldValues['caption_place'];
    map.AddTown( townlayer,
      x, y,
      ID,
      towns.FieldValues['name'],
      s1, s2, under, caption_place);

    towns.Next;
  end;
  towns.Close;
//  map.AddTown(townLayer, 0, 0, 1, 'Сосногорск', 4000, 3500);
end;

procedure TMainForm.N6Click(Sender: TObject);
begin
  map.Showlayer(townLayer, N6.Checked);
  map.Draw;
end;

procedure TMainForm.LoadRailWay;
//загружаем дороги
var
dest, src, x1, y1, x2, y2: integer;
begin
  ways.Close;
  ways.SetVariable('type', wayRail);
  ways.Open;

//  for dest := 0 to 360 do
//    map.AddRailWay(railWayLayer, 0, 0, Round(100000*sin(dest*3.14/180)),
//      Round(100000*cos(dest*3.14/180)));

  while not ways.Eof do begin
    //определяем коды пунктов
    dest := ways.FieldValues['dest_ID'];
    src := ways.FieldValues['src_ID'];
    //определяем их координаты
    temp.Close; temp.SQL.Clear;
    temp.SQL.Add('select * from map_settlements where id = ' +
      IntToStr(src));
    temp.Open;
    x1 := temp.FieldValues['x'];
    y1 := temp.FieldValues['y'];

    temp.Close; temp.SQL.Clear;
    temp.SQL.Add('select * from map_settlements where id = ' +
      IntToStr(dest));
    temp.Open;
    x2 := temp.FieldValues['x'];
    y2 := temp.FieldValues['y'];

    map.AddRailWay(railWayLayer, x1, y1, x2, y2);
    
    ways.Next;
  end;

end;

procedure TMainForm.N8Click(Sender: TObject);
begin
  map.Showlayer(railWayLayer, N8.Checked);
end;

procedure TMainForm.Createpopupmenu;

var
o:  ^TDrawObject;
i:  integer;
name: string;
m:  TMenuItem;
t: TTBItem;
begin
//список районов
//  ServiceMenu.Items[0].Clear;
  for i:=1 to map.GetObjectCount(mainLayer) do begin
    o := map.GetObject(mainLayer, i);
    name := o.text;
//    m := TMenuItem.Create(Self);
//    m.Caption := name;
//    m.OnClick := MyClick;
//    Servicemenu.Items[0].Insert(i - 1, m);
    t := TTBItem.Create(Self);
    t.Caption := name;
    t.OnClick := MyClick;
    subRegion.Add(t);
  end;

//список АЗС
  ServiceMenu.Items[1].Clear;
  for i:=1 to map.GetObjectCount(AZSLayer) do begin
    o := map.GetObject(azsLayer, i);
    name := o.text;
//    m := TMenuItem.Create(Self);
//    m.Caption := name;
//    m.OnClick := MyClick;
//    Servicemenu.Items[1].Insert(i - 1, m);
    t := TTBItem.Create(Self);
    t.Caption := name;
    t.OnClick := MyClick;
    subAZS.Add(t);
  end;

end;

procedure TMainForm.MyClick(Sender: TObject);
var
m:  ^TTBItem;
i:  integer;
s:  string;
begin
  m := @Sender;
  if m^.Parent.Caption = 'Спозиционировать район' then begin
    i := map.SelectObjectByName(mainLayer, m^.Caption);
    map.ZoomToObject(mainLayer, i);
    map.Zoom(mainLayer, -120);
    PaintBox1.Repaint;
  end;

  if m^.Parent.Caption = 'Найти АЗС' then begin
    s := m^.Caption;
    s := AnsiReplaceStr(s, '&', '');
    i := map.SelectObjectByName(azsLayer, s);
    map.ZoomToObject(azsLayer, i);
    map.Zoom(mainLayer, -3000);
    PaintBox1.Repaint;
  end;


end;

procedure TMainForm.MyMove(Sender: TObject);
var
m:  ^TTBItem;
i:  integer;
begin
  m := @Sender;
  if m^.Parent.Caption = 'Спозиционировать район' then begin
    i := map.SelectObjectByName(mainLayer, m^.Caption);
    map.ZoomToObject(mainLayer, i);
    map.Zoom(mainLayer, -120);
    PaintBox1.Repaint;
  end;  
end;

procedure TMainForm.PrepareAZSInfo(x, y: integer);
var
IDList: TList;
i, j:  integer;
pi: ^integer;
addr: string;
begin
  IDList := TList.Create;
  map.GetMultiSystemID(azsLayer, x, y, IDList);

  AzsinfoF.ClearAZSList;
  for i:=0 to IDList.Count - 1 do begin
    pi := IDList.Items[i];  //берем системный код объекта
    azsInfo.Close;
    azsInfo.SetVariable(0, pi^);  //загружаем запрос с ним
    azsInfo.Open;

    j := azsinfo.RecordCount;

    addr := '';
//    if (azsInfo.FieldValues['geogrname'] <> null) or
//      (azsInfo.FieldValues['Addr_house'] <> null)
//    then
    if azsInfo.FieldValues['geogrname'] <> null then
      addr := 'ул.' + azsInfo.FieldValues['geogrName'];

    if azsInfo.FieldValues['Addr_house'] <> null then
        addr := addr + ' д.' + azsInfo.FieldValues['ADDR_HOUSE'];
    AzsInfoF.AddAzs(pi^,
      map.GetTextBySystemID(azslayer, pi^),
      addr,
      '111');
  end;

  IDList.Free;
end;

procedure TMainForm.Timer2Timer(Sender: TObject);
begin
  if map.m_drag = false then begin
    map.Animate(azsLayer);
    map.Draw;
  end;

//  statusBar1.Repaint;
end;

function TMainForm.CheckAlarm: boolean;
var
o:  ^TDrawObject;
res:  boolean;
count, i:  integer;
begin
  map.UnAlarmAll(azsLayer);
//посчитаем, какой нужен прогресс бар
  count := 0;
  azs.Close;
  azs.Open;
  for i:=0 to alarmListLength - 1 do
    if AlarmArray[i].Enable = true then
      inc(count);
//умножим на количество АЗС + 1
  count := count*azs.RecordCount;

  f_AzsQuery.ProgressBar1.Position := 0;
  f_AzsQuery.ProgressBar1.Max := count;

//начинаем анализировать сигнализацию
  if AlarmArray[0].Enable = true then  //не активированные пропускаем
    CheckAlarm1;

  if AlarmArray[1].Enable = true then  //не активированные пропускаем
    CheckAlarm2;

  if AlarmArray[2].Enable = true then  //не активированные пропускаем
    CheckAlarm3;

end;

procedure TMainForm.N12Click(Sender: TObject);
begin
  Timer2.Enabled := false;
  if AlarmOptionsDlg.ShowModal = mrOk then begin
    map.Draw;
    f_AZSQuery.Show;
    f_AZSQuery.Update;
    CheckAlarm;
    f_AZSQuery.Close;
  end;
  Timer2.Enabled := true;  
end;

procedure TMainForm.CreateAlarmList;
//проинициализировать список предупрежедений
begin
  Setlength(AlarmArray, alarmListLength);

  AlarmArray[0].name := 'Пропала реализация по Н/П';
  AlarmArray[0].description := 'Случай когда реализация по Н/П ' +
    'стала равна нуля, несмотря на то, что в предыдущих сменах реализации ' +
    'имели место быть';
  AlarmArray[0].enable := false;
  AlarmArray[0].value := -32768;
  AlarmArray[0].Mess := 'Реализация по Н/П "<np>" сошла к нулю';

  AlarmArray[1].name := 'Остатки упали ниже <value> литров';
  AlarmArray[1].description := 'Тревога поднимется, если остатки на АЗС ' +
    'опустятся ниже указанного предела. ' +
    'Нажмите на кнопку "Задать значение..." чтобы указать предел.';
  AlarmArray[1].enable := false;
  AlarmArray[1].value := 100;
  AlarmArray[1].Mess := 'Остатки в резервуаре № <rez> (<np>) упали ниже <value> ' +
    'литров (<value2>)';

  AlarmArray[2].name := 'Остатков осталось на <value> <day>';
  AlarmArray[2].description := 'Считается средне-суточная реализация по нефтепродукту ' +
    'и в случае нехватки остатков на указанное количество дней, выдается предупреждение';
  AlarmArray[2].Enable := false;
  AlarmArray[2].value := 5;
  AlarmArray[2].Mess := '<np> осталось на <value> <day>.';  


end;

procedure TMainForm.CheckAlarm1;
//проверить реализацию
var
s, sm: string;
realz, prev92, prev95, prevdiz, prev80: real;
begin
  azs.First;
  while not azs.Eof do begin
    //делаем запрос
    AZSAlarm_Q1.close;
    AZSAlarm_Q1.SetVariable(0, azs.FieldValues['azs_id']);
    AZSAlarm_Q1.Open;
    AZSAlarm_Q1.First;
    if AZSAlarm_Q1.RecordCount = 0 then begin
      f_AzsQuery.ProgressBar1.StepBy(1);
      f_AzsQuery.Update;
      azs.Next;
      continue;
    end;
    prev80 := -1;
    prev92 := -1;
    prevDiz := -1;
    prev95 := -1;

    while not AZSAlarm_Q1.Eof do begin

      s := AZSAlarm_Q1.FieldValues['nomen_code'];
      s := UpperCase(s);
      if ((s = 'АИ-80') or (s = 'А-80'))and (prev80 = -1) then
        prev80 := AZSAlarm_Q1.FieldValues['s'];
      if ((s = 'ПРЕМИУМ 95') or (s = 'АИ-95') or (s = 'Премиум 95')) and (prev95 = -1) then
        prev95 := AZSAlarm_Q1.FieldValues['s'];
      if ((s = 'ДЗУ') or (s = 'ДИЗТОП')) and (prevDiz = -1) then
        prevDiz := AZSAlarm_Q1.FieldValues['s'];
      if ((s = 'АЗС-92') or (s = 'А-92')) and (prev92 = -1)then
        prev92 := AZSAlarm_Q1.FieldValues['s'];

      if AZSAlarm_Q1.FieldValues['nomen_code'] = 'АИ-80' then
        if (prev80 = 0) and (AZSAlarm_Q1.FieldValues['s'] > 0) then begin
          s := AlarmArray[0].Mess;
          s := AnsiReplaceStr(s, '<np>', Trim(AZSAlarm_Q1.FieldValues['nomen_code']));
          map.SetAlarmText(azsLayer, azs.FieldValues['azs_id'], s);
          prev80 := AZSAlarm_Q1.FieldValues['s'];;
        end;

      if AZSAlarm_Q1.FieldValues['nomen_code'] = 'АИ-92' then
        if (prev92 = 0) and (AZSAlarm_Q1.FieldValues['s'] > 0) then begin
          s := AlarmArray[0].Mess;
          s := AnsiReplaceStr(s, '<np>', Trim(AZSAlarm_Q1.FieldValues['nomen_code']));
          map.SetAlarmText(azsLayer, azs.FieldValues['azs_id'], s);
          prev92 := AZSAlarm_Q1.FieldValues['s'];
        end;

      if AZSAlarm_Q1.FieldValues['nomen_code'] = 'ДЗУ' then
        if (prevDiz = 0) and (AZSAlarm_Q1.FieldValues['s'] > 0) then begin
          s := AlarmArray[0].Mess;
          s := AnsiReplaceStr(s, '<np>', Trim(AZSAlarm_Q1.FieldValues['nomen_code']));
          map.SetAlarmText(azsLayer, azs.FieldValues['azs_id'], s);
          prevDiz := AZSAlarm_Q1.FieldValues['s'];;
        end;

      if AZSAlarm_Q1.FieldValues['nomen_code'] = 'Премиум 95' then
        if (prev95 = 0) and (AZSAlarm_Q1.FieldValues['s'] > 0) then begin
          s := AlarmArray[0].Mess;
          s := AnsiReplaceStr(s, '<np>', Trim(AZSAlarm_Q1.FieldValues['nomen_code']));
          map.SetAlarmText(azsLayer, azs.FieldValues['azs_id'], s);
          prev95 := AZSAlarm_Q1.FieldValues['s'];;
        end;

      AZSAlarm_Q1.Next;
    end;
    f_AzsQuery.ProgressBar1.StepBy(1);
    f_AzsQuery.Update;
    azs.Next;
  end;
end;

procedure TMainForm.CheckAlarm2;
//проверить остатки
var
s, sm:  string;
begin
  azs.First;
  while not azs.Eof do begin
    //делаем запрос
    AZSAlarm_Q2.close;
    AZSAlarm_Q2.SetVariable(0, azs.FieldValues['azs_id']);
    AZSAlarm_Q2.Open;
    AZSAlarm_Q2.First;
    if AZSAlarm_Q2.RecordCount = 0 then begin
      f_AzsQuery.ProgressBar1.StepBy(1);
      f_AzsQuery.Update;
      azs.Next;
      continue;
    end;
    sm := AZSAlarm_Q2.FieldValues['SM_NUMBER'];
    while not AZSAlarm_Q2.Eof do begin
      if AZSAlarm_Q2.FieldValues['fact_volume'] < AlarmArray[1].value then begin
        s := AlarmArray[1].Mess;
        //<rez>, <np>, <value>   
        s := AnsiReplaceStr(s, '<rez>', Trim(AZSAlarm_Q2.FieldValues['numb']));
        s := AnsiReplaceStr(s, '<np>', Trim(AZSAlarm_Q2.FieldValues['nomen_code']));
        s := AnsiReplaceStr(s, '<value>', FloatToStr(AlarmArray[1].value));
        s := AnsiReplaceStr(s, '<value2>', FloatToStr(AZSAlarm_Q2.FieldValues['fact_volume']));
        map.SetAlarmText(azsLayer, azs.FieldValues['azs_id'], s);
      end;
      AZSAlarm_Q2.Next;
      if sm <> AZSAlarm_Q2.FieldValues['SM_NUMBER'] then
        break;
    end;
    azs.Next;
    f_AzsQuery.ProgressBar1.StepBy(1);
    f_AzsQuery.Update;
  end;
end;

procedure TMainForm.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
var
i:  integer;
begin
{  i := MilliSecondOf(time) and 1;
  panel.Text := 'АЗС!!! ' + intToStr(i);
  if (map.IsAlarm(azsLayer) = true) and (i = 1) then begin
    SetTextColor(Statusbar1.Canvas.Handle, clRed);
    Statusbar1.Canvas.TextOut(rect.right - Statusbar1.Canvas.TextWidth(panel.text) - 10, rect.Top, panel.Text);
  end;}
end;

procedure TMainForm.CheckAlarm3;
var
s, sm:  string;
summ: double;
counr:  integer;
np: string;
rest: double;
begin
  azs.First;
  while not azs.Eof do begin
    //делаем запрос
    AZSAlarm_Q2.close;
    AZSAlarm_Q2.SetVariable(0, azs.FieldValues['azs_id']);
    AZSAlarm_Q2.Open;
    AZSAlarm_Q2.First;
    if AZSAlarm_Q2.RecordCount = 0 then begin
      f_AzsQuery.ProgressBar1.StepBy(1);
      f_AzsQuery.Update;
      azs.Next;
      continue;
    end;
    sm := AZSAlarm_Q2.FieldValues['SM_NUMBER'];
    //проходим по все номенклаторам
    while not AZSAlarm_Q2.Eof do begin
    //берем нефтепродукт и остаток
      np := Trim(AZSAlarm_Q2.FieldValues['nomen_code']);
      rest := AZSAlarm_Q2.FieldValues['fact_volume'];
      if sm <> AZSAlarm_Q2.FieldValues['SM_NUMBER'] then
        break;
    //узнаем среднюю реализацию
      AZSAlarm_Q3.Close;
      AZSAlarm_Q3.SetVariable(0, azs.FieldValues['azs_id']);
      AZSAlarm_Q3.SetVariable(1, AZSAlarm_Q2.FieldValues['nomen_code']);
      AZSAlarm_Q3.Open;

      if (AZSAlarm_Q3.RecordCount <> 0) and (AZSAlarm_Q3.FieldValues['s'] > 0)then
        if (rest/AZSAlarm_Q3.FieldValues['s']) < AlarmArray[2].value then begin
          s := AlarmArray[2].Mess;
          //<rez>, <np>, <value>
          s := AnsiReplaceStr(s, '<np>', Trim(AZSAlarm_Q2.FieldValues['nomen_code']));
          s := AnsiReplaceStr(s, '<value>', FloatToStr(Round(rest/AZSAlarm_Q3.FieldValues['s'])));
          s := AnsiReplaceStr(s, '<day>', AlarmOptionsDlg.MyDeclension(Round(rest/AZSAlarm_Q3.FieldValues['s']), '<day>'));
          map.SetAlarmText(azsLayer, azs.FieldValues['azs_id'], s);
        end;
      AZSAlarm_Q2.Next;        
    end;

    azs.Next;
    f_AzsQuery.ProgressBar1.StepBy(1);
    f_AzsQuery.Update;
  end;
end;

end.
