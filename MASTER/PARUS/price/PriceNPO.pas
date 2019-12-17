unit PriceNPO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MdiForm, StdCtrls, Buttons, XPStyleActnCtrls, ActnList, ActnMan,
  OracleData, Oracle, Mask, ToolEdit, Grids, DBGridEh, ExtCtrls,DateUtils;

type
  TfrmPrice = class(Tf_MDIForm)
    Panel1: TPanel;
    Panel2: TPanel;
    dbgMonth: TDBGridEh;
    edDate: TDateEdit;
    oraMonth: TOracleDataSet;
    dsMonth: TDataSource;
    ActionManager1: TActionManager;
    BitBtn1: TBitBtn;
    oraMonthSHORT_NAME: TStringField;
    oraMonthNOM_ZD: TStringField;
    oraMonthCENA_NPO: TFloatField;
    oraMonthCENA_OTP_NPO: TFloatField;
    Label1: TLabel;
    rbAll: TRadioButton;
    rbNoPrice: TRadioButton;
    acFilter: TAction;
    rbWPrice: TRadioButton;
    oraMonthDOG_NUMBER: TStringField;
    pckBILLS: TOraclePackage;
    procedure acFilterExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure edDateChange(Sender: TObject);
    procedure dbgMonthSortMarkingChanged(Sender: TObject);
    procedure oraMonthCENA_NPOChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrice: TfrmPrice;

implementation

uses main;

{$R *.dfm}

procedure TfrmPrice.acFilterExecute(Sender: TObject);
begin
  oraMonth.Close;
  oraMonth.SQL[4]:='and m.date_plan=TO_DATE('''+FormatDateTime('dd.mm.yyyy',edDate.Date)+''',''dd.mm.yyyy'')';
  if rbAll.checked then
     oraMonth.SQL[5]:='';
  if rbNoPrice.checked then
     oraMonth.SQL[5]:='and m.cena_npo=0';
  if rbWPrice.checked then
     oraMonth.SQL[5]:='and m.cena_npo>0';
  oraMonth.open;
end;


procedure TfrmPrice.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TfrmPrice.FormCreate(Sender: TObject);
begin
edDate.Date:=Date-dayOf(Date)+1;
oraMonth.Open;
end;

procedure TfrmPrice.edDateChange(Sender: TObject);
begin
edDate.Date:=edDate.Date-dayOf(edDate.Date)+1;
end;

procedure TfrmPrice.dbgMonthSortMarkingChanged(Sender: TObject);
var i :Integer;
    s:String;
begin
  s := '';
  for i := 0 to dbgMonth.SortMarkedColumns.Count-1 do
   if dbgMonth.SortMarkedColumns[i].Title.SortMarker = smUpEh then
     s := s + dbgMonth.SortMarkedColumns[i].FieldName + ' DESC , '
   else
     s := s + dbgMonth.SortMarkedColumns[i].FieldName + ', ';
  if s <> '' then s := 'ORDER BY ' + Copy(s,1,Length(s)-2);
  oraMonth.SQL[6]:= s;
  oraMonth.Close;
  oraMonth.Open;
end;


procedure TfrmPrice.oraMonthCENA_NPOChange(Sender: TField);
var NDSValue:double;
begin
  NDSValue:=pckBILLS.CallFloatFunction('GetNDSValueSTR',[FormatDateTime('dd.mm.yyyy',edDate.Date)]);
  oraMonth.FieldByName('cena_otp_npo').AsFloat:=oraMonth.FieldByName('cena_npo').AsFloat*(100+NDSValue)/100;
end;

end.
