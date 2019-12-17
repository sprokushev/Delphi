unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OracleData,ImgList, Oracle, DBGridEh, ToolWin, ActnMan,
  ActnCtrls, ActnMenus, ActnList, Menus, StdActns, DateUtil, UCRPE32,
  ExtCtrls, ComCtrls, StdCtrls, TB2Item, TB2Dock, TB2Toolbar, DB, TB2MDI,
  XPStyleActnCtrls,ADODB, metaPlanmain, ForSESS, AppEvent, DateUtils,
  trk_eff, disp_azs,IniFiles,PropStorageEh, cardhistory, MemTableEh,
  MemTableDataEh;

const
  APPLICATION_NAME='MASTER';
  SCHEMA_NAME='MASTER';

type
  Tf_main = class(TForm)
    img_Common: TImageList;
    ora_Session: TOracleSession;
    acManagerMain: TActionManager;
    acCatCen: TAction;
    acOtpCen: TAction;
    WindowClose1: TWindowClose;
    WindowCascade1: TWindowCascade;
    WindowMinimizeAll1: TWindowMinimizeAll;
    WindowArrange1: TWindowArrange;
    ac_Nariad: TAction;
    ac_Dover: TAction;
    acOper_Ree: TAction;
    acDispReports: TAction;
    TBDock1: TTBDock;
    tb_MainMenu: TTBToolbar;
    tb_FEOmenu: TTBSubmenuItem;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    tb_OPIMmenu: TTBSubmenuItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    tb_OTTOmenu: TTBSubmenuItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    tb_windowMenu: TTBSubmenuItem;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    TBItem10: TTBItem;
    TBDock2: TTBDock;
    tb_SpeedToolBar: TTBToolbar;
    TBSeparatorItem1: TTBSeparatorItem;
    TBItem11: TTBItem;
    acUserGrants: TAction;
    acFin: TAction;
    acSbyt: TAction;
    acDisp: TAction;
    acWindow: TAction;
    TBMDIHandler1: TTBMDIHandler;
    TBMDIWindowItem1: TTBMDIWindowItem;
    TBItem12: TTBItem;
    acPlanStru: TAction;
    acPlanPost: TAction;
    TBItem13: TTBItem;
    TBItem14: TTBItem;
    acCatCenGroup: TAction;
    ac_Inf2PB: TAction;
    tb_optionMenu: TTBSubmenuItem;
    TBItem16: TTBItem;
    acKLSUni: TAction;
    acKLS: TAction;
    TBSubmenuItem5: TTBSubmenuItem;
    TBItem17: TTBItem;
    acRezReport: TAction;
    TBItem20: TTBItem;
    ImageXP: TImageList;
    acJKC: TAction;
    TBItem24: TTBItem;
    ac_PrintSF: TAction;
    TBItem25: TTBItem;
    acFinMosReps: TAction;
    TBItem26: TTBItem;
    acFinSNPReps: TAction;
    TBItem15: TTBItem;
    q_tmp: TOracleDataSet;
    acIdentify: TAction;
    TBItem27: TTBItem;
    acOBU: TAction;
    tb_OBUmenu: TTBSubmenuItem;
    acService: TAction;
    acOBUSberkart: TAction;
    TBItem28: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBDock3: TTBDock;
    TBDock4: TTBDock;
    TBDock5: TTBDock;
    TBItem29: TTBItem;
    TBItem30: TTBItem;
    acOBU_reports: TAction;
    oraFOR_TEMP: TOraclePackage;
    acSbytReports: TAction;
    TBItem31: TTBItem;
    tb_OITmenu: TTBSubmenuItem;
    acOIT: TAction;
    acAZC: TAction;
    acVIP: TAction;
    acVIPPredReps: TAction;
    acFinUNPReps: TAction;
    TBItem32: TTBItem;
    TBSubmenuItem1: TTBSubmenuItem;
    ac_ScriptGen: TAction;
    TBItem34: TTBItem;
    acVIPTraffic: TAction;
    TBItem35: TTBItem;
    acISU: TAction;
    acKvit2R3: TAction;
    acMonth: TAction;
    TBSubmenuItem6: TTBSubmenuItem;
    TBItem36: TTBItem;
    TBItem37: TTBItem;
    acCallsSend: TAction;
    TBItem38: TTBItem;
    acKlsLinks: TAction;
    TBItem18: TTBItem;
    ac_AZCRealiz: TAction;
    ac_AZCOtchet: TAction;
    ac_AZCKind: TAction;
    ac_AZCObject: TAction;
    TBSubmenuItem2: TTBSubmenuItem;
    TBItem19: TTBItem;
    TBItem21: TTBItem;
    TBSubmenuItem3: TTBSubmenuItem;
    TBItem22: TTBItem;
    TBItem23: TTBItem;
    acDiagram: TAction;
    TBItem39: TTBItem;
    acDayDispSvod: TAction;
    TBItem40: TTBItem;
    acDayDispDop: TAction;
    TBItem41: TTBItem;
    acPlanFact: TAction;
    TBItem42: TTBItem;
    acPrichinPF: TAction;
    TBItem43: TTBItem;
    Timer1: TTimer;
    acGdTime: TAction;
    TBItem44: TTBItem;
    acMonthPriceNPO: TAction;
    TBItem45: TTBItem;
    acSoobExp: TAction;
    TBItem46: TTBItem;
    ac_SvodPF: TAction;
    TBItem47: TTBItem;
    acEndDateFOX2R3: TAction;
    TBItem48: TTBItem;
    ac_AZCPerevod: TAction;
    TBItem49: TTBItem;
    acISUReports: TAction;
    TBItem50: TTBItem;
    acCounter: TAction;
    TBItem51: TTBItem;
    ac_azsEffect: TAction;
    TBSubmenuItem4: TTBSubmenuItem;
    acOUP: TAction;
    TBItem52: TTBItem;
    TBItem53: TTBItem;
    TBItem54: TTBItem;
    acOper_Zayav: TAction;
    TBItem55: TTBItem;
    TBItem56: TTBItem;
    acDiagramOIT: TAction;
    TBItem57: TTBItem;
    pkg_Init: TOraclePackage;
    TBItem58: TTBItem;
    acFilialsLoadRep: TAction;
    TBItem59: TTBItem;
    acPlanPostavki: TAction;
    acPlanRealizacii: TAction;
    TBItem60: TTBItem;
    TBItem61: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;
    acPlanning: TAction;
    acMetaPlanSetup: TAction;
    TBItem63: TTBItem;
    TBItem62: TTBItem;
    acClientBank: TAction;
    TBItem64: TTBItem;
    acNewSF: TAction;
    acEditSF: TAction;
    acSFNumbers: TAction;
    acSFView: TAction;
    TBSubmenuItem8: TTBSubmenuItem;
    TBItem65: TTBItem;
    TBItem66: TTBItem;
    TBItem67: TTBItem;
    TBItem68: TTBItem;
    acGDPLan4Anton: TAction;
    TBItem69: TTBItem;
    tb_MDIToolBar: TTBToolbar;
    mainWinList: TTBMDIWindowItem;
    AppEvents1: TAppEvents;
    acReports: TAction;
    TBItem70: TTBItem;
    ac1cParusAGN: TAction;
    TBItem71: TTBItem;
    acPlanPostSNP: TAction;
    acPlanPostOBR: TAction;
    TBItem72: TTBItem;
    TBItem73: TTBItem;
    acResursProizv: TAction;
    TBItem74: TTBItem;
    ac_AZCTarif: TAction;
    TBItem75: TTBItem;
    acZayavPost: TAction;
    acKorrZayavPost: TAction;
    TBItem76: TTBItem;
    TBItem77: TTBItem;
    acReestrSMN: TAction;
    TBItem79: TTBItem;
    acExport: TAction;
    acExportReports: TAction;
    TBSubmenuItem9: TTBSubmenuItem;
    TBItem80: TTBItem;
    q_reports: TOracleDataSet;
    acReplInit: TAction;
    TBItem81: TTBItem;
    acZakazUNP: TAction;
    acAlphaLoadRequest: TAction;
    TBItem83: TTBItem;
    acZakaz: TAction;
    acPayments: TAction;
    TBItem82: TTBItem;
    TBSubmenuItem10: TTBSubmenuItem;
    TBItem85: TTBItem;
    TBItem86: TTBItem;
    acPlanPostMainForSNP: TAction;
    acPlanPostOBRForSNP: TAction;
    TBItem87: TTBItem;
    TBItem88: TTBItem;
    TBItem89: TTBItem;
    acOUPTrk: TAction;
    acOrgStruKLS: TAction;
    acZakazMenu: TAction;
    TBSubmenuItem11: TTBSubmenuItem;
    TBSubmenuItem12: TTBSubmenuItem;
    acPlanPostMenu: TAction;
    TBSubmenuItem7: TTBSubmenuItem;
    TBSubmenuItem13: TTBSubmenuItem;
    ac_DoverMenu: TAction;
    acNprPrices: TAction;
    acSF: TAction;
    acNewSFNoOtgr: TAction;
    TBItem33: TTBItem;
    acEditSFNoOtgr: TAction;
    TBItem78: TTBItem;
    TBItem84: TTBItem;
    acExp2Infin: TAction;
    TBItem90: TTBItem;
    ac_dispazs: TAction;
    acPodacha: TAction;
    TBItem91: TTBItem;
    acGU12: TAction;
    TBItem92: TTBItem;
    acMO: TAction;
    acMOPodacha: TAction;
    TBSubmenuItem14: TTBSubmenuItem;
    TBItem93: TTBItem;
    acMOVedOsmotr: TAction;
    TBItem94: TTBItem;
    acPlanPostDEC: TAction;
    TBItem95: TTBItem;
    acSvedInNeftRaskred: TAction;
    TBItem96: TTBItem;
    acMOSved: TAction;
    TBItem97: TTBItem;
    m_CardHistory: TTBItem;
    acCardHistory: TAction;
    acSvedInNeftView: TAction;
    TBItem98: TTBItem;
    acMONakl: TAction;
    TBItem99: TTBItem;
    TBItem100: TTBItem;
    TBItem101: TTBItem;
    TBItem102: TTBItem;
    TBItem103: TTBItem;
    acRaspor: TAction;
    ac_NariadKNT: TAction;
    TBItem104: TTBItem;
    TBItem105: TTBItem;
    mainUserInfo: TTBItem;
    TBItem106: TTBItem;
    acMOUved: TAction;
    acMoveprod: TAction;
    TBItem107: TTBItem;
    acMOPasp: TAction;
    TBItem108: TTBItem;
    acMOTablPok: TAction;
    TBItem109: TTBItem;
    TBSubmenuItem15: TTBSubmenuItem;
    acMNOS: TAction;
    TBItem110: TTBItem;
    TBItem111: TTBItem;
    TBItem112: TTBItem;
    acMNOSReports: TAction;
    TBItem113: TTBItem;
    acUpdatelist: TAction;
    TBItem114: TTBItem;
    acSvedInNeft: TAction;
    TBItem115: TTBItem;
    acMO_ShabExp: TAction;
    TBItem116: TTBItem;
    TBItem117: TTBItem;
    acExportRailSF: TAction;
    TBItem118: TTBItem;
    acSvedInNeftPaspKvit: TAction;
    TBSubmenuItem16: TTBSubmenuItem;
    acSvedIn: TAction;
    TBItem119: TTBItem;
    acExport2R3: TAction;
    TBItem120: TTBItem;
    acExport2Pererabotka: TAction;
    MemTableEh1: TMemTableEh;
    acISU_PER: TAction;
    TBSubmenuItem17: TTBSubmenuItem;
    TBItem122: TTBItem;
    acImportSf: TAction;
    TBItem121: TTBItem;
    TBItem123: TTBItem;
    TBItem124: TTBItem;
    acPlanPostSAM: TAction;
    SHOWARCSISDATA: TAction;
    TBItem125: TTBItem;
    procedure N4Click(Sender: TObject);
    procedure acCatCenExecute(Sender: TObject);
    procedure acOtpCenExecute(Sender: TObject);
    procedure acOper_ReeExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acDispReportsExecute(Sender: TObject);
    procedure acUserGrantsExecute(Sender: TObject);
    procedure acFinExecute(Sender: TObject);
    procedure acSbytExecute(Sender: TObject);
    procedure acDispExecute(Sender: TObject);
    procedure acWindowExecute(Sender: TObject);
    procedure ac_DoverExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ac_NariadExecute(Sender: TObject);
    procedure acPlanStruExecute(Sender: TObject);
    procedure acPlanPostExecute(Sender: TObject);
    procedure acCatCenGroupExecute(Sender: TObject);
    procedure ac_Inf2PBExecute(Sender: TObject);
    procedure acKLSUniExecute(Sender: TObject);
    procedure acKLSExecute(Sender: TObject);
    procedure acRezReportExecute(Sender: TObject);
    procedure acJKCExecute(Sender: TObject);
    procedure ac_PrintSFExecute(Sender: TObject);
    procedure acFinMosRepsExecute(Sender: TObject);
    procedure acFinSNPRepsExecute(Sender: TObject);
    procedure acIdentifyExecute(Sender: TObject);
    procedure acOBUExecute(Sender: TObject);
    procedure acServiceExecute(Sender: TObject);
    procedure acOBUSberkartExecute(Sender: TObject);
    procedure acOBU_reportsExecute(Sender: TObject);
    procedure acSbytReportsExecute(Sender: TObject);
    procedure acOITExecute(Sender: TObject);
    procedure acFinUNPRepsExecute(Sender: TObject);
    procedure acVIPExecute(Sender: TObject);
    procedure ac_ScriptGenExecute(Sender: TObject);
    procedure acVIPTrafficExecute(Sender: TObject);
    procedure acISUExecute(Sender: TObject);
    procedure acMonthExecute(Sender: TObject);
    procedure acKvit2R3Execute(Sender: TObject);
    procedure acCallsSendExecute(Sender: TObject);
    procedure acKlsLinksExecute(Sender: TObject);
    procedure ac_AZCRealizExecute(Sender: TObject);
    procedure ac_AZCOtchetExecute(Sender: TObject);
    procedure ac_AZCKindExecute(Sender: TObject);
    procedure ac_AZCObjectExecute(Sender: TObject);
    procedure acAZCExecute(Sender: TObject);
    procedure acDiagramExecute(Sender: TObject);
    procedure acDayDispSvodExecute(Sender: TObject);
    procedure acDayDispDopExecute(Sender: TObject);
    procedure acPlanFactExecute(Sender: TObject);
    procedure acPrichinPFExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure acGdTimeExecute(Sender: TObject);
    procedure acMonthPriceNPOExecute(Sender: TObject);
    procedure acSoobExpExecute(Sender: TObject);
    procedure ac_SvodPFExecute(Sender: TObject);
    procedure acEndDateFOX2R3Execute(Sender: TObject);
    procedure ac_AZCPerevodExecute(Sender: TObject);
    procedure acISUReportsExecute(Sender: TObject);
    procedure acCounterExecute(Sender: TObject);
    procedure ac_azsEffectExecute(Sender: TObject);
    procedure acOUPExecute(Sender: TObject);
    procedure acNewSFExecute(Sender: TObject);
    procedure acOper_ZayavExecute(Sender: TObject);
    procedure acDiagramOITExecute(Sender: TObject);
    procedure ora_SessionAfterLogOn(Sender: TOracleSession);
    procedure acFilialsLoadRepExecute(Sender: TObject);
    procedure acPlanPostavkiExecute(Sender: TObject);
    procedure acPlanRealizaciiExecute(Sender: TObject);
    procedure acPlanning1Execute(Sender: TObject);
    procedure acMetaPlanOrgExecute(Sender: TObject);
    procedure acMetaPlanSetupExecute(Sender: TObject);
    procedure acClientBankExecute(Sender: TObject);
    procedure acEditSFExecute(Sender: TObject);
    procedure acSFNumbersExecute(Sender: TObject);
    procedure acSFViewExecute(Sender: TObject);
    procedure acGDPLan4AntonExecute(Sender: TObject);
    procedure AppEvents1Exception(Sender: TObject; E: Exception);
    procedure acReportsExecute(Sender: TObject);
    procedure ac1cParusAGNExecute(Sender: TObject);
    procedure acPlanPostSNPExecute(Sender: TObject);
    procedure acPlanPostOBRExecute(Sender: TObject);
    procedure acResursProizvExecute(Sender: TObject);
    procedure ac_AZCTarifExecute(Sender: TObject);
    procedure acZayavPostExecute(Sender: TObject);
    procedure acKorrZayavPostExecute(Sender: TObject);
    procedure acReestrSMNExecute(Sender: TObject);
    procedure acExportExecute(Sender: TObject);
    procedure acExportReportsExecute(Sender: TObject);
    procedure acReplInitExecute(Sender: TObject);
    procedure acZakazUNPExecute(Sender: TObject);
    procedure acAlphaLoadRequestExecute(Sender: TObject);
    procedure acZakazExecute(Sender: TObject);
    procedure acPaymentsExecute(Sender: TObject);
    procedure acPlanPostMainForSNPExecute(Sender: TObject);
    procedure acPlanPostOBRForSNPExecute(Sender: TObject);
    procedure acOUPTrkExecute(Sender: TObject);
    procedure acOrgStruKLSExecute(Sender: TObject);
    procedure acZakazMenuExecute(Sender: TObject);
    procedure acPlanningExecute(Sender: TObject);
    procedure acPlanPostMenuExecute(Sender: TObject);
    procedure ac_DoverMenuExecute(Sender: TObject);
    procedure acNprPricesExecute(Sender: TObject);
    procedure acSFExecute(Sender: TObject);
    procedure acNewSFNoOtgrExecute(Sender: TObject);
    procedure acEditSFNoOtgrExecute(Sender: TObject);
    procedure acExp2InfinExecute(Sender: TObject);
    procedure ac_dispazsExecute(Sender: TObject);
    procedure acPodachaExecute(Sender: TObject);
    procedure acGU12Execute(Sender: TObject);
    procedure acMOExecute(Sender: TObject);
    procedure acMOPodachaExecute(Sender: TObject);
    procedure acMOVedOsmotrExecute(Sender: TObject);
    procedure acPlanPostDECExecute(Sender: TObject);
    procedure acSvedInNeftRaskredExecute(Sender: TObject);
    procedure acMOSvedExecute(Sender: TObject);
    procedure m_CardHistoryClick(Sender: TObject);
    procedure acSvedInNeftViewExecute(Sender: TObject);
    procedure acCardHistoryExecute(Sender: TObject);
    procedure acMONaklExecute(Sender: TObject);
    procedure acRasporExecute(Sender: TObject);
    procedure ac_NariadKNTExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure acMOUvedExecute(Sender: TObject);
    procedure acMoveprodExecute(Sender: TObject);
    procedure TBItem107Click(Sender: TObject);
    procedure acMOPaspExecute(Sender: TObject);
    procedure acMOTablPokExecute(Sender: TObject);
    procedure acMNOSExecute(Sender: TObject);
    procedure acMNOSReportsExecute(Sender: TObject);
    procedure acUpdatelistExecute(Sender: TObject);
    procedure acSvedInNeftExecute(Sender: TObject);
    procedure acMO_ShabExpExecute(Sender: TObject);
    procedure acExportRailSFExecute(Sender: TObject);
    procedure acSvedInNeftPaspKvitExecute(Sender: TObject);
    procedure acSvedInExecute(Sender: TObject);
    procedure acExport2R3Execute(Sender: TObject);
    procedure acExport2PererabotkaExecute(Sender: TObject);
    procedure acISU_PERExecute(Sender: TObject);
    procedure acImportSfExecute(Sender: TObject);
    procedure TBItem123Click(Sender: TObject);
    procedure acPlanPostSAMExecute(Sender: TObject);
    procedure SHOWARCSISDATAExecute(Sender: TObject);
  private
    { Private declarations }
    EnvGrpVari:string; // группа переменных
    EnvGrpMail:string; // группа настроек почты
    EnvGrpLog:string; // группа настроек журнала
  public
    { Public declarations }
    // Приложение
    ApplSession:TApplSession; // Журнал событий приложения
    ApplPropStorageMan: TIniPropStorageManEh; // Хранилище свойст компонетов приложения
    ApplIniName:string;
    UserIniName:string;
    // Пользователь (APP_USERS)
    UserId:integer; // APP_USERS.ID
    UserNetName:string; // APP_USERS.NETNAME
    UserSNP:boolean; // APP_USERS.SNP=1
    UserUNP:boolean; // APP_USERS.UNP=1
    UserMNOS:boolean; //
    UserADMIN:boolean; // APP_USERS.IS_ADMIN=1
    // Oracle
    OraUser,  // Текущий пользователь Oracle
    OraPassword, // Пароль текущего пользователя Oracle
    OraDatabase:string; // БД текущего пользователя Oracle
    // SQL
    SQLUser, // имя пользователя для SQL-сервера
    SQLPassword, // пароль пользователя SQL-сервера
    SQLDatabase:string; // БД SQL-сервера
    // Переменные
    MasterPath:String; // Путь к каталогу MASTER
    MasterCRPEPath, // Путь к библиотекам Crystal Reports
    MasterRPTPath, // Путь к каталогу с шаблонами rpt-отчетов
    MasterXLSPath, // Путь к каталогу с шаблонами xls-отчетов
    MasterDBFPath, // Путь к каталогу с шаблонами dbf-файлов
    MasterMDBPath:String; // Путь к каталогу с mdb-файлами}
    EMailPath, // Путь к почтовому каталогу
    TempNetPath, // Каталог временных файлов в сети
    TempLocalPath:string; // Каталог временных файлов на локальной машине

{    InfinPath, // Путь к каталогу Инфина
    OperdataPath, // Путь к каталогу с оперативной отгрузкой
    ReestrPath, // Путь к каталогу ежесуточного реестра
    PlanPostPath, // Путь к каталогу программы "План поставок"
    ArchivePath, // Путь к каталогу архива БД Комплекса Финансы
    DbasesPath, // Путь к каталогу БД Комплекса Финансы
    OutDbasesPath, // База данных внешних поставщиков}

    EditSFNo:Integer; // Номер СФ
    EditSFDate:TDate; // Дата СФ
    EditedNom_dok:Integer; // Для редактирования счетов
    function GetApplVari(VariName:string):string; // считываем значение переменной приложения
    procedure SetApplVari(VariName,VariValue:string); // сохраняем значение переменной приложения
    function GetMailVari(VariName:string):string; // считываем значение настроек почты
    function GetLogVari(VariName:string):string; // считываем значение настроек журнала
  end;

var
  f_main: Tf_main;

implementation

uses CatCen,OtpCen,dbgrids, Dover, AskPeriod, Oper_ree,UserRite,
  Nariad,PlanStru,PlanPost,CatCenGr,INF2PBAL, KlsMisc2, RezReport,
  JKC_New,PrintSF, Identify, In1, AllRep, ForTemp, ForFiles, ForSystem, ForDB,
  ScriptGen, Month, Kvit2R3, Calls, KlsUnivers, KlsListLinks, azc,
  azc_sprav, azc_object, disprep, disprep1, f42, f42_prch, GdTime,
  PriceNPO, SoobExp, SvodPF, End_DT, azc_perevod, Counter, azsEff,
  oper_zayav,month_all, ForEnv, LoadFilList,pp_view,pr_view,loader,
  OneSF,NewSFAsker,SFNumbers,Oper_SF_new,GDPLan4Anton, Reports, contr,
  MemoEdit,ResourceProizv, azc_tarif, smn_ree,exp2inf,
  RepDbf, ReplInit, Alfa2Month, zakaz, Payments, OneSFNoOtgr, oper_pod,
  U_zayav, MO_Podacha, MO_VedOsmotr, SvedIn, MO_Sved, MO_Nakl, MO_PaspBrowse, Raspor, MO_Uved,
  u_moveprod, MO_Pasp, MO_TablPok, ParusLog, MO_ShabExp, OraToDbf,Export2R3,Export2Pererabotka,u_sfload,
  UnitTest,ARCSISDataFormUnit;

{$R *.DFM}

// считываем значение переменной приложения
function Tf_main.GetApplVari(VariName:string):string;
Begin
  GetApplVari:=F_Env.GetVari(APPLICATION_NAME,SCHEMA_NAME,EnvGrpVari,VariName,ora_Session);
End;

// сохраняем значение переменной приложения
procedure Tf_main.SetApplVari(VariName,VariValue:string);
Begin
  F_Env.SetVari(APPLICATION_NAME,SCHEMA_NAME,EnvGrpVari,VariName,VariValue,ora_Session);
End;

// считываем значение настроек почты
function Tf_main.GetMailVari(VariName:string):string;
Begin
  GetMailVari:=F_Env.GetVari(APPLICATION_NAME,SCHEMA_NAME,EnvGrpMail,VariName,ora_Session);
End;

// считываем значение настроек журнала
function Tf_main.GetLogVari(VariName:string):string;
Begin
  GetLogVari:=F_Env.GetVari(APPLICATION_NAME,SCHEMA_NAME,EnvGrpLog,VariName,ora_Session);
End;

procedure Tf_main.N4Click(Sender: TObject);
begin
  Close;
end;

procedure Tf_main.acCatCenExecute(Sender: TObject);
begin
  TF_CatCen.Create(Self);
end;

procedure Tf_main.acOtpCenExecute(Sender: TObject);
begin
  with TF_OtpCen.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acOper_ReeExecute(Sender: TObject);
begin
  with TF_Oper_Ree.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.FormClose(Sender: TObject; var Action: TCloseAction);
var
  I: Integer;
begin
  with f_main do
    for I := MDIChildCount-1 downto 0 do
      MDIChildren[I].Close ;

  // Завершить сессию
  ApplSession.DoneSession('MAIN');

  // Закрыть INI-файл
  F_Env.CloseINI;
end;

procedure Tf_main.acDispReportsExecute(Sender: TObject);
begin
  AllRep.RepKind:='OTTO';
  AllRep.IsVIP:=false;
  with tf_Rep.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acUserGrantsExecute(Sender: TObject);
begin
  tf_UserRights.Create(Self);
end;

procedure Tf_main.acFinExecute(Sender: TObject);
begin
  {sleep(50)};
end;

procedure Tf_main.acSbytExecute(Sender: TObject);
begin
  {sleep(50)};
end;

procedure Tf_main.acDispExecute(Sender: TObject);
begin
  {sleep(50)};
end;

procedure Tf_main.acWindowExecute(Sender: TObject);
begin
  {sleep(50)};
end;

procedure Tf_main.ac_DoverExecute(Sender: TObject);
begin
  with TF_Dover.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.FormCreate(Sender: TObject);
begin
  // Выключить таймер
  Timer1.Enabled:=false;

  // Создать сессию
  ApplSession:=TApplSession.Create(Self);

  // Инициализация переменных
  F_Env:=TMasterEnv.Create(Self);
  F_DB:=TMasterDB.Create(Self);
  F_FileUtils:=TMasterFileUtils.Create;
  F_ForSystem:=TMasterSysUtils.Create;
  TempVari := TTempVari.Create(Self);

  // Прочитать INI-файлы приложения и пользователя
  ApplIniName:=ExtractFilePath(ParamStr(0))+APPLICATION_NAME+'.ini';
  UserIniName:=ExtractFilePath(ParamStr(0))+APPLICATION_NAME+'_USER.ini';

  try
    F_Env.OpenINI(ApplIniName,UserIniName);
    with F_Env.ApplIni do
      begin
        ora_Session.LogonUsername:= ReadString('Common', 'User', SCHEMA_NAME);
        ora_Session.LogonPassword:= ReadString('Common', 'Passw', SCHEMA_NAME);
        ora_Session.LogonDataBase:= ReadString('Common', 'Database', 'BUH');
        SQLUser:= ReadString('Common', 'SQLUser', SCHEMA_NAME);
        SQLPassword:= ReadString('Common', 'SQLPassw', SCHEMA_NAME);
        SQLDataBase:= ReadString('Common', 'SQLDatabase', 'UKHBUH1');
        EnvGrpVari:= ReadString('Common', 'GRP_VARI', 'VARI');
        EnvGrpMail:= ReadString('Common', 'GRP_MAIL', 'MAIL');
        EnvGrpLog:= ReadString('Common', 'GRP_LOG', 'LOG');

        F_Env.SetGrpUseEnv(APPLICATION_NAME,SCHEMA_NAME,EnvGrpVari,
              (AnsiUpperCase(ReadString(EnvGrpVari,'USE_ENVIRONMENT','NO'))='YES'));
        F_Env.SetGrpUseEnv(APPLICATION_NAME,SCHEMA_NAME,EnvGrpMail,
              (AnsiUpperCase(ReadString(EnvGrpMail,'USE_ENVIRONMENT','NO'))='YES'));
        F_Env.SetGrpUseEnv(APPLICATION_NAME,SCHEMA_NAME,EnvGrpLog,
              (AnsiUpperCase(ReadString(EnvGrpLog,'USE_ENVIRONMENT','NO'))='YES'));
      end;

    // Получить доступ к БД
    ora_Session.LogOn;

    // Открыть сессию
    ApplSession.InitSession(amFull,APPLICATION_NAME,SCHEMA_NAME,'MAIN',ApplIniName,'Сессия приложения',ora_Session);
  except
    on E: Exception do
    Begin
      // Открыть сессию
      ApplSession.InitSession(amFull,APPLICATION_NAME,SCHEMA_NAME,'MAIN',ApplIniName,'Сессия приложения',nil);
      ApplSession.WriteToLog(amDefault,'MAIN',sesError,E.Message+#13#10+'Не удалось получить доступ',0,'');
    end;
  end;

  // Прочитать параметры приложения
  if ora_Session.Connected then
  begin
    MasterPath:=F_FileUtils.FillFilePath(GetApplVari('MasterPath'),false);
    MasterCRPEPath:=F_FileUtils.FillFilePath(GetApplVari('MasterCRPEPath'),false);
    MasterXLSPath:=F_FileUtils.FillFilePath(GetApplVari('MasterXLSPath'),false);
    MasterDBFPath:=F_FileUtils.FillFilePath(GetApplVari('MasterDBFPath'),false);
    MasterMDBPath:=F_FileUtils.FillFilePath(GetApplVari('MasterMDBPath'),false);
    MasterRPTPath:=F_FileUtils.FillFilePath(GetApplVari('MasterRPTPath'),false);
    TempNetPath:=F_FileUtils.FillFilePath(GetApplVari('TempNetPath'),true);
    TempLocalPath:=F_FileUtils.FillFilePath(GetApplVari('TempLocalPath'),true);
    EMailPath:=F_FileUtils.FillFilePath(GetApplVari('EMailPath'),false);

    OraUser:=ora_Session.LogonUsername;
    OraPassword:=ora_Session.LogonPassword;
    OraDatabase:=ora_Session.LogonDatabase;

    TempVari.Session := ora_Session;
    f_db.SetUserGrants(acManagerMain);
    acIdentifyExecute(Sender);
  End;

  // Подготовить хранилище свойст компонентов по умолчанию
  ApplPropStorageMan := TIniPropStorageManEh.Create(nil);
  ApplPropStorageMan.IniFileName := ExtractFilePath(ParamStr(0))+APPLICATION_NAME+'_TMP.INI';
  SetDefaultPropStorageManager(ApplPropStorageMan);
end;

procedure Tf_main.acPlanStruExecute(Sender: TObject);
begin
  with tf_PlanStru.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acPlanPostExecute(Sender: TObject);
begin
  PlanPost.GlobalPlanId:=2;
  with tf_PlanPost.Create(Self) do
  Begin
    FormStyle:=fsMDIChild;
    Width:=970;
    Height:=490;
  end;
end;


procedure Tf_main.acCatCenGroupExecute(Sender: TObject);
begin
  with TF_CatCenGroup.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.ac_Inf2PBExecute(Sender: TObject);
begin
  with TF_Inf2PBAL.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acKLSUniExecute(Sender: TObject);
begin
  with tf_KlsUnivers.Create(Self) do
  begin
    FormStyle:=fsMDIChild;
  end;
end;

procedure Tf_main.acKLSExecute(Sender: TObject);
begin
  {sleep(50)};
end;

procedure Tf_main.acRezReportExecute(Sender: TObject);
begin
  with TF_RezReport.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acJKCExecute(Sender: TObject);
begin
  with tf_JKCommit.Create(Self) do
  Begin
    FormStyle:=fsMDIChild;
  end;
end;

procedure Tf_main.ac_PrintSFExecute(Sender: TObject);
begin
  with tf_PrintSF.Create(Self) do
  Begin
    FormStyle:=fsMDIChild;
  end;
end;

procedure Tf_main.acFinMosRepsExecute(Sender: TObject);
begin
  AllRep.RepKind:='FIN_LUK';
  AllRep.IsVIP:=false;
  with tf_Rep.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acFinSNPRepsExecute(Sender: TObject);
begin
  AllRep.RepKind:='FIN_SNP';
  AllRep.IsVIP:=false;
  with tf_Rep.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acIdentifyExecute(Sender: TObject);
begin
  // Прочитать INI-файл пользователя
  UserId:= F_Env.UserIni.ReadInteger('COMMON', 'LAST_USER_ID', 0);

  with TF_Identify.Create(Self) do
  Begin
    if q_ApplUsers.RecordCount>1 then
    Begin
      ShowModal;
    end;
    if (q_ApplUsers.RecordCount<=1) or (ModalResult=mrOk) then
    Begin
      UserId:=q_ApplUsers.FieldByName('id').AsInteger;
      UserNetName:=q_ApplUsers.FieldByName('netname').AsString;
      UserADMIN:=(q_ApplUsers.FieldByName('IS_ADMIN').AsInteger=1);
         mainUserInfo.Caption:=q_ApplUsers.FieldByName('name').AsString;
      F_Env.UserIni.WriteInteger('COMMON','LAST_USER_ID',UserId);
      F_Env.UserIni.WriteString('COMMON','LAST_USER_NETNAME',UserNetName);
      F_Env.UserIni.WriteString('COMMON','LAST_USER_NAME',mainUserInfo.Caption);
      TempVari.SetVariNum('USER_ID',UserId);
    End
    else
    Begin
      UserId:=0;
    End;
    Free;
  End;
end;

procedure Tf_main.acOBUExecute(Sender: TObject);
begin
  {sleep(50)};
end;

procedure Tf_main.acServiceExecute(Sender: TObject);
begin
  {sleep(50)};
end;

procedure Tf_main.acOBUSberkartExecute(Sender: TObject);
begin
  Tfrm_OBU_sbcard.create(self);
end;

procedure Tf_main.acOBU_reportsExecute(Sender: TObject);
begin
  AllRep.RepKind:='OBU';
  AllRep.IsVIP:=false;
  with tf_Rep.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acSbytReportsExecute(Sender: TObject);
begin
  AllRep.RepKind:='OPIM';
  AllRep.IsVIP:=false;
  with tf_Rep.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acOITExecute(Sender: TObject);
begin
  {sleep(50)};
end;

procedure Tf_main.acFinUNPRepsExecute(Sender: TObject);
begin
  AllRep.RepKind:='FIN_UNP';
  AllRep.IsVIP:=false;
  with tf_Rep.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acVIPExecute(Sender: TObject);
begin
  {sleep(50)};
end;

procedure Tf_main.ac_ScriptGenExecute(Sender: TObject);
begin
  with tf_ScriptGen.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acVIPTrafficExecute(Sender: TObject);
begin
  AllRep.RepKind:='TRAFFIC';
  AllRep.IsVIP:=true;
  with tf_Rep.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acISUExecute(Sender: TObject);
begin
  {sleep(50)};
end;

procedure Tf_main.acMonthExecute(Sender: TObject);
begin
  with tf_Month.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acKvit2R3Execute(Sender: TObject);
begin
  with tf_Kvit2R3.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acCallsSendExecute(Sender: TObject);
begin
  with tf_Calls.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acKlsLinksExecute(Sender: TObject);
begin
  with tf_KlsListLinks.Create(Self) do
  begin
    FormStyle:=fsMDIChild;
  end;
end;

procedure Tf_main.ac_AZCRealizExecute(Sender: TObject);
begin
with Tf_forAZCRealiz.Create(self) do begin
FormStyle:=fsMDIChild;
ODS_Azc_realiz.Close;
ODS_azc_realiz.Session:= f_main.ora_session;
ODS_azc_realiz.SQL[11]:=('and azc_type_operation.KIND_OPER=2');
ODS_azc_realiz.Open;
end;
end;

procedure Tf_main.ac_AZCOtchetExecute(Sender: TObject);
begin
  AllRep.RepKind:='AZC';
  with tf_Rep.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.ac_AZCKindExecute(Sender: TObject);
begin
azc_sprav.azc_param:='KLS_ORG_KIND';
with Tf_forAZCSprav.Create(self) do
ODS_Spravochnik.ReadOnly:=true;
end;

procedure Tf_main.ac_AZCObjectExecute(Sender: TObject);
begin
Tf_forAZC_object.create(self);
end;

procedure Tf_main.acAZCExecute(Sender: TObject);
begin
  {sleep(50)};
end;

procedure Tf_main.acDiagramExecute(Sender: TObject);
begin
  AllRep.RepKind:='DIAGRAM';
  AllRep.IsVIP:=true;
  with tf_Rep.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acDayDispSvodExecute(Sender: TObject);
begin
  with TF_disprep.Create(Self) do
  try
    ShowModal;
  finally
//    F lkree;
  end;
end;

procedure Tf_main.acDayDispDopExecute(Sender: TObject);
begin
  with TF_disprep1.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure Tf_main.acPlanFactExecute(Sender: TObject);
begin
  f_f42:=tf_f42.create(Self);
  with f_f42 do
    try
      width:=380;
      ShowModal;
    finally
      Free
    end;
end;

procedure Tf_main.acPrichinPFExecute(Sender: TObject);
begin
  f_f42_prich:=tf_f42_prich.create(Self);
  with f_f42_prich do
    try
      ShowModal;
    finally
      Free
    end;
end;

procedure Tf_main.Timer1Timer(Sender: TObject);
var RepId:integer;
    RepType:string;
    RepFileName:string;
    Date_Beg:TdateTime;
    Date_End:TdateTime;
    Time_Beg:string;
    Time_End:string;
    ParCnt:integer;
    Par1,Par2,Par3:string;

begin
  Timer1.Enabled:=False;
  // Проверим на корректный login
  if f_main.UserId=0 then
  Begin
    Close;
    exit;
  end;

  // Проверим INI-файл
  if not FileExists(ApplIniName) then
  Begin
    Application.MessageBox(PChar('Файл '+ExtractFilePath(ParamStr(0))+APPLICATION_NAME+'.ini не найден!'),'Внимание!',MB_OK);
    Close;
    exit;
  end;

  ParCnt:=ParamCount;
  Par1:=AnsiUpperCase(ParamStr(1));
  Par2:=AnsiUpperCase(ParamStr(2));
  Par3:=AnsiUpperCase(ParamStr(3));

  // Загрузка Альфы
  if (ParCnt>0) and (Par1='/ALFA') then
    begin
      acAlphaLoadRequestExecute(Sender);
      frmAlfaLoadRequest.acLoadAlfaRequestExecute(sender);
      Close;
      exit;
    end;

  // Отправка план-факта
  if (ParCnt>0) and (Par1='/PF') then
    begin
      acPlanFactExecute(Sender);
      Close;
      exit;
    end;

  if (ParCnt>=3) and (Par1='/SEND') then
  try
    // Автоматическая отсылка сообщений
    RepId:=StrToInt(System.Copy(Par2,2,999));
    //ApplSession.WriteToLog(amAuto,'MAIN',sesInfo,IntToStr(RepId),0,'');
    RepType:=System.Copy(Par3,2,999);
    //ApplSession.WriteToLog(amAuto,'MAIN',sesInfo,RepType,0,'');
    q_reports.Close;
    q_reports.SQL[1]:='WHERE id='+IntToStr(RepId);
    f_db.ReQuery(q_reports,false);
    RepFileName:=q_reports.FieldByName('REPORT_FILE').AsString;
    //ApplSession.WriteToLog(amAuto,'MAIN',sesInfo,RepType,0,'');
    Date_End:=F_ForSystem.DecodeDateFormula(q_reports.FieldByName('DEF_END_VAL').AsString,Date);
    Date_Beg:=F_ForSystem.DecodeDateFormula(q_reports.FieldByName('DEF_BEG_VAL').AsString,Date_End);
    Time_Beg:=TimeToStr(F_ForSystem.DecodeTimeFormula(q_reports.FieldByName('DEF_BEG_TIME').AsString));
    Time_End:=TimeToStr(F_ForSystem.DecodeTimeFormula(q_reports.FieldByName('DEF_END_TIME').AsString));

    // Очистка параметров в специальной таблице MASTER_REPORTS
    oraFOR_TEMP.CallProcedure('EMPTY_REPORT_PARAM_VALUE',[RepId]);

    with TempVari do
    begin
      SetVariNum('REP_ID',q_reports.FieldByName('ID').AsInteger,APPLICATION_NAME,RepFileName); // ID отчета
      SetVariDate('BEGIN_DATE',DateOf(Date_Beg),APPLICATION_NAME,RepFileName); // С даты
      SetVariDate('END_DATE',DateOf(Date_End),APPLICATION_NAME,RepFileName);  // По дату
      SetVariChar('BEGIN_TIME',Time_Beg,APPLICATION_NAME,RepFileName); // С даты
      SetVariChar('END_TIME',Time_End,APPLICATION_NAME,RepFileName);  // По дату
    end;

    oraFOR_TEMP.CallProcedure('SET_REPORT_PARAM_VALUE',[RepId]);

    { Запустить отчет и передать в него параметры}
    if q_reports.FieldByName('REP_FORM').AsString<>'' then
    Begin
      // Запуск специальной формы
      If AnsiUpperCase(Trim(q_reports.FieldByName('REP_FORM').AsString))='F_REP_DBF' then
      Begin
        // Отчеты для отсылки в DBF и Excel
        RepDbf.ReportAuto:=true;
        RepDbf.ReportId:=q_reports.FieldByName('ID').AsInteger;
        RepDbf.ReportType:=RepType;
        with tf_Rep_Dbf.Create(Self) do
        Begin
        end;
      End;
    End
  except
    on E: Exception do
    Begin
      ApplSession.WriteToLog(amAuto,'MAIN',sesError,E.Message+#13#10+'Не удалось отослать сообщение '+ParamStr(2),0,'');
    end;
  end;
end;

procedure Tf_main.acGdTimeExecute(Sender: TObject);
begin
  with TF_GdTime.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acMonthPriceNPOExecute(Sender: TObject);
begin
  with tfrmPrice.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acSoobExpExecute(Sender: TObject);
begin
  SoobExp.f_SoobExp:=tf_SoobExp.create(Self);
  with f_SoobExp do
  try
    ShowModal;
  finally
    Free
  end;
end;

procedure Tf_main.ac_SvodPFExecute(Sender: TObject);
begin
  SvodPF.f_SvodPF:=tf_SvodPF.create(Self);
  with f_SvodPF do
  try
    ShowModal;
  finally
    Free
  end;
end;

procedure Tf_main.acEndDateFOX2R3Execute(Sender: TObject);
begin
  End_DT.f_EndDateFOX2R3:=tf_EndDateFOX2R3.create(Self);
  with f_EndDateFOX2R3 do
  try
    ShowModal;
  finally
    Free
  end;
end;

procedure Tf_main.ac_AZCPerevodExecute(Sender: TObject);
begin
// перевод остатков
tf_forAZC_perevod.Create(Self);
//
end;

procedure Tf_main.acISUReportsExecute(Sender: TObject);
begin
  AllRep.RepKind:='ISU';
  AllRep.IsVIP:=false;
  with tf_Rep.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acCounterExecute(Sender: TObject);
begin
  with tf_Counter.Create(Self) do
    begin
      FormStyle:=fsStayOnTop;
      Show;
    end;
{  f_Counter:=tf_Counter.Create(Self);
  f_Counter.Show;}
end;

procedure Tf_main.ac_azsEffectExecute(Sender: TObject);
var
f:  Tf_azsEff;
begin
//  tf_azseff.Create(Self);
//  tf_azseff.
  f := tf_azseff.Create(Self);
  f.FormStyle := fsMDIChild;;
//  f.Show;

//  f.Free;
end;

procedure Tf_main.acOUPExecute(Sender: TObject);
begin
  {sleep(50)};
end;

procedure Tf_main.acNewSFExecute(Sender: TObject);
begin
  with tf_OneSF.Create(Self) do
    begin
      FormStyle:=fsMDIChild;
    end;
end;

procedure Tf_main.acOper_ZayavExecute(Sender: TObject);
begin
  with TF_Oper_Zayav.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acDiagramOITExecute(Sender: TObject);
begin
  AllRep.RepKind:='DIAGRAM';
  AllRep.IsVIP:=false;
  with tf_Rep.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.ora_SessionAfterLogOn(Sender: TOracleSession);
begin
  pkg_init.Session:=Sender;
  pkg_Init.CallProcedure('Init_MASTER',[]);
  UserSNP:=(pkg_init.CallIntegerFunction('AppUserSNP',[])=1);
  UserUNP:=(pkg_init.CallIntegerFunction('AppUserUNP',[])=1);
  UserMNOS:=(pkg_init.CallIntegerFunction('AppUserMNOS',[])=1);
end;


procedure Tf_main.acFilialsLoadRepExecute(Sender: TObject);
begin
 with Tf_LoadFilList.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acPlanPostavkiExecute(Sender: TObject);
begin
 with TfrmPPView.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acPlanRealizaciiExecute(Sender: TObject);
begin
 with TfrmPRView.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acPlanning1Execute(Sender: TObject);
begin
  {sleep(50)};
end;

procedure Tf_main.acMetaPlanOrgExecute(Sender: TObject);
begin
  //
end;

procedure Tf_main.acMetaPlanSetupExecute(Sender: TObject);
begin
with Tf_MetaPlanSetup.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acClientBankExecute(Sender: TObject);
begin
 with Tcb2Parus.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acEditSFExecute(Sender: TObject);
begin
  with tf_NewSFAsker.Create(Self) do
    begin
      if EditSFNo<>0 then
        begin
          e_nomSF.Text:=IntToStr(EditSFNo);
          MonthCalendar1.Date:=EditSFDate;
          EditSFNo:=0;
        end;
      ShowModal;
      if ModalResult=mrOk then
        begin
          if q_tmp.Active then q_tmp.Close;
          q_tmp.SQL.Clear;
          q_tmp.SQL.Add('SELECT nom_dok FROM bills WHERE date_vyp_sf=TO_DATE('''+FormatDateTime('dd.mm.yyyy',MonthCalendar1.Date)+''',''dd.mm.yyyy'') AND nom_sf='+e_nomSF.Text);
//          q_tmp.SQL.SaveToFile('c:\a.txt');
          f_db.ReQuery(q_tmp,false);
          if q_tmp.RecordCount=1 then
            with tf_OneSF.Create(Self) do
              begin
                FormStyle:=fsMDIChild;
                e_DateKvit.Date:=MonthCalendar1.Date;
                DateSF:=MonthCalendar1.Date;
                Caption:='Корректировка счета №'+e_nomSF.Text+' от '+FormatDateTime('dd.mm.yyyy',MonthCalendar1.Date)+'г.';
                EditedNom_dok:=q_tmp.FieldByName('nom_dok').AsInteger;
                Edit1.Text:='Заглушка';
                Edit1Exit(Edit1);
              end;
          if q_tmp.RecordCount=0 then
            ShowMessage('Счет №'+e_nomSF.Text+' от '+FormatDateTime('dd.mm.yyyy',MonthCalendar1.Date)+'г. не найден.');
          if q_tmp.RecordCount>1 then
            ShowMessage('Найдено более одного счета. Обратитесь в отдел ИТ');
          q_tmp.Close;
        end;
      Free;
    end;
end;

procedure Tf_main.acSFNumbersExecute(Sender: TObject);
begin
 with Tf_SFNumbers.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acSFViewExecute(Sender: TObject);
begin
 with Tf_Oper_SF.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acGDPLan4AntonExecute(Sender: TObject);
begin
 with TF_GDPLan4Anton.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.AppEvents1Exception(Sender: TObject; E: Exception);
var
  parOwner:TComponent;
  FormName:string;
begin
  FormName:='';
  parOwner:=TComponent(Sender);
  try
    repeat
      if (parOwner is TForm) then
      Begin
        FormName:=parOwner.Name;
        break;
      End;
      parOwner:=parOwner.Owner;
    until (parOwner=nil);
  except
    FormName:='';
  end;
  ApplSession.WriteToLog(amFull,'Форма '+FormName,sesError,E.Message,0,'');
  Screen.Cursor := crDefault;
end;

procedure Tf_main.acReportsExecute(Sender: TObject);
begin
  with tf_Reports.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.ac1cParusAGNExecute(Sender: TObject);
begin
	with tfrm1cParAgn.Create(Self) do
		FormStyle:=fsMDIChild;
end;


procedure Tf_main.acPlanPostSNPExecute(Sender: TObject);
begin
	PlanPost.GlobalPlanId:=1;
	with tf_PlanPost.Create(Self) do
	Begin
		FormStyle:=fsMDIChild;
		Width:=970;
		Height:=490;
	end;

end;

procedure Tf_main.acPlanPostOBRExecute(Sender: TObject);
begin
	PlanPost.GlobalPlanId:=3;
	with tf_PlanPost.Create(Self) do
	Begin
		FormStyle:=fsMDIChild;
		Width:=970;
		Height:=490;
	end;
end;

procedure Tf_main.acResursProizvExecute(Sender: TObject);
begin
	with tfrmResourceProizv.Create(Self) do
		FormStyle:=fsMDIChild;
end;

procedure Tf_main.ac_AZCTarifExecute(Sender: TObject);
begin
 with Tf_forAZC_tarif.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acZayavPostExecute(Sender: TObject);
begin
  PlanPost.GlobalPlanId:=5;
  with tf_PlanPost.Create(Self) do
  Begin
    FormStyle:=fsMDIChild;
    Width:=970;
    Height:=490;
  end;

end;

procedure Tf_main.acKorrZayavPostExecute(Sender: TObject);
begin
  PlanPost.GlobalPlanId:=6;
  with tf_PlanPost.Create(Self) do
  Begin
    FormStyle:=fsMDIChild;
    Width:=970;
    Height:=490;
  end;
end;

procedure Tf_main.acReestrSMNExecute(Sender: TObject);
begin
  with TF_smn_ree.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acExportExecute(Sender: TObject);
begin
  {sleep(50)};
end;

procedure Tf_main.acExportReportsExecute(Sender: TObject);
begin
  AllRep.RepKind:='EXPORT';
  with tf_Rep.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acReplInitExecute(Sender: TObject);
begin
  ReplInit.gDATABASE:='';
  ReplInit.gUSERNAME:='SNP_REPL';
  ReplInit.gPASSWORD:='';
  ReplInit.gMODE:=amFull;
  ReplInit.gIniFile:='';
  ReplInit.gSCHEMA_NAME:='SNP_REPL';
  with tf_ReplInit.Create(Self) do
  Begin
    ShowModal;
    Free;
  end;
end;

procedure Tf_main.acZakazUNPExecute(Sender: TObject);
begin
 zakaz.gAgentID:=8;
 with Tf_Zakaz.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acAlphaLoadRequestExecute(Sender: TObject);
begin
    with TfrmAlfaLoadRequest.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acZakazExecute(Sender: TObject);
begin
 zakaz.gAgentID:=2641;
 with Tf_Zakaz.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acPaymentsExecute(Sender: TObject);
begin
  with TF_Payments.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acPlanPostMainForSNPExecute(Sender: TObject);
begin
  PlanPost.GlobalPlanId:=12;
  with tf_PlanPost.Create(Self) do
  Begin
    FormStyle:=fsMDIChild;
    Width:=970;
    Height:=490;
  end;
end;

procedure Tf_main.acPlanPostOBRForSNPExecute(Sender: TObject);
begin
  PlanPost.GlobalPlanId:=13;
  with tf_PlanPost.Create(Self) do
  Begin
    FormStyle:=fsMDIChild;
    Width:=970;
    Height:=490;
  end;
end;

procedure Tf_main.acOUPTrkExecute(Sender: TObject);
var
f:  Tf_trkEff;
begin
//  tf_azseff.Create(Self);
//  tf_azseff.
  f := tf_trkeff.Create(Self);
  f.FormStyle := fsMDIChild;;
end;

procedure Tf_main.acOrgStruKLSExecute(Sender: TObject);
begin
  Sleep(50);
end;

procedure Tf_main.acZakazMenuExecute(Sender: TObject);
begin
  {--}
end;

procedure Tf_main.acPlanningExecute(Sender: TObject);
begin
  {--}
end;

procedure Tf_main.acPlanPostMenuExecute(Sender: TObject);
begin
  {--}
end;

procedure Tf_main.ac_DoverMenuExecute(Sender: TObject);
begin
  {sleep(50)};
end;

procedure Tf_main.acNprPricesExecute(Sender: TObject);
begin
  {sleep(50)};

end;

procedure Tf_main.acSFExecute(Sender: TObject);
begin
  {sleep(50)};

end;

procedure Tf_main.acNewSFNoOtgrExecute(Sender: TObject);
begin
  EditedNom_dok:=0;
  with Tf_OneSFNoOtgr.Create(Self) do
    begin
      FormStyle:=fsMDIChild;
      Width:=900;
      Height:=500;
    end;
end;

procedure Tf_main.acEditSFNoOtgrExecute(Sender: TObject);
begin
  with tf_NewSFAsker.Create(Self) do
    begin
      if EditSFNo<>0 then
        begin
          e_nomSF.Text:=IntToStr(EditSFNo);
          MonthCalendar1.Date:=EditSFDate;
          EditSFNo:=0;
        end;
      ShowModal;
      if ModalResult=mrOk then
        begin
          if q_tmp.Active then q_tmp.Close;
          q_tmp.SQL.Clear;
          q_tmp.SQL.Add('SELECT nom_dok,bills.dog_id, bills.usl_number,kls_dog.predpr_id FROM bills,kls_dog WHERE date_vyp_sf=TO_DATE('''+FormatDateTime('dd.mm.yyyy',MonthCalendar1.Date)+''',''dd.mm.yyyy'') AND bills.dog_id=kls_dog.id AND nom_sf='+e_nomSF.Text);
//          q_tmp.SQL.SaveToFile('c:\a.txt');
          f_db.ReQuery(q_tmp,false);
          EditedNom_dok:=q_tmp.FieldByName('nom_dok').AsInteger;
          if q_tmp.RecordCount=1 then
            with tf_OneSFNoOtgr.Create(Self) do
              begin
                FormStyle:=fsMDIChild;
                e_DateVypSf.Date:=MonthCalendar1.Date;
                DateSF:=MonthCalendar1.Date;
                lc_Predpr.Value:=q_tmp.FieldByName('predpr_id').AsString;
                lc_Dog.Value:=q_tmp.FieldByName('dog_id').AsString;
                lc_Usl_Dog.Value:=q_tmp.FieldByName('usl_number').AsString;
                Caption:='Корректировка счета №'+e_nomSF.Text+' от '+FormatDateTime('dd.mm.yyyy',MonthCalendar1.Date)+'г.';
              end;
          if q_tmp.RecordCount=0 then
            ShowMessage('Счет №'+e_nomSF.Text+' от '+FormatDateTime('dd.mm.yyyy',MonthCalendar1.Date)+'г. не найден.');
          if q_tmp.RecordCount>1 then
            ShowMessage('Найдено более одного счета. Обратитесь к специалистам в области информационных технологий!');
          q_tmp.Close;
        end;
      Free;
    end;
end;

procedure Tf_main.acExp2InfinExecute(Sender: TObject);
begin
 with TfrmExp2INFIN.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.ac_dispazsExecute(Sender: TObject);
begin
  with Tf_dispazs.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acPodachaExecute(Sender: TObject);
begin
  with TF_Oper_pod.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acGU12Execute(Sender: TObject);
begin
  U_Zayav.f_zayav:=TF_Zayav.Create(Self);
  with f_zayav do
  Begin
    ShowModal;
    Free;
  end;
end;

procedure Tf_main.acMOExecute(Sender: TObject);
begin
  {sleep(50)};
end;

procedure Tf_main.acMOPodachaExecute(Sender: TObject);
begin
  MO_Podacha.gMesto:=1; // место отгрузки - Эстакада
  MO_Podacha.gLoadType:=1; // тип транспортировки - Ж/д
  MO_Podacha.gMode:=1; // режим - Первичный ввод
  with TF_Podacha.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acMOVedOsmotrExecute(Sender: TObject);
begin
  MO_VedOsmotr.gMesto:=5; // место отгрузки - Ветласян
  MO_VedOsmotr.gLoadType:=1; // тип транспортировки - Ж/д
  MO_VedOsmotr.gMode:=1; // режим - Первичный ввод
  with TF_VedOsmotr.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acPlanPostDECExecute(Sender: TObject);
begin
	PlanPost.GlobalPlanId:=7;
	with tf_PlanPost.Create(Self) do
	Begin
		FormStyle:=fsMDIChild;
		Width:=970;
		Height:=490;
	end;

end;

procedure Tf_main.acSvedInNeftRaskredExecute(Sender: TObject);
begin
  SvedIn.gMesto:=1; // место отгрузки - Эстакада
  SvedIn.gNeft:=true; // слив нефти
  SvedIn.gMode:=2; // режим - Раскредитовывание
  with TF_SvedIn.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acMOSvedExecute(Sender: TObject);
begin
  MO_Sved.gMesto:=1; // место отгрузки - Эстакада
  MO_Sved.gLoadType:=1; // тип транспортировки - Ж/д
  MO_Sved.gMode:=1; // режим - Первичный ввод
  with TF_Sved.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.m_CardHistoryClick(Sender: TObject);
var
f:  Tf_cardHistory;
begin
//  tf_azseff.Create(Self);
//  tf_azseff.
  f := tf_cardhistory.Create(Self);
  f.FormStyle := fsMDIChild;;
end;

procedure Tf_main.acSvedInNeftViewExecute(Sender: TObject);
begin
  SvedIn.gMesto:=1; // место отгрузки - Эстакада
  SvedIn.gNeft:=true; // слив нефти
  SvedIn.gMode:=3; // режим - Просмотр
  with TF_SvedIn.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acCardHistoryExecute(Sender: TObject);
var
f:  Tf_cardHistory;
begin
  f := tf_cardhistory.Create(Self);
  f.FormStyle := fsMDIChild;;
end;

procedure Tf_main.acMONaklExecute(Sender: TObject);
begin
  MO_Nakl.gMesto:=1; // место отгрузки - Эстакада
  MO_Nakl.gLoadType:=1; // тип транспортировки - Ж/д
  MO_Nakl.gMode:=1; // режим - Первичный ввод
  with TF_Nakl.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.ac_NariadExecute(Sender: TObject);
begin
  Raspor.gMesto:=2; // место отгрузки - Автоналив
  Raspor.gLoadType:=2; // тип транспортировки - самовывоз
  Raspor.gMode:=1; // режим - Первичный ввод
  with TF_Raspor.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acRasporExecute(Sender: TObject);
begin
  Raspor.gMesto:=1; // место отгрузки - Эстакада
  Raspor.gLoadType:=1; // тип транспортировки - Ж/д
  Raspor.gMode:=1; // режим - Первичный ввод
  with TF_Raspor.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.ac_NariadKNTExecute(Sender: TObject);
begin
  Raspor.gMesto:=2; // место отгрузки - Автоналив
  Raspor.gLoadType:=6; // тип транспортировки - контейнеры
  Raspor.gMode:=1; // режим - Первичный ввод
  with TF_Raspor.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.FormActivate(Sender: TObject);
begin
  // Включить таймер
  Timer1.Enabled:=true;
end;

procedure Tf_main.acMOUvedExecute(Sender: TObject);
begin
  MO_Uved.gMesto:=1; // место отгрузки - Эстакада
  MO_Uved.gLoadType:=1; // тип транспортировки - Ж/д
  MO_Uved.gMode:=1; // режим - Первичный ввод
  with TF_Uved.Create(Self) do
    FormStyle:=fsMDIChild;

end;

procedure Tf_main.acMoveprodExecute(Sender: TObject);
begin
{  f_move:=TF_move.Create(Self);
  with f_move do
  Begin
    ShowModal;
    Free;
  end;}
 with TF_move.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.TBItem107Click(Sender: TObject);
begin
  acMoveprod.Execute;
end;

procedure Tf_main.acMOPaspExecute(Sender: TObject);
begin
  MO_Pasp.gMesto:=1; // место отгрузки - Эстакада
  MO_Pasp.gLoadType:=1; // тип транспортировки - Ж/д
  MO_Pasp.gMode:=1; // режим - Первичный ввод
  with TF_Pasp.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acMOTablPokExecute(Sender: TObject);
begin
  with Tf_TablPok.Create(Self) do FormStyle:=fsMDIChild;
end;

procedure Tf_main.acMNOSExecute(Sender: TObject);
begin
 //
end;

procedure Tf_main.acMNOSReportsExecute(Sender: TObject);
begin
  AllRep.RepKind:='MNOS';
  AllRep.IsVIP:=false;
  with tf_Rep.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acUpdatelistExecute(Sender: TObject);
begin
  with Tf_ParusLog.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acSvedInNeftExecute(Sender: TObject);
begin
  SvedIn.gMesto:=1; // место отгрузки - Эстакада
  SvedIn.gNeft:=true; // слив нефти
  SvedIn.gMode:=1; // режим - Просмотр
  with TF_SvedIn.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acMO_ShabExpExecute(Sender: TObject);
begin
  with Tf_ShabExp.Create(Self) do
    FormStyle:=fsMDIChild;
end;


procedure Tf_main.acExportRailSFExecute(Sender: TObject);
begin
  with tf_ORAToDBF.Create(Self) do
    begin
      DBFtoORAid:='RAIL_SF';
      ShowModal;
    end;
end;

procedure Tf_main.acSvedInNeftPaspKvitExecute(Sender: TObject);
begin
  SvedIn.gMesto:=1; // место отгрузки - Эстакада
  SvedIn.gNeft:=true; // слив нефти
  SvedIn.gMode:=4; // режим - Ввод паспортных данных из накладной
  with TF_SvedIn.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_main.acSvedInExecute(Sender: TObject);
begin
 {}
end;

procedure Tf_main.acExport2R3Execute(Sender: TObject);
begin
  with tf_Export2R3.Create(Self) do
  Begin
    FormStyle:=fsMDIChild;
  end;

end;

procedure Tf_main.acExport2PererabotkaExecute(Sender: TObject);
begin
  with tf_Export2Pererabotka.Create(Self) do
  Begin
    FormStyle:=fsMDIChild;
  end;
end;

procedure Tf_main.acISU_PERExecute(Sender: TObject);
begin
  {sleep(50)};
end;

procedure Tf_main.acImportSfExecute(Sender: TObject);
begin
  with tf_sfload.Create(Self) do
  Begin
    FormStyle:=fsMDIChild;
  end;

end;

procedure Tf_main.TBItem123Click(Sender: TObject);
begin
  with tFormTest.Create(Self) do
  Begin
    ShowModal
  end;
end;

procedure Tf_main.acPlanPostSAMExecute(Sender: TObject);
begin
  PlanPost.GlobalPlanId:=14;
  with tf_PlanPost.Create(Self) do
  Begin
    FormStyle:=fsMDIChild;
    Width:=970;
    Height:=490;
  end;

end;

procedure Tf_main.SHOWARCSISDATAExecute(Sender: TObject);
begin
  with TARCSISDATAFORM.Create(Self) do
  begin
    //ShowModal;
    FormStyle:=fsMDIChild ;
  end;
end;



end.
