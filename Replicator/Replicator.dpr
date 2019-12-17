program Replicator;

uses
  Forms,
  main in 'main.pas' {f_main},
  ForFiles in 'U:\MASTER\ForFiles.pas',
  ForSystem in 'U:\MASTER\ForSystem.pas',
  ForSESS in 'U:\MASTER\ForSESS.pas' {ApplSession},
  ForDB in 'U:\MASTER\ForDB.pas',
  ForDBConn in 'U:\MASTER\ForDBConn.pas' {DBConn},
  ForEnv in 'U:\MASTER\ENVIRONMENT\ForEnv.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tf_main, f_main);
  Application.Run;
end.
