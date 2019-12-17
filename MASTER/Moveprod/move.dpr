program move;

uses
  ExceptionLog,
  Forms,
  u_moveprod in 'u_moveprod.pas' {f_move},
  main in 'main.pas' {f_main},
  MdiForm in '..\MdiForm.pas' {f_MDIForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tf_main, f_main);
  //Application.CreateForm(Tf_move, f_move);
  //Application.CreateForm(Tf_MDIForm, f_MDIForm);
  Application.Run;
end.
