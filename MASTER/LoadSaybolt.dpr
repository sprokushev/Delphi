program LoadSaybolt;

uses
  Forms,
  SayboltSMN in 'SayboltSMN.pas' {f_LoadSaybolt};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tf_LoadSaybolt, f_LoadSaybolt);
  Application.Run;
end.
