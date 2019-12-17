unit ReplInit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, DB, OracleData, Oracle, Grids, DBGridEh,
  TB2Item, ActnList, TB2Dock, TB2Toolbar, XPStyleActnCtrls, ActnMan,
  StdCtrls, DBCtrls, DBCtrlsEh, Mask, DateUtils, RxLookup, strutils, ForSESS,
  Menus, TB2ExtItems, GridsEh;

const
  ListMetaTables='KLS_EVENTS,KLS_REPL_MODE,KLS_STATUS,REPL_SITE,REPL_TABLE,REPL_SCHEMA,REPL_SCHEMA_ROW,CATALOG_LIST,FCACGR_LIST,STORE_LIST';
  MODULE_NAME='REPLINIT';

type
  Tf_ReplInit = class(TForm)
    PageControl1: TPageControl;
    tabSite: TTabSheet;
    tabSchema: TTabSheet;
    tabLog: TTabSheet;
    tabStatus: TTabSheet;
    tabCallOut: TTabSheet;
    tabCall: TTabSheet;
    tabAnsw: TTabSheet;
    Panel4: TPanel;
    oraSess: TOracleSession;
    q_sites: TOracleDataSet;
    ds_sites: TDataSource;
    q_sitesRN: TFloatField;
    q_sitesNAME: TStringField;
    q_sitesSORTBY: TFloatField;
    q_sitesIS_ACTIVE: TIntegerField;
    ActionManager1: TActionManager;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBSeparatorItem2: TTBSeparatorItem;
    TBDock2: TTBDock;
    TBToolbar2: TTBToolbar;
    TBSeparatorItem1: TTBSeparatorItem;
    TBDock3: TTBDock;
    TBToolbar3: TTBToolbar;
    TBSeparatorItem3: TTBSeparatorItem;
    TBDock5: TTBDock;
    TBToolbar5: TTBToolbar;
    TBSeparatorItem5: TTBSeparatorItem;
    TBDock7: TTBDock;
    TBToolbar7: TTBToolbar;
    TBSeparatorItem7: TTBSeparatorItem;
    acReplInitDelSite: TAction;
    acReplInitDelSchema: TAction;
    acReplInitDelStatus: TAction;
    acReplInitAddSite: TAction;
    acReplInitAddSchema: TAction;
    acReplInitAddStatus: TAction;
    acReplInitDelCallOut: TAction;
    acReplInitDelCall: TAction;
    acReplInitDelAnsw: TAction;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    acReplInitAddSchemaRow: TAction;
    acReplInitDelSchemaRow: TAction;
    Panel1: TPanel;
    gridSites: TDBGridEh;
    Panel15: TPanel;
    GroupBox1: TGroupBox;
    Panel16: TPanel;
    q_init: TOracleDataSet;
    ds_init: TDataSource;
    q_initRN: TFloatField;
    q_initSITE_RN: TFloatField;
    q_initIS_CURRENT: TIntegerField;
    q_initBOX_IN: TStringField;
    q_initBOX_OUT: TStringField;
    q_initEMAIL_ADMIN: TStringField;
    q_initREPL_SCHEMANAME: TStringField;
    q_initUSE_DBLINK: TIntegerField;
    q_initDBLINK: TStringField;
    DBCheckBox1: TDBCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox3: TGroupBox;
    DBCheckBox2: TDBCheckBox;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    q_sitesIS_CURRENT: TFloatField;
    acReplInitRefreshSite: TAction;
    acReplInitRefreshSchema: TAction;
    TBItem11: TTBItem;
    gridSchemaRow: TDBGridEh;
    TBDock8: TTBDock;
    TBToolbar8: TTBToolbar;
    TBItem12: TTBItem;
    TBItem13: TTBItem;
    TBSeparatorItem8: TTBSeparatorItem;
    gridSchema: TDBGridEh;
    q_schema: TOracleDataSet;
    FloatField1: TFloatField;
    StringField1: TStringField;
    FloatField2: TFloatField;
    IntegerField1: TIntegerField;
    ds_schema: TDataSource;
    q_site_list: TOracleDataSet;
    ds_site_list: TDataSource;
    TBItem14: TTBItem;
    q_schema_row: TOracleDataSet;
    ds_schema_row: TDataSource;
    q_schema_rowRN: TFloatField;
    q_schema_rowSITE_SOURCE_RN: TFloatField;
    q_schema_rowSITE_DEST_RN: TFloatField;
    q_schema_rowSCHEMA_RN: TFloatField;
    q_schema_rowTABLE_SOURCE_RN: TFloatField;
    q_schema_rowSQL_FIELDS: TStringField;
    q_schema_rowSQL_WHERE: TStringField;
    q_schema_rowREPL_TABLE: TStringField;
    q_schema_rowREPL_MODE: TIntegerField;
    q_schema_rowSORTBY: TFloatField;
    q_schema_rowIS_ACTIVE: TIntegerField;
    q_schema_rowTABLE_DEST_RN: TFloatField;
    q_schemaSITE_SOURCE_RN: TFloatField;
    q_schemaSITE_DEST_RN: TFloatField;
    acReplInitRefreshSchemaRow: TAction;
    acReplInitPostSchemaRow: TAction;
    acReplInitCancelSchemaRow: TAction;
    TBItem15: TTBItem;
    TBItem16: TTBItem;
    q_table_list: TOracleDataSet;
    ds_table_list: TDataSource;
    q_schema_rowTABLE_SOURCE: TStringField;
    q_schema_rowTABLE_DEST: TStringField;
    q_mode: TOracleDataSet;
    q_schema_rowREPL_MODE_NAME: TStringField;
    tabTable: TTabSheet;
    TBDock9: TTBDock;
    TBToolbar9: TTBToolbar;
    TBItem17: TTBItem;
    TBItem18: TTBItem;
    TBSeparatorItem9: TTBSeparatorItem;
    TBItem19: TTBItem;
    gridTables: TDBGridEh;
    acReplInitAddTable: TAction;
    acReplInitDelTable: TAction;
    acReplInitRefreshTable: TAction;
    ds_table: TDataSource;
    q_table: TOracleDataSet;
    q_tableRN: TFloatField;
    q_tableREPL_USERNAME: TStringField;
    q_tableREPL_TABLENAME: TStringField;
    q_tableNOTE: TStringField;
    q_tableUSERNAME: TStringField;
    q_tableTABLENAME: TStringField;
    q_tableRNNAME: TStringField;
    q_log: TOracleDataSet;
    ds_log: TDataSource;
    Label8: TLabel;
    q_logDATE_LOG: TDateTimeField;
    q_logAPPL_ERR: TStringField;
    TBDock6: TTBDock;
    TBToolbar6: TTBToolbar;
    TBSeparatorItem6: TTBSeparatorItem;
    TBItem22: TTBItem;
    acReplInitRefreshLog: TAction;
    cb_Site: TRxDBLookupCombo;
    q_logAPPL_CODE: TFloatField;
    cb_Critical: TCheckBox;
    q_table_listRN: TFloatField;
    q_table_listREPL_USERNAME: TStringField;
    q_table_listREPL_TABLENAME: TStringField;
    q_table_listNOTE: TStringField;
    q_table_listUSERNAME: TStringField;
    q_table_listTABLENAME: TStringField;
    q_table_listRNNAME: TStringField;
    q_modeRN: TFloatField;
    q_modeNAME: TStringField;
    q_schema_list: TOracleDataSet;
    ds_schema_list: TDataSource;
    q_schema_listRN: TFloatField;
    q_schema_listSITE_SOURCE_RN: TFloatField;
    q_schema_listSITE_DEST_RN: TFloatField;
    q_schema_listNAME: TStringField;
    q_schema_listSORTBY: TFloatField;
    q_schema_listIS_ACTIVE: TIntegerField;
    q_schema_row_list: TOracleDataSet;
    ds_schema_row_list: TDataSource;
    q_schema_row_listRN: TFloatField;
    q_schema_row_listSITE_SOURCE_RN: TFloatField;
    q_schema_row_listSITE_DEST_RN: TFloatField;
    q_schema_row_listSCHEMA_RN: TFloatField;
    q_schema_row_listTABLE_SOURCE_RN: TFloatField;
    q_schema_row_listSQL_FIELDS: TStringField;
    q_schema_row_listSQL_WHERE: TStringField;
    q_schema_row_listREPL_TABLE: TStringField;
    q_schema_row_listREPL_MODE: TIntegerField;
    q_schema_row_listSORTBY: TFloatField;
    q_schema_row_listIS_ACTIVE: TIntegerField;
    q_schema_row_listTABLE_DEST_RN: TFloatField;
    q_schema_row_listNOTE: TStringField;
    acReplInitRefreshStatus: TAction;
    q_status: TOracleDataSet;
    ds_status: TDataSource;
    q_statusRN: TFloatField;
    q_statusREPL_RN: TFloatField;
    q_statusSTATUS: TIntegerField;
    q_events_list: TOracleDataSet;
    ds_events_list: TDataSource;
    q_events_listRN: TFloatField;
    q_events_listNAME: TStringField;
    q_statusEVENT_NAME: TStringField;
    tbStatusRefresh: TTBItem;
    q_statusSITE_SOURCE_RN: TFloatField;
    q_statusSITE_DEST_RN: TFloatField;
    q_statusSCHEMA_RN: TFloatField;
    q_statusSCHEMAROW_RN: TFloatField;
    q_CallOut: TOracleDataSet;
    ds_CallOut: TDataSource;
    pFilter: TPanel;
    l_SiteSource: TLabel;
    l_SiteDest: TLabel;
    l_Schema: TLabel;
    l_Table: TLabel;
    cb_SiteSource: TRxDBLookupCombo;
    cb_Schema: TRxDBLookupCombo;
    cb_Table: TRxDBLookupCombo;
    cb_SiteDest: TRxDBLookupCombo;
    acReplInitRefreshCallOut: TAction;
    acReplInitRefreshCall: TAction;
    acReplInitRefreshAnsw: TAction;
    TBItem21: TTBItem;
    TBItem23: TTBItem;
    TBItem24: TTBItem;
    q_CallOutRN: TFloatField;
    q_CallOutUPDATE_RN: TFloatField;
    q_CallOutSITE_SOURCE_RN: TFloatField;
    q_CallOutSITE_DEST_RN: TFloatField;
    q_CallOutSCHEMA_RN: TFloatField;
    q_CallOutSCHEMAROW_RN: TFloatField;
    q_CallOutTABLERN: TFloatField;
    q_CallOutREPL_RN: TFloatField;
    q_CallOutOPERATION: TStringField;
    q_CallOutMODIFDATE: TDateTimeField;
    q_CallOutCOUNTER: TIntegerField;
    q_CallOutSTATUS: TIntegerField;
    q_CallOutSENDDATE: TDateTimeField;
    q_CallOutFILENAME: TStringField;
    q_CallOutSCHEMA_NAME: TStringField;
    q_CallOutTABLE_NAME: TStringField;
    q_CallOutSQL_TEXT: TStringField;
    q_statusSCHEMA_NAME: TStringField;
    q_statusTABLE_NAME: TStringField;
    q_Call: TOracleDataSet;
    q_CallRN: TFloatField;
    q_CallUPDATE_RN: TFloatField;
    q_CallSITE_SOURCE_RN: TFloatField;
    q_CallSITE_DEST_RN: TFloatField;
    q_CallSCHEMA_RN: TFloatField;
    q_CallSCHEMAROW_RN: TFloatField;
    q_CallTABLERN: TFloatField;
    q_CallREPL_RN: TFloatField;
    q_CallOPERATION: TStringField;
    q_CallMODIFDATE: TDateTimeField;
    q_CallCOUNTER: TIntegerField;
    q_CallSTATUS: TIntegerField;
    q_CallSENDDATE: TDateTimeField;
    q_CallFILENAME: TStringField;
    q_CallSCHEMA_NAME: TStringField;
    q_CallTABLE_NAME: TStringField;
    q_CallSQL_TEXT: TStringField;
    ds_Call: TDataSource;
    ds_Answ: TDataSource;
    q_Answ: TOracleDataSet;
    q_AnswRN: TFloatField;
    q_AnswSITE_SOURCE_RN: TFloatField;
    q_AnswSITE_DEST_RN: TFloatField;
    q_AnswCALL_OUT_RN: TFloatField;
    q_AnswSENDDATE: TDateTimeField;
    q_AnswFILENAME: TStringField;
    q_AnswSTATUS: TIntegerField;
    q_AnswNOTE: TStringField;
    q_AnswDATE_LOG: TDateTimeField;
    q_AnswSCHEMA_NAME: TStringField;
    q_AnswTABLE_NAME: TStringField;
    q_AnswSQL_TEXT: TStringField;
    q_AnswSTATUS_NAME: TStringField;
    gridCallOut: TDBGridEh;
    q_CallOutSTATUS_NAME: TStringField;
    acReplInitPostCallOut: TAction;
    TBItem25: TTBItem;
    gridCall: TDBGridEh;
    q_CallSTATUS_NAME: TStringField;
    gridAnsw: TDBGridEh;
    q_AnswOPERATION: TStringField;
    q_status_list: TOracleDataSet;
    ds_status_list: TDataSource;
    q_status_listRN: TFloatField;
    q_status_listNAME: TStringField;
    acReplInitExecCallOut: TAction;
    oraPackage: TOraclePackage;
    q_AnswTABLERN: TFloatField;
    q_AnswREPL_RN: TFloatField;
    q_cmn: TOracleQuery;
    acReplInitExportREPL: TAction;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label11: TLabel;
    DBEdit7: TDBEdit;
    q_initEXP_PATH: TStringField;
    q_initIMP_PATH: TStringField;
    Label13: TLabel;
    DBEdit9: TDBEdit;
    q_initREPL_PASSWORD: TStringField;
    ReplLogon: TOracleLogon;
    acReplInitExportMETA: TAction;
    q_initTMP_PATH: TStringField;
    Label14: TLabel;
    DBEdit10: TDBEdit;
    q_initZIP_CMD: TStringField;
    acReplInitImportMETA: TAction;
    OpenDialog1: TOpenDialog;
    Label3: TLabel;
    DBEdit8: TDBEdit;
    q_site_cur: TOracleDataSet;
    q_site_listRN: TFloatField;
    q_site_listNAME: TStringField;
    q_site_listSORTBY: TFloatField;
    q_site_listIS_ACTIVE: TIntegerField;
    q_site_listRN_1: TFloatField;
    q_site_listSITE_RN: TFloatField;
    q_site_listIS_CURRENT: TIntegerField;
    q_site_listBOX_IN: TStringField;
    q_site_listBOX_OUT: TStringField;
    q_site_listEMAIL_ADMIN: TStringField;
    q_site_listREPL_SCHEMANAME: TStringField;
    q_site_listUSE_DBLINK: TIntegerField;
    q_site_listDBLINK: TStringField;
    q_site_listEXP_PATH: TStringField;
    q_site_listIMP_PATH: TStringField;
    q_site_listREPL_PASSWORD: TStringField;
    q_site_listTMP_PATH: TStringField;
    q_site_listZIP_CMD: TStringField;
    q_site_curNAME: TStringField;
    q_site_curSORTBY: TFloatField;
    q_site_curIS_ACTIVE: TIntegerField;
    q_site_curSITE_RN: TFloatField;
    q_site_curIS_CURRENT: TIntegerField;
    q_site_curBOX_IN: TStringField;
    q_site_curBOX_OUT: TStringField;
    q_site_curEMAIL_ADMIN: TStringField;
    q_site_curREPL_SCHEMANAME: TStringField;
    q_site_curUSE_DBLINK: TIntegerField;
    q_site_curDBLINK: TStringField;
    q_site_curEXP_PATH: TStringField;
    q_site_curIMP_PATH: TStringField;
    q_site_curREPL_PASSWORD: TStringField;
    q_site_curTMP_PATH: TStringField;
    q_site_curZIP_CMD: TStringField;
    TBDock10: TTBDock;
    TBToolbar10: TTBToolbar;
    TBItem30: TTBItem;
    TBItem31: TTBItem;
    TBSeparatorItem11: TTBSeparatorItem;
    TBItem36: TTBItem;
    Panel3: TPanel;
    gridLog: TDBGridEh;
    DBMemo1: TDBMemo;
    acReplInitPostSite: TAction;
    acReplInitPostSchema: TAction;
    acReplInitPostStatus: TAction;
    acReplInitCancelSchema: TAction;
    acReplInitCancelSite: TAction;
    acReplInitCancelStatus: TAction;
    acReplInitCancelTable: TAction;
    acReplInitCancelCallOut: TAction;
    acReplInitPostTable: TAction;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem10: TTBItem;
    TBItem32: TTBItem;
    TBItem33: TTBItem;
    TBItem34: TTBItem;
    TBItem35: TTBItem;
    TBItem37: TTBItem;
    TBItem38: TTBItem;
    q_statusREPL_TABLE: TStringField;
    Panel11: TPanel;
    lbLogin: TLabel;
    q_logCALL_RN: TFloatField;
    q_statusTABLERN: TFloatField;
    TabRepl: TTabSheet;
    TBDock11: TTBDock;
    TBToolbar11: TTBToolbar;
    TBItem39: TTBItem;
    TBItem40: TTBItem;
    TBItem41: TTBItem;
    TBItem42: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;
    tbReplRefresh: TTBItem;
    acReplInitAddRepl: TAction;
    acReplInitDelRepl: TAction;
    acReplInitRefreshRepl: TAction;
    acReplInitPostRepl: TAction;
    acReplInitCancelRepl: TAction;
    q_Repl: TOracleDataSet;
    ds_Repl: TDataSource;
    q_statusTIME_ADD: TDateTimeField;
    edTimeFrom: TDateTimePicker;
    edDateFrom: TDateTimePicker;
    Label10: TLabel;
    edTimeTo: TDateTimePicker;
    edDateTo: TDateTimePicker;
    cbPeriod: TCheckBox;
    q_schema_row_listREPL_USERNAME: TStringField;
    q_schema_row_listREPL_TABLENAME: TStringField;
    q_ReplREPL_RN: TFloatField;
    q_ReplREPL_USERNAME: TStringField;
    q_ReplREPL_TABLENAME: TStringField;
    q_ReplREPL_TABLERN: TFloatField;
    q_ReplREPL_MODIFDATE: TDateTimeField;
    q_ReplREPL_OPERATION: TStringField;
    q_ReplREPL_AUTHID: TStringField;
    gridStatus: TDBGridEh;
    gridRepl: TDBGridEh;
    pmLog: TTBPopupMenu;
    tbLogShowCallOut: TTBItem;
    pmCallOut: TTBPopupMenu;
    tbCallOutWinEdit: TTBItem;
    tbCallOutShowRepl: TTBItem;
    tbCallOutShowStatus: TTBItem;
    TBSeparatorItem10: TTBSeparatorItem;
    q_CallOutREPL_USERNAME: TStringField;
    q_CallOutREPL_TABLENAME: TStringField;
    q_CallOutREPL_TABLE: TStringField;
    q_logSITE_RN: TFloatField;
    q_inout_sites: TOracleDataSet;
    q_site_listARH_IN: TStringField;
    q_initARH_IN: TStringField;
    Label9: TLabel;
    DBEdit11: TDBEdit;
    q_site_curARH_IN: TStringField;
    q_site_curARH_OUT: TStringField;
    q_initARH_OUT: TStringField;
    q_site_listARH_OUT: TStringField;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    q_inout_sitesSORTBY: TFloatField;
    q_inout_sitesNAME: TStringField;
    q_inout_sitesSITE_RN: TFloatField;
    q_inout_sitesBOX_IN: TStringField;
    q_inout_sitesEMAIL_ADMIN: TStringField;
    q_inout_sitesIMP_PATH: TStringField;
    q_inout_sitesTMP_PATH: TStringField;
    q_inout_sitesZIP_CMD: TStringField;
    q_inout_sitesARH_IN: TStringField;
    q_inout_sitesDBLINK: TStringField;
    q_inout_sitesBOX_OUT: TStringField;
    q_inout_sitesARH_OUT: TStringField;
    q_inout_sitesUSE_DBLINK: TIntegerField;
    tbLogFilter: TTBEditItem;
    TBSeparatorItem12: TTBSeparatorItem;
    tbLogFilterClear: TTBItem;
    tbLogFilterCur: TTBItem;
    TBItem20: TTBItem;
    pmRepl: TTBPopupMenu;
    TBItem43: TTBItem;
    TBEditItem1: TTBEditItem;
    TBItem44: TTBItem;
    TBItem45: TTBItem;
    TBSeparatorItem13: TTBSeparatorItem;
    TBItem46: TTBItem;
    GroupBox2: TGroupBox;
    TBDock12: TTBDock;
    TBToolbar12: TTBToolbar;
    gridCallOutHist: TDBGridEh;
    q_CallOutHist: TOracleDataSet;
    q_CallOutHistRN: TFloatField;
    q_CallOutHistUPDATE_RN: TFloatField;
    q_CallOutHistSITE_SOURCE_RN: TFloatField;
    q_CallOutHistSITE_DEST_RN: TFloatField;
    q_CallOutHistSCHEMA_RN: TFloatField;
    q_CallOutHistSCHEMAROW_RN: TFloatField;
    q_CallOutHistTABLERN: TFloatField;
    q_CallOutHistREPL_RN: TFloatField;
    q_CallOutHistOPERATION: TStringField;
    q_CallOutHistMODIFDATE: TDateTimeField;
    q_CallOutHistCOUNTER: TIntegerField;
    q_CallOutHistSTATUS: TIntegerField;
    q_CallOutHistSENDDATE: TDateTimeField;
    q_CallOutHistFILENAME: TStringField;
    q_CallOutHistSCHEMA_NAME: TStringField;
    q_CallOutHistTABLE_NAME: TStringField;
    q_CallOutHistSQL_TEXT: TStringField;
    q_CallOutHistSTATUS_NAME: TStringField;
    q_CallOutHistREPL_USERNAME: TStringField;
    q_CallOutHistREPL_TABLENAME: TStringField;
    q_CallOutHistREPL_TABLE: TStringField;
    ds_CallOutHist: TDataSource;
    TBItem47: TTBItem;
    q_CallOutHistDATE_EXEC: TDateTimeField;
    q_CallOutHistDATE_HIST: TDateTimeField;
    TBItem48: TTBItem;
    TBEditItem2: TTBEditItem;
    TBItem49: TTBItem;
    TBItem50: TTBItem;
    TBSeparatorItem14: TTBSeparatorItem;
    TBSeparatorItem15: TTBSeparatorItem;
    TBItem51: TTBItem;
    TBItem52: TTBItem;
    TBSeparatorItem16: TTBSeparatorItem;
    GroupBox4: TGroupBox;
    TBDock13: TTBDock;
    TBToolbar13: TTBToolbar;
    TBItem54: TTBItem;
    gridCallErr: TDBGridEh;
    q_CallErr: TOracleDataSet;
    q_CallErrRN: TFloatField;
    q_CallErrUPDATE_RN: TFloatField;
    q_CallErrSITE_SOURCE_RN: TFloatField;
    q_CallErrSITE_DEST_RN: TFloatField;
    q_CallErrSCHEMA_RN: TFloatField;
    q_CallErrSCHEMAROW_RN: TFloatField;
    q_CallErrTABLERN: TFloatField;
    q_CallErrREPL_RN: TFloatField;
    q_CallErrOPERATION: TStringField;
    q_CallErrMODIFDATE: TDateTimeField;
    q_CallErrCOUNTER: TIntegerField;
    q_CallErrSTATUS: TIntegerField;
    q_CallErrSENDDATE: TDateTimeField;
    q_CallErrFILENAME: TStringField;
    q_CallErrSCHEMA_NAME: TStringField;
    q_CallErrTABLE_NAME: TStringField;
    q_CallErrSQL_TEXT: TStringField;
    q_CallErrSTATUS_NAME: TStringField;
    ds_CallErr: TDataSource;
    q_CallErrDATE_EXEC: TDateTimeField;
    q_CallErrDATE_HIST: TDateTimeField;
    TBItem53: TTBItem;
    Panel2: TPanel;
    Label15: TLabel;
    TBItem55: TTBItem;
    TBItem56: TTBItem;
    TBItem57: TTBItem;
    TBItem58: TTBItem;
    TBItem59: TTBItem;
    acReplInitRestCallOut: TAction;
    acReplInitRestCall: TAction;
    TBItem60: TTBItem;
    TBSeparatorItem17: TTBSeparatorItem;
    TBItem61: TTBItem;
    TBSeparatorItem18: TTBSeparatorItem;
    q_ReplREPL_TABLE: TStringField;
    TBItem62: TTBItem;
    TBItem63: TTBItem;
    TBItem64: TTBItem;
    q_statusREPL_USERNAME: TStringField;
    q_statusREPL_TABLENAME: TStringField;
    TBItem65: TTBItem;
    TBItem66: TTBItem;
    TBItem67: TTBItem;
    TBItem68: TTBItem;
    TBItem69: TTBItem;
    pmStatus: TTBPopupMenu;
    TBItem70: TTBItem;
    TBEditItem3: TTBEditItem;
    TBItem71: TTBItem;
    TBItem72: TTBItem;
    TBSeparatorItem19: TTBSeparatorItem;
    TBItem73: TTBItem;
    TBSeparatorItem20: TTBSeparatorItem;
    TBItem77: TTBItem;
    TBItem78: TTBItem;
    TBItem81: TTBItem;
    TBItem82: TTBItem;
    TBItem74: TTBItem;
    TBItem75: TTBItem;
    pmCallOutHist: TTBPopupMenu;
    TBItem76: TTBItem;
    TBEditItem4: TTBEditItem;
    TBItem79: TTBItem;
    TBItem80: TTBItem;
    TBSeparatorItem21: TTBSeparatorItem;
    TBItem83: TTBItem;
    TBSeparatorItem22: TTBSeparatorItem;
    TBItem84: TTBItem;
    TBItem85: TTBItem;
    TBItem86: TTBItem;
    TBItem87: TTBItem;
    TBItem88: TTBItem;
    TBItem89: TTBItem;
    TBItem90: TTBItem;
    TBItem91: TTBItem;
    TBItem92: TTBItem;
    pmCall: TTBPopupMenu;
    TBItem93: TTBItem;
    TBEditItem5: TTBEditItem;
    TBItem94: TTBItem;
    TBItem95: TTBItem;
    TBSeparatorItem23: TTBSeparatorItem;
    TBItem96: TTBItem;
    TBSeparatorItem24: TTBSeparatorItem;
    TBItem97: TTBItem;
    TBItem98: TTBItem;
    TBItem99: TTBItem;
    TBItem100: TTBItem;
    TBItem101: TTBItem;
    TBItem102: TTBItem;
    TBItem103: TTBItem;
    TBItem105: TTBItem;
    TBItem104: TTBItem;
    TBItem106: TTBItem;
    TBItem107: TTBItem;
    TBItem108: TTBItem;
    TBItem109: TTBItem;
    TBItem110: TTBItem;
    TBItem111: TTBItem;
    TBItem112: TTBItem;
    TBItem113: TTBItem;
    TBItem114: TTBItem;
    pmCallErr: TTBPopupMenu;
    TBItem115: TTBItem;
    TBEditItem6: TTBEditItem;
    TBItem116: TTBItem;
    TBItem117: TTBItem;
    TBSeparatorItem25: TTBSeparatorItem;
    TBItem118: TTBItem;
    TBSeparatorItem26: TTBSeparatorItem;
    TBItem119: TTBItem;
    TBItem120: TTBItem;
    TBItem121: TTBItem;
    TBItem122: TTBItem;
    TBItem123: TTBItem;
    TBItem124: TTBItem;
    TBItem125: TTBItem;
    TBItem126: TTBItem;
    TBItem127: TTBItem;
    TBItem128: TTBItem;
    TBItem129: TTBItem;
    TBItem130: TTBItem;
    pmAnsw: TTBPopupMenu;
    TBItem131: TTBItem;
    TBEditItem7: TTBEditItem;
    TBItem132: TTBItem;
    TBItem133: TTBItem;
    TBSeparatorItem27: TTBSeparatorItem;
    TBItem134: TTBItem;
    TBSeparatorItem28: TTBSeparatorItem;
    TBItem135: TTBItem;
    TBItem140: TTBItem;
    TBItem143: TTBItem;
    q_CallErrREPL_USERNAME: TStringField;
    q_CallErrREPL_TABLENAME: TStringField;
    q_CallErrREPL_TABLE: TStringField;
    q_CallREPL_USERNAME: TStringField;
    q_CallREPL_TABLENAME: TStringField;
    q_CallREPL_TABLE: TStringField;
    q_CallOutREPL_CALL_OUT_RN: TFloatField;
    q_statusREPL_STATUS_RN: TFloatField;
    q_CallREPL_CALL_RN: TFloatField;
    q_CallErrREPL_CALL_ERR_RN: TFloatField;
    q_AnswREPL_ANSW_RN: TFloatField;
    q_CallOutHistHISTORY_RN: TFloatField;
    acReplInitImportREPL: TAction;
    DBCheckBox3: TDBCheckBox;
    q_initDBLINK_ERR_EXP: TIntegerField;
    q_site_curDBLINK_ERR_EXP: TIntegerField;
    q_inout_sitesDBLINK_ERR_EXP: TIntegerField;
    acReplInitExecAnswIn: TAction;
    acReplInitExecCallIn: TAction;
    acReplInitExecFULL: TAction;
    TBDock4: TTBDock;
    pkg_init: TOraclePackage;
    TBToolbar4: TTBToolbar;
    TBItem138: TTBItem;
    TBItem137: TTBItem;
    TBItem136: TTBItem;
    TBItem26: TTBItem;
    TBItem27: TTBItem;
    TBItem139: TTBItem;
    TBDock14: TTBDock;
    TBToolbar14: TTBToolbar;
    TBItem148: TTBItem;
    TBItem149: TTBItem;
    acReplInitExecReSendCallOut: TAction;
    TBItem28: TTBItem;
    TBSeparatorItem29: TTBSeparatorItem;
    TBItem29: TTBItem;
    acReplInitExecReFormBad: TAction;
    q_schema_rowREPL_USER: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure q_sitesAfterScroll(DataSet: TDataSet);
    procedure q_sitesBeforeDelete(DataSet: TDataSet);
    procedure acReplInitAddSiteExecute(Sender: TObject);
    procedure acReplInitDelSiteExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gridSitesExit(Sender: TObject);
    procedure Panel16Exit(Sender: TObject);
    procedure GroupBox1Exit(Sender: TObject);
    procedure GroupBox3Exit(Sender: TObject);
    procedure gridSitesGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure q_initAfterPost(DataSet: TDataSet);
    procedure acReplInitRefreshSiteExecute(Sender: TObject);
    procedure q_schemaBeforeOpen(DataSet: TDataSet);
    procedure acReplInitRefreshSchemaExecute(Sender: TObject);
    procedure acReplInitRefreshSchemaRowExecute(Sender: TObject);
    procedure acReplInitAddSchemaExecute(Sender: TObject);
    procedure acReplInitDelSchemaExecute(Sender: TObject);
    procedure acReplInitAddSchemaRowExecute(Sender: TObject);
    procedure acReplInitDelSchemaRowExecute(Sender: TObject);
    procedure gridSchemaExit(Sender: TObject);
    procedure gridSchemaRowExit(Sender: TObject);
    procedure acReplInitPostSchemaRowExecute(Sender: TObject);
    procedure acReplInitCancelSchemaRowExecute(Sender: TObject);
    procedure acReplInitAddTableExecute(Sender: TObject);
    procedure acReplInitDelTableExecute(Sender: TObject);
    procedure acReplInitRefreshTableExecute(Sender: TObject);
    procedure gridTablesExit(Sender: TObject);
    procedure q_tableBeforeDelete(DataSet: TDataSet);
    procedure q_schema_rowAfterInsert(DataSet: TDataSet);
    procedure q_schemaAfterInsert(DataSet: TDataSet);
    procedure q_sitesAfterInsert(DataSet: TDataSet);
    procedure q_logBeforeOpen(DataSet: TDataSet);
    procedure acReplInitRefreshLogExecute(Sender: TObject);
    procedure cb_SiteSourceChange(Sender: TObject);
    procedure cb_SiteDestChange(Sender: TObject);
    procedure cb_SchemaChange(Sender: TObject);
    procedure acReplInitRefreshStatusExecute(Sender: TObject);
    procedure q_statusBeforeOpen(DataSet: TDataSet);
    procedure acReplInitAddStatusExecute(Sender: TObject);
    procedure q_statusAfterInsert(DataSet: TDataSet);
    procedure acReplInitDelStatusExecute(Sender: TObject);
    procedure q_CallOutBeforeOpen(DataSet: TDataSet);
    procedure q_CallBeforeOpen(DataSet: TDataSet);
    procedure q_AnswBeforeOpen(DataSet: TDataSet);
    procedure acReplInitRefreshCallOutExecute(Sender: TObject);
    procedure acReplInitRefreshCallExecute(Sender: TObject);
    procedure acReplInitRefreshAnswExecute(Sender: TObject);
    procedure tabAnswShow(Sender: TObject);
    procedure tabCallShow(Sender: TObject);
    procedure tabCallOutShow(Sender: TObject);
    procedure tabLogShow(Sender: TObject);
    procedure tabSchemaShow(Sender: TObject);
    procedure tabSiteShow(Sender: TObject);
    procedure tabStatusShow(Sender: TObject);
    procedure tabTableShow(Sender: TObject);
    procedure acReplInitPostCallOutExecute(Sender: TObject);
    procedure acReplInitExecCallOutExecute(Sender: TObject);
    procedure q_CallOutBeforePost(DataSet: TDataSet);
    procedure q_CallOutAfterPost(DataSet: TDataSet);
    procedure acReplInitExportREPLExecute(Sender: TObject);
    procedure acReplInitExportMETAExecute(Sender: TObject);
    procedure acReplInitImportMETAExecute(Sender: TObject);
    procedure acReplInitPostSiteExecute(Sender: TObject);
    procedure acReplInitPostSchemaExecute(Sender: TObject);
    procedure acReplInitPostStatusExecute(Sender: TObject);
    procedure acReplInitCancelSchemaExecute(Sender: TObject);
    procedure acReplInitCancelSiteExecute(Sender: TObject);
    procedure acReplInitCancelStatusExecute(Sender: TObject);
    procedure acReplInitCancelTableExecute(Sender: TObject);
    procedure acReplInitCancelCallOutExecute(Sender: TObject);
    procedure acReplInitPostTableExecute(Sender: TObject);
    procedure q_statusBeforeDelete(DataSet: TDataSet);
    procedure q_AnswBeforeDelete(DataSet: TDataSet);
    procedure acReplInitDelCallOutExecute(Sender: TObject);
    procedure acReplInitDelCallExecute(Sender: TObject);
    procedure acReplInitDelAnswExecute(Sender: TObject);
    procedure acReplInitAddReplExecute(Sender: TObject);
    procedure acReplInitDelReplExecute(Sender: TObject);
    procedure acReplInitRefreshReplExecute(Sender: TObject);
    procedure acReplInitPostReplExecute(Sender: TObject);
    procedure acReplInitCancelReplExecute(Sender: TObject);
    procedure q_ReplBeforeOpen(DataSet: TDataSet);
    procedure q_ReplAfterInsert(DataSet: TDataSet);
    procedure TabReplShow(Sender: TObject);
    procedure q_ReplBeforeDelete(DataSet: TDataSet);
    procedure tbLogShowCallOutClick(Sender: TObject);
    procedure tbCallOutWinEditClick(Sender: TObject);
    procedure tbCallOutShowStatusClick(Sender: TObject);
    procedure tbCallOutShowReplClick(Sender: TObject);
    procedure tbReplRefreshClick(Sender: TObject);
    procedure tbStatusRefreshClick(Sender: TObject);
    procedure tbLogFilterAcceptText(Sender: TObject; var NewText: String;
      var Accept: Boolean);
    procedure q_logFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure tbLogFilterCurClick(Sender: TObject);
    procedure tbLogFilterClearClick(Sender: TObject);
    procedure TBEditItem1AcceptText(Sender: TObject; var NewText: String;
      var Accept: Boolean);
    procedure TBItem44Click(Sender: TObject);
    procedure TBItem45Click(Sender: TObject);
    procedure q_CallOutHistBeforeOpen(DataSet: TDataSet);
    procedure gridCallOutSortMarkingChanged(Sender: TObject);
    procedure gridCallOutHistSortMarkingChanged(Sender: TObject);
    procedure q_ReplFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure TBItem49Click(Sender: TObject);
    procedure TBEditItem2AcceptText(Sender: TObject; var NewText: String;
      var Accept: Boolean);
    procedure TBItem50Click(Sender: TObject);
    procedure TBItem51Click(Sender: TObject);
    procedure TBItem52Click(Sender: TObject);
    procedure q_CallErrBeforeOpen(DataSet: TDataSet);
    procedure gridCallSortMarkingChanged(Sender: TObject);
    procedure gridCallErrSortMarkingChanged(Sender: TObject);
    procedure TBItem53Click(Sender: TObject);
    procedure TBItem55Click(Sender: TObject);
    procedure TBItem22Click(Sender: TObject);
    procedure TBItem56Click(Sender: TObject);
    procedure TBItem59Click(Sender: TObject);
    procedure TBItem58Click(Sender: TObject);
    procedure TBItem57Click(Sender: TObject);
    procedure q_statusFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure q_CallOutFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure q_CallFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure q_AnswFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure q_CallOutHistFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure q_CallErrFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure acReplInitRestCallOutExecute(Sender: TObject);
    procedure acReplInitRestCallExecute(Sender: TObject);
    procedure TBItem46Click(Sender: TObject);
    procedure TBItem62Click(Sender: TObject);
    procedure TBItem63Click(Sender: TObject);
    procedure TBItem64Click(Sender: TObject);
    procedure TBItem66Click(Sender: TObject);
    procedure TBItem65Click(Sender: TObject);
    procedure TBItem24Click(Sender: TObject);
    procedure TBItem21Click(Sender: TObject);
    procedure TBItem47Click(Sender: TObject);
    procedure TBItem23Click(Sender: TObject);
    procedure TBItem54Click(Sender: TObject);
    procedure TBItem67Click(Sender: TObject);
    procedure TBItem68Click(Sender: TObject);
    procedure TBItem69Click(Sender: TObject);
    procedure TBEditItem3AcceptText(Sender: TObject; var NewText: String;
      var Accept: Boolean);
    procedure TBItem71Click(Sender: TObject);
    procedure TBItem72Click(Sender: TObject);
    procedure TBItem73Click(Sender: TObject);
    procedure TBItem77Click(Sender: TObject);
    procedure TBItem78Click(Sender: TObject);
    procedure TBItem75Click(Sender: TObject);
    procedure TBItem74Click(Sender: TObject);
    procedure TBItem81Click(Sender: TObject);
    procedure TBItem82Click(Sender: TObject);
    procedure gridLogSortMarkingChanged(Sender: TObject);
    procedure gridReplSortMarkingChanged(Sender: TObject);
    procedure gridStatusSortMarkingChanged(Sender: TObject);
    procedure gridAnswSortMarkingChanged(Sender: TObject);
    procedure TBEditItem4AcceptText(Sender: TObject; var NewText: String;
      var Accept: Boolean);
    procedure TBItem79Click(Sender: TObject);
    procedure TBItem80Click(Sender: TObject);
    procedure TBItem83Click(Sender: TObject);
    procedure TBItem84Click(Sender: TObject);
    procedure TBItem85Click(Sender: TObject);
    procedure TBItem86Click(Sender: TObject);
    procedure TBItem87Click(Sender: TObject);
    procedure TBItem88Click(Sender: TObject);
    procedure TBItem89Click(Sender: TObject);
    procedure TBItem90Click(Sender: TObject);
    procedure TBItem91Click(Sender: TObject);
    procedure TBItem92Click(Sender: TObject);
    procedure TBEditItem5AcceptText(Sender: TObject; var NewText: String;
      var Accept: Boolean);
    procedure TBItem94Click(Sender: TObject);
    procedure TBItem95Click(Sender: TObject);
    procedure TBItem96Click(Sender: TObject);
    procedure TBItem97Click(Sender: TObject);
    procedure TBItem98Click(Sender: TObject);
    procedure TBItem99Click(Sender: TObject);
    procedure TBItem100Click(Sender: TObject);
    procedure TBItem101Click(Sender: TObject);
    procedure TBItem102Click(Sender: TObject);
    procedure TBItem103Click(Sender: TObject);
    procedure TBItem109Click(Sender: TObject);
    procedure TBItem111Click(Sender: TObject);
    procedure TBItem110Click(Sender: TObject);
    procedure TBItem112Click(Sender: TObject);
    procedure TBItem114Click(Sender: TObject);
    procedure TBItem113Click(Sender: TObject);
    procedure TBItem105Click(Sender: TObject);
    procedure TBItem107Click(Sender: TObject);
    procedure TBItem106Click(Sender: TObject);
    procedure TBItem108Click(Sender: TObject);
    procedure TBItem104Click(Sender: TObject);
    procedure TBEditItem6AcceptText(Sender: TObject; var NewText: String;
      var Accept: Boolean);
    procedure TBItem116Click(Sender: TObject);
    procedure TBItem117Click(Sender: TObject);
    procedure TBItem118Click(Sender: TObject);
    procedure TBItem119Click(Sender: TObject);
    procedure TBItem120Click(Sender: TObject);
    procedure TBItem121Click(Sender: TObject);
    procedure TBItem122Click(Sender: TObject);
    procedure TBItem123Click(Sender: TObject);
    procedure TBItem124Click(Sender: TObject);
    procedure TBItem125Click(Sender: TObject);
    procedure TBItem126Click(Sender: TObject);
    procedure TBItem127Click(Sender: TObject);
    procedure TBItem128Click(Sender: TObject);
    procedure TBItem129Click(Sender: TObject);
    procedure TBItem130Click(Sender: TObject);
    procedure TBEditItem7AcceptText(Sender: TObject; var NewText: String;
      var Accept: Boolean);
    procedure TBItem132Click(Sender: TObject);
    procedure TBItem133Click(Sender: TObject);
    procedure TBItem134Click(Sender: TObject);
    procedure TBItem135Click(Sender: TObject);
    procedure TBItem140Click(Sender: TObject);
    procedure TBItem143Click(Sender: TObject);
    procedure acReplInitImportREPLExecute(Sender: TObject);
    procedure acReplInitExecAnswInExecute(Sender: TObject);
    procedure acReplInitExecCallInExecute(Sender: TObject);
    procedure acReplInitExecFULLExecute(Sender: TObject);
    procedure oraSessAfterLogOn(Sender: TOracleSession);
    procedure acReplInitExecReSendCallOutExecute(Sender: TObject);
    procedure acReplInitExecReFormBadExecute(Sender: TObject);
    procedure q_logAfterOpen(DataSet: TDataSet);
    procedure q_statusAfterOpen(DataSet: TDataSet);
    procedure q_CallOutAfterOpen(DataSet: TDataSet);
    procedure q_CallOutHistAfterOpen(DataSet: TDataSet);
    procedure q_CallAfterOpen(DataSet: TDataSet);
    procedure q_CallErrAfterOpen(DataSet: TDataSet);
    procedure q_AnswAfterOpen(DataSet: TDataSet);
    procedure q_ReplAfterOpen(DataSet: TDataSet);
    procedure gridCallOutColumns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
  private
    { Private declarations }
    vIniFile:string; // INI-файл
    replFilter: boolean;
    ReplName:string; // схема репликации
    filterLog:TStringList;
    filterRepl:TStringList;
    filterCallOut:TStringList;
    filterCall:TStringList;
    filterCallOutHist:TStringList;
    filterCallErr:TStringList;
    filterAnsw:TStringList;
    filterStatus:TStringList;
    replView: boolean; // запуск в режиме просмотра
    replInit: boolean; // запуск для настройки
    replRepl: boolean; // запуск дополнительным пользователем
    function CheckLogin(pMode:integer;pPROC_NAME:string;NoLog:boolean): integer;
    function GetCurrent(pMode:integer): boolean;
    function ImportFile(pMode:integer;pType:string;FileSource:string;BoxIn:string;ArhIn:string): integer;
    function ExportFile(pMode:integer;pType:string;SiteDestRN:integer;SiteDestName:string;BoxOut:string;ArhOut:string;All:boolean=true): integer;
  public
    { Public declarations }
    ReplSession:TApplSession; // Журнал событий репликации
    replMain: boolean; // запуск основным пользователем
    vMODE:integer; // Режим запуска
    function ExecuteRepl(pMode:integer;pExecMode:string): integer;
  end;

var
  f_ReplInit: Tf_ReplInit;
  // Пользователь с метаданными по реликации
  gDATABASE:string;
  gUSERNAME:string;
  gPASSWORD:string;
  // Режим
  gMODE:integer;
  gIniFile:string;
  gSCHEMA_NAME:string;

implementation

uses ForDB, ForFiles, MemoEdit, main;

{$R *.dfm}


{ TODO :
//***********************************************************************
//                        Создание формы
//*********************************************************************** }
procedure Tf_ReplInit.FormCreate(Sender: TObject);
var i:integer;
begin
  FilterLog:=TStringList.Create;
  FilterLog.Clear;
  FilterRepl:=TStringList.Create;
  FilterRepl.Clear;
  FilterCallOut:=TStringList.Create;
  FilterCallOut.Clear;
  FilterCall:=TStringList.Create;
  FilterCall.Clear;
  FilterCallOutHist:=TStringList.Create;
  FilterCallOutHist.Clear;
  FilterCallErr:=TStringList.Create;
  FilterCallErr.Clear;
  FilterAnsw:=TStringList.Create;
  FilterAnsw.Clear;
  FilterStatus:=TStringList.Create;
  FilterStatus.Clear;

  // Создать сессию
  ReplSession:=TApplSession.Create(Self);

  oraSess.Logoff;
  oraSess.LogonDatabase:=gDATABASE;
  oraSess.LogonUSERNAME:=gUSERNAME;
  oraSess.LogonPASSWORD:=gPASSWORD;
  vMODE:=gMODE;
  vIniFile:=gIniFile;

  // Коннект
  IF vMODE<>amAuto THEN
  Begin
    // В режиме настройки
    if not ReplLogon.Execute then
    begin
      MessageDlg('Введите правильно имя пользователя и пароль!',mtError,[mbOk],0);
      exit;
    end
  End
  else
    // В режиме автоматического выполнения
    oraSess.LogOn;

  lbLogin.Caption:=oraSess.LogonUSERNAME+'@'+oraSess.LogonDatabase;

  // Открыть сессию
  if vMODE=amAuto then
    ReplSession.InitSession(vMODE,APPLICATION_NAME,gSCHEMA_NAME,MODULE_NAME,vIniFile,'Репликация',oraSess)
  else
    ReplSession.InitSession(vMODE,APPLICATION_NAME,gSCHEMA_NAME,MODULE_NAME,vIniFile,'Настройка репликации',oraSess);

  if vMODE<>amAuto then
  Begin
    edDateFrom.Date:=DateOf(Date);
    edDateTo.Date:=DateOf(Date+1);
    q_site_list.open;
    q_table_list.open;
    q_schema_list.open;
    q_schema_row_list.open;
    q_events_list.open;
    q_status_list.open;
    q_mode.open;
    q_table.open;
    q_sites.open;
    q_sites.Locate('IS_CURRENT',1,[]);
    if not q_sites.eof then
    Begin
      cb_SiteSource.KeyValue:=q_sites.FieldByName('RN').AsInteger;
      if q_sites.FieldByName('RN').AsInteger=1 then
        cb_SiteDest.KeyValue:=2
      else
        if q_sites.FieldByName('RN').AsInteger=2 then
          cb_SiteDest.KeyValue:=1
        else
          cb_SiteDest.KeyValue:=q_sites.FieldByName('RN').AsInteger;
      cb_Site.KeyValue:=q_sites.FieldByName('RN').AsInteger;
    end;
    q_schema.open;
    if not q_schema.eof then
    Begin
      cb_Schema.KeyValue:=q_schema.FieldByName('RN').AsInteger;
    End;
    q_schema_row.Open;
    if not q_schema_row.eof then
    Begin
      cb_Table.KeyValue:=q_schema_row.FieldByName('RN').AsInteger;
    End;
//    q_log.Open;
//    q_status.Open;
//    q_CallOut.Open;
//    q_CallOutHist.Open;
//    q_Call.Open;
//    q_CallErr.Open;
//    q_Answ.Open;
//    q_repl.Open;

    cb_Schema.KeyValue:=0;
    cb_table.KeyValue:=0;
    PageControl1.ActivePage:=tabCallOut;

  end;

end;


procedure Tf_ReplInit.oraSessAfterLogOn(Sender: TOracleSession);
var i:integer;
begin
  pkg_init.Session:=Sender;
  pkg_Init.CallProcedure('Init_MASTER',[]);

  replView:=true;
  // Репликация запускается в режиме просмотра
  for i:=1 to ActionManager1.ActionCount do
    if ActionManager1.Actions[i-1].Category='USER_VIEW' then
      TAction(ActionManager1.Actions[i-1]).Enabled:=true
    else
      TAction(ActionManager1.Actions[i-1]).Enabled:=false;
  q_sites.ReadOnly:=true;
  q_init.ReadOnly:=true;
  q_table.ReadOnly:=true;
  q_schema.ReadOnly:=true;
  q_schema_row.ReadOnly:=true;
  q_repl.ReadOnly:=true;
  q_status.ReadOnly:=true;
  q_callout.ReadOnly:=true;
  q_call.ReadOnly:=true;
  q_answ.ReadOnly:=true;
  q_callouthist.ReadOnly:=true;
  q_callerr.ReadOnly:=true;

  replInit:=(CheckLogin(amDefault,'CHECK_INIT',true)=sesOk);
  if replInit then
  Begin
    replView:=false;
    replMain:=false;
    replRepl:=false;
    // Репликация запускается в режиме настройки
    for i:=1 to ActionManager1.ActionCount do
      if ActionManager1.Actions[i-1].Category='USER_INIT' then
        TAction(ActionManager1.Actions[i-1]).Enabled:=true;
    q_sites.ReadOnly:=false;
    q_init.ReadOnly:=false;
    q_table.ReadOnly:=false;
    q_schema.ReadOnly:=false;
    q_schema_row.ReadOnly:=false;
  End
  Else
  Begin
    replMain:=(CheckLogin(amDefault,'CHECK_MAIN',true)=sesOk);
    if replMain then
    Begin
      replView:=false;
      replInit:=false;
      replRepl:=false;
      // Репликация запускается основным пользователем
      for i:=1 to ActionManager1.ActionCount do
        if (ActionManager1.Actions[i-1].Category='USER_MAIN') or
           (ActionManager1.Actions[i-1].Category='USER_REPL') then
          TAction(ActionManager1.Actions[i-1]).Enabled:=true;
      q_repl.ReadOnly:=false;
      q_status.ReadOnly:=false;
      q_callout.ReadOnly:=false;
      q_call.ReadOnly:=false;
      q_answ.ReadOnly:=false;
      q_callouthist.ReadOnly:=false;
      q_callerr.ReadOnly:=false;
    End
    Else
    Begin
      replRepl:=(CheckLogin(amDefault,'CHECK_REPL',true)=sesOk);
      if replRepl then
      Begin
        replView:=false;
        replInit:=false;
        replMain:=false;
        // Репликация запускается дополнительным пользователем
        for i:=1 to ActionManager1.ActionCount do
          if ActionManager1.Actions[i-1].Category='USER_REPL' then
            TAction(ActionManager1.Actions[i-1]).Enabled:=true;
        q_callout.ReadOnly:=false;
        q_callouthist.ReadOnly:=false;
      End;
    end;
  end;
  ReplName:=oraPackage.CallStringFunction('GetUserInit',[]);
end;


{ TODO :
//*******************************************************
//                   Закрытие формы
//******************************************************** }
procedure Tf_ReplInit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Завершить сессию
  ReplSession.DoneSession(MODULE_NAME);
  try
    filterLog.Clear;
    filterRepl.Clear;
    filterCallOut.Clear;
    filterCallOutHist.Clear;
    filterCall.Clear;
    filterCallErr.Clear;
    filterAnsw.Clear;
    filterStatus.Clear;
  except
  end;
  try
    oraSess.Commit;
    oraSess.LogOff;
  except
  end;
end;

{ TODO :
//***********************************************************************
//                   Обработчики событий DataSet'ов
//*********************************************************************** }
procedure Tf_ReplInit.q_sitesAfterScroll(DataSet: TDataSet);
begin
  if q_init.State=dsEdit then q_init.Post;
  q_init.Close;
  q_init.SQL[1]:='WHERE SITE_RN='+q_sites.FieldByName('RN').AsString;
  q_init.Open;
  if q_init.eof then
  with q_cmn do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE REPL_SITE SET NAME=NAME WHERE RN='+q_sites.FieldByName('RN').AsString);
    Execute;
    SQL.Clear;
    SQL.Add('COMMIT');
    Execute;
    q_init.Close;
    q_init.Open;
  end;
end;

procedure Tf_ReplInit.q_sitesBeforeDelete(DataSet: TDataSet);
begin
  if Application.MessageBox('Удалить запись?','Внимание!',MB_YESNO)<>IDYES then
  Begin
    Abort;
  End;
end;

procedure Tf_ReplInit.q_initAfterPost(DataSet: TDataSet);
begin
  f_db.ReQuery(q_sites,true);
end;

procedure Tf_ReplInit.q_schemaBeforeOpen(DataSet: TDataSet);
begin
  q_schema.SetVariable('SITE_SOURCE_RN',cb_SiteSource.KeyValue);
  q_schema.SetVariable('SITE_DEST_RN',cb_SiteDest.KeyValue);
end;

procedure Tf_ReplInit.q_tableBeforeDelete(DataSet: TDataSet);
begin
  if Application.MessageBox('Удалить запись?','Внимание!',MB_YESNO)<>IDYES then
  Begin
    Abort;
  End;
end;

procedure Tf_ReplInit.q_schema_rowAfterInsert(DataSet: TDataSet);
begin
  q_schema_row.FieldByName('IS_ACTIVE').AsInteger:=0;
  q_schema_row.FieldByName('SORTBY').AsInteger:=99;
end;

procedure Tf_ReplInit.q_schemaAfterInsert(DataSet: TDataSet);
begin
  q_schema.FieldByName('SITE_SOURCE_RN').AsInteger:=cb_SiteSource.KeyValue;
  q_schema.FieldByName('SITE_DEST_RN').AsInteger:=cb_SiteDest.KeyValue;
  q_schema.FieldByName('IS_ACTIVE').AsInteger:=0;
  q_schema.FieldByName('SORTBY').AsInteger:=99;
  q_schema.FieldByName('NAME').AsString:='Новая схема';
end;

procedure Tf_ReplInit.q_sitesAfterInsert(DataSet: TDataSet);
begin
  q_sites.FieldByName('IS_ACTIVE').AsInteger:=0;
  q_sites.FieldByName('SORTBY').AsInteger:=99;
  q_sites.FieldByName('NAME').AsString:='Новый узел';
end;

procedure Tf_ReplInit.q_logBeforeOpen(DataSet: TDataSet);
var FilterStr:string;
begin
  FilterStr:='';
  if NOT replFilter then
  Begin
    q_log.SQL[0]:='SELECT /*+ FIRST_ROWS */';
    if VarIsNull(cb_Site.KeyValue) then
      FilterStr:=FilterStr+' AND B.SITE_RN=0'
    else
      FilterStr:=FilterStr+' AND B.SITE_RN='+cb_Site.KeyValue;
    if cbPeriod.Checked then
    Begin
      FilterStr:=FilterStr+' AND B.LOG_TIME>=TO_DATE('''+FormatDateTime('dd.mm.yyyyy',DateOf(edDateFrom.Date)+TimeOf(edTimeFrom.Time))+''',''dd.mm.yyyy'')';
      FilterStr:=FilterStr+' AND B.LOG_TIME<=TO_DATE('''+FormatDateTime('dd.mm.yyyyy',DateOf(edDateTo.Date)+TimeOf(edTimeTo.Time))+''',''dd.mm.yyyy'')';
    End;
    if cb_Critical.Checked then
      FilterStr:=FilterStr+' AND B.STATUS<=-100';
  end
  else
  Begin
    // Фильтр должен быть уже установлен
    q_log.SQL[0]:='SELECT /*+ RULE */';
    FilterStr:=q_log.SQL[9];
  End;
  q_log.SQL[9]:=FilterStr;
end;

procedure Tf_ReplInit.q_statusBeforeOpen(DataSet: TDataSet);
var FilterStr:string;
begin
  FilterStr:='';
  if NOT replFilter then
  Begin
    q_status.SQL[0]:='SELECT /*+ ORDERED USE_NL(A,B,C,D) */';
    FilterStr:=FilterStr+' AND A.SITE_SOURCE_RN='+cb_SiteSource.KeyValue;
    FilterStr:=FilterStr+' AND A.SITE_DEST_RN='+cb_SiteDest.KeyValue;
    if not VarIsNull(cb_Schema.KeyValue) then
      FilterStr:=FilterStr+' AND A.SCHEMA_RN='+VarToStr(cb_Schema.KeyValue);
    if not VarIsNull(cb_Table.KeyValue) then
      FilterStr:=FilterStr+' AND A.SCHEMAROW_RN='+VarToStr(cb_Table.KeyValue);
    if cbPeriod.Checked then
    Begin
      FilterStr:=FilterStr+' AND A.TIME_ADD>=TO_DATE('''+FormatDateTime('dd.mm.yyyyy',DateOf(edDateFrom.Date)+TimeOf(edTimeFrom.Time))+''',''dd.mm.yyyy'')';
      FilterStr:=FilterStr+' AND A.TIME_ADD<=TO_DATE('''+FormatDateTime('dd.mm.yyyyy',DateOf(edDateTo.Date)+TimeOf(edTimeTo.Time))+''',''dd.mm.yyyy'')';
    End
    else
    Begin
      q_status.SQL[0]:='SELECT /*+ ORDERED INDEX(A REPL_STATUS_PK) USE_NL(A,B,C,D) */';
    End;
  end
  else
  Begin
    q_status.SQL[0]:='SELECT /*+ RULE */';
    // Фильтр должен быть уже установлен
    FilterStr:=q_status.SQL[7];
  End;
  q_status.SQL[7]:=FilterStr;
end;

procedure Tf_ReplInit.q_statusAfterInsert(DataSet: TDataSet);
begin
  inherited;
  q_status.FieldByName('SITE_SOURCE_RN').AsInteger:=cb_SiteSource.KeyValue;
  q_status.FieldByName('SITE_DEST_RN').AsInteger:=cb_SiteDest.KeyValue;
  q_status.FieldByName('SCHEMA_RN').AsInteger:=cb_Schema.KeyValue;
  q_status.FieldByName('SCHEMAROW_RN').AsInteger:=cb_Table.KeyValue;
  q_status.FieldByName('STATUS').AsInteger:=1;
end;

procedure Tf_ReplInit.q_CallOutBeforeOpen(DataSet: TDataSet);
var FilterStr:string;
begin
  FilterStr:='';
  if NOT replFilter then
  Begin
    q_CallOut.SQL[0]:='SELECT /*+ ORDERED USE_NL(A,B,C,D) */';
    FilterStr:=FilterStr+' AND A.SITE_SOURCE_RN='+cb_SiteSource.KeyValue;
    FilterStr:=FilterStr+' AND A.SITE_DEST_RN='+cb_SiteDest.KeyValue;
    if not VarIsNull(cb_Schema.KeyValue) then
      FilterStr:=FilterStr+' AND A.SCHEMA_RN='+VarToStr(cb_Schema.KeyValue);
    if not VarIsNull(cb_Table.KeyValue) then
      FilterStr:=FilterStr+' AND A.SCHEMAROW_RN='+VarToStr(cb_Table.KeyValue);
  end
  else
  Begin
    q_CallOut.SQL[0]:='SELECT /*+ RULE */';
    // Фильтр должен быть уже установлен
    FilterStr:=q_CallOut.SQL[9];
  End;
  q_CallOut.SQL[9]:=FilterStr;
end;

procedure Tf_ReplInit.q_CallBeforeOpen(DataSet: TDataSet);
var FilterStr:string;
begin
  FilterStr:='';
  if NOT replFilter then
  Begin
    q_Call.SQL[0]:='SELECT /*+ ORDERED USE_NL(A,B,C,D,E) */';
    FilterStr:=FilterStr+' AND A.SITE_SOURCE_RN='+cb_SiteSource.KeyValue;
    FilterStr:=FilterStr+' AND A.SITE_DEST_RN='+cb_SiteDest.KeyValue;
    if not VarIsNull(cb_Schema.KeyValue) then
      FilterStr:=FilterStr+' AND A.SCHEMA_RN='+VarToStr(cb_Schema.KeyValue);
    if not VarIsNull(cb_Table.KeyValue) then
      FilterStr:=FilterStr+' AND A.SCHEMAROW_RN='+VarToStr(cb_Table.KeyValue);
  end
  else
  Begin
    q_Call.SQL[0]:='SELECT /*+ RULE */';
    // Фильтр должен быть уже установлен
    FilterStr:=q_Call.SQL[9];
  End;
  q_Call.SQL[9]:=FilterStr;
end;

procedure Tf_ReplInit.q_AnswBeforeOpen(DataSet: TDataSet);
begin
  if GetCurrent(amDefault) then
  Begin
    if q_site_curSITE_RN.AsInteger=cb_SiteSource.KeyValue then
    Begin
      q_Answ.SQL[4]:='REPL_CALL_OUT AA'
    End
    Else
    Begin
      q_Answ.SQL[4]:='REPL_CALL_ERR AA'
    End;
  end;

  if NOT replFilter then
  Begin
    q_Answ.SQL[0]:='SELECT /*+ ORDERED USE_NL(A,B,C,D,E,AA) */';
    q_Answ.SQL[12]:=' AND A.SITE_SOURCE_RN='+cb_SiteSource.KeyValue+
                    ' AND A.SITE_DEST_RN='+cb_SiteDest.KeyValue;
  end
  else
  Begin
    q_Answ.SQL[0]:='SELECT /*+ ORDERED USE_NL(A,B,C,D,E,AA) */';
  End;
end;

procedure Tf_ReplInit.q_CallOutBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.FieldByName('OPERATION').AsString='I') or
     (DataSet.FieldByName('OPERATION').AsString='U') then
  Begin
    // Исправить счетчик у парного оператора
//    if DataSet.FieldByName('COUNTER').OldValue<>DataSet.FieldByName('COUNTER').Value then
    Begin
      with q_cmn do
      begin
        Close;
        SQL.Clear;
        if not VarIsNull(DataSet.FieldByName('UPDATE_RN').AsVariant) then
          SQL.Add('UPDATE REPL_CALL_OUT SET COUNTER='+DataSet.FieldByName('COUNTER').AsString+
                 ' WHERE SITE_SOURCE_RN='+DataSet.FieldByName('SITE_SOURCE_RN').AsString+
                 '   AND SITE_DEST_RN='+DataSet.FieldByName('SITE_DEST_RN').AsString+
                 '   AND RN='+DataSet.FieldByName('UPDATE_RN').AsString)
        else
          SQL.Add('UPDATE REPL_CALL_OUT SET COUNTER='+DataSet.FieldByName('COUNTER').AsString+
                 ' WHERE SITE_SOURCE_RN='+DataSet.FieldByName('SITE_SOURCE_RN').AsString+
                 '   AND SITE_DEST_RN='+DataSet.FieldByName('SITE_DEST_RN').AsString+
                 '   AND UPDATE_RN='+DataSet.FieldByName('RN').AsString);
        Execute;
      end;
    end;
    // Исправить статус у парного оператора
//    if DataSet.FieldByName('STATUS').OldValue<>DataSet.FieldByName('STATUS').Value then
    Begin
      with q_cmn do
      begin
        Close;
        SQL.Clear;
        if not VarIsNull(DataSet.FieldByName('UPDATE_RN').AsVariant) then
          SQL.Add('UPDATE /*+ RULE */ REPL_CALL_OUT SET STATUS='+DataSet.FieldByName('STATUS').AsString+
                 ' WHERE SITE_SOURCE_RN='+DataSet.FieldByName('SITE_SOURCE_RN').AsString+
                 '   AND SITE_DEST_RN='+DataSet.FieldByName('SITE_DEST_RN').AsString+
                 '   AND RN='+DataSet.FieldByName('UPDATE_RN').AsString)
        else
          SQL.Add('UPDATE /*+ RULE */ REPL_CALL_OUT SET STATUS='+DataSet.FieldByName('STATUS').AsString+
                 ' WHERE SITE_SOURCE_RN='+DataSet.FieldByName('SITE_SOURCE_RN').AsString+
                 '   AND SITE_DEST_RN='+DataSet.FieldByName('SITE_DEST_RN').AsString+
                 '   AND UPDATE_RN='+DataSet.FieldByName('RN').AsString);
        Execute;
      end;
    end;
  End;
end;

procedure Tf_ReplInit.q_CallOutAfterPost(DataSet: TDataSet);
begin
  inherited;
  f_db.ReQuery(q_CallOut,true);
end;

procedure Tf_ReplInit.q_statusBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if Application.MessageBox('Удалить запись?','Внимание!',MB_YESNO)<>IDYES then
  Begin
    Abort;
  End;
end;

procedure Tf_ReplInit.q_AnswBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if Application.MessageBox('Удалить запись?','Внимание!',MB_YESNO)<>IDYES then
  Begin
    Abort;
  End;
end;

procedure Tf_ReplInit.q_ReplBeforeOpen(DataSet: TDataSet);
var FilterStr:string;
begin
  FilterStr:='';
  if NOT replFilter then
  Begin
    q_repl.SQL[0]:='SELECT /*+ RULE */';
    if not VarIsNull(cb_Table.KeyValue) then
    Begin
      q_schema_row_list.locate('RN',cb_Table.KeyValue,[]);
      q_repl.SQL[8]:=''''+q_schema_row_listREPL_TABLE.AsString+''' AS REPL_TABLE';
      q_repl.SQL[9]:='FROM '+q_schema_row_listREPL_TABLE.AsString+' A ';
      FilterStr:=FilterStr+' WHERE A.REPL_USERNAME='''+q_schema_row_listREPL_USERNAME.AsString+'''';
      FilterStr:=FilterStr+' AND A.REPL_TABLENAME='''+q_schema_row_listREPL_TABLENAME.AsString+'''';
    end
    else
    begin
      q_repl.SQL[8]:=''''+ReplName+'.V_REPL'' AS REPL_TABLE';
      q_repl.SQL[9]:='FROM '+ReplName+'.V_REPL A ';
      FilterStr:=FilterStr+' WHERE 1=1 ';
    end;
    if cbPeriod.Checked then
    Begin
      FilterStr:=FilterStr+' AND A.REPL_MODIFDATE>=TO_DATE('''+FormatDateTime('dd.mm.yyyyy',DateOf(edDateFrom.Date)+TimeOf(edTimeFrom.Time))+''',''dd.mm.yyyy'')';
      FilterStr:=FilterStr+' AND A.REPL_MODIFDATE<=TO_DATE('''+FormatDateTime('dd.mm.yyyyy',DateOf(edDateTo.Date)+TimeOf(edTimeTo.Time))+''',''dd.mm.yyyy'')';
    End;
  end
  else
  Begin
    q_repl.SQL[0]:='SELECT /*+ RULE */';
    // Фильтр должен быть уже установлен
    FilterStr:=q_repl.SQL[10];
  End;
  q_repl.SQL[10]:=FilterStr;
  q_repl.sql.SaveToFile('c:\tmp\1.sql');
end;

procedure Tf_ReplInit.q_ReplAfterInsert(DataSet: TDataSet);
begin
  inherited;
  if not VarIsNull(cb_Table.KeyValue) then
  Begin
    q_schema_row_list.locate('RN',cb_Table.KeyValue,[]);
    if AnsiUpperCase(q_schema_row_listREPL_TABLE.AsString)<>oraSess.LogonUsername+'.V_REPL' then
    if AnsiUpperCase(q_schema_row_listREPL_TABLE.AsString)<>oraSess.LogonUsername+'.V_REPL_DOCLINKS' then
      q_repl.FieldByName('REPL_USERNAME').AsString:=q_schema_row_listREPL_USERNAME.AsString;
    q_repl.FieldByName('REPL_TABLENAME').AsString:=q_schema_row_listREPL_TABLENAME.AsString;
  end
  else
    q_repl.FieldByName('REPL_TABLENAME').AsString:='?';
  q_repl.FieldByName('REPL_MODIFDATE').AsDateTime:=Now;
  q_repl.FieldByName('REPL_OPERATION').AsString:='U';
  q_repl.FieldByName('REPL_AUTHID').AsString:=oraSess.LogonUsername+'_MANUAL';
end;

procedure Tf_ReplInit.q_ReplBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if Application.MessageBox('Удалить запись?','Внимание!',MB_YESNO)<>IDYES then
  Begin
    Abort;
  End;
end;

procedure Tf_ReplInit.q_logFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:=f_db.AcceptFilterRecord(gridLog,filterLog);
end;

procedure Tf_ReplInit.q_CallOutHistBeforeOpen(DataSet: TDataSet);
var FilterStr:string;
begin
  FilterStr:='';
  if NOT replFilter then
  Begin
    q_CallOutHist.SQL[0]:='SELECT /*+ ORDERED USE_NL(A,B,C,D) */';
    FilterStr:=FilterStr+' AND A.SITE_SOURCE_RN='+cb_SiteSource.KeyValue;
    FilterStr:=FilterStr+' AND A.SITE_DEST_RN='+cb_SiteDest.KeyValue;
    if not VarIsNull(cb_Schema.KeyValue) then
      FilterStr:=FilterStr+' AND A.SCHEMA_RN='+VarToStr(cb_Schema.KeyValue);
    if not VarIsNull(cb_Table.KeyValue) then
      FilterStr:=FilterStr+' AND A.SCHEMAROW_RN='+VarToStr(cb_Table.KeyValue);
    if cbPeriod.Checked then
    Begin
      FilterStr:=FilterStr+' AND A.DATE_HIST>=TO_DATE('''+FormatDateTime('dd.mm.yyyyy',DateOf(edDateFrom.Date)+TimeOf(edTimeFrom.Time))+''',''dd.mm.yyyy'')';
      FilterStr:=FilterStr+' AND A.DATE_HIST<=TO_DATE('''+FormatDateTime('dd.mm.yyyyy',DateOf(edDateTo.Date)+TimeOf(edTimeTo.Time))+''',''dd.mm.yyyy'')';
    End
  end
  else
  Begin
    q_CallOutHist.SQL[0]:='SELECT /*+ ORDERED USE_NL(A,B,C,D) */';
    // Фильтр должен быть уже установлен
    FilterStr:=q_CallOutHist.SQL[9];
  End;
  q_CallOutHist.SQL[9]:=FilterStr;
end;

procedure Tf_ReplInit.q_ReplFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:=f_db.AcceptFilterRecord(gridRepl,filterRepl);
end;

procedure Tf_ReplInit.q_CallErrBeforeOpen(DataSet: TDataSet);
var FilterStr:string;
begin
  FilterStr:='';
  if NOT replFilter then
  Begin
    q_CallErr.SQL[0]:='SELECT /*+ ORDERED USE_NL(A,B,C,D,E) */';
    FilterStr:=FilterStr+' AND A.SITE_SOURCE_RN='+cb_SiteSource.KeyValue;
    FilterStr:=FilterStr+' AND A.SITE_DEST_RN='+cb_SiteDest.KeyValue;
    if not VarIsNull(cb_Schema.KeyValue) then
      FilterStr:=FilterStr+' AND A.SCHEMA_RN='+VarToStr(cb_Schema.KeyValue);
    if not VarIsNull(cb_Table.KeyValue) then
      FilterStr:=FilterStr+' AND A.SCHEMAROW_RN='+VarToStr(cb_Table.KeyValue);
    if cbPeriod.Checked then
    Begin
      FilterStr:=FilterStr+' AND A.DATE_HIST>=TO_DATE('''+FormatDateTime('dd.mm.yyyyy',DateOf(edDateFrom.Date)+TimeOf(edTimeFrom.Time))+''',''dd.mm.yyyy'')';
      FilterStr:=FilterStr+' AND A.DATE_HIST<=TO_DATE('''+FormatDateTime('dd.mm.yyyyy',DateOf(edDateTo.Date)+TimeOf(edTimeTo.Time))+''',''dd.mm.yyyy'')';
    End
  end
  else
  Begin
    q_CallErr.SQL[0]:='SELECT /*+ ORDERED USE_NL(A,B,C,D,E) */';
    // Фильтр должен быть уже установлен
    FilterStr:=q_CallErr.SQL[9];
  End;
  q_CallErr.SQL[9]:=FilterStr;
end;

procedure Tf_ReplInit.q_statusFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept:=f_db.AcceptFilterRecord(gridStatus,filterStatus);
end;

procedure Tf_ReplInit.q_CallOutFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept:=f_db.AcceptFilterRecord(gridCallOut,filterCallOut);
end;

procedure Tf_ReplInit.q_CallFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept:=f_db.AcceptFilterRecord(gridCall,filterCall);
end;

procedure Tf_ReplInit.q_AnswFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept:=f_db.AcceptFilterRecord(gridAnsw,filterAnsw);
end;

procedure Tf_ReplInit.q_CallOutHistFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept:=f_db.AcceptFilterRecord(gridCallOutHist,filterCallOutHist);
end;

procedure Tf_ReplInit.q_CallErrFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept:=f_db.AcceptFilterRecord(gridCallErr,filterCallErr);
end;

procedure Tf_ReplInit.q_logAfterOpen(DataSet: TDataSet);
var i:integer;
begin
  if FilterLog.Count=0 then
    for i:=1 to q_Log.FieldCount do
    Begin
      FilterLog.Add('');
    end;
end;

procedure Tf_ReplInit.q_statusAfterOpen(DataSet: TDataSet);
var i:integer;
begin
  if FilterStatus.Count=0 then
    for i:=1 to q_status.FieldCount do
    Begin
      FilterStatus.Add('');
    end;
end;

procedure Tf_ReplInit.q_CallOutAfterOpen(DataSet: TDataSet);
var i:integer;
begin
  if FilterCallOut.Count=0 then
    for i:=1 to q_CallOut.FieldCount do
    Begin
      FilterCallOut.Add('');
    end;
end;

procedure Tf_ReplInit.q_CallOutHistAfterOpen(DataSet: TDataSet);
var i:integer;
begin
  if FilterCallOutHist.Count=0 then
    for i:=1 to q_CallOutHist.FieldCount do
    Begin
      FilterCallOutHist.Add('');
    end;
end;

procedure Tf_ReplInit.q_CallAfterOpen(DataSet: TDataSet);
var i:integer;
begin
  if FilterCall.Count=0 then
    for i:=1 to q_Call.FieldCount do
    Begin
      FilterCall.Add('');
    end;
end;

procedure Tf_ReplInit.q_CallErrAfterOpen(DataSet: TDataSet);
var i:integer;
begin
  if FilterCallErr.Count=0 then
    for i:=1 to q_CallErr.FieldCount do
    Begin
      FilterCallErr.Add('');
    end;
end;

procedure Tf_ReplInit.q_AnswAfterOpen(DataSet: TDataSet);
var i:integer;
begin
  if FilterAnsw.Count=0 then
    for i:=1 to q_Answ.FieldCount do
    Begin
      FilterAnsw.Add('');
    end;
end;

procedure Tf_ReplInit.q_ReplAfterOpen(DataSet: TDataSet);
var i:integer;
begin
  if FilterRepl.Count=0 then
    for i:=1 to q_Repl.FieldCount do
    Begin
      FilterRepl.Add('');
    end;
end;

{ TODO :
//***********************************************************************
//                        Action's
//*********************************************************************** }
procedure Tf_ReplInit.acReplInitAddSiteExecute(Sender: TObject);
begin
  q_sites.Append;
  q_sites.Post;
  q_init.Close;
  q_init.Open;
end;

procedure Tf_ReplInit.acReplInitDelSiteExecute(Sender: TObject);
begin
  q_sites.Delete;
end;

procedure Tf_ReplInit.acReplInitRefreshSiteExecute(Sender: TObject);
begin
  f_db.ReQuery(q_sites,true);
  f_db.ReQuery(q_site_list,false);
end;

procedure Tf_ReplInit.acReplInitRefreshSchemaExecute(Sender: TObject);
begin
  f_db.ReQuery(q_schema,true);
  f_db.ReQuery(q_schema_list,false);
end;

procedure Tf_ReplInit.acReplInitRefreshSchemaRowExecute(Sender: TObject);
begin
  f_db.ReQuery(q_schema_row,true);
  f_db.ReQuery(q_schema_row_list,false);
end;

procedure Tf_ReplInit.acReplInitAddSchemaExecute(Sender: TObject);
begin
  q_schema.Append;
  q_schema.Post;
end;

procedure Tf_ReplInit.acReplInitDelSchemaExecute(Sender: TObject);
begin
  q_schema.Delete;
end;

procedure Tf_ReplInit.acReplInitAddSchemaRowExecute(Sender: TObject);
begin
  q_schema_row.Append;
end;

procedure Tf_ReplInit.acReplInitDelSchemaRowExecute(Sender: TObject);
begin
  q_schema_row.Delete;
end;

procedure Tf_ReplInit.acReplInitPostSchemaRowExecute(Sender: TObject);
begin
  if q_schema_row.State = dsEdit then q_schema_row.Post;
  if q_schema_row.State = dsInsert then q_schema_row.Post;
end;

procedure Tf_ReplInit.acReplInitCancelSchemaRowExecute(Sender: TObject);
begin
  if q_schema_row.State = dsEdit then q_schema_row.Cancel;
  if q_schema_row.State = dsInsert then q_schema_row.Cancel;
end;

procedure Tf_ReplInit.acReplInitAddTableExecute(Sender: TObject);
begin
  q_table.Append;
end;

procedure Tf_ReplInit.acReplInitDelTableExecute(Sender: TObject);
begin
  q_table.Delete;
end;

procedure Tf_ReplInit.acReplInitRefreshTableExecute(Sender: TObject);
begin
  f_db.ReQuery(q_table,true);
end;

procedure Tf_ReplInit.acReplInitRefreshLogExecute(Sender: TObject);
begin
  f_db.ReQuery(q_log,true);
end;

procedure Tf_ReplInit.acReplInitRefreshStatusExecute(Sender: TObject);
begin
  inherited;
  f_db.ReQuery(q_status,true);
end;

procedure Tf_ReplInit.acReplInitAddStatusExecute(Sender: TObject);
begin
  inherited;
  q_status.Append;
end;

procedure Tf_ReplInit.acReplInitDelStatusExecute(Sender: TObject);
begin
  inherited;
  q_status.Delete;
end;

procedure Tf_ReplInit.acReplInitRefreshCallOutExecute(Sender: TObject);
begin
  inherited;
  f_db.ReQuery(q_CallOut,true);
  f_db.ReQuery(q_CallOutHist,true);
end;

procedure Tf_ReplInit.acReplInitRefreshCallExecute(Sender: TObject);
begin
  inherited;
  f_db.ReQuery(q_Call,true);
  f_db.ReQuery(q_CallErr,true);
end;

procedure Tf_ReplInit.acReplInitRefreshAnswExecute(Sender: TObject);
begin
  inherited;
  f_db.ReQuery(q_Answ,true);
end;

procedure Tf_ReplInit.acReplInitPostCallOutExecute(Sender: TObject);
begin
  inherited;
  if q_CallOut.State = dsEdit then q_CallOut.Post;
  if q_CallOut.State = dsInsert then q_CallOut.Post;
end;

procedure Tf_ReplInit.acReplInitPostSiteExecute(Sender: TObject);
begin
  inherited;
  if q_Sites.State = dsEdit then q_Sites.Post;
  if q_Sites.State = dsInsert then q_Sites.Post;
end;

procedure Tf_ReplInit.acReplInitPostSchemaExecute(Sender: TObject);
begin
  inherited;
  if q_Schema.State = dsEdit then q_Schema.Post;
  if q_Schema.State = dsInsert then q_Schema.Post;
end;

procedure Tf_ReplInit.acReplInitPostStatusExecute(Sender: TObject);
begin
  inherited;
  if q_Status.State = dsEdit then q_Status.Post;
  if q_Status.State = dsInsert then q_Status.Post;

end;

procedure Tf_ReplInit.acReplInitCancelSchemaExecute(Sender: TObject);
begin
  inherited;
  if q_schema.State = dsEdit then q_schema.Cancel;
  if q_schema.State = dsInsert then q_schema.Cancel;
end;

procedure Tf_ReplInit.acReplInitCancelSiteExecute(Sender: TObject);
begin
  inherited;
  if q_sites.State = dsEdit then q_sites.Cancel;
  if q_sites.State = dsInsert then q_sites.Cancel;
end;

procedure Tf_ReplInit.acReplInitCancelStatusExecute(Sender: TObject);
begin
  inherited;
  if q_status.State = dsEdit then q_status.Cancel;
  if q_status.State = dsInsert then q_status.Cancel;
end;

procedure Tf_ReplInit.acReplInitCancelTableExecute(Sender: TObject);
begin
  inherited;
  if q_table.State = dsEdit then q_table.Cancel;
  if q_table.State = dsInsert then q_table.Cancel;
end;

procedure Tf_ReplInit.acReplInitCancelCallOutExecute(Sender: TObject);
begin
  inherited;
  if q_CallOut.State = dsEdit then q_CallOut.Cancel;
  if q_CallOut.State = dsInsert then q_CallOut.Cancel;
end;

procedure Tf_ReplInit.acReplInitPostTableExecute(Sender: TObject);
begin
  inherited;
  if q_Table.State = dsEdit then q_Table.Post;
  if q_Table.State = dsInsert then q_Table.Post;
end;

procedure Tf_ReplInit.acReplInitDelCallOutExecute(Sender: TObject);
begin
  inherited;
  if not q_CallOut.Eof then
  if Application.MessageBox('Удалить запись?','Внимание!',MB_YESNO)=IDYES then
  Begin
    oraPackage.CallProcedure('DELETECALLOUT',[ReplSession.GetSessionId,q_CallOutRN.AsInteger,q_CallOutSITE_SOURCE_RN.AsInteger,q_CallOutSITE_DEST_RN.AsInteger,sesReplUserDeleted]);
    oraSess.Commit;
    f_db.ReQuery(q_CallOut,true);
    f_db.ReQuery(q_CallOutHist,true);
  End;
end;

procedure Tf_ReplInit.acReplInitDelCallExecute(Sender: TObject);
var vStatus:integer;
begin
  inherited;
  if not q_Call.Eof then
  if Application.MessageBox('Удалить запись?','Внимание!',MB_YESNO)=IDYES then
  Begin
    oraPackage.CallProcedure('DELETECALL',[ReplSession.GetSessionId,q_CallRN.AsInteger,q_CallSITE_SOURCE_RN.AsInteger,q_CallSITE_DEST_RN.AsInteger,sesReplUserDeleted]);
    if GetCurrent(amDefault) then
      if q_CallSITE_DEST_RN.AsInteger=q_site_curSITE_RN.AsInteger then
        // Если удаляем "чужой" оператор - отправляем подтверждение
        vStatus:=oraPackage.CallFloatFunction('ADDANSWOUT',[ReplSession.GetSessionId,q_CallRN.AsInteger,q_CallSITE_SOURCE_RN.AsInteger,q_CallSITE_DEST_RN.AsInteger,sesReplDestUserDeleted,'']);
    oraSess.Commit;
    f_db.ReQuery(q_Call,true);
    f_db.ReQuery(q_CallErr,true);
  End;
end;

procedure Tf_ReplInit.acReplInitDelAnswExecute(Sender: TObject);
begin
  inherited;
  q_Answ.Delete;
end;

procedure Tf_ReplInit.acReplInitAddReplExecute(Sender: TObject);
begin
  inherited;
  q_repl.Append;
end;

procedure Tf_ReplInit.acReplInitDelReplExecute(Sender: TObject);
begin
  inherited;
  q_repl.Delete;
end;

procedure Tf_ReplInit.acReplInitRefreshReplExecute(Sender: TObject);
var i:integer;
begin
  inherited;
  f_db.ReQuery(q_repl,true);
end;

procedure Tf_ReplInit.acReplInitPostReplExecute(Sender: TObject);
begin
  inherited;
  if q_repl.State = dsEdit then q_repl.Post;
  if q_repl.State = dsInsert then q_repl.Post;
end;

procedure Tf_ReplInit.acReplInitCancelReplExecute(Sender: TObject);
begin
  inherited;
  if q_Repl.State = dsEdit then q_Repl.Cancel;
  if q_Repl.State = dsInsert then q_Repl.Cancel;
end;

procedure Tf_ReplInit.acReplInitRestCallOutExecute(Sender: TObject);
begin
  inherited;
  if not q_CallOutHist.Eof then
  if Application.MessageBox('Восстановить запись?','Внимание!',MB_YESNO)=IDYES then
  Begin
    oraPackage.CallProcedure('RESTORECALLOUT',[ReplSession.GetSessionId,q_CallOutHistRN.AsInteger,q_CallOutHistSITE_SOURCE_RN.AsInteger,q_CallOutHistSITE_DEST_RN.AsInteger]);
    oraSess.Commit;
    f_db.ReQuery(q_CallOut,true);
    f_db.ReQuery(q_CallOutHist,true);
  End;
end;

procedure Tf_ReplInit.acReplInitRestCallExecute(Sender: TObject);
var vStatus: integer;
begin
  inherited;
  if not q_CallErr.Eof then
  if Application.MessageBox('Восстановить запись?','Внимание!',MB_YESNO)=IDYES then
  Begin
    oraPackage.CallProcedure('RESTORECALL',[ReplSession.GetSessionId,q_CallErrRN.AsInteger,q_CallErrSITE_SOURCE_RN.AsInteger,q_CallErrSITE_DEST_RN.AsInteger]);
    if GetCurrent(amDefault) then
      if q_CallErrSITE_DEST_RN.AsInteger=q_site_curSITE_RN.AsInteger then
        // Если восстанавливаем "чужой" оператор - отправляем подтверждение
        vStatus:=oraPackage.CallFloatFunction('ADDANSWOUT',[ReplSession.GetSessionId,q_CallErrRN.AsInteger,q_CallErrSITE_SOURCE_RN.AsInteger,q_CallErrSITE_DEST_RN.AsInteger,sesReplDestUserRestored,'']);
    oraSess.Commit;
    f_db.ReQuery(q_Call,true);
    f_db.ReQuery(q_CallErr,true);
  End;
end;

procedure Tf_ReplInit.acReplInitExecReSendCallOutExecute(Sender: TObject);
begin
  if Application.MessageBox('Отправить повторно исходящие запросы?','Внимание!',MB_YESNO)=IDYES then
  Begin
    ExecuteRepl(amDefault,'RESEND_CALL_OUT')
  end;
end;

procedure Tf_ReplInit.acReplInitExecReFormBadExecute(Sender: TObject);
begin
  if Application.MessageBox('Пересоздать ошибочные исходящие запросы с COUNTER>=3?','Внимание!',MB_YESNO)=IDYES then
  Begin
    ExecuteRepl(amDefault,'REFORM_BAD')
  end;
end;

{ TODO :
//***********************************************************************
// Обработчики PageControl'а, Grid'ов, Panel'ей, GroupBox'ов, и пр. элементов управления
//*********************************************************************** }
procedure Tf_ReplInit.gridSitesExit(Sender: TObject);
begin
  if q_sites.State = dsEdit then q_sites.Post;
  if q_init.State = dsEdit then q_init.Post;
  f_db.ReQuery(q_site_list,false);
end;

procedure Tf_ReplInit.Panel16Exit(Sender: TObject);
begin
  if q_Init.State = dsEdit then q_Init.Post;
end;

procedure Tf_ReplInit.GroupBox1Exit(Sender: TObject);
begin
  if q_Init.State = dsEdit then q_Init.Post;
end;

procedure Tf_ReplInit.GroupBox3Exit(Sender: TObject);
begin
  if q_Init.State = dsEdit then q_Init.Post;
end;

procedure Tf_ReplInit.gridSitesGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if q_sites.FieldByName('IS_CURRENT').AsInteger=1 then Background:=clInfoBk;
end;

procedure Tf_ReplInit.gridSchemaExit(Sender: TObject);
begin
  if q_schema.State = dsEdit then q_schema.Post;
end;

procedure Tf_ReplInit.gridSchemaRowExit(Sender: TObject);
begin
  if q_schema_row.State = dsEdit then q_schema_row.Post;
end;

procedure Tf_ReplInit.gridTablesExit(Sender: TObject);
begin
  if q_table.State = dsEdit then q_table.Post;
  f_db.ReQuery(q_table_list,false);
end;

procedure Tf_ReplInit.cb_SiteSourceChange(Sender: TObject);
begin
  inherited;
  q_schema_list.SetVariable('SITE_SOURCE_RN',cb_SiteSource.KeyValue);
  q_schema_row_list.SetVariable('SITE_SOURCE_RN',cb_SiteSource.KeyValue);
  f_db.ReQuery(q_schema_list,false);
  f_db.ReQuery(q_schema_row_list,false);
end;

procedure Tf_ReplInit.cb_SiteDestChange(Sender: TObject);
begin
  inherited;
  q_schema_list.SetVariable('SITE_DEST_RN',cb_SiteDest.KeyValue);
  q_schema_row_list.SetVariable('SITE_DEST_RN',cb_SiteDest.KeyValue);
  f_db.ReQuery(q_schema_list,false);
  f_db.ReQuery(q_schema_row_list,false);
end;

procedure Tf_ReplInit.cb_SchemaChange(Sender: TObject);
begin
  inherited;
  q_schema_row_list.SetVariable('SCHEMA_RN',cb_Schema.KeyValue);
  f_db.ReQuery(q_schema_row_list,false);
end;

procedure Tf_ReplInit.tabAnswShow(Sender: TObject);
begin
  inherited;
  cbPeriod.Visible:=false;
  edTimeFrom.Visible:=false;
  edDateFrom.Visible:=false;
  edTimeTo.Visible:=false;
  edDateTo.Visible:=false;
  l_SiteSource.Visible:=true;
  cb_SiteSource.Visible:=true;
  l_SiteDest.Visible:=true;
  cb_SiteDest.Visible:=true;
  l_Schema.Visible:=true;
  cb_Schema.Visible:=true;
  l_Table.Visible:=true;
  cb_Table.Visible:=true;
  if oraSess.Connected and not replFilter then
    acReplInitRefreshAnswExecute(Sender);
end;

procedure Tf_ReplInit.tabCallShow(Sender: TObject);
begin
  inherited;
  cbPeriod.Visible:=true;
  edTimeFrom.Visible:=true;
  edDateFrom.Visible:=true;
  edTimeTo.Visible:=true;
  edDateTo.Visible:=true;
  l_SiteSource.Visible:=true;
  cb_SiteSource.Visible:=true;
  l_SiteDest.Visible:=true;
  cb_SiteDest.Visible:=true;
  l_Schema.Visible:=true;
  cb_Schema.Visible:=true;
  l_Table.Visible:=true;
  cb_Table.Visible:=true;
  if oraSess.Connected and not replFilter then
    acReplInitRefreshCallExecute(Sender);
end;

procedure Tf_ReplInit.tabCallOutShow(Sender: TObject);
begin
  inherited;
  cbPeriod.Visible:=true;
  edTimeFrom.Visible:=true;
  edDateFrom.Visible:=true;
  edTimeTo.Visible:=true;
  edDateTo.Visible:=true;
  l_SiteSource.Visible:=true;
  cb_SiteSource.Visible:=true;
  l_SiteDest.Visible:=true;
  cb_SiteDest.Visible:=true;
  l_Schema.Visible:=true;
  cb_Schema.Visible:=true;
  l_Table.Visible:=true;
  cb_Table.Visible:=true;
  if oraSess.Connected and not replFilter then
    acReplInitRefreshCallOutExecute(Sender);
end;

procedure Tf_ReplInit.tabLogShow(Sender: TObject);
begin
  inherited;
  cbPeriod.Visible:=true;
  edTimeFrom.Visible:=true;
  edDateFrom.Visible:=true;
  edTimeTo.Visible:=true;
  edDateTo.Visible:=true;
  l_SiteSource.Visible:=false;
  cb_SiteSource.Visible:=false;
  l_SiteDest.Visible:=false;
  cb_SiteDest.Visible:=false;
  l_Schema.Visible:=false;
  cb_Schema.Visible:=false;
  l_Table.Visible:=false;
  cb_Table.Visible:=false;
  if oraSess.Connected and not replFilter then
    acReplInitRefreshLogExecute(Sender);
end;

procedure Tf_ReplInit.tabSchemaShow(Sender: TObject);
begin
  inherited;
  cbPeriod.Visible:=false;
  edTimeFrom.Visible:=false;
  edDateFrom.Visible:=false;
  edTimeTo.Visible:=false;
  edDateTo.Visible:=false;
  l_SiteSource.Visible:=true;
  cb_SiteSource.Visible:=true;
  l_SiteDest.Visible:=true;
  cb_SiteDest.Visible:=true;
  l_Schema.Visible:=false;
  cb_Schema.Visible:=false;
  l_Table.Visible:=false;
  cb_Table.Visible:=false;
  if oraSess.Connected then
    acReplInitRefreshSchemaExecute(Sender);
end;

procedure Tf_ReplInit.tabSiteShow(Sender: TObject);
begin
  inherited;
  cbPeriod.Visible:=false;
  edTimeFrom.Visible:=false;
  edDateFrom.Visible:=false;
  edTimeTo.Visible:=false;
  edDateTo.Visible:=false;
  l_SiteSource.Visible:=false;
  cb_SiteSource.Visible:=false;
  l_SiteDest.Visible:=false;
  cb_SiteDest.Visible:=false;
  l_Schema.Visible:=false;
  cb_Schema.Visible:=false;
  l_Table.Visible:=false;
  cb_Table.Visible:=false;
  if oraSess.Connected then
    acReplInitRefreshSiteExecute(Sender);
end;

procedure Tf_ReplInit.tabStatusShow(Sender: TObject);
begin
  inherited;
  cbPeriod.Visible:=true;
  edTimeFrom.Visible:=true;
  edDateFrom.Visible:=true;
  edTimeTo.Visible:=true;
  edDateTo.Visible:=true;
  l_SiteSource.Visible:=true;
  cb_SiteSource.Visible:=true;
  l_SiteDest.Visible:=true;
  cb_SiteDest.Visible:=true;
  l_Schema.Visible:=true;
  cb_Schema.Visible:=true;
  l_Table.Visible:=true;
  cb_Table.Visible:=true;
  if oraSess.Connected and not replFilter then
    acReplInitRefreshStatusExecute(Sender);
end;

procedure Tf_ReplInit.tabTableShow(Sender: TObject);
begin
  inherited;
  cbPeriod.Visible:=false;
  edTimeFrom.Visible:=false;
  edDateFrom.Visible:=false;
  edTimeTo.Visible:=false;
  edDateTo.Visible:=false;
  l_SiteSource.Visible:=false;
  cb_SiteSource.Visible:=false;
  l_SiteDest.Visible:=false;
  cb_SiteDest.Visible:=false;
  l_Schema.Visible:=false;
  cb_Schema.Visible:=false;
  l_Table.Visible:=false;
  cb_Table.Visible:=false;
  if oraSess.Connected then
    acReplInitRefreshTableExecute(Sender);
end;

procedure Tf_ReplInit.TabReplShow(Sender: TObject);
begin
  inherited;
  cbPeriod.Visible:=true;
  edTimeFrom.Visible:=true;
  edDateFrom.Visible:=true;
  edTimeTo.Visible:=true;
  edDateTo.Visible:=true;
  l_SiteSource.Visible:=true;
  cb_SiteSource.Visible:=true;
  l_SiteDest.Visible:=true;
  cb_SiteDest.Visible:=true;
  l_Schema.Visible:=true;
  cb_Schema.Visible:=true;
  l_Table.Visible:=true;
  cb_Table.Visible:=true;
  if oraSess.Connected and not replFilter then
    acReplInitRefreshReplExecute(Sender);
end;

procedure Tf_ReplInit.gridCallOutSortMarkingChanged(Sender: TObject);
begin
  inherited;
  f_db.SortInGrid(q_CallOut,q_CallOut.SQL.Count-1,gridCallOut);
end;

procedure Tf_ReplInit.gridCallOutHistSortMarkingChanged(Sender: TObject);
begin
  inherited;
  f_db.SortInGrid(q_CallOutHist,q_CallOutHist.SQL.Count-1,gridCallOutHist);
end;

procedure Tf_ReplInit.gridCallSortMarkingChanged(Sender: TObject);
begin
  inherited;
  f_db.SortInGrid(q_Call,q_Call.SQL.Count-1,gridCall);
end;

procedure Tf_ReplInit.gridCallErrSortMarkingChanged(Sender: TObject);
begin
  inherited;
  f_db.SortInGrid(q_CallErr,q_CallErr.SQL.Count-1,gridCallErr);
end;

procedure Tf_ReplInit.gridLogSortMarkingChanged(Sender: TObject);
begin
  inherited;
  f_db.SortInGrid(q_Log,q_Log.SQL.Count-1,gridLog);
end;

procedure Tf_ReplInit.gridReplSortMarkingChanged(Sender: TObject);
begin
  inherited;
  f_db.SortInGrid(q_Repl,q_Repl.SQL.Count-1,gridRepl);
end;

procedure Tf_ReplInit.gridStatusSortMarkingChanged(Sender: TObject);
begin
  inherited;
  f_db.SortInGrid(q_Status,q_Status.SQL.Count-1,gridStatus);
end;

procedure Tf_ReplInit.gridAnswSortMarkingChanged(Sender: TObject);
begin
  inherited;
  f_db.SortInGrid(q_Answ,q_Answ.SQL.Count-1,gridAnsw);
end;

procedure Tf_ReplInit.gridCallOutColumns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text:=IntToStr(q_CallOut.RecNo);
end;


{ TODO :
//***********************************************************************
//                    Обработчики Menu, в т.ч. Popup
//*********************************************************************** }

procedure Tf_ReplInit.tbLogShowCallOutClick(Sender: TObject);
begin
  inherited;
  if not q_log.eof then
  if GetCurrent(amDefault) then
  Begin
    replFilter:=true;
    q_CallOut.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_site_curSITE_RN.AsString+' AND A.SITE_DEST_RN='+q_logSITE_RN.AsString+' AND (A.RN='+q_logCALL_RN.AsString+' OR A.UPDATE_RN='+q_logCALL_RN.AsString+')';
    f_db.ReQuery(q_CallOut,true);
    q_CallOutHist.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_site_curSITE_RN.AsString+' AND A.SITE_DEST_RN='+q_logSITE_RN.AsString+' AND (A.RN='+q_logCALL_RN.AsString+' OR A.UPDATE_RN='+q_logCALL_RN.AsString+')';
    f_db.ReQuery(q_CallOutHist,true);
    PageControl1.ActivePage:=tabCallOut;
  end;
end;

procedure Tf_ReplInit.tbCallOutWinEditClick(Sender: TObject);
begin
  inherited;
  f_db.EditInMemo(gridCallOut);
end;

procedure Tf_ReplInit.tbCallOutShowStatusClick(Sender: TObject);
begin
  inherited;
  if not q_CallOut.eof then
  Begin
    replFilter:=true;
    q_status.SQL[7]:=' AND A.SITE_SOURCE_RN='+q_CallOutSITE_SOURCE_RN.AsString+
                     ' AND A.SITE_DEST_RN='+q_CallOutSITE_DEST_RN.AsString+
                     ' AND A.SCHEMA_RN='+q_CallOutSCHEMA_RN.AsString+
                     ' AND A.SCHEMAROW_RN='+q_CallOutSCHEMAROW_RN.AsString+
                     ' AND A.REPL_RN='+q_CallOutREPL_RN.AsString;
    f_db.ReQuery(q_Status,true);
    PageControl1.ActivePage:=tabStatus;
  end;
end;

procedure Tf_ReplInit.tbCallOutShowReplClick(Sender: TObject);
begin
  inherited;
  if not q_CallOut.eof then
  Begin
    replFilter:=true;
    q_repl.SQL[8]:=''''+q_CallOutREPL_TABLE.AsString+''' AS REPL_TABLE';
    q_Repl.SQL[9]:='FROM '+q_CallOutREPL_TABLE.AsString+' A ';
    q_repl.SQL[10]:=' WHERE A.REPL_USERNAME='''+q_CallOutREPL_USERNAME.AsString+''''+
                    ' AND A.REPL_TABLENAME='''+q_CallOutREPL_TABLENAME.AsString+''''+
                    ' AND A.REPL_RN='+q_CallOutREPL_RN.AsString;
    f_db.ReQuery(q_Repl,true);
    PageControl1.ActivePage:=tabRepl;
  end;
end;

procedure Tf_ReplInit.tbReplRefreshClick(Sender: TObject);
begin
  inherited;
  replFilter:=false;
  acReplInitRefreshReplExecute(Sender);
end;

procedure Tf_ReplInit.tbStatusRefreshClick(Sender: TObject);
begin
  inherited;
  replFilter:=false;
  acReplInitRefreshStatusExecute(Sender);
end;

procedure Tf_ReplInit.tbLogFilterAcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  inherited;
  f_db.FilterAcceptText(gridLog,filterLog,NewText,Accept);
end;

procedure Tf_ReplInit.tbLogFilterCurClick(Sender: TObject);
begin
  inherited;
  f_db.FilterCurrentValue(gridLog,filterLog);
end;

procedure Tf_ReplInit.tbLogFilterClearClick(Sender: TObject);
begin
  f_db.FilterCLear(gridLog,filterLog);
end;

procedure Tf_ReplInit.TBEditItem1AcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  inherited;
  f_db.FilterAcceptText(gridRepl,filterRepl,NewText,Accept);
end;

procedure Tf_ReplInit.TBItem44Click(Sender: TObject);
begin
  inherited;
  f_db.FilterCurrentValue(gridRepl,filterRepl);
end;

procedure Tf_ReplInit.TBItem45Click(Sender: TObject);
begin
  f_db.FilterCLear(gridRepl,filterRepl);
end;

procedure Tf_ReplInit.TBItem49Click(Sender: TObject);
begin
  inherited;
  f_db.FilterCurrentValue(gridCallOut,filterCallOut);
end;

procedure Tf_ReplInit.TBEditItem2AcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  inherited;
  f_db.FilterAcceptText(gridCallOut,filterCallOut,NewText,Accept);
end;

procedure Tf_ReplInit.TBItem50Click(Sender: TObject);
begin
  f_db.FilterCLear(gridCallOut,filterCallOut);
end;

procedure Tf_ReplInit.TBItem51Click(Sender: TObject);
begin
  inherited;
  f_db.EditInMemo(gridRepl);
end;

procedure Tf_ReplInit.TBItem52Click(Sender: TObject);
begin
  inherited;
  f_db.EditInMemo(gridLog);
end;

procedure Tf_ReplInit.TBItem53Click(Sender: TObject);
begin
  inherited;
  if not q_log.eof then
  if GetCurrent(amDefault) then
  Begin
    replFilter:=true;
    q_Call.SQL[9]:=' AND A.SITE_DEST_RN='+q_site_curSITE_RN.AsString+' AND (A.RN='+q_logCALL_RN.AsString+' OR A.UPDATE_RN='+q_logCALL_RN.AsString+')';
    f_db.ReQuery(q_Call,true);
    q_CallErr.SQL[9]:=' AND A.SITE_DEST_RN='+q_site_curSITE_RN.AsString+' AND (A.RN='+q_logCALL_RN.AsString+' OR A.UPDATE_RN='+q_logCALL_RN.AsString+')';
//    q_CallErr.sql.SaveToFile('c:\tmp\1.sql');
    f_db.ReQuery(q_CallErr,true);
    PageControl1.ActivePage:=tabCall;
  end;
end;

procedure Tf_ReplInit.TBItem55Click(Sender: TObject);
begin
  inherited;
  if not q_CallOut.eof then
  Begin
    replFilter:=true;
    q_Log.SQL[9]:='AND B.SITE_RN='+q_CallOutSITE_DEST_RN.AsString+' AND B.CALL_RN='+q_CallOutRN.AsString;
    f_db.ReQuery(q_Log,true);
    PageControl1.ActivePage:=tabLog;
  end;
end;

procedure Tf_ReplInit.TBItem22Click(Sender: TObject);
begin
  inherited;
  replFilter:=false;
  acReplInitRefreshLogExecute(Sender);
end;

procedure Tf_ReplInit.TBItem56Click(Sender: TObject);
begin
  inherited;
  if not q_CallOut.eof then
  Begin
    replFilter:=true;
    q_status.SQL[7]:=' AND A.SITE_SOURCE_RN='+q_CallOutSITE_SOURCE_RN.AsString+
                     ' AND A.SITE_DEST_RN='+q_CallOutSITE_DEST_RN.AsString+
                     ' AND A.SCHEMA_RN='+q_CallOutSCHEMA_RN.AsString+
                     ' AND A.SCHEMAROW_RN='+q_CallOutSCHEMAROW_RN.AsString+
                     ' AND A.TABLERN='+q_CallOutTABLERN.AsString;
    f_db.ReQuery(q_Status,true);
    PageControl1.ActivePage:=tabStatus;
  end;
end;

procedure Tf_ReplInit.TBItem59Click(Sender: TObject);
begin
  inherited;
  if not q_CallOut.eof then
  Begin
    replFilter:=true;
    q_CallOutHist.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallOutSITE_SOURCE_RN.AsString+
                          ' AND A.SITE_DEST_RN='+q_CallOutSITE_DEST_RN.AsString+
                          ' AND A.SCHEMA_RN='+q_CallOutSCHEMA_RN.AsString+
                          ' AND A.SCHEMAROW_RN='+q_CallOutSCHEMAROW_RN.AsString+
                          ' AND A.REPL_RN='+q_CallOutREPL_RN.AsString;
    f_db.ReQuery(q_CallOutHist,true);
    PageControl1.ActivePage:=tabCallOut;
  end;
end;

procedure Tf_ReplInit.TBItem58Click(Sender: TObject);
begin
  inherited;
  if not q_CallOut.eof then
  Begin
    replFilter:=true;
    q_CallOutHist.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallOutSITE_SOURCE_RN.AsString+
                          ' AND A.SITE_DEST_RN='+q_CallOutSITE_DEST_RN.AsString+
                          ' AND A.SCHEMA_RN='+q_CallOutSCHEMA_RN.AsString+
                          ' AND A.SCHEMAROW_RN='+q_CallOutSCHEMAROW_RN.AsString+
                          ' AND A.TABLERN='+q_CallOutTABLERN.AsString;
    f_db.ReQuery(q_CallOutHist,true);
    PageControl1.ActivePage:=tabCallOut;
  end;
end;

procedure Tf_ReplInit.TBItem57Click(Sender: TObject);
begin
  inherited;
  if not q_CallOut.eof then
  Begin
    replFilter:=true;
    q_repl.SQL[8]:=''''+q_CallOutREPL_TABLE.AsString+''' AS REPL_TABLE';
    q_Repl.SQL[9]:='FROM '+q_CallOutREPL_TABLE.AsString+' A ';
    q_repl.SQL[10]:=' WHERE A.REPL_USERNAME='''+q_CallOutREPL_USERNAME.AsString+''''+
                    ' AND A.REPL_TABLENAME='''+q_CallOutREPL_TABLENAME.AsString+''''+
                    ' AND A.REPL_TABLERN='+q_CallOutTABLERN.AsString;
    f_db.ReQuery(q_Repl,true);
    PageControl1.ActivePage:=tabRepl;
  end;
end;

procedure Tf_ReplInit.TBItem46Click(Sender: TObject);
begin
  inherited;
  if not q_Repl.eof then
  Begin
    replFilter:=true;
    q_CallOut.SQL[9]:=' AND A.REPL_RN='+q_replREPL_RN.AsString+' AND D.REPL_USERNAME='''+q_replREPL_USERNAME.AsString+''' AND D.REPL_TABLENAME='''+q_replREPL_TABLENAME.AsString+'''';
    f_db.ReQuery(q_CallOut,true);
    q_CallOutHist.SQL[9]:=' AND A.REPL_RN='+q_replREPL_RN.AsString+' AND D.REPL_USERNAME='''+q_replREPL_USERNAME.AsString+''' AND D.REPL_TABLENAME='''+q_replREPL_TABLENAME.AsString+'''';
    f_db.ReQuery(q_CallOutHist,true);
    PageControl1.ActivePage:=tabCallOut;
  end;
end;

procedure Tf_ReplInit.TBItem62Click(Sender: TObject);
begin
  inherited;
  if not q_Repl.eof then
  Begin
    replFilter:=true;
    q_CallOut.SQL[9]:=' AND A.TABLERN='+q_replREPL_TABLERN.AsString+' AND D.REPL_USERNAME='''+q_replREPL_USERNAME.AsString+''' AND D.REPL_TABLENAME='''+q_replREPL_TABLENAME.AsString+'''';
    f_db.ReQuery(q_CallOut,true);
    q_CallOutHist.SQL[9]:=' AND A.TABLERN='+q_replREPL_TABLERN.AsString+' AND D.REPL_USERNAME='''+q_replREPL_USERNAME.AsString+''' AND D.REPL_TABLENAME='''+q_replREPL_TABLENAME.AsString+'''';
    f_db.ReQuery(q_CallOutHist,true);
    PageControl1.ActivePage:=tabCallOut;
  end;
end;

procedure Tf_ReplInit.TBItem63Click(Sender: TObject);
begin
  inherited;
  if not q_Repl.eof then
  Begin
    replFilter:=true;
    q_status.SQL[7]:='AND A.REPL_RN='+q_replREPL_RN.AsString+' AND D.REPL_USERNAME='''+q_replREPL_USERNAME.AsString+''' AND D.REPL_TABLENAME='''+q_replREPL_TABLENAME.AsString+'''';
    f_db.ReQuery(q_Status,true);
    PageControl1.ActivePage:=tabStatus;
  end;
end;

procedure Tf_ReplInit.TBItem64Click(Sender: TObject);
begin
  inherited;
  if not q_Repl.eof then
  Begin
    replFilter:=true;
    q_status.SQL[7]:='AND A.TABLERN='+q_replREPL_TABLERN.AsString+' AND D.REPL_USERNAME='''+q_replREPL_USERNAME.AsString+''' AND D.REPL_TABLENAME='''+q_replREPL_TABLENAME.AsString+'''';
    f_db.ReQuery(q_Status,true);
    PageControl1.ActivePage:=tabStatus;
  end;
end;

procedure Tf_ReplInit.TBItem66Click(Sender: TObject);
begin
  inherited;
  if not q_CallOut.eof then
  Begin
    replFilter:=true;
    q_Call.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallOutSITE_SOURCE_RN.AsString+' AND A.SITE_DEST_RN='+q_CallOutSITE_DEST_RN.AsString+' AND A.RN='+q_CallOutRN.AsString;
    f_db.ReQuery(q_Call,true);
    q_CallErr.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallOutSITE_SOURCE_RN.AsString+' AND A.SITE_DEST_RN='+q_CallOutSITE_DEST_RN.AsString+' AND A.RN='+q_CallOutRN.AsString;
    f_db.ReQuery(q_CallErr,true);
    PageControl1.ActivePage:=tabCall;
  end;
end;

procedure Tf_ReplInit.TBItem65Click(Sender: TObject);
begin
  inherited;
  if not q_CallOut.eof then
  Begin
    replFilter:=true;
    q_Answ.SQL[12]:=' AND A.SITE_SOURCE_RN='+q_CallOutSITE_SOURCE_RN.AsString+' AND A.SITE_DEST_RN='+q_CallOutSITE_DEST_RN.AsString+' AND A.CALL_OUT_RN='+q_CallOutRN.AsString;
    f_db.ReQuery(q_Answ,true);
    PageControl1.ActivePage:=tabAnsw;
  end;
end;

procedure Tf_ReplInit.TBItem24Click(Sender: TObject);
begin
  inherited;
  replFilter:=false;
  acReplInitRefreshAnswExecute(Sender);
end;

procedure Tf_ReplInit.TBItem21Click(Sender: TObject);
begin
  inherited;
  replFilter:=false;
  acReplInitRefreshCallOutExecute(Sender);
end;

procedure Tf_ReplInit.TBItem47Click(Sender: TObject);
begin
  inherited;
  replFilter:=false;
  acReplInitRefreshCallOutExecute(Sender);
end;

procedure Tf_ReplInit.TBItem23Click(Sender: TObject);
begin
  inherited;
  replFilter:=false;
  acReplInitRefreshCallExecute(Sender);
end;

procedure Tf_ReplInit.TBItem54Click(Sender: TObject);
begin
  inherited;
  replFilter:=false;
  acReplInitRefreshCallExecute(Sender);
end;

procedure Tf_ReplInit.TBItem67Click(Sender: TObject);
begin
  inherited;
  if not q_log.eof then
  if GetCurrent(amDefault) then
  Begin
    replFilter:=true;
    q_Answ.SQL[12]:=' AND A.SITE_SOURCE_RN='+q_site_curSITE_RN.AsString+' AND A.SITE_DEST_RN='+q_logSITE_RN.AsString+' AND A.CALL_OUT_RN='+q_logCALL_RN.AsString;
    f_db.ReQuery(q_Answ,true);
    PageControl1.ActivePage:=tabAnsw;
  end;
end;

procedure Tf_ReplInit.TBItem68Click(Sender: TObject);
begin
  inherited;
  if not q_Repl.eof then
  Begin
    replFilter:=true;
    q_Call.SQL[9]:=' AND A.REPL_RN='+q_replREPL_RN.AsString+' AND D.REPL_USERNAME='''+q_replREPL_USERNAME.AsString+''' AND D.REPL_TABLENAME='''+q_replREPL_TABLENAME.AsString+'''';
    f_db.ReQuery(q_Call,true);
    q_CallErr.SQL[9]:=' AND A.REPL_RN='+q_replREPL_RN.AsString+' AND D.REPL_USERNAME='''+q_replREPL_USERNAME.AsString+''' AND D.REPL_TABLENAME='''+q_replREPL_TABLENAME.AsString+'''';
    f_db.ReQuery(q_CallErr,true);
    PageControl1.ActivePage:=tabCall;
  end;
end;

procedure Tf_ReplInit.TBItem69Click(Sender: TObject);
begin
  inherited;
  if not q_Repl.eof then
  Begin
    replFilter:=true;
    q_Call.SQL[9]:=' AND A.TABLERN='+q_replREPL_TABLERN.AsString+' AND D.REPL_USERNAME='''+q_replREPL_USERNAME.AsString+''' AND D.REPL_TABLENAME='''+q_replREPL_TABLENAME.AsString+'''';
    f_db.ReQuery(q_Call,true);
    q_CallErr.SQL[9]:=' AND A.TABLERN='+q_replREPL_TABLERN.AsString+' AND D.REPL_USERNAME='''+q_replREPL_USERNAME.AsString+''' AND D.REPL_TABLENAME='''+q_replREPL_TABLENAME.AsString+'''';
    f_db.ReQuery(q_CallErr,true);
    PageControl1.ActivePage:=tabCall;
  end;
end;

procedure Tf_ReplInit.TBEditItem3AcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  inherited;
  f_db.FilterAcceptText(gridStatus,filterStatus,NewText,Accept);
end;

procedure Tf_ReplInit.TBItem71Click(Sender: TObject);
begin
  inherited;
  f_db.FilterCurrentValue(gridStatus,filterStatus);
end;

procedure Tf_ReplInit.TBItem72Click(Sender: TObject);
begin
  inherited;
  f_db.FilterCLear(gridStatus,filterStatus);
end;

procedure Tf_ReplInit.TBItem73Click(Sender: TObject);
begin
  inherited;
  f_db.EditInMemo(gridStatus);
end;

procedure Tf_ReplInit.TBItem77Click(Sender: TObject);
begin
  inherited;
  if not q_Status.eof then
  Begin
    replFilter:=true;
    q_repl.SQL[8]:=''''+q_StatusREPL_TABLE.AsString+''' AS REPL_TABLE';
    q_Repl.SQL[9]:='FROM '+q_StatusREPL_TABLE.AsString+' A ';
    q_repl.SQL[10]:=' WHERE A.REPL_USERNAME='''+q_StatusREPL_USERNAME.AsString+''''+
                    ' AND A.REPL_TABLENAME='''+q_StatusREPL_TABLENAME.AsString+''''+
                    ' AND A.REPL_RN='+q_StatusREPL_RN.AsString;
    f_db.ReQuery(q_Repl,true);
    PageControl1.ActivePage:=tabRepl;
  end;
end;

procedure Tf_ReplInit.TBItem78Click(Sender: TObject);
begin
  inherited;
  if not q_Status.eof then
  Begin
    replFilter:=true;
    q_repl.SQL[8]:=''''+q_StatusREPL_TABLE.AsString+''' AS REPL_TABLE';
    q_Repl.SQL[9]:='FROM '+q_StatusREPL_TABLE.AsString+' A ';
    q_repl.SQL[10]:=' WHERE A.REPL_USERNAME='''+q_StatusREPL_USERNAME.AsString+''''+
                    ' AND A.REPL_TABLENAME='''+q_StatusREPL_TABLENAME.AsString+''''+
                    ' AND A.REPL_TABLERN='+q_StatusTABLERN.AsString;
    f_db.ReQuery(q_Repl,true);
    PageControl1.ActivePage:=tabRepl;
  end;
end;

procedure Tf_ReplInit.TBItem75Click(Sender: TObject);
begin
  inherited;
  if not q_Status.eof then
  Begin
    replFilter:=true;
    q_CallOut.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_StatusSITE_SOURCE_RN.AsString+
                      ' AND A.SITE_DEST_RN='+q_StatusSITE_DEST_RN.AsString+
                      ' AND A.SCHEMA_RN='+q_StatusSCHEMA_RN.AsString+
                      ' AND A.SCHEMAROW_RN='+q_StatusSCHEMAROW_RN.AsString+
                      ' AND A.REPL_RN='+q_StatusREPL_RN.AsString;
    f_db.ReQuery(q_CallOut,true);
    q_CallOutHist.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_StatusSITE_SOURCE_RN.AsString+
                          ' AND A.SITE_DEST_RN='+q_StatusSITE_DEST_RN.AsString+
                          ' AND A.SCHEMA_RN='+q_StatusSCHEMA_RN.AsString+
                          ' AND A.SCHEMAROW_RN='+q_StatusSCHEMAROW_RN.AsString+
                          ' AND A.REPL_RN='+q_StatusREPL_RN.AsString;
    f_db.ReQuery(q_CallOutHist,true);
    PageControl1.ActivePage:=tabCallOut;
  end;
end;

procedure Tf_ReplInit.TBItem74Click(Sender: TObject);
begin
  inherited;
  if not q_Status.eof then
  Begin
    replFilter:=true;
    q_CallOut.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_StatusSITE_SOURCE_RN.AsString+
                      ' AND A.SITE_DEST_RN='+q_StatusSITE_DEST_RN.AsString+
                      ' AND A.SCHEMA_RN='+q_StatusSCHEMA_RN.AsString+
                      ' AND A.SCHEMAROW_RN='+q_StatusSCHEMAROW_RN.AsString+
                      ' AND A.TABLERN='+q_StatusTABLERN.AsString;
    f_db.ReQuery(q_CallOut,true);
    q_CallOutHist.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_StatusSITE_SOURCE_RN.AsString+
                          ' AND A.SITE_DEST_RN='+q_StatusSITE_DEST_RN.AsString+
                          ' AND A.SCHEMA_RN='+q_StatusSCHEMA_RN.AsString+
                          ' AND A.SCHEMAROW_RN='+q_StatusSCHEMAROW_RN.AsString+
                          ' AND A.TABLERN='+q_StatusTABLERN.AsString;
    f_db.ReQuery(q_CallOutHist,true);
    PageControl1.ActivePage:=tabCallOut;
  end;
end;

procedure Tf_ReplInit.TBItem81Click(Sender: TObject);
begin
  inherited;
  if not q_Status.eof then
  Begin
    replFilter:=true;
    q_Call.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_StatusSITE_SOURCE_RN.AsString+
                   ' AND A.SITE_DEST_RN='+q_StatusSITE_DEST_RN.AsString+
                   ' AND A.SCHEMA_RN='+q_StatusSCHEMA_RN.AsString+
                   ' AND A.SCHEMAROW_RN='+q_StatusSCHEMAROW_RN.AsString+
                   ' AND A.REPL_RN='+q_StatusREPL_RN.AsString;
    f_db.ReQuery(q_Call,true);
    q_CallErr.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_StatusSITE_SOURCE_RN.AsString+
                      ' AND A.SITE_DEST_RN='+q_StatusSITE_DEST_RN.AsString+
                      ' AND A.SCHEMA_RN='+q_StatusSCHEMA_RN.AsString+
                      ' AND A.SCHEMAROW_RN='+q_StatusSCHEMAROW_RN.AsString+
                      ' AND A.REPL_RN='+q_StatusREPL_RN.AsString;
    f_db.ReQuery(q_CallErr,true);
    PageControl1.ActivePage:=tabCall;
  end;
end;

procedure Tf_ReplInit.TBItem82Click(Sender: TObject);
begin
  inherited;
  if not q_Status.eof then
  Begin
    replFilter:=true;
    q_Call.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_StatusSITE_SOURCE_RN.AsString+
                   ' AND A.SITE_DEST_RN='+q_StatusSITE_DEST_RN.AsString+
                   ' AND A.SCHEMA_RN='+q_StatusSCHEMA_RN.AsString+
                   ' AND A.SCHEMAROW_RN='+q_StatusSCHEMAROW_RN.AsString+
                   ' AND A.TABLERN='+q_StatusTABLERN.AsString;
    f_db.ReQuery(q_Call,true);
    q_CallErr.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_StatusSITE_SOURCE_RN.AsString+
                      ' AND A.SITE_DEST_RN='+q_StatusSITE_DEST_RN.AsString+
                      ' AND A.SCHEMA_RN='+q_StatusSCHEMA_RN.AsString+
                      ' AND A.SCHEMAROW_RN='+q_StatusSCHEMAROW_RN.AsString+
                      ' AND A.TABLERN='+q_StatusTABLERN.AsString;
    f_db.ReQuery(q_CallErr,true);
    PageControl1.ActivePage:=tabCall;
  end;
end;

procedure Tf_ReplInit.TBEditItem4AcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  inherited;
  f_db.FilterAcceptText(gridCallOutHist,filterCallOutHist,NewText,Accept);
end;

procedure Tf_ReplInit.TBItem79Click(Sender: TObject);
begin
  inherited;
  f_db.FilterCurrentValue(gridCallOutHist,filterCallOutHist);
end;

procedure Tf_ReplInit.TBItem80Click(Sender: TObject);
begin
  inherited;
  f_db.FilterCLear(gridCallOutHist,filterCallOutHist);
end;

procedure Tf_ReplInit.TBItem83Click(Sender: TObject);
begin
  inherited;
  f_db.EditInMemo(gridCallOutHist);
end;

procedure Tf_ReplInit.TBItem84Click(Sender: TObject);
begin
  inherited;
  if not q_CallOutHist.eof then
  Begin
    replFilter:=true;
    q_Log.SQL[9]:='AND B.SITE_RN='+q_CallOutHistSITE_DEST_RN.AsString+' AND B.CALL_RN='+q_CallOutHistRN.AsString;
    f_db.ReQuery(q_Log,true);
    PageControl1.ActivePage:=tabLog;
  end;
end;

procedure Tf_ReplInit.TBItem85Click(Sender: TObject);
begin
  inherited;
  if not q_CallOutHist.eof then
  Begin
    replFilter:=true;
    q_status.SQL[7]:=' AND A.SITE_SOURCE_RN='+q_CallOutHistSITE_SOURCE_RN.AsString+
                     ' AND A.SITE_DEST_RN='+q_CallOutHistSITE_DEST_RN.AsString+
                     ' AND A.SCHEMA_RN='+q_CallOutHistSCHEMA_RN.AsString+
                     ' AND A.SCHEMAROW_RN='+q_CallOutHistSCHEMAROW_RN.AsString+
                     ' AND A.REPL_RN='+q_CallOutHistREPL_RN.AsString;
    f_db.ReQuery(q_Status,true);
    PageControl1.ActivePage:=tabStatus;
  end;
end;

procedure Tf_ReplInit.TBItem86Click(Sender: TObject);
begin
  inherited;
  if not q_CallOutHist.eof then
  Begin
    replFilter:=true;
    q_status.SQL[7]:=' AND A.SITE_SOURCE_RN='+q_CallOutHistSITE_SOURCE_RN.AsString+
                     ' AND A.SITE_DEST_RN='+q_CallOutHistSITE_DEST_RN.AsString+
                     ' AND A.SCHEMA_RN='+q_CallOutHistSCHEMA_RN.AsString+
                     ' AND A.SCHEMAROW_RN='+q_CallOutHistSCHEMAROW_RN.AsString+
                     ' AND A.TABLERN='+q_CallOutHistTABLERN.AsString;
    f_db.ReQuery(q_Status,true);
    PageControl1.ActivePage:=tabStatus;
  end;
end;

procedure Tf_ReplInit.TBItem87Click(Sender: TObject);
begin
  inherited;
  if not q_CallOutHist.eof then
  Begin
    replFilter:=true;
    q_repl.SQL[8]:=''''+q_CallOutHistREPL_TABLE.AsString+''' AS REPL_TABLE';
    q_Repl.SQL[9]:='FROM '+q_CallOutHistREPL_TABLE.AsString+' A ';
    q_repl.SQL[10]:=' WHERE A.REPL_USERNAME='''+q_CallOutHistREPL_USERNAME.AsString+''''+
                    ' AND A.REPL_TABLENAME='''+q_CallOutHistREPL_TABLENAME.AsString+''''+
                    ' AND A.REPL_RN='+q_CallOutHistREPL_RN.AsString;
    f_db.ReQuery(q_Repl,true);
    PageControl1.ActivePage:=tabRepl;
  end;
end;

procedure Tf_ReplInit.TBItem88Click(Sender: TObject);
begin
  inherited;
  if not q_CallOutHist.eof then
  Begin
    replFilter:=true;
    q_repl.SQL[8]:=''''+q_CallOutHistREPL_TABLE.AsString+''' AS REPL_TABLE';
    q_Repl.SQL[9]:='FROM '+q_CallOutHistREPL_TABLE.AsString+' A ';
    q_repl.SQL[10]:=' WHERE A.REPL_USERNAME='''+q_CallOutHistREPL_USERNAME.AsString+''''+
                    ' AND A.REPL_TABLENAME='''+q_CallOutHistREPL_TABLENAME.AsString+''''+
                    ' AND A.REPL_TABLERN='+q_CallOutHistTABLERN.AsString;
    f_db.ReQuery(q_Repl,true);
    PageControl1.ActivePage:=tabRepl;
  end;
end;

procedure Tf_ReplInit.TBItem89Click(Sender: TObject);
begin
  inherited;
  if not q_CallOutHist.eof then
  Begin
    replFilter:=true;
    q_CallOut.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallOutHistSITE_SOURCE_RN.AsString+
                      ' AND A.SITE_DEST_RN='+q_CallOutHistSITE_DEST_RN.AsString+
                      ' AND A.SCHEMA_RN='+q_CallOutHistSCHEMA_RN.AsString+
                      ' AND A.SCHEMAROW_RN='+q_CallOutHistSCHEMAROW_RN.AsString+
                      ' AND A.REPL_RN='+q_CallOutHistREPL_RN.AsString;
    f_db.ReQuery(q_CallOut,true);
    PageControl1.ActivePage:=tabCallOut;
  end;
end;

procedure Tf_ReplInit.TBItem90Click(Sender: TObject);
begin
  inherited;
  if not q_CallOutHist.eof then
  Begin
    replFilter:=true;
    q_CallOut.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallOutHistSITE_SOURCE_RN.AsString+
                      ' AND A.SITE_DEST_RN='+q_CallOutHistSITE_DEST_RN.AsString+
                      ' AND A.SCHEMA_RN='+q_CallOutHistSCHEMA_RN.AsString+
                      ' AND A.SCHEMAROW_RN='+q_CallOutHistSCHEMAROW_RN.AsString+
                      ' AND A.TABLERN='+q_CallOutHistTABLERN.AsString;
    f_db.ReQuery(q_CallOut,true);
    PageControl1.ActivePage:=tabCallOut;
  end;
end;

procedure Tf_ReplInit.TBItem91Click(Sender: TObject);
begin
  inherited;
  if not q_CallOutHist.eof then
  Begin
    replFilter:=true;
    q_Call.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallOutHistSITE_SOURCE_RN.AsString+' AND A.SITE_DEST_RN='+q_CallOutHistSITE_DEST_RN.AsString+' AND A.RN='+q_CallOutHistRN.AsString;
    f_db.ReQuery(q_Call,true);
    q_CallErr.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallOutHistSITE_SOURCE_RN.AsString+' AND A.SITE_DEST_RN='+q_CallOutHistSITE_DEST_RN.AsString+' AND A.RN='+q_CallOutHistRN.AsString;
    f_db.ReQuery(q_CallErr,true);
    PageControl1.ActivePage:=tabCall;
  end;
end;

procedure Tf_ReplInit.TBItem92Click(Sender: TObject);
begin
  inherited;
  if not q_CallOutHist.eof then
  Begin
    replFilter:=true;
    q_Answ.SQL[12]:=' AND A.SITE_SOURCE_RN='+q_CallOutHistSITE_SOURCE_RN.AsString+' AND A.SITE_DEST_RN='+q_CallOutHistSITE_DEST_RN.AsString+' AND A.CALL_OUT_RN='+q_CallOutHistRN.AsString;
    f_db.ReQuery(q_Answ,true);
    PageControl1.ActivePage:=tabAnsw;
  end;
end;

procedure Tf_ReplInit.TBEditItem5AcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  inherited;
  f_db.FilterAcceptText(gridCall,filterCall,NewText,Accept);
end;

procedure Tf_ReplInit.TBItem94Click(Sender: TObject);
begin
  inherited;
  f_db.FilterCurrentValue(gridCall,filterCall);
end;

procedure Tf_ReplInit.TBItem95Click(Sender: TObject);
begin
  inherited;
  f_db.FilterCLear(gridCall,filterCall);
end;

procedure Tf_ReplInit.TBItem96Click(Sender: TObject);
begin
  inherited;
  f_db.EditInMemo(gridCall);
end;

procedure Tf_ReplInit.TBItem97Click(Sender: TObject);
begin
  inherited;
  if not q_Call.eof then
  Begin
    replFilter:=true;
    q_Log.SQL[9]:='AND B.SITE_RN='+q_CallSITE_DEST_RN.AsString+' AND B.CALL_RN='+q_CallRN.AsString;
    f_db.ReQuery(q_Log,true);
    PageControl1.ActivePage:=tabLog;
  end;
end;

procedure Tf_ReplInit.TBItem98Click(Sender: TObject);
begin
  inherited;
  if not q_Call.eof then
  Begin
    replFilter:=true;
    q_status.SQL[7]:=' AND A.SITE_SOURCE_RN='+q_CallSITE_SOURCE_RN.AsString+
                     ' AND A.SITE_DEST_RN='+q_CallSITE_DEST_RN.AsString+
                     ' AND A.SCHEMA_RN='+q_CallSCHEMA_RN.AsString+
                     ' AND A.SCHEMAROW_RN='+q_CallSCHEMAROW_RN.AsString+
                     ' AND A.REPL_RN='+q_CallREPL_RN.AsString;
    f_db.ReQuery(q_Status,true);
    PageControl1.ActivePage:=tabStatus;
  end;
end;

procedure Tf_ReplInit.TBItem99Click(Sender: TObject);
begin
  inherited;
  if not q_Call.eof then
  Begin
    replFilter:=true;
    q_status.SQL[7]:=' AND A.SITE_SOURCE_RN='+q_CallSITE_SOURCE_RN.AsString+
                     ' AND A.SITE_DEST_RN='+q_CallSITE_DEST_RN.AsString+
                     ' AND A.SCHEMA_RN='+q_CallSCHEMA_RN.AsString+
                     ' AND A.SCHEMAROW_RN='+q_CallSCHEMAROW_RN.AsString+
                     ' AND A.TABLERN='+q_CallTABLERN.AsString;
    f_db.ReQuery(q_Status,true);
    PageControl1.ActivePage:=tabStatus;
  end;
end;

procedure Tf_ReplInit.TBItem100Click(Sender: TObject);
begin
  inherited;
  if not q_Call.eof then
  Begin
    replFilter:=true;
    q_repl.SQL[8]:=''''+q_CallREPL_TABLE.AsString+''' AS REPL_TABLE';
    q_Repl.SQL[9]:='FROM '+q_CallREPL_TABLE.AsString+' A ';
    q_repl.SQL[10]:=' WHERE A.REPL_USERNAME='''+q_CallREPL_USERNAME.AsString+''''+
                    ' AND A.REPL_TABLENAME='''+q_CallREPL_TABLENAME.AsString+''''+
                    ' AND A.REPL_RN='+q_CallREPL_RN.AsString;
    f_db.ReQuery(q_Repl,true);
    PageControl1.ActivePage:=tabRepl;
  end;
end;

procedure Tf_ReplInit.TBItem101Click(Sender: TObject);
begin
  inherited;
  if not q_Call.eof then
  Begin
    replFilter:=true;
    q_repl.SQL[8]:=''''+q_CallREPL_TABLE.AsString+''' AS REPL_TABLE';
    q_Repl.SQL[9]:='FROM '+q_CallREPL_TABLE.AsString+' A ';
    q_repl.SQL[10]:=' WHERE A.REPL_USERNAME='''+q_CallREPL_USERNAME.AsString+''''+
                    ' AND A.REPL_TABLENAME='''+q_CallREPL_TABLENAME.AsString+''''+
                    ' AND A.REPL_TABLERN='+q_CallTABLERN.AsString;
    f_db.ReQuery(q_Repl,true);
    PageControl1.ActivePage:=tabRepl;
  end;
end;

procedure Tf_ReplInit.TBItem102Click(Sender: TObject);
begin
  inherited;
  if not q_Call.eof then
  Begin
    replFilter:=true;
    q_CallOut.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallSITE_SOURCE_RN.AsString+
                      ' AND A.SITE_DEST_RN='+q_CallSITE_DEST_RN.AsString+
                      ' AND A.SCHEMA_RN='+q_CallSCHEMA_RN.AsString+
                      ' AND A.SCHEMAROW_RN='+q_CallSCHEMAROW_RN.AsString+
                      ' AND A.REPL_RN='+q_CallREPL_RN.AsString;
    f_db.ReQuery(q_CallOut,true);
    q_CallOutHist.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallSITE_SOURCE_RN.AsString+
                          ' AND A.SITE_DEST_RN='+q_CallSITE_DEST_RN.AsString+
                          ' AND A.SCHEMA_RN='+q_CallSCHEMA_RN.AsString+
                          ' AND A.SCHEMAROW_RN='+q_CallSCHEMAROW_RN.AsString+
                          ' AND A.REPL_RN='+q_CallREPL_RN.AsString;
    f_db.ReQuery(q_CallOutHist,true);
    PageControl1.ActivePage:=tabCallOut;
  end;
end;

procedure Tf_ReplInit.TBItem103Click(Sender: TObject);
begin
  inherited;
  if not q_Call.eof then
  Begin
    replFilter:=true;
    q_CallOut.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallSITE_SOURCE_RN.AsString+
                      ' AND A.SITE_DEST_RN='+q_CallSITE_DEST_RN.AsString+
                      ' AND A.SCHEMA_RN='+q_CallSCHEMA_RN.AsString+
                      ' AND A.SCHEMAROW_RN='+q_CallSCHEMAROW_RN.AsString+
                      ' AND A.TABLERN='+q_CallTABLERN.AsString;
    f_db.ReQuery(q_CallOut,true);
    q_CallOutHist.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallSITE_SOURCE_RN.AsString+
                          ' AND A.SITE_DEST_RN='+q_CallSITE_DEST_RN.AsString+
                          ' AND A.SCHEMA_RN='+q_CallSCHEMA_RN.AsString+
                          ' AND A.SCHEMAROW_RN='+q_CallSCHEMAROW_RN.AsString+
                          ' AND A.TABLERN='+q_CallTABLERN.AsString;
    f_db.ReQuery(q_CallOutHist,true);
    PageControl1.ActivePage:=tabCallOut;
  end;
end;

procedure Tf_ReplInit.TBItem109Click(Sender: TObject);
begin
  inherited;
  if not q_CallOut.eof then
  Begin
    replFilter:=true;
    q_CallOutHist.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallOutSITE_SOURCE_RN.AsString+' AND A.SITE_DEST_RN='+q_CallOutSITE_DEST_RN.AsString+' AND A.RN='+q_CallOutRN.AsString;
    f_db.ReQuery(q_CallOutHist,true);
    PageControl1.ActivePage:=tabCallOut;
  end;
end;

procedure Tf_ReplInit.TBItem111Click(Sender: TObject);
begin
  inherited;
  if not q_CallOut.eof then
  Begin
    replFilter:=true;
    q_Call.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallOutSITE_SOURCE_RN.AsString+
                   ' AND A.SITE_DEST_RN='+q_CallOutSITE_DEST_RN.AsString+
                   ' AND A.SCHEMA_RN='+q_CallOutSCHEMA_RN.AsString+
                   ' AND A.SCHEMAROW_RN='+q_CallOutSCHEMAROW_RN.AsString+
                   ' AND A.REPL_RN='+q_CallOutREPL_RN.AsString;
    f_db.ReQuery(q_Call,true);
    q_CallErr.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallOutSITE_SOURCE_RN.AsString+
                      ' AND A.SITE_DEST_RN='+q_CallOutSITE_DEST_RN.AsString+
                      ' AND A.SCHEMA_RN='+q_CallOutSCHEMA_RN.AsString+
                      ' AND A.SCHEMAROW_RN='+q_CallOutSCHEMAROW_RN.AsString+
                      ' AND A.REPL_RN='+q_CallOutREPL_RN.AsString;
    f_db.ReQuery(q_CallErr,true);
    PageControl1.ActivePage:=tabCall;
  end;
end;

procedure Tf_ReplInit.TBItem110Click(Sender: TObject);
begin
  inherited;
  if not q_CallOut.eof then
  Begin
    replFilter:=true;
    q_Call.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallOutSITE_SOURCE_RN.AsString+
                   ' AND A.SITE_DEST_RN='+q_CallOutSITE_DEST_RN.AsString+
                   ' AND A.SCHEMA_RN='+q_CallOutSCHEMA_RN.AsString+
                   ' AND A.SCHEMAROW_RN='+q_CallOutSCHEMAROW_RN.AsString+
                   ' AND A.TABLERN='+q_CallOutTABLERN.AsString;
    f_db.ReQuery(q_Call,true);
    q_CallErr.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallOutSITE_SOURCE_RN.AsString+
                      ' AND A.SITE_DEST_RN='+q_CallOutSITE_DEST_RN.AsString+
                      ' AND A.SCHEMA_RN='+q_CallOutSCHEMA_RN.AsString+
                      ' AND A.SCHEMAROW_RN='+q_CallOutSCHEMAROW_RN.AsString+
                      ' AND A.TABLERN='+q_CallOutTABLERN.AsString;
    f_db.ReQuery(q_CallErr,true);
    PageControl1.ActivePage:=tabCall;
  end;
end;

procedure Tf_ReplInit.TBItem112Click(Sender: TObject);
begin
  inherited;
  if not q_CallOutHist.eof then
  Begin
    replFilter:=true;
    q_CallOut.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallOutHistSITE_SOURCE_RN.AsString+' AND A.SITE_DEST_RN='+q_CallOutHistSITE_DEST_RN.AsString+' AND A.RN='+q_CallOutHistRN.AsString;
    f_db.ReQuery(q_CallOut,true);
    PageControl1.ActivePage:=tabCallOut;
  end;
end;

procedure Tf_ReplInit.TBItem114Click(Sender: TObject);
begin
  inherited;
  if not q_CallOutHist.eof then
  Begin
    replFilter:=true;
    q_Call.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallOutHistSITE_SOURCE_RN.AsString+
                   ' AND A.SITE_DEST_RN='+q_CallOutHistSITE_DEST_RN.AsString+
                   ' AND A.SCHEMA_RN='+q_CallOutHistSCHEMA_RN.AsString+
                   ' AND A.SCHEMAROW_RN='+q_CallOutHistSCHEMAROW_RN.AsString+
                   ' AND A.REPL_RN='+q_CallOutHistREPL_RN.AsString;
    f_db.ReQuery(q_Call,true);
    q_CallErr.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallOutHistSITE_SOURCE_RN.AsString+
                      ' AND A.SITE_DEST_RN='+q_CallOutHistSITE_DEST_RN.AsString+
                      ' AND A.SCHEMA_RN='+q_CallOutHistSCHEMA_RN.AsString+
                      ' AND A.SCHEMAROW_RN='+q_CallOutHistSCHEMAROW_RN.AsString+
                      ' AND A.REPL_RN='+q_CallOutHistREPL_RN.AsString;
    f_db.ReQuery(q_CallErr,true);
    PageControl1.ActivePage:=tabCall;
  end;
end;

procedure Tf_ReplInit.TBItem113Click(Sender: TObject);
begin
  inherited;
  if not q_CallOutHist.eof then
  Begin
    replFilter:=true;
    q_Call.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallOutHistSITE_SOURCE_RN.AsString+
                   ' AND A.SITE_DEST_RN='+q_CallOutHistSITE_DEST_RN.AsString+
                   ' AND A.SCHEMA_RN='+q_CallOutHistSCHEMA_RN.AsString+
                   ' AND A.SCHEMAROW_RN='+q_CallOutHistSCHEMAROW_RN.AsString+
                   ' AND A.TABLERN='+q_CallOutHistTABLERN.AsString;
    f_db.ReQuery(q_Call,true);
    q_CallErr.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallOutHistSITE_SOURCE_RN.AsString+
                      ' AND A.SITE_DEST_RN='+q_CallOutHistSITE_DEST_RN.AsString+
                      ' AND A.SCHEMA_RN='+q_CallOutHistSCHEMA_RN.AsString+
                      ' AND A.SCHEMAROW_RN='+q_CallOutHistSCHEMAROW_RN.AsString+
                      ' AND A.TABLERN='+q_CallOutHistTABLERN.AsString;
    f_db.ReQuery(q_CallErr,true);
    PageControl1.ActivePage:=tabCall;
  end;
end;

procedure Tf_ReplInit.TBItem105Click(Sender: TObject);
begin
  inherited;
  if not q_Call.eof then
  Begin
    replFilter:=true;
    q_Answ.SQL[12]:=' AND A.SITE_SOURCE_RN='+q_CallSITE_SOURCE_RN.AsString+' AND A.SITE_DEST_RN='+q_CallSITE_DEST_RN.AsString+' AND A.CALL_OUT_RN='+q_CallRN.AsString;
    f_db.ReQuery(q_Answ,true);
    PageControl1.ActivePage:=tabAnsw;
  end;
end;

procedure Tf_ReplInit.TBItem107Click(Sender: TObject);
begin
  inherited;
  if not q_Call.eof then
  Begin
    replFilter:=true;
    q_CallErr.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallSITE_SOURCE_RN.AsString+
                      ' AND A.SITE_DEST_RN='+q_CallSITE_DEST_RN.AsString+
                      ' AND A.SCHEMA_RN='+q_CallSCHEMA_RN.AsString+
                      ' AND A.SCHEMAROW_RN='+q_CallSCHEMAROW_RN.AsString+
                      ' AND A.TABLERN='+q_CallTABLERN.AsString;
    f_db.ReQuery(q_CallErr,true);
    PageControl1.ActivePage:=tabCall;
  end;
end;

procedure Tf_ReplInit.TBItem106Click(Sender: TObject);
begin
  inherited;
  if not q_Call.eof then
  Begin
    replFilter:=true;
    q_CallOut.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallSITE_SOURCE_RN.AsString+' AND A.SITE_DEST_RN='+q_CallSITE_DEST_RN.AsString+' AND A.RN='+q_CallRN.AsString;
    f_db.ReQuery(q_CallOut,true);
    q_CallOutHist.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallSITE_SOURCE_RN.AsString+' AND A.SITE_DEST_RN='+q_CallSITE_DEST_RN.AsString+' AND A.RN='+q_CallRN.AsString;
    f_db.ReQuery(q_CallOutHist,true);
    PageControl1.ActivePage:=tabCallOut;
  end;
end;

procedure Tf_ReplInit.TBItem108Click(Sender: TObject);
begin
  inherited;
  if not q_Call.eof then
  Begin
    replFilter:=true;
    q_CallErr.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallSITE_SOURCE_RN.AsString+
                      ' AND A.SITE_DEST_RN='+q_CallSITE_DEST_RN.AsString+
                      ' AND A.SCHEMA_RN='+q_CallSCHEMA_RN.AsString+
                      ' AND A.SCHEMAROW_RN='+q_CallSCHEMAROW_RN.AsString+
                      ' AND A.REPL_RN='+q_CallREPL_RN.AsString;
    f_db.ReQuery(q_CallErr,true);
    PageControl1.ActivePage:=tabCall;
  end;
end;

procedure Tf_ReplInit.TBItem104Click(Sender: TObject);
begin
  inherited;
  if not q_Call.eof then
  Begin
    replFilter:=true;
    q_CallErr.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallSITE_SOURCE_RN.AsString+' AND A.SITE_DEST_RN='+q_CallSITE_DEST_RN.AsString+' AND A.RN='+q_CallRN.AsString;
    f_db.ReQuery(q_CallErr,true);
    PageControl1.ActivePage:=tabCall;
  end;
end;

procedure Tf_ReplInit.TBEditItem6AcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  inherited;
  f_db.FilterAcceptText(gridCallErr,filterCallErr,NewText,Accept);
end;

procedure Tf_ReplInit.TBItem116Click(Sender: TObject);
begin
  inherited;
  f_db.FilterCurrentValue(gridCallErr,filterCallErr);
end;

procedure Tf_ReplInit.TBItem117Click(Sender: TObject);
begin
  inherited;
  f_db.FilterCLear(gridCallErr,filterCallErr);
end;

procedure Tf_ReplInit.TBItem118Click(Sender: TObject);
begin
  inherited;
  f_db.EditInMemo(gridCallErr);
end;

procedure Tf_ReplInit.TBItem119Click(Sender: TObject);
begin
  inherited;
  if not q_CallErr.eof then
  Begin
    replFilter:=true;
    q_Log.SQL[9]:='AND B.SITE_RN='+q_CallErrSITE_DEST_RN.AsString+' AND B.CALL_RN='+q_CallErrRN.AsString;
    f_db.ReQuery(q_Log,true);
    PageControl1.ActivePage:=tabLog;
  end;
end;

procedure Tf_ReplInit.TBItem120Click(Sender: TObject);
begin
  inherited;
  if not q_CallErr.eof then
  Begin
    replFilter:=true;
    q_status.SQL[7]:=' AND A.SITE_SOURCE_RN='+q_CallErrSITE_SOURCE_RN.AsString+
                     ' AND A.SITE_DEST_RN='+q_CallErrSITE_DEST_RN.AsString+
                     ' AND A.SCHEMA_RN='+q_CallErrSCHEMA_RN.AsString+
                     ' AND A.SCHEMAROW_RN='+q_CallErrSCHEMAROW_RN.AsString+
                     ' AND A.REPL_RN='+q_CallErrREPL_RN.AsString;
    f_db.ReQuery(q_Status,true);
    PageControl1.ActivePage:=tabStatus;
  end;
end;

procedure Tf_ReplInit.TBItem121Click(Sender: TObject);
begin
  inherited;
  if not q_CallErr.eof then
  Begin
    replFilter:=true;
    q_status.SQL[7]:=' AND A.SITE_SOURCE_RN='+q_CallErrSITE_SOURCE_RN.AsString+
                     ' AND A.SITE_DEST_RN='+q_CallErrSITE_DEST_RN.AsString+
                     ' AND A.SCHEMA_RN='+q_CallErrSCHEMA_RN.AsString+
                     ' AND A.SCHEMAROW_RN='+q_CallErrSCHEMAROW_RN.AsString+
                     ' AND A.TABLERN='+q_CallErrTABLERN.AsString;
    f_db.ReQuery(q_Status,true);
    PageControl1.ActivePage:=tabStatus;
  end;
end;

procedure Tf_ReplInit.TBItem122Click(Sender: TObject);
begin
  inherited;
  if not q_CallErr.eof then
  Begin
    replFilter:=true;
    q_repl.SQL[8]:=''''+q_CallErrREPL_TABLE.AsString+''' AS REPL_TABLE';
    q_Repl.SQL[9]:='FROM '+q_CallErrREPL_TABLE.AsString+' A ';
    q_repl.SQL[10]:=' WHERE A.REPL_USERNAME='''+q_CallErrREPL_USERNAME.AsString+''''+
                    ' AND A.REPL_TABLENAME='''+q_CallErrREPL_TABLENAME.AsString+''''+
                    ' AND A.REPL_RN='+q_CallErrREPL_RN.AsString;
    f_db.ReQuery(q_Repl,true);
    PageControl1.ActivePage:=tabRepl;
  end;
end;

procedure Tf_ReplInit.TBItem123Click(Sender: TObject);
begin
  inherited;
  if not q_CallErr.eof then
  Begin
    replFilter:=true;
    q_repl.SQL[8]:=''''+q_CallErrREPL_TABLE.AsString+''' AS REPL_TABLE';
    q_Repl.SQL[9]:='FROM '+q_CallErrREPL_TABLE.AsString+' A ';
    q_repl.SQL[10]:=' WHERE A.REPL_USERNAME='''+q_CallErrREPL_USERNAME.AsString+''''+
                    ' AND A.REPL_TABLENAME='''+q_CallErrREPL_TABLENAME.AsString+''''+
                    ' AND A.REPL_TABLERN='+q_CallErrTABLERN.AsString;
    f_db.ReQuery(q_Repl,true);
    PageControl1.ActivePage:=tabRepl;
  end;
end;

procedure Tf_ReplInit.TBItem124Click(Sender: TObject);
begin
  inherited;
  if not q_CallErr.eof then
  Begin
    replFilter:=true;
    q_CallOut.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallErrSITE_SOURCE_RN.AsString+' AND A.SITE_DEST_RN='+q_CallErrSITE_DEST_RN.AsString+' AND A.RN='+q_CallErrRN.AsString;
    f_db.ReQuery(q_CallOut,true);
    q_CallOutHist.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallErrSITE_SOURCE_RN.AsString+' AND A.SITE_DEST_RN='+q_CallErrSITE_DEST_RN.AsString+' AND A.RN='+q_CallErrRN.AsString;
    f_db.ReQuery(q_CallOutHist,true);
    PageControl1.ActivePage:=tabCallOut;
  end;
end;

procedure Tf_ReplInit.TBItem125Click(Sender: TObject);
begin
  inherited;
  if not q_CallErr.eof then
  Begin
    replFilter:=true;
    q_CallOut.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallErrSITE_SOURCE_RN.AsString+
                      ' AND A.SITE_DEST_RN='+q_CallErrSITE_DEST_RN.AsString+
                      ' AND A.SCHEMA_RN='+q_CallErrSCHEMA_RN.AsString+
                      ' AND A.SCHEMAROW_RN='+q_CallErrSCHEMAROW_RN.AsString+
                      ' AND A.REPL_RN='+q_CallErrREPL_RN.AsString;
    f_db.ReQuery(q_CallOut,true);
    q_CallOutHist.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallErrSITE_SOURCE_RN.AsString+
                          ' AND A.SITE_DEST_RN='+q_CallErrSITE_DEST_RN.AsString+
                          ' AND A.SCHEMA_RN='+q_CallErrSCHEMA_RN.AsString+
                          ' AND A.SCHEMAROW_RN='+q_CallErrSCHEMAROW_RN.AsString+
                          ' AND A.REPL_RN='+q_CallErrREPL_RN.AsString;
    f_db.ReQuery(q_CallOutHist,true);
    PageControl1.ActivePage:=tabCallOut;
  end;
end;

procedure Tf_ReplInit.TBItem126Click(Sender: TObject);
begin
  inherited;
  if not q_CallErr.eof then
  Begin
    replFilter:=true;
    q_CallOut.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallErrSITE_SOURCE_RN.AsString+
                      ' AND A.SITE_DEST_RN='+q_CallErrSITE_DEST_RN.AsString+
                      ' AND A.SCHEMA_RN='+q_CallErrSCHEMA_RN.AsString+
                      ' AND A.SCHEMAROW_RN='+q_CallErrSCHEMAROW_RN.AsString+
                      ' AND A.TABLERN='+q_CallErrTABLERN.AsString;
    f_db.ReQuery(q_CallOut,true);
    q_CallOutHist.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallErrSITE_SOURCE_RN.AsString+
                          ' AND A.SITE_DEST_RN='+q_CallErrSITE_DEST_RN.AsString+
                          ' AND A.SCHEMA_RN='+q_CallErrSCHEMA_RN.AsString+
                          ' AND A.SCHEMAROW_RN='+q_CallErrSCHEMAROW_RN.AsString+
                          ' AND A.TABLERN='+q_CallErrTABLERN.AsString;
    f_db.ReQuery(q_CallOutHist,true);
    PageControl1.ActivePage:=tabCallOut;
  end;
end;

procedure Tf_ReplInit.TBItem127Click(Sender: TObject);
begin
  inherited;
  if not q_CallErr.eof then
  Begin
    replFilter:=true;
    q_Call.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallErrSITE_SOURCE_RN.AsString+' AND A.SITE_DEST_RN='+q_CallErrSITE_DEST_RN.AsString+' AND A.RN='+q_CallErrRN.AsString;
    f_db.ReQuery(q_Call,true);
    PageControl1.ActivePage:=tabCall;
  end;
end;

procedure Tf_ReplInit.TBItem128Click(Sender: TObject);
begin
  inherited;
  if not q_CallErr.eof then
  Begin
    replFilter:=true;
    q_Call.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallErrSITE_SOURCE_RN.AsString+
                   ' AND A.SITE_DEST_RN='+q_CallErrSITE_DEST_RN.AsString+
                   ' AND A.SCHEMA_RN='+q_CallErrSCHEMA_RN.AsString+
                   ' AND A.SCHEMAROW_RN='+q_CallErrSCHEMAROW_RN.AsString+
                   ' AND A.REPL_RN='+q_CallErrREPL_RN.AsString;
    f_db.ReQuery(q_Call,true);
    PageControl1.ActivePage:=tabCall;
  end;
end;

procedure Tf_ReplInit.TBItem129Click(Sender: TObject);
begin
  inherited;
  if not q_CallErr.eof then
  Begin
    replFilter:=true;
    q_Call.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_CallErrSITE_SOURCE_RN.AsString+
                   ' AND A.SITE_DEST_RN='+q_CallErrSITE_DEST_RN.AsString+
                   ' AND A.SCHEMA_RN='+q_CallErrSCHEMA_RN.AsString+
                   ' AND A.SCHEMAROW_RN='+q_CallErrSCHEMAROW_RN.AsString+
                   ' AND A.TABLERN='+q_CallErrTABLERN.AsString;
    f_db.ReQuery(q_Call,true);
    PageControl1.ActivePage:=tabCall;
  end;
end;

procedure Tf_ReplInit.TBItem130Click(Sender: TObject);
begin
  inherited;
  if not q_CallErr.eof then
  Begin
    replFilter:=true;
    q_Answ.SQL[12]:=' AND A.SITE_SOURCE_RN='+q_CallErrSITE_SOURCE_RN.AsString+' AND A.SITE_DEST_RN='+q_CallErrSITE_DEST_RN.AsString+' AND A.CALL_OUT_RN='+q_CallErrRN.AsString;
    f_db.ReQuery(q_Answ,true);
    PageControl1.ActivePage:=tabAnsw;
  end;
end;

procedure Tf_ReplInit.TBEditItem7AcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  inherited;
  f_db.FilterAcceptText(gridAnsw,filterAnsw,NewText,Accept);
end;

procedure Tf_ReplInit.TBItem132Click(Sender: TObject);
begin
  inherited;
  f_db.FilterCurrentValue(gridAnsw,filterAnsw);
end;

procedure Tf_ReplInit.TBItem133Click(Sender: TObject);
begin
  inherited;
  f_db.FilterCLear(gridAnsw,filterAnsw);
end;

procedure Tf_ReplInit.TBItem134Click(Sender: TObject);
begin
  inherited;
  f_db.EditInMemo(gridAnsw);
end;

procedure Tf_ReplInit.TBItem135Click(Sender: TObject);
begin
  inherited;
  if not q_Answ.eof then
  Begin
    replFilter:=true;
    q_Log.SQL[9]:='AND B.SITE_RN='+q_AnswSITE_DEST_RN.AsString+' AND B.CALL_RN='+q_AnswRN.AsString;
    f_db.ReQuery(q_Log,true);
    PageControl1.ActivePage:=tabLog;
  end;
end;

procedure Tf_ReplInit.TBItem140Click(Sender: TObject);
begin
  inherited;
  if not q_Answ.eof then
  Begin
    replFilter:=true;
    q_CallOut.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_AnswSITE_SOURCE_RN.AsString+' AND A.SITE_DEST_RN='+q_AnswSITE_DEST_RN.AsString+' AND A.RN='+q_AnswRN.AsString;
    f_db.ReQuery(q_CallOut,true);
    q_CallOutHist.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_AnswSITE_SOURCE_RN.AsString+' AND A.SITE_DEST_RN='+q_AnswSITE_DEST_RN.AsString+' AND A.RN='+q_AnswRN.AsString;
    f_db.ReQuery(q_CallOutHist,true);
    PageControl1.ActivePage:=tabCallOut;
  end;
end;

procedure Tf_ReplInit.TBItem143Click(Sender: TObject);
begin
  inherited;
  if not q_Answ.eof then
  Begin
    replFilter:=true;
    q_Call.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_AnswSITE_SOURCE_RN.AsString+' AND A.SITE_DEST_RN='+q_AnswSITE_DEST_RN.AsString+' AND A.RN='+q_AnswRN.AsString;
    f_db.ReQuery(q_Call,true);
    q_CallErr.SQL[9]:=' AND A.SITE_SOURCE_RN='+q_AnswSITE_SOURCE_RN.AsString+' AND A.SITE_DEST_RN='+q_AnswSITE_DEST_RN.AsString+' AND A.RN='+q_AnswRN.AsString;
    f_db.ReQuery(q_CallErr,true);
    PageControl1.ActivePage:=tabCall;
  end;
end;


// **************************************************************************
// **                             РЕПЛИКАЦИЯ
// **************************************************************************

// Проверка наличия текущего сайта
function Tf_ReplInit.GetCurrent(pMode:integer): boolean;
Begin
  Result:=false;
  q_site_cur.Close;
  q_site_cur.Open;
  if q_site_cur.eof then
  begin
    ReplSession.WriteToLog(pMode,MODULE_NAME,sesError,'Не задан текущий узел репликации!',0,'');
    exit;
  end;
  Result:=true;
End;

// Проверка уникальности сессии
function Tf_ReplInit.CheckLogin(pMode:integer; pPROC_NAME:string; NoLog:boolean): integer;
Begin
  oraSess.Commit;
  Result:=oraPackage.CallIntegerFunction('CHECK_LOGIN',[ReplSession.GetSessionId,pPROC_NAME]);
  if (Result=sesReplActive) then
    ReplSession.WriteToLog(pMode,MODULE_NAME,Result,'Репликация заблокирована или уже запущена!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString)
  else
    if (Result=sesReplNoRepl) then
    Begin
      if not NoLog then
        ReplSession.WriteToLog(pMode,MODULE_NAME,Result,'Пользователь НЕ имеет право запускать репликацию! '+pPROC_NAME,q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString)
    End
    else
      if (Result=sesReplView) then
      Begin
        if not NoLog then
          ReplSession.WriteToLog(pMode,MODULE_NAME,Result,'Пользователь имеет право только на просмотр!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString)
      end
      else
        if Result<=sesError then
          ReplSession.WriteToLog(pMode,MODULE_NAME,Result,'Ошибка при логине!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString);
End;

// Загрузка данных репликации
function Tf_ReplInit.ImportFile(pMode:integer;pType:string;FileSource:string;BoxIn:string;ArhIn:string): integer;
var FileARH,FileLOG,FileDMP,Filename,FileZIP:string;
    ListTables,ImpPath,TmpPath,ZipCmd:string;
    i:integer;s:string;
begin
  inherited;

  Result:=sesError;
  oraSess.Commit;

  // Проверка настроек узла-назначения
  ImpPath:=q_site_cur.FieldByName('IMP_PATH').AsString;
  if ImpPath='' then
  begin
    ReplSession.WriteToLog(pMode,MODULE_NAME,sesError,'Не указана утилита импорта для узла '+q_site_curNAME.AsString+'!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString);
    exit;
  end;
  TmpPath:=F_FileUtils.FillFilePath(q_site_cur.FieldByName('TMP_PATH').AsString,true);
  if TmpPath='' then
  begin
    ReplSession.WriteToLog(pMode,MODULE_NAME,sesError,'Не указан временный каталог для узла '+q_site_curNAME.AsString+'!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString);
    exit;
  end;
  ZipCmd:=q_site_cur.FieldByName('ZIP_CMD').AsString;
  if ZipCmd='' then
  begin
    ReplSession.WriteToLog(pMode,MODULE_NAME,sesError,'Не указан путь к архиватору RAR.EXE для узла '+q_site_curNAME.AsString+'!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString);
    exit;
  end;

  // Имя файла
  Filename:=ExtractFileName(FileSource);
  i:=Pos('.',Filename);
  if i>0 then Filename:=System.Copy(Filename,1,i-1); // Убираем расширение

  FileDMP:=TmpPath+FileName+'.DMP';
  FileLOG:=TmpPath+FileName+'.LOG';
  FileZIP:=FileSource;
  FileARH:=ArhIn+ExtractFileName(FileSource);
  if pType='META' then
    ListTables:=ListMetaTables
  else if pType='ANSW' then ListTables:='REPL_ANSW'
       else ListTables:='REPL_CALL';

  // Разархивируем и переносим во временный каталог
  if not F_FileUtils.ExecAndWait(ZipCmd, 'e -y '+FileZIP+' '+TmpPath,SW_SHOWMINIMIZED,true) then
  begin
    ReplSession.WriteToLog(pMode,MODULE_NAME,sesError,'Ошибка при распаковке файла c данными ('+pType+') репликации '+FileSource+'!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString);
    exit;
  end;
  if not FileExists(FileDMP) then
  begin
    ReplSession.WriteToLog(pMode,MODULE_NAME,sesError,'Ошибка при распаковке файла c данными ('+pType+') репликации '+FileSource+'!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString);
    exit;
  end;

  // Подготавливаемся к загрузке
  if pType='META' then
  Begin
    Result:=oraPackage.CallFloatFunction('START_IMPORT_'+pType,[ReplSession.GetSessionId,q_site_curSITE_RN.AsInteger]);
    if (Result<=sesError) then
    Begin
      ReplSession.WriteToLog(pMode,MODULE_NAME,Result,'Ошибка при подготовке к загрузке данных ('+pType+') репликации!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString);
      if pType='META' then oraPackage.CallFloatFunction('FINISH_IMPORT_META',[ReplSession.GetSessionId,q_site_curSITE_RN.AsInteger]);
      exit;
    end;
  end;

  // Импортируем
  oraSess.Commit;
  s:=oraSess.LogonUsername+'/'+oraSess.LogonPassword+'@'+oraSess.LogonDatabase+
      ' FILE='+FileDMP+
      ' LOG='+FileLOG+
      ' FROMUSER='+ReplName+' TOUSER='+ReplName+
      ' IGNORE=Y TABLES=('+ListTables+')';
  if not F_FileUtils.ExecAndWait(ImpPath,s,SW_SHOWMINIMIZED,true) then
  begin
    ReplSession.WriteToLog(pMode,MODULE_NAME,sesError,'Ошибка при импорте ('+pType+') из '+FileSource+'!: '+ImpPath+' '+s,q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString);
    exit;
  end;

  // Завершаем загрузку
  if pType='META' then
  Begin
    Result:=oraPackage.CallFloatFunction('FINISH_IMPORT_'+pType,[ReplSession.GetSessionId,q_site_curSITE_RN.AsInteger]);
    if (Result<=sesError) then
    Begin
      ReplSession.WriteToLog(pMode,MODULE_NAME,Result,'Ошибка при завершении загрузки данных ('+pType+') репликации!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString);
      exit;
    end;
  end;

  // Удаляем временные файлы
  DeleteFile(FileDMP);
  DeleteFile(FileLOG);

  // Переносим транспортный файл в Архив
  IF ArhIn<>'' then
  Begin
    F_FileUtils.SafeCopyFile(FileZIP,FileARH);
  end;
  DeleteFile(FileZIP);

  Result:=sesOk;
  ReplSession.WriteToLog(pMode,MODULE_NAME,Result,'Импорт файла '+Filename+' завершен!',q_site_curSITE_RN.AsInteger,'');

  oraSess.Commit;
End;

procedure Tf_ReplInit.acReplInitImportMETAExecute(Sender: TObject);
var Filename:string;
    ArhIn,BoxIn:string;
    Result:integer;
begin
  inherited;
  // Проверка login'а
  Result:=CheckLogin(amDefault,'IMPORT_META',false);
  if Result<=sesError then exit;

  // Проверка текущего сайта
  if not GetCurrent(amDefault) then
  Begin
    Result:=sesError;
    exit;
  end;

  if not q_sites.eof then
  if Application.MessageBox(PChar('Загрузить настройки репликации от узла '+q_sitesNAME.AsString+'?'),'Внимание!',MB_YESNO)=IDYES then
  Begin
    // Проверка входящего каталога
    BoxIn:=F_FileUtils.FillFilePath(q_initBOX_IN.AsString,true);
    if BoxIn='' then
    begin
      ReplSession.WriteToLog(amDefault,MODULE_NAME,sesError,'Не указан входящий каталог для узла '+q_sitesNAME.AsString+'!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString);
      exit;
    end;
    // Архив входящего каталога
    ArhIn:=F_FileUtils.FillFilePath(q_initARH_IN.AsString,true);

    Filename:='META_*_'+q_site_cur.FieldByName('SITE_RN').AsString+'_*.RAR';
    OpenDialog1.InitialDir:=BoxIn;
    OpenDialog1.Filter:='Настройки репликации ('+Filename+')|'+Filename+'|RAR-архивы (*.RAR)|*.RAR';
    OpenDialog1.Filename:=Filename;

    // Выбор файла для загрузки
    if OpenDialog1.Execute then
      // Импорт настроек репликации
      ImportFile(amDefault,'META',OpenDialog1.Filename,BoxIn,ArhIn);
  end;
end;

// Выгрузка данных репликации: производится в 2 файла: ответы и запросы
function Tf_ReplInit.ExportFile(pMode:integer;pType:string;SiteDestRN:integer;SiteDestName:string;BoxOut:string;ArhOut:string;All:boolean=true): integer;
var FileARH,FileTMP,FileLOG,FileDMP,Filename,FileZIP:string;
    ListTables,ExpPath,TmpPath,ZipCmd:string;
    vType:string;
    i:integer;
begin
  inherited;
  Result:=sesError;
  oraSess.Commit;

  // Проверка настроек узла-источника
  ExpPath:=q_site_cur.FieldByName('EXP_PATH').AsString;
  if ExpPath='' then
  begin
    ReplSession.WriteToLog(pMode,MODULE_NAME,sesError,'Не указана утилита экспорта для узла '+q_site_curNAME.AsString+'!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString);
    exit;
  end;
  TmpPath:=F_FileUtils.FillFilePath(q_site_cur.FieldByName('TMP_PATH').AsString,true);
  if TmpPath='' then
  begin
    ReplSession.WriteToLog(pMode,MODULE_NAME,sesError,'Не указан временный каталог для узла '+q_site_curNAME.AsString+'!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString);
    exit;
  end;
  ZipCmd:=q_site_cur.FieldByName('ZIP_CMD').AsString;
  if ZipCmd='' then
  begin
    ReplSession.WriteToLog(pMode,MODULE_NAME,sesError,'Не указан путь к архиватору RAR.EXE для узла '+q_site_curNAME.AsString+'!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString);
    exit;
  end;

  for i:=1 to 2 do
  Begin
    vType:=pType;

    if (not All) then
    Begin
      if (i=2) then break; // только ответы
    end;

    if (vType='META') then
    Begin
      if (i=2) then break // Настройки репликации выгружаются в 1 файл
    end
    else if i=1 then vType:='ANSW' else vType:='CALL';

    if vType='META' then
      ListTables:='('+ListMetaTables+')'
    else
      if vType='ANSW' then
        ListTables:='('+ReplName+'.REPL_ANSW) QUERY=\"WHERE site_dest_rn='+q_site_cur.FieldByName('SITE_RN').AsString+' and site_source_rn='+IntToStr(SiteDestRN)+'\" statistics=NONE'
      else
        ListTables:='('+ReplName+'.REPL_CALL) QUERY=\"WHERE site_source_rn='+q_site_cur.FieldByName('SITE_RN').AsString+' and site_dest_rn='+IntToStr(SiteDestRN)+'\" statistics=NONE';

    // Проверяем необходимость выгрузки
    if vType='META' then
      Result:=sesOk
    else
      if vType='CALL' then
        Result:=oraPackage.CallFloatFunction('EXPORT_READY_'+vType,[ReplSession.GetSessionId,q_site_cur.FieldByName('SITE_RN').AsInteger,SiteDestRN])
      else
        Result:=oraPackage.CallFloatFunction('EXPORT_READY_'+vType,[ReplSession.GetSessionId,SiteDestRN,q_site_cur.FieldByName('SITE_RN').AsInteger]);
    if Result<>sesReplRowNotFound then
    Begin
      // Имя файла
      Filename:=vType+'_'+q_site_cur.FieldByName('SITE_RN').AsString+'_'+IntToStr(SiteDestRN)+'_'+VarToStr(oraPackage.CallFloatFunction('GETFILESEQ',[]));

      // Подготавливаемся к выгрузке
      if (vType='META') or (vType='CALL') then
        Result:=oraPackage.CallFloatFunction('START_EXPORT_'+vType,[ReplSession.GetSessionId,q_site_cur.FieldByName('SITE_RN').AsInteger,SiteDestRN,0,Filename])
      else
        Result:=oraPackage.CallFloatFunction('START_EXPORT_'+vType,[ReplSession.GetSessionId,SiteDestRN,q_site_cur.FieldByName('SITE_RN').AsInteger,0,Filename]);
      if (Result<=sesError) then
      Begin
        ReplSession.WriteToLog(pMode,MODULE_NAME,Result,'Ошибка при подготовке к выгрузке данных ('+vType+') репликации!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString);
        if vType='META' then oraPackage.CallFloatFunction('FINISH_EXPORT_META',[ReplSession.GetSessionId,q_site_cur.FieldByName('SITE_RN').AsInteger,SiteDestRN,0,Filename]);
        exit;
      end;

      FileDMP:=TmpPath+FileName+'.DMP';
      FileLOG:=TmpPath+FileName+'.LOG';
      FileTMP:=TmpPath+FileName+'.RAR';
      FileZIP:=BoxOut+FileName+'.RAR';
      FileARH:=ArhOut+FileName+'.RAR';

      // Экспортируем метаданные
      oraSess.Commit;
      if not F_FileUtils.ExecAndWait(ExpPath,
        oraSess.LogonUsername+'/'+oraSess.LogonPassword+'@'+oraSess.LogonDatabase+
        ' FILE='+FileDMP+
        ' LOG='+FileLOG+
        ' TABLES='+ListTables,
        SW_SHOWMINIMIZED,true) then
      begin
        ReplSession.WriteToLog(pMode,MODULE_NAME,sesError,'Ошибка при экспорте данных ('+vType+') репликации для узла '+SiteDestName+'!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString);
        exit;
      end;

      // Архивируем и переносим в исходящий каталог
      if not F_FileUtils.ExecAndWait(ZipCmd, 'a -ep '+FileTMP+' '+FileDMP+' '+FileLOG,SW_SHOWMINIMIZED,true) then
      begin
        ReplSession.WriteToLog(pMode,MODULE_NAME,sesError,'Ошибка при упаковке файла c данными ('+vType+') репликации для узла '+SiteDestName+'!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString);
        exit;
      end;
      F_FileUtils.SafeCopyFile(FileTMP,FileZIP);

      // Переносим транспортный файл в Архив
      IF ArhOut<>'' then
      Begin
        F_FileUtils.SafeCopyFile(FileTMP,FileARH);
      end;

      // Удаляем временные файлы
      DeleteFile(FileDMP);
      DeleteFile(FileLOG);
      DeleteFile(FileTMP);

      // Завершаем выгрузку
      if (vType='META') or (vType='CALL') then
        Result:=oraPackage.CallFloatFunction('FINISH_EXPORT_'+vType,[ReplSession.GetSessionId,q_site_cur.FieldByName('SITE_RN').AsInteger,SiteDestRN,0,Filename])
      else
        Result:=oraPackage.CallFloatFunction('FINISH_EXPORT_'+vType,[ReplSession.GetSessionId,SiteDestRN,q_site_cur.FieldByName('SITE_RN').AsInteger,0,Filename]);
      if (Result<=sesError) then
      Begin
        ReplSession.WriteToLog(pMode,MODULE_NAME,Result,'Ошибка при завершении выгрузки данных ('+vType+') репликации!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString);
        exit;
      end;
    end;
  end;

  Result:=sesOk;
  ReplSession.WriteToLog(pMode,MODULE_NAME,Result,'Экспорт завершен!',q_site_curSITE_RN.AsInteger,'');

  oraSess.Commit;
end;

procedure Tf_ReplInit.acReplInitExportMETAExecute(Sender: TObject);
var BoxOut,ArhOut:string;
    Result:integer;
begin
  inherited;
  // Проверка login'а
  Result:=CheckLogin(amDefault,'EXPORT_META',false);
  if Result<=sesError then exit;

  // Проверка текущего сайта
  if not GetCurrent(amDefault) then
  Begin
    Result:=sesError;
    exit;
  end;

  if not q_sites.eof then
  if Application.MessageBox(PChar('Выгрузить настройки репликации для узла '+q_sitesNAME.AsString+'?'),'Внимание!',MB_YESNO)=IDYES then
  Begin
    // Проверка исходящего каталога
    BoxOut:=F_FileUtils.FillFilePath(q_initBOX_OUT.AsString,true);
    if BoxOut='' then
    begin
      ReplSession.WriteToLog(amDefault,MODULE_NAME,sesError,'Не указан каталог на отправку для узла '+q_sitesNAME.AsString+'!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString);
      exit;
    end;
    // Архив исходящего каталога
    ArhOut:=F_FileUtils.FillFilePath(q_initARH_OUT.AsString,true);

    ExportFile(amDefault,'META',q_sitesRN.AsInteger,q_sitesNAME.AsString,BoxOut,ArhOut,true);
  end;
end;

procedure Tf_ReplInit.acReplInitExecCallOutExecute(Sender: TObject);
var
  vStatus:integer;
begin
  if Application.MessageBox('Сформировать исходящие запросы?','Внимание!',MB_YESNO)=IDYES then
  Begin
    ExecuteRepl(amDefault,'CALL_OUT')
  end;
end;

procedure Tf_ReplInit.acReplInitExportREPLExecute(Sender: TObject);
var vError:integer;
begin
  if Application.MessageBox('Передать через DBLINK / Выгрузить в файл?','Внимание!',MB_YESNO)=IDYES then
  Begin
    ExecuteRepl(amDefault,'EXPORT')
  end;
end;

// Запуск репликации (ОСНОВНАЯ ПРОЦЕДУРА)
function Tf_ReplInit.ExecuteRepl(pMode:integer;pExecMode:string): integer;
var sr: TSearchRec;
    BoxOut,ArhOut,ArhIn,BoxIn:string;
    Filename:string;
    vError:integer;
    ImportExist:boolean;
    FileList:TStringList;
Begin
  // 1. ПРОВЕРКА

  // Проверка текущего сайта
  if not GetCurrent(pMode) then
  Begin
    Result:=sesError;
    exit;
  end;

  FileList:=TStringList.Create; // Список файлов в каталоге
  ImportExist:=false; // Флаг наличия следующего транспортного файла

  repeat
    ImportExist:=false;


    // 2. ИМПОРТ
    if (pExecMode='FULL') or (pExecMode='IMPORT') or (pExecMode='FULL_IMPORT') then
    Begin

      // ******  Загрузка транспортных файлов *****

      // Проверка login'а
      Result:=CheckLogin(pMode,'IMPORT',(pExecMode='FULL') or (pExecMode='FULL_IMPORT') );
      if Result>sesError then
      Begin
        // Перебор активных узлов из активных связей с текущим узлом
        q_inout_sites.Open;
        q_inout_sites.First;
        while not q_inout_sites.Eof do
        Begin
          // Входящий каталог
          BoxIn:=F_FileUtils.FillFilePath(q_inout_sitesBOX_IN.AsString,true);
          if BoxIn='' then
          begin
            Result:=sesError;
            ReplSession.WriteToLog(pMode,MODULE_NAME,sesError,'Не указан входящий каталог для узла '+q_inout_sitesNAME.AsString+'!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString);
            exit;
          end;
          // Архив входящего каталога
          ArhIn:=F_FileUtils.FillFilePath(q_inout_sitesARH_IN.AsString,true);

          // Загружаем ответы
          // Шаблон имени входящего файла с данными репликации
          Filename:='ANSW_*_'+q_site_cur.FieldByName('SITE_RN').AsString+'_*.RAR';

          // Перебор файлов во входящем каталоге - заполнение списка файлов
          FileList.Clear;
          if FindFirst(BoxIn+Filename, faArchive, sr) = 0 then
          repeat
            FileList.Add(sr.Name);
          until FindNext(sr) <> 0;
          FindClose(sr);
          // Сортировка файлов по названию
          FileList.Sort;
          // Загрузка первого файла
          if FileList.Count>0 then
          begin
            // Загружаем данные репликации в буфер
            vError:=ImportFile(pMode,'ANSW',BoxIn+FileList[0],BoxIn,ArhIn);
            if vError<=sesError then
            Begin
              Result:=vError;
              exit;
            end;
            if (FileList.Count>1) then
            Begin
              // Проставляем флаг наличия следующего транспортного файла
              ImportExist:=true;
            end;
          end;

          // Загружаем запросы
          // Шаблон имени входящего файла с данными репликации
          Filename:='CALL_*_'+q_site_cur.FieldByName('SITE_RN').AsString+'_*.RAR';

          // Перебор файлов во входящем каталоге
          FileList.Clear;
          if FindFirst(BoxIn+Filename, faArchive, sr) = 0 then
          repeat
            FileList.Add(sr.Name);
          until FindNext(sr) <> 0;
          FindClose(sr);
          // Сортировка файлов по названию
          FileList.Sort;
          // Загрузка первого файла
          if FileList.Count>0 then
          begin
            // Загружаем данные репликации в буфер
            vError:=ImportFile(pMode,'CALL',BoxIn+FileList[0],BoxIn,ArhIn);
            if vError<=sesError then
            Begin
              Result:=vError;
              exit;
            end;
            if FileList.Count>1 then
            Begin
              // Проставляем флаг наличия следующего транспортного файла
              ImportExist:=true;
            end;
          end;

          q_inout_sites.Next;
        end;
      end;
    end;

    // 3. ОБРАБОТКА ВХОДЯЩИХ ОТВЕТОВ
    IF (pExecMode='FULL') OR (pExecMode='ANSW_IN') or (pExecMode='FULL_IMPORT') then
    Begin
      // Проверка login'а
      Result:=CheckLogin(pMode,'ANSW_IN',(pExecMode='FULL')or (pExecMode='FULL_IMPORT') );
      if Result>sesError then
      Begin
        oraSess.Commit;
        Result:=oraPackage.CallFloatFunction('EXECANSWIN',[ReplSession.GetSessionId]);
        if (Result<=sesError) then
          ReplSession.WriteToLog(pMode,MODULE_NAME,Result,'Ошибка при обработке входящих ответов - смотри журнал!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString)
        else
          if (Result<sesOk) then
            ReplSession.WriteToLog(pMode,MODULE_NAME,Result,'Обработка входящих ответов выполнена, но есть НЕ критические ошибки!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString)
          else
            ReplSession.WriteToLog(pMode,MODULE_NAME,Result,'Обработка входящих ответов выполнена успешно!',q_site_curSITE_RN.AsInteger,'');
      end;
    end;

    // 4. ОБРАБОТКА ВХОДЯЩИХ ЗАПРОСОВ
    IF (pExecMode='FULL') OR (pExecMode='CALL_IN') or (pExecMode='FULL_IMPORT') then
    Begin
      // Проверка login'а
      Result:=CheckLogin(pMode,'CALL_IN',(pExecMode='FULL')or (pExecMode='FULL_IMPORT') );
      if Result>sesError then
      Begin

        oraSess.Commit;
        Result:=oraPackage.CallFloatFunction('EXECCALLIN',[ReplSession.GetSessionId]);
        if (Result<=sesError) then
          ReplSession.WriteToLog(pMode,MODULE_NAME,Result,'Ошибка при обработке входящих запросов - смотри журнал!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString)
        else
          if (Result<sesOk) then
            ReplSession.WriteToLog(pMode,MODULE_NAME,Result,'Обработка входящих запросов выполнена, но есть НЕ критические ошибки!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString)
          else
            ReplSession.WriteToLog(pMode,MODULE_NAME,Result,'Обработка входящих запросов выполнена успешно!',q_site_curSITE_RN.AsInteger,'');

        // 4a. ЭКСПОРТ/ПЕРЕДАЧА ОТВЕТОВ НА ВХОДЯЩИЕ ЗАПРОСЫ
        // Перебор активных узлов из активных связей с текущим узлом
        q_inout_sites.Open;
        q_inout_sites.First;
        while not q_inout_sites.Eof do
        Begin
          Result:=sesOk;
          if q_inout_sitesUSE_DBLINK.AsInteger=1 then // Передача через DBLINK
          Begin
            oraSess.Commit;
            Result:=oraPackage.CallFloatFunction('EXECDBLINK',[ReplSession.GetSessionId,q_inout_sitesSITE_RN.AsInteger]);
            if Result<=sesError then
              ReplSession.WriteToLog(pMode,MODULE_NAME,Result,'Ошибка при отправке через DBLINK!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString)
            else
              if (Result<sesOk) then
                ReplSession.WriteToLog(pMode,MODULE_NAME,Result,'Отправка через DBLINK выполнена, но есть НЕ критические ошибки!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString)
              else
                ReplSession.WriteToLog(pMode,MODULE_NAME,Result,'Отправка через DBLINK выполнена успешно!',q_site_curSITE_RN.AsInteger,'');
          end;
          if (q_inout_sitesUSE_DBLINK.AsInteger=0) OR // Выгрузка в файл
             ((q_inout_sitesDBLINK_ERR_EXP.AsInteger=1) AND (Result<=sesError)) then // Или при ошибке передачи через DBLINK
          Begin
            // Выгрузка транспортных файлов
            // Исходящий каталог
            BoxOut:=F_FileUtils.FillFilePath(q_inout_sitesBOX_OUT.AsString,true);
            if BoxOut='' then
            begin
              Result:=sesError;
              ReplSession.WriteToLog(pMode,MODULE_NAME,sesError,'Не указан исходящий каталог для узла '+q_inout_sitesNAME.AsString+'!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString);
              exit;
            end;
            // Архив исходящего каталога
            ArhOut:=F_FileUtils.FillFilePath(q_inout_sitesARH_OUT.AsString,true);

            // Выгружаем данные репликации из буфера
            vError:=ExportFile(pMode,'REPL',q_inout_sitesSITE_RN.AsInteger,q_inout_sitesNAME.AsString,BoxOut,ArhOut,false);
            if vError<=sesError then Result:=vError;
          end;
          q_inout_sites.Next;
        end;
        oraSess.Commit;
        q_inout_sites.Close;
      end;
    end;

  until not ImportExist;

  // 5. ФОРМИРОВАНИЕ ИСХОДЯЩИХ ЗАПРОСОВ
  IF (pExecMode='FULL') OR (pExecMode='CALL_OUT')or (pExecMode='FULL_EXPORT')  then
  Begin
    // Проверка login'а
    Result:=CheckLogin(pMode,'CALL_OUT',(pExecMode='FULL')or (pExecMode='FULL_EXPORT') );
    if Result>sesError then
    Begin
      oraSess.Commit;
      Result:=oraPackage.CallFloatFunction('EXECCALLOUT',[ReplSession.GetSessionId]);
      if (Result<=sesError) then
        ReplSession.WriteToLog(pMode,MODULE_NAME,Result,'Ошибка при формировании исходящих запросов - смотри журнал!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString)
      else
        if (Result<sesOk) then
          ReplSession.WriteToLog(pMode,MODULE_NAME,Result,'Формирование исходящих запросов выполнено, но есть НЕ критические ошибки!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString)
        else
          ReplSession.WriteToLog(pMode,MODULE_NAME,Result,'Формирование исходящих запросов выполнено успешно!',q_site_curSITE_RN.AsInteger,'');
    end;
  end;

  // --. ПОВТОРНАЯ ОТПРАВКА ИСХОДЯЩИХ ЗАПРОСОВ
  IF (pExecMode='RESEND_CALL_OUT') then
  Begin
    // Проверка login'а
    Result:=CheckLogin(pMode,'RESEND_CALL_OUT',false);
    if Result>sesError then
    Begin
      oraSess.Commit;
      Result:=oraPackage.CallFloatFunction('EXECRESENDCALLOUT',[ReplSession.GetSessionId]);
      if (Result<=sesError) then
        ReplSession.WriteToLog(pMode,MODULE_NAME,Result,'Ошибка при повторной отправке исходящих запросов - смотри журнал!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString)
      else
        if (Result<sesOk) then
          ReplSession.WriteToLog(pMode,MODULE_NAME,Result,'Повторная отправка исходящих запросов выполнено, но есть НЕ критические ошибки!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString)
        else
          ReplSession.WriteToLog(pMode,MODULE_NAME,Result,'Повторная отправка исходящих запросов выполнено успешно!',q_site_curSITE_RN.AsInteger,'');
    end;
  end;

  // --. ПЕРФОРМИРОВАТЬ ОШИБОЧНЫЕ ИСХОДЯЩИЕ ЗАПРОСЫ
  IF (pExecMode='REFORM_BAD') then
  Begin
    // Проверка login'а
    Result:=CheckLogin(pMode,'REFORM_BAD',false);
    if Result>sesError then
    Begin
      oraSess.Commit;
      Result:=oraPackage.CallFloatFunction('EXECREFORMBAD',[ReplSession.GetSessionId]);
      if (Result<=sesError) then
        ReplSession.WriteToLog(pMode,MODULE_NAME,Result,'Ошибка при переформировании ошибочных исходящих запросов - смотри журнал!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString)
      else
        if (Result<sesOk) then
          ReplSession.WriteToLog(pMode,MODULE_NAME,Result,'Переформирование ошибочных исходящих запросов выполнено, но есть НЕ критические ошибки!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString)
        else
          ReplSession.WriteToLog(pMode,MODULE_NAME,Result,'Переформирование ошибочных исходящих запросов выполнено успешно!',q_site_curSITE_RN.AsInteger,'');
    end;
  end;

  // 5а. ЭКСПОРТ/ПЕРЕДАЧА ИСХОДЯЩИХ ЗАПРОСОВ
  IF (pExecMode='FULL') OR (pExecMode='EXPORT') or (pExecMode='FULL_EXPORT') then
  Begin
    // Проверка login'а
    Result:=CheckLogin(pMode,'EXPORT',(pExecMode='FULL') or (pExecMode='FULL_EXPORT') );
    if Result>sesError then
    Begin
      // Перебор активных узлов из активных связей с текущим узлом
      q_inout_sites.Open;
      q_inout_sites.First;
      while not q_inout_sites.Eof do
      Begin
        Result:=sesOk;
        if q_inout_sitesUSE_DBLINK.AsInteger=1 then // Передача через DBLINK
        Begin
          oraSess.Commit;
          Result:=oraPackage.CallFloatFunction('EXECDBLINK',[ReplSession.GetSessionId,q_inout_sitesSITE_RN.AsInteger]);
          if Result<=sesError then
            ReplSession.WriteToLog(pMode,MODULE_NAME,Result,'Ошибка при отправке через DBLINK!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString)
          else
            if (Result<sesOk) then
              ReplSession.WriteToLog(pMode,MODULE_NAME,Result,'Отправка через DBLINK выполнена, но есть НЕ критические ошибки!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString)
            else
              ReplSession.WriteToLog(pMode,MODULE_NAME,Result,'Отправка через DBLINK выполнена успешно!',q_site_curSITE_RN.AsInteger,'');
        end;
        if (q_inout_sitesUSE_DBLINK.AsInteger=0) OR // Выгрузка в файл
           ((q_inout_sitesDBLINK_ERR_EXP.AsInteger=1) AND (Result<=sesError)) then // Или при ошибке передачи через DBLINK
        Begin
          // Выгрузка транспортных файлов
          // Исходящий каталог
          BoxOut:=F_FileUtils.FillFilePath(q_inout_sitesBOX_OUT.AsString,true);
          if BoxOut='' then
          begin
            Result:=sesError;
            ReplSession.WriteToLog(pMode,MODULE_NAME,sesError,'Не указан исходящий каталог для узла '+q_inout_sitesNAME.AsString+'!',q_site_curSITE_RN.AsInteger,q_site_curEMAIL_ADMIN.AsString);
            exit;
          end;
          // Архив исходящего каталога
          ArhOut:=F_FileUtils.FillFilePath(q_inout_sitesARH_OUT.AsString,true);

          // Выгружаем данные репликации из буфера
          vError:=ExportFile(pMode,'REPL',q_inout_sitesSITE_RN.AsInteger,q_inout_sitesNAME.AsString,BoxOut,ArhOut,true);
          if vError<=sesError then Result:=vError;
        end;
        q_inout_sites.Next;
      end;
      oraSess.Commit;
      q_inout_sites.Close;
    end;
  end;

  FileList.Clear;
  FileList.Free;
  oraSess.Commit;
  q_site_cur.Close;
End;


procedure Tf_ReplInit.acReplInitImportREPLExecute(Sender: TObject);
var vStatus:integer;
begin
  inherited;
  if Application.MessageBox('Загрузить транспортные файлы?','Внимание!',MB_YESNO)=IDYES then
  Begin
    // Проверка буфера запросов на наличие входящих запросов
    vStatus:=oraPackage.CallFloatFunction('EXECUTE_READY_CALL',[ReplSession.GetSessionId]);
    if vStatus<>sesReplRowNotFound then
    Begin
      // Выполним процедуру репликации для очистки буфера входящих запросов
      ExecuteRepl(amDefault,'CALL_IN')
    end;
    ExecuteRepl(amDefault,'IMPORT')
  end;
end;

procedure Tf_ReplInit.acReplInitExecAnswInExecute(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Обработать входящие ответы?','Внимание!',MB_YESNO)=IDYES then
  Begin
    ExecuteRepl(amDefault,'ANSW_IN')
  end;
end;

procedure Tf_ReplInit.acReplInitExecCallInExecute(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Обработать входящие запросы?','Внимание!',MB_YESNO)=IDYES then
  Begin
    ExecuteRepl(amDefault,'CALL_IN')
  end;
end;

procedure Tf_ReplInit.acReplInitExecFULLExecute(Sender: TObject);
var vStatus:integer;
begin
  inherited;
  if Application.MessageBox('Выполнить репликацию?','Внимание!',MB_YESNO)=IDYES then
  Begin
    // Проверка буфера запросов на наличие входящих запросов
    vStatus:=oraPackage.CallFloatFunction('EXECUTE_READY_CALL',[ReplSession.GetSessionId]);
    if vStatus<>sesReplRowNotFound then
    Begin
      // Выполним процедуру репликации для очистки буфера входящих запросов
      ExecuteRepl(amDefault,'CALL_IN')
    end;
    ExecuteRepl(amDefault,'FULL')
  end;
end;

// =============================================================================================

end.
