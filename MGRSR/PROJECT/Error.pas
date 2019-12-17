unit Error;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ExtCtrls;

type
  TfmError = class(TForm)
    Panel1: TPanel;
    DBMemo1: TDBMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmError: TfmError;

implementation

uses Admin;

{$R *.DFM}


procedure TfmError.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fmAdmin.sbError.Down := False;
end;

end.
