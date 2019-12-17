unit cardHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Oracle, DB, OracleData, Grids,
  DBGridEh,
  {vgCtrls,}mdiform,
  {vgDBTree,} Menus, ActnList,
  XPStyleActnCtrls, ActnMan, ToolWin,
  ActnCtrls, TB2Dock, TB2ToolWindow, RxLookup,DBGrids,DBGridEhImpExp,
  DateUtils, Math,RxShell;


type
  Tf_cardHistory = class(Tf_MDIForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    card: TEdit;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label3: TLabel;
    DateTimePicker2: TDateTimePicker;
    Button1: TButton;
    OracleSession1: TOracleSession;
    OracleLogon1: TOracleLogon;
    GroupBox2: TGroupBox;
    DBGridEh1: TDBGridEh;
    data: TOracleDataSet;
    DataSource1: TDataSource;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_cardHistory: Tf_cardHistory;

implementation

{$R *.dfm}

procedure Tf_cardHistory.FormShow(Sender: TObject);
begin
  OracleLogon1.Execute;
  DateTimePicker1.date := Date;
  DateTimePicker1.Time := StrToTime('00:01');
  DateTimePicker2.date := Date;
  DateTimePicker2.Time := StrToTime('23:59');
end;

procedure Tf_cardHistory.Button1Click(Sender: TObject);
begin
  Data.Close;
  Data.SetVariable(0, card.Text);
  Data.SetVariable(1, DateTimePicker1.DateTime);
  Data.SetVariable(2, DateTimePicker2.DateTime);
  Data.Open;
end;

procedure Tf_cardHistory.Button2Click(Sender: TObject);
begin
  SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,DBGridEh1,
    card.text + '.xls',True);
  FileExecute(card.text + '.xls','','',esMaximized);
end;

procedure Tf_cardHistory.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
