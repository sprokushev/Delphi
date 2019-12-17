unit zakaz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, Grids, DBGridEh, TB2Item,
  TB2Dock, TB2Toolbar, ActnList, XPStyleActnCtrls, ActnMan, Placemnt,
  DBCtrls, DB, OracleData, Oracle, DateUtils, TB2ExtItems, Menus,DBGridEhImpExp,RxShell, ZakazFilter,
  GridsEh;

type
  Tf_Zakaz = class(TForm)
    acManagerZakaz: TActionManager;
    acZakazRefresh: TAction;
    acRequestConsumerAdd: TAction;
    acRequestConsumerEdit: TAction;
    acRequestConsumerReAddress: TAction;
    acRequestConsumerCancel: TAction;
    acRequestConsumerDel: TAction;
    acRequestConsumerLoadArh: TAction;
    acRequestConsumerCopy: TAction;
    acRequestConsumerLoadParus: TAction;
    acRequestConsumerToDbf: TAction;
    Panel3: TPanel;
    Label6: TLabel;
    edDateFrom: TDateTimePicker;
    Label5: TLabel;
    edDateTo: TDateTimePicker;
    btFilter: TButton;
    btRefresh: TBitBtn;
    tabPostav: TTabSheet;
    tabAgent: TTabSheet;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    TBItem5: TTBItem;
    TBItem4: TTBItem;
    Splitter2: TSplitter;
    PageControlPostav: TPageControl;
    tabPostavInfo: TTabSheet;
    tabPostavHist: TTabSheet;
    TBDock2: TTBDock;
    TBToolbar2: TTBToolbar;
    TBItem7: TTBItem;
    TBItem10: TTBItem;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    tabParus: TTabSheet;
    gridPostav: TDBGridEh;
    Splitter1: TSplitter;
    PageControlAgent: TPageControl;
    tabAgentInfo: TTabSheet;
    tabAgentHist: TTabSheet;
    TBDock3: TTBDock;
    TBToolbar3: TTBToolbar;
    TBItem15: TTBItem;
    TBItem16: TTBItem;
    TBItem17: TTBItem;
    TBItem18: TTBItem;
    Splitter3: TSplitter;
    PageControlParus: TPageControl;
    tabParusInfo: TTabSheet;
    TBDock5: TTBDock;
    TBToolbar5: TTBToolbar;
    TBItem25: TTBItem;
    TBItem27: TTBItem;
    TBItem30: TTBItem;
    TBDock6: TTBDock;
    TBToolbar6: TTBToolbar;
    FormStorage1: TFormStorage;
    acZakazReestrXls: TAction;
    acZakazHistEdit: TAction;
    TBItem19: TTBItem;
    TBItem20: TTBItem;
    acZakazHistDel: TAction;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem6: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBItem9: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBItem14: TTBItem;
    TBItem21: TTBItem;
    TBSeparatorItem5: TTBSeparatorItem;
    TBItem22: TTBItem;
    Panel1: TPanel;
    Panel2: TPanel;
    Label10: TLabel;
    lbPlanNB: TLabel;
    edPostavPlanNB: TDBText;
    lbPlanTRAN: TLabel;
    edPostavPlanTRAN: TDBText;
    lbPlanOther: TLabel;
    edPostavPlanOther: TDBText;
    edPostavProdUtv: TDBText;
    Label13: TLabel;
    edPostavProdZakaz: TDBText;
    Label12: TLabel;
    Label17: TLabel;
    edPostavProdFact: TDBText;
    Label2: TLabel;
    edPostavPlanVNCORTR: TDBText;
    lbPostavDogKind: TLabel;
    lbPostavDogNum: TLabel;
    lbPostavDolgName: TLabel;
    edPostavDolgSum: TDBText;
    Label3: TLabel;
    edPostavDogZakaz: TDBText;
    Label4: TLabel;
    edPostavDogUtv: TDBText;
    Label8: TLabel;
    edPostavDogFact: TDBText;
    Panel4: TPanel;
    Label9: TLabel;
    Label14: TLabel;
    edAgentPlanProd: TDBText;
    edAgentProdUTV: TDBText;
    Label18: TLabel;
    edAgentProdZakaz: TDBText;
    Label19: TLabel;
    Label20: TLabel;
    edAgentProdFact: TDBText;
    Panel5: TPanel;
    lbAgentDogKind: TLabel;
    lbAgentDogNum: TLabel;
    Label25: TLabel;
    edAgentDogZakaz: TDBText;
    Label26: TLabel;
    edAgentDogUTV: TDBText;
    Label28: TLabel;
    edAgentDogFact: TDBText;
    Panel6: TPanel;
    Label23: TLabel;
    Label30: TLabel;
    edParusPlanNB: TDBText;
    Label31: TLabel;
    edParusPlanTRANSIT: TDBText;
    Label32: TLabel;
    edParusPlanAZS: TDBText;
    edParusProdUTV: TDBText;
    Label33: TLabel;
    edParusProdZakaz: TDBText;
    Label34: TLabel;
    Label35: TLabel;
    edParusProdFact: TDBText;
    Label37: TLabel;
    edParusPlanVNCORPTR: TDBText;
    Panel7: TPanel;
    lbParusDogKind: TLabel;
    lbParusDogNum: TLabel;
    lbParusDolgName: TLabel;
    lbParusDolgSum: TDBText;
    Label40: TLabel;
    edParusDogZakaz: TDBText;
    Label41: TLabel;
    edParusDogUTV: TDBText;
    Label43: TLabel;
    edParusDogFact: TDBText;
    oraSes: TOracleSession;
    q_Postav: TOracleDataSet;
    ds_Postav: TDataSource;
    q_PostavID: TFloatField;
    q_PostavDATE_PLAN: TDateTimeField;
    q_PostavCLIENT_NUMBER: TStringField;
    q_PostavCLIENT_DATE: TDateTimeField;
    q_PostavINPUT_NUMBER: TStringField;
    q_PostavINPUT_DATE: TDateTimeField;
    q_PostavBEGIN_DATE: TDateTimeField;
    q_PostavIS_ACCEPT: TIntegerField;
    q_PostavFILIAL_ID: TFloatField;
    q_PostavPLAT_ID: TFloatField;
    q_PostavDOG_ID: TFloatField;
    q_PostavPROD_ID_NPR: TStringField;
    q_PostavUSL_OPL_ID: TFloatField;
    q_PostavLOAD_ABBR: TStringField;
    q_PostavSTAN_ID: TFloatField;
    q_PostavVETKA_ID: TFloatField;
    q_PostavPOLUCH_ID: TFloatField;
    q_PostavPOTREB_ID: TFloatField;
    q_PostavPOTREB_NAME: TStringField;
    q_PostavNEFTEBASA: TStringField;
    q_PostavPAYFORM_ID: TFloatField;
    q_PostavPLANSTRU_ID: TFloatField;
    q_PostavPRICE_CLIENT: TFloatField;
    q_PostavPRICE: TFloatField;
    q_PostavVES: TFloatField;
    q_PostavKOL: TFloatField;
    q_PostavSPEED_VES: TFloatField;
    q_PostavSPEED_KOL: TFloatField;
    q_PostavNOM_ZD_LIST: TStringField;
    q_PostavFACT_VES: TFloatField;
    q_PostavFACT_KOL: TFloatField;
    q_PostavPRIM: TStringField;
    q_PostavGR4: TStringField;
    q_PostavD_PLAN: TStringField;
    q_PostavPLAT_NAME: TStringField;
    q_PostavPLAT_INN: TStringField;
    q_PostavDOG_NUMBER: TStringField;
    q_PostavNAME_NPR: TStringField;
    q_PostavNORMOTGR: TFloatField;
    q_PostavSTAN_KOD: TIntegerField;
    q_PostavSTAN_NAME: TStringField;
    q_PostavUSL_OPL_NAME: TStringField;
    q_PostavFILIAL_NAME: TStringField;
    q_PostavPOLUCH_NAME: TStringField;
    q_PostavPOLUCH_OKPO: TStringField;
    q_PostavPOTREB_NAME_DOP: TStringField;
    q_PostavPAYFORM_NAME: TStringField;
    q_PostavLOAD_NAME: TStringField;
    q_PostavVETKA_NAME: TStringField;
    q_PostavPLANSTRU_NAME: TStringField;
    q_PostavEXIST_CANCEL: TFloatField;
    Label1: TLabel;
    edAgentPlanDog: TDBText;
    q_PostavLOAD_VES: TFloatField;
    q_PostavLOAD_KOL: TFloatField;
    q_Agent: TOracleDataSet;
    q_AgentID: TFloatField;
    q_AgentDATE_PLAN: TDateTimeField;
    q_AgentCLIENT_NUMBER: TStringField;
    q_AgentCLIENT_DATE: TDateTimeField;
    q_AgentINPUT_NUMBER: TStringField;
    q_AgentINPUT_DATE: TDateTimeField;
    q_AgentBEGIN_DATE: TDateTimeField;
    q_AgentIS_ACCEPT: TIntegerField;
    q_AgentFILIAL_ID: TFloatField;
    q_AgentPLAT_ID: TFloatField;
    q_AgentDOG_ID: TFloatField;
    q_AgentPROD_ID_NPR: TStringField;
    q_AgentUSL_OPL_ID: TFloatField;
    q_AgentLOAD_ABBR: TStringField;
    q_AgentSTAN_ID: TFloatField;
    q_AgentVETKA_ID: TFloatField;
    q_AgentPOLUCH_ID: TFloatField;
    q_AgentPOTREB_ID: TFloatField;
    q_AgentPOTREB_NAME: TStringField;
    q_AgentNEFTEBASA: TStringField;
    q_AgentPAYFORM_ID: TFloatField;
    q_AgentPLANSTRU_ID: TFloatField;
    q_AgentPRICE_CLIENT: TFloatField;
    q_AgentPRICE: TFloatField;
    q_AgentVES: TFloatField;
    q_AgentKOL: TFloatField;
    q_AgentSPEED_VES: TFloatField;
    q_AgentSPEED_KOL: TFloatField;
    q_AgentNOM_ZD_LIST: TStringField;
    q_AgentFACT_VES: TFloatField;
    q_AgentFACT_KOL: TFloatField;
    q_AgentPRIM: TStringField;
    q_AgentGR4: TStringField;
    q_AgentD_PLAN: TStringField;
    q_AgentPLAT_NAME: TStringField;
    q_AgentPLAT_INN: TStringField;
    q_AgentDOG_NUMBER: TStringField;
    q_AgentNAME_NPR: TStringField;
    q_AgentNORMOTGR: TFloatField;
    q_AgentSTAN_KOD: TIntegerField;
    q_AgentSTAN_NAME: TStringField;
    q_AgentUSL_OPL_NAME: TStringField;
    q_AgentFILIAL_NAME: TStringField;
    q_AgentPOLUCH_NAME: TStringField;
    q_AgentPOLUCH_OKPO: TStringField;
    q_AgentPOTREB_NAME_DOP: TStringField;
    q_AgentPAYFORM_NAME: TStringField;
    q_AgentLOAD_NAME: TStringField;
    q_AgentVETKA_NAME: TStringField;
    q_AgentPLANSTRU_NAME: TStringField;
    q_AgentEXIST_CANCEL: TFloatField;
    q_AgentLOAD_VES: TFloatField;
    q_AgentLOAD_KOL: TFloatField;
    ds_Agent: TDataSource;
    gridAgent: TDBGridEh;
    q_PostavHist: TOracleDataSet;
    ds_PostavHist: TDataSource;
    q_PostavHistID: TFloatField;
    q_PostavHistZAKAZ_ID: TFloatField;
    q_PostavHistSORTBY: TIntegerField;
    q_PostavHistSTATUS_ZAKAZ_ID: TFloatField;
    q_PostavHistCLIENT_NUMBER: TStringField;
    q_PostavHistCLIENT_DATE: TDateTimeField;
    q_PostavHistINPUT_NUMBER: TStringField;
    q_PostavHistINPUT_DATE: TDateTimeField;
    q_PostavHistPROD_ID_NPR: TStringField;
    q_PostavHistOLD_STAN_ID: TFloatField;
    q_PostavHistSTAN_ID: TFloatField;
    q_PostavHistPOLUCH_ID: TFloatField;
    q_PostavHistPRICE: TFloatField;
    q_PostavHistVES: TFloatField;
    q_PostavHistKOL: TFloatField;
    q_PostavHistSPEED_VES: TFloatField;
    q_PostavHistSPEED_KOL: TFloatField;
    q_PostavHistNOM_ZD: TStringField;
    q_PostavHistFACT_VES: TFloatField;
    q_PostavHistFACT_KOL: TFloatField;
    q_PostavHistGU12_A_ID: TFloatField;
    q_PostavHistIS_AUTO: TIntegerField;
    q_PostavHistBEGIN_DATE: TDateTimeField;
    q_PostavHistGRAFIK: TStringField;
    q_PostavHistPOTREB_ID: TFloatField;
    q_PostavHistSTATUS_ZAKAZ_NAME: TStringField;
    q_PostavHistNAME_NPR: TStringField;
    q_PostavHistNORMOTGR: TFloatField;
    q_PostavHistSTAN_KOD: TIntegerField;
    q_PostavHistSTAN_NAME: TStringField;
    q_PostavHistOLD_STAN_KOD: TIntegerField;
    q_PostavHistOLD_STAN_NAME: TStringField;
    q_PostavHistPOLUCH_NAME: TStringField;
    q_PostavHistPOLUCH_OKPO: TStringField;
    q_PostavHistPOTREB_NAME: TStringField;
    q_PostavHistGU12_A_NUM: TStringField;
    q_PostavHistGU12_A_DATE: TDateTimeField;
    q_PostavHistGU12_A_FROM_DATE: TDateTimeField;
    gridPostavHist: TDBGridEh;
    gridAgentHist: TDBGridEh;
    q_AgentHist: TOracleDataSet;
    q_AgentHistID: TFloatField;
    q_AgentHistZAKAZ_ID: TFloatField;
    q_AgentHistSORTBY: TIntegerField;
    q_AgentHistSTATUS_ZAKAZ_ID: TFloatField;
    q_AgentHistCLIENT_NUMBER: TStringField;
    q_AgentHistCLIENT_DATE: TDateTimeField;
    q_AgentHistINPUT_NUMBER: TStringField;
    q_AgentHistINPUT_DATE: TDateTimeField;
    q_AgentHistPROD_ID_NPR: TStringField;
    q_AgentHistOLD_STAN_ID: TFloatField;
    q_AgentHistSTAN_ID: TFloatField;
    q_AgentHistPOLUCH_ID: TFloatField;
    q_AgentHistPRICE: TFloatField;
    q_AgentHistVES: TFloatField;
    q_AgentHistKOL: TFloatField;
    q_AgentHistSPEED_VES: TFloatField;
    q_AgentHistSPEED_KOL: TFloatField;
    q_AgentHistNOM_ZD: TStringField;
    q_AgentHistFACT_VES: TFloatField;
    q_AgentHistFACT_KOL: TFloatField;
    q_AgentHistGU12_A_ID: TFloatField;
    q_AgentHistIS_AUTO: TIntegerField;
    q_AgentHistBEGIN_DATE: TDateTimeField;
    q_AgentHistGRAFIK: TStringField;
    q_AgentHistPOTREB_ID: TFloatField;
    q_AgentHistSTATUS_ZAKAZ_NAME: TStringField;
    q_AgentHistNAME_NPR: TStringField;
    q_AgentHistNORMOTGR: TFloatField;
    q_AgentHistSTAN_KOD: TIntegerField;
    q_AgentHistSTAN_NAME: TStringField;
    q_AgentHistOLD_STAN_KOD: TIntegerField;
    q_AgentHistOLD_STAN_NAME: TStringField;
    q_AgentHistPOLUCH_NAME: TStringField;
    q_AgentHistPOLUCH_OKPO: TStringField;
    q_AgentHistPOTREB_NAME: TStringField;
    q_AgentHistGU12_A_NUM: TStringField;
    q_AgentHistGU12_A_DATE: TDateTimeField;
    q_AgentHistGU12_A_FROM_DATE: TDateTimeField;
    ds_AgentHist: TDataSource;
    btClearFilter: TButton;
    PageControlZakaz: TPageControl;
    sbAgent: TStatusBar;
    sbParus: TStatusBar;
    sbPostav: TStatusBar;
    pkgFOR_ZAKAZ: TOraclePackage;
    q_PostavPlan: TOracleDataSet;
    q_PostavPlanPLAN_NB: TFloatField;
    q_PostavPlanPLAN_TRAN: TFloatField;
    q_PostavPlanPLAN_VNCORPTR: TFloatField;
    q_PostavPlanPLAN_OTHER: TFloatField;
    ds_PostavPlan: TDataSource;
    q_PostavFact: TOracleDataSet;
    ds_PostavFact: TDataSource;
    q_PostavFactPROD_NAME: TStringField;
    q_PostavFactZAYV_ALL_PROD: TFloatField;
    q_PostavFactZAYV_ACCEPT_PROD: TFloatField;
    q_PostavFactZAYV_FACT_PROD: TFloatField;
    q_PostavFactZAYV_ALL_DOG: TFloatField;
    q_PostavFactZAYV_ACCEPT_DOG: TFloatField;
    q_PostavFactZAYV_FACT_DOG: TFloatField;
    q_PostavFactZAYV_ALL_PLAT: TFloatField;
    q_PostavFactZAYV_ACCEPT_PLAT: TFloatField;
    q_PostavFactZAYV_FACT_PLAT: TFloatField;
    edPostavProdName: TDBText;
    q_PostavDolg: TOracleDataSet;
    ds_PostavDolg: TDataSource;
    q_PostavDolgSALDO: TFloatField;
    q_AgentIS_AGENT: TFloatField;
    q_AgentZAKAZ_PREV_ID: TFloatField;
    q_PostavIS_AGENT: TFloatField;
    q_PostavZAKAZ_PREV_ID: TFloatField;
    q_PostavHistLOAD_VES: TFloatField;
    q_PostavHistLOAD_KOL: TFloatField;
    q_AgentHistLOAD_VES: TFloatField;
    q_AgentHistLOAD_KOL: TFloatField;
    edAgentProdName: TDBText;
    ds_AgentPlan: TDataSource;
    q_AgentPlan: TOracleDataSet;
    q_AgentPlanPLAN_PROD: TFloatField;
    q_AgentPLAN_DOG: TFloatField;
    q_AgentFact: TOracleDataSet;
    StringField1: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    ds_AgentFact: TDataSource;
    pmPostav: TTBPopupMenu;
    TBItem48: TTBItem;
    TBEditItem2: TTBEditItem;
    TBItem49: TTBItem;
    TBItem50: TTBItem;
    TBSeparatorItem14: TTBSeparatorItem;
    tbCallOutWinEdit: TTBItem;
    pmAgent: TTBPopupMenu;
    TBItem23: TTBItem;
    TBEditItem1: TTBEditItem;
    TBItem24: TTBItem;
    TBItem26: TTBItem;
    TBSeparatorItem6: TTBSeparatorItem;
    TBItem28: TTBItem;
    pmPostavHist: TTBPopupMenu;
    TBItem29: TTBItem;
    TBEditItem3: TTBEditItem;
    TBItem31: TTBItem;
    TBItem32: TTBItem;
    TBSeparatorItem7: TTBSeparatorItem;
    TBItem33: TTBItem;
    pmAgentHist: TTBPopupMenu;
    TBItem34: TTBItem;
    TBEditItem4: TTBEditItem;
    TBItem35: TTBItem;
    TBItem36: TTBItem;
    TBSeparatorItem8: TTBSeparatorItem;
    TBItem37: TTBItem;
    TBItem38: TTBItem;
    SaveDialog1: TSaveDialog;
    TBItem39: TTBItem;
    TBSeparatorItem10: TTBSeparatorItem;
    TBItem40: TTBItem;
    TBSeparatorItem11: TTBSeparatorItem;
    TBItem41: TTBItem;
    TBSeparatorItem12: TTBSeparatorItem;
    TBItem42: TTBItem;
    TBItem43: TTBItem;
    acRequestConsumerReAddressAdd: TAction;
    acRequestConsumerCancelAdd: TAction;
    TBItem44: TTBItem;
    TBItem45: TTBItem;
    TBItem46: TTBItem;
    TBItem47: TTBItem;
    acRequestConsumerAddOtgr: TAction;
    TBItem51: TTBItem;
    TBItem52: TTBItem;
    q_PostavPOLUCH_GDKOD: TStringField;
    q_PostavPOLUCH_ADDR: TStringField;
    q_PostavPOTREB_OKPO: TStringField;
    q_PostavPOTREB_GDKOD: TStringField;
    q_PostavPOTREB_ADDR: TStringField;
    q_AgentPOLUCH_GDKOD: TStringField;
    q_AgentPOLUCH_ADDR: TStringField;
    q_AgentPOTREB_OKPO: TStringField;
    q_AgentPOTREB_GDKOD: TStringField;
    q_AgentPOTREB_ADDR: TStringField;
    q_PostavHistPOLUCH_GDKOD: TStringField;
    q_PostavHistPOLUCH_ADDR: TStringField;
    q_PostavHistPOTREB_OKPO: TStringField;
    q_PostavHistPOTREB_GDKOD: TStringField;
    q_PostavHistPOTREB_ADDR: TStringField;
    q_AgentHistPOLUCH_GDKOD: TStringField;
    q_AgentHistPOLUCH_ADDR: TStringField;
    q_AgentHistPOTREB_OKPO: TStringField;
    q_AgentHistPOTREB_GDKOD: TStringField;
    q_AgentHistPOTREB_ADDR: TStringField;
    acZakazHistWord: TAction;
    TBSeparatorItem13: TTBSeparatorItem;
    TBItem53: TTBItem;
    TBSeparatorItem15: TTBSeparatorItem;
    TBItem54: TTBItem;
    TBItem55: TTBItem;
    TBItem56: TTBItem;
    TBItem57: TTBItem;
    TBItem58: TTBItem;
    TBItem59: TTBItem;
    TBItem60: TTBItem;
    TBItem61: TTBItem;
    TBItem62: TTBItem;
    TBItem63: TTBItem;
    TBItem64: TTBItem;
    TBItem65: TTBItem;
    TBItem66: TTBItem;
    TBItem67: TTBItem;
    TBItem68: TTBItem;
    TBItem69: TTBItem;
    TBItem70: TTBItem;
    TBItem71: TTBItem;
    TBItem72: TTBItem;
    TBItem73: TTBItem;
    TBItem74: TTBItem;
    TBItem75: TTBItem;
    TBItem76: TTBItem;
    TBItem77: TTBItem;
    TBItem78: TTBItem;
    TBItem79: TTBItem;
    TBItem80: TTBItem;
    TBItem81: TTBItem;
    TBItem82: TTBItem;
    TBItem83: TTBItem;
    TBItem84: TTBItem;
    TBItem85: TTBItem;
    TBItem86: TTBItem;
    TBItem87: TTBItem;
    TBItem88: TTBItem;
    TBItem89: TTBItem;
    TBItem90: TTBItem;
    TBItem91: TTBItem;
    TBItem92: TTBItem;
    TBItem93: TTBItem;
    TBItem94: TTBItem;
    q_Parus: TOracleDataSet;
    q_ParusDATE_PLAN: TDateTimeField;
    q_ParusCLIENT_NUMBER: TStringField;
    q_ParusCLIENT_DATE: TDateTimeField;
    q_ParusINPUT_NUMBER: TStringField;
    q_ParusINPUT_DATE: TDateTimeField;
    q_ParusIS_ACCEPT: TIntegerField;
    q_ParusNEFTEBASA: TStringField;
    q_ParusPRICE_CLIENT: TFloatField;
    q_ParusPRICE: TFloatField;
    q_ParusVES: TFloatField;
    q_ParusFACT_VES: TFloatField;
    q_ParusPRIM: TStringField;
    q_ParusD_PLAN: TStringField;
    q_ParusPARUS_AGENT_NAME: TStringField;
    q_ParusPARUS_DOGOVOR: TStringField;
    q_ParusPARUS_NOMEN_NAME: TStringField;
    q_ParusUSL_OPL_NAME: TStringField;
    q_ParusFILIAL_NAME: TStringField;
    q_ParusPOLUCH_NAME: TStringField;
    q_ParusPOTREB_NAME: TStringField;
    ds_Parus: TDataSource;
    q_ParusPARUS_RN: TFloatField;
    q_ParusIS_AGENT: TFloatField;
    q_ParusIS_WORK: TIntegerField;
    q_ParusFILIAL_ID: TFloatField;
    q_ParusPARUS_AGENT_TAG: TStringField;
    q_ParusPARUS_NOMEN_TAG: TStringField;
    q_ParusUSL_OPL_ID: TFloatField;
    gridParus: TDBGridEh;
    pmParus: TTBPopupMenu;
    TBItem95: TTBItem;
    TBItem96: TTBItem;
    TBEditItem5: TTBEditItem;
    TBItem97: TTBItem;
    TBItem98: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBItem99: TTBItem;
    TBSeparatorItem16: TTBSeparatorItem;
    TBItem109: TTBItem;
    TBItem111: TTBItem;
    edParusProdName: TDBText;
    q_ParusPlan: TOracleDataSet;
    q_ParusPLAN_NB: TFloatField;
    q_ParusPLAN_AZS: TFloatField;
    q_ParusPLAN_VNCORPTR: TFloatField;
    q_ParusPLAN_TRAN: TFloatField;
    ds_ParusPlan: TDataSource;
    q_ParusFact: TOracleDataSet;
    q_ParusPROD_NAME: TStringField;
    q_ParusZAYV_ALL_PROD: TFloatField;
    q_ParusZAYV_ACCEPT_PROD: TFloatField;
    q_ParusZAYV_FACT_PROD: TFloatField;
    q_ParusZAYV_ALL_DOG: TFloatField;
    q_ParusZAYV_ACCEPT_DOG: TFloatField;
    q_ParusZAYV_FACT_DOG: TFloatField;
    q_ParusZAYV_ALL_PLAT: TFloatField;
    q_ParusZAYV_ACCEPT_PLAT: TFloatField;
    q_ParusZAYV_FACT_PLAT: TFloatField;
    ds_ParusFact: TDataSource;
    q_ParusDolg: TOracleDataSet;
    q_ParusDolgSALDO: TFloatField;
    ds_ParusDolg: TDataSource;
    q_AgentLUK_PLAT_ID: TFloatField;
    q_AgentLUK_PLAT_NAME: TStringField;
    q_AgentLUK_DOG_ID: TFloatField;
    q_AgentLUK_DOG_NUMBER: TStringField;
    q_AgentGOSPROG_NAME: TStringField;
    q_AgentGP_NAPR_NAME: TStringField;
    q_PostavLUK_PLAT_ID: TFloatField;
    q_PostavLUK_PLAT_NAME: TStringField;
    q_PostavLUK_DOG_ID: TFloatField;
    q_PostavLUK_DOG_NUMBER: TStringField;
    q_PostavGOSPROG_NAME: TStringField;
    q_PostavGP_NAPR_NAME: TStringField;
    q_PostavGOSPROG_ID: TIntegerField;
    q_PostavGP_NAPR_ID: TFloatField;
    q_AgentGOSPROG_ID: TIntegerField;
    q_AgentGP_NAPR_ID: TFloatField;
    q_AgentHistLINK_ID: TFloatField;
    q_AgentHistLINK_HIST_ID: TFloatField;
    q_AgentHistIS_AUTO_MONTH: TIntegerField;
    q_PostavHistLINK_ID: TFloatField;
    q_PostavHistLINK_HIST_ID: TFloatField;
    q_PostavHistIS_AUTO_MONTH: TIntegerField;
    q_AgentIS_AUTO: TIntegerField;
    q_AgentLINK_ID: TFloatField;
    q_AgentLINK_HIST_ID: TFloatField;
    q_PostavIS_AUTO: TIntegerField;
    q_PostavLINK_ID: TFloatField;
    q_PostavLINK_HIST_ID: TFloatField;
    q_AgentAGENT_NAME: TStringField;
    q_AgentAGENT_STAFF: TStringField;
    q_AgentAGENT_DIRECTOR: TStringField;
    q_PostavAGENT_NAME: TStringField;
    q_PostavAGENT_STAFF: TStringField;
    q_PostavAGENT_DIRECTOR: TStringField;
    q_PostavHistUNP_NUMBER: TStringField;
    TBSeparatorItem2: TTBSeparatorItem;
    acZakazLinkMonth: TAction;
    acZakazLinkZakazUNP: TAction;
    acZakazLinkZakazSNP: TAction;
    TBSeparatorItem17: TTBSeparatorItem;
    TBSubmenuItem2: TTBSubmenuItem;
    TBItem8: TTBItem;
    TBItem13: TTBItem;
    TBSeparatorItem18: TTBSeparatorItem;
    TBSubmenuItem1: TTBSubmenuItem;
    TBItem100: TTBItem;
    q_PostavAGENT_ID: TFloatField;
    q_PostavHistPOLUCH_KSSS: TFloatField;
    q_PostavHistPOTREB_KSSS: TFloatField;
    q_AgentHistPOLUCH_KSSS: TFloatField;
    q_AgentHistPOTREB_KSSS: TFloatField;
    q_PostavPOLUCH_KSSS: TFloatField;
    q_PostavPOTREB_KSSS: TFloatField;
    q_AgentPOLUCH_KSSS: TFloatField;
    q_AgentPOTREB_KSSS: TFloatField;
    q_PostavPERIOD_NAME: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gridPostavColumns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure gridAgentColumns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure FormCreate(Sender: TObject);
    procedure edDateFromChange(Sender: TObject);
    procedure edDateToChange(Sender: TObject);
    procedure acZakazRefreshExecute(Sender: TObject);
    procedure gridPostavExit(Sender: TObject);
    procedure gridAgentExit(Sender: TObject);
    procedure gridAgentHistExit(Sender: TObject);
    procedure gridPostavHistExit(Sender: TObject);
    procedure btClearFilterClick(Sender: TObject);
    procedure q_PostavAfterScroll(DataSet: TDataSet);
    procedure PageControlZakazChange(Sender: TObject);
    procedure PageControlPostavChange(Sender: TObject);
    procedure tabAgentShow(Sender: TObject);
    procedure tabAgentHistShow(Sender: TObject);
    procedure tabAgentInfoShow(Sender: TObject);
    procedure tabParusShow(Sender: TObject);
    procedure tabParusInfoShow(Sender: TObject);
    procedure tabPostavShow(Sender: TObject);
    procedure tabPostavHistShow(Sender: TObject);
    procedure tabPostavInfoShow(Sender: TObject);
    procedure PageControlAgentChange(Sender: TObject);
    procedure PageControlParusChange(Sender: TObject);
    procedure FormStorage1RestorePlacement(Sender: TObject);
    procedure q_AgentAfterScroll(DataSet: TDataSet);
    procedure gridAgentSortMarkingChanged(Sender: TObject);
    procedure gridPostavSortMarkingChanged(Sender: TObject);
    procedure gridPostavHistSortMarkingChanged(Sender: TObject);
    procedure gridAgentHistSortMarkingChanged(Sender: TObject);
    procedure TBEditItem2AcceptText(Sender: TObject; var NewText: String;
      var Accept: Boolean);
    procedure TBItem49Click(Sender: TObject);
    procedure TBItem50Click(Sender: TObject);
    procedure tbCallOutWinEditClick(Sender: TObject);
    procedure q_PostavFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure q_AgentFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure q_PostavHistFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure q_AgentHistFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure TBEditItem1AcceptText(Sender: TObject; var NewText: String;
      var Accept: Boolean);
    procedure TBItem24Click(Sender: TObject);
    procedure TBItem26Click(Sender: TObject);
    procedure TBItem28Click(Sender: TObject);
    procedure TBEditItem3AcceptText(Sender: TObject; var NewText: String;
      var Accept: Boolean);
    procedure TBItem31Click(Sender: TObject);
    procedure TBItem32Click(Sender: TObject);
    procedure TBItem33Click(Sender: TObject);
    procedure TBEditItem4AcceptText(Sender: TObject; var NewText: String;
      var Accept: Boolean);
    procedure TBItem35Click(Sender: TObject);
    procedure TBItem36Click(Sender: TObject);
    procedure TBItem37Click(Sender: TObject);
    procedure TBItem38Click(Sender: TObject);
    procedure TBItem39Click(Sender: TObject);
    procedure TBItem40Click(Sender: TObject);
    procedure TBItem41Click(Sender: TObject);
    procedure btFilterClick(Sender: TObject);
    procedure TBItem42Click(Sender: TObject);
    procedure TBItem43Click(Sender: TObject);
    procedure acRequestConsumerAddExecute(Sender: TObject);
    procedure acRequestConsumerEditExecute(Sender: TObject);
    procedure acRequestConsumerDelExecute(Sender: TObject);
    procedure acRequestConsumerCopyExecute(Sender: TObject);
    procedure acRequestConsumerReAddressExecute(Sender: TObject);
    procedure acRequestConsumerCancelExecute(Sender: TObject);
    procedure acRequestConsumerReAddressAddExecute(Sender: TObject);
    procedure acRequestConsumerCancelAddExecute(Sender: TObject);
    procedure acZakazHistEditExecute(Sender: TObject);
    procedure acRequestConsumerAddOtgrExecute(Sender: TObject);
    procedure acZakazHistDelExecute(Sender: TObject);
    procedure acZakazHistWordExecute(Sender: TObject);
    procedure acZakazReestrXlsExecute(Sender: TObject);
    procedure acRequestConsumerToDbfExecute(Sender: TObject);
    procedure gridParusColumns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure TBEditItem5AcceptText(Sender: TObject; var NewText: String;
      var Accept: Boolean);
    procedure TBItem97Click(Sender: TObject);
    procedure TBItem98Click(Sender: TObject);
    procedure TBItem99Click(Sender: TObject);
    procedure TBItem109Click(Sender: TObject);
    procedure gridParusExit(Sender: TObject);
    procedure gridParusSortMarkingChanged(Sender: TObject);
    procedure q_ParusAfterScroll(DataSet: TDataSet);
    procedure q_ParusFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure FormShow(Sender: TObject);
    procedure acZakazLinkMonthExecute(Sender: TObject);
    procedure acZakazLinkZakazUNPExecute(Sender: TObject);
    procedure acZakazLinkZakazSNPExecute(Sender: TObject);
  private
    { Private declarations }
    IsRefresh: boolean; // В данный момент происходит обновление запроса
    DoRefresh: boolean; // Необходимо провести обновление запроса
    // Фильтры для кнопки "Фильтр"
    FilterPostav: string; // Фильтр для q_Postav
    FilterAgent: string; // Фильтр для q_Agent
    FilterParus: string; // Фильтр для q_Parus
    // Фильтры для грида
    Filter2Postav: TStringList; // Фильтр для gridPostav
    Filter2Agent: TStringList; // Фильтр для gridAgent
    Filter2PostavHist: TStringList; // Фильтр для gridPostavHist
    Filter2AgentHist: TStringList; // Фильтр для gridAgentHist
    Filter2Parus: TStringList; // Фильтр для gridParus

    ZakazFilterAgent:TF_ZakazFilter;
    ZakazFilterPostav:TF_ZakazFilter;
    ZakazFilterParus:TF_ZakazFilter;

    excel        : variant;
    AgentID:integer;
    ViewLinkMode:integer; // 1-отбор по связям
    ViewLinkFilter:string; // Фильтр для реализации связей
    procedure SaveToWord(q_Source:TOracleDataSet;q_SourceHist:TOracleDataSet);
    procedure SaveToExcel(q_Source:TOracleDataSet);
    procedure xlDrawCell(r1, c1, r2, c2: integer; text: string;border: boolean;fsize:integer);
  public
    { Public declarations }
  end;

var
  f_Zakaz: Tf_Zakaz;
  gAgentID:integer;
  gLinkMode:integer; // Режим просмтора: 1-по связям 0-стандартный просмотр
  gLinkFilter:string; // Строка для филтра по связям

implementation

uses ForDB, main, ZakazNew, ZakazHistNew, ForFiles, ComObj, OleServer, ExcelXP,
  OraToDbf, oper_zayav;

{$R *.dfm}

procedure Tf_Zakaz.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    if ZakazFilterAgent<>nil then ZakazFilterAgent.Free;
    if ZakazFilterPostav<>nil then ZakazFilterPostav.Free;
    if ZakazFilterParus<>nil then ZakazFilterParus.Free;
    filter2postav.Clear;
    filter2agent.Clear;
    filter2postavhist.Clear;
    filter2agenthist.Clear;
    filter2parus.Clear;
  except
  end;
  oraSes.Commit;
  oraSes.Connected:=false;
  Action:=caFree;
end;

procedure Tf_Zakaz.gridPostavColumns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text:=IntToStr(q_Postav.RecNo);
end;

procedure Tf_Zakaz.gridAgentColumns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text:=IntToStr(q_Agent.RecNo);
end;

procedure Tf_Zakaz.FormCreate(Sender: TObject);
var i:integer;
begin
  f_db.SetUserGrants(acManagerZakaz);
  AgentID:=gAgentID;
  ViewLinkMode:=gLinkMode;
  ViewLinkFilter:=gLinkFilter;
  gLinkMode:=0;
  gLinkFilter:='';

  q_Postav.DisableControls;
  q_Agent.DisableControls;
  q_Parus.DisableControls;

  f_db.LogonMasterSession(oraSes);

  edDateFrom.Date:=StartOfTheMonth(Now);
  edDateTo.Date:=EndOfTheMonth(Now);

  Filter2postav:=TStringList.Create;
  Filter2postav.Clear;
  Filter2agent:=TStringList.Create;
  Filter2agent.Clear;
  Filter2postavhist:=TStringList.Create;
  Filter2postavhist.Clear;
  Filter2agenthist:=TStringList.Create;
  Filter2agenthist.Clear;
  Filter2parus:=TStringList.Create;
  Filter2parus.Clear;

  DoRefresh:=true;
  PageControlZakazChange(Sender);

  // Проверяем права
  if f_db.CheckGrant('acRequestConsumerConfirm') then
  Begin
    // доступны подтверждения
    gridPostav.columns[1].ReadOnly:=false;
    gridAgent.columns[1].ReadOnly:=false;
    gridParus.columns[1].ReadOnly:=false;
    gridParus.columns[2].ReadOnly:=false;
  End;

  ZakazFilterAgent:=nil;
  ZakazFilterPostav:=nil;
  ZakazFilterParus:=nil;


end;

procedure Tf_Zakaz.edDateFromChange(Sender: TObject);
begin
  DoRefresh:=true;
end;

procedure Tf_Zakaz.edDateToChange(Sender: TObject);
begin
  DoRefresh:=true;
end;

procedure Tf_Zakaz.acZakazRefreshExecute(Sender: TObject);
var i:integer;
begin
  if FilterPostav='' then
    q_Postav.SQL[37]:=' AND 1=1'
  else
    q_Postav.SQL[37]:=FilterPostav;

  if FilterAgent='' then
    q_Agent.SQL[37]:=' AND 1=1'
  else
    q_Agent.SQL[37]:=FilterAgent;

  if FilterParus='' then
    q_Parus.SQL[19]:=' AND 1=1'
  else
    q_Parus.SQL[19]:=FilterParus;

  //Чей заказ
  If AgentID=2641 then
  Begin
    // Заказы ЛУКОЙЛ-СНП
    q_Postav.SQL[35]:=' AND mon.is_agent=2 ';
    tabPostav.Caption:='Отгрузка с УНП (ЛУКОЙЛ-СНП)';
    // Заказы по Агентскому договору
    q_Agent.SQL[35]:=' AND mon.is_agent=1 AND mon.DATE_PLAN<TO_DATE(''01.01.2005'',''dd.mm.yyyy'') ';
    tabAgent.Caption:='Отгрузка с УНП (Агентский договор)';
  end
  else
  Begin
    // Заказы ЛУКОЙЛ-УНП
    q_Agent.SQL[35]:=' AND mon.IS_AGENT=1 ';
    tabAgent.Caption:='Заказы клиентов ЛУКОЙЛ-УНП и Компании';

    tabPostav.TabVisible:=false;
    tabParus.TabVisible:=false;
    PageControlZakaz.ActivePage:=tabAgent;
  end;

  If (ViewLinkMode=1) and (ViewLinkFilter<>'') Then
    begin
      q_Postav.SQl[36]:=' AND '+ViewLinkFilter;
      q_Agent.SQl[36]:=' AND '+ViewLinkFilter;
      q_Parus.SQl[18]:=' AND 1=0';
    end
    else
    begin
      //Месяц
      q_Postav.SQl[36]:=' and mon.date_plan>=TO_DATE('''+FormatDateTime('dd.mm.yyyy',edDateFrom.Date)+''',''dd.mm.yyyy'') '+
                        ' and mon.date_plan<=TO_DATE('''+FormatDateTime('dd.mm.yyyy',edDateTo.Date)+''',''dd.mm.yyyy'')';
      q_Agent.SQl[36]:=' and mon.date_plan>=TO_DATE('''+FormatDateTime('dd.mm.yyyy',edDateFrom.Date)+''',''dd.mm.yyyy'') '+
                        ' and mon.date_plan<=TO_DATE('''+FormatDateTime('dd.mm.yyyy',edDateTo.Date)+''',''dd.mm.yyyy'')';
      q_Parus.SQl[18]:=' and mon.date_plan>=TO_DATE('''+FormatDateTime('dd.mm.yyyy',edDateFrom.Date)+''',''dd.mm.yyyy'') '+
                        ' and mon.date_plan<=TO_DATE('''+FormatDateTime('dd.mm.yyyy',edDateTo.Date)+''',''dd.mm.yyyy'')';
    end;
    
  IsRefresh:=true;

  if PageControlZakaz.ActivePage=tabAgent then
  Begin
    f_db.ReQuery(q_Agent,true);
    pkgFOR_ZAKAZ.CallProcedure('EmptyTemp',[1]);
    if filter2agent.Count=0 then
    for i:=1 to q_Agent.FieldCount do
    Begin
      Filter2Agent.Add('');
    end;
  end;
  if PageControlZakaz.ActivePage=tabPostav then
  Begin
    f_db.ReQuery(q_Postav,true);
    pkgFOR_ZAKAZ.CallProcedure('EmptyTemp',[2]);
    if filter2postav.Count=0 then
    for i:=1 to q_Postav.FieldCount do
    Begin
      Filter2postav.Add('');
    end;
  end;
  if PageControlZakaz.ActivePage=tabParus then
  Begin
    f_db.ReQuery(q_Parus,true);
    pkgFOR_ZAKAZ.CallProcedure('EmptyTemp',[9]);
    if filter2parus.Count=0 then
    for i:=1 to q_Parus.FieldCount do
    Begin
      Filter2parus.Add('');
    end;
  end;

  IsRefresh:=false;

  if PageControlZakaz.ActivePage=tabAgent then
  Begin
    q_AgentAfterScroll(q_Agent);
  end;
  if PageControlZakaz.ActivePage=tabPostav then
  Begin
    q_PostavAfterScroll(q_Postav);
  end;
  if PageControlZakaz.ActivePage=tabParus then
  Begin
    q_ParusAfterScroll(q_Parus);
  end;

  DoRefresh:=false;
end;

procedure Tf_Zakaz.gridPostavExit(Sender: TObject);
begin
  if q_Postav.State=dsEdit then q_Postav.Post;
end;

procedure Tf_Zakaz.gridAgentExit(Sender: TObject);
begin
  if q_Agent.State=dsEdit then q_Agent.Post;
end;

procedure Tf_Zakaz.gridAgentHistExit(Sender: TObject);
begin
  if q_AgentHist.State=dsEdit then q_AgentHist.Post;
end;

procedure Tf_Zakaz.gridPostavHistExit(Sender: TObject);
begin
  if q_PostavHist.State=dsEdit then q_PostavHist.Post;
end;

procedure Tf_Zakaz.btClearFilterClick(Sender: TObject);
begin
  if PageControlZakaz.ActivePage=tabAgent then
  Begin
    FilterAgent:='';
    ZakazFilterAgent.ClearFields;
  End;
  if PageControlZakaz.ActivePage=tabPostav then
  Begin
    FilterPostav:='';
    ZakazFilterPostav.ClearFields;
  End;
  if PageControlZakaz.ActivePage=tabParus then
  Begin
    FilterParus:='';
    ZakazFilterParus.ClearFields;
  End;
  acZakazRefreshExecute(Sender);
end;

procedure Tf_Zakaz.q_PostavAfterScroll(DataSet: TDataSet);
var i:integer;
begin
  if IsRefresh then exit;
  if NOT Active then exit;
  if PageControlZakaz.ActivePage<>tabPostav then exit;

  // История заказа
  if PageControlPostav.ActivePage=tabPostavHist then
  Begin
    q_PostavHist.Close;
    q_PostavHist.Open;
    if filter2postavhist.Count=0 then
    for i:=1 to q_PostavHist.FieldCount do
    Begin
      Filter2postavhist.Add('');
    end;
  end;

  // Доп информация
  if PageControlPostav.ActivePage=tabPostavInfo then
  Begin
    q_PostavPlan.Close;
    q_PostavFact.Close;
    q_PostavDolg.Close;

    if q_Postav.Eof then exit;

    if q_PostavFILIAL_NAME.AsString<>'' then
      tabPostavInfo.Caption:='Информация ('+q_PostavFILIAL_NAME.AsString+')'
    else
      tabPostavInfo.Caption:='Информация';

    // Обновить данные во временной таблице
    pkgFOR_ZAKAZ.CallProcedure('FillTemp',[2,DateOf(edDateFrom.Date),DateOf(edDateTo.Date),q_PostavID.AsInteger]);

    if (q_PostavDOG_NUMBER.AsString='') OR (q_PostavDOG_NUMBER.AsString='0')then
    Begin
      lbPostavDogKind.Caption:='По контрагенту';
      lbPostavDogNum.Caption:=q_PostavPLAT_NAME.AsString;
      edPostavDogZakaz.DATAFIELD:='ZAYV_ALL_PLAT';
      edPostavDogUtv.DATAFIELD:='ZAYV_ACCEPT_PLAT';
      edPostavDogFact.DATAFIELD:='ZAYV_FACT_PLAT';
    end
    else
    Begin
      lbPostavDogKind.Caption:='По договору';
      lbPostavDogNum.Caption:=q_PostavDOG_NUMBER.AsString;
      edPostavDogZakaz.DATAFIELD:='ZAYV_ALL_DOG';
      edPostavDogUtv.DATAFIELD:='ZAYV_ACCEPT_DOG';
      edPostavDogFact.DATAFIELD:='ZAYV_FACT_DOG';
    end;

    q_PostavPlan.Open;
    q_PostavFact.Open;
    q_PostavDolg.Open;

    if NOT q_PostavDolg.Eof then
      if q_PostavDolgSALDO.AsFloat<0 then lbPostavDolgName.Caption:='Кредиторская задолженность:'
      else if q_PostavDolgSALDO.AsFloat=0 then lbPostavDolgName.Caption:='Задолженности нет'
           else lbPostavDolgName.Caption:='Дебиторская задолженность:'
    else
      lbPostavDolgName.Caption:='Данных по задолженности нет';

  end;
end;

procedure Tf_Zakaz.PageControlZakazChange(Sender: TObject);
begin
  // Действия при смене страницы

  if PageControlZakaz.ActivePage=tabAgent then
  if DoRefresh or not q_Agent.Active then
  Begin
    acZakazRefreshExecute(Sender);
  end;

  if PageControlZakaz.ActivePage=tabPostav then
  if DoRefresh or not q_Postav.Active then
  Begin
    acZakazRefreshExecute(Sender);
  end;

  if PageControlZakaz.ActivePage=tabParus then
  if DoRefresh or not q_Parus.Active then
  Begin
    acZakazRefreshExecute(Sender);
  end;

end;

procedure Tf_Zakaz.PageControlPostavChange(Sender: TObject);
begin
  q_PostavAfterScroll(q_Postav);
end;

procedure Tf_Zakaz.tabAgentShow(Sender: TObject);
begin
  PageControlZakazChange(Sender);
end;

procedure Tf_Zakaz.tabAgentHistShow(Sender: TObject);
begin
  PageControlAgentChange(Sender);
end;

procedure Tf_Zakaz.tabAgentInfoShow(Sender: TObject);
begin
  PageControlAgentChange(Sender);
end;

procedure Tf_Zakaz.tabParusShow(Sender: TObject);
begin
  PageControlZakazChange(Sender);
end;

procedure Tf_Zakaz.tabParusInfoShow(Sender: TObject);
begin
  PageControlParusChange(Sender);
end;

procedure Tf_Zakaz.tabPostavShow(Sender: TObject);
begin
  PageControlZakazChange(Sender);
end;

procedure Tf_Zakaz.tabPostavHistShow(Sender: TObject);
begin
  PageControlPostavChange(Sender);
end;

procedure Tf_Zakaz.tabPostavInfoShow(Sender: TObject);
begin
  PageControlPostavChange(Sender);
end;

procedure Tf_Zakaz.PageControlAgentChange(Sender: TObject);
begin
  q_AgentAfterScroll(q_Agent);
end;

procedure Tf_Zakaz.PageControlParusChange(Sender: TObject);
begin
    q_ParusAfterScroll(q_Parus);
end;

procedure Tf_Zakaz.FormStorage1RestorePlacement(Sender: TObject);
begin
  PageControlZakazChange(Sender);
  PageControlAgentChange(Sender);
  PageControlPostavChange(Sender);
  PageControlParusChange(Sender);
  q_Postav.EnableControls;
  q_Agent.EnableControls;
  q_Parus.EnableControls;
end;

procedure Tf_Zakaz.q_AgentAfterScroll(DataSet: TDataSet);
var i:integer;
begin
  if IsRefresh then exit;
  if NOT Active then exit;
  if PageControlZakaz.ActivePage<>tabAgent then exit;

  // История заказа
  if PageControlAgent.ActivePage=tabAgentHist then
  Begin
    q_AgentHist.Close;
    q_AgentHist.Open;
    if filter2agenthist.Count=0 then
    for i:=1 to q_AgentHist.FieldCount do
    Begin
      Filter2AgentHist.Add('');
    end;
  end;

  // Доп информация
  if PageControlAgent.ActivePage=tabAgentInfo then
  Begin
    q_AgentPlan.Close;
    q_AgentFact.Close;

    if q_Agent.Eof then exit;

    if q_AgentFILIAL_NAME.AsString<>'' then
      tabAgentInfo.Caption:='Информация ('+q_AgentFILIAL_NAME.AsString+')'
    else
      tabAgentInfo.Caption:='Информация';

    // Обновить данные во временной таблице
    pkgFOR_ZAKAZ.CallProcedure('FillTemp',[1,DateOf(edDateFrom.Date),DateOf(edDateTo.Date),q_AgentID.AsInteger]);

    if (q_AgentDOG_NUMBER.AsString='') OR (q_AgentDOG_NUMBER.AsString='0')then
    Begin
      lbAgentDogKind.Caption:='По контрагенту';
      lbAgentDogNum.Caption:=q_AgentPLAT_NAME.AsString;
      edAgentDogZakaz.DATAFIELD:='ZAYV_ALL_PLAT';
      edAgentDogUtv.DATAFIELD:='ZAYV_ACCEPT_PLAT';
      edAgentDogFact.DATAFIELD:='ZAYV_FACT_PLAT';
    end
    else
    Begin
      lbAgentDogKind.Caption:='По договору';
      lbAgentDogNum.Caption:=q_AgentDOG_NUMBER.AsString;
      edAgentDogZakaz.DATAFIELD:='ZAYV_ALL_DOG';
      edAgentDogUtv.DATAFIELD:='ZAYV_ACCEPT_DOG';
      edAgentDogFact.DATAFIELD:='ZAYV_FACT_DOG';
    end;

    q_AgentPlan.Open;
    q_AgentFact.Open;

  end;
end;

procedure Tf_Zakaz.gridAgentSortMarkingChanged(Sender: TObject);
begin
  IsRefresh:=true;
  f_db.SortInGrid(q_Agent,q_Agent.SQL.Count-1,gridAgent);
  IsRefresh:=false;
  q_AgentAfterScroll(q_Agent);
end;

procedure Tf_Zakaz.gridPostavSortMarkingChanged(Sender: TObject);
begin
  IsRefresh:=true;
  f_db.SortInGrid(q_Postav,q_Postav.SQL.Count-1,gridPostav);
  IsRefresh:=false;
  q_PostavAfterScroll(q_Postav);
end;

procedure Tf_Zakaz.gridPostavHistSortMarkingChanged(Sender: TObject);
begin
  IsRefresh:=true;
  f_db.SortInGrid(q_PostavHist,q_PostavHist.SQL.Count-1,gridPostavHist);
  IsRefresh:=false;
//  q_PostavHistAfterScroll(q_PostavHist);
end;

procedure Tf_Zakaz.gridAgentHistSortMarkingChanged(Sender: TObject);
begin
  IsRefresh:=true;
  f_db.SortInGrid(q_AgentHist,q_AgentHist.SQL.Count-1,gridAgentHist);
  IsRefresh:=false;
//  q_AgentHistAfterScroll(q_Agent);
end;

procedure Tf_Zakaz.TBEditItem2AcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  IsRefresh:=true;
  f_db.FilterAcceptText(gridPostav,filter2postav,NewText,Accept);
  IsRefresh:=false;
  q_PostavAfterScroll(q_Postav);
end;

procedure Tf_Zakaz.TBItem49Click(Sender: TObject);
begin
  IsRefresh:=true;
  f_db.FilterCurrentValue(gridPostav,filter2postav);
  IsRefresh:=false;
  q_PostavAfterScroll(q_Postav);
end;

procedure Tf_Zakaz.TBItem50Click(Sender: TObject);
begin
  IsRefresh:=true;
  f_db.FilterCLear(gridPostav,filter2postav);
  IsRefresh:=false;
  q_PostavAfterScroll(q_Postav);
end;

procedure Tf_Zakaz.tbCallOutWinEditClick(Sender: TObject);
begin
  f_db.EditInMemo(gridPostav);
end;

procedure Tf_Zakaz.q_PostavFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:=f_db.AcceptFilterRecord(gridPostav,filter2postav);
end;

procedure Tf_Zakaz.q_AgentFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:=f_db.AcceptFilterRecord(gridAgent,filter2agent);
end;

procedure Tf_Zakaz.q_PostavHistFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:=f_db.AcceptFilterRecord(gridPostavHist,filter2postavhist);
end;

procedure Tf_Zakaz.q_AgentHistFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:=f_db.AcceptFilterRecord(gridAgentHist,filter2agenthist);
end;

procedure Tf_Zakaz.TBEditItem1AcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  IsRefresh:=true;
  f_db.FilterAcceptText(gridAgent,filter2agent,NewText,Accept);
  IsRefresh:=false;
  q_AgentAfterScroll(q_Agent);
end;

procedure Tf_Zakaz.TBItem24Click(Sender: TObject);
begin
  IsRefresh:=true;
  f_db.FilterCurrentValue(gridAgent,filter2agent);
  IsRefresh:=false;
  q_AgentAfterScroll(q_Agent);
end;

procedure Tf_Zakaz.TBItem26Click(Sender: TObject);
begin
  IsRefresh:=true;
  f_db.FilterCLear(gridAgent,filter2agent);
  IsRefresh:=false;
  q_AgentAfterScroll(q_Agent);
end;

procedure Tf_Zakaz.TBItem28Click(Sender: TObject);
begin
  f_db.EditInMemo(gridAgent);
end;

procedure Tf_Zakaz.TBEditItem3AcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  IsRefresh:=true;
  f_db.FilterAcceptText(gridPostavHist,filter2postavhist,NewText,Accept);
  IsRefresh:=false;
//  q_PostavHistAfterScroll(q_PostavHist);
end;

procedure Tf_Zakaz.TBItem31Click(Sender: TObject);
begin
  IsRefresh:=true;
  f_db.FilterCurrentValue(gridPostavHist,filter2postavhist);
  IsRefresh:=false;
//  q_PostavHistAfterScroll(q_PostavHist);
end;

procedure Tf_Zakaz.TBItem32Click(Sender: TObject);
begin
  IsRefresh:=true;
  f_db.FilterCLear(gridPostavHist,filter2postavhist);
  IsRefresh:=false;
//  q_PostavHistAfterScroll(q_PostavHist);
end;

procedure Tf_Zakaz.TBItem33Click(Sender: TObject);
begin
  f_db.EditInMemo(gridPostavHist);
end;

procedure Tf_Zakaz.TBEditItem4AcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  IsRefresh:=true;
  f_db.FilterAcceptText(gridAgentHist,filter2agenthist,NewText,Accept);
  IsRefresh:=false;
//  q_AgentHistAfterScroll(q_AgentHist);
end;

procedure Tf_Zakaz.TBItem35Click(Sender: TObject);
begin
  IsRefresh:=true;
  f_db.FilterCurrentValue(gridAgentHist,filter2agenthist);
  IsRefresh:=false;
//  q_AgentHistAfterScroll(q_AgentHist);
end;

procedure Tf_Zakaz.TBItem36Click(Sender: TObject);
begin
  IsRefresh:=true;
  f_db.FilterCLear(gridAgentHist,filter2agenthist);
  IsRefresh:=false;
//  q_AgentHistAfterScroll(q_AgentHist);
end;

procedure Tf_Zakaz.TBItem37Click(Sender: TObject);
begin
  f_db.EditInMemo(gridAgentHist);
end;

procedure Tf_Zakaz.TBItem38Click(Sender: TObject);
begin
  IsRefresh:=true;

  if SaveDialog1.Execute then
    if not FileExists(SaveDialog1.FileName) then
      begin
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,gridPostav,SaveDialog1.FileName,True);
        FileExecute(SaveDialog1.FileName,'','',esMaximized);
      end
    else
      if MessageDlg('Файл уже существует! Переписать?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,gridPostav,SaveDialog1.FileName,True);
          FileExecute(SaveDialog1.FileName,'','',esMaximized);
        end;

  IsRefresh:=false;
  q_PostavAfterScroll(q_Postav);
end;

procedure Tf_Zakaz.TBItem39Click(Sender: TObject);
begin
  IsRefresh:=true;

  if SaveDialog1.Execute then
    if not FileExists(SaveDialog1.FileName) then
      begin
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,gridAgent,SaveDialog1.FileName,True);
        FileExecute(SaveDialog1.FileName,'','',esMaximized);
      end
    else
      if MessageDlg('Файл уже существует! Переписать?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,gridAgent,SaveDialog1.FileName,True);
          FileExecute(SaveDialog1.FileName,'','',esMaximized);
        end;

  IsRefresh:=false;
  q_AgentAfterScroll(q_Agent);
end;

procedure Tf_Zakaz.TBItem40Click(Sender: TObject);
begin
  IsRefresh:=true;

  if SaveDialog1.Execute then
    if not FileExists(SaveDialog1.FileName) then
      begin
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,gridPostavHist,SaveDialog1.FileName,True);
        FileExecute(SaveDialog1.FileName,'','',esMaximized);
      end
    else
      if MessageDlg('Файл уже существует! Переписать?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,gridPostavHist,SaveDialog1.FileName,True);
          FileExecute(SaveDialog1.FileName,'','',esMaximized);
        end;

  IsRefresh:=false;
//  q_PostavHistAfterScroll(q_PostavHist);
end;

procedure Tf_Zakaz.TBItem41Click(Sender: TObject);
begin
  IsRefresh:=true;

  if SaveDialog1.Execute then
    if not FileExists(SaveDialog1.FileName) then
      begin
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,gridAgentHist,SaveDialog1.FileName,True);
        FileExecute(SaveDialog1.FileName,'','',esMaximized);
      end
    else
      if MessageDlg('Файл уже существует! Переписать?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,gridAgentHist,SaveDialog1.FileName,True);
          FileExecute(SaveDialog1.FileName,'','',esMaximized);
        end;

  IsRefresh:=false;
//  q_AgentHistAfterScroll(q_AgentHist);
end;

procedure Tf_Zakaz.btFilterClick(Sender: TObject);
begin
  if PageControlZakaz.ActivePage=tabAgent then
  begin
    if ZakazFilterAgent=nil then
    Begin
      ZakazFilter.gIS_AGENT:=1;
      ZakazFilterAgent:=tf_ZakazFilter.Create(Self);
    end;
    with ZakazFilterAgent do
    Begin
      BEGIN_DATE:=DateOf(edDateFrom.Date);
      END_DATE:=DateOf(edDateTo.Date);
      ShowModal;
      if ModalResult=mrOk then
      Begin
        filterAgent:=FilterStr;
        sbAgent.Panels[1].Text:='Фильтр: '+FilterText;
        acZakazRefreshExecute(Sender);
      end;
    end;
  end;

  if PageControlZakaz.ActivePage=tabPostav then
  begin
    if ZakazFilterPostav=nil then
    Begin
      ZakazFilter.gIS_AGENT:=2;
      ZakazFilterPostav:=tf_ZakazFilter.Create(Self);
    end;
    with ZakazFilterPostav do
    Begin
      BEGIN_DATE:=DateOf(edDateFrom.Date);
      END_DATE:=DateOf(edDateTo.Date);
      ShowModal;
      if ModalResult=mrOk then
      Begin
        filterPostav:=FilterStr;
        sbPostav.Panels[1].Text:='Фильтр: '+FilterText;
        acZakazRefreshExecute(Sender);
      end;
    end;
  end;

  if PageControlZakaz.ActivePage=tabParus then
  begin
    if ZakazFilterParus=nil then
    Begin
      ZakazFilter.gIS_AGENT:=9;
      ZakazFilterParus:=tf_ZakazFilter.Create(Self);
    end;
    with ZakazFilterParus do
    Begin
      BEGIN_DATE:=DateOf(edDateFrom.Date);
      END_DATE:=DateOf(edDateTo.Date);
      ShowModal;
      if ModalResult=mrOk then
      Begin
        filterParus:=FilterStr;
        sbParus.Panels[1].Text:='Фильтр: '+FilterText;
        acZakazRefreshExecute(Sender);
      end;
    end;
  end;
end;

procedure Tf_Zakaz.TBItem42Click(Sender: TObject);
begin
  btFilterClick(Sender);
end;

procedure Tf_Zakaz.TBItem43Click(Sender: TObject);
begin
  btFilterClick(Sender);
end;

procedure Tf_Zakaz.acRequestConsumerAddExecute(Sender: TObject);
var OldFlag:boolean;
begin
  if q_Postav.State=dsEdit then q_Postav.Post;
  if q_Agent.State=dsEdit then q_Agent.Post;

  If (AgentID=8) and (PageControlZakaz.ActivePage=tabPostav) then exit;

  // Добавление заказа
  with Tf_ZakazNew.Create(Self) do
  Begin
    vADD:=1;
    vSTATUS_ZAKAZ:=10;
    if (PageControlZakaz.ActivePage=tabAgent) then
    Begin
      EditId:=0;
      vIS_AGENT:=1;
      vAGENT_ID:=AgentID;
    end;
    if (PageControlZakaz.ActivePage=tabPostav) then
    Begin
      EditId:=0;
      vIS_AGENT:=2;
      vAGENT_ID:=AgentID;
    end;
    showmodal;
    if ModalResult=mrOk then
    Begin
      if (PageControlZakaz.ActivePage=tabPostav) then
      Begin
        IsRefresh:=true;
        f_db.ReQuery(q_Postav,false);
        q_Postav.Locate('ID',EditId,[]);
        IsRefresh:=false;
        q_PostavAfterScroll(q_Postav);
      end;
      if (PageControlZakaz.ActivePage=tabAgent) then
      Begin
        IsRefresh:=true;
        f_db.ReQuery(q_Agent,false);
        q_Agent.Locate('ID',EditId,[]);
        IsRefresh:=false;
        q_AgentAfterScroll(q_Agent);
      end;
    end;
    Free;
  End;
end;

procedure Tf_Zakaz.acRequestConsumerEditExecute(Sender: TObject);
begin
  if (PageControlZakaz.ActivePage=tabAgent) AND (q_Agent.EOF) then exit;
  if (PageControlZakaz.ActivePage=tabPostav) AND (q_Postav.EOF) then exit;
  if q_Postav.State=dsEdit then q_Postav.Post;
  if q_Agent.State=dsEdit then q_Agent.Post;
  If (AgentID=8) and (PageControlZakaz.ActivePage=tabPostav) then exit;

  // Корректировка заказа
  with Tf_ZakazNew.Create(Self) do
  Begin
    vADD:=0;
    vSTATUS_ZAKAZ:=30;
    if (PageControlZakaz.ActivePage=tabAgent) then
    Begin
      EditId:=q_AgentID.AsInteger;
      vIS_AGENT:=1;
      vAGENT_ID:=AgentID;
    end;
    if (PageControlZakaz.ActivePage=tabPostav) then
    Begin
      EditId:=q_PostavID.AsInteger;
      vIS_AGENT:=2;
      vAGENT_ID:=AgentID;
    end;
    showmodal;
    if ModalResult=mrOk then
    Begin
      if (PageControlZakaz.ActivePage=tabPostav) then
      Begin
        IsRefresh:=true;
        f_db.ReQuery(q_Postav,true);
        q_Postav.Locate('ID',EditId,[]);
        IsRefresh:=false;
        q_PostavAfterScroll(q_Postav);
      end;
      if (PageControlZakaz.ActivePage=tabAgent) then
      Begin
        IsRefresh:=true;
        f_db.ReQuery(q_Agent,true);
        q_Agent.Locate('ID',EditId,[]);
        IsRefresh:=false;
        q_AgentAfterScroll(q_Agent);
      end;
    end;
    Free;
  End;
end;

procedure Tf_Zakaz.acRequestConsumerDelExecute(Sender: TObject);
var NextID:integer;
begin
  if (PageControlZakaz.ActivePage=tabAgent) AND (q_Agent.EOF) then exit;
  if (PageControlZakaz.ActivePage=tabPostav) AND (q_Postav.EOF) then exit;
  if q_Postav.State=dsEdit then q_Postav.Post;
  if q_Agent.State=dsEdit then q_Agent.Post;
  If (AgentID=8) and (PageControlZakaz.ActivePage=tabPostav) then exit;

  // Удаление заказа
  if Application.MessageBox('Удалить запись?','Внимание!',MB_YESNO)=IDYES then
  Begin
    if (PageControlZakaz.ActivePage=tabPostav) then
    Begin
      if q_PostavIS_ACCEPT.AsInteger=0 then
        if q_PostavEXIST_CANCEL.AsInteger=0 then
        Begin
          try
            q_Postav.DisableControls;
            pkgFOR_ZAKAZ.CallProcedure('DelZakaz',[1,q_PostavID.AsInteger,0]);
            IsRefresh:=true;
            q_Postav.Next;
          except
            on E:EOracleError do
              ShowMessage(E.Message);
          end;
          NextID:=q_PostavID.AsInteger;
          f_db.ReQuery(q_Postav,false);
          q_Postav.Locate('ID',NextId,[]);
          IsRefresh:=false;
          q_PostavAfterScroll(q_Postav);
          q_Postav.EnableControls;
        end
        else
          application.MessageBox('Нельзя удалить заказ если есть отказ!','Внимание!',mb_ok)
      else
        application.MessageBox('Нельзя удалить утвержденный заказ!','Внимание!',mb_ok);
    End;
    if (PageControlZakaz.ActivePage=tabAgent) then
    Begin
      if q_AgentIS_ACCEPT.AsInteger=0 then
        if q_AgentEXIST_CANCEL.AsInteger=0 then
        Begin
          try
            q_Agent.DisableControls;
            pkgFOR_ZAKAZ.CallProcedure('DelZakaz',[1,q_AgentID.AsInteger,0]);
            IsRefresh:=true;
            q_Agent.Next;
          except
            on E:EOracleError do
              ShowMessage(E.Message);
          end;
          NextID:=q_AgentID.AsInteger;
          f_db.ReQuery(q_Agent,false);
          q_Agent.Locate('ID',NextId,[]);
          IsRefresh:=false;
          q_AgentAfterScroll(q_Agent);
          q_Agent.EnableControls;
        end
        else
          application.MessageBox('Нельзя удалить заказ если есть отказ!','Внимание!',mb_ok)
      else
        application.MessageBox('Нельзя удалить утвержденный заказ!','Внимание!',mb_ok);
    End;
  end;
end;

procedure Tf_Zakaz.acRequestConsumerCopyExecute(Sender: TObject);
begin
  if (PageControlZakaz.ActivePage=tabAgent) AND (q_Agent.EOF) then exit;
  if (PageControlZakaz.ActivePage=tabPostav) AND (q_Postav.EOF) then exit;
  if q_Postav.State=dsEdit then q_Postav.Post;
  if q_Agent.State=dsEdit then q_Agent.Post;
  If (AgentID=8) and (PageControlZakaz.ActivePage=tabPostav) then exit;

  // Копирование заказа
  with Tf_ZakazNew.Create(Self) do
  Begin
    vADD:=1;
    vSTATUS_ZAKAZ:=10;
    if (PageControlZakaz.ActivePage=tabAgent) then
    Begin
      EditId:=q_AgentID.AsInteger;
      vIS_AGENT:=1;
      vAGENT_ID:=AgentID;
    end;
    if (PageControlZakaz.ActivePage=tabPostav) then
    Begin
      EditId:=q_PostavID.AsInteger;
      vIS_AGENT:=2;
      vAGENT_ID:=AgentID;
    end;
    showmodal;
    if ModalResult=mrOk then
    Begin
      if (PageControlZakaz.ActivePage=tabPostav) then
      Begin
        IsRefresh:=true;
        f_db.ReQuery(q_Postav,true);
        q_Postav.Locate('ID',EditId,[]);
        IsRefresh:=false;
        q_PostavAfterScroll(q_Postav);
      end;
      if (PageControlZakaz.ActivePage=tabAgent) then
      Begin
        IsRefresh:=true;
        f_db.ReQuery(q_Agent,true);
        q_Agent.Locate('ID',EditId,[]);
        IsRefresh:=false;
        q_AgentAfterScroll(q_Agent);
      end;
    end;
    Free;
  End;
end;

procedure Tf_Zakaz.acRequestConsumerReAddressExecute(Sender: TObject);
begin
  if (PageControlZakaz.ActivePage=tabAgent) AND (q_Agent.EOF) then exit;
  if (PageControlZakaz.ActivePage=tabPostav) AND (q_Postav.EOF) then exit;
  if q_Postav.State=dsEdit then q_Postav.Post;
  if q_Agent.State=dsEdit then q_Agent.Post;
  If (AgentID=8) and (PageControlZakaz.ActivePage=tabPostav) then exit;

  // Переадресация
  with Tf_ZakazNew.Create(Self) do
  Begin
    vSTATUS_ZAKAZ:=40;
    vADD:=0;
    if (PageControlZakaz.ActivePage=tabAgent) then
    Begin
      EditId:=q_AgentID.AsInteger;
      vIS_AGENT:=1;
      vAGENT_ID:=AgentID;
    end;
    if (PageControlZakaz.ActivePage=tabPostav) then
    Begin
      EditId:=q_PostavID.AsInteger;
      vIS_AGENT:=2;
      vAGENT_ID:=AgentID;
    end;
    showmodal;
    if ModalResult=mrOk then
    Begin
      if (PageControlZakaz.ActivePage=tabPostav) then
      Begin
        IsRefresh:=true;
        f_db.ReQuery(q_Postav,true);
        q_Postav.Locate('ID',EditId,[]);
        IsRefresh:=false;
        q_PostavAfterScroll(q_Postav);
        if vADD=0 then
        Begin
          f_db.ReQuery(q_PostavHist,true);
          q_PostavHist.Locate('ID',EditHistId,[]);
  //        q_PostavHistAfterScroll(q_PostavHist);
        end;
      end;
      if (PageControlZakaz.ActivePage=tabAgent) then
      Begin
        IsRefresh:=true;
        f_db.ReQuery(q_Agent,true);
        q_Agent.Locate('ID',EditId,[]);
        IsRefresh:=false;
        q_AgentAfterScroll(q_Agent);
        if vADD=0 then
        Begin
          f_db.ReQuery(q_AgentHist,true);
          q_AgentHist.Locate('ID',EditHistId,[]);
//          q_AgentHistAfterScroll(q_AgentHist);
        end;
      end;
    end;
    Free;
  End;
end;

procedure Tf_Zakaz.acRequestConsumerCancelExecute(Sender: TObject);
begin
  if (PageControlZakaz.ActivePage=tabAgent) AND (q_Agent.EOF) then exit;
  if (PageControlZakaz.ActivePage=tabPostav) AND (q_Postav.EOF) then exit;
  if q_Postav.State=dsEdit then q_Postav.Post;
  if q_Agent.State=dsEdit then q_Agent.Post;
  If (AgentID=8) and (PageControlZakaz.ActivePage=tabPostav) then exit;

  // Отказ
  with Tf_ZakazNew.Create(Self) do
  Begin
    vSTATUS_ZAKAZ:=50;
    vADD:=0;
    if (PageControlZakaz.ActivePage=tabAgent) then
    Begin
      EditId:=q_AgentID.AsInteger;
      vIS_AGENT:=1;
      vAGENT_ID:=AgentID;
    end;
    if (PageControlZakaz.ActivePage=tabPostav) then
    Begin
      EditId:=q_PostavID.AsInteger;
      vIS_AGENT:=2;
      vAGENT_ID:=AgentID;
    end;
    showmodal;
    if ModalResult=mrOk then
    Begin
      if (PageControlZakaz.ActivePage=tabPostav) then
      Begin
        IsRefresh:=true;
        f_db.ReQuery(q_Postav,true);
        q_Postav.Locate('ID',EditId,[]);
        IsRefresh:=false;
        q_PostavAfterScroll(q_Postav);
        if vADD=0 then
        Begin
          f_db.ReQuery(q_PostavHist,true);
          q_PostavHist.Locate('ID',EditHistId,[]);
  //        q_PostavHistAfterScroll(q_PostavHist);
        end;
      end;
      if (PageControlZakaz.ActivePage=tabAgent) then
      Begin
        IsRefresh:=true;
        f_db.ReQuery(q_Agent,true);
        q_Agent.Locate('ID',EditId,[]);
        IsRefresh:=false;
        q_AgentAfterScroll(q_Agent);
        if vADD=0 then
        Begin
          f_db.ReQuery(q_AgentHist,true);
          q_AgentHist.Locate('ID',EditHistId,[]);
//          q_AgentHistAfterScroll(q_AgentHist);
        end;
      end;
    end;
    Free;
  End;
end;

procedure Tf_Zakaz.acRequestConsumerReAddressAddExecute(Sender: TObject);
begin
  if (PageControlZakaz.ActivePage=tabAgent) AND (q_Agent.EOF) then exit;
  if (PageControlZakaz.ActivePage=tabPostav) AND (q_Postav.EOF) then exit;
  if q_Postav.State=dsEdit then q_Postav.Post;
  if q_Agent.State=dsEdit then q_Agent.Post;
  If (AgentID=8) and (PageControlZakaz.ActivePage=tabPostav) then exit;

  // Переадресация + Новый
  with Tf_ZakazNew.Create(Self) do
  Begin
    vSTATUS_ZAKAZ:=40;
    vADD:=1;
    if (PageControlZakaz.ActivePage=tabAgent) then
    Begin
      EditId:=q_AgentID.AsInteger;
      vIS_AGENT:=1;
      vAGENT_ID:=AgentID;
    end;
    if (PageControlZakaz.ActivePage=tabPostav) then
    Begin
      EditId:=q_PostavID.AsInteger;
      vIS_AGENT:=2;
      vAGENT_ID:=AgentID;
    end;
    showmodal;
    if ModalResult=mrOk then
    Begin
      if (PageControlZakaz.ActivePage=tabPostav) then
      Begin
        IsRefresh:=true;
        f_db.ReQuery(q_Postav,true);
        q_Postav.Locate('ID',EditId,[]);
        IsRefresh:=false;
        q_PostavAfterScroll(q_Postav);
      end;
      if (PageControlZakaz.ActivePage=tabAgent) then
      Begin
        IsRefresh:=true;
        f_db.ReQuery(q_Agent,true);
        q_Agent.Locate('ID',EditId,[]);
        IsRefresh:=false;
        q_AgentAfterScroll(q_Agent);
      end;
    end;
    Free;
  End;
end;

procedure Tf_Zakaz.acRequestConsumerCancelAddExecute(Sender: TObject);
begin
  if (PageControlZakaz.ActivePage=tabAgent) AND (q_Agent.EOF) then exit;
  if (PageControlZakaz.ActivePage=tabPostav) AND (q_Postav.EOF) then exit;
  if q_Postav.State=dsEdit then q_Postav.Post;
  if q_Agent.State=dsEdit then q_Agent.Post;
  If (AgentID=8) and (PageControlZakaz.ActivePage=tabPostav) then exit;

  // Отказ + Новый
  with Tf_ZakazNew.Create(Self) do
  Begin
    vSTATUS_ZAKAZ:=50;
    vADD:=1;
    if (PageControlZakaz.ActivePage=tabAgent) then
    Begin
      EditId:=q_AgentID.AsInteger;
      vIS_AGENT:=1;
      vAGENT_ID:=AgentID;
    end;
    if (PageControlZakaz.ActivePage=tabPostav) then
    Begin
      EditId:=q_PostavID.AsInteger;
      vIS_AGENT:=2;
      vAGENT_ID:=AgentID;
    end;
    showmodal;
    if ModalResult=mrOk then
    Begin
      if (PageControlZakaz.ActivePage=tabPostav) then
      Begin
        IsRefresh:=true;
        f_db.ReQuery(q_Postav,true);
        q_Postav.Locate('ID',EditId,[]);
        IsRefresh:=false;
        q_PostavAfterScroll(q_Postav);
      end;
      if (PageControlZakaz.ActivePage=tabAgent) then
      Begin
        IsRefresh:=true;
        f_db.ReQuery(q_Agent,true);
        q_Agent.Locate('ID',EditId,[]);
        IsRefresh:=false;
        q_AgentAfterScroll(q_Agent);
      end;
    end;
    Free;
  End;
end;

procedure Tf_Zakaz.acZakazHistEditExecute(Sender: TObject);
begin
  if (PageControlZakaz.ActivePage=tabAgent) AND ((q_AgentHist.EOF) or (q_AgentHistSTATUS_ZAKAZ_ID.AsInteger>20)) then exit;
  if (PageControlZakaz.ActivePage=tabPostav) AND ((q_PostavHist.EOF)  or (q_PostavHistSTATUS_ZAKAZ_ID.AsInteger>20)) then exit;
  if q_Postav.State=dsEdit then q_Postav.Post;
  if q_Agent.State=dsEdit then q_Agent.Post;
  if q_PostavHist.State=dsEdit then q_PostavHist.Post;
  if q_AgentHist.State=dsEdit then q_AgentHist.Post;

  // Корректировка позиции заказа
  with Tf_ZakazHistNew.Create(Self) do
  Begin
    If (AgentID=8) and (PageControlZakaz.ActivePage=tabPostav) then vOnlyEtran:=true else vOnlyEtran:=false;
    vADD:=0;
    if (PageControlZakaz.ActivePage=tabAgent) then
    Begin
      vDATE_PLAN:=DateOf(q_AgentDATE_PLAN.AsDateTime);
      vPLAT_ID:=q_AgentPLAT_ID.AsInteger;
      vSTATUS_ZAKAZ:=q_AgentHistSTATUS_ZAKAZ_ID.AsInteger;
      EditId:=q_AgentID.AsInteger;
      EditHistId:=q_AgentHistID.AsInteger;
      vIS_AGENT:=1;
      vAGENT_ID:=AgentID;
      vNOM_ZD:=q_AgentHistNOM_ZD.AsString;
      vSORTBY:=q_AgentHistSORTBY.AsInteger;
    end;
    if (PageControlZakaz.ActivePage=tabPostav) then
    Begin
      vDATE_PLAN:=DateOf(q_PostavDATE_PLAN.AsDateTime);
      vPLAT_ID:=q_PostavLUK_PLAT_ID.AsInteger;
      vSTATUS_ZAKAZ:=q_PostavHistSTATUS_ZAKAZ_ID.AsInteger;
      EditId:=q_PostavID.AsInteger;
      EditHistId:=q_PostavHistID.AsInteger;
      vIS_AGENT:=2;
      vAGENT_ID:=AgentID;
      vNOM_ZD:=q_PostavHistNOM_ZD.AsString;
      vSORTBY:=q_PostavHistSORTBY.AsInteger;
    end;
    showmodal;
    if ModalResult=mrOk then
    Begin
      if (PageControlZakaz.ActivePage=tabPostav) then
      Begin
        IsRefresh:=true;
        f_db.ReQuery(q_Postav,true);
        q_Postav.Locate('ID',EditId,[]);
        IsRefresh:=false;
        q_PostavAfterScroll(q_Postav);
        f_db.ReQuery(q_PostavHist,true);
        q_PostavHist.Locate('ID',EditHistId,[]);
      end;
      if (PageControlZakaz.ActivePage=tabAgent) then
      Begin
        IsRefresh:=true;
        f_db.ReQuery(q_Agent,true);
        q_Agent.Locate('ID',EditId,[]);
        IsRefresh:=false;
        q_AgentAfterScroll(q_Agent);
        f_db.ReQuery(q_AgentHist,true);
        q_AgentHist.Locate('ID',EditHistId,[]);
      end;
    end;
    Free;
  End;
end;

procedure Tf_Zakaz.acRequestConsumerAddOtgrExecute(Sender: TObject);
begin
  if (PageControlZakaz.ActivePage=tabAgent) AND (q_Agent.EOF) then exit;
  if (PageControlZakaz.ActivePage=tabPostav) AND (q_Postav.EOF) then exit;
  if q_Postav.State=dsEdit then q_Postav.Post;
  if q_Agent.State=dsEdit then q_Agent.Post;
  if q_PostavHist.State=dsEdit then q_PostavHist.Post;
  if q_AgentHist.State=dsEdit then q_AgentHist.Post;
  If (AgentID=8) and (PageControlZakaz.ActivePage=tabPostav) then exit;

  if (AgentID=2641) and (PageControlZakaz.ActivePage=tabPostav) then
  if q_PostavLUK_DOG_NUMBER.AsString='' then
  begin
    application.MessageBox('Для формирования позиции "К отгрузке" необходимо, чтобы был заполнен договор с Поставщиком!', 'Внимание!', mb_OK);
    exit;
  end;

  // К отгрузке
  with Tf_ZakazHistNew.Create(Self) do
  Begin
    vADD:=1;
    vSTATUS_ZAKAZ:=20;
    if (PageControlZakaz.ActivePage=tabAgent) then
    Begin
      vDATE_PLAN:=DateOf(q_AgentDATE_PLAN.AsDateTime);
      vPLAT_ID:=q_AgentPLAT_ID.AsInteger;
      EditId:=q_AgentID.AsInteger;
      EditHistId:=0;
      vIS_AGENT:=1;
      vAGENT_ID:=AgentID;
      vNOM_ZD:=q_AgentHistNOM_ZD.AsString;
      vSORTBY:=q_AgentHistSORTBY.AsInteger;
    end;
    if (PageControlZakaz.ActivePage=tabPostav) then
    Begin
      vDATE_PLAN:=DateOf(q_PostavDATE_PLAN.AsDateTime);
      vPLAT_ID:=q_PostavLUK_PLAT_ID.AsInteger;
      EditId:=q_PostavID.AsInteger;
      EditHistId:=0;
      vIS_AGENT:=2;
      vAGENT_ID:=AgentID;
      vNOM_ZD:=q_PostavHistNOM_ZD.AsString;
      vSORTBY:=q_PostavHistSORTBY.AsInteger;
    end;
    showmodal;
    if ModalResult=mrOk then
    Begin
      if (PageControlZakaz.ActivePage=tabPostav) then
      Begin
        IsRefresh:=true;
        f_db.ReQuery(q_Postav,true);
        q_Postav.Locate('ID',EditId,[]);
        IsRefresh:=false;
        q_PostavAfterScroll(q_Postav);
        f_db.ReQuery(q_PostavHist,true);
        q_PostavHist.Locate('ID',EditHistId,[]);
      end;
      if (PageControlZakaz.ActivePage=tabAgent) then
      Begin
        IsRefresh:=true;
        f_db.ReQuery(q_Agent,true);
        q_Agent.Locate('ID',EditId,[]);
        IsRefresh:=false;
        q_AgentAfterScroll(q_Agent);
        f_db.ReQuery(q_AgentHist,true);
        q_AgentHist.Locate('ID',EditHistId,[]);
      end;
    end;
    Free;
  End;
end;

procedure Tf_Zakaz.acZakazHistDelExecute(Sender: TObject);
var NextID:integer;
begin
  if (PageControlZakaz.ActivePage=tabAgent) AND (q_AgentHist.EOF) then exit;
  if (PageControlZakaz.ActivePage=tabPostav) AND (q_PostavHist.EOF) then exit;
  if q_Postav.State=dsEdit then q_Postav.Post;
  if q_Agent.State=dsEdit then q_Agent.Post;
  if q_PostavHist.State=dsEdit then q_PostavHist.Post;
  if q_AgentHist.State=dsEdit then q_AgentHist.Post;
  If (AgentID=8) and (PageControlZakaz.ActivePage=tabPostav) then exit;

  // Удаление позиции заказа
  if Application.MessageBox('Удалить запись?','Внимание!',MB_YESNO)=IDYES then
  Begin
    if (PageControlZakaz.ActivePage=tabPostav) then
    Begin
      if (q_PostavHistNOM_ZD.AsString<>'') and (q_PostavAGENT_ID.AsInteger=8) then
      begin
        application.MessageBox(PChar('По данной позиции заказа уже есть заявка на отгрузку '+q_PostavHistNOM_ZD.AsString+
           '! Необходимо освободить заявку на отгрузку '+q_PostavHistNOM_ZD.AsString+' от заказа '+
           q_PostavHistCLIENT_NUMBER.AsString+'/'+q_PostavHistINPUT_NUMBER.AsString), 'Внимание!', mb_OK);
        exit;
      end;
      try
        q_PostavHist.DisableControls;
        pkgFOR_ZAKAZ.CallProcedure('DelZakazHist',[1,q_PostavHistID.AsInteger,0]);
        q_PostavHist.Next;
      except
        on E:EOracleError do
          ShowMessage(E.Message);
      end;
      NextID:=q_PostavHistID.AsInteger;
      IsRefresh:=true;
      f_db.ReQuery(q_Postav,true);
      IsRefresh:=false;
      q_PostavAfterScroll(q_Postav);
      f_db.ReQuery(q_PostavHist,false);
      q_PostavHist.Locate('ID',NextId,[]);
      q_PostavHist.EnableControls;
    End;
    if (PageControlZakaz.ActivePage=tabAgent) then
    Begin
      if (q_AgentHistNOM_ZD.AsString<>'')  then
      begin
        application.MessageBox(PChar('По данной позиции заказа уже есть заявка на отгрузку '+q_AgentHistNOM_ZD.AsString+
           '! Необходимо освободить заявку на отгрузку '+q_AgentHistNOM_ZD.AsString+' от заказа '+
           q_AgentHistCLIENT_NUMBER.AsString+'/'+q_AgentHistINPUT_NUMBER.AsString), 'Внимание!', mb_OK);
        exit;
      end;
      try
        q_AgentHist.DisableControls;
        pkgFOR_ZAKAZ.CallProcedure('DelZakazHist',[1,q_AgentHistID.AsInteger,0]);
        q_AgentHist.Next;
      except
        on E:EOracleError do
          ShowMessage(E.Message);
      end;
      NextID:=q_AgentHistID.AsInteger;
      IsRefresh:=true;
      f_db.ReQuery(q_Agent,true);
      IsRefresh:=false;
      q_AgentAfterScroll(q_Agent);
      f_db.ReQuery(q_AgentHist,false);
      q_AgentHist.Locate('ID',NextId,[]);
      q_AgentHist.EnableControls;
    End;
  end;

end;

procedure Tf_Zakaz.xlDrawCell(r1, c1, r2, c2: integer; text: string;border: boolean;fsize:integer);
//r1 row1;c1 column1;r2 row2;c2 column2;text text; border
var
sheet:  variant;
str1, str2: string;
begin
  sheet := excel.workbooks[1].sheets[1];

  str1 := chr(ord('a') + c1 - 1) + IntToStr(r1);
  str2 := Chr(ord('a') + c2 - 1) + IntToStr(r2);

  sheet.range[str1, str2].merge;
  sheet.range[str1, str2] := text;
  sheet.range[str1, str2].HorizontalAlignment := $FFFFEFF4;
  sheet.range[str1, str2].VerticalAlignment := $FFFFEFF4;
  sheet.range[str1, str2].WrapText := true;
  sheet.range[str1, str2].font.size := fsize;

  if border = true then begin
    //правая граница
    sheet.range[str1, str2].Borders[$FFFFEFC8].linestyle := 1;
    sheet.range[str1, str2].Borders[$FFFFEFC8].Weight := 2;
    sheet.range[str1, str2].Borders[$FFFFEFC8].colorindex := $FFFFEFF7;
    //левая
    sheet.range[str1, str2].Borders[$FFFFEFDD].linestyle := 1;
    sheet.range[str1, str2].Borders[$FFFFEFDD].Weight := 2;
    sheet.range[str1, str2].Borders[$FFFFEFDD].colorindex := $FFFFEFF7;
    //верхняя
    sheet.range[str1, str2].Borders[$FFFFEFC0].linestyle := 1;
    sheet.range[str1, str2].Borders[$FFFFEFC0].Weight := 2;
    sheet.range[str1, str2].Borders[$FFFFEFC0].colorindex := $FFFFEFF7;
    //нижняя
    sheet.range[str1, str2].Borders[$FFFFEFF5].linestyle := 1;
    sheet.range[str1, str2].Borders[$FFFFEFF5].Weight := 2;
    sheet.range[str1, str2].Borders[$FFFFEFF5].colorindex := $FFFFEFF7;
  end;

end;

procedure Tf_Zakaz.SaveToExcel(q_Source:TOracleDataSet);
var
  i,k          : integer;
  sheet        : variant;
begin
  inherited;
  excel := CreateOleObject('excel.application');
  excel.workBooks.add;
  sheet := excel.workBooks[1]. sheets[1];
  //сохраняем в Excel
  //заголовок таблицы
  sheet.Columns['A'].ColumnWidth := 6;
  sheet.Columns['b'].ColumnWidth := 9;
  sheet.Columns['c'].ColumnWidth := 10;
  sheet.Columns['d'].ColumnWidth := 27;
  sheet.Columns['e'].ColumnWidth := 13;
  sheet.Columns['f'].ColumnWidth := 20;
  sheet.Columns['g'].ColumnWidth := 23;
  sheet.Columns['h'].ColumnWidth := 6;
  sheet.Columns['i'].ColumnWidth := 21;
  sheet.Columns['j'].ColumnWidth := 27;
  sheet.Columns['k'].ColumnWidth := 27;
  sheet.Columns['l'].ColumnWidth := 13;
  sheet.Columns['m'].ColumnWidth := 50;

  //создаем заголовок
  xlDrawCell(1, 1, 1, 13, 'Реестр планируемых отгрузок продукции покупателям ООО "ЛУКОЙЛ-Севернефтепродукт"', False,12);
  xlDrawCell(2, 3, 2, 3, 'За период', False,10);
  xlDrawCell(2, 4, 2, 4, 'с '+FormatDateTime('dd.mm.yyyy',edDateFrom.Date)+' по '+FormatDateTime('dd.mm.yyyy',edDateTo.Date), False,10);
  xlDrawCell(2, 5, 2, 6, 'на '+DateTimeToStr(now()), False,10);
{  if cbFilial.value<>'0' then
  xlDrawCell(2, 7, 2, 7, cbFilial.Text, False,10);}

  xlDrawCell(4,1,4,1,'Утверждено',true,8);
  xlDrawCell(4,2,4,2,'№ рег-ии заявки',true,8);
  xlDrawCell(4,3,4,3,'Дата рег-ии заявки',true,8);
  xlDrawCell(4,4,4,4,'Платильщик по договору',true,8);
  xlDrawCell(4,5,4,5,'№ договора',true,8);
  xlDrawCell(4,6,4,6,'Условия оплаты',true,8);
  xlDrawCell(4,7,4,7,'Наименование продукта',true,8);
  xlDrawCell(4,8,4,8,'Кол. Тн.',true,8);
  xlDrawCell(4,9,4,9,'Станция дороги назначения',true,8);
  xlDrawCell(4,10,4,10,'Грузополучатель',true,8);
  xlDrawCell(4,11,4,11,'Потребитель',true,8);
  xlDrawCell(4,12,4,12,'Заявленная цена покупателем',true,8);
  xlDrawCell(4,13,4,13,'Примечание',true,8);
//заполняем таблицу
  i:=5;
  k:=5;
  with q_Source do begin
  First;
  while not eof do
  begin
         if q_Source.FieldByname('IS_ACCEPT').AsInteger=0 then xlDrawCell(i,1,i,1,'Нет',true,8) else xlDrawCell(i,1,i,1,'Да',true,8);
         xlDrawCell(i,2,i,2,q_Source.FieldByname('INPUT_NUMBER').AsString,true,8);
         xlDrawCell(i,3,i,3,q_Source.FieldByname('INPUT_DATE').AsString,true,8);
         xlDrawCell(i,4,i,4,q_Source.FieldByname('Plat_NAME').AsString,true,8);
         xlDrawCell(i,5,i,5,q_Source.FieldByname('Dog_NUMBER').AsString,true,8);
         xlDrawCell(i,6,i,6,q_Source.FieldByname('Usl_Opl_name').AsString,true,8);
         xlDrawCell(i,7,i,7,q_Source.FieldByname('name_npr').AsString,true,8);
         xlDrawCell(i,8,i,8,q_Source.FieldByname('VES').AsString,true,8);
         xlDrawCell(i,9,i,9,q_Source.FieldByname('Stan_name').AsString,true,8);
         xlDrawCell(i,10,i,10,q_Source.FieldByname('POLUCH_NAME').AsString,true,8);
         if q_Source.FieldByname('potreb_name').AsString='' then xlDrawCell(i,11,i,11,q_Source.FieldByname('potreb_name_dop').AsString,true,8) else xlDrawCell(i,11,i,11,q_Source.FieldByname('potreb_name').AsString,true,8);
         xlDrawCell(i,12,i,12,q_Source.FieldByname('PRICE').AsString,true,8);
         xlDrawCell(i,13,i,13,q_Source.FieldByname('PRIM').AsString,true,8);
         next;
         i:=i+1;
    end;
  end;
  xlDrawCell(i,1,i,1,'',true,8);
  xlDrawCell(i,2,i,2,'',true,8);
  xlDrawCell(i,3,i,3,'',true,8);
  xlDrawCell(i,4,i,4,'',true,8);
  xlDrawCell(i,5,i,5,'',true,8);
  xlDrawCell(i,6,i,6,'',true,8);
  xlDrawCell(i,7,i,7,'',true,8);
  xlDrawCell(i,8,i,8,'=SUM(R[-'+Trim(inttoStr(i - k))+']C[0]:R[-1]C[0])',true,8);
  xlDrawCell(i,9,i,9,'',true,8);
  xlDrawCell(i,10,i,10,'',true,8);
  xlDrawCell(i,11,i,11,'',true,8);
  xlDrawCell(i,12,i,12,'',true,8);
  xlDrawCell(i,13,i,13,'',true,8);

  excel.workbooks[1].sheets[1].name := 'sheet1';
  excel.visible := true;
  excel := null;
end;

procedure Tf_Zakaz.SaveToWord(q_Source:TOracleDataSet;q_SourceHist:TOracleDataSet);
const
  wdGoToBookmark=$FFFFFFFF;
var
  MSWord   :Variant;
  str      : string;
begin
  inherited;
  f_fileutils.SafeCopyFile('u:\master\doc\request.doc', f_main.TempLocalPath+'request.doc');
  MSWord := createOleObject('Word.Application');
  try
    MSWord.application.documents.add(template := f_main.TempLocalPath+'request.doc');
  except
  end;
  MSWord.application.visible := true;
  MSWord.application.activate;
  MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='Num');
  MSWord.application.Selection.TypeText('№ 08-ТР-'+q_SourceHist.FieldByName('CLIENT_NUMBER').AsString+'/'+q_SourceHist.FieldByName('INPUT_NUMBER').AsString+' от '+FormatDateTime('dd.mm.yyyy г.',q_SourceHist.FieldByName('INPUT_DATE').AsDateTime));
  MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='To');
  if YearOf(q_Source.FieldByName('date_plan').asDateTime)>=2005 then
  Begin
    MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='ToName1');
    MSWord.application.Selection.TypeText(q_Source.FieldByName('AGENT_STAFF').AsString);
    MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='ToName2');
    MSWord.application.Selection.TypeText(q_Source.FieldByName('AGENT_NAME').AsString);
    MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='ToName3');
    MSWord.application.Selection.TypeText(q_Source.FieldByName('AGENT_DIRECTOR').AsString);
    MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='Dogovor');
    if (AgentId=2641) AND (PageControlZakaz.ActivePage=tabPostav) then
      MSWord.application.Selection.TypeText(q_Source.FieldByName('luk_dog_number').AsString+' ('+q_Source.FieldByName('luk_plat_name').AsString+')')
    else
      MSWord.application.Selection.TypeText(q_Source.FieldByName('dog_number').AsString+' ('+q_Source.FieldByName('plat_name').AsString+')');
  end
  else
  Begin
    MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='ToName1');
    MSWord.application.Selection.TypeText('Начальнику управления поставок');
    MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='ToName2');
    MSWord.application.Selection.TypeText('ООО "ЛУКОЙЛ-Севернефтепродукт"');
    MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='ToName3');
    MSWord.application.Selection.TypeText('Бирюкову Р. Е.');
    MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='Dogovor');
    MSWord.application.Selection.TypeText(q_Source.FieldByName('dog_number').AsString+' ('+q_Source.FieldByName('plat_name').AsString+')');
  End;
  MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='DateReq');
  MSWord.application.Selection.TypeText(FormatDateTime('mmmm yyyy', q_Source.FieldByName('date_plan').asDateTime));
{  MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='UslOpl');
  MSWord.application.Selection.TypeText(q_Source.FieldByName('Usl_Opl_name').AsString);}
  MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='Npr');
  MSWord.application.Selection.TypeText(q_Source.FieldByName('name_npr').AsString);
  MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='Quantity');
  MSWord.application.Selection.TypeText(q_SourceHist.FieldByName('load_ves').AsString+' тонн/ '+q_SourceHist.FieldByName('load_kol').AsString+' цистерн');
  MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='Quantity_speed');
  MSWord.application.Selection.TypeText(q_Source.FieldByName('speed_ves').AsString+' тонн/ '+q_Source.FieldByName('speed_kol').AsString+' цистерн');
  MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='VidOtgr');
  MSWord.application.Selection.TypeText(q_Source.FieldByName('Load_name').AsString);
  MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='Stan');
  MSWord.application.Selection.TypeText(q_Source.FieldByName('Stan_name').AsString);
  MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='kSt');
  MSWord.application.Selection.TypeText(q_Source.FieldByName('stan_kod').AsString);
{  str:=q_SourceHist.FieldByName('Poluch_name').AsString;
  if q_Source.FieldByName('Potreb_name').AsString<>'' then
    str:=str+' ('+q_Source.FieldByName('Potreb_name').AsString+')';}
  MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='Poluch');
  MSWord.application.Selection.TypeText(q_Source.FieldByName('Poluch_name').AsString);
  MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='adr_Poluch');
  MSWord.application.Selection.TypeText(q_Source.FieldByName('POLUCH_ADDR').AsString);
  MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='kPol');
  MSWord.application.Selection.TypeText(q_Source.FieldByName('POLUCH_GDKOD').AsString);
  MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='OKPO');
  MSWord.application.Selection.TypeText(q_Source.FieldByName('POLUCH_okpo').AsString);
  MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='KSSSPol');
  MSWord.application.Selection.TypeText(q_Source.FieldByName('POLUCH_ksss').AsString);
  MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='Potreb');
  if q_Source.FieldByName('Potreb_name').AsString='' then
    MSWord.application.Selection.TypeText(q_Source.FieldByName('Potreb_name_dop').AsString)
  else
    MSWord.application.Selection.TypeText(q_Source.FieldByName('Potreb_name').AsString);
  MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='adr_potreb');
  MSWord.application.Selection.TypeText(q_Source.FieldByName('POTREB_ADDR').AsString);
  MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='kPotr');
  MSWord.application.Selection.TypeText(q_Source.FieldByName('POTREB_GDKOD').AsString);
  MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='OKPOPotr');
  MSWord.application.Selection.TypeText(q_Source.FieldByName('POTREB_okpo').AsString);
  MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='KSSSPotr');
  MSWord.application.Selection.TypeText(q_Source.FieldByName('POTREB_ksss').AsString);
  MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='Vetka');
  MSWord.application.Selection.TypeText(q_Source.FieldByName('VETKA_NAME').AsString);
  MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='prich');
  MSWord.application.Selection.TypeText(q_Source.FieldByName('prim').AsString);
  MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='grafa4');
  MSWord.application.Selection.TypeText(q_Source.FieldByName('gr4').AsString);
  MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='pospp');
  MSWord.application.Selection.TypeText(q_Source.FieldByName('PlanStru_Name').AsString);
  MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='Etran');
  MSWord.application.Selection.TypeText(q_SourceHist.FieldByName('GU12_A_NUM').AsString);
  MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='Gosprog');
  str:=q_Source.FieldByName('GOSPROG_NAME').AsString;
  if q_Source.FieldByName('GP_NAPR_NAME').AsString<>'' then
    str:=str+' ('+q_Source.FieldByName('GP_NAPR_NAME').AsString+')';
  MSWord.application.Selection.TypeText(str);
  MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='Client_Num');
  MSWord.application.Selection.TypeText(q_Source.FieldByName('client_number').AsString);
  MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='Client_date');
  MSWord.application.Selection.TypeText(q_Source.FieldByName('client_date').AsString);

  str:=f_main.TempLocalPath+q_SourceHist.FieldByName('CLIENT_NUMBER').AsString+'_'+q_SourceHist.FieldByName('INPUT_NUMBER').AsString+'_'+trim(q_Source.FieldByName('id').AsString)+'.doc';
  try
    MSWord.application.ActiveDocument.SaveAs(str);
  except
  end;
  MSWord := unAssigned;
end;


procedure Tf_Zakaz.acZakazHistWordExecute(Sender: TObject);
begin
  inherited;
  if (PageControlZakaz.ActivePage=tabAgent) AND ((q_AgentHist.EOF) or (q_AgentHistSTATUS_ZAKAZ_ID.AsInteger<>20)) then exit;
  if (PageControlZakaz.ActivePage=tabPostav) AND ((q_PostavHist.EOF) or (q_PostavHistSTATUS_ZAKAZ_ID.AsInteger<>20)) then exit;
  if q_Postav.State=dsEdit then q_Postav.Post;
  if q_Agent.State=dsEdit then q_Agent.Post;
  if q_PostavHist.State=dsEdit then q_PostavHist.Post;
  if q_AgentHist.State=dsEdit then q_AgentHist.Post;

  if (PageControlZakaz.ActivePage=tabAgent) then
    SaveToWord(q_Agent,q_AgentHist)
  else
    if (PageControlZakaz.ActivePage=tabPostav) then
    Begin
      // Инициируем сохранение позиции "К отгрузке" - для верности, чтобы появился заказ в Заказах УНП
      pkgFOR_ZAKAZ.CallProcedure('RefreshZakazHist',[1,q_PostavHistID.AsInteger,0]);
      SaveToWord(q_Postav,q_PostavHist);
    end;
end;

procedure Tf_Zakaz.acZakazReestrXlsExecute(Sender: TObject);
begin
  if (PageControlZakaz.ActivePage=tabAgent) AND (q_Agent.EOF) then exit;
  if (PageControlZakaz.ActivePage=tabPostav) AND (q_Postav.EOF) then exit;
  if q_Postav.State=dsEdit then q_Postav.Post;
  if q_Agent.State=dsEdit then q_Agent.Post;

  if (PageControlZakaz.ActivePage=tabAgent) then
  try
    q_Agent.DisableControls;
    IsRefresh:=true;
    SaveToExcel(q_Agent)
  finally
    IsRefresh:=false;
    q_AgentAfterScroll(q_Agent);
    q_Agent.EnableControls;
  end
  else
    if (PageControlZakaz.ActivePage=tabPostav) then
    try
      q_Postav.DisableControls;
      IsRefresh:=true;
      SaveToExcel(q_Postav);
    finally
      IsRefresh:=false;
      q_PostavAfterScroll(q_Postav);
      q_Postav.EnableControls;
    end;
end;

procedure Tf_Zakaz.acRequestConsumerToDbfExecute(Sender: TObject);
begin
  if q_Postav.State=dsEdit then q_Postav.Post;
  if q_Agent.State=dsEdit then q_Agent.Post;
  if q_PostavHist.State=dsEdit then q_PostavHist.Post;
  if q_AgentHist.State=dsEdit then q_AgentHist.Post;

  with tf_ORAToDBF.Create(Self) do
    begin
      DBFtoORAid:='ZAKAZ';
      ShowModal;
    end;
end;

procedure Tf_Zakaz.gridParusColumns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text:=IntToStr(q_Parus.RecNo);
end;

procedure Tf_Zakaz.TBEditItem5AcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  IsRefresh:=true;
  f_db.FilterAcceptText(gridParus,filter2Parus,NewText,Accept);
  IsRefresh:=false;
  q_ParusAfterScroll(q_Parus);
end;

procedure Tf_Zakaz.TBItem97Click(Sender: TObject);
begin
  IsRefresh:=true;
  f_db.FilterCurrentValue(gridParus,filter2Parus);
  IsRefresh:=false;
  q_ParusAfterScroll(q_Parus);
end;

procedure Tf_Zakaz.TBItem98Click(Sender: TObject);
begin
  IsRefresh:=true;
  f_db.FilterCLear(gridParus,filter2Parus);
  IsRefresh:=false;
  q_ParusAfterScroll(q_Parus);
end;

procedure Tf_Zakaz.TBItem99Click(Sender: TObject);
begin
  f_db.EditInMemo(gridParus);
end;

procedure Tf_Zakaz.TBItem109Click(Sender: TObject);
begin
  IsRefresh:=true;

  if SaveDialog1.Execute then
    if not FileExists(SaveDialog1.FileName) then
      begin
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,gridParus,SaveDialog1.FileName,True);
        FileExecute(SaveDialog1.FileName,'','',esMaximized);
      end
    else
      if MessageDlg('Файл уже существует! Переписать?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,gridParus,SaveDialog1.FileName,True);
          FileExecute(SaveDialog1.FileName,'','',esMaximized);
        end;

  IsRefresh:=false;
  q_ParusAfterScroll(q_Parus);
end;

procedure Tf_Zakaz.gridParusExit(Sender: TObject);
begin
  if q_Parus.State=dsEdit then q_Parus.Post;
end;

procedure Tf_Zakaz.gridParusSortMarkingChanged(Sender: TObject);
begin
  IsRefresh:=true;
  f_db.SortInGrid(q_Parus,q_Parus.SQL.Count-1,gridParus);
  IsRefresh:=false;
  q_ParusAfterScroll(q_Parus);
end;

procedure Tf_Zakaz.q_ParusAfterScroll(DataSet: TDataSet);
var i:integer;
begin
  if IsRefresh then exit;
  if NOT Active then exit;
  if PageControlZakaz.ActivePage<>tabParus then exit;

  // Доп информация
  if PageControlParus.ActivePage=tabParusInfo then
  Begin
    q_ParusPlan.Close;
    q_ParusFact.Close;
    q_ParusDolg.Close;

    if q_Parus.Eof then exit;

    if q_ParusFILIAL_NAME.AsString<>'' then
      tabParusInfo.Caption:='Информация ('+q_ParusFILIAL_NAME.AsString+')'
    else
      tabParusInfo.Caption:='Информация';

    // Обновить данные во временной таблице
    pkgFOR_ZAKAZ.CallProcedure('FillTemp',[9,DateOf(edDateFrom.Date),DateOf(edDateTo.Date),q_ParusPARUS_RN.AsInteger]);

    if (q_ParusPARUS_DOGOVOR.AsString='') OR (q_ParusPARUS_DOGOVOR.AsString='0')then
    Begin
      lbParusDogKind.Caption:='По контрагенту';
      lbParusDogNum.Caption:=q_ParusPARUS_AGENT_NAME.AsString;
      edParusDogZakaz.DATAFIELD:='ZAYV_ALL_PLAT';
      edParusDogUtv.DATAFIELD:='ZAYV_ACCEPT_PLAT';
      edParusDogFact.DATAFIELD:='ZAYV_FACT_PLAT';
    end
    else
    Begin
      lbParusDogKind.Caption:='По договору';
      lbParusDogNum.Caption:=q_ParusPARUS_DOGOVOR.AsString;
      edParusDogZakaz.DATAFIELD:='ZAYV_ALL_DOG';
      edParusDogUtv.DATAFIELD:='ZAYV_ACCEPT_DOG';
      edParusDogFact.DATAFIELD:='ZAYV_FACT_DOG';
    end;

    q_ParusPlan.Open;
    q_ParusFact.Open;
    q_ParusDolg.Open;

    if NOT q_ParusDolg.Eof then
      if q_ParusDolgSALDO.AsFloat<0 then lbParusDolgName.Caption:='Кредиторская задолженность:'
      else if q_ParusDolgSALDO.AsFloat=0 then lbParusDolgName.Caption:='Задолженности нет'
           else lbParusDolgName.Caption:='Дебиторская задолженность:'
    else
      lbParusDolgName.Caption:='Данных по задолженности нет';
  end;
end;

procedure Tf_Zakaz.q_ParusFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:=f_db.AcceptFilterRecord(gridParus,filter2Parus);
end;

procedure Tf_Zakaz.FormShow(Sender: TObject);
begin
  if (AgentID=8) and not f_db.CheckGrant('acZakazUNP') then
  Begin
    ShowMessage('Вы не имеете права на просмотр заказов УНП!');
    Close;
  end;
  if (AgentID=2641) and not f_db.CheckGrant('acZakaz') then
  Begin
    ShowMessage('Вы не имеете права на просмотр заказов CНП!');
    Close;
  end;

end;

procedure Tf_Zakaz.acZakazLinkMonthExecute(Sender: TObject);
begin
  if (PageControlZakaz.ActivePage=tabAgent) then
  if not q_Agent.eof then
  Begin
    oper_zayav.gLinkMode:=1;
    oper_zayav.gLinkFilter:='(month.ZAKAZ_ID='+q_AgentID.AsString+')';
    with Tf_oper_zayav.Create(Self) do
    begin
      FormStyle:=fsMDIChild;
    end;
  end;
end;

procedure Tf_Zakaz.acZakazLinkZakazUNPExecute(Sender: TObject);
begin
  if (PageControlPostav.ActivePage=tabPostavHist) then
  if not q_PostavHist.eof then
  Begin
    zakaz.gAgentID:=8;
    zakaz.gLinkMode:=1;
    zakaz.gLinkFilter:='(mon.ID='+q_PostavHistLINK_ID.AsString+')';
    with Tf_zakaz.Create(Self) do
    begin
      FormStyle:=fsMDIChild;
    end;
  end;
end;

procedure Tf_Zakaz.acZakazLinkZakazSNPExecute(Sender: TObject);
begin
  if (PageControlZakaz.ActivePage=tabAgent) then
  if not q_Agent.eof then
  Begin
    zakaz.gAgentID:=2641;
    zakaz.gLinkMode:=1;
    zakaz.gLinkFilter:='(mon.ID='+q_AgentLINK_ID.AsString+')';
    with Tf_zakaz.Create(Self) do
    begin
      FormStyle:=fsMDIChild;
    end;
  end;
end;

end.
