unit Info;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ExtCtrls;

type
  TfmInfo = class(TForm)
    Panel1: TPanel;
    DBMemo1: TDBMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmInfo: TfmInfo;

implementation

uses Admin;

{$R *.DFM}


procedure TfmInfo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fmAdmin.sbInfo.Down := False;
end;

end.
