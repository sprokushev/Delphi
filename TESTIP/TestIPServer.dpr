program TestIPServer;

uses
  Forms,
  main_srv in 'main_srv.pas' {f_main};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tf_main, f_main);
  Application.Run;
end.
