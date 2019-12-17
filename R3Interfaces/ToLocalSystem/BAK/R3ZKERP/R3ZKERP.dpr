program R3ZKERP;

uses
  ExceptionLog,
  Forms,
  Main in 'Main.pas' {f_main},
  CSVToDB in '..\..\Shared\CSVToDB.pas',
  CSVToDBOra in '..\..\Shared\CSVToDBOra.pas',
  SystemConstants in '..\..\Shared\SystemConstants.pas',
  ForEnv in '..\..\..\..\ENVIRONMENT\ForEnv.pas',
  ForSystem in '..\..\..\..\ForSystem.pas',
  ForSESS in '..\..\..\..\ForSESS.pas' {ApplSession},
  ForFiles in '..\..\..\..\ForFiles.pas',
  ForDB in '..\..\..\..\ForDB.pas',
  MemoEdit in '..\..\..\..\MemoEdit.pas' {f_MemoEdit};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tf_main, f_main);
  Application.CreateForm(Tf_MemoEdit, f_MemoEdit);
  Application.Run;
end.
