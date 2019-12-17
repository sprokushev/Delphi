unit GDPLan4Anton;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TB2Dock, Grids, DBGridEh, DB, OracleData, Oracle, StdCtrls,
  Mask, DBCtrlsEh, TB2ToolWindow, ComCtrls, TB2Item, TB2Toolbar;

type
  Tf_GDPLan4Anton = class(TForm)
    ora_Session: TOracleSession;
    t_GD_Plan: TOracleDataSet;
    ds_GD_Plan: TDataSource;
    DBGridEh1: TDBGridEh;
    TBDock1: TTBDock;
    t_Plat: TOracleDataSet;
    t_GD_PlanSTAN_ID: TFloatField;
    t_GD_PlanPROD_NPR_ID: TStringField;
    t_GD_PlanVES: TFloatField;
    t_GD_PlanTARIF: TFloatField;
    t_GD_PlanPLAT_ID: TFloatField;
    t_GD_PlanDATE_PLAN: TDateTimeField;
    t_PlatID: TIntegerField;
    t_PlatSHORT_NAME: TStringField;
    t_GD_PlanPlat_Name: TStringField;
    t_Stan: TOracleDataSet;
    t_StanID: TFloatField;
    t_StanSTAN_NAME: TStringField;
    t_GD_PlanStan_name: TStringField;
    t_prod: TOracleDataSet;
    t_prodID: TFloatField;
    t_prodNAME_NPR: TStringField;
    t_GD_PlanName_npr: TStringField;
    TBToolWindow1: TTBToolWindow;
    Label1: TLabel;
    e_DatePlan: TDateTimePicker;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    SaveDialog1: TSaveDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure t_GD_PlanBeforeOpen(DataSet: TDataSet);
    procedure t_GD_PlanBeforePost(DataSet: TDataSet);
    procedure e_DatePlanChange(Sender: TObject);
    procedure e_DatePlanCloseUp(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure TBItem1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_GDPLan4Anton: Tf_GDPLan4Anton;

implementation

uses ForDB, DateUtils,DBGridEhImpExp,RxShell;

{$R *.dfm}

procedure Tf_GDPLan4Anton.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
  ora_Session.LogOff;
end;

procedure Tf_GDPLan4Anton.FormCreate(Sender: TObject);
begin
  e_DatePLan.Date:=date-DayOf(Date)+1;
  f_db.LogonMasterSession(ora_Session);
  t_Plat.Open;
  t_prod.Open;
  t_Stan.Open;
  t_GD_Plan.Open;
end;

procedure Tf_GDPLan4Anton.t_GD_PlanBeforeOpen(DataSet: TDataSet);
begin
  t_GD_Plan.SQL[1]:='WHERE date_plan=TO_DATE(''01.'+FormatDateTime('mm.yyyy',e_DatePLan.Date)+''',''dd.mm.yyyy'')';
end;

procedure Tf_GDPLan4Anton.t_GD_PlanBeforePost(DataSet: TDataSet);
begin
  t_GD_PlanDATE_PLAN.Value:=e_DatePLan.Date-DayOf(e_DatePLan.Date)+1;
end;

procedure Tf_GDPLan4Anton.e_DatePlanChange(Sender: TObject);
begin
  e_DatePlan.Date:=e_DatePlan.Date-DayOf(e_DatePlan.Date)+1;
  f_db.ReQuery(t_GD_Plan,False);
end;

procedure Tf_GDPLan4Anton.e_DatePlanCloseUp(Sender: TObject);
begin
  e_DatePlan.Date:=e_DatePlan.Date-DayOf(e_DatePlan.Date)+1;
end;

procedure Tf_GDPLan4Anton.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if t_GD_Plan.RecNo mod 2=0 then
    Background:=clInfoBk;
end;

procedure Tf_GDPLan4Anton.TBItem1Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    if not FileExists(SaveDialog1.FileName) then
      begin
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,DBGridEh1,SaveDialog1.FileName,True);
        FileExecute(SaveDialog1.FileName,'','',esMaximized);
      end
    else
      if MessageDlg('Файл уже существует! Переписать?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,DBGridEh1,SaveDialog1.FileName,True);
          FileExecute(SaveDialog1.FileName,'','',esMaximized);
        end
end;

end.
