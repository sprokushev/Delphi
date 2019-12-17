unit selectDep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, Mask, DBCtrlsEh, DBLookupEh, Oracle,
  OracleData, Buttons, RxDBComb, RxLookup, ComCtrls;

type
  Tf_selectDep = class(TForm)
    dep: TOracleDataSet;
    OracleSession1: TOracleSession;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//var
//  f_selectDep: Tf_selectDep;

implementation

uses DateUtils;

{$R *.dfm}

procedure Tf_selectDep.FormShow(Sender: TObject);
var
st, en: TDate;
begin
//определим начальные параметры
  st := Date - DayOfTheMonth(Date) + 1;
  DateTimePicker1.date := st;
  DateTimePicker1.Time := 0;//StrToTime('17:00');

  en := Date;
  DateTimePicker2.date := en;
  DateTimePicker2.Time := 0;//StrToTime('17:00');
end;

end.
