unit AnyForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

type
  TfmAnyForm = class(TForm)
    pnTop: TPanel;
    pnMiddle: TPanel;
    pnBottom: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAnyForm: TfmAnyForm;

implementation

{$R *.DFM}

end.
