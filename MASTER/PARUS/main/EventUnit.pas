unit EventUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmEvents = class(TForm)
    lbEvents: TListBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation
Uses Main;

{$R *.dfm}

procedure TfrmEvents.FormCreate(Sender: TObject);
begin
 Dock(frmMain,Rect(0,0,100,100));
end;

procedure TfrmEvents.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

end.
