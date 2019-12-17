unit AllRep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, RxLookup, MdiForm, StdCtrls, ComCtrls,
  Buttons, ExtCtrls, ADODB, Grids, DBGrids, DBCtrls, Mask, DBCtrlsEh,
  DBLookupEh,DateUtils, DBGridEh, ToolEdit, GridsEh;

type
  Tf_Rep = class(Tf_MDIForm)
    ora_Session: TOracleSession;
    ds_rep: TDataSource;
    GroupBox2: TGroupBox;
    GroupBox1: TGroupBox;
    ado_conn: TADOConnection;
    q_cmn: TADOQuery;
    gb_TipRep: TGroupBox;
    ds_rep_grp: TDataSource;
    q_reports: TOracleDataSet;
    q_report_groups: TOracleDataSet;
    ll_reports: TDBLookupListBox;
    lc_ReportGroups: TDBLookupComboboxEh;
    ParamPages: TPageControl;
    tabFIN_SNP: TTabSheet;
    tabMAIN: TTabSheet;
    tabADD: TTabSheet;
    tabEMPTY: TTabSheet;
    rg_Source: TRadioGroup;
    rg_ProdUsl: TRadioGroup;
    rg_Days: TRadioGroup;
    gb_TipDate: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Time_Beg: TDateTimePicker;
    Time_End: TDateTimePicker;
    q_ProdGr: TOracleDataSet;
    q_ProdGrID_NPR: TStringField;
    q_ProdGrNAME_NPR: TStringField;
    q_Prod: TOracleDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    q_Plat: TOracleDataSet;
    q_PlatID: TIntegerField;
    q_PlatSHORT_NAME: TStringField;
    q_poluch: TOracleDataSet;
    IntegerField1: TIntegerField;
    StringField3: TStringField;
    q_stan: TOracleDataSet;
    q_stanID: TFloatField;
    q_stanSTAN_NAME: TStringField;
    ds_ProdGr: TDataSource;
    ds_Prod: TDataSource;
    ds_Plat: TDataSource;
    ds_poluch: TDataSource;
    ds_Load_Type: TDataSource;
    q_Nazn_Otg: TOracleDataSet;
    q_Nazn_OtgID: TIntegerField;
    q_Nazn_OtgNAZN_OTG_NAME: TStringField;
    ds_Nazn_Otg: TDataSource;
    q_Load_Type: TOracleDataSet;
    q_Load_TypeID: TIntegerField;
    q_Load_TypeTYPE_OTGR_NAME: TStringField;
    ds_stan: TDataSource;
    rg_Prod: TRadioGroup;
    lc_ProdGr: TRxDBLookupCombo;
    lc_Prod: TRxDBLookupCombo;
    gb_Other: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    lc_plat: TRxDBLookupCombo;
    lc_Poluch: TRxDBLookupCombo;
    lc_Stan: TRxDBLookupCombo;
    lc_Load_type: TRxDBLookupCombo;
    lc_Nazn_Otg: TRxDBLookupCombo;
    lc_Otpr: TRxDBLookupCombo;
    Label6: TLabel;
    rg_FromWho: TRadioGroup;
    q_otpr: TOracleDataSet;
    ds_otpr: TDataSource;
    Panel1: TPanel;
    btRep: TBitBtn;
    q_otprID: TFloatField;
    q_otprSHORT_NAME: TStringField;
    Label11: TLabel;
    lc_Tex_pd: TRxDBLookupCombo;
    q_tex_pd: TOracleDataSet;
    ds_tex_pd: TDataSource;
    tabTRAFFIC: TTabSheet;
    Label21: TLabel;
    q_Tel: TOracleDataSet;
    ds_Tel: TDataSource;
    q_TelINSIDE_NUMBER: TStringField;
    q_TelFIO: TStringField;
    lc_Tel: TRxDBLookupCombo;
    Label22: TLabel;
    lc_Sobstv: TRxDBLookupCombo;
    q_Sobstv: TOracleDataSet;
    IntegerField2: TIntegerField;
    StringField4: TStringField;
    ds_Sobstv: TDataSource;
    q_rep_param: TOracleDataSet;
    ds_rep_param: TDataSource;
    q_Region: TOracleDataSet;
    ds_Region: TDataSource;
    q_RegionID: TIntegerField;
    q_RegionREGION_NAME: TStringField;
    tabDIAGRAM: TTabSheet;
    q_DiagramKind: TOracleDataSet;
    ds_DiagramKind: TDataSource;
    Panel2: TPanel;
    Label5: TLabel;
    Label14: TLabel;
    Label20: TLabel;
    ed_Nom_zd: TEdit;
    ed_Dog: TEdit;
    ed_CatCen: TEdit;
    lc_Region: TRxDBLookupCombo;
    gridDiagramKind: TDBGridEh;
    q_rep_tip_dates: TOracleDataSet;
    ds_rep_tip_dates: TDataSource;
    q_proc_param: TOracleDataSet;
    ds_proc_param: TDataSource;
    q_rep_tags: TOracleDataSet;
    ds_rep_tags: TDataSource;
    ora_Package: TOraclePackage;
    q_ProdGrKons: TOracleDataSet;
    ds_ProdGrKons: TDataSource;
    q_ProdKons: TOracleDataSet;
    ds_ProdKons: TDataSource;
    q_ProdGrKonsID_GR: TStringField;
    q_ProdGrKonsNAME: TStringField;
    q_ProdKonsNAME: TStringField;
    q_Orgstru_fil: TOracleDataSet;
    ds_Orgstru_fil: TDataSource;
    q_Orgstru_azc: TOracleDataSet;
    ds_Orgstru_azc: TDataSource;
    tabKons: TTabSheet;
    rg_prodKons: TRadioGroup;
    lc_ProdGrKons: TRxDBLookupCombo;
    lc_ProdKons: TRxDBLookupCombo;
    gb_OtherKons: TGroupBox;
    Label13: TLabel;
    lc_Orgstru_fil: TRxDBLookupCombo;
    Label15: TLabel;
    LC_ORGSTRU_AZC: TRxDBLookupCombo;
    lc_tip_op_kons: TRxDBLookupCombo;
    Label16: TLabel;
    q_tip_op_kons: TOracleDataSet;
    ds_tip_op_kons: TDataSource;
    lc_Org_kind_grp: TRxDBLookupCombo;
    Label17: TLabel;
    q_org_kind_grp: TOracleDataSet;
    ds_org_kind_grp: TDataSource;
    ParusLogon: TOracleLogon;
    ora_Parus: TOracleSession;
    ParusProc: TOracleQuery;
    q_parus_proc_param: TOracleDataSet;
    Label18: TLabel;
    Label12: TLabel;
    Label19: TLabel;
    Date_ree: TDateTimePicker;
    Label23: TLabel;
    Date_plan: TDateTimePicker;
    cb_tipdate: TComboBox;
    Date_Beg: TDateTimePicker;
    Date_End: TDateTimePicker;
    q_ProdKonsID: TFloatField;
    TabParus: TTabSheet;
    Label24: TLabel;
    lc_filial_parus: TRxDBLookupCombo;
    q_filial_parus: TOracleDataSet;
    ds_filial_parus: TDataSource;
    Label25: TLabel;
    GRAFIK_FROM: TDateTimePicker;
    GRAFIK_TO: TDateTimePicker;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    lc_Exped: TRxDBLookupCombo;
    q_Exped: TOracleDataSet;
    ds_Exped: TDataSource;
    q_ExpedID: TIntegerField;
    q_ExpedSHORT_NAME: TStringField;
    Label29: TLabel;
    lc_vagowner: TRxDBLookupCombo;
    q_VagOwner: TOracleDataSet;
    ds_vagOwner: TDataSource;
    q_VagOwnerID: TFloatField;
    q_VagOwnerVAGOWNER_NAME: TStringField;
    q_rep_tip_datesID: TFloatField;
    q_rep_tip_datesREP_KIND: TStringField;
    q_rep_tip_datesSORTBY: TFloatField;
    q_rep_tip_datesTIP_DATE: TStringField;
    q_rep_tip_datesDEF_TIP: TIntegerField;
    q_rep_tip_datesDEF_BEG_VAL: TStringField;
    q_rep_tip_datesDEF_END_VAL: TStringField;
    q_rep_tip_datesVIEW_TIME: TIntegerField;
    is_crt: TCheckBox;
    q_Orgstru_filID: TFloatField;
    q_Orgstru_filNAME: TStringField;
    q_Orgstru_azcID: TFloatField;
    q_Orgstru_azcNAME: TStringField;
    q_org_kind_grpID: TFloatField;
    q_org_kind_grpNAME: TStringField;
    q_tip_op_konsID: TFloatField;
    q_tip_op_konsNAME: TStringField;
    q_parus_proc_paramID: TFloatField;
    q_parus_proc_paramREPORTS_ID: TFloatField;
    q_parus_proc_paramPARAM_NAME: TStringField;
    q_parus_proc_paramPARAM_ORDER: TFloatField;
    q_parus_proc_paramPARAM_VISIBLE: TIntegerField;
    q_parus_proc_paramPROC_PARAM_NAME: TStringField;
    q_parus_proc_paramPROC_PARAM_ORDER: TFloatField;
    q_parus_proc_paramMASTER_TAG: TStringField;
    q_parus_proc_paramPARUS_PROC_PARAM_NAME: TStringField;
    q_parus_proc_paramPARUS_PROC_PARAM_ORDER: TFloatField;
    q_DiagramKindID: TFloatField;
    q_DiagramKindTAG: TStringField;
    q_DiagramKindDIAGRAM_TYPE: TStringField;
    q_DiagramKindNAME: TStringField;
    q_DiagramKindSORTBY: TFloatField;
    q_DiagramKindICON_NUM: TIntegerField;
    q_proc_paramID: TFloatField;
    q_proc_paramREPORTS_ID: TFloatField;
    q_proc_paramPARAM_NAME: TStringField;
    q_proc_paramPARAM_ORDER: TFloatField;
    q_proc_paramPARAM_VISIBLE: TIntegerField;
    q_proc_paramPROC_PARAM_NAME: TStringField;
    q_proc_paramPROC_PARAM_ORDER: TFloatField;
    q_proc_paramMASTER_TAG: TStringField;
    q_proc_paramPARUS_PROC_PARAM_NAME: TStringField;
    q_proc_paramPARUS_PROC_PARAM_ORDER: TFloatField;
    q_rep_tagsNAME: TStringField;
    q_rep_tagsINFO: TStringField;
    q_rep_tagsOWNER_TAB: TStringField;
    q_rep_tagsQUERY_NAME: TStringField;
    q_rep_paramID: TFloatField;
    q_rep_paramREPORTS_ID: TFloatField;
    q_rep_paramPARAM_NAME: TStringField;
    q_rep_paramPARAM_ORDER: TFloatField;
    q_rep_paramPARAM_VISIBLE: TIntegerField;
    q_rep_paramPROC_PARAM_NAME: TStringField;
    q_rep_paramPROC_PARAM_ORDER: TFloatField;
    q_rep_paramMASTER_TAG: TStringField;
    q_rep_paramPARUS_PROC_PARAM_NAME: TStringField;
    q_rep_paramPARUS_PROC_PARAM_ORDER: TFloatField;
    q_reportsREPORT_FILE: TStringField;
    q_reportsID: TFloatField;
    q_reportsREPORT_NAME: TStringField;
    q_reportsREPORT_GROUP: TStringField;
    q_reportsSORTBY: TIntegerField;
    q_reportsPARAM1: TStringField;
    q_reportsIS_MSSQL: TIntegerField;
    q_reportsCOPY_FILE: TStringField;
    q_reportsREPORT_TYPE: TStringField;
    q_reportsDIAGRAM_TYPE: TStringField;
    q_reportsDIAGRAM_KIND: TStringField;
    q_reportsAXES_X_NAME: TStringField;
    q_reportsCOUNT_COLS_X: TIntegerField;
    q_reportsAXES_Y_NAME: TStringField;
    q_reportsCOUNT_COLS_Y: TIntegerField;
    q_reportsPROC_PACKET: TStringField;
    q_reportsPROC_NAME: TStringField;
    q_reportsDEF_BEG_VAL: TStringField;
    q_reportsDEF_END_VAL: TStringField;
    q_reportsDEF_BEG_TIME: TStringField;
    q_reportsDEF_END_TIME: TStringField;
    q_reportsVIEW_TIME: TIntegerField;
    q_reportsTIP_DATE: TStringField;
    q_reportsPARUS_PROC: TStringField;
    q_reportsREP_FORM: TStringField;
    q_reportsASK_RUN_PROC: TIntegerField;
    q_reportsASK_RUN_TEXT: TStringField;
    q_filial_parusSDEP_READY: TStringField;
    q_filial_parusFILIAL_ID: TFloatField;
    q_tex_pdID: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btRepClick(Sender: TObject);
    procedure lc_ReportGroupsChange(Sender: TObject);
    procedure cb_tipdateChange(Sender: TObject); // Действия при смене типа даты
    procedure rg_ProdClick(Sender: TObject);
    procedure q_reportsAfterScroll(DataSet: TDataSet);
    procedure rg_prodKonsClick(Sender: TObject);
    procedure lc_Orgstru_filChange(Sender: TObject);
    procedure lc_Org_kind_grpChange(Sender: TObject);
    procedure Date_BegChange(Sender: TObject);
    procedure Date_EndChange(Sender: TObject);
  private
    { Private declarations }
    IS_VIP:boolean;
    REP_KIND:string;
    VIEW_TIME:boolean;
    TipRepId:string;
    ManualDate:boolean;

    procedure OpenTable(pTableName:string); // Открытие таблицы;
    procedure AllReVisi; // Скрытие/открытие полей;
    function GetParamValueByTAG(TagName:string):string; //Возвращает значение параметра по ТЕГУ (из таблицы REPORT_TAGS)
    procedure SetVisiTab(NameTab:string); // Сделать видимой страницу параметров
  public
    { Public declarations }
  end;

var
  f_Rep: Tf_Rep;
  RepKind: string;
  IsVIP:boolean;

implementation

uses ForReport, OraToDbf, ForFiles, ForDB, ForTemp,SQLReport,
  ForSystem, RepDbf, main, SutReeList, u_repvoz;

{$R *.dfm}

procedure Tf_Rep.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  q_reports.Close;
  ora_session.LogOff;
  ado_conn.Close;
  Action:=caFree;
end;

procedure Tf_Rep.OpenTable(pTableName:string);
var vTableName:string;
begin
  vTableName:=AnsiUpperCase(pTableName);
  if vTableName='Q_PLAT' then f_db.ReQuery(q_Plat,false);
  if vTableName='Q_STAN' then f_db.ReQuery(q_Stan,false);
  if vTableName='Q_PRODGR' then f_db.ReQuery(q_ProdGr,false);
  if vTableName='Q_PROD' then f_db.ReQuery(q_prod,false);
  if vTableName='Q_PRODGRKONS' then f_db.ReQuery(q_ProdGrKons,false);
  if vTableName='Q_PRODKONS' then f_db.ReQuery(q_prodKons,false);
  if vTableName='Q_POLUCH' then f_db.ReQuery(q_poluch,false);
  if vTableName='Q_REGION' then f_db.ReQuery(q_Region,false);
  if vTableName='Q_LOAD_TYPE' then f_db.ReQuery(q_Load_Type,false);
  if vTableName='Q_NAZN_OTG' then f_db.ReQuery(q_Nazn_Otg,false);
  if vTableName='Q_OTPR' then f_db.ReQuery(q_Otpr,false);
  if vTableName='Q_EXPED' then f_db.ReQuery(q_Exped,false);
  if vTableName='Q_VAGOWNER' then f_db.ReQuery(q_VagOwner,false);
  if vTableName='Q_TEX_PD' then f_db.ReQuery(q_Tex_Pd,false);
  if vTableName='Q_SOBSTV' then f_db.ReQuery(q_Sobstv,false);
  if vTableName='Q_TEL' then f_db.ReQuery(q_Tel,false);
  if vTableName='Q_ORGSTRU_AZC' then f_db.ReQuery(q_orgstru_azc,false);
  if vTableName='Q_ORGSTRU_FIL' then f_db.ReQuery(q_orgstru_fil,false);
  if vTableName='Q_TIP_OP_KONS' then f_db.ReQuery(q_tip_op_kons,false);
  if vTableName='Q_ORG_KIND_GRP' then f_db.ReQuery(q_org_kind_grp,false);
  if vTableName='Q_FILIAL_PARUS' then f_db.ReQuery(q_filial_parus,false);
end;

procedure Tf_Rep.FormCreate(Sender: TObject);
var DateIndex,DateCnt:integer;
begin
  ManualDate:=false;
  IS_VIP:=IsVIP;
  REP_KIND:=RepKind;
  gridDiagramKind.Columns[0].ImageList:=f_main.img_Common;

  // Открыть сессию
  f_db.LogonMasterSession(ora_Session);

  ADO_Conn.Close;
  ADO_Conn.Connected:=True;

  // Открыть таблицы
  q_report_groups.SQL[4]:='REP_KIND='''+REP_KIND+'''';
  f_db.ReQuery(q_report_groups,false);
  q_rep_tip_dates.SQL[2]:='WHERE REP_KIND='''+REP_KIND+'''';
  f_db.ReQuery(q_rep_tip_dates,false);
  f_db.ReQuery(q_rep_tags,false);
  lc_ReportGroups.KeyValue:=q_report_groups.FieldByName('REPORT_GROUP').AsString;

  f_db.ReQuery(q_DiagramKind,false);

  // Значения по умолчанию
  Time_Beg.Time:=StrToTime('00:00:00');
  Time_End.Time:=StrToTime('00:00:00');
  Date_Beg.Date:=StartOfTheMonth(Date);
  Date_End.Date:=Date;
  Date_ree.Date:=Date+1;
  Date_plan.Date:=StartOfTheMonth(Date);
  Grafik_from.Date:=StartOfTheMonth(Date);
  Grafik_to.Date:=DateOf(Date)+1;
  VIEW_TIME:=false;
  DateIndex:=0;

  // Виды дат
  cb_tipdate.Items.Clear;
  DateCnt:=0;
  with q_rep_tip_dates do
  Begin
    First;
    while not Eof do
    Begin
      DateCnt:=DateCnt+1;
      cb_tipdate.Items.Add(FieldByName('TIP_DATE').AsString);
      if FieldByName('DEF_TIP').AsInteger=1 then
      Begin
        DateIndex:=DateCnt-1;
      End;
      Next;
    End;
  End;
  if DateCnt=0 then
  Begin
    cb_tipdate.Items.Add('Дата');
  End;
  cb_tipdate.ItemIndex:=DateIndex;
  cb_tipdateChange(Sender);
end;

// Значение параметра по ТЕГУ
function Tf_Rep.GetParamValueByTAG(TagName:string):string;
var i:integer;
Begin
  if TagName='IS_AGENT' then
  Begin
    GetParamValueByTAG:=TipRepId;
    exit;
  End;

  if TagName='DATE_BEG' then
  Begin
    If VIEW_TIME then
      GetParamValueByTAG:=FormatDateTime('dd.mm.yyyy',Date_Beg.Date)+' '+FormatDateTime('hh:nn',Time_Beg.Time)
    else
      GetParamValueByTAG:=FormatDateTime('dd.mm.yyyy',Date_Beg.Date);
    exit;
  End;

  if TagName='DATE_END' then
  Begin
    If VIEW_TIME then
      GetParamValueByTAG:=FormatDateTime('dd.mm.yyyy',Date_End.Date)+' '+FormatDateTime('hh:nn',Time_End.Time)
    else
      GetParamValueByTAG:=FormatDateTime('dd.mm.yyyy',Date_End.Date);
    exit;
  End;

  if TagName='DATE_REE' then
  Begin
    GetParamValueByTAG:=FormatDateTime('dd.mm.yyyy',Date_ree.Date);
    exit;
  End;

  if TagName='DATE_PLAN' then
  Begin
    GetParamValueByTAG:=FormatDateTime('dd.mm.yyyy',StartOfTheMonth(Date_plan.Date));
    exit;
  End;

  if TagName='GRAFIK_FROM' then
  Begin
    GetParamValueByTAG:=FormatDateTime('dd.mm.yyyy',Grafik_from.Date);
    exit;
  End;

  if TagName='GRAFIK_TO' then
  Begin
    GetParamValueByTAG:=FormatDateTime('dd.mm.yyyy',Grafik_to.Date);
    exit;
  End;

  if TagName='LC_PRODGR' then
  Begin
    if rg_Prod.ItemIndex=1 then
      GetParamValueByTAG:=lc_ProdGr.Value
    else
      GetParamValueByTAG:='*';
    exit;
  End;

   if TagName='IS_CRT' then
   Begin
    if is_crt.Checked then
      GetParamValueByTAG:='1'
    else
      GetParamValueByTAG:='0';
    exit;
  End;

  if TagName='LC_PRODGRKONS' then
  Begin
    if rg_ProdKons.ItemIndex=1 then
      GetParamValueByTAG:=lc_ProdGrKons.Value
    else
      GetParamValueByTAG:='*';
    exit;
  End;

  if TagName='LC_PROD' then
  Begin
    if rg_Prod.ItemIndex=2 then
      GetParamValueByTAG:=lc_Prod.Value
    else
      GetParamValueByTAG:='*';
    exit;
  End;

  if TagName='LC_PRODKONS' then
  Begin
    if rg_ProdKons.ItemIndex=2 then
      GetParamValueByTAG:=lc_ProdKons.Value
    else
      GetParamValueByTAG:='*';
    exit;
  End;

  if TagName='ED_CATCEN' then
  try
    if ed_CatCen.text='' then
      GetParamValueByTAG:='*'
    else
      GetParamValueByTAG:=IntToStr(StrToInt(ed_CatCen.Text));
    exit;
  except
    GetParamValueByTAG:='*';
    exit;
  end;

  if TagName='RG_FROMWHO' then
  Begin
    if rg_FromWho.ItemIndex=0 then
      GetParamValueByTAG:='LUK'
    else
      GetParamValueByTAG:='SNP';
    exit;
  End;

  if TagName='LC_TEL' then
  Begin
    GetParamValueByTAG:=Trim(lc_Tel.Value)+'%';
    exit;
  End;

  GetParamValueByTAG:='*';
  for I:= 0 to Self.ComponentCount-1 do
  begin
    if (AnsiUpperCase(Self.Components[I].Name)=TagName) and
       (Self.Components[I] is TControl) then
    Begin
      if Self.Components[I] is TComboBox then
      Begin
        GetParamValueByTAG:=IntToStr(TComboBox(Self.Components[I]).ItemIndex);
        exit;
      End;
      if Self.Components[I] is TRXDBLookupCombo then
      Begin
        GetParamValueByTAG:=TRXDBLookupCombo(Self.Components[I]).Value;
        exit;
      End;
      if Self.Components[I] is TEdit then
      Begin
        GetParamValueByTAG:=Trim(TEdit(Self.Components[I]).Text)+'%';
        exit;
      End;
      exit;
    End;
  end;
End;

procedure Tf_Rep.btRepClick(Sender: TObject);
var Proc_i,i: integer;
  ErrStr,Proc_s,Zpt,s:String;
  RepFileName:string;
  RepFileExt:string;
  FName:string;
  Count_i:integer;
  Param_i:integer;
  ProcParam: array of Variant;
  Save_Cursor: TCursor;
  IsRunProc,ExecuteParusProc: boolean;
  AskText,RepForm:string;
begin
  ExecuteParusProc:=false;
  If VarType(ll_reports.KeyValue)<>varNull Then // Если отчет выбран
  Begin

    // Очистка параметров в специальной таблице MASTER_REPORTS
    ora_package.PackageName:='FOR_TEMP';
    ora_package.CallProcedure('EMPTY_REPORT_PARAM_VALUE',['pREP_ID',q_reports.FieldByName('ID').AsInteger]);

    IsRunProc:=true;
    if q_reports.FieldByName('ASK_RUN_PROC').AsInteger=1 then
    Begin
      // Необходио запросить пользователя о запуске процедуры
      AskText:=q_reports.FieldByName('ASK_RUN_TEXT').AsString;
      if AskText='' then AskText:='Запустить процедуру подготовки данных?';
      IsRunProc:=(MessageDlg(AskText,mtConfirmation, [mbYes, mbNo], 0) = mrYes);
    end;

    If IsRunProc then
    begin
      { Logon к Parus'у }
      if q_reports.FieldByName('PARUS_PROC').AsString<>'' then
      Begin
        ExecuteParusProc := ParusLogon.Execute;
        if not ExecuteParusProc then
        begin
          MessageDlg('Введите правильно имя пользователя ПАРУС и пароль!',mtError,[mbOk],0);
          exit;
        end;
      end;
    end;

    { УСТАРЕВШЕЕ - файл для передачи параметров в отчет }
    F_FileUtils.SafeCopyFile(f_main.MasterDBFPath+'from_to.dbf','C:\TMP\from_to.dbf');
    F_DB.EmptyADOTable(ado_conn,'"C:\TMP\from_to.dbf"',false);
    q_cmn.SQL.Clear;
    with q_cmn do
    try
      s:='INSERT INTO "c:\tmp\from_to.dbf" (from_date,to_date,is_agent,param1) VALUES('+
          FormatDateTime('"{"mm"/"dd"/"yyyy"}"',Date_Beg.Date)+','+
          FormatDateTime('"{"mm"/"dd"/"yyyy"}"',Date_End.Date)+','+
          TipRepId+','+
          ''''+q_reports.FieldByName('Param1').AsString+''')';
      q_cmn.Close;
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add(s);
      q_cmn.ExecSQL;
    except
    end;

    RepFileName:=AnsiUpperCase(Trim(ll_reports.KeyValue));
    RepFileExt:=ExtractFileExt(RepFilename);

    { Сохранить параметры во временные переменные}
    with TempVari do
    begin
      SetVariNum('REP_ID',q_reports.FieldByName('ID').AsInteger,APPLICATION_NAME,RepFileName); // ID отчета
      SetVariDate('BEGIN_DATE',DateOf(Date_Beg.Date),APPLICATION_NAME,RepFileName); // С даты
      SetVariDate('END_DATE',DateOf(Date_End.Date),APPLICATION_NAME,RepFileName);  // По дату
      SetVariChar('BEGIN_TIME',FormatDateTime('hh:nn',Time_Beg.Time),APPLICATION_NAME,RepFileName); // С даты
      SetVariChar('END_TIME',FormatDateTime('hh:nn',Time_End.Time),APPLICATION_NAME,RepFileName);  // По дату
      SetVariNum('FROM_PARUS',rg_Source.ItemIndex,APPLICATION_NAME,RepFileName); // 1 - Данные из ПАРУСА; 0 - из компл. "ФИНАНСЫ"
      SetVariNum('VIEW_PROD',rg_ProdUsl.ItemIndex,APPLICATION_NAME,RepFileName); // 1 - Выделить продукт; 0 - общей суммой
      SetVariNum('VIEW_DAYS',rg_Days.ItemIndex,APPLICATION_NAME,RepFileName); // 1 - Разбить по дням; 0-нарастающим итогом
      SetVariChar('DIAGRAM_KIND',q_DiagramKind.FieldByName('TAG').asString,APPLICATION_NAME,RepFileName); // Вид диаграммы

      if q_filial_parus.Active and (VarType(lc_filial_parus.KeyValue)<>varNull) then
      Begin
        SetVariNum('FILIAL_ID',q_filial_parus.FieldByName('FILIAL_ID').asInteger,APPLICATION_NAME,RepFileName); // ID филиала
      end;

      with q_rep_param do
      Begin
        First;
        while not eof do
        Begin
          SetVariChar(q_rep_param.FieldByName('PARAM_NAME').AsString,
             GetParamValueByTAG(q_rep_param.FieldByName('MASTER_TAG').AsString),APPLICATION_NAME,RepFileName);
          Next;
        End;
      end;
    End;

    // Перенос параметров в специальную таблицу MASTER_REPORTS
    ora_package.PackageName:='FOR_TEMP';
    ora_package.CallProcedure('SET_REPORT_PARAM_VALUE',['pREP_ID',q_reports.FieldByName('ID').AsInteger]);

    { Передать параметры в процедуру Parus'а и выполнить}
    If IsRunProc then
    begin
      if ExecuteParusProc then
      with q_parus_proc_param do
      begin
        ParusProc.SQL.Clear;
        ParusProc.SQL.Add('BEGIN');
        Proc_s:='';
        Zpt:='';
        First;
        Proc_i:=0;
        while not eof do
        Begin
          if q_parus_proc_param.FieldByName('PARUS_PROC_PARAM_NAME').AsString<>'' then
          Begin
            Proc_i:=Proc_i+1;
            Proc_s:=Proc_s+zpt+''''+GetParamValueByTAG(q_parus_proc_param.FieldByName('MASTER_TAG').AsString)+'''';
            zpt:=',';
          End;
          Next;
        End;
        if Proc_s<>'' then
          Proc_s:=q_reports.FieldByName('PARUS_PROC').AsString+'('+Proc_s+');'
        else
          Proc_s:=q_reports.FieldByName('PARUS_PROC').AsString+';';
        ParusProc.SQL.Add('  '+Proc_s);
        ParusProc.SQL.Add('END;');
        Screen.Cursor := crHourGlass;
        ParusProc.Execute;
      end;
      Screen.Cursor := crDefault;
    end;

    { Передать параметры в процедуру Master'а и выполнить}
    If IsRunProc then
    begin
      if q_reports.FieldByName('PROC_NAME').AsString<>'' then
      with q_proc_param do
      begin
        ora_package.PackageName:=q_reports.FieldByName('PROC_PACKET').AsString;
        First;
        Proc_i:=0;
        while not eof do
        Begin
          if q_proc_param.FieldByName('PROC_PARAM_NAME').AsString<>'' then
          Begin
            Proc_i:=Proc_i+1;
            SetLength(ProcParam, Proc_i*2);
            ProcParam[Proc_i*2-2]:=q_proc_param.FieldByName('PROC_PARAM_NAME').AsString;
            ProcParam[Proc_i*2-1]:=GetParamValueByTAG(q_proc_param.FieldByName('MASTER_TAG').AsString);
          End;
          Next;
        End;
        Screen.Cursor := crHourGlass;
        ora_package.CallProcedure(q_reports.FieldByName('PROC_NAME').AsString,ProcParam);
      end;
      Screen.Cursor := crDefault;
    end;

    { Запустить отчет и передать в него параметры}
    if q_reports.FieldByName('REP_FORM').AsString<>'' then
    Begin
      // Запуск специальной формы
      RepForm:=AnsiUpperCase(Trim(q_reports.FieldByName('REP_FORM').AsString));
      If RepForm='F_REP_DBF' then
      Begin
        // Отчеты по отгрузке на экспорт для отсылки в DBF и Excel
        RepDbf.ReportId:=q_reports.FieldByName('ID').AsInteger;
        with tf_Rep_Dbf.Create(Self) do
        Begin
          FormStyle:=fsMDIChild;
        end;
      End;
      If RepForm='F_SUTREELIST' then
      Begin
        // Суточный реестр заданий
        SutReeList.gReportId:=q_reports.FieldByName('ID').AsInteger;
        with tf_SutReeList.Create(Self) do
        Begin
          FormStyle:=fsMDIChild;
        end;
      End;
      If RepForm='F_REPVOZ' then
      Begin
        // Акты по отстою
        U_RepVoz.gReportId:=q_reports.FieldByName('ID').AsInteger;
        with tf_RepVoz.Create(Self) do
        Begin
          FormStyle:=fsMDIChild;
        end;
      End;
    End
    Else
    Begin
      // Запуск отчета
      If RepFileExt='.RPT' Then
      Begin
        F_FileUtils.SafeCopyFile(f_main.MasterRPTPath+RepFileName,f_main.TempNetPath+RepFileName);

        {Voice если отчет не ORACLE, а MSSQL}
        if q_reports.FieldByName('IS_MSSQL').AsInteger=1 then
        begin
          with TF_ForReportSQL.Create(f_main) do
          begin
            Caption:=ll_reports.SelectedItem;
            Crpe.ReportName:=f_main.TempNetPath+RepFileName;
            for i := (Crpe.Subreports.Count-1) downto 0 do
            begin
              Crpe.ParamFields[0+i*1].CurrentValue := trim(FormatDateTime('mm',Date_Beg.Date));
            end;
            Crpe.Execute;
          end;
        end
        else
        {end Voice}
        with TF_ForReport.Create(f_main) do
        begin
          Caption:=ll_reports.SelectedItem;
          Crpe.ReportName:=f_main.TempNetPath+RepFileName;
          for i := (Crpe.Subreports.Count-1) downto 0 do
          begin
            with q_rep_param do
            Begin
              First;
              Param_i:=0;
              Count_i:=q_rep_param.RecordCount+1;
              while not eof do
              Begin
                if q_rep_param.FieldByName('PARAM_NAME').AsString<>'' then
                Begin
                  Crpe.ParamFields[Param_i+i*Count_i].CurrentValue := GetParamValueByTAG(q_rep_param.FieldByName('MASTER_TAG').AsString);
                  Param_i:=Param_i+1;
                end;
                Next;
              end;
              Crpe.ParamFields[Param_i+i*Count_i].CurrentValue := '*';
            end;
          end;
          Crpe.Execute;
        end;
      end;

      If RepFileExt='.XLS' Then
      Begin
        F_FileUtils.SafeCopyFile(f_main.MasterXLSPath+RepFileName,f_main.TempNetPath+RepFileName);
        if q_reports.FieldByName('COPY_FILE').AsString<>'' then
        begin
          FName:=ExtractFileName(q_reports.FieldByName('COPY_FILE').AsString);
          F_FileUtils.SafeCopyFile(q_reports.FieldByName('COPY_FILE').AsString,f_main.TempNetPath+FName);
        end;
        try
          F_FileUtils.ExecAndWait(f_main.TempNetPath+RepFileName,'',SW_SHOWMAXIMIZED,false);
        except
        end;
      end;
    end
  end
  else
    MessageDlg('Не выбран отчет!',mtError,[mbOk],0);

end;

procedure Tf_Rep.lc_ReportGroupsChange(Sender: TObject);
var TIP_REP:string;
begin
  inherited;
  If VarType(lc_ReportGroups.KeyValue)<>varNull Then
  Begin
    TIP_REP:=lc_ReportGroups.KeyValue;
    If TIP_REP='FIN_KOMIS' Then TipRepId:='0'
    else
      If TIP_REP='FIN_AGENT' Then TipRepId:='1'
      else TipRepId:='2';
    Caption:=lc_ReportGroups.Text;
    with q_reports do
    try
      Close;
      try
        SQL[8]:=' report_group='''+TIP_REP+'''';
        If IS_VIP then SQL[9]:=' AND IS_VIP=1 '
        else SQL[9]:=' AND 1 = 1 ';
        f_db.ReQuery(q_reports,false);
      except
        SQL[8]:=' 1 = 1 ';
        SQL[9]:=' AND 1 = 1 ';
        f_db.ReQuery(q_reports,false);
      end;
    finally
    End;
  end;

end;

procedure Tf_Rep.cb_tipdateChange(Sender: TObject);
var BegVal,EndVal:string;
    BegTime,EndTime:string;
begin
  inherited;
  // Действия при смене типа даты
  if q_rep_tip_dates.Active then
  Begin
    ManualDate:=false;
    cb_tipdate.Refresh;
    if q_rep_tip_dates.Locate('TIP_DATE',cb_tipdate.Text,[]) then
      VIEW_TIME:=(q_rep_tip_dates.FieldByName('VIEW_TIME').AsInteger=1)
    else
      VIEW_TIME:=false;

    BegVal:=AnsiUpperCase(q_rep_tip_dates.FieldByName('DEF_BEG_VAL').asString);
    EndVal:=AnsiUpperCase(q_rep_tip_dates.FieldByName('DEF_END_VAL').asString);
    BegTime:='00:00:00';
    EndTime:='00:00:00';
    if NOT q_reports.Eof then
    Begin
      if q_reports.FieldByName('DEF_BEG_VAL').AsString<>'' then
        BegVal:=AnsiUpperCase(q_reports.FieldByName('DEF_BEG_VAL').asString);
      if q_reports.FieldByName('DEF_END_VAL').AsString<>'' then
        EndVal:=AnsiUpperCase(q_reports.FieldByName('DEF_END_VAL').asString);
      if q_reports.FieldByName('DEF_BEG_TIME').AsString<>'' then
        BegTime:=AnsiUpperCase(q_reports.FieldByName('DEF_BEG_TIME').asString)
      else
        BegTime:='00:00:00';
      if q_reports.FieldByName('DEF_END_TIME').AsString<>'' then
        EndTime:=AnsiUpperCase(q_reports.FieldByName('DEF_END_TIME').asString)
      else
        EndTime:='00:00:00';
      if NOT q_reports.FieldByName('VIEW_TIME').IsNull then
        View_TIME:=(q_reports.FieldByName('VIEW_TIME').AsInteger=1);
      if (q_reports.FieldByName('TIP_DATE').AsString<>'') then
        cb_tipdate.Text:=q_reports.FieldByName('TIP_DATE').AsString
      else
        cb_Tipdate.Text:=cb_tipdate.Items[cb_tipdate.ItemIndex];
    End;

    if VIEW_TIME and Date_Beg.Visible then
    Begin
      Time_Beg.Visible:=true;
    end
    else
    Begin
      Time_Beg.Visible:=false;
    end;

    if VIEW_TIME and Date_End.Visible then
    Begin
      Time_End.Visible:=true;
    end
    else
    Begin
      Time_End.Visible:=false;
    end;

    Time_End.Time:=F_ForSystem.DecodeTimeFormula(EndTime);
    Time_Beg.Time:=F_ForSystem.DecodeTimeFormula(BegTime);
    Date_End.Date:=F_ForSystem.DecodeDateFormula(EndVal,Date);
    Date_Beg.Date:=F_ForSystem.DecodeDateFormula(BegVal,Date_End.Date);
  end;
end;

procedure Tf_Rep.rg_ProdClick(Sender: TObject);
begin
  inherited;
  if rg_Prod.ItemIndex=1 then
  Begin
    lc_ProdGr.Enabled:=True;
  End
  else
  Begin
    lc_ProdGr.Enabled:=False;
  End;

  if rg_Prod.ItemIndex=2 then
  Begin
    lc_Prod.Enabled:=True;
  End
  else
  Begin
    lc_Prod.Enabled:=False;
  End;
end;

// Отобразить/скрыть поля для ввода параметров отчета
procedure Tf_Rep.AllReVisi;
var i:integer;
    IsVisi:boolean;
    TagName:string;
Begin
  // Скрыть PAGES
  for i:=0 to ParamPages.PageCount-1 do
  Begin
    ParamPages.Pages[i].TabVisible:=false;
  End;
  tabEMPTY.TabVisible:=true;
  ParamPages.ActivePage:=tabEMPTY;

  rg_Prod.Visible:=false;
  rg_ProdKons.Visible:=false;
  with q_rep_tags do
  Begin
    First;
    while not eof do
    Begin
      TagName:=AnsiUpperCase(FieldByName('NAME').AsString);
      IsVisi:=q_rep_param.locate('MASTER_TAG',TagName,[]);
      If IsVisi then
      Begin
        OpenTable(q_rep_tags.FieldByName('QUERY_NAME').AsString);
        IsVisi:=q_rep_param.FieldByName('PARAM_VISIBLE').AsInteger=1;
      end;
      for I:= 0 to Self.ComponentCount-1 do
      begin
        if (AnsiUpperCase(Self.Components[I].Name)=TagName) and
           (Self.Components[I] is TControl) then
        Begin
          TControl(Self.Components[I]).Visible:=IsVisi;
          // Видимые TAB'ы
          if IsVisi then
            SetVisiTab(q_rep_tags.FieldByName('OWNER_TAB').AsString);
          if IsVisi AND ((TagName='LC_PROD') or (TagName='LC_PRODGR')) then
            rg_Prod.Visible:=true;
          if IsVisi AND ((TagName='LC_PRODKONS') or (TagName='LC_PRODGRKONS')) then
            rg_ProdKons.Visible:=true;
        End;
      end;
      Next;
    end;
  end;

  // Убираем лишние TLabel
  for I:= 0 to Self.ComponentCount-1 do
  if (Self.Components[I] is TLabel) then
  begin
    TLabel(Self.Components[I]).Visible:=true;
    if (TLabel(Self.Components[I]).FocusControl<>nil) then
      if (NOT TLabel(Self.Components[I]).FocusControl.Visible) then
        TLabel(Self.Components[I]).Visible:=false;
  end;

  // Видимые TAB'ы
  SetVisiTab(q_report_groups.FieldByName('VIEW_TAB').AsString);


End;

procedure Tf_Rep.q_reportsAfterScroll(DataSet: TDataSet);
begin
  inherited;

  // Параметры отчета
  with q_rep_param do
  Begin
    Close;
    SQL[2]:='where reports_id='+q_reports.FieldByName('ID').AsString;
    f_db.ReQuery(q_rep_param,false);
  End;

  // Параметры процедуры
  with q_proc_param do
  Begin
    Close;
    SQL[2]:='where reports_id='+q_reports.FieldByName('ID').AsString;
    f_db.ReQuery(q_proc_param,false);
  End;

  // Параметры процедуры из ПАРУСА
  with q_parus_proc_param do
  Begin
    Close;
    SQL[2]:='where reports_id='+q_reports.FieldByName('ID').AsString;
    f_db.ReQuery(q_parus_proc_param,false);
  End;

  // Виды диаграмм
  if q_reports.FieldByName('REPORT_TYPE').AsString='DIAGRAM' then
  with q_DiagramKind do
  Begin
    Close;
    SQL[2]:='WHERE DIAGRAM_TYPE='''+q_reports.FieldByName('DIAGRAM_TYPE').AsString+'''';
    f_db.ReQuery(q_DiagramKind,false);
  End;

  // Отобразить поля для ввода параметров
  if q_rep_tags.Active then AllReVisi;

  If NOT ManualDate Then
  Begin
    Time_Beg.Time:=StrToTime('00:00:00');
    Time_End.Time:=StrToTime('00:00:00');

    if NOT q_reports.Eof then
      if (q_reports.FieldByName('DEF_BEG_VAL').AsString<>'') or
         ((q_reports.FieldByName('VIEW_TIME').AsInteger=1)<>Time_Beg.Visible) or
         (q_reports.FieldByName('TIP_DATE').AsString<>cb_tipdate.Text) or
         (q_reports.FieldByName('DEF_END_VAL').AsString<>'') or
         (q_reports.FieldByName('DEF_BEG_TIME').AsString<>'') or
         (q_reports.FieldByName('DEF_END_TIME').AsString<>'') then cb_tipdateChange(Self);
  end
  else
  Begin
    if q_rep_tip_dates.active then
    Begin
      if q_rep_tip_dates.Locate('TIP_DATE',cb_tipdate.Text,[]) then
        VIEW_TIME:=(q_rep_tip_dates.FieldByName('VIEW_TIME').AsInteger=1)
      else
        VIEW_TIME:=false;
    end;
    if NOT q_reports.FieldByName('VIEW_TIME').IsNull then
      View_TIME:=(q_reports.FieldByName('VIEW_TIME').AsInteger=1);

    if VIEW_TIME and Date_Beg.Visible then
    Begin
      Time_Beg.Visible:=true;
    end
    else
    Begin
      Time_Beg.Visible:=false;
    end;

    if VIEW_TIME and Date_End.Visible then
    Begin
      Time_End.Visible:=true;
    end
    else
    Begin
      Time_End.Visible:=false;
    end;
  end;
end;


procedure Tf_Rep.SetVisiTab(NameTab:string);
Begin
  if NameTab='TAB_ADD' Then
  Begin
    tabEMPTY.TabVisible:=false;
    tabADD.TabVisible:=true;
    ParamPages.ActivePage:=tabADD;
  End;

  if NameTab='TAB_MAIN' Then
  Begin
    tabEMPTY.TabVisible:=false;
    tabMAIN.TabVisible:=true;
    ParamPages.ActivePage:=tabMAIN;
  End;

  if NameTab='TAB_KONS' Then
  Begin
    tabEMPTY.TabVisible:=false;
    tabKONS.TabVisible:=true;
    ParamPages.ActivePage:=tabKONS;
  End;

  if NameTab='TAB_PARUS' Then
  Begin
    tabEMPTY.TabVisible:=false;
    tabPARUS.TabVisible:=true;
    ParamPages.ActivePage:=tabPARUS;
  End;

  if NameTab='TAB_DIAGRAM' Then
  Begin
    tabEMPTY.TabVisible:=false;
    tabDIAGRAM.TabVisible:=true;
    ParamPages.ActivePage:=tabDIAGRAM;
  End;

  if NameTab='TAB_FIN_SNP' Then
  Begin
    tabEMPTY.TabVisible:=false;
    tabFIN_SNP.TabVisible:=true;
    ParamPages.ActivePage:=tabFIN_SNP;
  End;

  if NameTab='TAB_TRAFFIC' Then
  Begin
    tabEMPTY.TabVisible:=false;
    tabTRAFFIC.TabVisible:=true;
    ParamPages.ActivePage:=tabTRAFFIC;
  End;

End;

procedure Tf_Rep.rg_prodKonsClick(Sender: TObject);
begin
  inherited;
  if rg_ProdKons.ItemIndex=1 then
  Begin
    lc_ProdGrKons.Enabled:=True;
  End
  else
  Begin
    lc_ProdGrKons.Enabled:=False;
  End;

  if rg_ProdKons.ItemIndex=2 then
  Begin
    lc_ProdKons.Enabled:=True;
  End
  else
  Begin
    lc_ProdKons.Enabled:=False;
  End;
end;

procedure Tf_Rep.lc_Orgstru_filChange(Sender: TObject);
begin
  inherited;
  q_orgstru_azc.Close;
  if lc_orgstru_fil.Visible and (lc_orgstru_fil.Value<>'*') then
    q_orgstru_azc.SQL[2]:='AND A.id IN (SELECT org_stru_1_id FROM ORG_RELATIONS WHERE org_stru_2_id='+q_orgstru_fil.FieldByName('ID').AsString+')'
  else
    q_orgstru_azc.SQL[2]:='AND 1=1';
  f_db.ReQuery(q_orgstru_azc,false);
end;

procedure Tf_Rep.lc_Org_kind_grpChange(Sender: TObject);
begin
  inherited;
  q_orgstru_azc.Close;
  if lc_org_kind_grp.Visible and (lc_org_kind_grp.Value<>'*') then
  Begin
    q_orgstru_azc.SQL[3]:='AND KLS_ORG_KIND.GROUP_KIND_ID='+q_org_kind_grp.FieldByName('ID').AsString;
    lc_orgstru_azc.DisplayEmpty:='<Все '+q_org_kind_grp.FieldByName('NAME').AsString+'>';
  end
  else
  Begin
    q_orgstru_azc.SQL[3]:='AND 1=1';
    lc_orgstru_azc.DisplayEmpty:='<Все подразделения>';
  End;
  f_db.ReQuery(q_orgstru_azc,false);
end;

procedure Tf_Rep.Date_BegChange(Sender: TObject);
begin
  inherited;
  ManualDate:=true;
end;

procedure Tf_Rep.Date_EndChange(Sender: TObject);
begin
  inherited;
  ManualDate:=true;
end;

end.
