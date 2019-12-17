unit nmonth_all;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, RxLookup, StdCtrls, ComCtrls, Mask,
  ToolEdit, CurrEdit, ActnList, Buttons, XPStyleActnCtrls, ActnMan,dateUtils,MdiForm,
  Placemnt, RXCtrls;

type
  Tfrm_MonthNew = class(TForm)
    cbPredpr: TRxDBLookupCombo;
    oraTSes: TOracleSession;
    oraKls_predpr: TOracleDataSet;
    dsPredpr: TDataSource;
    cbDog: TRxDBLookupCombo;
    oraKls_dog: TOracleDataSet;
    dsDog: TDataSource;
    cbProd: TRxDBLookupCombo;
    oraKls_prod: TOracleDataSet;
    dsProd: TDataSource;
    cbStan: TRxDBLookupCombo;
    oraKls_stan: TOracleDataSet;
    dsStan: TDataSource;
    oraQIns: TOracleQuery;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edReq: TRxCalcEdit;
    ActionManager1: TActionManager;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    acSave: TAction;
    acExit: TAction;
    Label7: TLabel;
    edNum: TEdit;
    Label8: TLabel;
    cbPayForm: TRxDBLookupCombo;
    Label9: TLabel;
    cbVetka: TRxDBLookupCombo;
    Label10: TLabel;
    cbPoluch: TRxDBLookupCombo;
    Label11: TLabel;
    cbPotreb: TRxDBLookupCombo;
    Label12: TLabel;
    cbVidOtgr: TRxDBLookupCombo;
    oraPayform: TOracleDataSet;
    dsPayform: TDataSource;
    oraVidOtgr: TOracleDataSet;
    dsVidOtgr: TDataSource;
    oraVetka: TOracleDataSet;
    dsVetka: TDataSource;
    oraPotreb: TOracleDataSet;
    dsPotreb: TDataSource;
    oraPoluch: TOracleDataSet;
    dsPoluch: TDataSource;
    Label13: TLabel;
    cbUslOpl: TRxDBLookupCombo;
    oraUslOpl: TOracleDataSet;
    dsUslOpl: TDataSource;
    oraOrg_Stru: TOracleDataSet;
    dsOrg_Stru: TDataSource;
    Label14: TLabel;
    cbOrgstru: TRxDBLookupCombo;
    Label15: TLabel;
    edPrice: TRxCalcEdit;
    Label16: TLabel;
    edPoluch: TEdit;
    edPotreb: TEdit;
    Label17: TLabel;
    edDatePlan: TDateTimePicker;
    oraQUpd: TOracleQuery;
    edDat: TDateTimePicker;
    acSeekPoluch: TAction;
    sbPoluch: TRxSpeedButton;
    acSeekPotreb: TAction;
    sbPotreb: TRxSpeedButton;
    Label18: TLabel;
    cbPlanStru: TRxDBLookupCombo;
    oraPlanStru: TOracleDataSet;
    dsPlanstru: TDataSource;
    Label19: TLabel;
    edClientNum: TEdit;
    Label20: TLabel;
    q_status_zakaz: TOracleDataSet;
    cbStatusZakaz: TRxDBLookupCombo;
    ds_status_zakaz: TDataSource;
    edClientDat: TDateTimePicker;
    edKol: TRxCalcEdit;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    edSpeedVes: TRxCalcEdit;
    Label25: TLabel;
    edSpeedKol: TRxCalcEdit;
    Label26: TLabel;
    oraQInsRow: TOracleQuery;
    Label27: TLabel;
    edPrich: TEdit;
    edGR4: TEdit;
    Label28: TLabel;
    oraPlanStruID: TFloatField;
    oraPlanStruNAME: TStringField;
    oraPlanStruREGION_ID: TFloatField;
    edBeginDate: TDateTimePicker;
    Label29: TLabel;
    ed_StanKod: TEdit;
    oraQUpdVes: TOracleQuery;
    procedure acSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acExitExecute(Sender: TObject);
    procedure cbDogChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure acSeekPoluchExecute(Sender: TObject);
    procedure acSeekPotrebExecute(Sender: TObject);
    procedure cbPlanStruChange(Sender: TObject);
    procedure edDatePlanChange(Sender: TObject);
    procedure edReqChange(Sender: TObject);
    procedure edSpeedVesChange(Sender: TObject);
    procedure ed_StanKodChange(Sender: TObject);
    procedure cbStanChange(Sender: TObject);
  private
    { Private declarations }
    OldStanId:integer;
    OldNum:string;
    OldClientNum:string;
    OldDat:TDateTime;
    OldClientDat:TDateTime;
  public
    EditID:integer;
    ParentDover:TForm;
    { Public declarations }
    vIS_AGENT:integer;
    vSTATUS_ZAKAZ:integer;
    vCOPY:integer;
  end;

var
  frm_MonthNew: Tfrm_MonthNew;

implementation
uses month_all, KlsMisc2, ForDB;

{$R *.dfm}

procedure Tfrm_MonthNew.acSaveExecute(Sender: TObject);
begin
 if (cbPredpr.Value='0') or (cbProd.Value='0') or (edReq.Value=0) or(edNum.Text='') or (cbOrgStru.Value='0') then
   application.MessageBox('Не выбран контрагент или продукт или количество 0!', 'Не хватает реквизитов', mb_OK)
 else
   if vSTATUS_ZAKAZ=10 then
   begin
     // Новый заказ
     oraQIns.ClearVariables;
     oraQIns.SetVariable(':kls_predpr_id',cbPredpr.keyValue);
     oraQIns.SetVariable(':KLS_DOG_ID',cbDog.KeyValue);
     if cbDog.Value<>'0' then
     begin
       oraQIns.SetVariable(':DATE_DOG',oraKls_dog.fieldByName('DOG_DATE').AsDateTime);
     end;
     oraQIns.SetVariable(':KLS_PROD_ID',cbProd.KeyValue);
     oraQIns.SetVariable(':ORGSTRU_ID',cbOrgstru.KeyValue);
     oraQIns.SetVariable(':REQUEST',edReq.Value);
     oraQIns.SetVariable(':KOL',edKol.Value);
     oraQIns.SetVariable(':SPEED_VES',edSpeedVes.Value);
     oraQIns.SetVariable(':SPEED_KOL',edSpeedKol.Value);
     oraQIns.SetVariable(':DATE_PLAN',StartOfTheMonth(edDatePlan.Date));
     oraQIns.SetVariable(':STAN_ID',cbStan.KeyValue);
     oraQIns.SetVariable(':INPUT_DATE',DateOf(edDat.Date));
     oraQIns.SetVariable(':INPUT_Number',edNum.Text);
     oraQIns.SetVariable(':price',edPrice.Value);
     oraQIns.SetVariable(':Poluch_name',edPoluch.Text);
     oraQIns.SetVariable(':Potreb_name',edPotreb.Text);
     oraQIns.SetVariable(':payform_ID',cbPayForm.KeyValue);
     oraQIns.SetVariable(':load_abbr',cbVidOtgr.KeyValue);
     oraQIns.SetVariable(':vetka_id',cbVetka.KeyValue);
     oraQIns.SetVariable(':poluch_id',cbPoluch.KeyValue);
     oraQIns.SetVariable(':potreb_id',cbPotreb.KeyValue);
     oraQIns.SetVariable(':Usl_Opl_id',cbUslOpl.KeyValue);
     oraQIns.SetVariable(':kls_planstruid',cbPlanStru.KeyValue);
     oraQIns.SetVariable(':status_zakaz_id',cbStatusZakaz.KeyValue);
     oraQIns.SetVariable(':is_agent',vIS_AGENT);
     oraQIns.SetVariable(':client_number',edClientNum.Text);
     oraQIns.SetVariable(':client_DATE',DateOf(edClientDat.Date));
     oraQIns.SetVariable(':prich',edPrich.Text);
     oraQIns.SetVariable(':gr4',edGR4.Text);
     oraQIns.SetVariable(':BEGIN_DATE',DateOf(edBeginDate.Date));
     try
       oraQIns.Execute;
       oraTSes.Commit;
       ModalResult:=mrOk;
     except
       on E:EOracleError do
         ShowMessage(E.Message);
     end;
   end
   else
   begin
     // Корректировка заказа - изменение основной заявки
     if (vSTATUS_ZAKAZ=30) then
     Begin
       oraQUpd.ClearVariables;
       oraQUpd.SetVariable(':kls_predpr_id',cbPredpr.keyValue);
       oraQUpd.SetVariable(':KLS_DOG_ID',cbDog.KeyValue);
       if cbDog.Value<>'0' then
       begin
         oraQUpd.SetVariable(':DATE_DOG',oraKls_dog.fieldByName('DOG_DATE').AsDateTime);
       end;
       oraQUpd.SetVariable(':KLS_PROD_ID',cbProd.KeyValue);
       oraQUpd.SetVariable(':ORGSTRU_ID',cbOrgstru.KeyValue);
       oraQUpd.SetVariable(':REQUEST',edReq.Value);
       oraQUpd.SetVariable(':KOL',edKol.Value);
       oraQUpd.SetVariable(':SPEED_VES',edSpeedVes.Value);
       oraQUpd.SetVariable(':SPEED_KOL',edSpeedKol.Value);
       oraQUpd.SetVariable(':DATE_PLAN',StartOfTheMonth(edDatePlan.Date));
       oraQUpd.SetVariable(':STAN_ID',cbStan.KeyValue);
       if (vSTATUS_ZAKAZ=20) or (vSTATUS_ZAKAZ=30) then
       begin
         oraQUpd.SetVariable(':INPUT_DATE',DateOf(edDat.Date));
         oraQUpd.SetVariable(':INPUT_Number',edNum.Text);
         oraQUpd.SetVariable(':client_number',edClientNum.Text);
         oraQUpd.SetVariable(':client_DATE',DateOf(edClientDat.Date));
       end
       else
       Begin
         oraQUpd.SetVariable(':INPUT_DATE',DateOf(OldDat));
         oraQUpd.SetVariable(':INPUT_Number',OldNum);
         oraQUpd.SetVariable(':client_number',OldClientNum);
         oraQUpd.SetVariable(':client_DATE',DateOf(OldClientDat));
       End;
       oraQUpd.SetVariable(':ID',EditID);
       oraQUpd.SetVariable(':price',edPrice.Value);
       oraQUpd.SetVariable(':Poluch_name',edPoluch.Text);
       oraQUpd.SetVariable(':Potreb_name',edPotreb.Text);
       oraQUpd.SetVariable(':payform_ID',cbPayForm.KeyValue);
       oraQUpd.SetVariable(':load_abbr',cbVidOtgr.KeyValue);
       oraQUpd.SetVariable(':vetka_id',cbVetka.KeyValue);
       oraQUpd.SetVariable(':poluch_id',cbPoluch.KeyValue);
       oraQUpd.SetVariable(':potreb_id',cbPotreb.KeyValue);
       oraQUpd.SetVariable(':Usl_Opl_id',cbUslOpl.KeyValue);
       oraQUpd.SetVariable(':kls_planstruid',cbPlanStru.KeyValue);
       oraQUpd.SetVariable(':is_agent',vIS_AGENT);
       oraQUpd.SetVariable(':prich',edPrich.Text);
       oraQUpd.SetVariable(':gr4',edGR4.Text);
       oraQUpd.SetVariable(':status_zakaz_id',cbStatusZakaz.KeyValue);
       oraQUpd.SetVariable(':BEGIN_DATE',DateOf(edBeginDate.Date));
       try
         oraQUpd.Execute;
         oraTSes.Commit;
         ModalResult:=mrOk;
       except
         on E:EOracleError do
           ShowMessage(E.Message);
       end;
     end;

     // Отказ - изменение основной заявки
     if (vSTATUS_ZAKAZ=50) then
     Begin
       oraQUpdVes.ClearVariables;
       oraQUpdVes.SetVariable(':ID',EditID);
       oraQUpdVes.SetVariable(':REQUEST',edReq.Value);
       oraQUpdVes.SetVariable(':KOL',edKol.Value);
       oraQUpdVes.SetVariable(':SPEED_VES',edSpeedVes.Value);
       oraQUpdVes.SetVariable(':SPEED_KOL',edSpeedKol.Value);
       try
         oraQUpdVes.Execute;
         oraTSes.Commit;
         ModalResult:=mrOk;
       except
         on E:EOracleError do
           ShowMessage(E.Message);
       end;
     end;

     // Запись в историю
     if (vSTATUS_ZAKAZ=20) or (vSTATUS_ZAKAZ=40) or (vSTATUS_ZAKAZ=50) then
     Begin
       oraQInsRow.ClearVariables;
       oraQInsRow.SetVariable(':month_all_id',EditId);
       oraQInsRow.SetVariable(':sortby',cbStatusZakaz.KeyValue);
       oraQInsRow.SetVariable(':client_number',edClientNum.Text);
       oraQInsRow.SetVariable(':client_DATE',DateOf(edClientDat.Date));
       oraQInsRow.SetVariable(':INPUT_Number',edNum.Text);
       oraQInsRow.SetVariable(':INPUT_DATE',DateOf(edDat.Date));
       if (vSTATUS_ZAKAZ=40) or (vSTATUS_ZAKAZ=50) then
       begin
         oraQInsRow.SetVariable(':REQUEST',-edReq.Value);
         oraQInsRow.SetVariable(':KOL',-edKol.Value);
         oraQInsRow.SetVariable(':SPEED_VES',-edSpeedVes.Value);
         oraQInsRow.SetVariable(':SPEED_KOL',-edSpeedKol.Value);
       end
       else
       begin
         oraQInsRow.SetVariable(':REQUEST',edReq.Value);
         oraQInsRow.SetVariable(':KOL',edKol.Value);
         oraQInsRow.SetVariable(':SPEED_VES',edSpeedVes.Value);
         oraQInsRow.SetVariable(':SPEED_KOL',edSpeedKol.Value);
       end;
       oraQInsRow.SetVariable(':kls_predpr_id',cbPredpr.keyValue);
       oraQInsRow.SetVariable(':KLS_DOG_ID',cbDog.KeyValue);
       if cbDog.Value<>'0' then
       begin
         oraQInsRow.SetVariable(':DATE_DOG',oraKls_dog.fieldByName('DOG_DATE').AsDateTime);
       end;
       oraQInsRow.SetVariable(':KLS_PROD_ID',cbProd.KeyValue);
       oraQInsRow.SetVariable(':STAN_ID',cbStan.KeyValue);
       oraQInsRow.SetVariable(':prich',edPrich.Text);
       oraQInsRow.SetVariable(':payform_ID',cbPayForm.KeyValue);
       oraQInsRow.SetVariable(':load_abbr',cbVidOtgr.KeyValue);
       oraQInsRow.SetVariable(':vetka_id',cbVetka.KeyValue);
       oraQInsRow.SetVariable(':gr4',edGR4.Text);
       oraQInsRow.SetVariable(':poluch_id',cbPoluch.KeyValue);
       oraQInsRow.SetVariable(':potreb_id',cbPotreb.KeyValue);
       oraQInsRow.SetVariable(':Usl_Opl_id',cbUslOpl.KeyValue);
       oraQInsRow.SetVariable(':ORGSTRU_ID',cbOrgstru.KeyValue);
       oraQInsRow.SetVariable(':price',edPrice.Value);
       oraQInsRow.SetVariable(':Poluch_name',edPoluch.Text);
       oraQInsRow.SetVariable(':Potreb_name',edPotreb.Text);
       oraQInsRow.SetVariable(':kls_planstruid',cbPlanStru.KeyValue);
       oraQInsRow.SetVariable(':status_zakaz_id',cbStatusZakaz.KeyValue);
       oraQInsRow.SetVariable(':BEGIN_DATE',DateOf(edBeginDate.Date));
       if vSTATUS_ZAKAZ=40 then oraQInsRow.SetVariable(':STAN_OLD_ID',OldStanId);
       try
         oraQInsRow.Execute;
         oraTSes.Commit;
         ModalResult:=mrOk;
       except
         on E:EOracleError do
           ShowMessage(E.Message);
       end;
     end;
     // Запись нового заказа при переадресовке до начала отгрузки
     if (cbStatusZakaz.KeyValue=40) and
        (Application.MessageBox('Создать новый заказ потребителя?','Внимание!',MB_YESNO)=IDYES) then
     Begin
       oraQIns.ClearVariables;
       oraQIns.SetVariable(':kls_predpr_id',cbPredpr.keyValue);
       oraQIns.SetVariable(':KLS_DOG_ID',cbDog.KeyValue);
       if cbDog.Value<>'0' then
       begin
         oraQIns.SetVariable(':DATE_DOG',oraKls_dog.fieldByName('DOG_DATE').AsDateTime);
       end;
       oraQIns.SetVariable(':KLS_PROD_ID',cbProd.KeyValue);
       oraQIns.SetVariable(':ORGSTRU_ID',cbOrgstru.KeyValue);
       oraQIns.SetVariable(':REQUEST',edReq.Value);
       oraQIns.SetVariable(':KOL',edKol.Value);
       oraQIns.SetVariable(':SPEED_VES',edSpeedVes.Value);
       oraQIns.SetVariable(':SPEED_KOL',edSpeedKol.Value);
       oraQIns.SetVariable(':DATE_PLAN',StartOfTheMonth(edDatePlan.Date));
       oraQIns.SetVariable(':STAN_ID',cbStan.KeyValue);
       oraQIns.SetVariable(':INPUT_DATE',DateOf(edDat.Date));
       oraQIns.SetVariable(':INPUT_Number',edNum.Text);
       oraQIns.SetVariable(':price',edPrice.Value);
       oraQIns.SetVariable(':Poluch_name',edPoluch.Text);
       oraQIns.SetVariable(':Potreb_name',edPotreb.Text);
       oraQIns.SetVariable(':payform_ID',cbPayForm.KeyValue);
       oraQIns.SetVariable(':load_abbr',cbVidOtgr.KeyValue);
       oraQIns.SetVariable(':vetka_id',cbVetka.KeyValue);
       oraQIns.SetVariable(':poluch_id',cbPoluch.KeyValue);
       oraQIns.SetVariable(':potreb_id',cbPotreb.KeyValue);
       oraQIns.SetVariable(':Usl_Opl_id',cbUslOpl.KeyValue);
       oraQIns.SetVariable(':kls_planstruid',cbPlanStru.KeyValue);
       oraQIns.SetVariable(':status_zakaz_id',10);
       oraQIns.SetVariable(':is_agent',vIS_AGENT);
       oraQIns.SetVariable(':client_number',edClientNum.Text);
       oraQIns.SetVariable(':client_DATE',DateOf(edClientDat.Date));
       oraQIns.SetVariable(':prich',edPrich.Text);
       oraQIns.SetVariable(':gr4',edGR4.Text);
       oraQIns.SetVariable(':BEGIN_DATE',DateOf(edBeginDate.Date));
       oraQIns.SetVariable(':ZAKAZ_OLD_ID',EditID);
       try
         oraQIns.Execute;
         oraTSes.Commit;
         ModalResult:=mrOk;
       except
         on E:EOracleError do
           ShowMessage(E.Message);
       end;
     end;
   End;
end;

procedure Tfrm_MonthNew.FormCreate(Sender: TObject);
begin
  f_db.LogonMasterSession(oraTSes);
  oraKls_predpr.Open;
  oraKls_dog.Open;
  oraKls_prod.Open;
  oraKls_stan.Open;
  oraPayform.Open;
  oraUslOpl.Open;
  oraPotreb.Open;
  oraPoluch.Open;
  oraVidOtgr.Open;
  oraVetka.Open;
  oraOrg_Stru.Open;
  oraPlanStru.Open;
  ParentDover:=TForm(Owner);
  edDat.Date:= date;
  edClientDat.Date:= date;
end;

procedure Tfrm_MonthNew.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  oraTSes.Connected:=false;
end;

procedure Tfrm_MonthNew.acExitExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure Tfrm_MonthNew.cbDogChange(Sender: TObject);
begin
  inherited;
  cbUslOpl.Value:=oraUslOpl.fieldByName('ID').asString;
end;

procedure Tfrm_MonthNew.FormActivate(Sender: TObject);
begin
  inherited;
  q_status_zakaz.SQL[1]:='WHERE round(ID/10)*10='+IntToStr(vSTATUS_ZAKAZ);
  q_status_zakaz.Open;
  cbStatusZakaz.KeyValue:=vSTATUS_ZAKAZ;
  if vSTATUS_ZAKAZ=10 then
  Begin
    Caption:='Первоначальный заказ клиента';
    if vCOPY<>1 then
    begin
      edDatePlan.Date:=StartOfTheMonth(TfrmMonthAll(ParentDover).edDateFrom.Date);
      edBeginDate.Date:=StartOfTheMonth(TfrmMonthAll(ParentDover).edDateFrom.Date);
      cbOrgstru.KeyValue:=31;
      cbPayForm.KeyValue:=10;
      cbUslOpl.KeyValue:=1;
      cbVidOtgr.KeyValue:='МПС';
      cbVetka.KeyValue:=1;
    end;
  End
  Else
    Begin
      if vCOPY<>1 then
      begin
        edNum.Text:=TfrmMonthAll(ParentDover).oraMonth_all.FieldByName('INPUT_NUMBER').AsString;
        OldNum:=edNum.Text;
        edDat.Date:=TfrmMonthAll(ParentDover).oraMonth_all.FieldByName('INPUT_DATE').AsDateTime;
        OldDat:=DateOf(edDat.Date);
        cbOrgstru.KeyValue:=TfrmMonthAll(ParentDover).oraMonth_all.FieldByName('ORGSTRU_ID').AsInteger;
        cbPredpr.KeyValue:=TfrmMonthAll(ParentDover).oraMonth_all.FieldByName('KLS_PREDPR_ID').AsInteger;
        cbDog.KeyValue:=TfrmMonthAll(ParentDover).oraMonth_all.FieldByName('KLS_DOG_ID').AsInteger;
        cbProd.KeyValue:=TfrmMonthAll(ParentDover).oraMonth_all.FieldByName('KLS_PROD_ID').AsString;
        edDatePlan.Date:=TfrmMonthAll(ParentDover).oraMonth_all.FieldByName('DATE_PLAN').AsDateTime;
        edDatePlanChange(sender);
        edReq.Value:=TfrmMonthAll(ParentDover).oraMonth_all.FieldByName('REQUEST').AsFloat;
        edKol.Value:=TfrmMonthAll(ParentDover).oraMonth_all.FieldByName('KOL').AsFloat;
        edSpeedVes.Value:=TfrmMonthAll(ParentDover).oraMonth_all.FieldByName('SPEED_VES').AsFloat;
        edSpeedKol.Value:=TfrmMonthAll(ParentDover).oraMonth_all.FieldByName('SPEED_KOL').AsFloat;
        edPrice.Value:=TfrmMonthAll(ParentDover).oraMonth_all.FieldByName('PRICE').AsFloat;
        cbStan.KeyValue:=TfrmMonthAll(ParentDover).oraMonth_all.FieldByName('STAN_ID').AsInteger;
        if VarIsNull(cbStan.KeyValue) then OldStanId:=0 else OldStanId:=cbStan.KeyValue;
        cbPayForm.KeyValue:=TfrmMonthAll(ParentDover).oraMonth_all.FieldByName('PAYFORM_ID').AsInteger;
        cbUslOpl.KeyValue:=TfrmMonthAll(ParentDover).oraMonth_all.FieldByName('USL_OPL_ID').AsInteger;
        cbVidOtgr.KeyValue:=TfrmMonthAll(ParentDover).oraMonth_all.FieldByName('LOAD_ABBR').AsString;
        cbVetka.KeyValue:=TfrmMonthAll(ParentDover).oraMonth_all.FieldByName('VETKA_ID').AsFloat;
        cbPoluch.KeyValue:=TfrmMonthAll(ParentDover).oraMonth_all.FieldByName('POLUCH_ID').AsInteger;
        cbPotreb.KeyValue:=TfrmMonthAll(ParentDover).oraMonth_all.FieldByName('POTREB_ID').AsInteger;
        edPoluch.Text:=TfrmMonthAll(ParentDover).oraMonth_all.FieldByName('POLUCH_NAME').AsString;
        edPotreb.Text:=TfrmMonthAll(ParentDover).oraMonth_all.FieldByName('POTREB_NAME').AsString;
        cbPlanstru.KeyValue:=TfrmMonthAll(ParentDover).oraMonth_all.FieldByName('kls_planstruID').AsInteger;
        edClientNum.Text:=TfrmMonthAll(ParentDover).oraMonth_all.FieldByName('CLIENT_NUMBER').AsString;
        OldClientNum:=edClientNum.Text;
        edClientDat.Date:=TfrmMonthAll(ParentDover).oraMonth_all.FieldByName('CLIENT_DATE').AsDateTime;
        OldClientDat:=DateOf(edClientDat.Date);
        edPrich.Text:=TfrmMonthAll(ParentDover).oraMonth_all.FieldByName('PRICH').AsString;
        edGR4.Text:=TfrmMonthAll(ParentDover).oraMonth_all.FieldByName('GR4').AsString;
        edBeginDate.Date:=TfrmMonthAll(ParentDover).oraMonth_all.FieldByName('BEGIN_DATE').AsDateTime;
      end;

      case vSTATUS_ZAKAZ of
        20: Begin
              Caption:='К отгрузке';
              cbOrgstru.Enabled:=false;
              cbPredpr.Enabled:=false;
              cbDog.Enabled:=false;
              edDatePlan.Enabled:=false;
              edNum.Enabled:=false;
              edDat.Enabled:=false;
              edClientNum.Enabled:=false;
              edClientDat.Enabled:=false;
            end;
        30: begin
              Caption:='Корректировка заказа';
            end;
        40: begin
              Caption:='Переадресовка';
              cbOrgstru.Enabled:=false;
              cbPredpr.Enabled:=false;
              cbDog.Enabled:=false;
              cbProd.Enabled:=false;
              edDatePlan.Enabled:=false;
{              edReq.Enabled:=false;
              edKol.Enabled:=false;
              edSpeedVes.Enabled:=false;
              edSpeedKol.Enabled:=false;}
              edPrice.Enabled:=false;
              cbPayForm.Enabled:=false;
              cbUslOpl.Enabled:=false;
              cbVidOtgr.Enabled:=false;
              cbVetka.Enabled:=false;
              cbPoluch.Enabled:=false;
              edPoluch.Enabled:=false;
              sbPoluch.Enabled:=false;
              cbPotreb.Enabled:=false;
              edPotreb.Enabled:=false;
              sbPotreb.Enabled:=false;
              cbPlanStru.Enabled:=false;
              edGR4.Enabled:=false;
            end;
        50: begin
              Caption:='Отказ клиента';
              cbOrgstru.Enabled:=false;
              cbPredpr.Enabled:=false;
              cbDog.Enabled:=false;
              cbProd.Enabled:=false;
              edDatePlan.Enabled:=false;
              edPrice.Enabled:=false;
              cbStan.Enabled:=false;
              cbPayForm.Enabled:=false;
              cbUslOpl.Enabled:=false;
              cbVidOtgr.Enabled:=false;
              cbVetka.Enabled:=false;
              cbPoluch.Enabled:=false;
              edPoluch.Enabled:=false;
              sbPoluch.Enabled:=false;
              cbPotreb.Enabled:=false;
              edPotreb.Enabled:=false;
              sbPotreb.Enabled:=false;
              cbPlanStru.Enabled:=false;
              edGR4.Enabled:=false;
            end;
      end;
    end;
  edDatePlanChange(Sender);
end;

procedure Tfrm_MonthNew.acSeekPoluchExecute(Sender: TObject);
begin
  KlsMisc2.SetKLSParam('KLS_PREDPR_POLUCH','CHOOSE',fsNormal,VarToStr(cbPoluch.KeyValue),'',true,0,0,'');

  with TF_KlsMisc.Create(Self) do
  begin
    if ShowModal=mrOk then
    begin
      cbPoluch.KeyValue:=KlsMisc2.vIdToSeek;
    end;
    Free;
  end;
end;

procedure Tfrm_MonthNew.acSeekPotrebExecute(Sender: TObject);
begin
  if VarIsNull(cbPotreb.KeyValue) then
    KlsMisc2.SetKLSParam('KLS_PREDPR_POLUCH','CHOOSE',fsNormal,VarToStr(cbPoluch.KeyValue),'',true,0,0,'')
  else
    KlsMisc2.SetKLSParam('KLS_PREDPR_POLUCH','CHOOSE',fsNormal,VarToStr(cbPotreb.KeyValue),'',true,0,0,'');

  with TF_KlsMisc.Create(Self) do
  begin
    if ShowModal=mrOk then
    begin
      cbPotreb.KeyValue:=KlsMisc2.vIdToSeek;
    end;
    Free;
  end;
end;

procedure Tfrm_MonthNew.cbPlanStruChange(Sender: TObject);
begin
  if oraPlanStru.FieldByName('REGION_ID').AsInteger=21 then
  begin
    // Архангельск
    cbOrgStru.KeyValue:=40;
  end
  else
  begin
    // Архангельск
    cbOrgStru.KeyValue:=31;
  end;
end;

procedure Tfrm_MonthNew.edDatePlanChange(Sender: TObject);
begin
  oraPlanStru.SetVariable('DATE_PLAN',StartOfTheMonth(edDatePlan.Date));
  f_db.ReQuery(oraPlanStru,true);
end;

procedure Tfrm_MonthNew.edReqChange(Sender: TObject);
begin
  if (edReq.value>0) and (oraKls_Prod.fieldByName('normotgr').AsFloat>0) then
  Begin
    if edReq.value<oraKls_Prod.fieldByName('normotgr').AsFloat then
      edKol.Value:=1
    else
      edKol.Value:=Round(edReq.value/oraKls_Prod.fieldByName('normotgr').AsFloat);
  end;
end;

procedure Tfrm_MonthNew.edSpeedVesChange(Sender: TObject);
begin
  if (edSpeedVes.value>0) and (oraKls_Prod.fieldByName('normotgr').AsFloat>0) then
  Begin
    if edSpeedVes.value<oraKls_Prod.fieldByName('normotgr').AsFloat then
      edSpeedKol.Value:=1
    else
      edSpeedKol.Value:=Round(edSpeedVes.value/oraKls_Prod.fieldByName('normotgr').AsFloat);
  end;
end;

procedure Tfrm_MonthNew.ed_StanKodChange(Sender: TObject);
begin
  if ed_stankod.Text<>'' then
  if oraKls_Stan.locate('STAN_KOD',ed_stankod.Text,[]) then
    cbStan.KeyValue:=oraKls_Stan.FieldByName('ID').AsInteger;
end;

procedure Tfrm_MonthNew.cbStanChange(Sender: TObject);
begin
  ed_stankod.Text:=oraKls_Stan.FieldByName('STAN_KOD').AsString;
end;

end.
