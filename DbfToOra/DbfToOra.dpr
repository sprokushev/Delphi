program DbfToOra;

uses
  ExceptionLog,
  Forms,
  main in 'main.pas' {FormMain},
  ForSystem in 'U:\MASTER\ForSystem.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
