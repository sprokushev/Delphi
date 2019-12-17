unit Reports;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls, TB2Item, TB2Dock, TB2Toolbar,
  ComCtrls, ActnList, XPStyleActnCtrls, ActnMan, DB, OracleData, MDIForm,
  DBCtrls, StdCtrls;

type
  Tf_Reports = class(Tf_MDIForm)
    ActionManager1: TActionManager;
    acReportAdd: TAction;
    acRepTipDatesRefresh: TAction;
    acRepParamEdit: TAction;
    acRepParamDel: TAction;
    PageControl1: TPageControl;
    tabReports: TTabSheet;
    tabGroups: TTabSheet;
    tabReportParams: TTabSheet;
    tabTags: TTabSheet;
    tabTipDates: TTabSheet;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem2: TTBItem;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    TBDock2: TTBDock;
    TBToolbar2: TTBToolbar;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    TBDock3: TTBDock;
    TBToolbar3: TTBToolbar;
    TBItem9: TTBItem;
    TBItem10: TTBItem;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    TBDock4: TTBDock;
    TBToolbar4: TTBToolbar;
    TBItem16: TTBItem;
    TBDock5: TTBDock;
    TBToolbar5: TTBToolbar;
    TBItem20: TTBItem;
    Panel3: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    acRepParamAdd: TAction;
    acRepGrpRefresh: TAction;
    acReportRefresh: TAction;
    acRepParamRefresh: TAction;
    acRepTagsRefresh: TAction;
    acReportEdit: TAction;
    acReportDel: TAction;
    DBGridEh3: TDBGridEh;
    DBGridEh4: TDBGridEh;
    DBGridEh5: TDBGridEh;
    q_RepGrp: TOracleDataSet;
    acRepGrpPost: TAction;
    TBItem1: TTBItem;
    q_RepGrpID: TFloatField;
    q_RepGrpREPORT_GROUP: TStringField;
    q_RepGrpREPORT_GROUP_NAME: TStringField;
    q_RepGrpSORTBY: TIntegerField;
    q_RepGrpREP_KIND: TStringField;
    q_RepGrpVIEW_TAB: TStringField;
    ds_RepGrp: TDataSource;
    DBGridEh2: TDBGridEh;
    q_Reports: TOracleDataSet;
    ds_Reports: TDataSource;
    q_ReportsID: TFloatField;
    q_ReportsREPORT_NAME: TStringField;
    q_ReportsREPORT_FILE: TStringField;
    q_ReportsREPORT_GROUP: TStringField;
    q_ReportsSORTBY: TIntegerField;
    q_ReportsPARAM1: TStringField;
    q_ReportsREPORT_TITLE: TStringField;
    q_ReportsIS_MSSQL: TIntegerField;
    q_ReportsIS_VIP: TIntegerField;
    q_ReportsCOPY_FILE: TStringField;
    q_ReportsREPORT_TYPE: TStringField;
    q_ReportsDIAGRAM_TYPE: TStringField;
    q_ReportsDIAGRAM_KIND: TStringField;
    q_ReportsAXES_X_NAME: TStringField;
    q_ReportsCOUNT_COLS_X: TIntegerField;
    q_ReportsAXES_Y_NAME: TStringField;
    q_ReportsCOUNT_COLS_Y: TIntegerField;
    q_ReportsPROC_PACKET: TStringField;
    q_ReportsPROC_NAME: TStringField;
    q_ReportsDEF_BEG_VAL: TStringField;
    q_ReportsDEF_END_VAL: TStringField;
    q_ReportsDEF_BEG_TIME: TStringField;
    q_ReportsDEF_END_TIME: TStringField;
    q_ReportsVIEW_TIME: TIntegerField;
    q_ReportsTIP_DATE: TStringField;
    q_ReportsPARUS_PROC: TStringField;
    acReportPost: TAction;
    TBItem3: TTBItem;
    Panel1: TPanel;
    Label1: TLabel;
    DBText1: TDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acRepGrpPostExecute(Sender: TObject);
    procedure acRepGrpRefreshExecute(Sender: TObject);
    procedure acReportRefreshExecute(Sender: TObject);
    procedure acReportPostExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_Reports: Tf_Reports;

implementation

uses ForDB, main;

{$R *.dfm}

procedure Tf_Reports.FormCreate(Sender: TObject);
begin
  q_RepGrp.Session:=f_main.ora_Session;
  q_RepGrp.Open;
  q_Reports.Session:=f_main.ora_Session;
  q_Reports.Open;
end;

procedure Tf_Reports.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  
  Action:=caFree;
end;

procedure Tf_Reports.acRepGrpPostExecute(Sender: TObject);
begin
  if q_RepGrp.State=dsEdit then q_RepGrp.Post;
end;

procedure Tf_Reports.acRepGrpRefreshExecute(Sender: TObject);
begin
  acRepGrpPostExecute(Sender);
  f_db.Requery(q_RepGrp,true);
end;

procedure Tf_Reports.acReportRefreshExecute(Sender: TObject);
begin
  acReportPostExecute(Sender);
  f_db.Requery(q_RepGrp,true);
end;

procedure Tf_Reports.acReportPostExecute(Sender: TObject);
begin
  if q_Reports.State=dsEdit then q_Reports.Post;
end;

end.
