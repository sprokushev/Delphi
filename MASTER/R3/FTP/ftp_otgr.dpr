program ftp_otgr;

uses
  ExceptionLog,
  Forms,
  ftp_upload in 'ftp_upload.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
