program TankService;

{$APPTYPE CONSOLE}

uses
  ExceptionLog,
  WebBroker,
  CGIApp,
  TankServiceCGI in 'TankServiceCGI.pas' {WebModule1: TWebModule},
  TM_TankService1Impl in 'TM_TankService1Impl.pas',
  TM_TankService1Intf in 'TM_TankService1Intf.pas',
  DM1 in 'DM1.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TWebModule1, WebModule1);
//  Application.CreateForm(TDataModule1, dm);
  Application.Run;
end.
