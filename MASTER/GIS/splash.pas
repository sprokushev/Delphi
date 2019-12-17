unit splash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, ComCtrls, StdCtrls;

type
  TsplashDlg = class(TForm)
    Bevel1: TBevel;
    Image1: TImage;
    Label1: TLabel;
    PB1: TProgressBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  splashDlg: TsplashDlg;

implementation

{$R *.dfm}

end.
