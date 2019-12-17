program ttn17d;

uses
  Forms,
  ttn17dload in 'ttn17dload.pas' {frmTTN17d};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmTTN17d, frmTTN17d);
  Application.Run;
end.
