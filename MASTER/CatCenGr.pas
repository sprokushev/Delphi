unit CatCenGr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, DB, OracleData, Oracle, TB2Item, ActnList,
  ActnMan, TB2Dock, TB2Toolbar, XPStyleActnCtrls;

type
  Tf_CatCenGroup = class(TForm)
    q_CatCenGroup: TOracleDataSet;
    ds_CatCenGroup: TDataSource;
    DBGridEh1: TDBGridEh;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    ActionManager1: TActionManager;
    acCatCenGroupToDBF: TAction;
    TBItem1: TTBItem;
    q_CatCenGroupID: TIntegerField;
    q_CatCenGroupCAT_CEN_GROUP_NAME: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acCatCenGroupToDBFExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_CatCenGroup: Tf_CatCenGroup;

implementation

uses ForDB,OraToDBF, main;

{$R *.dfm}

procedure Tf_CatCenGroup.FormCreate(Sender: TObject);
begin
  q_CatCenGroup.Session:=f_main.ora_Session;
  q_CatCenGroup.Open;
  f_db.SetUserGrants(ActionManager1);
end;

procedure Tf_CatCenGroup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  q_CatCenGroup.Close;
  Action:=caFree;
end;

procedure Tf_CatCenGroup.acCatCenGroupToDBFExecute(Sender: TObject);
begin
  with tf_ORAToDBF.Create(Self) do
    begin
      DBFtoORAid:='CAT_CEN_GROUP';
      DontAsk:=False;
      ShowModal;
    end;
end;

end.
