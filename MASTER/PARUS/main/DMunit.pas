unit DMunit;

interface

uses
  SysUtils, Classes, Oracle;

type
  TDM = class(TDataModule)
    oraParus: TOracleSession;
    oraMain: TOracleSession;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
