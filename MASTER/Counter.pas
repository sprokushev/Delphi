unit Counter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, StdCtrls, DBCtrls, OracleData, Oracle, Menus;

type
  Tf_Counter = class(TForm)
    OracleSession1: TOracleSession;
    OracleDataSet1: TOracleDataSet;
    DataSource1: TDataSource;
    DBText1: TDBText;
    DBText2: TDBText;
    Timer1: TTimer;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CQ:AnsiString;
    DQ:AnsiString;
    DIQ:AnsiString;
    XCap,YCap,Logon,Password,Database:String;
  end;

var
  f_Counter: Tf_Counter;

implementation

uses DateUtils,ChCounter,CChart,CDetail, ForDB;

{$R *.dfm}

procedure Tf_Counter.Timer1Timer(Sender: TObject);
begin
  OracleDataSet1.DisableControls;
  OracleDataSet1.Close;
  OracleDataSet1.Open;
  OracleDataSet1.EnableControls;
end;

procedure Tf_Counter.FormCreate(Sender: TObject);
begin
  with tf_ChooseCounter.Create(Self) do
    begin
      ShowModal;
      CQ:=OracleDataSet1.fieldbyname('counter_quesry').AsString;
      DQ:=OracleDataSet1.fieldbyname('detail_query').AsString;
      DIQ:=OracleDataSet1.fieldbyname('detailinfo_query').AsString;
      XCap:=OracleDataSet1.fieldbyname('xcaption').AsString;
      YCap:=OracleDataSet1.fieldbyname('ycaption').AsString;
      Logon:=OracleDataSet1.fieldbyname('login').AsString;
      Password:=OracleDataSet1.fieldbyname('password').AsString;
      Database:=OracleDataSet1.fieldbyname('database').AsString;
      OracleDataSet1.Close;
      OracleSession1.LogOff;
      Free;
    end;
  OracleDataSet1.SQL.Clear;
  OracleDataSet1.SQL.Add(CQ);
  if Logon<>'' then
    begin
      OracleSession1.LogonUsername:=Logon;
      OracleSession1.LogonPassword:=Password;
      OracleSession1.LogonDatabase:=Database;
      OracleSession1.LogOn;
    end
  else
    f_db.LogonMasterSession(OracleSession1);

  OracleDataSet1.Open;
  Timer1.Enabled:=True;
end;

procedure Tf_Counter.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Timer1.Enabled:=False;
  OracleDataSet1.Close;
  OracleSession1.LogOff;
  Action:=caFree;
end;

procedure Tf_Counter.N3Click(Sender: TObject);
begin
  Close;
end;

procedure Tf_Counter.N1Click(Sender: TObject);
var
  S:String;
  I:Integer;
begin
  S:=InputBox('','Введите время обновления (сек)',IntToStr(Round(Timer1.Interval/1000)));
  I:=0;
  if S<>'' then
    I:=StrToInt(S);
  If I>0 then
    Timer1.Interval:=i*1000;
end;

procedure Tf_Counter.N4Click(Sender: TObject);
begin
  if DQ='' then ShowMessage('Sorry No Detail Info :(')
  else
    with tf_CounterChart.Create(Self) do
      begin
        OracleDataSet1.SQL.Clear;
        OracleDataSet1.SQL.Add(DQ);
        Chart1.Title.Text.Clear;
        Chart1.BottomAxis.Title.Caption:=XCap;
        Chart1.LeftAxis.Title.Caption:=YCap;
        ShowModal;
        Free;
      end;
end;

procedure Tf_Counter.N5Click(Sender: TObject);
begin
  if DIQ='' then ShowMessage('Sorry No Detail Info :(')
  else
    with tf_DetailInfo.Create(Self) do
      begin
        if Logon<>'' then
          begin
            OracleSession1.LogonUsername:=Logon;
            OracleSession1.LogonPassword:=Password;
            OracleSession1.LogonDatabase:=Database;
          end;
        OracleSession1.LogOn;
        OracleDataSet1.SQL.Clear;
        OracleDataSet1.SQL.Add(DIQ);
        OracleDataSet1.Open;
        ShowModal;
        Free;
      end;
end;

end.
