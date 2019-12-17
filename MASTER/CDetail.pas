unit CDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, DB, OracleData, Oracle;

type
  Tf_DetailInfo = class(TForm)
    DataSource1: TDataSource;
    OracleDataSet1: TOracleDataSet;
    DBGridEh1: TDBGridEh;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_DetailInfo: Tf_DetailInfo;

implementation

uses main;

{$R *.dfm}

procedure Tf_DetailInfo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OracleDataSet1.Close;
end;

procedure Tf_DetailInfo.FormCreate(Sender: TObject);
begin
  OracleDataSet1.Session:=f_main.ora_Session;
  OracleDataSet1.Open;
end;

end.
