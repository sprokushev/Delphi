unit SutReeList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, Grids, DBGridEh,MDIForm, ActnList,
  ActnMan, TB2Item, TB2Dock, TB2Toolbar, XPStyleActnCtrls;

type
  Tf_SutReeList = class(Tf_MDIForm)
    q_SutReeList: TOracleDataSet;
    ds_SutReeList: TDataSource;
    gridSutReeList: TDBGridEh;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    ActionManager1: TActionManager;
    acSutReeEdit: TAction;
    acSutReeNew: TAction;
    TBItem2: TTBItem;
    q_SutReeListNUM_REE: TFloatField;
    q_SutReeListDATE_REE: TDateTimeField;
    q_SutReeListDOP_REE: TFloatField;
    q_SutReeListID: TFloatField;
    q_SutReeListSTATUS_NAME: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acSutReeEditExecute(Sender: TObject);
    procedure acSutReeNewExecute(Sender: TObject);
    procedure gridSutReeListSortMarkingChanged(Sender: TObject);
    procedure gridSutReeListDblClick(Sender: TObject);
    procedure gridSutReeListGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
  private
    { Private declarations }
    vReportId:integer;
  public
    { Public declarations }
  end;

var
  f_SutReeList: Tf_SutReeList;
  gReportId:integer;

implementation

uses ForReport, ForDB, main, SutRee;

{$R *.dfm}

procedure Tf_SutReeList.FormCreate(Sender: TObject);
begin
  vReportId:=gReportId;
  q_SutReeList.session:=f_main.ora_Session;
  q_SutReeList.Open;
end;

procedure Tf_SutReeList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  q_SutReeList.Close;
  Action:=caFree;
end;

procedure Tf_SutReeList.acSutReeEditExecute(Sender: TObject);
begin
  with TF_SutRee.Create(f_main) do
    begin
      ReestrId:=q_SutReeList.FieldByName('ID').AsInteger;
      ReportId:=vReportId;
      ShowModal;
      f_db.ReQuery(q_SutReeList,true);
    end
end;

procedure Tf_SutReeList.acSutReeNewExecute(Sender: TObject);
begin
  with TF_SutRee.Create(f_main) do
    begin
      ReestrId:=0;
      ReportId:=vReportId;
      ShowModal;
      f_db.ReQuery(q_SutReeList,true);
    end
end;

procedure Tf_SutReeList.gridSutReeListSortMarkingChanged(Sender: TObject);
begin
  inherited;
  f_db.SortInGrid(q_SutReeList,q_SutReeList.SQL.Count-1,gridSutReeList);
end;

procedure Tf_SutReeList.gridSutReeListDblClick(Sender: TObject);
begin
  inherited;
  acSutReeEdit.Execute;
end;

procedure Tf_SutReeList.gridSutReeListGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if q_SutReeList.RecNo mod 2=0 then
    Background:=clInfoBk;
  if gdSelected in State then
    Background:=clNavy;
end;

end.
