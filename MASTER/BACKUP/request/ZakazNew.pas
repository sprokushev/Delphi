unit ZakazNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, RxLookup, StdCtrls, ComCtrls, Mask,
  ToolEdit, CurrEdit, ActnList, Buttons, XPStyleActnCtrls, ActnMan,dateUtils,MdiForm,
  Placemnt, RXCtrls, DBCtrls, ExtCtrls;

type
  Tf_ZakazNew = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    oraTSes: TOracleSession;
    oraPlat: TOracleDataSet;
    oraPlatID: TIntegerField;
    oraPlatSHORT_NAME: TStringField;
    oraPlatPREDPR_NAME: TStringField;
    oraPlatINN: TStringField;
    dsPlat: TDataSource;
    oraDog: TOracleDataSet;
    oraDogID: TIntegerField;
    oraDogDOG_NUMBER: TStringField;
    oraDogDOG_DATE: TDateTimeField;
    oraDogUSL_OPL_ID: TFloatField;
    dsDog: TDataSource;
    oraProd: TOracleDataSet;
    oraProdID_NPR: TStringField;
    oraProdLONG_NAME_NPR: TStringField;
    dsProd: TDataSource;
    oraStan: TOracleDataSet;
    oraStanID: TFloatField;
    oraStanSTAN_NAME: TStringField;
    oraStanSTAN_KOD: TIntegerField;
    dsStan: TDataSource;
    ActionManager1: TActionManager;
    acSave: TAction;
    acExit: TAction;
    acSeekPoluch: TAction;
    acSeekPotreb: TAction;
    oraPayform: TOracleDataSet;
    oraPayformID: TIntegerField;
    oraPayformPAYFORM_NAME: TStringField;
    dsPayform: TDataSource;
    oraVidOtgr: TOracleDataSet;
    oraVidOtgrLOAD_ABBR: TStringField;
    oraVidOtgrLOAD_NAME: TStringField;
    dsVidOtgr: TDataSource;
    oraVetka: TOracleDataSet;
    oraVetkaID: TIntegerField;
    oraVetkaVETKA_NAME: TStringField;
    dsVetka: TDataSource;
    oraPotreb: TOracleDataSet;
    oraPotrebID: TIntegerField;
    oraPotrebSHORT_NAME: TStringField;
    oraPotrebPREDPR_NAME: TStringField;
    dsPotreb: TDataSource;
    oraPoluch: TOracleDataSet;
    oraPoluchID: TIntegerField;
    oraPoluchSHORT_NAME: TStringField;
    oraPoluchPREDPR_NAME: TStringField;
    oraPoluchOKPO: TStringField;
    dsPoluch: TDataSource;
    oraUslOpl: TOracleDataSet;
    oraUslOplID: TFloatField;
    oraUslOplNAME: TStringField;
    dsUslOpl: TDataSource;
    oraFilial: TOracleDataSet;
    oraFilialID: TFloatField;
    oraFilialNAME: TStringField;
    dsFilial: TDataSource;
    oraPlanStru: TOracleDataSet;
    oraPlanStruID: TFloatField;
    oraPlanStruNAME: TStringField;
    oraPlanStruREGION_ID: TFloatField;
    dsPlanstru: TDataSource;
    q_status_zakaz: TOracleDataSet;
    q_status_zakazID: TFloatField;
    q_status_zakazNAME: TStringField;
    ds_status_zakaz: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    Label20: TLabel;
    cbStatusZakaz: TRxDBLookupCombo;
    Label5: TLabel;
    edDatePlan: TDateTimePicker;
    Label29: TLabel;
    edBeginDate: TDateTimePicker;
    Label19: TLabel;
    edClientNum: TEdit;
    edClientDat: TDateTimePicker;
    Label7: TLabel;
    edNum: TEdit;
    edDat: TDateTimePicker;
    GroupBox2: TGroupBox;
    Label14: TLabel;
    cbFilial: TRxDBLookupCombo;
    Label1: TLabel;
    cbPlat: TRxDBLookupCombo;
    DBText3: TDBText;
    Label2: TLabel;
    cbDog: TRxDBLookupCombo;
    Label30: TLabel;
    DBText5: TDBText;
    Label15: TLabel;
    edPrice: TRxCalcEdit;
    Label23: TLabel;
    Label8: TLabel;
    cbPayForm: TRxDBLookupCombo;
    Label13: TLabel;
    cbUslOpl: TRxDBLookupCombo;
    Label18: TLabel;
    cbPlanStru: TRxDBLookupCombo;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    cbProd: TRxDBLookupCombo;
    Label6: TLabel;
    edVes: TRxCalcEdit;
    Label21: TLabel;
    edKol: TRxCalcEdit;
    Label26: TLabel;
    Label24: TLabel;
    edSpeedVes: TRxCalcEdit;
    Label25: TLabel;
    edSpeedKol: TRxCalcEdit;
    Label22: TLabel;
    GroupBox4: TGroupBox;
    Label4: TLabel;
    edStanKod: TEdit;
    cbStan: TRxDBLookupCombo;
    Label16: TLabel;
    DBText1: TDBText;
    Label10: TLabel;
    cbPoluch: TRxDBLookupCombo;
    sbPoluch: TRxSpeedButton;
    DBText2: TDBText;
    Label11: TLabel;
    cbPotreb: TRxDBLookupCombo;
    sbPotreb: TRxSpeedButton;
    DBText4: TDBText;
    Label17: TLabel;
    edPotreb: TEdit;
    Label9: TLabel;
    cbVetka: TRxDBLookupCombo;
    Label12: TLabel;
    cbVidOtgr: TRxDBLookupCombo;
    Label27: TLabel;
    edPrim: TEdit;
    edGR4: TEdit;
    Label28: TLabel;
    RxSpeedButton1: TRxSpeedButton;
    acSeekPlat: TAction;
    oraProdNORMOTGR: TFloatField;
    pkgFOR_ZAKAZ: TOraclePackage;
    Label31: TLabel;
    edPriceClient: TRxCalcEdit;
    Label32: TLabel;
    Label33: TLabel;
    cbLukDog: TRxDBLookupCombo;
    oraLukDog: TOracleDataSet;
    dsLukDog: TDataSource;
    oraDogLUKDOG_ID: TIntegerField;
    Label34: TLabel;
    cbGosprog: TRxDBLookupCombo;
    Label35: TLabel;
    cbGpNapr: TRxDBLookupCombo;
    Panel2: TPanel;
    dsGpNapr: TDataSource;
    oraGpNapr: TOracleDataSet;
    oraGosprog: TOracleDataSet;
    dsGosprog: TDataSource;
    oraGosprogID: TIntegerField;
    oraGosprogGOSPROG_NAME: TStringField;
    oraGpNaprID: TFloatField;
    oraGpNaprNAME: TStringField;
    oraDogIS_AGENT: TFloatField;
    oraLukDogID: TIntegerField;
    oraLukDogDOG_NUMBER: TStringField;
    oraLukDogSHORT_NAME: TStringField;
    oraDogAGENT_ID: TFloatField;
    oraLukDogIS_AGENT: TIntegerField;
    DBText6: TDBText;
    oraPoluchGD_KOD: TStringField;
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
    procedure edVesChange(Sender: TObject);
    procedure edSpeedVesChange(Sender: TObject);
    procedure edStanKodChange(Sender: TObject);
    procedure cbStanChange(Sender: TObject);
    procedure acSeekPlatExecute(Sender: TObject);
    procedure oraDogAfterScroll(DataSet: TDataSet);
    procedure cbDogExit(Sender: TObject);
  private
    { Private declarations }
    OldStanId:integer;
    OldNum:string;
    OldClientNum:string;
    OldDat:TDateTime;
    OldClientDat:TDateTime;
    oldPLAT_ID:integer;
    LINK_ID:integer;
    LINK_HIST_ID:integer;
  public
    EditID:integer;
    EditHistID:integer;
    ParentDover:TForm;
    { Public declarations }
    vIS_AGENT:integer;
    vSTATUS_ZAKAZ:integer;
    vADD:integer;
    vIS_ACCEPT:integer;
    vAGENT_ID:integer;
    vZakazPrevId:variant;
  end;

var
  f_ZakazNew: Tf_ZakazNew;

implementation
uses KlsMisc2, ForDB, zakaz;

{$R *.dfm}

procedure Tf_ZakazNew.acSaveExecute(Sender: TObject);
begin
 if (cbPlat.Value='0')  then
 begin
   application.MessageBox('Не выбран контрагент!', 'Не хватает реквизитов', mb_OK);
   exit;
 end;
 if (cbPlanStru.Value='0')  then
 begin
   application.MessageBox('Не выбрана позиция плана поставок!', 'Не хватает реквизитов', mb_OK);
   exit;
 end;
 if (cbProd.Value='0') then
 begin
   application.MessageBox('Не выбран продукт!', 'Не хватает реквизитов', mb_OK);
   exit;
 end;
 if (edNum.Text='') then
 begin
   application.MessageBox('Нет входящего номера!', 'Не хватает реквизитов', mb_OK);
   exit;
 end;
 if (cbFilial.Value='0') then
 begin
   application.MessageBox('Не выбран филиал!', 'Не хватает реквизитов', mb_OK);
   exit;
 end;

 case vSTATUS_ZAKAZ of
   10: // Новый заказ
       try
         EditID:=pkgFOR_ZAKAZ.CallFloatFunction('AddZakaz',[0,0,0,vIS_AGENT,StartOfTheMonth(edDatePlan.Date),edClientNum.Text,
                  DateOf(edClientDat.Date),edNum.Text,DateOf(edDat.Date),DateOf(edBeginDate.Date),
                  vIS_ACCEPT,cbFilial.KeyValue,cbPlat.keyValue,cbDog.KeyValue,
                  cbProd.KeyValue,cbUslOpl.KeyValue,cbVidOtgr.KeyValue,cbStan.KeyValue,
                  cbVetka.KeyValue,cbPoluch.KeyValue,cbPotreb.KeyValue,edPotreb.Text,
                  '',cbPayForm.KeyValue,cbPlanStru.KeyValue,edPriceClient.Value,
                  edPrice.Value,edVes.Value,edKol.Value,edSpeedVes.Value,edSpeedKol.Value,
                  edPrim.Text,edGR4.Text,vZakazPrevId,cbGosprog.KeyValue,cbGpNapr.KeyValue,cbLukDog.KeyValue,LINK_ID,LINK_HIST_ID]);
         oraTSes.Commit;
         ModalResult:=mrOk;
       except
         on E:EOracleError do
           ShowMessage(E.Message);
       end;
   30: // Корректировка заказа - изменение основной заявки
       try
         EditID:=pkgFOR_ZAKAZ.CallFloatFunction('AddZakaz',[0,EditID,0,vIS_AGENT,StartOfTheMonth(edDatePlan.Date),edClientNum.Text,
                  DateOf(edClientDat.Date),edNum.Text,DateOf(edDat.Date),DateOf(edBeginDate.Date),
                  vIS_ACCEPT,cbFilial.KeyValue,cbPlat.KeyValue,cbDog.keyValue,
                  cbProd.KeyValue,cbUslOpl.KeyValue,cbVidOtgr.KeyValue,cbStan.KeyValue,
                  cbVetka.KeyValue,cbPoluch.KeyValue,cbPotreb.KeyValue,edPotreb.Text,
                  '',cbPayForm.KeyValue,cbPlanStru.KeyValue,edPriceClient.Value,
                  edPrice.Value,edVes.Value,edKol.Value,edSpeedVes.Value,edSpeedKol.Value,
                  edPrim.Text,edGR4.Text,vZakazPrevId,cbGosprog.KeyValue,cbGpNapr.KeyValue,cbLukDog.KeyValue,LINK_ID,LINK_HIST_ID]);
         oraTSes.Commit;
         ModalResult:=mrOk;
       except
         on E:EOracleError do
           ShowMessage(E.Message);
       end;
   40: // Переадресация
       try
         if vADD=1 then
           EditID:=pkgFOR_ZAKAZ.CallFloatFunction('ReAddrAddZakaz',[0,EditID,0,cbStatusZakaz.KeyValue,vIS_AGENT,StartOfTheMonth(edDatePlan.Date),edClientNum.Text,
                  DateOf(edClientDat.Date),edNum.Text,DateOf(edDat.Date),DateOf(edBeginDate.Date),
                  cbFilial.KeyValue,cbPlat.keyValue,cbDog.KeyValue,
                  cbProd.KeyValue,cbUslOpl.KeyValue,cbVidOtgr.KeyValue,cbStan.KeyValue,
                  cbVetka.KeyValue,cbPoluch.KeyValue,cbPotreb.KeyValue,edPotreb.Text,
                  '',cbPayForm.KeyValue,cbPlanStru.KeyValue,edPriceClient.Value,
                  edPrice.Value,edVes.Value,edKol.Value,edSpeedVes.Value,edSpeedKol.Value,
                  edPrim.Text,edGR4.Text,cbGosprog.KeyValue,cbGpNapr.KeyValue,cbLukDog.KeyValue])
         else
           EditHistID:=pkgFOR_ZAKAZ.CallFloatFunction('ReAddrZakaz',[0,EditID,0,cbStatusZakaz.KeyValue,edClientNum.Text,
                  DateOf(edClientDat.Date),edNum.Text,DateOf(edDat.Date),
                  DateOf(edBeginDate.Date),cbStan.KeyValue]);
         oraTSes.Commit;
         ModalResult:=mrOk;
       except
         on E:EOracleError do
           ShowMessage(E.Message);
       end;
   50: // Отказ
       try
         if vADD=1 then
           EditID:=pkgFOR_ZAKAZ.CallFloatFunction('CancelAddZakaz',[0,EditID,0,vIS_AGENT,StartOfTheMonth(edDatePlan.Date),edClientNum.Text,
                  DateOf(edClientDat.Date),edNum.Text,DateOf(edDat.Date),DateOf(edBeginDate.Date),
                  cbFilial.KeyValue,cbPlat.keyValue,cbDog.KeyValue,
                  cbProd.KeyValue,cbUslOpl.KeyValue,cbVidOtgr.KeyValue,cbStan.KeyValue,
                  cbVetka.KeyValue,cbPoluch.KeyValue,cbPotreb.KeyValue,edPotreb.Text,
                  '',cbPayForm.KeyValue,cbPlanStru.KeyValue,edPriceClient.Value,
                  edPrice.Value,edVes.Value,edKol.Value,edSpeedVes.Value,edSpeedKol.Value,
                  edPrim.Text,edGR4.Text,cbGosprog.KeyValue,cbGpNapr.KeyValue,cbLukDog.KeyValue])
         else
           EditHistID:=pkgFOR_ZAKAZ.CallFloatFunction('CancelZakaz',[0,EditID,0,edClientNum.Text,
                  DateOf(edClientDat.Date),edNum.Text,DateOf(edDat.Date),DateOf(edBeginDate.Date),
                  edVes.Value,edKol.Value,edSpeedVes.Value,edSpeedKol.Value]);
         oraTSes.Commit;
         ModalResult:=mrOk;
       except
         on E:EOracleError do
           ShowMessage(E.Message);
       end;
 End;
end;

procedure Tf_ZakazNew.FormCreate(Sender: TObject);
begin
  f_db.LogonMasterSession(oraTSes);
  oraPlat.Open;
  oraDog.Open;
  oraLukDog.Open;
  oraGosprog.Open;
  oraGpNapr.Open;
  oraProd.Open;
  oraStan.Open;
  oraPayform.Open;
  oraUslOpl.Open;
  oraPotreb.Open;
  oraPoluch.Open;
  oraVidOtgr.Open;
  oraVetka.Open;
  oraFilial.Open;
  oraPlanStru.Open;
  ParentDover:=TForm(Owner);
  EditHistId:=0;
end;

procedure Tf_ZakazNew.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  oraTSes.Commit;
  oraTSes.Connected:=false;
end;

procedure Tf_ZakazNew.acExitExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure Tf_ZakazNew.cbDogChange(Sender: TObject);
begin
  inherited;
  cbUslOpl.Value:=oraUslOpl.fieldByName('ID').asString;
  cbLukDog.KeyValue:=oraLukDogID.AsInteger;
end;

procedure Tf_ZakazNew.FormActivate(Sender: TObject);
var q_Source:TOracleDataSet;
begin
  inherited;
  if vIS_AGENT=1 then
    q_Source:=Tf_Zakaz(ParentDover).q_Agent
  else
    q_Source:=Tf_Zakaz(ParentDover).q_Postav;

  q_status_zakaz.SQL[1]:='WHERE round(ID/10)*10='+IntToStr(vSTATUS_ZAKAZ);
  q_status_zakaz.Open;
  cbStatusZakaz.KeyValue:=vSTATUS_ZAKAZ;

  OldNum:='';
  edDat.Date:= date;
  OldDat:=DateOf(edDat.Date);
  OldClientNum:='';
  edClientDat.Date:= date;
  OldClientDat:=DateOf(edClientDat.Date);
  edDatePlan.Date:=StartOfTheMonth(Tf_Zakaz(ParentDover).edDateFrom.Date);
  edDatePlanChange(Sender);
  edBeginDate.Date:=StartOfTheMonth(Tf_Zakaz(ParentDover).edDateFrom.Date);
  cbFilial.KeyValue:=31;
  cbPayForm.KeyValue:=10;
  cbUslOpl.KeyValue:=1;
  cbVidOtgr.KeyValue:='МПС';
  cbVetka.KeyValue:=1;
  IF vIS_AGENT=2 then vIS_ACCEPT:=0 else vIS_ACCEPT:=1;
  vZakazPrevId:=varNull;
  LINK_ID:=0;
  LINK_HIST_ID:=0;

  if EditId<>0 then
  Begin
    OldPLAT_ID:=q_Source.FieldByName('PLAT_ID').AsInteger;
    LINK_ID:=q_Source.FieldByName('LINK_ID').AsInteger;
    LINK_HIST_ID:=q_Source.FieldByName('LINK_HIST_ID').AsInteger;

    if vSTATUS_ZAKAZ=30 then
    Begin
      edNum.Text:=q_Source.FieldByName('INPUT_NUMBER').AsString;
      OldNum:=edNum.Text;
      edDat.Date:=q_Source.FieldByName('INPUT_DATE').AsDateTime;
      OldDat:=DateOf(edDat.Date);
      edClientNum.Text:=q_Source.FieldByName('CLIENT_NUMBER').AsString;
      OldClientNum:=edClientNum.Text;
      edClientDat.Date:=q_Source.FieldByName('CLIENT_DATE').AsDateTime;
      OldClientDat:=DateOf(edClientDat.Date);
      vIS_ACCEPT:=q_Source.FieldByName('IS_ACCEPT').AsInteger;
      vZakazPrevId:=q_Source.FieldByName('ZAKAZ_PREV_ID').AsInteger;
    end;
    edDatePlan.Date:=q_Source.FieldByName('DATE_PLAN').AsDateTime;
    edDatePlanChange(sender);
    cbFilial.KeyValue:=q_Source.FieldByName('FILIAL_ID').AsInteger;
    cbPlat.KeyValue:=q_Source.FieldByName('PLAT_ID').AsInteger;
    cbDog.KeyValue:=q_Source.FieldByName('DOG_ID').AsInteger;
    cbLukDog.KeyValue:=q_Source.FieldByName('LUK_DOG_ID').AsInteger;
    IF VarType(cbLukDog.KeyValue)=VarNull then cbLukDog.KeyValue:=oraDogLUKDOG_ID.AsInteger;
    cbProd.KeyValue:=q_Source.FieldByName('PROD_ID_NPR').AsString;
    edVes.Value:=q_Source.FieldByName('VES').AsFloat;
    edKol.Value:=q_Source.FieldByName('KOL').AsFloat;
    edSpeedVes.Value:=q_Source.FieldByName('SPEED_VES').AsFloat;
    edSpeedKol.Value:=q_Source.FieldByName('SPEED_KOL').AsFloat;
    edPrice.Value:=q_Source.FieldByName('PRICE').AsFloat;
    edPriceClient.Value:=q_Source.FieldByName('PRICE_CLIENT').AsFloat;
    cbStan.KeyValue:=q_Source.FieldByName('STAN_ID').AsInteger;
    if VarIsNull(cbStan.KeyValue) then OldStanId:=0 else OldStanId:=cbStan.KeyValue;
    cbPayForm.KeyValue:=q_Source.FieldByName('PAYFORM_ID').AsInteger;
    cbUslOpl.KeyValue:=q_Source.FieldByName('USL_OPL_ID').AsInteger;
    cbVidOtgr.KeyValue:=q_Source.FieldByName('LOAD_ABBR').AsString;
    cbVetka.KeyValue:=q_Source.FieldByName('VETKA_ID').AsInteger;
    cbPoluch.KeyValue:=q_Source.FieldByName('POLUCH_ID').AsInteger;
    cbPotreb.KeyValue:=q_Source.FieldByName('POTREB_ID').AsInteger;
    edPotreb.Text:=q_Source.FieldByName('POTREB_NAME_DOP').AsString;
    cbPlanstru.KeyValue:=q_Source.FieldByName('PLANSTRU_ID').AsInteger;
    edPrim.Text:=q_Source.FieldByName('PRIM').AsString;
    edGR4.Text:=q_Source.FieldByName('GR4').AsString;
    edBeginDate.Date:=q_Source.FieldByName('BEGIN_DATE').AsDateTime;
    cbGosprog.KeyValue:=q_Source.FieldByName('GOSPROG_ID').AsInteger;
    cbGpNapr.KeyValue:=q_Source.FieldByName('GP_NAPR_ID').AsInteger;
  end;

  case vSTATUS_ZAKAZ of
    10: Begin
          Caption:='Первоначальный заказ клиента';
        end;
    30: begin
          Caption:='Корректировка заказа';
        end;
    40: begin
          Caption:='Переадресовка';
          if vAdd=0 then
          Begin
            cbFilial.Enabled:=false;
            cbPlat.Enabled:=false;
            cbDog.Enabled:=false;
            cbLukDog.Enabled:=false;
            cbProd.Enabled:=false;
            edDatePlan.Enabled:=false;
            edPrice.Enabled:=false;
            edPriceClient.Enabled:=false;
            cbPayForm.Enabled:=false;
            cbUslOpl.Enabled:=false;
            cbVidOtgr.Enabled:=false;
            cbVetka.Enabled:=false;
            cbPoluch.Enabled:=false;
            sbPoluch.Enabled:=false;
            cbPotreb.Enabled:=false;
            sbPotreb.Enabled:=false;
            edPotreb.Enabled:=false;
            cbGosprog.Enabled:=false;
            cbGpNapr.Enabled:=false;
            cbPlanStru.Enabled:=false;
            edGR4.Enabled:=false;
            cbProd.Enabled:=false;
            edVes.Enabled:=false;
            edKol.Enabled:=false;
            edSpeedVes.Enabled:=false;
            edSpeedKol.Enabled:=false;
          end;
        end;
    50: begin
          Caption:='Отказ клиента';
          if vAdd=0 then
          Begin
            cbFilial.Enabled:=false;
            cbPlat.Enabled:=false;
            cbDog.Enabled:=false;
            cbLukDog.Enabled:=false;
            cbProd.Enabled:=false;
            edDatePlan.Enabled:=false;
            edPrice.Enabled:=false;
            edPriceClient.Enabled:=false;
            cbStan.Enabled:=false;
            cbPayForm.Enabled:=false;
            cbUslOpl.Enabled:=false;
            cbVidOtgr.Enabled:=false;
            cbVetka.Enabled:=false;
            cbPoluch.Enabled:=false;
            sbPoluch.Enabled:=false;
            cbPotreb.Enabled:=false;
            sbPotreb.Enabled:=false;
            edPotreb.Enabled:=false;
            cbGosprog.Enabled:=false;
            cbGpNapr.Enabled:=false;
            cbPlanStru.Enabled:=false;
            edGR4.Enabled:=false;
          end;
        end;
  end;
  q_Source:=nil;
end;

procedure Tf_ZakazNew.acSeekPoluchExecute(Sender: TObject);
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

procedure Tf_ZakazNew.acSeekPotrebExecute(Sender: TObject);
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

procedure Tf_ZakazNew.cbPlanStruChange(Sender: TObject);
begin
  if oraPlanStru.FieldByName('REGION_ID').AsInteger=21 then
  begin
    // Архангельск
    cbFilial.KeyValue:=40;
  end
  else
  begin
    // Архангельск
    cbFilial.KeyValue:=31;
  end;
end;

procedure Tf_ZakazNew.edDatePlanChange(Sender: TObject);
begin
  oraLukDog.SetVariable('DATE_PLAN',StartOfTheMonth(edDatePlan.Date));
  f_db.ReQuery(oraLukDog,true);
  cbLukDog.KeyValue:=oraLukDogID.AsInteger;
  oraPlanStru.SetVariable('DATE_PLAN',StartOfTheMonth(edDatePlan.Date));
  f_db.ReQuery(oraPlanStru,true);
end;

procedure Tf_ZakazNew.edVesChange(Sender: TObject);
begin
  if (edVes.value>0) and (oraProd.fieldByName('normotgr').AsFloat>0) then
  Begin
    if edVes.value<oraProd.fieldByName('normotgr').AsFloat then
      edKol.Value:=1
    else
      edKol.Value:=Round(edVes.value/oraProd.fieldByName('normotgr').AsFloat);
  end;
end;

procedure Tf_ZakazNew.edSpeedVesChange(Sender: TObject);
begin
  if (edSpeedVes.value>0) and (oraProd.fieldByName('normotgr').AsFloat>0) then
  Begin
    if edSpeedVes.value<oraProd.fieldByName('normotgr').AsFloat then
      edSpeedKol.Value:=1
    else
      edSpeedKol.Value:=Round(edSpeedVes.value/oraProd.fieldByName('normotgr').AsFloat);
  end;
end;

procedure Tf_ZakazNew.edStanKodChange(Sender: TObject);
begin
  if edStanKod.Text<>'' then
  if oraStan.locate('STAN_KOD',edStanKod.Text,[]) then
    cbStan.KeyValue:=oraStan.FieldByName('ID').AsInteger;
end;

procedure Tf_ZakazNew.cbStanChange(Sender: TObject);
begin
  edStanKod.Text:=oraStan.FieldByName('STAN_KOD').AsString;
end;

procedure Tf_ZakazNew.acSeekPlatExecute(Sender: TObject);
begin
  KlsMisc2.SetKLSParam('KLS_PREDPR_PLAT','CHOOSE',fsNormal,VarToStr(cbPlat.KeyValue),'',true,0,0,'');

  with TF_KlsMisc.Create(Self) do
  begin
    if ShowModal=mrOk then
    begin
      cbPlat.KeyValue:=KlsMisc2.vIdToSeek;
    end;
    Free;
  end;
end;

procedure Tf_ZakazNew.oraDogAfterScroll(DataSet: TDataSet);
var newIS_AGENT:integer;
begin
  newIS_AGENT:=vIS_AGENT;
  IF (vAGENT_ID=8) and (cbDog.Value<>'0') THEN
    newIS_AGENT:=oraDogIS_AGENT.AsInteger;

  oraLukDog.SetVariable('IS_AGENT',newIS_AGENT);
  f_db.ReQuery(oraLukDog,false);
  oraLukDog.locate('IS_AGENT',newIS_AGENT,[]);
  cbLukDog.KeyValue:=oraLukDogID.AsInteger;
end;

procedure Tf_ZakazNew.cbDogExit(Sender: TObject);
begin
  oraDogAfterScroll(oraDog);
end;

end.
