program GoodSender;

uses
  ExceptionLog,
  Forms,
  main in 'main.pas' {frmMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
