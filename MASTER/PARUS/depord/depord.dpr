program depord;

uses
  Forms,
  depordload in 'depordload.pas' {frmDepord};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmDepord, frmDepord);
  Application.Run;
end.
