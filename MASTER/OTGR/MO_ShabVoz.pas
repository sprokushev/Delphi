unit MO_ShabVoz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ToolEdit, RxLookup, Mask, DBCtrlsEh, DB,
  OracleData,DateUtils;

type
  Tf_ShabVozNew = class(TForm)
    GroupBox1: TGroupBox;
    edShab_date: TDBDateTimeEditEh;
    Label2: TLabel;
    edShab_num: TEdit;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    edTex_pd_bank: TEdit;
    edTex_pd_rs: TEdit;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    edBank_otpr: TEdit;
    Label9: TLabel;
    edRs_otpr: TEdit;
    edKod_stan_otpr: TEdit;
    Label10: TLabel;
    btnFindTex_pd: TSpeedButton;
    btnFindGr_otp: TSpeedButton;
    GroupBox4: TGroupBox;
    Label11: TLabel;
    SpeedButton1: TSpeedButton;
    Label13: TLabel;
    GroupBox5: TGroupBox;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edGR4: TEdit;
    Label19: TLabel;
    edTransport: TEdit;
    Label20: TLabel;
    Label21: TLabel;
    edPrim: TEdit;
    Label22: TLabel;
    IsExp: TCheckBox;
    q_tex_pd: TOracleDataSet;
    ds_tex_pd: TDataSource;
    ds_predpr: TDataSource;
    q_predpr: TOracleDataSet;
    edKod_otpr: TEdit;
    Label23: TLabel;
    lcTex_pd: TRxDBLookupCombo;
    lcOtpr: TRxDBLookupCombo;
    lcStan_otpr: TRxDBLookupCombo;
    q_stan: TOracleDataSet;
    ds_stan: TDataSource;
    lcPoluch: TRxDBLookupCombo;
    edKod_poluch: TEdit;
    Label4: TLabel;
    edKod_stan_poluch: TEdit;
    lcStan_poluch: TRxDBLookupCombo;
    q_vetka: TOracleDataSet;
    ds_vetka: TDataSource;
    lcVetka: TRxDBLookupCombo;
    q_prod: TOracleDataSet;
    ds_prod: TDataSource;
    ds_forma2: TDataSource;
    q_forma2: TOracleDataSet;
    q_k_tar: TOracleDataSet;
    ds_k_tar: TDataSource;
    Label7: TLabel;
    lcGu12_a: TRxDBLookupCombo;
    lcForma_2: TRxDBLookupCombo;
    lcK_tar: TRxDBLookupCombo;
    q_gu12a: TOracleDataSet;
    ds_gu12a: TDataSource;
    lcProd: TRxDBLookupCombo;
    lcExped: TRxDBLookupCombo;
    q_exped: TOracleDataSet;
    ds_exped: TDataSource;
    ds_otpr: TDataSource;
    q_otpr: TOracleDataSet;
    Button1: TButton;
    Button2: TButton;
    Label12: TLabel;
    edVzisk: TMaskEdit;
    procedure lcTex_pdChange(Sender: TObject);
    procedure edKod_otprChange(Sender: TObject);
    procedure edKod_stan_otprChange(Sender: TObject);
    procedure lcOtprChange(Sender: TObject);
    procedure edKod_poluchChange(Sender: TObject);
    procedure edKod_stan_poluchChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnFindTex_pdClick(Sender: TObject);
    procedure btnFindGr_otpClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_ShabVozNew: Tf_ShabVozNew;

implementation
{$R *.dfm}
uses ForSESS, main,KlsMisc2,MO_NaklVozNew;
var ParentForm:Tf_naklVozNew;

procedure Tf_ShabVozNew.lcTex_pdChange(Sender: TObject);
begin
  if q_tex_pd.Locate('tex_pd_id',lcTex_pd.KeyValue,[]) then
  begin
    edTex_pd_bank.Text:=q_tex_pd.FieldByName('tex_pd_bank').AsString;
    edTex_pd_rs.Text:=q_tex_pd.FieldByName('tex_pd_rs').AsString;
  end;
end;

procedure Tf_ShabVozNew.edKod_otprChange(Sender: TObject);
begin
  if edKod_otpr.Text<>'' then
  if q_predpr.locate('GD_KOD',Trim(edKod_otpr.Text),[]) then
    lcOtpr.KeyValue:=q_predpr.FieldByName('ID').Value;
end;

procedure Tf_ShabVozNew.edKod_stan_otprChange(Sender: TObject);
begin
  if edKod_stan_otpr.Text<>'' then
  if q_stan.locate('STAN_KOD',StrToInt(edKod_stan_otpr.Text),[]) then
    lcStan_otpr.KeyValue:=q_stan.FieldByName('ID').Value;
end;

procedure Tf_ShabVozNew.lcOtprChange(Sender: TObject);
begin
  if q_predpr.Locate('id',lcOtpr.KeyValue,[]) then
  begin
    edBank_otpr.Text:=q_predpr.FieldByName('bank_name').AsString;
    edRS_otpr.Text:=q_predpr.FieldByName('rs').AsString;
  end;
end;

procedure Tf_ShabVozNew.edKod_poluchChange(Sender: TObject);
begin
  if edKod_poluch.Text<>'' then
  if q_predpr.locate('GD_KOD',Trim(edKod_poluch.Text),[]) then
    lcPoluch.KeyValue:=q_predpr.FieldByName('ID').Value;
end;

procedure Tf_ShabVozNew.edKod_stan_poluchChange(Sender: TObject);
begin
  if edKod_stan_poluch.Text<>'' then
  if q_stan.locate('STAN_KOD',StrToInt(edKod_stan_poluch.Text),[]) then
    lcStan_poluch.KeyValue:=q_stan.FieldByName('ID').Value;
end;

procedure Tf_ShabVozNew.FormActivate(Sender: TObject);
begin
ParentForm:=Tf_naklVozNew(owner);
q_tex_pd.Open;
q_stan.Open;
q_predpr.Open;
q_vetka.Open;
q_exped.Open;
q_K_tar.Open;
q_prod.Open;
q_gu12a.Open;
q_forma2.Open;
q_otpr.Open;
edShab_num.Text:=ParentForm.pkgFor_nakl_voz.CallFloatFunction('get_next_num',[]);
edShab_date.Value:=DateOf(now);
end;

procedure Tf_ShabVozNew.btnFindTex_pdClick(Sender: TObject);
begin
  KlsMisc2.SetKLSParam('KLS_TEX_PD','CHOOSE',fsNormal,VarToStr(lcTex_pd.KeyValue),'',true,0,0,'');
  with TF_KlsMisc.Create(Self) do
  begin
    if ShowModal=mrOk then
    begin
      lcTex_pd.KeyValue:=KlsMisc2.vIdToSeek;
    end;
    Free;
  end;
end;

procedure Tf_ShabVozNew.btnFindGr_otpClick(Sender: TObject);
begin
  KlsMisc2.SetKLSParam('KLS_PREDPR_OTPR','CHOOSE',fsNormal,VarToStr(lcOtpr.KeyValue),'',true,0,0,'');
  with TF_KlsMisc.Create(Self) do
  begin
    if ShowModal=mrOk then
    begin
      lcOtpr.KeyValue:=KlsMisc2.vIdToSeek;
    end;
    Free;
  end;
end;

procedure Tf_ShabVozNew.SpeedButton1Click(Sender: TObject);
begin
  KlsMisc2.SetKLSParam('KLS_PREDPR','CHOOSE',fsNormal,VarToStr(lcPoluch.KeyValue),'',true,0,0,'');
  with TF_KlsMisc.Create(Self) do
  begin
    if ShowModal=mrOk then
    begin
      lcPoluch.KeyValue:=KlsMisc2.vIdToSeek;
    end;
    Free;
  end;
end;

procedure Tf_ShabVozNew.Button1Click(Sender: TObject);
var
  vId:double;
  pTex_pd,pVzisk:variant;
begin
  if edShab_num.Text=EmptyStr then
  begin
    application.MessageBox('№ шаблона не должен быть пустым!','Ошибка!');
    exit;
  end;
  if edShab_date.Value=Null then
  begin
    application.MessageBox('Дата шаблона не должна быть пустой!','Ошибка!');
    exit;
  end;
{FUNCTION AddShabVoz(pCommit NUMBER,pId NUMBER,pStanotp_id NUMBER,pTex_pd_id NUMBER,pGrotp_id NUMBER,
		  			 pStan_id NUMBER,pVetka_id NUMBER,pPoluch_id NUMBER,pFlg_forma_2 NUMBER,
		   					 pProd_id_npr VARCHAR2,pPrim VARCHAR2,pGr4 VARCHAR2,pK_tar VARCHAR2,pInput_date DATE,
							 pTransport VARCHAR2,pIs_exp NUMBER,pExped_id NUMBER,pGu12_a_id NUMBER,pVzisk_id NUMBER,
							 pGrotp_bank VARCHAR2,pGrotp_rs VARCHAR2,pTex_pd_bank VARCHAR2,pTtex_pd_rs VARCHAR2,pShab_num NUMBER,
							 pShab_date DATE)}

  if q_tex_pd.Locate('tex_pd_id',lcTex_pd.KeyValue,[]) then
    ptex_pd:=q_tex_pd.FieldByNAme('id').AsVariant
  else pTex_pd:=null;
  if edVzisk.Text='' then
    pVzisk:=null
  else
    pVzisk:=edVzisk.Text;
  try
    vId:=ParentForm.pkgFor_nakl_voz.CallFloatFunction('AddShabVoz',
      [1,'',lcStan_otpr.KeyValue,pTex_pd,lcOtpr.KeyValue,lcStan_poluch.KeyValue,
      lcVetka.KeyValue,lcPoluch.KeyValue,lcForma_2.KeyValue,lcProd.KeyValue,Trim(edPrim.Text),
      edGr4.Text,lcK_tar.KeyValue,DateOf(now),Trim(edTransport.Text),ord(IsExp.Checked),lcExped.KeyValue,
      lcGU12_a.KeyValue,pVzisk,Trim(edBank_otpr.Text),Trim(edRS_otpr.Text),Trim(edTex_pd_bank.Text),
      Trim(edTex_pd_rs.Text),Trim(edShab_num.Text),edShab_date.Value]);
  except
    on E: Exception do
    Begin
      // Отобразим ошибку
      f_main.ApplSession.WriteToLog(amFull,'MO_ShabVoz',sesError,E.Message,0,'');
      ParentForm.pkgFor_nakl_voz.Session.Rollback;
      exit;
    end;
  End;
  ModalResult:=mrOk;
end;

procedure Tf_ShabVozNew.Button2Click(Sender: TObject);
begin
  ModalResult:=mrCancel
end;

end.
