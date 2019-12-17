unit ZakazHistNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, RxLookup, StdCtrls, ComCtrls, Mask,
  ToolEdit, CurrEdit, ActnList, Buttons, XPStyleActnCtrls, ActnMan,dateUtils,MdiForm,
  Placemnt, RXCtrls, DBCtrls, ExtCtrls, Grids, DBGridEh, DBGrids;

type
  Tf_ZakazHistNew = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    oraTSes: TOracleSession;
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
    oraEtran: TOracleDataSet;
    dsEtran: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    gbNum: TGroupBox;
    edBeginDate: TDateTimePicker;
    lbClient: TLabel;
    edClientNum: TEdit;
    edClientDat: TDateTimePicker;
    lbInput: TLabel;
    edNum: TEdit;
    edDat: TDateTimePicker;
    gbProd: TGroupBox;
    Label3: TLabel;
    cbProd: TRxDBLookupCombo;
    lbVesName: TLabel;
    edVes: TRxCalcEdit;
    Label21: TLabel;
    edKol: TRxCalcEdit;
    Label26: TLabel;
    lbSpeedName: TLabel;
    edSpeedVes: TRxCalcEdit;
    lbSpeedTN: TLabel;
    edSpeedKol: TRxCalcEdit;
    lbSpeedVC: TLabel;
    oraProdNORMOTGR: TFloatField;
    pkgFOR_ZAKAZ: TOraclePackage;
    Label29: TLabel;
    Label15: TLabel;
    edPrice: TRxCalcEdit;
    Label23: TLabel;
    GroupBox4: TGroupBox;
    Label4: TLabel;
    Label16: TLabel;
    DBText1: TDBText;
    Label10: TLabel;
    sbPoluch: TRxSpeedButton;
    DBText2: TDBText;
    Label11: TLabel;
    sbPotreb: TRxSpeedButton;
    DBText4: TDBText;
    edStanKod: TEdit;
    cbStan: TRxDBLookupCombo;
    cbPoluch: TRxDBLookupCombo;
    cbPotreb: TRxDBLookupCombo;
    Label1: TLabel;
    edEtran: TEdit;
    cbEtran: TRxDBLookupCombo;
    gbGrafik: TGroupBox;
    oraProdPROD_GU12_ID: TStringField;
    gridGrafik: TDBGridEh;
    oraGrafik: TOracleDataSet;
    dsGrafik: TDataSource;
    oraGrafikDATE_LOAD: TDateTimeField;
    oraGrafikTONN_LOAD: TFloatField;
    oraGrafikCIST_LOAD: TFloatField;
    Panel2: TPanel;
    Panel3: TPanel;
    edGrafik: TMonthCalendar;
    btAddGrafik: TSpeedButton;
    btDelGrafik: TSpeedButton;
    oraEtranID: TFloatField;
    oraEtranNOM_Z: TStringField;
    btGrafik: TButton;
    q_tmp: TOracleDataSet;
    Label2: TLabel;
    edFactVes: TRxCalcEdit;
    Label5: TLabel;
    edFactKol: TRxCalcEdit;
    Label6: TLabel;
    procedure acSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acExitExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure acSeekPoluchExecute(Sender: TObject);
    procedure acSeekPotrebExecute(Sender: TObject);
    procedure edVesChange(Sender: TObject);
    procedure edSpeedVesChange(Sender: TObject);
    procedure edStanKodChange(Sender: TObject);
    procedure cbStanChange(Sender: TObject);
    procedure cbProdChange(Sender: TObject);
    procedure edEtranChange(Sender: TObject);
    procedure cbEtranChange(Sender: TObject);
    procedure btAddGrafikClick(Sender: TObject);
    procedure btDelGrafikClick(Sender: TObject);
    procedure gridGrafikExit(Sender: TObject);
    procedure btGrafikClick(Sender: TObject);
    procedure edBeginDateChange(Sender: TObject);
    procedure edFactVesChange(Sender: TObject);
  private
    { Private declarations }
    OldNum:string;
    OldClientNum:string;
    OldDat:TDateTime;
    OldClientDat:TDateTime;
    LINK_ID:integer;
    LINK_HIST_ID:integer;
  public
    EditID:integer; // ID заказа
    EditHistID:integer; // ID позиции
    ParentDover:TForm;
    { Public declarations }
    vSTATUS_ZAKAZ:integer;
    vIS_AGENT:integer;
    vAGENT_ID:integer;
    vDATE_PLAN:TDateTime;
    vPLAT_ID:integer;
    vADD:integer;
    vNOM_ZD:string;
    vSORTBY:integer;
    vOnlyEtran:boolean;
  end;

var
  f_ZakazHistNew: Tf_ZakazHistNew;

implementation
uses KlsMisc2, ForDB, zakaz;

{$R *.dfm}

procedure Tf_ZakazHistNew.acSaveExecute(Sender: TObject);
begin
 if (cbProd.Value='0') then
 begin
   application.MessageBox('Не выбран продукт!', 'Не хватает реквизитов', mb_OK);
   exit;
 end;

 case vSTATUS_ZAKAZ of
   10: // Первоначальный заказ
       try
         if vADD=1 then
           EditHistID:=pkgFOR_ZAKAZ.CallFloatFunction('AddZakazHist',[0,0,0,0,EditID,vSTATUS_ZAKAZ,edClientNum.Text,
                  DateOf(edClientDat.Date),edNum.Text,DateOf(edDat.Date),
                  cbProd.KeyValue,0,cbStan.KeyValue,
                  cbPoluch.KeyValue,cbPotreb.KeyValue,
                  edPrice.Value,edVes.Value,edKol.Value,edSpeedVes.Value,edSpeedKol.Value,
                  '',0,0,0,0,0,DateOf(edBeginDate.Date),LINK_ID,LINK_HIST_ID])
         else
           EditHistID:=pkgFOR_ZAKAZ.CallFloatFunction('AddZakazHist',[0,EditHistId,0,vSORTBY,EditID,vSTATUS_ZAKAZ,edClientNum.Text,
                  DateOf(edClientDat.Date),edNum.Text,DateOf(edDat.Date),
                  cbProd.KeyValue,0,cbStan.KeyValue,
                  cbPoluch.KeyValue,cbPotreb.KeyValue,
                  edPrice.Value,edVes.Value,edKol.Value,edSpeedVes.Value,edSpeedKol.Value,
                  '',0,0,0,0,0,DateOf(edBeginDate.Date),LINK_ID,LINK_HIST_ID]);
         oraTSes.Commit;
         ModalResult:=mrOk;
       except
         on E:EOracleError do
           ShowMessage(E.Message);
       end;
   20: // К отгрузке
       try
         if vADD=1 then
           EditHistID:=pkgFOR_ZAKAZ.CallFloatFunction('ToLoadZakaz',[0,EditID,0,edNum.Text,DateOf(edDat.Date),DateOf(edBeginDate.Date),
                  cbProd.KeyValue,cbStan.KeyValue,
                  cbPoluch.KeyValue,cbPotreb.KeyValue,
                  edPrice.Value,'',edVes.Value,edKol.Value,edSpeedVes.Value,edSpeedKol.Value,edFactVes.Value,edFactKol.Value,
                  cbEtran.KeyValue])
         else
           EditHistID:=pkgFOR_ZAKAZ.CallFloatFunction('AddZakazHist',[0,EditHistId,0,vSORTBY,EditID,vSTATUS_ZAKAZ,edClientNum.Text,
                  DateOf(edClientDat.Date),edNum.Text,DateOf(edDat.Date),
                  cbProd.KeyValue,0,cbStan.KeyValue,
                  cbPoluch.KeyValue,cbPotreb.KeyValue,
                  edPrice.Value,0,0,edSpeedVes.Value,edSpeedKol.Value,
                  vNOM_ZD,edVes.Value,edKol.Value,edFactVes.Value,edFactKol.Value,cbEtran.KeyValue,DateOf(edBeginDate.Date),LINK_ID,LINK_HIST_ID]);
         pkgFOR_ZAKAZ.CallProcedure('SaveGrafik',[EditHistId]);
         oraTSes.Commit;
         ModalResult:=mrOk;
       except
         on E:EOracleError do
           ShowMessage(E.Message);
       end;
 End;
end;

procedure Tf_ZakazHistNew.FormCreate(Sender: TObject);
begin
  f_db.LogonMasterSession(oraTSes);
  oraProd.Open;
  oraStan.Open;
  oraPotreb.Open;
  oraPoluch.Open;
  ParentDover:=TForm(Owner);
  EditID:=0;
  EditHistId:=0;
  vOnlyEtran:=false;
end;

procedure Tf_ZakazHistNew.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  oraTSes.Commit;
  oraTSes.Connected:=false;
end;

procedure Tf_ZakazHistNew.acExitExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure Tf_ZakazHistNew.FormActivate(Sender: TObject);
var q_Source:TOracleDataSet;
    q_SourceHist:TOracleDataSet;
begin
  inherited;
  if vIS_AGENT=1 then
  Begin
    q_Source:=Tf_Zakaz(ParentDover).q_Agent;
    q_SourceHist:=Tf_Zakaz(ParentDover).q_AgentHist;
  end
  else
  Begin
    q_Source:=Tf_Zakaz(ParentDover).q_Postav;
    q_SourceHist:=Tf_Zakaz(ParentDover).q_PostavHist;
  end;

  OldNum:='';
  edDat.Date:= date;
  OldDat:=DateOf(edDat.Date);
  OldClientNum:='';
  edClientDat.Date:= date;
  OldClientDat:=DateOf(edClientDat.Date);
  edBeginDate.Date:=StartOfTheMonth(Tf_Zakaz(ParentDover).edDateFrom.Date);
  edGrafik.MultiSelect:=false;
  edGrafik.Date:=Date;
  edGrafik.MultiSelect:=true;
  LINK_ID:=0;
  LINK_HIST_ID:=0;

  if EditHistId<>0 then
  Begin
    LINK_ID:=q_SourceHist.FieldByName('LINK_ID').AsInteger;
    LINK_HIST_ID:=q_SourceHist.FieldByName('LINK_HIST_ID').AsInteger;
    edNum.Text:=q_SourceHist.FieldByName('INPUT_NUMBER').AsString;
    OldNum:=edNum.Text;
    edDat.Date:=q_SourceHist.FieldByName('INPUT_DATE').AsDateTime;
    OldDat:=DateOf(edDat.Date);
    edClientNum.Text:=q_SourceHist.FieldByName('CLIENT_NUMBER').AsString;
    OldClientNum:=edClientNum.Text;
    edClientDat.Date:=q_SourceHist.FieldByName('CLIENT_DATE').AsDateTime;
    OldClientDat:=DateOf(edClientDat.Date);
    cbProd.KeyValue:=q_SourceHist.FieldByName('PROD_ID_NPR').AsString;
    if vSTATUS_ZAKAZ=10 then
    Begin
      edVes.Value:=q_SourceHist.FieldByName('VES').AsFloat;
      edKol.Value:=q_SourceHist.FieldByName('KOL').AsFloat;
    end
    else
    Begin
      edVes.Value:=q_SourceHist.FieldByName('LOAD_VES').AsFloat;
      edKol.Value:=q_SourceHist.FieldByName('LOAD_KOL').AsFloat;
    End;
    edSpeedVes.Value:=q_SourceHist.FieldByName('SPEED_VES').AsFloat;
    edSpeedKol.Value:=q_SourceHist.FieldByName('SPEED_KOL').AsFloat;
    edFactVes.Value:=q_SourceHist.FieldByName('FACT_VES').AsFloat;
    edFactKol.Value:=q_SourceHist.FieldByName('FACT_KOL').AsFloat;
    edPrice.Value:=q_SourceHist.FieldByName('PRICE').AsFloat;
    cbStan.KeyValue:=q_SourceHist.FieldByName('STAN_ID').AsInteger;
    cbPoluch.KeyValue:=q_SourceHist.FieldByName('POLUCH_ID').AsInteger;
    cbPotreb.KeyValue:=q_SourceHist.FieldByName('POTREB_ID').AsInteger;
    edBeginDate.Date:=q_SourceHist.FieldByName('BEGIN_DATE').AsDateTime;
    oraEtran.SetVariable('ID',q_SourceHist.FieldByName('GU12_A_ID').AsInteger);
    oraEtran.SetVariable('PLAT_ID',vPLAT_ID);
    oraEtran.SetVariable('BEGIN_DATE',edBeginDate.Date);
    oraEtran.SetVariable('STAN_ID',cbStan.KeyValue);
    oraEtran.SetVariable('PROD_GU12_ID',oraProdPROD_GU12_ID.AsString);
    f_db.ReQuery(oraEtran,false);
    cbEtran.KeyValue:=q_SourceHist.FieldByName('GU12_A_ID').AsInteger;
  end
  else
    if vSTATUS_ZAKAZ=20 then
    Begin
      try
        edNum.Text:=IntToStr(pkgFOR_ZAKAZ.CallIntegerFunction('GetMaxNum',[EditID])+1);
      except
        edNum.Text:='1';
      end;
      edDat.Date:=date;
      edClientNum.Text:=q_Source.FieldByName('INPUT_NUMBER').AsString;
      edClientDat.Date:=q_Source.FieldByName('INPUT_DATE').AsDateTime;
      cbProd.KeyValue:=q_Source.FieldByName('PROD_ID_NPR').AsString;
      edVes.Value:=q_Source.FieldByName('VES').AsFloat-q_Source.FieldByName('LOAD_VES').AsFloat;
      edKol.Value:=q_Source.FieldByName('KOL').AsFloat-q_Source.FieldByName('LOAD_KOL').AsFloat;
      edSpeedVes.Value:=q_Source.FieldByName('SPEED_VES').AsFloat;
      edSpeedKol.Value:=q_Source.FieldByName('SPEED_KOL').AsFloat;
      edFactVes.Value:=0;
      edFactKol.Value:=0;
      edPrice.Value:=q_Source.FieldByName('PRICE').AsFloat;
      cbStan.KeyValue:=q_Source.FieldByName('STAN_ID').AsInteger;
      cbPoluch.KeyValue:=q_Source.FieldByName('POLUCH_ID').AsInteger;
      cbPotreb.KeyValue:=q_Source.FieldByName('POTREB_ID').AsInteger;
      oraEtran.SetVariable('ID',0);
      oraEtran.SetVariable('PLAT_ID',vPLAT_ID);
      oraEtran.SetVariable('BEGIN_DATE',edBeginDate.Date);
      oraEtran.SetVariable('STAN_ID',cbStan.KeyValue);
      oraEtran.SetVariable('PROD_GU12_ID',oraProdPROD_GU12_ID.AsString);
      f_db.ReQuery(oraEtran,false);
    End;

  if vSTATUS_ZAKAZ=20 then
  Begin
    pkgFOR_ZAKAZ.CallProcedure('FillGrafik',[EditHistID]);
  end;

  case vSTATUS_ZAKAZ of
    10: Begin
          Caption:='Первоначальный заказ клиента';
          edEtran.Enabled:=false;
          cbEtran.Enabled:=false;
          gbGrafik.Visible:=false;
          btGrafik.Visible:=false;
          lbClient.Caption:='Исходящий №';
          lbInput.Caption:='Входящий №';
          edFactKol.Visible:=false;
          edFactVes.Visible:=false;
        end;
    20: begin
          Caption:='К отгрузке';
          lbVesName.Caption:='К отгрузке';
          edClientNum.Enabled:=false;
          edClientDat.Enabled:=false;
          lbClient.Caption:='Входящий №';
          lbInput.Caption:='№ п/п';
        end;
  end;
  if vOnlyEtran then
  Begin
    edBeginDate.Enabled:=false;
    edClientNum.Enabled:=false;
    edClientDat.Enabled:=false;
    edNum.Enabled:=false;
    edDat.Enabled:=false;
    cbProd.Enabled:=false;
    edVes.Enabled:=false;
    edKol.Enabled:=false;
    edFactVes.Enabled:=false;
    edFactKol.Enabled:=false;
    edSpeedVes.Enabled:=false;
    edSpeedKol.Enabled:=false;
    edPrice.Enabled:=false;
    edStanKod.Enabled:=false;
    cbStan.Enabled:=false;
    cbPoluch.Enabled:=false;
    sbPoluch.Enabled:=false;
    cbPotreb.Enabled:=false;
    sbPotreb.Enabled:=false;
  End;
  q_Source:=nil;
  q_SourceHist:=nil;
  oraGrafik.Open;
end;

procedure Tf_ZakazHistNew.acSeekPoluchExecute(Sender: TObject);
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

procedure Tf_ZakazHistNew.acSeekPotrebExecute(Sender: TObject);
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

procedure Tf_ZakazHistNew.edVesChange(Sender: TObject);
begin
  if (edVes.value>0) and (oraProd.fieldByName('normotgr').AsFloat>0) then
  Begin
    if edVes.value<oraProd.fieldByName('normotgr').AsFloat then
      edKol.Value:=1
    else
      edKol.Value:=Round(edVes.value/oraProd.fieldByName('normotgr').AsFloat);
  end;
end;

procedure Tf_ZakazHistNew.edSpeedVesChange(Sender: TObject);
begin
  if (edSpeedVes.value>0) and (oraProd.fieldByName('normotgr').AsFloat>0) then
  Begin
    if edSpeedVes.value<oraProd.fieldByName('normotgr').AsFloat then
      edSpeedKol.Value:=1
    else
      edSpeedKol.Value:=Round(edSpeedVes.value/oraProd.fieldByName('normotgr').AsFloat);
  end;
end;

procedure Tf_ZakazHistNew.edStanKodChange(Sender: TObject);
begin
  if edStanKod.Text<>'' then
  if oraStan.locate('STAN_KOD',edStanKod.Text,[]) then
    cbStan.KeyValue:=oraStan.FieldByName('ID').AsInteger;
end;

procedure Tf_ZakazHistNew.cbStanChange(Sender: TObject);
begin
  edStanKod.Text:=oraStan.FieldByName('STAN_KOD').AsString;
  oraEtran.SetVariable('STAN_ID',oraStanID.AsString);
  f_db.ReQuery(oraEtran,true);
end;

procedure Tf_ZakazHistNew.cbProdChange(Sender: TObject);
begin
  oraEtran.SetVariable('PROD_GU12_ID',oraProdPROD_GU12_ID.AsString);
  f_db.ReQuery(oraEtran,true);
end;

procedure Tf_ZakazHistNew.edEtranChange(Sender: TObject);
begin
  if edEtran.Text<>'' then
  if oraEtran.locate('NOM_Z',edEtran.Text,[]) then
    cbEtran.KeyValue:=oraEtran.FieldByName('ID').AsInteger;
end;

procedure Tf_ZakazHistNew.cbEtranChange(Sender: TObject);
begin
  if (cbEtran.Value<>'') and
     (cbEtran.Value<>'0') and
     oraGrafik.Active then
  Begin
    edEtran.Text:=oraEtran.FieldByName('NOM_Z').AsString;
    btGrafikClick(Sender);
  End
  else
    edEtran.Text:='';
end;

procedure Tf_ZakazHistNew.btAddGrafikClick(Sender: TObject);
var i:integer;
begin
  with edGrafik do
  for i:=0 to Round(DateOf(EndDate)-DateOf(Date)) do
  Begin
    pkgFOR_ZAKAZ.CallProcedure('AddGrafik',[DateOf(Date+i),0,0]);
    f_db.ReQuery(oraGrafik,true);
  End;
end;

procedure Tf_ZakazHistNew.btDelGrafikClick(Sender: TObject);
begin
  if not oraGrafik.Eof then
  Begin
    pkgFOR_ZAKAZ.CallProcedure('DelGrafik',[oraGrafikDATE_LOAD.AsDateTime]);
    f_db.ReQuery(oraGrafik,true);
  End;
end;

procedure Tf_ZakazHistNew.gridGrafikExit(Sender: TObject);
begin
  if oraGrafik.State=dsEdit then oraGrafik.Post;
end;

procedure Tf_ZakazHistNew.btGrafikClick(Sender: TObject);
begin
    if MessageDlg('Заполнить график отгрузки из графика по плану перевозок?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      pkgFOR_ZAKAZ.CallProcedure('FillGrafikFromGU',[vPLAT_ID,oraProdPROD_GU12_ID.AsString,oraStanID.AsInteger,oraEtranID.AsInteger]);
      f_db.ReQuery(oraGrafik,true);
    end;
end;

procedure Tf_ZakazHistNew.edBeginDateChange(Sender: TObject);
begin
  oraEtran.SetVariable('BEGIN_DATE',edBeginDate.Date);
  f_db.ReQuery(oraEtran,true);
end;

procedure Tf_ZakazHistNew.edFactVesChange(Sender: TObject);
begin
  if (edFactVes.value>0) and (oraProd.fieldByName('normotgr').AsFloat>0) then
  Begin
    if edFactVes.value<oraProd.fieldByName('normotgr').AsFloat then
      edFactKol.Value:=1
    else
      edFactKol.Value:=Round(edFactVes.value/oraProd.fieldByName('normotgr').AsFloat);
  end;

end;

end.
