program ReportAZS;

uses
  Forms,
  azsEff in 'azsEff.pas' {f_azsEff};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tf_azsEff, f_azsEff);
  Application.Run;
end.
