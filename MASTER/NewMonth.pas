unit NewMonth;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, ActnList, XPStyleActnCtrls, ActnMan,
  StdCtrls, Buttons, Mask, ToolEdit, RxLookup, CurrEdit, Grids, DBGridEh,
  DBCtrls, DB, OracleData, RXCtrls, RXSpin, DateUtils, math, GridsEh;

type
  Tf_NewMonth = class(TForm)
    pageTabs: TPageControl;
    tabStart: TTabSheet;
    tabDop: TTabSheet;
    tabPlan: TTabSheet;
    tabFinish: TTabSheet;
    Panel1: TPanel;
    btNext1: TBitBtn;
    ActionManager1: TActionManager;
    acNewMonth_Next: TAction;
    acNewMonth_Finish: TAction;
    acNewMonth_Cancel: TAction;
    btCancel1: TBitBtn;
    acNewMonth_Back: TAction;
    Panel3: TPanel;
    btNext5: TBitBtn;
    btPrev5: TBitBtn;
    btCancel5: TBitBtn;
    Panel4: TPanel;
    btNext3: TBitBtn;
    btPrev3: TBitBtn;
    btCancel3: TBitBtn;
    Panel5: TPanel;
    btFinish6: TBitBtn;
    btPrev6: TBitBtn;
    btCancel6: TBitBtn;
    tabUslDog: TTabSheet;
    Panel6: TPanel;
    btNext2: TBitBtn;
    btPrev2: TBitBtn;
    btCancel2: TBitBtn;
    Splitter1: TSplitter;
    PanelR3: TPanel;
    PanelNPO: TPanel;
    rb_Russian: TRadioButton;
    rb_Export: TRadioButton;
    lc_Load_Abbr: TRxDBLookupCombo;
    lc_Prod: TRxDBLookupCombo;
    ed_LukDog: TComboEdit;
    ed_Dog: TComboEdit;
    ed_Plat: TComboEdit;
    ed_GrOtp: TComboEdit;
    ed_StanOtp: TComboEdit;
    ed_StanOtpKod: TEdit;
    ed_Stan: TComboEdit;
    ed_StanKod: TEdit;
    ed_Poluch: TComboEdit;
    ed_Potreb: TComboEdit;
    ed_Vetka: TComboEdit;
    gb_GD: TGroupBox;
    Label29: TLabel;
    ed_TEX_PD: TEdit;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    ed_K_TAR: TEdit;
    ed_Transp: TEdit;
    lc_Forma2: TRxDBLookupCombo;
    ed_Tarif1Tonn: TRxCalcEdit;
    ed_Prim: TEdit;
    ed_Gr4: TEdit;
    rb_8_axis: TRadioGroup;
    rb_Sliv_V: TRadioGroup;
    rb_Obogr: TRadioGroup;
    ds_UslDog: TDataSource;
    Panel10: TPanel;
    Label51: TLabel;
    DBText3: TDBText;
    Label52: TLabel;
    DBText4: TDBText;
    GroupBox1: TGroupBox;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    btRefreshUsl: TRxSpeedButton;
    cb_Baz: TCheckBox;
    cb_Utv: TCheckBox;
    cb_Akt: TCheckBox;
    ed_BeginDate_flt: TDateTimePicker;
    ed_EndDate_flt: TDateTimePicker;
    ed_KolDn_flt: TRxCalcEdit;
    ed_CatCen_flt: TRxCalcEdit;
    ed_Strah_flt: TRxCalcEdit;
    ed_SumUsl_flt: TRxCalcEdit;
    gridUsl: TDBGridEh;
    q_Prices: TOracleDataSet;
    ds_Prices: TDataSource;
    q_PricesID: TIntegerField;
    q_PricesCAT_CEN_ID: TIntegerField;
    q_PricesLONG_NAME_NPR: TStringField;
    q_PricesBEGIN_DATE: TDateTimeField;
    q_PricesCENA: TFloatField;
    q_PricesCENA_OTP: TFloatField;
    Panel15: TPanel;
    gb_Gosprog: TGroupBox;
    Label37: TLabel;
    lc_Gosprog: TRxDBLookupCombo;
    q_UslDog: TOracleDataSet;
    Label41: TLabel;
    lc_CatCenGrp: TRxDBLookupCombo;
    tabPrices: TTabSheet;
    rb_SourceNPR: TRadioGroup;
    Panel13: TPanel;
    gb_Sobstv: TGroupBox;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    lc_Nazn_Otg: TRxDBLookupCombo;
    ed_Owner: TComboEdit;
    ed_Post: TComboEdit;
    gb_Price: TGroupBox;
    Panel11: TPanel;
    Label42: TLabel;
    DBText5: TDBText;
    Label59: TLabel;
    DBText6: TDBText;
    gridPrices: TDBGridEh;
    Panel2: TPanel;
    btNext4: TBitBtn;
    btPrev4: TBitBtn;
    btCancel4: TBitBtn;
    gb_Summary: TGroupBox;
    Panel9: TPanel;
    Label1: TLabel;
    ed_ves: TRxCalcEdit;
    Label19: TLabel;
    DBText1: TDBText;
    Label15: TLabel;
    Label20: TLabel;
    ed_Nom_zd: TEdit;
    btAutoGen: TButton;
    lb_Summary: TListBox;
    Panel12: TPanel;
    Label36: TLabel;
    cbMonth: TComboBox;
    edYear: TRxSpinEdit;
    gridPlanStru: TDBGridEh;
    Label21: TLabel;
    DBText2: TDBText;
    Label22: TLabel;
    DBText7: TDBText;
    ds_Prod: TDataSource;
    q_Prod: TOracleDataSet;
    q_ProdID_NPR: TStringField;
    q_ProdNAME_NPR: TStringField;
    Label23: TLabel;
    DBText8: TDBText;
    gridPlanPost: TDBGridEh;
    acEnterTab: TAction;
    q_NewMonth: TOracleDataSet;
    q_R3_Price: TOracleDataSet;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    ds_NewMonth: TDataSource;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    ed_PriceR3: TDBEdit;
    ds_R3_Price: TDataSource;
    ds_R3_Strah: TDataSource;
    q_R3_Strah: TOracleDataSet;
    q_Load_Abbr: TOracleDataSet;
    ds_Load_Abbr: TDataSource;
    q_Predpr: TOracleDataSet;
    q_Vetka: TOracleDataSet;
    q_PredprID: TIntegerField;
    q_PredprPREDPR_NAME: TStringField;
    q_PredprSHORT_NAME: TStringField;
    q_PredprINN: TStringField;
    q_PredprOKPO: TStringField;
    q_PredprGD_KOD: TStringField;
    q_VetkaVETKA_NAME: TStringField;
    q_VetkaID: TIntegerField;
    q_Load_AbbrLOAD_ABBR: TStringField;
    q_Load_AbbrLOAD_NAME: TStringField;
    q_Load_AbbrLOAD_TYPE_ID: TIntegerField;
    q_Gosprog: TOracleDataSet;
    ds_Gosprog: TDataSource;
    q_GosprogID: TIntegerField;
    q_GosprogGOSPROG_NAME: TStringField;
    q_R3_PriceR3_PRICE: TStringField;
    q_R3_StrahR3_STRAH: TStringField;
    q_Nazn_Otg: TOracleDataSet;
    q_Nazn_OtgID: TIntegerField;
    q_Nazn_OtgNAZN_OTG_NAME: TStringField;
    ds_Nazn_Otg: TDataSource;
    q_Stan: TOracleDataSet;
    q_StanID: TFloatField;
    q_StanSTAN_KOD: TIntegerField;
    q_StanSTAN_NAME: TStringField;
    ed_NpoDog: TComboEdit;
    PanelTitle: TPanel;
    lb_VBELN: TLabel;
    Label14: TLabel;
    Label13: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    lb_PriceR3: TLabel;
    Label3: TLabel;
    DBEdit6: TDBEdit;
    q_PlanStru: TOracleDataSet;
    q_PlanStruLEVEL_POS: TIntegerField;
    q_PlanStruNAME: TStringField;
    q_PlanStruPLAN_VES: TFloatField;
    q_PlanStruPLAN_SUM: TFloatField;
    ds_PlanStru: TDataSource;
    q_PlanPost: TOracleDataSet;
    ds_PlanPost: TDataSource;
    lc_TEX_PD: TRxDBLookupCombo;
    q_TEX_PD: TOracleDataSet;
    q_TEX_PDGROTP_ID: TIntegerField;
    q_TEX_PDGROTP_OKPO: TStringField;
    q_TEX_PDPLATTARIF_ID: TIntegerField;
    q_TEX_PDTEX_PD_NAME: TStringField;
    q_TEX_PDBANK: TStringField;
    q_TEX_PDRS: TStringField;
    ds_TEX_PD: TDataSource;
    q_NewMonthID: TStringField;
    q_NewMonthVBELN: TStringField;
    q_NewMonthNOM_ZD: TStringField;
    q_NewMonthDATE_RAZN: TDateTimeField;
    q_NewMonthDATE_PLAN: TDateTimeField;
    q_NewMonthIS_EXP_NAME: TStringField;
    q_NewMonthIS_EXP: TFloatField;
    q_NewMonthLOAD_NAME: TStringField;
    q_NewMonthLOAD_ABBR: TStringField;
    q_NewMonthLOAD_TYPE_ID: TFloatField;
    q_NewMonthVBAP_MATNR: TStringField;
    q_NewMonthPROD_NAME_NPR: TStringField;
    q_NewMonthPROD_ID_NPR: TStringField;
    q_NewMonthLUK_DOG_NUMBER: TStringField;
    q_NewMonthLUK_DOG_ID: TFloatField;
    q_NewMonthNPO_DOG_NUMBER: TStringField;
    q_NewMonthNPO_DOG_ID: TFloatField;
    q_NewMonthDOG_NUMBER: TStringField;
    q_NewMonthDOG_ID: TFloatField;
    q_NewMonthUSL_NUMBER: TFloatField;
    q_NewMonthVBPA_KUNNR: TStringField;
    q_NewMonthPLAT_NAME: TStringField;
    q_NewMonthPLAT_ID: TFloatField;
    q_NewMonthOT_LIFNR: TStringField;
    q_NewMonthGROTP_NAME: TStringField;
    q_NewMonthGROTP_ID: TFloatField;
    q_NewMonthROUTE_NAME: TStringField;
    q_NewMonthKNANF: TStringField;
    q_NewMonthSTANOTP_KOD: TIntegerField;
    q_NewMonthSTANOTP_ID: TFloatField;
    q_NewMonthKNEND: TStringField;
    q_NewMonthSTAN_KOD: TIntegerField;
    q_NewMonthSTAN_ID: TFloatField;
    q_NewMonthSH_KUNNR: TStringField;
    q_NewMonthPOLUCH_NAME: TStringField;
    q_NewMonthPOLUCH_ID: TFloatField;
    q_NewMonthPOTREB_NAME: TStringField;
    q_NewMonthPOTREB_ID: TFloatField;
    q_NewMonthVETKA_NAME: TStringField;
    q_NewMonthVETKA_ID: TFloatField;
    q_NewMonthOWNERSHIP_ID: TFloatField;
    q_NewMonthNAZN_OTG_ID: TFloatField;
    q_NewMonthNP_OWNER: TStringField;
    q_NewMonthOWNER_NAME: TStringField;
    q_NewMonthOWNER_ID: TFloatField;
    q_NewMonthSUPPLIER_ID: TFloatField;
    q_NewMonthTARIF_CODE: TStringField;
    q_NewMonthTRANSP_NUM: TStringField;
    q_NewMonthFORMA_2: TFloatField;
    q_NewMonthPRIM: TStringField;
    q_NewMonthGR4: TStringField;
    q_NewMonthOSN_8: TFloatField;
    q_NewMonthSLIV_V: TFloatField;
    q_NewMonthDOP_CIST: TFloatField;
    q_NewMonthOBOGR: TFloatField;
    q_NewMonthTONN_DECLARED: TFloatField;
    q_NewMonthCIST_DECLARED: TFloatField;
    q_NewMonthTONN_ALLOW: TFloatField;
    q_NewMonthCIST_ALLOW: TFloatField;
    q_NewMonthTONN_MIN: TFloatField;
    q_NewMonthCIST_MIN: TFloatField;
    q_NewMonthGOSPROG_ID: TFloatField;
    q_NewMonthGP_NAPR_ID: TFloatField;
    q_NewMonthDATE_CEN: TDateTimeField;
    q_NewMonthCENA: TFloatField;
    q_NewMonthCENA_OTP: TFloatField;
    q_NewMonthSUM_ZD: TFloatField;
    q_NewMonthTARIF1TONN: TFloatField;
    q_NewMonthPLANSTRU_ID: TFloatField;
    q_Forma2: TOracleDataSet;
    q_Forma2ID: TFloatField;
    q_Forma2NAME: TStringField;
    ds_Forma2: TDataSource;
    q_PlanPostPLANSTRU_ID: TFloatField;
    q_PlanPostPLANSTRU_NAME: TStringField;
    q_PlanPostPLAN_CENA: TFloatField;
    q_PlanPostPLAN_VES: TFloatField;
    q_PlanPostPLAN_SUM: TFloatField;
    q_PlanPostTONN_DECLARED: TFloatField;
    q_PlanPostTONN_R: TFloatField;
    q_PlanPostTONN_LOADED: TFloatField;
    q_GP_NAPR: TOracleDataSet;
    q_GP_NAPRID: TFloatField;
    q_GP_NAPRNAME: TStringField;
    q_GP_NAPRGOSPROG_ID: TIntegerField;
    lc_GP_NAPR: TRxDBLookupCombo;
    ds_GP_NAPR: TDataSource;
    q_CAT_CEN_GRP: TOracleDataSet;
    ds_CAT_CEN_GRP: TDataSource;
    q_UslDogDOG_NUMBER: TStringField;
    q_UslDogDOG_DATE: TDateTimeField;
    q_UslDogDOG_ID: TIntegerField;
    q_UslDogUSL_NUMBER: TIntegerField;
    q_UslDogUSL_NAME: TStringField;
    q_UslDogUSL_BEGIN_DATE: TDateTimeField;
    q_UslDogUSL_END_DATE: TDateTimeField;
    q_UslDogVID_USL_ID: TIntegerField;
    q_UslDogPAYDELAY_ID: TIntegerField;
    q_UslDogPAYDELAY_DATE: TDateTimeField;
    q_UslDogKOL_DN: TIntegerField;
    q_UslDogUSL_AKT: TIntegerField;
    q_UslDogUSL_UTV: TIntegerField;
    q_UslDogUSL_BAZ: TIntegerField;
    q_UslDogPROC_PRED: TIntegerField;
    q_UslDogPROC_PENI: TFloatField;
    q_UslDogPROC_INSURE: TFloatField;
    q_UslDogNEUST: TFloatField;
    q_UslDogUSL_SUM: TFloatField;
    q_UslDogPAYFORM_ID: TIntegerField;
    q_UslDogCAT_CEN_ID: TIntegerField;
    q_UslDogID: TFloatField;
    q_UslDogNPOCAT_CEN_ID: TIntegerField;
    q_UslDogPAYFORM_NAME: TStringField;
    q_UslDogCAT_CEN_NAME: TStringField;
    Label16: TLabel;
    ed_cist: TRxCalcEdit;
    Label17: TLabel;
    q_PricesSUM_ZD: TFloatField;
    DBText9: TDBText;
    q_Dog: TOracleDataSet;
    q_LukDog: TOracleDataSet;
    q_NpoDog: TOracleDataSet;
    Label25: TLabel;
    ed_Date_Razn: TDateTimePicker;
    DBEdit16: TDBEdit;
    DBMemo1: TDBMemo;
    ds_Dog: TDataSource;
    q_NewMonthLOCK_STATUS: TStringField;
    q_NewMonthVBAK_VSBED: TStringField;
    q_NewMonthVBKD_TRATY: TStringField;
    q_NewMonthVAGONTYPE_NAME: TStringField;
    q_NewMonthTYPE_OTGR_NAME: TStringField;
    q_NewMonthTEX_PD_ID: TFloatField;
    q_NewMonthVBAP_ROUTE: TStringField;
    q_NewMonthSTANOTP_NAME: TStringField;
    q_NewMonthSTAN_NAME: TStringField;
    q_NewMonthPOLUCH_GD_KOD: TStringField;
    q_NewMonthVBAK_AUART: TStringField;
    q_NewMonthCONTRACTOR_ATTR: TIntegerField;
    q_NewMonthNAZN_OTG_NAME: TStringField;
    q_NewMonthNP_PRODR: TStringField;
    q_NewMonthPRODR_NAME: TStringField;
    q_NewMonthPRODR_ID: TFloatField;
    q_NewMonthSUPPLIER_NAME: TStringField;
    q_NewMonthLGOBE: TStringField;
    q_NewMonthFORMA_2_NAME: TStringField;
    q_NewMonthVBKD_VSART: TStringField;
    q_NewMonthVAGOWNER_NAME: TStringField;
    q_NewMonthTONN_R: TFloatField;
    q_NewMonthCIST_R: TFloatField;
    q_NewMonthTONN_LOADED: TFloatField;
    q_NewMonthCIST_LOADED: TFloatField;
    q_NewMonthGOSPROG_NAME: TStringField;
    q_NewMonthGP_NAPR_NAME: TStringField;
    q_NewMonthPLANSTRU_NAME: TStringField;
    q_NewMonthUPDATE_DATE: TDateTimeField;
    q_NewMonthUPDATE_FILE: TStringField;
    q_TEX_PDID: TFloatField;
    q_TEX_PDGROTP_SHORT_NAME: TStringField;
    q_TEX_PDPLATTAR_SHORT_NAME: TStringField;
    q_TEX_PDKSSS_PLATTARIF_ID: TStringField;
    procedure acNewMonth_CancelExecute(Sender: TObject);
    procedure acNewMonth_FinishExecute(Sender: TObject);
    procedure rb_ExportClick(Sender: TObject);
    procedure rb_RussianClick(Sender: TObject);
    procedure acNewMonth_NextExecute(Sender: TObject);
    procedure acNewMonth_BackExecute(Sender: TObject);
    procedure rb_SourceNPRClick(Sender: TObject);
    procedure ed_DogChange(Sender: TObject);
    procedure q_NewMonthBeforeOpen(DataSet: TDataSet);
    procedure lc_TEX_PDChange(Sender: TObject);
    procedure ed_TEX_PDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_NpoDogChange(Sender: TObject);
    procedure ed_LukDogChange(Sender: TObject);
    procedure ed_OwnerChange(Sender: TObject);
    procedure ed_PostChange(Sender: TObject);
    procedure q_GosprogAfterScroll(DataSet: TDataSet);
    procedure ed_vesChange(Sender: TObject);
    procedure q_PricesCalcFields(DataSet: TDataSet);
    procedure tabDopShow(Sender: TObject);
    procedure tabFinishShow(Sender: TObject);
    procedure tabStartShow(Sender: TObject);
    procedure tabPlanShow(Sender: TObject);
    procedure tabPricesShow(Sender: TObject);
    procedure tabUslDogShow(Sender: TObject);
    procedure pageTabsChanging(Sender: TObject; var AllowChange: Boolean);
    procedure pageTabsChange(Sender: TObject);
    procedure ed_LukDogButtonClick(Sender: TObject);
    procedure ed_NpoDogButtonClick(Sender: TObject);
    procedure ed_DogButtonClick(Sender: TObject);
    procedure ed_GrOtpButtonClick(Sender: TObject);
    procedure q_PlanStruBeforeOpen(DataSet: TDataSet);
    procedure q_PlanPostBeforeOpen(DataSet: TDataSet);
    procedure q_PricesBeforeOpen(DataSet: TDataSet);
    procedure q_UslDogBeforeOpen(DataSet: TDataSet);
    procedure q_NewMonthAfterOpen(DataSet: TDataSet);
    procedure q_TEX_PDBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure ed_StanOtpButtonClick(Sender: TObject);
    procedure ed_StanButtonClick(Sender: TObject);
    procedure ed_PoluchButtonClick(Sender: TObject);
    procedure ed_PotrebButtonClick(Sender: TObject);
    procedure ed_VetkaButtonClick(Sender: TObject);
    procedure q_PlanPostAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    IsEdit:boolean;
    KindAdd:string;
    IdToSeek:string;
    IsInitial:boolean;

    CurrentGrOtpId:integer;
    CurrentPoluchId:integer;
    CurrentPlatId:integer;
    CurrentPotrebId:integer;
    CurrentDogId:integer;
    CurrentLukDogId:integer;
    CurrentNpoDogId:integer;
    CurrentStanOtpId:integer;
    CurrentStanId:integer;
    CurrentVetkaId:integer;
    CurrentOwnerId:integer;
    CurrentPostId:integer;

    LastTabIndex:integer;

    FirstLinksShow:boolean;
    FirstPlanShow:boolean;
    FirstUslDogShow:boolean;
    FirstPricesShow:boolean;
    FirstDopShow:boolean;
    FirstFinishShow:boolean;
  public
    { Public declarations }
  end;

var
  f_NewMonth: Tf_NewMonth;
  AKindAdd:string;
  AIdToSeek:string;
implementation

uses KlsMisc2, ForDB, main;

{$R *.dfm}

procedure Tf_NewMonth.acNewMonth_CancelExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure Tf_NewMonth.acNewMonth_FinishExecute(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure Tf_NewMonth.rb_ExportClick(Sender: TObject);
begin
  rb_Russian.Checked:=NOT rb_Export.Checked;
end;

procedure Tf_NewMonth.rb_RussianClick(Sender: TObject);
begin
  rb_Export.Checked:=NOT rb_Russian.Checked;
end;

procedure Tf_NewMonth.acNewMonth_NextExecute(Sender: TObject);
begin
  with pageTabs do
  Begin
    SelectNextPage(True,false)
  End;
end;

procedure Tf_NewMonth.acNewMonth_BackExecute(Sender: TObject);
begin
  with pageTabs do
  Begin
    pageTabs.SelectNextPage(false,false)
  end;
end;

procedure Tf_NewMonth.rb_SourceNPRClick(Sender: TObject);
begin
  if (rb_SourceNPR.ItemIndex=0) then
    // Собственный продукт ЛУКОЙЛ
  Begin
    ed_Owner.Enabled:=false;
    CurrentOwnerId:=1;
    ed_Owner.Text:='НЕФТЯНАЯ КОМПАНИЯ "ЛУКОЙЛ"';
    ed_Post.Enabled:=false;
    CurrentPostId:=1;
    ed_Post.Text:='НЕФТЯНАЯ КОМПАНИЯ "ЛУКОЙЛ"';
    q_Nazn_Otg.SQL[1]:=' WHERE 1=1';
  End;

  if (rb_SourceNPR.ItemIndex=1) then
    // Покупной продукт ЛУКОЙЛ
  Begin
    ed_Owner.Enabled:=false;
    CurrentOwnerId:=1;
    ed_Owner.Text:='НЕФТЯНАЯ КОМПАНИЯ "ЛУКОЙЛ"';
    ed_post.Enabled:=true;
    try
      q_Predpr.Close;
      q_Predpr.SQL[1]:='WHERE ID='+q_NewMonthSUPPLIER_ID.AsString;
      q_Predpr.Open;
      if NOT q_Predpr.EOF then
      Begin
        CurrentPostId:=q_PredprID.AsInteger;
        ed_Post.Text:=q_PredprPREDPR_NAME.AsString;
      end;
      q_Predpr.Close;
    except
    End;
    q_Nazn_Otg.SQL[1]:=' WHERE 1=1';
  End;

  if (rb_SourceNPR.ItemIndex=2) then
    // Собственный продукт других компаний
  Begin
    ed_Owner.Enabled:=true;
    try
      q_Predpr.Close;
      q_Predpr.SQL[1]:='WHERE ID='+q_NewMonthOWNER_ID.AsString;
      q_Predpr.Open;
      if NOT q_Predpr.EOF then
      Begin
        CurrentOwnerId:=q_PredprID.AsInteger;
        ed_Owner.Text:=q_PredprPREDPR_NAME.AsString;
      end;
      q_Predpr.Close;
    except
    end;
    ed_post.Enabled:=false;
    CurrentPostId:=0;
    ed_Post.Text:='';
    q_Nazn_Otg.SQL[1]:=' WHERE ID=4 OR ID=10';
  End;
  f_db.ReQuery(q_Nazn_Otg,True);
  lc_Nazn_Otg.KeyValue:=q_NewMonthNazn_Otg_ID.AsInteger;
end;

procedure Tf_NewMonth.ed_DogChange(Sender: TObject);
begin
  q_Dog.Close;
  q_Dog.SQL[1]:='WHERE DOG_ID='+IntToStr(CurrentDogId);
  q_Dog.Open;
  if NOT q_Dog.Eof then
  repeat
    if (q_Dog.FieldByName('MAIN_DOG_ID').AsInteger=0) then // Договор НПО
    Begin
      // Договор НПО-Клиент = договор разнарядки
      CurrentNpoDogId:=q_Dog.FieldByName('DOG_ID').AsInteger;
      ed_NpoDog.Text:=q_Dog.FieldByName('DOG_NUMBER').AsString;
      // Договор ЛУКОЙЛ-Клиент
      CurrentLukDogId:=0;
      ed_LukDog.Text:='';
    End;

    if (q_Dog.FieldByName('MAIN_DOG_ID').AsInteger<>0) AND (q_Dog.FieldByName('MAIN_IS_AGENT').AsInteger=0) then // Договор в рамках договора комиссии
    Begin
      // Договор НПО-Клиент = договор разнарядки
      CurrentNpoDogId:=q_Dog.FieldByName('DOG_ID').AsInteger;
      ed_NpoDog.Text:=q_Dog.FieldByName('DOG_NUMBER').AsString;
      // Договор Лукойл-Клиент
      CurrentLukDogId:=q_Dog.FieldByName('MAIN_DOG_ID').AsInteger;
      ed_LukDog.Text:=q_Dog.FieldByName('MAIN_DOG_NUMBER').AsString;
    End;

    if (q_Dog.FieldByName('MAIN_DOG_ID').AsInteger<>0) AND (q_Dog.FieldByName('MAIN_IS_AGENT').AsInteger=2) then // Договор в рамках договора поставки
    Begin
      If q_Dog.FieldByName('DOG_ID').AsInteger<>q_Dog.FieldByName('MAIN_DOG_ID').AsInteger then
      Begin
        // Договор НПО-Клиент = договор разнарядки
        CurrentNpoDogId:=q_Dog.FieldByName('DOG_ID').AsInteger;
        ed_NpoDog.Text:=q_Dog.FieldByName('DOG_NUMBER').AsString;
        // Договор Лукойл-Клиент
        CurrentLukDogId:=q_Dog.FieldByName('MAIN_DOG_ID').AsInteger;
        ed_LukDog.Text:=q_Dog.FieldByName('MAIN_DOG_NUMBER').AsString;
        // Договор разнарядки
        CurrentDogId:=q_Dog.FieldByName('MAIN_DOG_ID').AsInteger;
        ed_Dog.Text:=q_Dog.FieldByName('MAIN_DOG_NUMBER').AsString;
        // Прервать
        break;
      end
      else
      Begin
        // Договор Лукойл-Клиент
        CurrentLukDogId:=q_Dog.FieldByName('MAIN_DOG_ID').AsInteger;
        ed_LukDog.Text:=q_Dog.FieldByName('MAIN_DOG_NUMBER').AsString;
      End;
    end;

    if (q_Dog.FieldByName('MAIN_DOG_ID').AsInteger<>0) AND (q_Dog.FieldByName('MAIN_IS_AGENT').AsInteger=1) then // Договор в рамках агентского договора
    Begin
      // Договор НПО-Клиент
      CurrentNpoDogId:=0;
      ed_NpoDog.Text:='';
      // Договор Лукойл-Клиент=Договор разнарядки
      CurrentLukDogId:=q_Dog.FieldByName('DOG_ID').AsInteger;
      ed_LukDog.Text:=q_Dog.FieldByName('DOG_NUMBER').AsString;
    end;

    CurrentPlatId:=q_Dog.FieldByName('PLAT_ID').AsInteger;
    ed_Plat.Text:=q_Dog.FieldByName('PLAT_NAME').AsString;

  until true;
end;

procedure Tf_NewMonth.q_NewMonthBeforeOpen(DataSet: TDataSet);
begin
  If KindAdd='SPECIF' then
  Begin
    q_NewMonth.SQL.Clear;
    q_NewMonth.SQL.Add('SELECT * FROM V_NEW_MONTH_SPECIF');
    q_NewMonth.SQL.Add(' WHERE ID='''+IdToSeek+'''');
  End
  Else
    If KindAdd='MONTH' then
    Begin
      q_NewMonth.SQL.Clear;
      q_NewMonth.SQL.Add('SELECT * FROM V_NEW_MONTH_MONTH');
      q_NewMonth.SQL.Add(' WHERE ID='''+IdToSeek+'''');
    End
    else // R3
    Begin
      q_NewMonth.SQL.Clear;
      q_NewMonth.SQL.Add('SELECT * FROM V_NEW_MONTH_R3_VBAK');
      q_NewMonth.SQL.Add(' WHERE VBELN='''+IdToSeek+'''');
    End;
end;

procedure Tf_NewMonth.lc_TEX_PDChange(Sender: TObject);
begin
  ed_Tex_Pd.Text:=q_Tex_pdID.AsString;
end;

procedure Tf_NewMonth.ed_TEX_PDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var i:integer;
    OldText:string;
begin
  if Key=VK_RETURN then
  Begin
    OldText:=ed_TEX_PD.Text;
    try
      i:=StrToInt(ed_TEX_PD.Text);
    except
      i:=0;
    end;
    lc_Tex_Pd.KeyValue:=i;
    if lc_Tex_Pd.KeyValue<>i then ed_TEX_PD.Text:=OldText;
  End
end;

procedure Tf_NewMonth.ed_NpoDogChange(Sender: TObject);
begin
  q_NpoDog.Close;
  q_NpoDog.SQL[1]:='WHERE DOG_ID='+IntToStr(CurrentNpoDogId);
  q_NpoDog.Open;

  if NOT q_NpoDog.Eof then
  repeat
    if (q_NpoDog.FieldByName('MAIN_DOG_ID').AsInteger=0) then // Собственный договор НПО
    Begin
      // Договор разнарядки = договор НПО-Клиент
      CurrentDogId:=q_NpoDog.FieldByName('DOG_ID').AsInteger;
      ed_Dog.Text:=q_NpoDog.FieldByName('DOG_NUMBER').AsString;
    End
    else
      if q_NpoDog.FieldByName('LUK_DOG_ID').AsInteger=0 then
      Begin
        Application.MessageBox('Это договор ЛУКОЙЛ-Клиент','Внимание',MB_Ok);
      end
      else
      if (q_NpoDog.FieldByName('MAIN_IS_AGENT').AsInteger=0) then // Договор в рамках договора комиссии
      Begin
        // Договор разнарядки = договор НПО-Клиент
        CurrentDogId:=q_NpoDog.FieldByName('DOG_ID').AsInteger;
        ed_Dog.Text:=q_NpoDog.FieldByName('DOG_NUMBER').AsString;
      End;
  until true;
end;

procedure Tf_NewMonth.ed_LukDogChange(Sender: TObject);
begin
  q_LukDog.Close;
  q_LukDog.SQL[1]:='WHERE DOG_ID='+IntToStr(CurrentLukDogId);
  q_LukDog.Open;

  if NOT q_LukDog.Eof then
  repeat
    if (q_LukDog.FieldByName('MAIN_DOG_ID').AsInteger=0) then
    begin
      Application.MessageBox('Это собственный договор НПО!','Внимание',MB_Ok);
    end
    else
      if q_LukDog.FieldByName('LUK_DOG_ID').AsInteger<>0 then
      Begin
        Application.MessageBox(PChar('Это договор НПО-Клиент в рамках договора '+q_LukDog.FieldByName('LUK_DOG_NUMBER').AsString),'Внимание',MB_Ok);
        CurrentNpoDogId:=q_LukDog.FieldByName('DOG_ID').AsInteger;
        ed_NpoDog.Text:=q_LukDog.FieldByName('DOG_NUMBER').AsString;
        CurrentLukDogId:=q_LukDog.FieldByName('LUK_DOG_ID').AsInteger;
        ed_LukDog.Text:=q_LukDog.FieldByName('LUK_DOG_NUMBER').AsString;
        // Прервать
        break;
      end
      else
        if (q_LukDog.FieldByName('DOG_ID').AsInteger=q_LukDog.FieldByName('MAIN_DOG_ID').AsInteger) and (q_LukDog.FieldByName('MAIN_IS_AGENT').AsInteger=2) then // Договор поставки
        Begin
          // Договор разнарядки = договор ЛУКОЙЛ-Клиент
          CurrentDogId:=q_LukDog.FieldByName('DOG_ID').AsInteger;
          ed_Dog.Text:=q_LukDog.FieldByName('DOG_NUMBER').AsString;
        End;
  until true;
end;

procedure Tf_NewMonth.ed_OwnerChange(Sender: TObject);
begin
  if CurrentOwnerId<>0 then
  Begin
    // Проставить собственника в запросах
    q_Prices.SQL[12]:=' AND A.SUPPLIER_ID='+IntToStr(CurrentOwnerId);

    // Если НЕ инициализация
    If NOT IsInitial Then
    Begin
      f_db.ReQuery(q_Prices,True);
    End;
  end;
end;

procedure Tf_NewMonth.ed_PostChange(Sender: TObject);
begin
  if CurrentPostId<>0 then
  Begin
    // Проставить собственника в запросах
    q_Prices.SQL[12]:=' AND A.SUPPLIER_ID='+IntToStr(CurrentPostId);

    // Если НЕ инициализация
    If NOT IsInitial Then
    Begin
      f_db.ReQuery(q_Prices,True);
    End;
  end;
end;

procedure Tf_NewMonth.q_GosprogAfterScroll(DataSet: TDataSet);
begin
  // Проставить госпрограмму в запросах
  f_db.ReQuery(q_GP_NAPR,True);
  lc_GP_NAPR.KeyValue:=q_NewMonthGP_NAPR_ID.AsInteger;
end;

procedure Tf_NewMonth.ed_vesChange(Sender: TObject);
begin
  f_db.ReQuery(q_Prices,True);
end;

procedure Tf_NewMonth.q_PricesCalcFields(DataSet: TDataSet);
begin
  if rb_Russian.Checked then
    q_PricesSUM_ZD.AsFloat:=RoundTo(q_pricesCENA_OTP.AsFloat*ed_ves.Value,-2)
  else
    q_PricesSUM_ZD.AsFloat:=0;
end;

procedure Tf_NewMonth.tabDopShow(Sender: TObject);
begin
  // Подстановка в запросах

  // Обновление запросов
  f_db.ReQuery(q_TEX_PD,True);
  f_db.ReQuery(q_Gosprog,True);
  f_db.ReQuery(q_Forma2,True);
  f_db.ReQuery(q_GP_NAPR,True);

  //Госпрограмма
  if lc_Gosprog.KeyValue=-1 then
    if q_NewMonthGOSPROG_ID.AsInteger=-1 then
      lc_Gosprog.KeyValue:=q_Dog.FieldByName('GOSPROG_ID').AsInteger
    else
      lc_Gosprog.KeyValue:=q_NewMonthGOSPROG_ID.AsInteger;

  If FirstDopShow then
  Begin
    // Значения по умолчанию в первый раз
    // ТЕХ ПД
    if NOT (q_Load_AbbrLOAD_TYPE_ID.AsInteger IN [1,6]) then // НЕ Ж/д отгрузка
      lc_Tex_Pd.KeyValue:=0
    else
      lc_Tex_Pd.KeyValue:=q_NewMonthTEX_PD_ID.AsFloat;
    // Прочее
    ed_K_TAR.Text:=q_NewMonthTARIF_CODE.AsString;
    ed_Transp.Text:=q_NewMonthTRANSP_NUM.AsString;
    lc_Forma2.KeyValue:=q_NewMonthFORMA_2.AsInteger;
    ed_Prim.Text:=q_NewMonthPRIM.AsString;
    ed_GR4.Text:=q_NewMonthGR4.AsString;
    rb_8_axis.ItemIndex:=q_NewMonthOSN_8.AsInteger;
    rb_Sliv_V.ItemIndex:=q_NewMonthSLIV_V.AsInteger;
    rb_Obogr.ItemIndex:=q_NewMonthOBOGR.AsInteger;
  end
  else
  Begin
    // Значения по умолчанию ВСЕГДА
    if NOT (q_Load_AbbrLOAD_TYPE_ID.AsInteger IN [1,6]) then // НЕ Ж/д отгрузка
      lc_Tex_Pd.KeyValue:=0;
      lc_Gosprog.KeyValue:=q_Dog.FieldByName('GOSPROG_ID').AsInteger
  End;

  // Сброс флага
  FirstDopShow:=false;
end;

procedure Tf_NewMonth.tabFinishShow(Sender: TObject);
begin
  // Обновление запросов
  f_db.ReQuery(q_Prices,True);

  if FirstFinishShow then
  Begin
    // Значения по умолчанию в первый раз
    // № разнарядки НПО
    If IsEdit then
      ed_Nom_Zd.Text:=q_NewMonthNOM_ZD.AsString;
  end
  else
  Begin
    // Значения по умолчанию ВСЕГДА
  End;

  // Сброс флага
  FirstFinishShow:=false;
end;

procedure Tf_NewMonth.tabStartShow(Sender: TObject);
var q_Dogs:TOracleDataSet;
begin
  // Обновление запросов
  f_db.ReQuery(q_Load_Abbr,True);
  f_db.ReQuery(q_Prod,True);

  if FirstLinksShow then
  Begin
    // Значения по умолчанию в первый раз
    q_Dogs:=TOracleDataSet.Create(Self);
    q_Dogs.Session:=f_main.ora_Session;
    q_Dogs.SQL.Add('SELECT KLS_DOG.ID,KLS_DOG.DOG_NUMBER FROM KLS_DOG');
    q_Dogs.SQL.Add(' WHERE KLS_DOG.ID=0');

    // Дата разнарядки НПО
    if KindAdd='SPECIF' then
    Begin
      If Date<StartOfTheMonth(q_NewMonthDATE_RAZN.AsDateTime) then
        ed_Date_Razn.Date:=StartOfTheMonth(q_NewMonthDATE_RAZN.AsDateTime)
      else
        If Date>EndOfTheMonth(q_NewMonthDATE_RAZN.AsDateTime) then
          ed_Date_Razn.Date:=EndOfTheMonth(q_NewMonthDATE_RAZN.AsDateTime)
        else
          ed_Date_Razn.Date:=q_NewMonthDATE_RAZN.AsDateTime
    End
    else
      ed_Date_Razn.Date:=q_NewMonthDATE_RAZN.AsDateTime;

    // Направление
    if q_NewMonthIS_EXP.AsInteger=1 then rb_Export.Checked:=true
    else rb_Russian.Checked:=true;

    // Отправитель
    If q_NewMonthGROTP_ID.AsInteger>0 then
    try
      q_Predpr.Close;
      q_Predpr.SQL[1]:='WHERE ID='+q_NewMonthGROTP_ID.AsString;
      q_Predpr.Open;
      if NOT q_Predpr.EOF then
      Begin
        CurrentGrOtpId:=q_PredprID.AsInteger;
        ed_GrOtp.Text:=q_PredprPREDPR_NAME.AsString;
      end;
      q_Predpr.Close;
    except
    End;

    // Вид отгрузки
    lc_Load_Abbr.KeyValue:=q_NewMonthLOAD_ABBR.AsString;

    // Продукт
    lc_Prod.KeyValue:=q_NewMonthPROD_ID_NPR.AsString;

    // Договор ЛУКОЙЛ-Клиент
    If q_NewMonthLUK_DOG_ID.AsInteger>0 then
    try
      q_Dogs.Close;
      q_Dogs.SQL[1]:='WHERE KLS_DOG.ID='+q_NewMonthLUK_DOG_ID.AsString;
      q_Dogs.Open;
      if NOT q_Dogs.EOF then
      Begin
        CurrentLukDogId:=q_Dogs.FieldByName('ID').AsInteger;
        ed_LukDog.Text:=q_Dogs.FieldByName('DOG_NUMBER').AsString;
      End;
      q_Dogs.Close;
    except
    end;

    // Договор НПО-Клиент
    If q_NewMonthNPO_DOG_ID.AsInteger>0 then
    try
      q_Dogs.Close;
      q_Dogs.SQL[1]:='WHERE KLS_DOG.ID='+q_NewMonthNPO_DOG_ID.AsString;
      q_Dogs.Open;
      if NOT q_Dogs.EOF then
      Begin
        CurrentNpoDogId:=q_Dogs.FieldByName('ID').AsInteger;
        ed_NpoDog.Text:=q_Dogs.FieldByName('DOG_NUMBER').AsString;
      End;
      q_Dogs.Close;
    except
    end;

    // Договор разнарядки
    If q_NewMonthDOG_ID.AsInteger>0 then
    try
      q_Dogs.Close;
      q_Dogs.SQL[1]:='WHERE KLS_DOG.ID='+q_NewMonthDOG_ID.AsString;
      q_Dogs.Open;
      if NOT q_Dogs.EOF then
      Begin
        CurrentDogId:=q_Dogs.FieldByName('ID').AsInteger;
        ed_Dog.Text:=q_Dogs.FieldByName('DOG_NUMBER').AsString;
      End;
      q_Dogs.Close;
    except
    end;

    // Плательщик по договору разнарядки
    If q_NewMonthPLAT_ID.AsInteger>0 then
    try
      q_Predpr.Close;
      q_Predpr.SQL[1]:='WHERE ID='+q_NewMonthPLAT_ID.AsString;
      q_Predpr.Open;
      if NOT q_Predpr.EOF then
      Begin
        CurrentPlatId:=q_PredprID.AsInteger;
        ed_Plat.Text:=q_PredprPREDPR_NAME.AsString;
      End;
      q_Predpr.Close;
    except
    end;

    // Станция отправления
    If q_NewMonthSTANOTP_ID.AsInteger>0 then
    try
      q_Stan.Close;
      q_Stan.SQL[1]:='WHERE ID='+q_NewMonthSTANOTP_ID.AsString;
      q_Stan.Open;
      if NOT q_Stan.EOF then
      Begin
        CurrentStanOtpId:=q_StanID.AsInteger;
        ed_StanOtpKod.Text:=q_StanSTAN_KOD.AsString;
        ed_StanOtp.Text:=q_StanSTAN_NAME.AsString;
      end;
      q_Stan.Close;
    except
    End;

    // Станция назначения
    If q_NewMonthSTAN_ID.AsInteger>0 then
    try
      q_Stan.Close;
      q_Stan.SQL[1]:='WHERE ID='+q_NewMonthSTAN_ID.AsString;
      q_Stan.Open;
      if NOT q_Stan.EOF then
      Begin
        CurrentStanId:=q_StanID.AsInteger;
        ed_StanKod.Text:=q_StanSTAN_KOD.AsString;
        ed_Stan.Text:=q_StanSTAN_NAME.AsString;
      End;
      q_Stan.Close;
    except
    End;

    // Получатель
    If q_NewMonthPOLUCH_ID.AsInteger>0 then
    try
      q_Predpr.Close;
      q_Predpr.SQL[1]:='WHERE ID='+q_NewMonthPOLUCH_ID.AsString;
      q_Predpr.Open;
      if NOT q_Predpr.EOF then
      Begin
        CurrentPoluchId:=q_PredprID.AsInteger;
        ed_Poluch.Text:=q_PredprPREDPR_NAME.AsString;
      end;
      q_Predpr.Close;
    except
    End;

    // Потребитель
    If q_NewMonthPOTREB_ID.AsInteger>0 then
    try
      q_Predpr.Close;
      q_Predpr.SQL[1]:='WHERE ID='+q_NewMonthPOTREB_ID.AsString;
      q_Predpr.Open;
      if NOT q_Predpr.EOF then
      Begin
        CurrentPotrebId:=q_PredprID.AsInteger;
        ed_Potreb.Text:=q_PredprPREDPR_NAME.AsString;
      End;
      q_Predpr.Close;
    except
    End
    Else
    Begin
      IF q_NewMonthPOTREB_NAME.AsString='' then
      Begin
        CurrentPotrebId:=CurrentPoluchId;
        ed_Potreb.Text:=ed_poluch.Text;
      End;
    End;

    // Ветка
    If q_NewMonthVETKA_ID.AsInteger>0 then
    try
      q_Vetka.Close;
      q_Vetka.SQL[1]:='WHERE ID='+q_NewMonthVETKA_ID.AsString;
      q_Vetka.Open;
      if NOT q_Vetka.EOF then
      Begin
        CurrentVetkaId:=q_VetkaID.AsInteger;
        ed_Vetka.Text:=q_VetkaVETKA_NAME.AsString;
      end;
      q_Vetka.Close;
    except
    End;

    // Цена
    try
      q_R3_Price.Close;
      q_R3_Price.SQL[4]:=' WHERE R3_OA.VBAK_VBELN='''+q_NewMonthVBELN.AsString+'''';
      q_R3_Price.SQL[9]:=' AND R3_OA.VBAK_VBELN='''+q_NewMonthVBELN.AsString+'''';
      q_R3_Price.Open;
    except
    end;

    // % страховки
    try
      q_R3_Strah.Close;
      q_R3_Strah.SQL[4]:=' WHERE R3_OA.VBAK_VBELN='''+q_NewMonthVBELN.AsString+'''';
      q_R3_Strah.SQL[9]:=' AND R3_OA.VBAK_VBELN='''+q_NewMonthVBELN.AsString+'''';
      q_R3_Strah.Open;
      if not q_R3_Strah.EOF then ed_Strah_flt.Value:=q_R3_StrahR3_STRAH.AsInteger;
    except
    end;

    q_Dogs.Close;
    q_Dogs.SQL.Clear;
    q_Dogs.Free;
  end
  else
  begin
    // Значения по умолчанию ВСЕГДА
  end;

  // Сброс флага
  FirstLinksShow:=false;
end;

procedure Tf_NewMonth.tabPlanShow(Sender: TObject);
begin

  // Плановый период
  edYear.Value:=YearOf(ed_Date_Razn.Date);
  cbMonth.ItemIndex:=MonthOf(ed_Date_Razn.Date)-1;

  if FirstPlanShow then
  Begin
    // Значения по умолчанию в первый раз
{    cbMonthChange(Self);}
  end
  else
  begin
    // Значения по умолчанию ВСЕГДА
  end;

  // Обновление запросов
  f_db.ReQuery(q_PlanPost,True);
  f_db.ReQuery(q_PlanStru,True);

  If FirstPlanShow then
  Begin
    // Значения по умолчанию в первый раз
    q_PlanPost.Locate('PLANSTRU_ID',q_NewMonthPLANSTRU_ID.AsInteger,[]);
  End
  else
  Begin
    // Значения по умолчанию ВСЕГДА
  End;

  // Сброс флага
  FirstPlanShow:=false;
end;

procedure Tf_NewMonth.tabPricesShow(Sender: TObject);
begin
  if FirstPricesShow then
  Begin
    // Значения по умолчанию в первый раз
    if q_Dog.FieldByName('MAIN_DOG_ID').AsInteger=0 then
      rb_SourceNPR.ItemIndex:=2
    else
      rb_SourceNPR.ItemIndex:=q_NewMonthOWNERSHIP_ID.AsInteger;
  end
  Else
  Begin
    // Значения по умолчанию ВСЕГДА
    if q_Dog.FieldByName('MAIN_DOG_ID').AsInteger=0 then
      rb_SourceNPR.ItemIndex:=2;
  end;

  // Обновление запросов
  f_db.ReQuery(q_Nazn_Otg,True);
  f_db.ReQuery(q_Prices,True);

  if FirstPricesShow then
  begin
    // Значения по умолчанию в первый раз
    // Цена
    if (KindAdd='R3') AND NOT q_R3_Price.Eof then
    try
      q_Prices.Locate('CENA_OTP',q_R3_PriceR3_PRICE.AsFloat,[loPartialKey]);
    except
    End;
  end
  else
  Begin
    // Значения по умолчанию ВСЕГДА
  End;

  // Сброс флага
  FirstPricesShow:=false;
end;

procedure Tf_NewMonth.tabUslDogShow(Sender: TObject);
var BeginDate,EndDate:TDateTime;
begin
  BeginDate:=EncodeDate(edYear.AsInteger,cbMonth.ItemIndex+1,1);
  EndDate:=EndOfTheMonth(EncodeDate(edYear.AsInteger,cbMonth.ItemIndex+1,1));

  // Обновление запросов
  f_db.ReQuery(q_CAT_CEN_GRP,True);
  f_db.ReQuery(q_UslDog,True);

  // Значения по умолчанию
  ed_BeginDate_flt.Date:=BeginDate;
  ed_EndDate_flt.Date:=EndDate;
  ed_KolDn_flt.Value:=q_Dog.FieldByName('KOL_DN').AsInteger;

  if FirstUslDogShow then
  Begin
    // Значения по умолчанию в первый раз
    q_UslDog.Locate('USL_NUMBER',q_NewMonthUSL_NUMBER.AsInteger,[]);
  End
  Else
  Begin
    // Значения по умолчанию ВСЕГДА
  End;

  // Сброс флага
  FirstUslDogShow:=false;
end;

procedure Tf_NewMonth.pageTabsChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  // Проверка на заполненность
  if pageTabs.ActivePage=tabStart then
  Begin
    if VarType(lc_Load_Abbr.KeyValue) in [varNull,varEmpty] then
    Begin
      Application.MessageBox('Выберите тип транспортировки','Внимание!',MB_OK);
      AllowChange:=false;
      lc_Load_Abbr.SetFocus;
      exit;
    End;
    if VarType(lc_Prod.KeyValue) in [varNull,varEmpty] then
    Begin
      Application.MessageBox('Выберите продукт','Внимание!',MB_OK);
      AllowChange:=false;
      lc_Prod.SetFocus;
      exit;
    End;
    if (q_NewMonthLUK_DOG_NUMBER.AsString<>'') AND (CurrentLukDogId=0) then
    Begin
      Application.MessageBox('Выберите договор ЛУКОЙЛ-Клиент','Внимание!',MB_OK);
      AllowChange:=false;
      ed_LukDog.SetFocus;
      exit;
    End;
    if (q_NewMonthNPO_DOG_NUMBER.AsString<>'') AND (CurrentNpoDogId=0) then
    Begin
      Application.MessageBox('Выберите договор НПО-Клиент','Внимание!',MB_OK);
      AllowChange:=false;
      ed_NpoDog.SetFocus;
      exit;
    End;
    if (CurrentDogId=0) then
    Begin
      Application.MessageBox('Выберите договор разнарядки','Внимание!',MB_OK);
      AllowChange:=false;
      ed_Dog.SetFocus;
      exit;
    End;
    if (CurrentGrOtpId=0) then
    Begin
      Application.MessageBox('Выберите грузоотправителя','Внимание!',MB_OK);
      AllowChange:=false;
      ed_GrOtp.SetFocus;
      exit;
    End;
    if (CurrentStanOtpId=0) then
    Begin
      Application.MessageBox('Выберите станцию отправления','Внимание!',MB_OK);
      AllowChange:=false;
      ed_StanOtp.SetFocus;
      exit;
    End;
    if (CurrentStanId=0) then
    Begin
      Application.MessageBox('Выберите станцию назначения','Внимание!',MB_OK);
      AllowChange:=false;
      ed_Stan.SetFocus;
      exit;
    End;
    if (CurrentPoluchId=0) then
    Begin
      Application.MessageBox('Выберите грузополучателя','Внимание!',MB_OK);
      AllowChange:=false;
      ed_Poluch.SetFocus;
      exit;
    End;
    if (CurrentPotrebId=0) then
    Begin
      Application.MessageBox('Выберите потребителя','Внимание!',MB_OK);
      AllowChange:=false;
      ed_Potreb.SetFocus;
      exit;
    End;
    if (CurrentVetkaId=0) then
    Begin
      Application.MessageBox('Выберите ветку получателя','Внимание!',MB_OK);
      AllowChange:=false;
      ed_Vetka.SetFocus;
      exit;
    End;
  End;
  // Предыдущая страница
  LastTabIndex:=pageTabs.TabIndex;
end;

procedure Tf_NewMonth.pageTabsChange(Sender: TObject);
begin
  if (pageTabs.TabIndex-LastTabIndex)>1 then pageTabs.TabIndex:=LastTabIndex;
end;

procedure Tf_NewMonth.ed_LukDogButtonClick(Sender: TObject);
begin
  KlsMisc2.SetKLSParam('KLS_DOG','CHOOSE',fsNormal,IntToStr(CurrentLukDogId),'',true,StartOfTheMonth(ed_Date_Razn.Date),EndOfTheMonth(ed_Date_Razn.Date));

  with TF_KlsMisc.Create(Self) do
  begin
    if ShowModal=mrOk then
    begin
      CurrentLukDogId:=StrToInt(KlsMisc2.vIdToSeek);
      ed_LukDog.Text:=KlsMisc2.ResultName;
    end;
    Free;
  end;
end;

procedure Tf_NewMonth.ed_NpoDogButtonClick(Sender: TObject);
begin
  KlsMisc2.SetKLSParam('KLS_DOG','CHOOSE',fsNormal,IntToStr(CurrentNpoDogId),'',true,StartOfTheMonth(ed_Date_Razn.Date),EndOfTheMonth(ed_Date_Razn.Date),'');

  with TF_KlsMisc.Create(Self) do
  begin
    if ShowModal=mrOk then
    begin
      CurrentNpoDogId:=StrToInt(KlsMisc2.vIdToSeek);
      ed_NpoDog.Text:=KlsMisc2.ResultName;
    end;
    Free;
  end;
end;

procedure Tf_NewMonth.ed_DogButtonClick(Sender: TObject);
begin
  KlsMisc2.SetKLSParam('KLS_DOG','CHOOSE',fsNormal,IntToStr(CurrentDogId),'',true,StartOfTheMonth(ed_Date_Razn.Date),EndOfTheMonth(ed_Date_Razn.Date),'');

  with TF_KlsMisc.Create(Self) do
  begin
    if ShowModal=mrOk then
    begin
      CurrentDogId:=StrToInt(KlsMisc2.vIdToSeek);
      ed_Dog.Text:=KlsMisc2.ResultName;
    end;
    Free;
  end;
end;

procedure Tf_NewMonth.ed_GrOtpButtonClick(Sender: TObject);
begin
  KlsMisc2.SetKLSParam('KLS_PREDPR_OTPR','CHOOSE',fsNormal,IntToStr(CurrentGrOtpId),q_NewMonthGROTP_NAME.AsString,true);

  with TF_KlsMisc.Create(Self) do
  begin
    if ShowModal=mrOk then
    begin
      CurrentGrOtpId:=StrToInt(KlsMisc2.vIdToSeek);
      ed_GrOtp.Text:=KlsMisc2.ResultName;
    end;
    Free;
  end;
end;

procedure Tf_NewMonth.q_PlanStruBeforeOpen(DataSet: TDataSet);
var BeginDate,EndDate:TDateTime;
begin
  BeginDate:=EncodeDate(edYear.AsInteger,cbMonth.ItemIndex+1,1);
  EndDate:=EndOfTheMonth(EncodeDate(edYear.AsInteger,cbMonth.ItemIndex+1,1));

  if q_PlanPost.EOF then
  Begin
    q_PlanStru.SQL[14]:=' WHERE ID=0';
  End;
  q_PlanStru.SQL[29]:=' AND PP.DOG_ID='+q_Dog.FieldByName('DOG_ID').AsString;
  q_PlanStru.SQL[30]:=' AND PP.PROD_ID_NPR='''+q_prodID_NPR.AsString+'''';
  q_PlanStru.SQL[32]:=' AND PLAN_PERIODS.DATE_PLAN=TO_DATE('''+FormatDateTime('dd.mm.yyyy',BeginDate)+''',''dd.mm.yyyy'')';
  q_PlanStru.SQL[33]:=' AND PLAN_PERIODS.BEGIN_DATE=TO_DATE('''+FormatDateTime('dd.mm.yyyy',BeginDate)+''',''dd.mm.yyyy'')';
  q_PlanStru.SQL[34]:=' AND PLAN_PERIODS.END_DATE=TO_DATE('''+FormatDateTime('dd.mm.yyyy',EndDate)+''',''dd.mm.yyyy'')';
end;

procedure Tf_NewMonth.q_PlanPostBeforeOpen(DataSet: TDataSet);
var BeginDate,EndDate:TDateTime;
begin
  BeginDate:=EncodeDate(edYear.AsInteger,cbMonth.ItemIndex+1,1);
  EndDate:=EndOfTheMonth(EncodeDate(edYear.AsInteger,cbMonth.ItemIndex+1,1));

  q_PlanPost.SQL[16]:=' WHERE PROD_ID_NPR='''+q_prodID_NPR.AsString+'''';
  q_PlanPost.SQL[17]:=' AND DOG_ID='+q_Dog.FieldByName('DOG_ID').AsString;
  q_PlanPost.SQL[18]:=' AND DATE_PLAN=TO_DATE('''+FormatDateTime('dd.mm.yyyy',BeginDate)+''',''dd.mm.yyyy'')';
  q_PlanPost.SQL[19]:=' AND INPUT_DATE>TO_DATE('''+FormatDateTime('dd.mm.yyyy',BeginDate)+''',''dd.mm.yyyy'')-1';
  q_PlanPost.SQL[20]:=' AND INPUT_DATE<TO_DATE('''+FormatDateTime('dd.mm.yyyy',EndDate)+''',''dd.mm.yyyy'')+1';

  q_PlanPost.SQL[25]:=' AND A.PROD_ID_NPR='''+q_prodID_NPR.AsString+'''';
  q_PlanPost.SQL[26]:=' AND A.DOG_ID='+q_Dog.FieldByName('DOG_ID').AsString;
  q_PlanPost.SQL[28]:=' AND PLAN_PERIODS.DATE_PLAN=TO_DATE('''+FormatDateTime('dd.mm.yyyy',BeginDate)+''',''dd.mm.yyyy'')';
  q_PlanPost.SQL[29]:=' AND PLAN_PERIODS.BEGIN_DATE=TO_DATE('''+FormatDateTime('dd.mm.yyyy',BeginDate)+''',''dd.mm.yyyy'')';
  q_PlanPost.SQL[30]:=' AND PLAN_PERIODS.END_DATE=TO_DATE('''+FormatDateTime('dd.mm.yyyy',EndDate)+''',''dd.mm.yyyy'')';
end;

procedure Tf_NewMonth.q_PricesBeforeOpen(DataSet: TDataSet);
begin
  q_Prices.SQL[13]:=' AND A.BEGIN_DATE<TO_DATE('''+FormatDateTime('dd.mm.yyyy',ed_Date_Razn.Date)+''',''dd.mm.yyyy'')+1';
  q_Prices.SQL[14]:=' AND A.END_DATE>TO_DATE('''+FormatDateTime('dd.mm.yyyy',ed_Date_Razn.Date)+''',''dd.mm.yyyy'')-1';
  q_Prices.SQL[9]:=' AND A.CAT_CEN_ID='+q_UslDogCAT_CEN_ID.AsString;
  q_Prices.SQL[10]:=' AND A.PROD_ID_NPR='''+q_prodID_NPR.AsString+'''';
end;

procedure Tf_NewMonth.q_UslDogBeforeOpen(DataSet: TDataSet);
var BeginDate,EndDate:TDateTime;
begin
  BeginDate:=EncodeDate(edYear.AsInteger,cbMonth.ItemIndex+1,1);
  EndDate:=EndOfTheMonth(EncodeDate(edYear.AsInteger,cbMonth.ItemIndex+1,1));

  q_UslDog.SQL[8]:=' AND A.USL_BEGIN_DATE<TO_DATE('''+FormatDateTime('dd.mm.yyyy',EndDate)+''',''dd.mm.yyyy'')+1';
  q_UslDog.SQL[9]:=' AND A.USL_END_DATE>TO_DATE('''+FormatDateTime('dd.mm.yyyy',BeginDate)+''',''dd.mm.yyyy'')-1';
  q_UslDog.SQL[13]:=' AND A.DOG_ID='+q_Dog.FieldByName('DOG_ID').AsString;
end;

procedure Tf_NewMonth.q_NewMonthAfterOpen(DataSet: TDataSet);
begin
  FirstLinksShow:=true;
  FirstPlanShow:=true;
  FirstUslDogShow:=true;
  FirstPricesShow:=true;
  FirstDopShow:=true;
  FirstFinishShow:=true;
end;

procedure Tf_NewMonth.q_TEX_PDBeforeOpen(DataSet: TDataSet);
begin
  q_Tex_PD.SQL[1]:='WHERE GROTP_ID='+IntToStr(CurrentGrOtpId);
end;

procedure Tf_NewMonth.FormCreate(Sender: TObject);
begin
  KindAdd:=AKindAdd;
  IdToSeek:=AIdToSeek;
  IsInitial:=true;

  if KindAdd='SPECIF' then
  Begin
    IsEdit:=false;
    pageTabs.ActivePage:=tabStart;
    PanelR3.Width:=0;
    lb_PriceR3.Visible:=false;
    lb_VBELN.Visible:=false;
  end
  Else
    if KindAdd='MONTH' then
    Begin
      IsEdit:=true;
      pageTabs.ActivePage:=tabStart;
      PanelR3.Width:=0;
      lb_PriceR3.Visible:=false;
      lb_VBELN.Visible:=false;
    end
    else // KindAdd='R3'
    Begin
      IsEdit:=false;
      pageTabs.ActivePage:=tabStart;
    end;
  q_NewMonth.Open;
  if q_NewMonth.Eof then ModalResult:=mrCancel;
  IsInitial:=false;
end;

procedure Tf_NewMonth.ed_StanOtpButtonClick(Sender: TObject);
begin
  KlsMisc2.SetKLSParam('KLS_STAN','CHOOSE',fsNormal,IntToStr(CurrentStanOtpId),'',true);

  with TF_KlsMisc.Create(Self) do
  begin
    if ShowModal=mrOk then
    begin
      CurrentStanOtpId:=StrToInt(KlsMisc2.vIdToSeek);
      ed_StanOtp.Text:=KlsMisc2.ResultName;
      ed_StanOtpKod.Text:=KlsMisc2.ResultName2;
    end;
    Free;
  end;
end;

procedure Tf_NewMonth.ed_StanButtonClick(Sender: TObject);
begin
  KlsMisc2.SetKLSParam('KLS_STAN','CHOOSE',fsNormal,IntToStr(CurrentStanId),'',true);

  with TF_KlsMisc.Create(Self) do
  begin
    if ShowModal=mrOk then
    begin
      CurrentStanId:=StrToInt(KlsMisc2.vIdToSeek);
      ed_Stan.Text:=KlsMisc2.ResultName;
      ed_StanKod.Text:=KlsMisc2.ResultName2;
    end;
    Free;
  end;
end;

procedure Tf_NewMonth.ed_PoluchButtonClick(Sender: TObject);
begin
  KlsMisc2.SetKLSParam('KLS_PREDPR_POLUCH','CHOOSE',fsNormal,IntToStr(CurrentPoluchId),q_NewMonthPOLUCH_NAME.AsString,true);

  with TF_KlsMisc.Create(Self) do
  begin
    if ShowModal=mrOk then
    begin
      CurrentPoluchId:=StrToInt(KlsMisc2.vIdToSeek);
      ed_Poluch.Text:=KlsMisc2.ResultName;
    end;
    Free;
  end;
end;

procedure Tf_NewMonth.ed_PotrebButtonClick(Sender: TObject);
begin
  KlsMisc2.SetKLSParam('KLS_PREDPR_POLUCH','CHOOSE',fsNormal,IntToStr(CurrentPotrebId),q_NewMonthPOTREB_NAME.AsString,true);

  with TF_KlsMisc.Create(Self) do
  begin
    if ShowModal=mrOk then
    begin
      CurrentPotrebId:=StrToInt(KlsMisc2.vIdToSeek);
      ed_Potreb.Text:=KlsMisc2.ResultName;
    end;
    Free;
  end;
end;

procedure Tf_NewMonth.ed_VetkaButtonClick(Sender: TObject);
begin
  KlsMisc2.SetKLSParam('KLS_VETKA','CHOOSE',fsNormal,IntToStr(CurrentVetkaId),q_NewMonthVETKA_NAME.AsString,true);

  with TF_KlsMisc.Create(Self) do
  begin
    if ShowModal=mrOk then
    begin
      CurrentVetkaId:=StrToInt(KlsMisc2.vIdToSeek);
      ed_Vetka.Text:=KlsMisc2.ResultName;
    end;
    Free;
  end;
end;

procedure Tf_NewMonth.q_PlanPostAfterScroll(DataSet: TDataSet);
begin
  q_PlanStru.SQL[14]:=' WHERE ID='+q_PlanPostPLANSTRU_ID.AsString;
  f_db.ReQuery(q_PlanStru,True);
end;

end.
