unit FindDov;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TF_FindDov = class(TForm)
    edSeek: TEdit;
    procedure edSeekKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SeekStr:string;
  end;

var
  F_FindDov: TF_FindDov;

implementation

{$R *.DFM}

procedure TF_FindDov.edSeekKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=vk_return then ModalResult:=mrYes;
  if Key=vk_ESCAPE then ModalResult:=mrNo;
end;

procedure TF_FindDov.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  SeekStr:=edSeek.Text;
end;

procedure TF_FindDov.FormActivate(Sender: TObject);
begin
  edSeek.SelectAll;
end;

end.
