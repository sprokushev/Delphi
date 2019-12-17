unit AddPlnPer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, RxLookup, ComCtrls, Mask, DB, OracleData,
  Oracle,DateUtils;

type
  TF_AddPlanPer = class(TForm)
    Label1: TLabel;
    e_year: TMaskEdit;
    Label2: TLabel;
    e_month: TComboBox;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    e_BegDate: TDateTimePicker;
    Label5: TLabel;
    e_EndDate: TDateTimePicker;
    lc_Plan: TRxDBLookupCombo;
    Label6: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    q_Plan: TOracleDataSet;
    ds_Plan: TDataSource;
    q_Tmp: TOracleDataSet;
    ud_year: TUpDown;
    ora_Package: TOraclePackage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    IsAdd:boolean;
    PlanId:integer;
    PlanPerId:integer;
    PlanDate:TDateTime;
    PlanYear:integer;
    PlanMon:integer;
    BegDate:TDateTime;
    EndDate:TDateTime;
  end;

var
  F_AddPlanPer: TF_AddPlanPer;

implementation

uses main;

{$R *.dfm}

procedure TF_AddPlanPer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  q_Plan.Close;
  q_Tmp.Close;
  q_Tmp.SQL.Clear;
end;

procedure TF_AddPlanPer.FormShow(Sender: TObject);
begin
  If IsAdd Then
    Caption:='Добавление планового периода'
  Else
    Caption:='Редактирование планового периода';

  q_Plan.Open;
  q_Plan.Locate('ID',PlanId,[]);
  lc_Plan.KeyValue:=q_Plan.FieldByName('ID').AsInteger;

  If NOT IsAdd Then
  Begin
    PlanYear:=YearOf(PlanDate);
    PlanMon:=MonthOf(PlanDate);
    ud_year.Position:=PlanYear;
    e_month.ItemIndex:=PlanMon-1;
    e_BegDate.Date:=BegDate;
    e_EndDate.Date:=EndDate;
  End
  Else
  Begin
    with q_tmp do
    try
      Close;
      SQL.Clear;
      SQL.Add('SELECT MAX(END_DATE) as END_DATE FROM PLAN_PERIODS WHERE PLAN_ID='+IntToStr(PlanId));
      Open;
      BegDate:=FieldValues['END_DATE']+1;
      Close;
    except
      BegDate:=StartOfTheMonth(Now);
    end;
    PlanDate:=BegDate-DayOfTheMonth(BegDate)+1;
    EndDate:=EndOfTheMonth(PlanDate);
    PlanYear:=YearOf(PlanDate);
    PlanMon:=MonthOf(PlanDate);
    ud_year.Position:=PlanYear;
    e_month.ItemIndex:=PlanMon-1;
    e_BegDate.Date:=BegDate;
    e_EndDate.Date:=EndDate;
  End;
end;

procedure TF_AddPlanPer.BitBtn1Click(Sender: TObject);
begin
  PlanId:=lc_Plan.KeyValue;
  PlanYear:=ud_year.Position;
  PlanMon:=e_month.ItemIndex+1;
  PlanDate:=StartOfAMonth(PlanYear,PlanMon);
  BegDate:=e_BegDate.Date;
  EndDate:=e_EndDate.Date;

  If IsAdd Then
    with ora_Package do
    try
      PlanPerId := CallIntegerFunction('NewPeriod', [PlanId, PlanDate, BegDate, EndDate]);
      ModalResult:=mrOk;
    except
      on E:EOracleError do
      Begin
        ShowMessage(E.Message);
        PlanPerId:=0;
      End;
    end
  Else
    with ora_Package do
    try
      CallProcedure('ChangePeriod', [PlanPerId, PlanDate, BegDate, EndDate]);
      ModalResult:=mrOk;
    except
      on E:EOracleError do ShowMessage(E.Message);
    end
end;

end.
