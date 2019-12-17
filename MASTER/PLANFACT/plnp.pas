unit plnp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, OracleData, RxLookup;

type
  Tf_plnp = class(TForm)
    Label2: TLabel;
    lc_Plans: TRxDBLookupCombo;
    q_Plans: TOracleDataSet;
    ds_Plans: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    q_PlansPLAN_TYP_ID: TFloatField;
    q_PlansPLAN_TYP_NAME: TStringField;
    q_PlansFROM_DATE: TDateTimeField;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DatePlan: TDateTime;
    EndDate:TDateTime;
    PlanTypId: integer;
    FromDate: TDateTime;
  end;

var
  f_plnp: Tf_plnp;

implementation

uses main;

{$R *.dfm}

procedure Tf_plnp.FormActivate(Sender: TObject);
begin
  q_Plans.Session:=f_main.ora_Session;
  q_Plans.SQL[3]:='  TO_DATE('''+FormatDateTime('dd.mm.yyyy',DatePlan)+''',''dd.mm.yyyy'') as FROM_DATE';
  q_Plans.SQL[16]:='WHERE A.DATE_PLAN=TO_DATE('''+FormatDateTime('dd.mm.yyyy',DatePlan)+''',''dd.mm.yyyy'')';
  q_Plans.SQL[17]:='  AND A.BEGIN_DATE<=TO_DATE('''+FormatDateTime('dd.mm.yyyy',EndDate)+''',''dd.mm.yyyy'')';
  q_Plans.Open;
  if not q_plans.Eof then lc_Plans.KeyValue:=q_plans.FieldByName('PLAN_TYP_ID').AsInteger;
end;

procedure Tf_plnp.BitBtn2Click(Sender: TObject);
begin
  PlanTypId:=-1;
end;

procedure Tf_plnp.BitBtn1Click(Sender: TObject);
begin
  if not q_plans.eof then
  Begin
    PlanTypId:=lc_Plans.KeyValue;
    FromDate:=q_plans.FieldByName('FROM_DATE').AsDateTime;
  end
  else
    PlanTypId:=-1;

end;

end.
