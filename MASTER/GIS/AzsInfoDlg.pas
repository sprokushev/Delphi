unit AzsInfoDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, TB2Item, TB2Dock,
  TB2Toolbar;

type azsInfo = record
  ID: integer;
  name: string;
  addres: string;
  telefon: string;
end;

type
  TazsinfoF = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Bevel2: TBevel;
    Panel3: TPanel;
    Panel4: TPanel;
    ScrollBar1: TScrollBar;
    addressLabel: TLabel;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBSubmenuItem1: TTBSubmenuItem;
    telefonLabel: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    TBSubmenuItem2: TTBSubmenuItem;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure TBItem1Click(Sender: TObject);
    procedure TBItem2Click(Sender: TObject);
    procedure TBItem3Click(Sender: TObject);
    procedure TBItem4Click(Sender: TObject);    public
    Procedure LastFocus(var Mess : TMessage) ; message  WM_ACTIVATE;

  private
    position: integer;  //текущая АЗЧ
    azsList:  TList;
    procedure RebuildWindow;
  public
    procedure ClearAZSList;
    procedure AddAzs(ID: integer;
      name, addres, telefon: string);

    procedure MyUpdate;
    { Public declarations }
  end;

var
  azsinfoF: TazsinfoF;

implementation

uses azsEff, WaitF, DatePeriod, remainsF;

{$R *.dfm}

{ TazsinfoF }
procedure TazsinfoF.RebuildWindow;
var
//FullRgn, Rgn: THandle;
//ClientX, ClientY, I: Integer;
rgn:  HRGN;
rgnData: array[0..3] of TPoint;

begin
  rgnData[0] := Point(0, 0);
  rgnData[1] := Point(Width, 0);
  rgnData[2] := Point(Width, Height);
  rgnData[3] := Point(0, Height);
  Rgn := CreatePolygonRgn(rgnData, 4, WINDING);
  SetWindowRgn(Handle, Rgn, True);
end;

procedure TazsinfoF.FormCreate(Sender: TObject);
begin
  inherited;
  AlphaBlend := true;
  AlphaBlendValue := 240;
  RebuildWindow;
  azsList := TList.Create;
end;

procedure TazsinfoF.LastFocus(var Mess: TMessage);
begin
  IF  Mess.wParam = WA_INACTIVE Then
    close;
  Inherited;
end;

procedure TazsinfoF.Button1Click(Sender: TObject);
begin
  ShowMessage('Некий отчет');
end;

procedure TazsinfoF.AddAzs(ID: integer;
  name, addres, telefon: string);
//добавить информацию по АЗС
var
o:  ^azsInfo;
begin
  new(o);
  o^.ID := ID;
  o^.name := name;
  o^.addres := addres;
  o^.telefon := telefon;
  azsList.Add(o);
  scrollBar1.Position := 0;
  scrollBar1.Max := azsList.Count - 1;
end;

procedure TazsinfoF.ClearAZSList;
var
i:  integer;
azs:  ^azsInfo;
begin
  for i:=0 to azsList.Count - 1 do begin
    azs := azsList.Items[i];
    dispose(azs);
  end;

  azsList.Clear;
  position := 0;

end;

procedure TazsinfoF.FormDestroy(Sender: TObject);
begin
  azslist.Free;
end;

procedure TazsinfoF.FormShow(Sender: TObject);
//var
//curr: ^azsinfo;
//i:    integer;
begin
  scrollBar1.Position := 0;
  scrollBar1.Max := azsList.Count - 1;

  position := 0;
  MyUpdate;
end;

procedure TazsinfoF.MyUpdate;
var
curr: ^azsinfo;
begin
  curr := azsList.items[ScrollBar1.position];
  panel4.Caption := curr^.name;
  addressLabel.Caption := 'Адрес: ' + curr^.addres;
  telefonLabel.Caption := 'Телефон: ' + curr^.telefon;

  Label3.Caption := IntToStr(curr^.ID);
  Update;
end;

procedure TazsinfoF.ScrollBar1Change(Sender: TObject);
begin
  MyUpdate;
end;

procedure TazsinfoF.TBItem1Click(Sender: TObject);
//отчет за прошлую неделю.
var
dow:  WORD; //день недели
curr: ^azsinfo;
begin
  curr := azsList.items[ScrollBar1.position];
  dow := DayOfWeek(Date) - 1; //определяем день недели

  azsEffDlg.startRep := DateToStr(Date - dow + 1);
  azsEffDlg.endRep := DateToStr(Date - dow + 7);

  azseffDlg.Src.Close;
  azsEffDlg.Src.SetVariable(0, azsEffDlg.startRep);
  azsEffDlg.Src.SetVariable(1, azsEffDlg.endRep);
  azsEffDlg.Src.SetVariable(2, curr^.ID);

  azsEffDlg.Caption :=
    'Эффективность работы ' + panel4.Caption + ' с ' + azsEffDlg.startRep +
    ' по ' + azsEffDlg.endRep;
  azsEffDlg.Label1.caption := azsEffDlg.Caption;

  WaitDlg.Show;
  WaitDlg.Update;

//открываем запрос
  azsEffDlg.src.open;

  WaitDlg.Hide;

  AzsEffDlg.ShowModal;
end;

procedure TazsinfoF.TBItem2Click(Sender: TObject);
var
dow:  WORD; //день недели
curr: ^azsinfo;
begin
  curr := azsList.items[ScrollBar1.position];
  dow := DayOfWeek(Date) - 1; //определяем день недели

  azsEffDlg.startRep := DateToStr(Date - dow + 1 - 7);
  azsEffDlg.endRep := DateToStr(Date - dow);

  azseffDlg.Src.Close;
  azsEffDlg.Src.SetVariable(0, azsEffDlg.startRep);
  azsEffDlg.Src.SetVariable(1, azsEffDlg.endRep);
  azsEffDlg.Src.SetVariable(2, curr^.ID);

  azsEffDlg.Caption :=
    'Эффективность работы ' + panel4.Caption + ' с ' + azsEffDlg.startRep +
    ' по ' + azsEffDlg.endRep;
  azsEffDlg.Label1.caption := azsEffDlg.Caption;

  WaitDlg.Show;
  WaitDlg.Update;

//открываем запрос
  azsEffDlg.src.open;

  WaitDlg.Hide;

  AzsEffDlg.ShowModal;
end;

procedure TazsinfoF.TBItem3Click(Sender: TObject);
var
curr: ^azsinfo;
begin
  fDatePeriod:=TfDatePeriod.Create(Self);
  if fDatePeriod.ShowModal=mrOk then
    begin
      curr := azsList.items[ScrollBar1.position];


      azsEffDlg.startRep := DateToStr(fDatePeriod.e_Date1.Date);
      azsEffDlg.endRep := DateToStr(fDatePeriod.e_Date2.Date);

      azseffDlg.Src.Close;
      azsEffDlg.Src.SetVariable(0, azsEffDlg.startRep);
      azsEffDlg.Src.SetVariable(1, azsEffDlg.endRep);
      azsEffDlg.Src.SetVariable(2, curr^.ID);

      azsEffDlg.Caption :=
        'Эффективность работы ' + panel4.Caption + ' с ' + azsEffDlg.startRep +
        ' по ' + azsEffDlg.endRep;
      azsEffDlg.Label1.caption := azsEffDlg.Caption;

      WaitDlg.Show;
      WaitDlg.Update;

    //открываем запрос
      azsEffDlg.Generate;
//      azsEffDlg.src.open;

      WaitDlg.Hide;

      AzsEffDlg.ShowModal;
    end;
  fDatePeriod.Free;
end;

procedure TazsinfoF.TBItem4Click(Sender: TObject);
var
curr: ^azsinfo;
begin
  curr := azsList.items[ScrollBar1.position];

     WaitDlg.Show;
     WaitDlg.Update;

    //открываем запрос
    RemainsDlg.Generate(curr^.ID);

    WaitDlg.Hide;

    RemainsDlg.ShowModal;

end;

end.
