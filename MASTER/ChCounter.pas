unit ChCounter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Oracle, OracleData, Grids, DBGridEh;

type
  Tf_ChooseCounter = class(TForm)
    DBGridEh1: TDBGridEh;
    DataSource1: TDataSource;
    OracleDataSet1: TOracleDataSet;
    OracleDataSet1ID: TFloatField;
    OracleDataSet1COUNTER_NAME: TStringField;
    OracleDataSet1COUNTER_QUESRY: TStringField;
    OracleDataSet1DETAIL_QUERY: TStringField;
    OracleDataSet1XCAPTION: TStringField;
    OracleDataSet1YCAPTION: TStringField;
    OracleDataSet1DETAILINFO_QUERY: TStringField;
    OracleDataSet1LOGIN: TStringField;
    OracleDataSet1PASSWORD: TStringField;
    OracleDataSet1DATABASE: TStringField;
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CounterQuery:AnsiString;
    DetailQuery:AnsiString;
    DetailInfoQuery:AnsiString;
    XCaption:String;
    YCaption:String;
  end;

var
  f_ChooseCounter: Tf_ChooseCounter;

implementation

uses main;

{$R *.dfm}

procedure Tf_ChooseCounter.DBGridEh1DblClick(Sender: TObject);
begin
  Close;
end;

procedure Tf_ChooseCounter.FormCreate(Sender: TObject);
begin
  OracleDataSet1.session:=f_main.ora_Session;
  OracleDataSet1.Open;
end;

end.
