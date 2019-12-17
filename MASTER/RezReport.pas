unit RezReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, Grids, DBGridEh,MDIForm, ActnList,
  ActnMan, TB2Item, TB2Dock, TB2Toolbar, XPStyleActnCtrls;

type
  Tf_RezReport = class(TF_MDIForm)
    t_ArcRez: TOracleDataSet;
    ds_ArcRez: TDataSource;
    DBGridEh1: TDBGridEh;
    t_ArcRezDATEUPLOAD: TDateTimeField;
    t_ArcRezDISP_NAME: TStringField;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    ActionManager1: TActionManager;
    acRezReportShort: TAction;
    acRezReportLong: TAction;
    TBItem2: TTBItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acRezReportShortExecute(Sender: TObject);
    procedure acRezReportLongExecute(Sender: TObject);
    procedure DBGridEh1SortMarkingChanged(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_RezReport: Tf_RezReport;

implementation

uses ForReport, ForDB, main, ForFiles;

{$R *.dfm}

procedure Tf_RezReport.FormCreate(Sender: TObject);
begin
  t_arcrez.session:=f_main.ora_Session;
//  f_main.SetUserGrants(ActionManager1);
  t_ArcRez.Open;
end;

procedure Tf_RezReport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  t_ArcRez.Close;
  Action:=caFree;
end;

procedure Tf_RezReport.acRezReportShortExecute(Sender: TObject);
begin
  with TF_ForReport.Create(f_main) do
    begin
      Caption:='—жатый отчет по резервуарам за '+t_ArcRezDATEUPLOAD.AsString;
      Crpe.ReportName:=F_FileUtils.CheckReport('RezReportShort.rpt',f_main.TempNetPath);
//      Crpe.ParamFields.Retrieve;
      Crpe.ParamFields[0].CurrentValue :=t_ArcRezDATEUPLOAD.AsString;
      Crpe.ParamFields[1].CurrentValue :=' ';
      {Run the Report}
      Crpe.Execute;
    end;
end;

procedure Tf_RezReport.acRezReportLongExecute(Sender: TObject);
begin
  with TF_ForReport.Create(f_main) do
    begin
      Caption:='—жатый отчет по резервуарам за '+t_ArcRezDATEUPLOAD.AsString;
      Crpe.ReportName:=F_FileUtils.CheckReport('RezReportLong.rpt',f_main.TempNetPath);
//      Crpe.ParamFields.Retrieve;
      Crpe.ParamFields[0].CurrentValue :=t_ArcRezDATEUPLOAD.AsString;
      Crpe.ParamFields[1].CurrentValue :=' ';
      {Run the Report}
      Crpe.Execute;
    end
end;

procedure Tf_RezReport.DBGridEh1SortMarkingChanged(Sender: TObject);
begin
  inherited;
  f_db.SortInGrid(t_ArcRez,4,DBGridEh1);
end;

procedure Tf_RezReport.DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
  acRezReportShort.Execute;
end;

procedure Tf_RezReport.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if t_ArcRez.RecNo mod 2=0 then
    Background:=clInfoBk;
  if gdSelected in State then
    Background:=clNavy;
end;

end.
