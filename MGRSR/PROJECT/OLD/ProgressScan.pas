unit ProgressScan;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls;

type
  TfmProgressScan = class(TForm)
    buCancel: TButton;
    pbScan: TProgressBar;
    Panel1: TPanel;
    lbScan: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmProgressScan: TfmProgressScan;

implementation

{$R *.DFM}

end.
