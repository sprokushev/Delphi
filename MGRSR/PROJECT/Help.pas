unit Help;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TfmHelp = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    bbClose: TBitBtn;
    meHelp: TMemo;
    procedure bbCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmHelp: TfmHelp;

implementation

uses Main;

{$R *.DFM}

procedure TfmHelp.bbCloseClick(Sender: TObject);
begin
  Close;
end;


procedure TfmHelp.FormCreate(Sender: TObject);
begin
  meHelp.Lines.LoadFromFile(fmMain.gHelpFile);
end;

end.
