program TestIP;

uses
  Forms,
  main in 'main.pas' {f_main},
  ForEnv in 'ForEnv.pas',
  ForSESS in 'ForSESS.pas' {ApplSession},
  PingTh in 'PingTh.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Проверка доступности по IP';
  Application.CreateForm(Tf_main, f_main);
  Application.Run;
end.
