unit DM1;

interface

uses
  SysUtils, Classes, Oracle, DB, OracleData;

type
  TDataModule1 = class(TDataModule)
    q_tank: TOracleDataSet;
    ora_Session: TOracleSession;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: TDataModule1;

implementation

{$R *.dfm}

end.
