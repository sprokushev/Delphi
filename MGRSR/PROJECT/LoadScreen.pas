unit LoadScreen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, RXCtrls;

type
  TfmLoadScreen = class(TForm)
    pnMain: TPanel;
    lbMessage: TLabel;
    paLine: TPanel;
    xlbAppName: TRxLabel;
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmLoadScreen: TfmLoadScreen;

implementation

{$R *.DFM}


end.
