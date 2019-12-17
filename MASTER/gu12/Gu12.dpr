program Gu12;

uses
  //ExceptionLog,
  ExceptionLog,
  Forms,
  main in 'main.pas' {f_main},
  U_zayav in 'U_zayav.pas' {f_zayav},
  ForDB in '..\ForDB.pas',
  ForSystem in '..\ForSystem.pas',
  ForTemp in '..\ForTemp.pas',
  OraToDbf in '..\OraToDbf.pas',
  EdCatCen in '..\EdCatCen.pas',
  MemoEdit in '..\MemoEdit.pas' {f_MemoEdit},
  U_reis in 'U_reis.pas' {f_reis},
  U_add_razb in 'U_add_razb.pas' {f_add_razb},
  U_glob_var in 'U_glob_var.pas',
  U_otkaz in 'U_otkaz.pas' {f_otkaz},
  U_period in 'U_period.pas' {f_period};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tf_main, f_main);
  Application.Run;
end.
