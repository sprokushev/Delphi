unit LoadFilList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MdiForm, DB, OracleData, Grids, DBGridEh, ExtCtrls, ActnList,
  XPStyleActnCtrls, ActnMan, TB2Item, TB2Dock, TB2Toolbar;

type
  Tf_LoadFilList = class(Tf_MDIForm)
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    ActionManager1: TActionManager;
    acLF_Load: TAction;
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    q_FilPeriods: TOracleDataSet;
    ds_FilPeriods: TDataSource;
    q_FilPeriodsID: TFloatField;
    q_FilPeriodsORG_STRU_ID: TFloatField;
    q_FilPeriodsDATE_REPORT: TDateTimeField;
    q_FilPeriodsFILENAME: TStringField;
    q_FilPeriodsDATE_LOAD: TDateTimeField;
    q_FilPeriodsUSER_LOAD: TStringField;
    q_FilPeriodsFILIAL_NAME: TStringField;
    q_FilPeriodsREP_TYPE_ID: TFloatField;
    q_FilPeriodsREP_TYPE_NAME: TStringField;
    q_FilPeriodsMON_REPORT: TStringField;
    acLF_View: TAction;
    q_FilPeriodsSTATUS: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DBGridEh1SortMarkingChanged(Sender: TObject);
    procedure acLF_LoadExecute(Sender: TObject);
    procedure acLF_ViewExecute(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_LoadFilList: Tf_LoadFilList;

implementation

uses ForDB, LoadFil, main;

{$R *.dfm}

procedure Tf_LoadFilList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  q_FilPeriods.Close;
  Action:=caFree;
end;

procedure Tf_LoadFilList.FormCreate(Sender: TObject);
begin
  inherited;
  q_FilPeriods.Session:=f_main.ora_Session;
  q_FilPeriods.Open;
end;

procedure Tf_LoadFilList.DBGridEh1SortMarkingChanged(Sender: TObject);
begin
  inherited;
  f_db.SortInGrid(q_FilPeriods,5,DBGridEh1);
end;

procedure Tf_LoadFilList.acLF_LoadExecute(Sender: TObject);
begin
  inherited;
  with TF_LoadFil.Create(Self) do
  begin
    PeriodId:=0;
    if ShowModal=mrOk then
    Begin
      Free;
    end;
    f_db.ReQuery(q_FilPeriods,True);
  End;
end;

procedure Tf_LoadFilList.acLF_ViewExecute(Sender: TObject);
begin
  inherited;
  with TF_LoadFil.Create(Self) do
  begin
    if q_FilPeriods.Eof then PeriodId:=0
    Else PeriodId:=q_FilPeriods.FieldByName('ID').AsInteger;
    if ShowModal=mrOk then
    Begin
      Free;
    end;
    f_db.ReQuery(q_FilPeriods,True);
  End;
end;

procedure Tf_LoadFilList.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if q_FilPeriods.FieldByName('STATUS').AsInteger=2 then
    Background:=clSkyBlue;
  if q_FilPeriods.FieldByName('STATUS').AsInteger=1 then
    Background:=clInfoBk;
  if gdSelected in State then
    Background:=clNavy;
end;

end.
