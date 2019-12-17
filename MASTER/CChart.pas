unit CChart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, TeEngine, Series, ExtCtrls, TeeProcs,
  Chart;

type
  Tf_CounterChart = class(TForm)
    Chart1: TChart;
    DataSource1: TDataSource;
    OracleDataSet1: TOracleDataSet;
    OracleDataSet1HOURS: TStringField;
    OracleDataSet1VALUE: TFloatField;
    Series1: TLineSeries;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_CounterChart: Tf_CounterChart;

implementation

uses main;

{$R *.dfm}

procedure Tf_CounterChart.FormShow(Sender: TObject);
begin
  OracleDataSet1.Session:=f_main.ora_Session;
  OracleDataSet1.Open;
//  Chart1.BottomAxis.Title.Caption:='Время суток, час.';
  while not OracleDataSet1.Eof do
    begin
      Series1.AddXY(
        OracleDataSet1.FieldByName('hours').AsInteger,
        OracleDataSet1.FieldByName('value').AsInteger,
        '',clTeeColor
      );
      OracleDataSet1.Next;
    end;
end;

procedure Tf_CounterChart.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  OracleDataSet1.Close;
end;

end.
