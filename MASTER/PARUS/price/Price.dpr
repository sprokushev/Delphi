program Price;

uses
  Forms,
  PriceNPO in 'PriceNPO.pas' {frmPrice};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrice, frmPrice);
  Application.Run;
end.
