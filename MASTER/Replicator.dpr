program Replicator;

uses
  ExceptionLog,
  Forms,
  main in 'REPL\main.pas' {f_main},
  ForFiles in 'ForFiles.pas',
  ForSystem in 'ForSystem.pas',
  ForSESS in 'ForSESS.pas' {ApplSession},
  ForEnv in 'ENVIRONMENT\ForEnv.pas',
  ReplInit in 'REPL\ReplInit.pas' {f_ReplInit},
  ForDB in 'ForDB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tf_main, f_main);
  Application.Run;
end.
