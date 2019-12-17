unit NewSFAsker;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, DB, OracleData;

type
  Tf_NewSFAsker = class(TForm)
    MonthCalendar1: TMonthCalendar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    gr_NomSF: TGroupBox;
    e_nomSF: TEdit;
    OracleDataSet1: TOracleDataSet;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_NewSFAsker: Tf_NewSFAsker;

implementation

{$R *.dfm}

procedure Tf_NewSFAsker.FormCreate(Sender: TObject);
begin
  MonthCalendar1.Date:=Date;
end;

end.
