unit MO_ShabExpNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RxLookup, ComCtrls, ExtCtrls, Buttons;

type
  Tf_ShabExpNew = class(TForm)
    Button1: TButton;
    Button2: TButton;
    edCnt_ved: TEdit;
    edDocs1: TEdit;
    edDocs2: TEdit;
    edDocs3: TEdit;
    edDocs4: TEdit;
    edDog_prim: TEdit;
    edDorst1: TEdit;
    edDorst2: TEdit;
    edGr1_txt_ex: TEdit;
    edGr2_txt_ex: TEdit;
    edKod_tex_pd: TEdit;
    edNeob1: TEdit;
    edNeob2: TEdit;
    edNeob3: TEdit;
    edNeob4: TEdit;
    edNm_gr1: TEdit;
    edNm_gr2: TEdit;
    edNm_gr3: TEdit;
    edNm_gr4: TEdit;
    edNm_gr5: TEdit;
    edNm_gr6: TEdit;
    edNm_gr7: TEdit;
    edNm_gr8: TEdit;
    edNm_gr9: TEdit;
    edOsob1: TEdit;
    edOsob2: TEdit;
    edOsob3: TEdit;
    edOsob4: TEdit;
    edPlt_ot1: TEdit;
    edPlt_ot2: TEdit;
    edPlt_ot3: TEdit;
    edPlt_ot4: TEdit;
    edPol1: TEdit;
    edPol2: TEdit;
    edPol3: TEdit;
    edPol4: TEdit;
    edPos33: TEdit;
    edPos34: TEdit;
    edPos35: TEdit;
    edPos36: TEdit;
    edShtamp1: TEdit;
    edShtamp2: TEdit;
    edShtamp3: TEdit;
    edShtamp4: TEdit;
    edShtamp5: TEdit;
    edStan_kod: TEdit;
    edStan1: TEdit;
    edStan2: TEdit;
    edStan3: TEdit;
    edStan4: TEdit;
    edTam1: TEdit;
    edTam2: TEdit;
    GroupBox1: TGroupBox;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    GroupBox12: TGroupBox;
    GroupBox13: TGroupBox;
    GroupBox14: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label4: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label5: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lcDog_number: TRxDBLookupCombo;
    lcProd: TRxDBLookupCombo;
    lcStan: TRxDBLookupCombo;
    lcTex_pd: TRxDBLookupCombo;
    PageControl1: TPageControl;
    Panel1: TPanel;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    edMesto_pay: TEdit;
    btnFindTex_pd: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure edStan_kodChange(Sender: TObject);
    procedure lcStanChange(Sender: TObject);
    procedure edKod_tex_pdChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnFindTex_pdClick(Sender: TObject);
  private
    { Private declarations }
    procedure FillShabFields;
  public
    { Public declarations }
    EditId:double;
    EditMode:byte;
  end;

var
  f_ShabExpNew: Tf_ShabExpNew;

implementation
{$R *.dfm}
uses MO_ShabExp,DB,ForSESS,main,KlsMisc2;
var ParentForm:Tf_ShabExp;

procedure Tf_ShabExpNew.FillShabFields;
begin
    lcDog_number.KeyValue:=ParentForm.q_gridDOG_ID.Value;
    lcProd.KeyValue:=ParentForm.q_gridPROD_ID_NPR.Value;
    lcStan.KeyValue:=ParentForm.q_gridSTAN_ID.Value;
    lcTex_pd.KeyValue:=ParentForm.q_gridTEX_PD_ID.Value;
    edMesto_pay.Text:=ParentForm.q_gridMESTO_PAY.AsString;
//    cbDostup.Checked:=(ParentForm.q_gridFLG_DOSTUP.AsInteger=1);
    edCnt_ved.Text:=ParentForm.q_gridCNT_VED.AsString;
    edDocs1.Text:=ParentForm.q_gridDOCS1.AsString;
    edDocs2.Text:=ParentForm.q_gridDOCS2.AsString;
    edDocs3.Text:=ParentForm.q_gridDOCS3.AsString;
    edDocs4.Text:=ParentForm.q_gridDOCS4.AsString;
    edDog_prim.Text:=ParentForm.q_gridPRIM_DOG.AsString;
    edDorst1.Text:=ParentForm.q_gridDORST1.AsString;
    edDorst2.Text:=ParentForm.q_gridDORST2.AsString;
    edGr1_txt_ex.Text:=ParentForm.q_gridGR1_TXT_EX.AsString;
    edGr2_txt_ex.Text:=ParentForm.q_gridGR2_TXT_EX.AsString;
    edNeob1.Text:=ParentForm.q_gridNEOB1.AsString;
    edNeob2.Text:=ParentForm.q_gridNeob2.AsString;
    edNeob3.Text:=ParentForm.q_gridNEOB3.AsString;
    edNeob4.Text:=ParentForm.q_gridNEOB4.AsString;
    edNm_gr1.Text:=ParentForm.q_gridNM_GR1.AsString;
    edNm_gr2.Text:=ParentForm.q_gridNM_GR2.AsString;
    edNm_gr3.Text:=ParentForm.q_gridNM_GR3.AsString;
    edNm_gr4.Text:=ParentForm.q_gridNM_GR4.AsString;
    edNm_gr5.Text:=ParentForm.q_gridNM_GR5.AsString;
    edNm_gr6.Text:=ParentForm.q_gridNM_GR6.AsString;
    edNm_gr7.Text:=ParentForm.q_gridNM_GR7.AsString;
    edNm_gr8.Text:=ParentForm.q_gridNM_GR8.AsString;
    edNm_gr9.Text:=ParentForm.q_gridNM_GR9.AsString;
    edOsob1.Text:=ParentForm.q_gridOSOB1.AsString;
    edOsob2.Text:=ParentForm.q_gridOSOB2.AsString;
    edOsob3.Text:=ParentForm.q_gridOSOB3.AsString;
    edOsob4.Text:=ParentForm.q_gridOSOB4.AsString;
    edPlt_ot1.Text:=ParentForm.q_gridPLT_OT1.AsString;
    edPlt_ot2.Text:=ParentForm.q_gridPLT_OT2.AsString;
    edPlt_ot3.Text:=ParentForm.q_gridPLT_OT3.AsString;
    edPlt_ot4.Text:=ParentForm.q_gridPLT_OT4.AsString;
    edPol1.Text:=ParentForm.q_gridPOL1.AsString;
    edPol2.Text:=ParentForm.q_gridPOL2.AsString;
    edPol3.Text:=ParentForm.q_gridPOL3.AsString;
    edPol4.Text:=ParentForm.q_gridPOL4.AsString;
    edPos33.Text:=ParentForm.q_gridPOS33.AsString;
    edPos34.Text:=ParentForm.q_gridPOS34.AsString;
    edPos35.Text:=ParentForm.q_gridPOS35.AsString;
    edPos36.Text:=ParentForm.q_gridPOS36.AsString;
    edShtamp1.Text:=ParentForm.q_gridSHTAMP1.AsString;
    edShtamp2.Text:=ParentForm.q_gridSHTAMP2.AsString;
    edShtamp3.Text:=ParentForm.q_gridSHTAMP3.AsString;
    edShtamp4.Text:=ParentForm.q_gridSHTAMP4.AsString;
    edShtamp5.Text:=ParentForm.q_gridSHTAMP5.AsString;
    edStan1.Text:=ParentForm.q_gridSTAN1.AsString;
    edStan2.Text:=ParentForm.q_gridSTAN2.AsString;
    edStan3.Text:=ParentForm.q_gridSTAN3.AsString;
    edStan4.Text:=ParentForm.q_gridSTAN4.AsString;
    edTam1.Text:=ParentForm.q_gridTAM1.AsString;
    edTam2.Text:=ParentForm.q_gridTAM2.AsString;
end;

procedure Tf_ShabExpNew.FormActivate(Sender: TObject);
begin
  ParentForm:=Tf_ShabExp(owner);
//Редактирование
  if EditMode=1 then
  begin
      FillShabFields;
  end;
//копирование
  if EditMode=2 then
  begin
      FillShabFields;
  end;

end;

procedure Tf_ShabExpNew.edStan_kodChange(Sender: TObject);
begin
  if edStan_kod.Text<>'' then
  if ParentForm.q_Stan.Locate('STAN_KOD',Trim(edStan_kod.Text),[]) then
  begin
    lcStan.KeyValue:=ParentForm.q_Stan.FieldByName('ID').Value;
  end;
end;

procedure Tf_ShabExpNew.lcStanChange(Sender: TObject);
begin
  if lcStan.KeyValue<>lcStan.EmptyValue then
  if ParentForm.q_Stan.Locate('ID',lcStan.KeyValue,[]) then
  begin
    edDorst1.Text:='СТ. '+AnsiUpperCase(ParentForm.q_Stan.FieldByName('stan_name').AsString)+' '+
                    AnsiUpperCase(ParentForm.q_Stan.FieldByName('gdor_name').AsString)+' '+' Ж.Д.';
    edDorst2.Text:=AnsiUpperCase(ParentForm.q_Stan.FieldByName('state_name').AsString)
  end;

end;

procedure Tf_ShabExpNew.edKod_tex_pdChange(Sender: TObject);
begin
  if edKod_tex_pd.Text<>'' then
  if ParentForm.q_Tex_pd.Locate('ID',Trim(edKod_tex_pd.Text),[]) then
  begin
    lcTex_pd.KeyValue:=ParentForm.q_Tex_pd.FieldByName('ID').Value;
  end;
end;

procedure Tf_ShabExpNew.Button2Click(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure Tf_ShabExpNew.Button1Click(Sender: TObject);
var
  vId:double;
  pTex_pd,pDog_id,pProd_id_npr,pStan_id:variant;
begin

  if ParentForm.q_tex_pd.Locate('id',lcTex_pd.KeyValue,[]) then
    ptex_pd:=ParentForm.q_tex_pd.FieldByName('id').AsVariant
  else pTex_pd:=null;
  if pTex_pd=0 then pTex_pd:=null;
  if ParentForm.q_prod.Locate('id_npr',lcProd.KeyValue,[]) then
    pProd_id_npr:=ParentForm.q_prod.FieldByName('id_npr').AsVariant
  else pProd_id_npr:=null;
  if ParentForm.q_dog.Locate('id',lcDog_number.KeyValue,[]) then
    pDog_id:=ParentForm.q_dog.FieldByName('id').AsVariant
  else pDog_id:=null;
  if ParentForm.q_stan.Locate('id',lcStan.KeyValue,[]) then
    pStan_id:=ParentForm.q_stan.FieldByName('id').AsVariant
  else pStan_id:=null;


  {FUNCTION AddShabExp(pCommit NUMBER,pId NUMBER,pFlg_dostup NUMBER,pDog_id NUMBER,pProd_id_npr VARCHAR2,
		 			pStan_id NUMBER,pPrim_dog VARCHAR2,
		 			pOsob1 VARCHAR2,pOsob2 VARCHAR2,pOsob3 VARCHAR2,pOsob4 VARCHAR2,pPol1 VARCHAR2,pPol2 VARCHAR2,
					pPol3 VARCHAR2,pPol4 VARCHAR2,pNeob1 VARCHAR2,pNeob2 VARCHAR2,pNeob3 VARCHAR2,pNeob4 VARCHAR2,
					pStan1 VARCHAR2,pStan2 VARCHAR2,pStan3 VARCHAR2,pStan4 VARCHAR2,pDorst1 VARCHAR2,pDorst2 VARCHAR2,
					pNm_gr1 VARCHAR2,pNm_gr2 VARCHAR2,pNm_gr3 VARCHAR2,pNm_gr4 VARCHAR2,pNm_gr5 VARCHAR2,pNm_gr6 VARCHAR2,
					pNm_gr7 VARCHAR2,pNm_gr8 VARCHAR2,pNm_gr9 VARCHAR2,pPlt_ot1 VARCHAR2,pPlt_ot2 VARCHAR2,pPlt_ot3 VARCHAR2,
					pPlt_ot4 VARCHAR2,pDocs1 VARCHAR2,pDocs2 VARCHAR2,pDocs3 VARCHAR2,pDocs4 VARCHAR2,pTam1 VARCHAR2,
					pTam2 VARCHAR2,pPos33 VARCHAR2,pPos34 VARCHAR2,pPos35 VARCHAR2,pPos36 VARCHAR2,pShtamp1 VARCHAR2,
					pShtamp2 VARCHAR2,pShtamp3 VARCHAR2,pShtamp4 VARCHAR2,pShtamp5 VARCHAR2,pGr1_txt_ex VARCHAR2,pGr2_txt_ex VARCHAR2,
					pMesto_pay VARCHAR2,pCnt_ved NUMBER,pTex_pd_id NUMBER) RETURN NUMBER;}
  try
    EditId:=ParentForm.pkgFor_nakl.CallFloatFunction('AddShabExp',
      [1,EditId,1,pDog_id,pProd_id_npr,pStan_id,edDog_prim.Text,edOsob1.text,
      edOsob2.text,edOsob3.text,edOsob4.text,edPol1.text,edPol2.text,edPol3.text,edPol4.text,
      edNeob1.text,edNeob2.text,edNeob3.text,edNeob4.text,edStan1.text,edStan2.text,edStan3.text,edStan4.text,
      edDorst1.text,edDorst2.text,edNm_gr1.text,edNm_gr2.text,edNm_gr3.text,edNm_gr4.text,edNm_gr5.text,
      edNm_gr6.text,edNm_gr7.text,edNm_gr8.text,edNm_gr9.text,edPlt_ot1.text,edPlt_ot2.text,edPlt_ot3.text,
      edPlt_ot4.text,edDocs1.text,edDocs2.text,edDocs3.text,edDocs4.text,edTam1.text,edTam2.text,edPos33.text,
      edPos34.text,edPos35.text,edPos36.text,edShtamp1.text,edShtamp2.text,edShtamp3.text,edShtamp4.text,
      edShtamp5.text,edGr1_txt_ex.text,edGr2_txt_ex.text,edMesto_pay.text,edCnt_ved.text,pTex_pd]);
  except
    on E: Exception do
    Begin
      // Отобразим ошибку
      f_main.ApplSession.WriteToLog(amFull,'MO_ShabExpNew',sesError,E.Message,0,'');
      ParentForm.ora_session.Rollback;
      exit;
    end;
  End;

  ModalResult:=mrOk;

end;

procedure Tf_ShabExpNew.btnFindTex_pdClick(Sender: TObject);
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

end.
