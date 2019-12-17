program Project2;

uses
  Forms,
  vyp_load in 'vyp_load.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
