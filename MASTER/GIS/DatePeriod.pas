unit DatePeriod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons;

type
  TfDatePeriod = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    e_Date1: TDateTimePicker;
    e_Date2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fDatePeriod: TfDatePeriod;

implementation

uses DateUtils;

{$R *.dfm}

procedure TfDatePeriod.FormShow(Sender: TObject);
begin
  e_Date1.Date:=StartOfTheMonth(Date);
  e_Date2.Date:=Date;
end;

end.
