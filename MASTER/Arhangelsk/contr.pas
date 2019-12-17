unit contr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, Grids, DBGridEh,MdiForm;

type
  Tfrm1cParAgn = class(Tf_MDIForm)
    oraParus: TOracleSession;
    oraLog: TOracleLogon;
    oraAGN: TOracleDataSet;
    dsAGN: TDataSource;
    grAGN: TDBGridEh;
    oraAGNAGN_ID: TStringField;
    oraAGNAGN_ABBR: TStringField;
    oraAGNAGN_NAME: TStringField;
    oraAGNAGN_POST: TStringField;
    oraAGNAGN_INN: TStringField;
    oraAGNAGN_KPP: TStringField;
    oraAGNAGN_PARUS_FACC: TStringField;
    oraAGNAGN_PARUS_AGNABBR: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grAGNSortMarkingChanged(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm1cParAgn: Tfrm1cParAgn;

implementation

uses main, ForDB;

{$R *.dfm}

procedure Tfrm1cParAgn.FormCreate(Sender: TObject);
begin
if oraLog.Execute then
 oraAGN.Open;
end;

procedure Tfrm1cParAgn.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
oraAGN.Close;
oraParus.Connected:=false;
action:=caFree;
end;

procedure Tfrm1cParAgn.grAGNSortMarkingChanged(Sender: TObject);
begin
  f_db.SortInGrid(oraagn,5,grAGN);
end;

end.
