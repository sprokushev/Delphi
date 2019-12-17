program mtrload;

uses
  ExceptionLog,
  Forms,
  main in 'MTR\main.pas' {f_main},
  mtredit in 'MTR\mtredit.pas' {F_mtredit},
  ForSESS in 'ForSESS.pas' {ApplSession},
  ForEnv in 'ENVIRONMENT\ForEnv.pas',
  ForFiles in 'ForFiles.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tf_main, f_main);
  Application.Run;
end.
