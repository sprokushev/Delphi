program cord;

uses
  Forms,
  cordload in 'cordload.pas' {frmCord};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmCord, frmCord);
  Application.Run;
end.
