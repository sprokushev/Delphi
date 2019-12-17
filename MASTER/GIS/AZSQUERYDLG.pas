unit AZSQUERYDLG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  Tf_AzsQuery = class(TForm)
    Label1: TLabel;
    ProgressBar1: TProgressBar;
    Animate1: TAnimate;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_AzsQuery: Tf_AzsQuery;

implementation

{$R *.dfm}

procedure Tf_AzsQuery.FormShow(Sender: TObject);
begin
  Animate1.Active:=True;
end;

procedure Tf_AzsQuery.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Animate1.Active:=False;
end;

end.
