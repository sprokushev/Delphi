unit month_all_row;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ActnList, XPStyleActnCtrls, ActnMan, Grids,
  DBGridEh, OracleData, Oracle, StdCtrls, Buttons, DBCtrls, ExtCtrls,
  TB2Item, TB2Dock, TB2Toolbar, MdiForm, dateutils;

type
  Tf_MonthAllRow = class(TForm)
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    oraSes: TOracleSession;
    dsMonthAllRow: TDataSource;
    grMonth: TDBGridEh;
    Panel2: TPanel;
    acManagerMonthAllRow: TActionManager;
    acRequestConsumerDelRow: TAction;
    oraProd: TOracleDataSet;
    oraPlat: TOracleDataSet;
    oraStan: TOracleDataSet;
    oraDog: TOracleDataSet;
    oraPayform: TOracleDataSet;
    oraVidOtgr: TOracleDataSet;
    oraVetka: TOracleDataSet;
    oraPotreb: TOracleDataSet;
    oraPoluch: TOracleDataSet;
    oraUslOpl: TOracleDataSet;
    oraOrgStru: TOracleDataSet;
    oraPlanStru: TOracleDataSet;
    oraStatusZakaz: TOracleDataSet;
    oraGU12_A: TOracleDataSet;
    oraMonthAllRow: TOracleDataSet;
    oraMonthAllRowID: TFloatField;
    oraMonthAllRowMONTH_ALL_ID: TFloatField;
    oraMonthAllRowSORTBY: TFloatField;
    oraMonthAllRowCLIENT_NUMBER: TStringField;
    oraMonthAllRowCLIENT_DATE: TDateTimeField;
    oraMonthAllRowINPUT_DATE: TDateTimeField;
    oraMonthAllRowINPUT_NUMBER: TStringField;
    oraMonthAllRowREQUEST: TFloatField;
    oraMonthAllRowKOL: TFloatField;
    oraMonthAllRowSPEED_VES: TFloatField;
    oraMonthAllRowSPEED_KOL: TFloatField;
    oraMonthAllRowKLS_PREDPR_ID: TFloatField;
    oraMonthAllRowKLS_DOG_ID: TFloatField;
    oraMonthAllRowDATE_DOG: TDateTimeField;
    oraMonthAllRowKLS_PROD_ID: TFloatField;
    oraMonthAllRowSTAN_ID: TFloatField;
    oraMonthAllRowPRICH: TStringField;
    oraMonthAllRowPAYFORM_ID: TFloatField;
    oraMonthAllRowLOAD_ABBR: TStringField;
    oraMonthAllRowVETKA_ID: TFloatField;
    oraMonthAllRowGR4: TStringField;
    oraMonthAllRowPOLUCH_ID: TFloatField;
    oraMonthAllRowPOTREB_ID: TFloatField;
    oraMonthAllRowUSL_OPL_ID: TFloatField;
    oraMonthAllRowORGSTRU_ID: TFloatField;
    oraMonthAllRowPRICE: TFloatField;
    oraMonthAllRowPOLUCH_NAME: TStringField;
    oraMonthAllRowPOTREB_NAME: TStringField;
    oraMonthAllRowKLS_PLANSTRUID: TFloatField;
    oraMonthAllRowNOM_ZD: TStringField;
    oraMonthAllRowSTATUS_ZAKAZ_ID: TFloatField;
    oraMonthAllRowGU12_A_ID: TFloatField;
    oraMonthAllRowSTAN_OLD_ID: TFloatField;
    oraMonthAllRowSTATUS_ZAKAZ_NAME: TStringField;
    oraMonthAllRowPLAT_NAME: TStringField;
    oraMonthAllRowDOG_NUMBER: TStringField;
    oraMonthAllRowPROD_NAME: TStringField;
    oraMonthAllRowSTAN_NAME: TStringField;
    oraMonthAllRowSTAN_OLD_NAME: TStringField;
    oraMonthAllRowPAYFORM_NAME: TStringField;
    oraMonthAllRowUSL_OPL_NAME: TStringField;
    oraMonthAllRowORGSTRU_NAME: TStringField;
    oraMonthAllRowPLANSTRU_NAME: TStringField;
    oraMonthAllRowPOLUCH_ID_NAME: TStringField;
    oraMonthAllRowPOTREB_ID_NAME: TStringField;
    oraMonthAllRowVETKA_NAME: TStringField;
    oraMonthAllRowVID_OTGR_NAME: TStringField;
    oraMonthAllRowGU12_A_NUM: TStringField;
    oraMonthAllRowBEGIN_DATE: TDateTimeField;
    procedure BitBtn1Click(Sender: TObject);
    procedure grMonthExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure acRequestConsumerDelRowExecute(Sender: TObject);
  private
    { Private declarations }
    vMONTH_ALL_ID:integer;
    vDATE_PLAN:TDateTime;
  public
    { Public declarations }
  end;

var
  f_MonthAllRow: Tf_MonthAllRow;
  gMONTH_ALL_ID:integer;
  gDATE_PLAN:TDateTime;

implementation

uses ForDB;

{$R *.dfm}

procedure Tf_MonthAllRow.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if oraMonthAllRow.State=dsEdit then oraMonthAllRow.Post;
  f_db.ReQuery(oraMonthAllRow,true);
end;

procedure Tf_MonthAllRow.grMonthExit(Sender: TObject);
begin
  inherited;
  if oraMonthAllRow.State=dsEdit then oraMonthAllRow.Post;
end;

procedure Tf_MonthAllRow.FormActivate(Sender: TObject);
begin
  vMONTH_ALL_ID:=gMONTH_ALL_ID;
  vDATE_PLAN:=gDATE_PLAN;
  f_db.LogonMasterSession(oraSes);
  f_db.ReQuery(oraStan,false);
  f_db.ReQuery(oraPlat,false);
  f_db.ReQuery(oraDog,false);
  f_db.ReQuery(oraStatusZakaz,false);
  f_db.ReQuery(oraUslOpl,false);
  f_db.ReQuery(oraPayform,false);
  f_db.ReQuery(oraVidOtgr,false);
  oraPlanStru.SetVariable('DATE_PLAN',StartOfTheMonth(gDATE_PLAN));
  f_db.ReQuery(oraPlanStru,false);
  f_db.ReQuery(oraGU12_A,false);
  f_db.ReQuery(oraOrgStru,false);
  f_db.ReQuery(oraVetka,false);
  f_db.ReQuery(oraPotreb,false);
  f_db.ReQuery(oraPoluch,false);
  f_db.ReQuery(oraProd,false);
  oraMonthAllRow.Close;
  oraMonthAllRow.SQL[34]:='WHERE MONTH_ALL_ID='+IntToStr(vMONTH_ALL_ID);
  oraMonthAllRow.Open;
end;

procedure Tf_MonthAllRow.acRequestConsumerDelRowExecute(Sender: TObject);
begin
  if Application.MessageBox('Удалить запись?','Внимание!',MB_YESNO)=IDYES then
  Begin
    oraMonthAllRow.Delete
  End;
end;

end.
