unit DeliveryOrdersWithPlanPos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MdiForm, ExtCtrls, ComCtrls, vgCtrls, vgDBTree, DB, OracleData,
  Oracle, XPStyleActnCtrls, ActnList, ActnMan, TB2Item, TB2Dock, TB2Toolbar,
  Grids, DBGridEh, StdCtrls;

type
  Tf_DeliveryOrdersWithPlanPos = class(Tf_MDIForm)
    Panel1: TPanel;
    Panel2: TPanel;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem2: TTBItem;
    TBItem1: TTBItem;
    ActionManager1: TActionManager;
    ParusLogon: TOracleLogon;
    ora_Parus: TOracleSession;
    oraDeliveryOrders: TOracleDataSet;
    dsDeliveryOrders: TDataSource;
    tvCatalog: TvgDBTreeView;
    Splitter1: TSplitter;
    oraDeliveryOrdersNRN: TFloatField;
    oraDeliveryOrdersNCRN: TFloatField;
    oraDeliveryOrdersSNAME: TStringField;
    Label1: TLabel;
    edDateFrom: TDateTimePicker;
    Label2: TLabel;
    edDateTo: TDateTimePicker;
    oraDeliveryOrdersPLANSTRU_ID: TFloatField;
    DBGridEh1: TDBGridEh;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    ExecuteParusProc: boolean;
  public
    { Public declarations }
  end;

var
  f_DeliveryOrdersWithPlanPos: Tf_DeliveryOrdersWithPlanPos;

implementation

uses main;

{$R *.dfm}

procedure Tf_DeliveryOrdersWithPlanPos.FormShow(Sender: TObject);

begin
  inherited;
  { Logon к Parus'у }
  ExecuteParusProc := ParusLogon.Execute;
  if not ExecuteParusProc then
  begin
    MessageDlg('Введите правильно имя пользователя ПАРУС и пароль!',mtError,[mbOk],0);
    exit;
  end;
  oraDeliveryOrders.Open;
  tvCatalog.FullExpand;
end;

procedure Tf_DeliveryOrdersWithPlanPos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ora_parus.LogOff;
  Action:=caFree;
end;

end.
