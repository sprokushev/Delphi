program pr17;

uses
  Forms,
  pr17load in 'pr17load.pas' {frmPR17};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPR17, frmPR17);
  Application.Run;
end.
