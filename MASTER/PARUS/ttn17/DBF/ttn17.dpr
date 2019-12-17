program ttn17;

uses
  Forms,
  ttn17load in 'ttn17load.pas' {frmTTN17};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmTTN17, frmTTN17);
  Application.Run;
end.
