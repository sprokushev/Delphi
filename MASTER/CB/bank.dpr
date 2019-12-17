Program bank;



uses
  Forms,
  loader in 'loader.pas' {cb2parus};

{$R *.res}

Begin
  Application.Initialize;
  Application.CreateForm(Tcb2parus, cb2parus);
  Application.Run;
End.

