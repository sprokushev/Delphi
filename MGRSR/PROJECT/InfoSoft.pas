unit InfoSoft;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TfmInfoSoft = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    bbClose: TBitBtn;
    meInfoSoft: TMemo;
    procedure bbCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmInfoSoft: TfmInfoSoft;

implementation

uses Main;

{$R *.DFM}

procedure TfmInfoSoft.bbCloseClick(Sender: TObject);
begin
  Close;
end;


procedure TfmInfoSoft.FormCreate(Sender: TObject);
begin
  meInfoSoft.Lines.LoadFromFile(fmMain.gInfoFile);
end;

end.
