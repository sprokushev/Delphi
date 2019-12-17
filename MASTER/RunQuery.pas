unit RunQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, XPStyleActnCtrls, ActnMan, TB2Item, Menus, DB,
  OracleData, Grids, DBGridEh, PrnDbgeh,DBGridEhImpExp;

type
  Tf_Query = class(TForm)
    gridQuery: TDBGridEh;
    tQuery: TOracleDataSet;
    dsQuery: TDataSource;
    TBPopupMenu1: TTBPopupMenu;
    TBItem2: TTBItem;
    TBItem1: TTBItem;
    TBItem4: TTBItem;
    TBItem9: TTBItem;
    ActionManager1: TActionManager;
    acPrintQuery: TAction;
    acCopyQuery: TAction;
    acQueryInXLS: TAction;
    acQueryInRtf: TAction;
    printQuery: TPrintDBGridEh;
    procedure acCopyQueryExecute(Sender: TObject);
    procedure acPrintQueryExecute(Sender: TObject);
    procedure acQueryInXLSExecute(Sender: TObject);
    procedure acQueryInRtfExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    querySQL:string;
    queryDescription:string;
  end;

var
  f_Query: Tf_Query;
  AFormStyle:TFormStyle;

implementation

uses main;

{$R *.dfm}

procedure Tf_Query.acCopyQueryExecute(Sender: TObject);
begin
  DBGridEh_DoCopyAction(gridQuery,False);
end;

procedure Tf_Query.acPrintQueryExecute(Sender: TObject);
begin
  printQuery.PageHeader.CenterText.Clear;
  printQuery.PageHeader.CenterText.Add(queryDescription);
  printQuery.Preview;
end;

procedure Tf_Query.acQueryInXLSExecute(Sender: TObject);
begin
  SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,gridQuery,f_main.TempLocalPath+'Query.xls',False);
  ShowMessage('Сформирован файл '+f_main.TempLocalPath+'Query.xls');
end;

procedure Tf_Query.acQueryInRtfExecute(Sender: TObject);
begin
  SaveDBGridEhToExportFile(TDBGridEhExportAsRTF,gridQuery,f_main.TempLocalPath+'Query.rtf',False);
  ShowMessage('Сформирован файл '+f_main.TempLocalPath+'Query.rtf');
end;

procedure Tf_Query.FormShow(Sender: TObject);
begin
  Caption:=queryDescription;
  tQuery.Session:=f_main.ora_Session;
  tQuery.SQL.Add(querySQL);
  tQuery.Open;
end;

procedure Tf_Query.FormCreate(Sender: TObject);
begin
  if AFormStyle=fsNormal then FormStyle:=fsNormal
    else FormStyle:=fsMDIForm;
end;

procedure Tf_Query.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tQuery.Close;
  tQuery.SQL.Clear;

  if FormStyle=fsMDIChild
    then Action:=caFree;
end;

end.
