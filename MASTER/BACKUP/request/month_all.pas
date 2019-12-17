unit month_all;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, Grids, DBGridEh, ExtCtrls, ActnList,
  StdCtrls, Buttons, XPStyleActnCtrls, ActnMan, ComCtrls, RxLookup,MdiForm,DateUtils,DBGridEhImpExp,
  OleServer, ExcelXP, TB2Item, TB2Dock, TB2Toolbar, DBCtrls, Mask,
  DBCtrlsEh, Menus, Math;//,Word_TLB;

const
  Plan_Fin='SELECT SUM(plan_ves) as plan_ves FROM'+
           '(SELECT /* План УНП */'+
           '  Plan_periods.Date_plan,Plan_post.Planstru_id,  plan_post.Prod_id_npr,  Plan_post.plan_ves '+
           ' FROM Plan_post,Plan_periods '+
           ' WHERE Plan_post.Plan_per_id = Plan_periods.ID '+
           '  AND Plan_post.Plan_id = 1 /* Рабочий план */ '+
           '  AND Plan_periods.Date_plan = :Date_plan '+
           ' UNION ALL '+
           ' SELECT /* План внешних поставщиков */ '+
           '  Plan_post_svod.Date_plan,Plan_post_svod.Planstru_id, plan_post_svod.Prod_id_npr, Plan_post_svod.ves as plan_ves '+
           ' FROM Plan_post_svod '+
           ' WHERE Plan_post_svod.Supplier_id <>8 /* Все поставщики кроме ЛУКОЙЛ-УНП */ '+
           ' AND Plan_post_svod.Date_plan = :Date_plan '+
           ') PP,v_Kls_planstru_snp,'+
           '( SELECT Link_id_Npr FROM v_prod_linked_grp_4 WHERE fact_id_npr = :Kls_prod_id) Prods '+
           'WHERE PP.Planstru_id = v_Kls_planstru_snp.ID '+
           'AND v_Kls_planstru_snp.ID<>97 /* План по ЛУКОЙЛ-СНП без отгрузки на хранение */'+
           'AND DECODE (v_Kls_planstru_SNP.Region_id, 21, 40, 31) = :Orgstru_id '+
           'AND PP.Prod_id_npr = Prods.Link_Id_npr '+
           'AND v_Kls_planstru_snp.Parent_id<>218 ';
  Plan_Parus='SELECT SUM(ves) AS PLAN_VES '+
             'FROM PLAN_REALIZ '+
             'WHERE PLAN_REALIZ.Date_plan=:Date_Plan '+
             '  AND PLAN_REALIZ.Org_stru_id=:orgstru_id '+
             '  AND PLAN_REALIZ.PARUS_NOMEN=:parus_nomen_rn '+
             '  AND PLAN_REALIZ.PARUS_NOMMODIF=:parus_modif_rn';

type
  TfrmMonthAll = class(Tf_MDIForm)
    oraSes: TOracleSession;
    oraMonth_all: TOracleDataSet;
    dsMonth: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    grMonth: TDBGridEh;
    acManagerZakaz: TActionManager;
    acRequestConsumerRefresh: TAction;
    acRequestConsumerAdd: TAction;
    cbPredpr: TRxDBLookupCombo;
    oraKls_predpr: TOracleDataSet;
    dsPredpr: TDataSource;
    cbProd: TRxDBLookupCombo;
    oraKls_prod: TOracleDataSet;
    dsProd: TDataSource;
    Label3: TLabel;
    Label1: TLabel;
    oraMonth_allINPUT_DATE: TDateTimeField;
    oraMonth_allINPUT_NUMBER: TStringField;
    oraMonth_allDATE_DOG: TDateTimeField;
    oraMonth_allREQUEST: TFloatField;
    oraMonth_allDATE_PLAN: TDateTimeField;
    oraMonth_allIS_WORK: TFloatField;
    oraMonth_allPRICH: TStringField;
    oraMonth_allID: TFloatField;
    oraMonth_allKLS_DOG_ID: TFloatField;
    oraMonth_allD_PLAN: TStringField;
    oraMonth_allKLS_PREDPR_ID: TFloatField;
    oraMonth_allKLS_PROD_ID: TFloatField;
    oraMonth_allSTAN_ID: TFloatField;
    oraMonth_allGR4: TStringField;
    oraMonth_allPAYFORM_ID: TFloatField;
    oraMonth_allLOAD_ABBR: TStringField;
    oraMonth_allPOLUCH_ID: TFloatField;
    oraMonth_allPOTREB_ID: TFloatField;
    oraMonth_allVETKA_ID: TFloatField;
    oraPayform: TOracleDataSet;
    oraKls_dog: TOracleDataSet;
    oraPlat: TOracleDataSet;
    oraKls_stan: TOracleDataSet;
    oraVidOtgr: TOracleDataSet;
    oraVetka: TOracleDataSet;
    oraPotreb: TOracleDataSet;
    oraPoluch: TOracleDataSet;
    oraProd: TOracleDataSet;
    oraMonth_allPlat: TStringField;
    oraMonth_allprod: TStringField;
    oraMonth_allStan: TStringField;
    oraMonth_allPayForm: TStringField;
    oraMonth_allLoad: TStringField;
    oraMonth_allpoluch: TStringField;
    oraMonth_allpotreb: TStringField;
    oraMonth_allvetka: TStringField;
    acRequestConsumerDel: TAction;
    acRequestConsumerPost: TAction;
    oraMonth_allDog: TStringField;
    oraMonth_allINN: TStringField;
    acRequestConsumerExportXls: TAction;
    oraUslOpl: TOracleDataSet;
    oraMonth_allUSL_OPL_ID: TFloatField;
    oraMonth_allUslOpl: TStringField;
    oraOrg_Stru: TOracleDataSet;
    dsOrg_Stru: TDataSource;
    orgStru: TOracleDataSet;
    oraMonth_allPRICE: TFloatField;
    oraMonth_allORGSTRU_ID: TFloatField;
    oraMonth_allorgstru: TStringField;
    oraMonth_allPOLUCH_NAME: TStringField;
    oraMonth_allPOTREB_NAME: TStringField;
    Label2: TLabel;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    acRequestConsumerEdit: TAction;
    Label4: TLabel;
    edDateTo: TDateTimePicker;
    Label5: TLabel;
    edDateFrom: TDateTimePicker;
    Label6: TLabel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    cbOrgStru: TRxDBLookupCombo;
    oraPlanOther: TOracleDataSet;
    dsPlanOther: TDataSource;
    oraPlanNB: TOracleDataSet;
    dsPlanNB: TDataSource;
    oraSaldo: TOracleDataSet;
    dsSaldo: TDataSource;
    gbInfo: TGroupBox;
    lbDolgName: TLabel;
    lbPlanNB: TLabel;
    Label10: TLabel;
    lbPlanProdName: TLabel;
    edPlanNB: TDBText;
    lbDogKind: TLabel;
    oraMonth_allDOG_NUMBER: TStringField;
    DBText4: TDBText;
    acRequestConsumerCopy: TAction;
    BitBtn2: TBitBtn;
    oraQIns: TOracleQuery;
    rbTransitGD: TRadioButton;
    rbSAM: TRadioButton;
    oraMonth_allPARUS_AGENT_RN: TFloatField;
    oraMonth_allPARUS_AGENT_NAME: TStringField;
    oraMonth_allPARUS_DOGOVOR: TStringField;
    oraMonth_allPARUS_NOMEN_RN: TFloatField;
    oraMonth_allPARUS_MODIF_RN: TFloatField;
    oraMonth_allPARUS_MODIF_NAME: TStringField;
    oraMonth_allAPPL_TAG: TStringField;
    oraMonth_allPARUS_MODIF_TAG: TStringField;
    Label9: TLabel;
    ed_Dog: TEdit;
    rbMB: TRadioButton;
    oraPackage: TOraclePackage;
    acRequestConsumerLoadParus: TAction;
    Button1: TButton;
    lbDogovor: TLabel;
    oraMonth_allIS_REQUESTED: TFloatField;
    oraMonth_allEXECUTED: TFloatField;
    acRequestConsumerToDbf: TAction;
    edPlanTRAN: TDBText;
    Label14: TLabel;
    DBText5: TDBText;
    lbPlanTRAN: TLabel;
    Label12: TLabel;
    DBText1: TDBText;
    Label13: TLabel;
    DBText6: TDBText;
    Label15: TLabel;
    DBText7: TDBText;
    Label16: TLabel;
    DBText8: TDBText;
    Label17: TLabel;
    DBText9: TDBText;
    oraSaldoSALDO: TFloatField;
    oraPlanTRAN: TOracleDataSet;
    dsPlanTRAN: TDataSource;
    oraPlanNBPLAN_VES: TFloatField;
    oraPlanTRANPLAN_VES: TFloatField;
    oraPlanProd: TOracleDataSet;
    dsPlanProd: TDataSource;
    oraPlanProdGROUP_NAME_NPR: TStringField;
    oraDogFact: TOracleDataSet;
    dsDogFact: TDataSource;
    oraDogFactFACT: TFloatField;
    oraProdFact: TOracleDataSet;
    FloatField1: TFloatField;
    dsProdFact: TDataSource;
    oraZayv: TOracleDataSet;
    dsZayv: TDataSource;
    oraZayvZAYV_ALL_PROD: TFloatField;
    oraZayvZAYV_WORK_PROD: TFloatField;
    oraZayvZAYV_ALL_DOG: TFloatField;
    oraZayvZAYV_WORK_DOG: TFloatField;
    acRequestConsumerFact: TAction;
    BitBtn3: TBitBtn;
    oraPlanStru: TOracleDataSet;
    oraMonth_allKLS_PLANSTRUID: TFloatField;
    oraMonth_allPlanStru: TStringField;
    TBPopupMenu1: TTBPopupMenu;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    oraPlanOtherPLAN_VES: TFloatField;
    lbPlanOther: TLabel;
    edPlanOther: TDBText;
    oraMonth_allSTORE_NAME: TStringField;
    Button2: TButton;
    acRequestConsumerLoadArh: TAction;
    Label7: TLabel;
    cbNeftebasa: TRxDBLookupCombo;
    oraNeftebasa: TOracleDataSet;
    dsNeftebasa: TDataSource;
    oraMonth_allNOM_ZD: TStringField;
    rbAgentGD: TRadioButton;
    oraMonth_allCLIENT_NUMBER: TStringField;
    q_status_zakaz: TOracleDataSet;
    oraMonth_allSTATUS_ZAKAZ_ID: TFloatField;
    oraMonth_allSTATUS_ZAKAZ_NAME: TStringField;
    oraMonth_allCLIENT_DATE: TDateTimeField;
    oraMonth_allMON_VES: TFloatField;
    oraMonth_allMON_KOL: TFloatField;
    acRequestConsumerAddOtgr: TAction;
    acRequestConsumerReAddress: TAction;
    acRequestConsumerCancel: TAction;
    TBItem3: TTBItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    TBDock2: TTBDock;
    TBToolbar2: TTBToolbar;
    TBItem18: TTBItem;
    TBItem19: TTBItem;
    TBItem20: TTBItem;
    oraMonth_allKOL: TFloatField;
    oraMonth_allSPEED_VES: TFloatField;
    oraMonth_allSPEED_KOL: TFloatField;
    acRequestConsumerHistory: TAction;
    TBItem2: TTBItem;
    oraPlanStruID: TFloatField;
    oraPlanStruNAME: TStringField;
    oraMonth_allEXIST_HIST: TFloatField;
    oraMonth_allNORMOTGR: TFloatField;
    oraMonth_allBEGIN_DATE: TDateTimeField;
    oraMonth_allZAKAZ_OLD_ID: TFloatField;
    oraMonth_allZAKAZ_OLD_NUM: TStringField;
    acRequestWord: TAction;
    TBItem6: TTBItem;
    oraMonth_allKST: TStringField;
    oraMonth_allOKPO: TStringField;
    oraMonth_allGDKOD: TStringField;
    oraMonth_allADDR_POTR: TStringField;
    oraMonth_allPotreb_Full: TStringField;
    oraMonth_allPlat_full: TStringField;
    procedure acRequestConsumerRefreshExecute(Sender: TObject);
    procedure acRequestConsumerAddExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grMonthSortMarkingChanged(Sender: TObject);
    procedure acRequestConsumerDelExecute(Sender: TObject);
    procedure acRequestConsumerPostExecute(Sender: TObject);
    procedure acRequestConsumerExportXlsExecute(Sender: TObject);
    procedure grMonthGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure xlDrawCell(r1, c1, r2, c2: integer; text: string;border: boolean;fsize:integer);
    procedure acRequestConsumerEditExecute(Sender: TObject);
    procedure oraMonth_allAfterScroll(DataSet: TDataSet);
    procedure acRequestConsumerCopyExecute(Sender: TObject);
    procedure oraMonth_allBeforePost(DataSet: TDataSet);
    procedure acRequestConsumerLoadParusExecute(Sender: TObject);
    procedure rbTransitGDClick(Sender: TObject);
    procedure edDateFromChange(Sender: TObject);
    procedure edDateToChange(Sender: TObject);
    procedure acRequestConsumerToDbfExecute(Sender: TObject);
    procedure acRequestConsumerFactExecute(Sender: TObject);
    procedure SetPlanSQL(DataSet: TOracleDataSet;TipRealId:integer; OrgKindId:integer);
    procedure acRequestConsumerLoadArhExecute(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure acRequestConsumerAddOtgrExecute(Sender: TObject);
    procedure acRequestConsumerReAddressExecute(Sender: TObject);
    procedure acRequestConsumerCancelExecute(Sender: TObject);
    procedure acRequestConsumerHistoryExecute(Sender: TObject);
    procedure grMonthExit(Sender: TObject);
    procedure acRequestWordExecute(Sender: TObject);

  private
    { Private declarations }
  public
    excel        : variant;
    IsRefresh:boolean;
    { Public declarations }
    IS_AGENT:integer;
  end;
var
  frmMonthAll: TfrmMonthAll;
  gIS_AGENT:integer;

implementation

uses nmonth_all,main,ComObj, OraToDbf, ForSystem, plan_request,dlgwindow,
  month_all_row, ForDB;

{$R *.dfm}

procedure TfrmMonthAll.acRequestConsumerRefreshExecute(Sender: TObject);
var OldFlag:boolean;
    s:string;
    i:integer;
begin
  acRequestConsumerPostExecute(Sender);

  // IS_AGENT
  if rbTransitGD.Checked then
    oraMonth_all.SQL[19]:='and mon.is_agent=2'
  else
    if rbAgentGD.Checked then
      oraMonth_all.SQL[19]:='and mon.is_agent=1'
    else
      if cbOrgStru.KeyValue=40 then // Архангельск
        oraMonth_all.SQL[19]:='and 1=1'
      else
        oraMonth_all.SQL[19]:='and 1=1';

  //Контрагент
  if cbPredpr.Value='0' then
    oraMonth_all.SQL[11]:='and 1=1'
  else
    if rbTransitGD.Checked then
      oraMonth_all.SQL[11]:='and mon.kls_predpr_id='+oraKls_predpr.fieldByName('ID').AsString
    else
      if rbAgentGD.Checked then
        oraMonth_all.SQL[11]:='and mon.kls_predpr_id='+oraKls_predpr.fieldByName('ID').AsString
      else
        if cbOrgStru.KeyValue=40 then // Архангельск
          oraMonth_all.SQL[11]:='and mon.PARUS_AGENT_NAME='''+oraKls_predpr.fieldByName('ID').AsString+''''
        else
          oraMonth_all.SQL[11]:='and mon.PARUS_AGENT_RN='+oraKls_predpr.fieldByName('ID').AsString;
  oraKls_predpr.Close;

  oraKls_predpr.Open;

  //Нефтебаза
  if cbNeftebasa.Value='0' then
    oraMonth_all.SQL[18]:='and 1=1'
  else
    if rbTransitGD.Checked then
      oraMonth_all.SQL[18]:='and 1=1'
    else
      if rbAgentGD.Checked then
        oraMonth_all.SQL[18]:='and 1=1'
      else
        if cbOrgStru.KeyValue=40 then // Архангельск
          oraMonth_all.SQL[18]:='and mon.STORE_NAME='''+oraNeftebasa.fieldByName('NAME').AsString+''''
        else
          oraMonth_all.SQL[18]:='and 1=1';
  oraNeftebasa.Close;
  oraNeftebasa.Open;

  //Продукт
  if cbProd.Value='0' then
    oraMonth_all.SQL[12]:='and 1=1'
  else
    if rbTransitGD.Checked then
      oraMonth_all.SQL[12]:='and mon.kls_prod_id='''+oraKls_prod.fieldByName('ID_NPR').AsString+''''
    else
      if rbAgentGD.Checked then
        oraMonth_all.SQL[12]:='and mon.kls_prod_id='''+oraKls_prod.fieldByName('ID_NPR').AsString+''''
      else
        if cbOrgStru.KeyValue=40 then // Архангельск
          oraMonth_all.SQL[12]:='and mon.PARUS_MODIF_NAME='''+oraKls_prod.fieldByName('ID_NPR').AsString+''''
        else
          oraMonth_all.SQL[12]:='and mon.PARUS_MODIF_RN='+oraKls_prod.fieldByName('ID_NPR').AsString;
  oraKls_prod.Close;
  oraKls_prod.Open;

  //Месяц
  oraMonth_all.SQl[13]:='and mon.date_plan>=TO_DATE('''+FormatDateTime('dd.mm.yyyy',edDateFrom.Date)+''',''dd.mm.yyyy'')';
  oraMonth_all.SQl[14]:='and mon.date_plan<=TO_DATE('''+FormatDateTime('dd.mm.yyyy',edDateTo.Date)+''',''dd.mm.yyyy'')';

  //Филиал
  if cbOrgStru.Value='0' then
    oraMonth_all.SQL[15]:='and 1=1'
  else
    oraMonth_all.SQL[15]:='and mon.orgstru_id='+oraOrg_Stru.fieldByName('ID').AsString;

  // Вид отгрузки
  if rbTransitGD.Checked or rbAgentGD.Checked then
    oraMonth_all.SQL[16]:='and mon.parus_rn is null'
  else
    if rbSAM.Checked then
      oraMonth_all.SQL[16]:='and mon.parus_rn is not null and mon.LOAD_ABBR=''САМ'''
    else
      oraMonth_all.SQL[16]:='and mon.parus_rn is not null and mon.LOAD_ABBR=''КНТ''';

  // Договор
  if (ed_Dog.Text<>'') and (ed_Dog.Text<>'*') then
  Begin
    s:=StringReplace(ed_Dog.Text,'*','%',[rfReplaceAll]);
    if rbTransitGD.Checked or rbAgentGD.Checked then
      oraMonth_all.SQL[17]:='and KLS_DOG.DOG_NUMBER LIKE '''+s+'%'''
    else
      oraMonth_all.SQL[17]:='and mon.PARUS_DOGOVOR LIKE '''+s+'%''';
  End
  Else
    oraMonth_all.SQL[17]:='and 1=1';

  try
    oraMonth_all.DisableControls;
    // Настроить интерфейс
    for i:=0 to grMonth.Columns.Count-1 do
    Begin
      if grMonth.Columns[i].FieldName='NOM_ZD' then
        grMonth.Columns[i].Visible:=(rbTransitGD.Checked OR rbAgentGD.Checked);
      if grMonth.Columns[i].FieldName='PARUS_DOGOVOR' then
        grMonth.Columns[i].Visible:=NOT (rbTransitGD.Checked OR rbAgentGD.Checked);
      if grMonth.Columns[i].FieldName='PARUS_AGENT_NAME' then
        grMonth.Columns[i].Visible:=NOT (rbTransitGD.Checked OR rbAgentGD.Checked);
      if grMonth.Columns[i].FieldName='PARUS_MODIF_NAME' then
        grMonth.Columns[i].Visible:=NOT (rbTransitGD.Checked OR rbAgentGD.Checked);
      if grMonth.Columns[i].FieldName='PARUS_MODIF_TAG' then
        grMonth.Columns[i].Visible:=NOT (rbTransitGD.Checked OR rbAgentGD.Checked);
      if grMonth.Columns[i].FieldName='DOG_NUMBER' then
        grMonth.Columns[i].Visible:=(rbTransitGD.Checked OR rbAgentGD.Checked);
      if grMonth.Columns[i].FieldName='KLS_PREDPR_ID' then
        grMonth.Columns[i].Visible:=(rbTransitGD.Checked OR rbAgentGD.Checked);
      if grMonth.Columns[i].FieldName='PLAT' then
        grMonth.Columns[i].Visible:=(rbTransitGD.Checked OR rbAgentGD.Checked);
      if grMonth.Columns[i].FieldName='KLS_DOG_ID' then
        grMonth.Columns[i].Visible:=(rbTransitGD.Checked OR rbAgentGD.Checked);
      if grMonth.Columns[i].FieldName='DOG' then
        grMonth.Columns[i].Visible:=(rbTransitGD.Checked OR rbAgentGD.Checked);
      if grMonth.Columns[i].FieldName='KLS_PROD_ID' then
        grMonth.Columns[i].Visible:=(rbTransitGD.Checked OR rbAgentGD.Checked);
      if grMonth.Columns[i].FieldName='PROD' then
        grMonth.Columns[i].Visible:=(rbTransitGD.Checked OR rbAgentGD.Checked);
      if grMonth.Columns[i].FieldName='IS_REQUESTED' then
        grMonth.Columns[i].ReadOnly:=NOT (rbTransitGD.Checked OR rbAgentGD.Checked);
      if grMonth.Columns[i].FieldName='STORE_NAME' then
        if cbOrgStru.KeyValue=40 then // Архангельск
          grMonth.Columns[i].Visible:=NOT (rbTransitGD.Checked OR rbAgentGD.Checked)
        else
          grMonth.Columns[i].Visible:=false;
    end;
//    oraMonth_all.SQL.SaveToFile('c:\tmp\2.sql');
    IsRefresh:=true;
    f_db.ReQuery(oraMonth_all,True);
    IsRefresh:=false;
    oraMonth_allAfterScroll(oraMonth_all);
  finally
    oraMonth_all.EnableControls;
  end;

end;

procedure TfrmMonthAll.acRequestConsumerAddExecute(Sender: TObject);
var OldFlag:boolean;
begin
  if (rbTransitGD.Checked OR rbAgentGD.Checked) then
  with Tfrm_MonthNew.Create(Self) do
  Begin
    EditId:=0;
    vIS_AGENT:=IS_AGENT;
    vSTATUS_ZAKAZ:=10;
    showmodal;
    if ModalResult=mrOk then
    Begin
      IsRefresh:=true;
      f_db.ReQuery(oraMonth_all,false);
      
      IsRefresh:=false;
      oraMonth_allAfterScroll(oraMonth_all);
    end;
    Free;
  End;
end;

procedure TfrmMonthAll.FormCreate(Sender: TObject);
var i:integer;
begin
  IS_AGENT:=gIS_AGENT;

  // Все открываем
  f_db.LogonMasterSession(oraSes);
  f_db.ReQuery(oraplat,false);
  f_db.ReQuery(oraKls_dog,false);
  f_db.ReQuery(oraprod,false);
  f_db.ReQuery(oraKls_stan,false);
  f_db.ReQuery(oraPayform,false);
  f_db.ReQuery(oraPotreb,false);
  f_db.ReQuery(oraPoluch,false);
  f_db.ReQuery(oraVidOtgr,false);
  f_db.ReQuery(oraVetka,false);
  f_db.ReQuery(oraOrg_stru,false);
  f_db.ReQuery(q_status_zakaz,false);
  edDateFrom.Date:=StartOfTheMonth(Now);
  edDateFromChange(Sender);
  edDateTo.Date:=EndOfTheMonth(Now);
  edDateToChange(Sender);
  acRequestConsumerFactExecute(Sender);
  f_db.ReQuery(oraPlanProd,false);
  if IS_AGENT=1 Then
  Begin
    Caption:='Заказы потребителей (Агентский договор)';
    rbTransitGD.Visible:=false;
    rbSAM.Visible:=false;
    rbMB.Visible:=false;
    rbAgentGD.Visible:=false;
    rbAgentGD.Checked:=true;
    rbTransitGDClick(Sender);
  end
  else
  begin
    Caption:='Заказы потребителей (ТРАНЗИТ, Нефтебазы)';
    rbAgentGD.Visible:=false;
    rbTransitGD.Checked:=true;
    rbTransitGDClick(Sender);
  end;
  // Раздаем права
  f_db.SetUserGrants(acManagerZakaz);
  if NOT acRequestConsumerEdit.Enabled then
  Begin
    for i:=1 to grMonth.columns.Count do
    Begin
      grMonth.columns[i-1].ReadOnly:=true;
    End;
  End;
  if f_db.CheckGrant('acRequestConsumerConfirm') then
  Begin
    // доступны подтверждения
    grMonth.columns[0].ReadOnly:=false;
  End;
end;

procedure TfrmMonthAll.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  orases.Commit;
  oraSes.Connected:=false;
  action:=caFree;
end;

procedure TfrmMonthAll.grMonthSortMarkingChanged(Sender: TObject);
begin
  f_db.SortInGrid(oraMonth_all,20,grMonth);
end;

procedure TfrmMonthAll.acRequestConsumerDelExecute(Sender: TObject);
begin
  inherited;
  if (rbTransitGD.Checked OR rbAgentGD.Checked) OR (cbOrgStru.KeyValue=40) then
  if Application.MessageBox('Удалить запись?','Внимание!',MB_YESNO)=IDYES then
  Begin
    if oraMonth_all.FieldByName('Is_Work').AsInteger=0 then
      if oraMonth_all.FieldByName('EXIST_HIST').AsInteger=0 then
         oraMonth_all.Delete
      else
        application.MessageBox('Нельзя удалить заявку если есть история!','Внимание!',mb_ok)
    else
      application.MessageBox('Нельзя удалить утвержденную запись!','Внимание!',mb_ok);
  End;
end;

procedure TfrmMonthAll.acRequestConsumerPostExecute(Sender: TObject);
begin
  inherited;
  if oraMonth_all.State=dsEdit then oraMonth_all.Post;
end;

procedure TfrmMonthAll.xlDrawCell(r1, c1, r2, c2: integer; text: string;border: boolean;fsize:integer);
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

procedure TfrmMonthAll.acRequestConsumerExportXlsExecute(Sender: TObject);
var
i,k          : integer;
sheet        : variant;
begin
  inherited;
  acRequestConsumerPostExecute(Sender);
//SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,DBGridEh1,'c:\temp\Svod.xls',True);
//ShowMessage('Сформирован файл c:\temp\Svod.xls');
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
  if cbOrgstru.value<>'0' then
  xlDrawCell(2, 7, 2, 7, cbOrgstru.Text, False,10);

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
  with oraMonth_all do begin
  First;
  while not eof do
  begin
         if oraMonth_allIS_WORK.Value=0 then xlDrawCell(i,1,i,1,'Нет',true,8) else xlDrawCell(i,1,i,1,'Да',true,8);
         xlDrawCell(i,2,i,2,oraMonth_allINPUT_NUMBER.AsString,true,8);
         xlDrawCell(i,3,i,3,oraMonth_allINPUT_DATE.AsString,true,8);
         xlDrawCell(i,4,i,4,oraMonth_allPlat.AsString,true,8);
         xlDrawCell(i,5,i,5,oraMonth_allDog.AsString,true,8);
         xlDrawCell(i,6,i,6,oraMonth_allUslOpl.AsString,true,8);
         xlDrawCell(i,7,i,7,oraMonth_allprod.AsString,true,8);
         xlDrawCell(i,8,i,8,oraMonth_allREQUEST.AsString,true,8);
         xlDrawCell(i,9,i,9,oraMonth_allStan.AsString,true,8);
         if oraMonth_allpoluch.AsString='' then xlDrawCell(i,10,i,10,oraMonth_allPOLUCH_NAME.AsString,true,8) else xlDrawCell(i,10,i,10,oraMonth_allpoluch.AsString,true,8);
         if oraMonth_allpotreb.AsString='' then xlDrawCell(i,11,i,11,oraMonth_allpotreb_name.AsString,true,8) else xlDrawCell(i,11,i,11,oraMonth_allpotreb.AsString,true,8);
         xlDrawCell(i,12,i,12,oraMonth_allPRICE.AsString,true,8);
         xlDrawCell(i,13,i,13,oraMonth_allPRICH.AsString,true,8);
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

procedure TfrmMonthAll.grMonthGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if odd(oraMonth_all.RecNo) then  background:=clInfoBk;
end;

procedure TfrmMonthAll.acRequestConsumerEditExecute(Sender: TObject);
var OldFlag:boolean;
begin
  inherited;
  if (rbTransitGD.Checked OR rbAgentGD.Checked) then
  with Tfrm_MonthNew.Create(Self) do
  Begin
    EditId:=oraMonth_all.FieldByName('ID').AsInteger;
    vIS_AGENT:=IS_AGENT;
    vSTATUS_ZAKAZ:=30;
    showmodal;
    if ModalResult=mrOk then
    Begin
      IsRefresh:=true;
      f_db.ReQuery(oraMonth_all,True);
      IsRefresh:=false;
      oraMonth_allAfterScroll(oraMonth_all);
    end;
    Free;
  End;
end;

procedure TfrmMonthAll.oraMonth_allAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if IsRefresh then exit;
  if NOT Active then exit;

  oraSaldo.Close;
  oraProdFact.Close;
  oraDogFact.Close;
  oraZayv.Close;

  if oraMonth_all.Eof then exit;

  // Задолженность
  if oraMonth_allORGSTRU_ID.AsString<>'' then
    oraSaldo.SQL[3]:='  AND orgstru_id='+oraMonth_allORGSTRU_ID.AsString
  else
    oraSaldo.SQL[3]:='  AND 1=0';
  if (rbTransitGD.Checked OR rbAgentGD.Checked) then
  Begin
    oraSaldo.SQL[0]:='SELECT saldo';
    if oraMonth_allORGSTRU_ID.AsInteger=40 then // Архангельск
      oraSaldo.SQL[1]:='FROM V_MONTH_ALL_TMP_DOG_ARH'
    else
      oraSaldo.SQL[1]:='FROM V_MONTH_ALL_TMP_DOG_MASTER';
    if (oraMonth_allKLS_DOG_ID.AsString<>'') and (oraMonth_allKLS_DOG_ID.AsString<>'0') then
    Begin
      oraSaldo.SQL[2]:='WHERE kls_dog_id='+oraMonth_allKLS_DOG_ID.AsString;
    End
    else
    Begin
      oraSaldo.SQL[2]:='WHERE 1=0';
    End
  End
  Else
  Begin
    oraSaldo.SQL[0]:='SELECT saldo';
    oraSaldo.SQL[1]:='FROM V_MONTH_ALL_TMP_DOG_PARUS';
    if oraMonth_allPARUS_DOGOVOR.AsString<>'' then
    Begin
      oraSaldo.SQL[2]:='WHERE parus_dogovor='''+oraMonth_allPARUS_DOGOVOR.AsString+'''';
    End
    else
    Begin
      oraSaldo.SQL[2]:='WHERE 1=0';
    End
  End;
  oraSaldo.Open;
  if NOT oraSaldo.Eof then
    if oraSaldoSALDO.AsFloat<0 then lbDolgName.Caption:='Кредиторская задолженность:'
      else if oraSaldoSALDO.AsFloat=0 then lbDolgName.Caption:='Задолженности нет'
           else lbDolgName.Caption:='Дебиторская задолженность:'
    else
      lbDolgName.Caption:='Данных по задолженности нет';

  // Факт по договору
  if oraMonth_allORGSTRU_ID.AsString<>'' then
    oraDogFact.SQL[4]:='  AND orgstru_id='+oraMonth_allORGSTRU_ID.AsString
  else
    oraDogFact.SQL[4]:='  AND 1=0';
  if (rbTransitGD.Checked OR rbAgentGD.Checked) then
  Begin
    if oraMonth_allKLS_PROD_ID.AsString<>'' then
      oraDogFact.SQL[3]:='  AND kls_prod_id='''+oraMonth_allKLS_PROD_ID.AsString+''''
    else
      oraDogFact.SQL[3]:='  AND 1=0';
    if (oraMonth_allKLS_DOG_ID.AsString<>'') and (oraMonth_allKLS_DOG_ID.AsString<>'0') then
    Begin
      oraDogFact.SQL[2]:='WHERE kls_dog_id='+oraMonth_allKLS_DOG_ID.AsString;
    End
    else
      if oraMonth_allKLS_PREDPR_ID.AsString<>'' then
      Begin
        oraDogFact.SQL[2]:='WHERE kls_plat_id='+oraMonth_allKLS_PREDPR_ID.AsString;
      End
      else
      Begin
        oraDogFact.SQL[2]:='WHERE 1=0';
      End;
  End
  Else
  Begin
    if oraMonth_allPARUS_MODIF_RN.AsString<>'' then
      oraDogFact.SQL[3]:='  AND parus_modif_rn='+oraMonth_allPARUS_MODIF_RN.AsString
    else
      oraDogFact.SQL[3]:='  AND 1=0';
    if oraMonth_allPARUS_DOGOVOR.AsString<>'' then
    Begin
      oraDogFact.SQL[2]:='WHERE parus_dogovor='''+oraMonth_allPARUS_DOGOVOR.AsString+'''';
    End
    else
    Begin
      oraDogFact.SQL[2]:='WHERE 1=0';
    End;
  End;
  oraDogFact.Open;

  // Факт по продукту
  if oraMonth_allORGSTRU_ID.AsString<>'' then
    oraProdFact.SQL[3]:='  AND orgstru_id='+oraMonth_allORGSTRU_ID.AsString
  else
    oraProdFact.SQL[3]:='  AND 1=0';
  if (rbTransitGD.Checked OR rbAgentGD.Checked) then
    if oraMonth_allKLS_PROD_ID.AsString<>'' then
      oraProdFact.SQL[2]:='WHERE kls_prod_id='''+oraMonth_allKLS_PROD_ID.AsString+''''
    else
      oraProdFact.SQL[2]:='WHERE 1=0'
  Else
    if oraMonth_allPARUS_MODIF_RN.AsString<>'' then
      oraProdFact.SQL[2]:='WHERE parus_modif_rn='+oraMonth_allPARUS_MODIF_RN.AsString
    else
      oraProdFact.SQL[2]:='WHERE 1=0';
  oraProdFact.Open;

  // Заявлено
  oraZayv.SQl[6]:='WHERE date_plan>=TO_DATE('''+FormatDateTime('dd.mm.yyyy',edDateFrom.Date)+''',''dd.mm.yyyy'')';
  oraZayv.SQl[7]:='  AND date_plan<=TO_DATE('''+FormatDateTime('dd.mm.yyyy',edDateTo.Date)+''',''dd.mm.yyyy'')';
  if oraMonth_allORGSTRU_ID.AsString<>'' then
    oraZayv.SQL[8]:='  AND orgstru_id='+oraMonth_allORGSTRU_ID.AsString
  else
    oraZayv.SQL[8]:='  AND 1=0';

  if (rbTransitGD.Checked OR rbAgentGD.Checked) then
  Begin
    if oraMonth_allKLS_PROD_ID.AsString<>'' then
      oraZayv.SQL[9]:='  AND kls_prod_id='''+oraMonth_allKLS_PROD_ID.AsString+''''
    else
      oraZayv.SQL[9]:='  AND 1=0';

    if (oraMonth_allKLS_DOG_ID.AsString<>'') and (oraMonth_allKLS_DOG_ID.AsString<>'0') then
    Begin
      oraZayv.SQL[3]:='  SUM(DECODE(KLS_DOG_ID,'+oraMonth_allKLS_DOG_ID.AsString+',REQUEST,0)) as zayv_all_dog,';
      oraZayv.SQL[4]:='  SUM(DECODE(KLS_DOG_ID,'+oraMonth_allKLS_DOG_ID.AsString+',DECODE(IS_WORK+IS_REQUESTED,2,REQUEST,0),0)) as zayv_work_dog';
    End
    else
      if oraMonth_allKLS_PREDPR_ID.AsString<>'' then
      Begin
        oraZayv.SQL[3]:='  SUM(DECODE(KLS_PREDPR_ID,'+oraMonth_allKLS_PREDPR_ID.AsString+',REQUEST,0)) as zayv_all_dog,';
        oraZayv.SQL[4]:='  SUM(DECODE(KLS_PREDPR_ID,'+oraMonth_allKLS_PREDPR_ID.AsString+',DECODE(IS_WORK+IS_REQUESTED,2,REQUEST,0),0)) as zayv_work_dog';
      End
      else
      Begin
        oraZayv.SQL[3]:='  SUM(REQUEST) as zayv_all_dog,';
        oraZayv.SQL[4]:='  SUM(DECODE(IS_WORK+IS_REQUESTED,2,REQUEST,0)) as zayv_work_dog';
      End;
  End
  Else
  Begin
    if oraMonth_allPARUS_MODIF_RN.AsString<>'' then
      oraZayv.SQL[9]:='  AND parus_modif_rn='+oraMonth_allPARUS_MODIF_RN.AsString
    else
      oraZayv.SQL[9]:='  AND 1=0';

    if oraMonth_allPARUS_DOGOVOR.AsString<>'' then
    Begin
      oraZayv.SQL[3]:='  SUM(DECODE(parus_dogovor,'''+oraMonth_allPARUS_DOGOVOR.AsString+''',REQUEST,0)) as zayv_all_dog,';
      oraZayv.SQL[4]:='  SUM(DECODE(parus_dogovor,'''+oraMonth_allPARUS_DOGOVOR.AsString+''',DECODE(IS_WORK+IS_REQUESTED,2,REQUEST,0),0)) as zayv_work_dog';
    End
    else
    Begin
      oraZayv.SQL[3]:='  SUM(REQUEST) as zayv_all_dog,';
      oraZayv.SQL[4]:='  SUM(DECODE(IS_WORK+IS_REQUESTED,2,REQUEST,0)) as zayv_work_dog';
    End;
  End;
  oraZayv.Open;

  // Договор
  if (rbTransitGD.Checked OR rbAgentGD.Checked) then
    if (oraMonth_allDOG_NUMBER.AsString<>'') and (oraMonth_allDOG_NUMBER.AsString<>'0') then
    Begin
      lbDogovor.Caption:=oraMonth_allDOG_NUMBER.AsString;
      lbDogKind.Caption:='По договору';
    end
    else
    Begin
      lbDogovor.Caption:=oraMonth_allPLAT.AsString;
      lbDogKind.Caption:='По контрагенту';
    end
  else
    lbDogovor.Caption:=oraMonth_allPARUS_DOGOVOR.AsString;

  // Продукт
  if (rbTransitGD.Checked OR rbAgentGD.Checked) then
    lbPlanProdName.Caption:=oraPlanProdGROUP_NAME_NPR.AsString
  else
    lbPlanProdName.Caption:=oraMonth_allPARUS_MODIF_NAME.AsString;

  if oraMonth_AllORGSTRU.AsString<>'' then
    gbInfo.Caption:='Дополнительная информация ('+oraMonth_AllORGSTRU.AsString+')'
  else
    gbInfo.Caption:='Дополнительная информация';

end;

procedure TfrmMonthAll.acRequestConsumerCopyExecute(Sender: TObject);
var
  frmDlgWindow: TfrmDlgWindow;
begin
  inherited;
  if (rbTransitGD.Checked OR rbAgentGD.Checked) then
  if MessageDlg('Действительно скопировать заявку?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  with Tfrm_MonthNew.Create(Self) do
  Begin
    EditId:=0;
    vIS_AGENT:=IS_AGENT;
    vSTATUS_ZAKAZ:=10;
    vCOPY:=1;

        edNum.Text:='';
        cbOrgstru.KeyValue:=oraMonth_all.FieldByName('ORGSTRU_ID').AsInteger;
        cbPredpr.KeyValue:=oraMonth_all.FieldByName('KLS_PREDPR_ID').AsInteger;
        cbDog.KeyValue:=oraMonth_all.FieldByName('KLS_DOG_ID').AsInteger;
        cbProd.KeyValue:=oraMonth_all.FieldByName('KLS_PROD_ID').AsString;
        edDatePlan.Date:=oraMonth_all.FieldByName('DATE_PLAN').AsDateTime;
        edDatePlanChange(self);
        edReq.Value:=oraMonth_all.fieldByName('request').AsFloat-oraMonth_all.fieldByName('executed').AsFloat;
        if (edReq.Value>0) and (oraMonth_all.fieldByName('normotgr').AsFloat>0) then
        Begin
          if edReq.value<oraMonth_all.fieldByName('normotgr').AsFloat then
            edKol.value:=1
          else
            edKol.value:=Round(edReq.value/oraMonth_all.fieldByName('normotgr').AsFloat);
        end;
        edSpeedVes.Value:=oraMonth_all.FieldByName('SPEED_VES').AsFloat;
        if (edSpeedVes.Value>0) and (oraMonth_all.fieldByName('normotgr').AsFloat>0) then
        Begin
          if edSpeedVes.value<oraMonth_all.fieldByName('normotgr').AsFloat then
            edSpeedKol.value:=1
          else
            edSpeedKol.value:=Round(edSpeedVes.value/oraMonth_all.fieldByName('normotgr').AsFloat);
        end;
        edPrice.Value:=oraMonth_all.FieldByName('PRICE').AsFloat;
        cbStan.KeyValue:=oraMonth_all.FieldByName('STAN_ID').AsInteger;
        cbPayForm.KeyValue:=oraMonth_all.FieldByName('PAYFORM_ID').AsInteger;
        cbUslOpl.KeyValue:=oraMonth_all.FieldByName('USL_OPL_ID').AsInteger;
        cbVidOtgr.KeyValue:=oraMonth_all.FieldByName('LOAD_ABBR').AsString;
        cbVetka.KeyValue:=oraMonth_all.FieldByName('VETKA_ID').AsInteger;
        cbPoluch.KeyValue:=oraMonth_all.FieldByName('POLUCH_ID').AsInteger;
        cbPotreb.KeyValue:=oraMonth_all.FieldByName('POTREB_ID').AsInteger;
        edPoluch.Text:=oraMonth_all.FieldByName('POLUCH_NAME').AsString;
        edPotreb.Text:=oraMonth_all.FieldByName('POTREB_NAME').AsString;
        cbPlanstru.KeyValue:=oraMonth_all.FieldByName('kls_planstruID').AsInteger;
        edPrich.Text:=oraMonth_all.FieldByName('PRICH').AsString;
        edGR4.Text:=oraMonth_all.FieldByName('GR4').AsString;
        edBeginDate.Date:=oraMonth_all.FieldByName('BEGIN_DATE').AsDateTime;

    showmodal;
    if ModalResult=mrOk then
    Begin
      IsRefresh:=true;
      f_db.ReQuery(oraMonth_all,True);
      IsRefresh:=false;
      oraMonth_allAfterScroll(oraMonth_all);
    end;
    Free;
  End;
end;

procedure TfrmMonthAll.oraMonth_allBeforePost(DataSet: TDataSet);
begin
  inherited;
  oraMonth_allAPPL_TAG.AsString:=APPLICATION_NAME;
end;

procedure TfrmMonthAll.acRequestConsumerLoadParusExecute(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    oraPackage.PackageName:='FOR_MONTH_ALL';
    oraPackage.CallProcedure('LOAD_CONSORDS',[FormatDateTime('dd.mm.yyyy',edDateFrom.Date),FormatDateTime('dd.mm.yyyy',edDateTo.Date)]);
    oraPackage.CallProcedure('LOAD_GRAPHPOINT',[FormatDateTime('dd.mm.yyyy',edDateFrom.Date),FormatDateTime('dd.mm.yyyy',edDateTo.Date)]);
    acRequestConsumerRefreshExecute(Sender);
    Screen.Cursor := crDefault;
    Application.MessageBox('Данные из Паруса загружены успешно!','Внимание!',MB_OK)
  except
    Screen.Cursor := crDefault;
    Application.MessageBox('Данные из Паруса НЕ загружены!','Внимание!',MB_OK)
  end;
end;

procedure TfrmMonthAll.rbTransitGDClick(Sender: TObject);
begin
  inherited;
  // План поставки
  oraPlanNB.Close;
  oraPlanTRAN.Close;
  oraPlanOther.Close;
  if (rbTransitGD.Checked OR rbAgentGD.Checked) then
  Begin
    SetPlanSQL(oraPlanNB,1,0);
    SetPlanSQL(oraPlanTRAN,2,0);
    SetPlanSQL(oraPlanOther,0,0);
    lbPlanNB.Caption:='План АЗС и НБ:';
    lbPlanTRAN.Caption:='ТРАНЗИТ:';
    lbPlanOther.Caption:='Прочий план:';
  End
  Else
  Begin
    SetPlanSQL(oraPlanNB,1,1);
    SetPlanSQL(oraPlanTRAN,2,0);
    SetPlanSQL(oraPlanOther,1,5);
    lbPlanNB.Caption:='План НБ:';
    lbPlanTRAN.Caption:='ТРАНЗИТ:';
    lbPlanOther.Caption:='План АЗС:';
  End;
  oraPlanNB.Open;
  oraPlanTRAN.Open;
  oraPlanOther.Open;

  // Предприятия
  cbPredpr.KeyValue:=vaNull;
  cbPredpr.Value:='0';
  oraKls_predpr.Close;
  if (rbTransitGD.Checked) then
  Begin
    oraKls_predpr.SQL[1]:='DISTINCT kls.ID, kls.short_name';
    oraKls_predpr.SQL[2]:='FROM month_all m, kls_predpr kls';
    oraKls_predpr.SQL[3]:='WHERE m.KLS_PREDPR_ID=kls.ID and m.parus_rn is null AND m.is_agent=2';
    oraKls_predpr.SQL[6]:='ORDER BY kls.short_name ASC';
  end
  else
    if (rbAgentGD.Checked) then
    Begin
      oraKls_predpr.SQL[1]:='DISTINCT kls.ID, kls.short_name';
      oraKls_predpr.SQL[2]:='FROM month_all m, kls_predpr kls';
      oraKls_predpr.SQL[3]:='WHERE m.KLS_PREDPR_ID=kls.ID and m.parus_rn is null AND m.is_agent=1';
      oraKls_predpr.SQL[6]:='ORDER BY kls.short_name ASC';
    end
    else
      if cbOrgStru.KeyValue=40 then // Архангельск
      Begin
        oraKls_predpr.SQL[1]:='DISTINCT m.PARUS_AGENT_NAME as ID, m.PARUS_AGENT_NAME as short_NAME';
        oraKls_predpr.SQL[2]:='FROM '+SCHEMA_NAME+'.month_all m';
        oraKls_predpr.SQL[3]:='WHERE m.parus_rn is not null and m.parus_rn=1';
        oraKls_predpr.SQL[6]:='ORDER BY m.PARUS_AGENT_NAME ASC';
      end
    else
      Begin
        oraKls_predpr.SQL[1]:='DISTINCT m.PARUS_AGENT_RN as ID, m.PARUS_AGENT_NAME as short_NAME';
        oraKls_predpr.SQL[2]:='FROM '+SCHEMA_NAME+'.month_all m';
        oraKls_predpr.SQL[3]:='WHERE m.parus_rn is not null and m.parus_rn<>1';
        oraKls_predpr.SQL[6]:='ORDER BY m.PARUS_AGENT_NAME ASC';
      end;
  oraKls_predpr.Open;

  // Нефтебазы
  cbNeftebasa.KeyValue:=vaNull;
  cbNeftebasa.Value:='0';
  oraNeftebasa.Close;
  if (rbTransitGD.Checked OR rbAgentGD.Checked) then
  Begin
    oraNeftebasa.SQL[1]:='DISTINCT m.STORE_NAME as ID, m.STORE_NAME as NAME';
    oraNeftebasa.SQL[2]:='FROM '+SCHEMA_NAME+'.month_all m';
    oraNeftebasa.SQL[3]:='WHERE 1=0';
    oraNeftebasa.SQL[6]:='ORDER BY m.STORE_NAME ASC';
  end
  else
    if cbOrgStru.KeyValue=40 then // Архангельск
    Begin
      oraNeftebasa.SQL[1]:='DISTINCT m.STORE_NAME as ID, m.STORE_NAME as NAME';
      oraNeftebasa.SQL[2]:='FROM '+SCHEMA_NAME+'.month_all m';
      oraNeftebasa.SQL[3]:='WHERE m.parus_rn is not null and m.parus_rn=1';
      oraNeftebasa.SQL[6]:='ORDER BY m.STORE_NAME ASC';
    end
  else
    Begin
      oraNeftebasa.SQL[1]:='DISTINCT m.STORE_NAME as ID, m.STORE_NAME as NAME';
      oraNeftebasa.SQL[2]:='FROM '+SCHEMA_NAME+'.month_all m';
      oraNeftebasa.SQL[3]:='WHERE 1=0';
      oraNeftebasa.SQL[6]:='ORDER BY m.STORE_NAME ASC';
    end;
  oraNeftebasa.Open;

  // Продукты
  cbProd.KeyValue:=vaNull;
  cbProd.Value:='0';
  oraKls_prod.Close;
  if (rbTransitGD.Checked) then
  Begin
    oraKls_prod.SQL[1]:='DISTINCT kls_prod.id_npr, kls_prod.name_npr';
    oraKls_prod.SQL[2]:='FROM '+SCHEMA_NAME+'.month_all m, '+SCHEMA_NAME+'.kls_prod kls_prod';
    oraKls_prod.SQL[3]:='WHERE m.kls_prod_id = kls_prod.id_npr AND m.parus_rn is null AND m.is_agent=2';
    oraKls_prod.SQL[6]:='ORDER BY kls_prod.name_npr ASC';
  end
  else
    if (rbAgentGD.Checked) then
    Begin
      oraKls_prod.SQL[1]:='DISTINCT kls_prod.id_npr, kls_prod.name_npr';
      oraKls_prod.SQL[2]:='FROM '+SCHEMA_NAME+'.month_all m, '+SCHEMA_NAME+'.kls_prod kls_prod';
      oraKls_prod.SQL[3]:='WHERE m.kls_prod_id = kls_prod.id_npr AND m.parus_rn is null AND m.is_agent=1';
      oraKls_prod.SQL[6]:='ORDER BY kls_prod.name_npr ASC';
    end
    else
      if cbOrgStru.KeyValue=40 then // Архангельск
      Begin
        oraKls_prod.SQL[1]:='DISTINCT m.PARUS_MODIF_TAG as ID_NPR, m.PARUS_MODIF_NAME as NAME_NPR';
        oraKls_prod.SQL[2]:='FROM '+SCHEMA_NAME+'.month_all m';
        oraKls_prod.SQL[3]:='WHERE m.parus_rn is not null and m.parus_rn=1';
        oraKls_prod.SQL[6]:='ORDER BY m.PARUS_MODIF_NAME ASC';
      end
      else
      Begin
        oraKls_prod.SQL[1]:='DISTINCT m.PARUS_MODIF_RN as ID_NPR, m.PARUS_MODIF_NAME as NAME_NPR';
        oraKls_prod.SQL[2]:='FROM '+SCHEMA_NAME+'.month_all m';
        oraKls_prod.SQL[3]:='WHERE m.parus_rn is not null and m.parus_rn<>1';
        oraKls_prod.SQL[6]:='ORDER BY m.PARUS_MODIF_NAME ASC';
      end;
  oraKls_prod.Open;

  // Сальдо
  oraSaldo.Close;
  //  oraSaldo.Active:=cbCalcDeb.Checked;

  // Факт по договору
  oraDogfact.Close;
  if (rbTransitGD.Checked OR rbAgentGD.Checked) then
  Begin
    oraDogfact.SQL[1]:='FROM V_MONTH_ALL_TMP_PRODDOG_MASTER';
    oraDogfact.SQL[2]:='WHERE 1=0';
  end
  else
  Begin
    oraDogfact.SQL[1]:='FROM V_MONTH_ALL_TMP_PRODDOG_PARUS';
    oraDogfact.SQL[2]:='WHERE 1=0';
  end;
  //  oraDogfact.Active:=cbCalcDeb.Checked;

  // Факт по продукту
  oraProdfact.Close;
  if (rbTransitGD.Checked OR rbAgentGD.Checked) then
  Begin
    oraProdfact.SQL[1]:='FROM V_MONTH_ALL_TMP_PROD_MASTER';
    oraProdfact.SQL[2]:='WHERE 1=0';
  end
  else
  Begin
    oraProdfact.SQL[1]:='FROM V_MONTH_ALL_TMP_PROD_PARUS';
    oraProdfact.SQL[2]:='WHERE 1=0';
  end;
//  oraProdfact.Active:=cbCalcDeb.Checked;

  acRequestConsumerRefreshExecute(Sender);
end;

procedure TfrmMonthAll.edDateFromChange(Sender: TObject);
begin
  inherited;
  oraKls_prod.SQl[4]:='  AND m.date_plan>=TO_DATE('''+FormatDateTime('dd.mm.yyyy',edDateFrom.Date)+''',''dd.mm.yyyy'')';
  oraKls_predpr.SQl[4]:='  AND m.date_plan>=TO_DATE('''+FormatDateTime('dd.mm.yyyy',edDateFrom.Date)+''',''dd.mm.yyyy'')';
end;

procedure TfrmMonthAll.edDateToChange(Sender: TObject);
begin
  inherited;
  oraKls_prod.SQl[5]:='  AND m.date_plan<=TO_DATE('''+FormatDateTime('dd.mm.yyyy',edDateTo.Date)+''',''dd.mm.yyyy'')';
  oraKls_predpr.SQl[5]:='  AND m.date_plan<=TO_DATE('''+FormatDateTime('dd.mm.yyyy',edDateTo.Date)+''',''dd.mm.yyyy'')';
end;

procedure TfrmMonthAll.acRequestConsumerToDbfExecute(Sender: TObject);
begin
  inherited;
  acRequestConsumerPostExecute(Sender);

  with tf_ORAToDBF.Create(Self) do
    begin
      DBFtoORAid:='MONTH_ALL';
      ShowModal;
    end;

end;

procedure TfrmMonthAll.acRequestConsumerFactExecute(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Обновить данные о задолженности и факте исполнения? Это может занять несколько минут!','Внимание!',MB_YESNO)=IDYES then
  Begin
    Screen.Cursor := crHourGlass;
    oraPackage.PackageName:='FOR_MONTH_ALL';
    oraPackage.CallProcedure('FILLFACTMASTER',[FormatDateTime('dd.mm.yyyy',edDateFrom.Date),FormatDateTime('dd.mm.yyyy',edDateTo.Date)]);
    oraPackage.CallProcedure('FILLFACTPARUS',[FormatDateTime('dd.mm.yyyy',edDateFrom.Date),FormatDateTime('dd.mm.yyyy',edDateTo.Date)]);
    Screen.Cursor := crDefault;
  end;
{  IsRefresh:=true;
  f_main.ReQuery(oraMonth_all,True);
  IsRefresh:=false;
  oraMonth_allAfterScroll(oraMonth_all);}
end;

procedure TfrmMonthAll.SetPlanSQL(DataSet: TOracleDataSet; TipRealId:integer; OrgKindId:integer);
Begin
  with DataSet do
  Begin
    Close;
    SQL.Clear;
    if (rbTransitGD.Checked OR rbAgentGD.Checked) then
    Begin
      SQL.Add(Plan_Fin);
      SQL.Add('AND NVL(TIP_REAL_ID,0)='+IntToStr(TipRealId));
      DeleteVariables;
      DeclareVariable('DATE_PLAN',otDate);
      DeclareVariable('ORGSTRU_ID',otInteger);
      DeclareVariable('KLS_PROD_ID',otString);
      MasterFields:='date_plan;orgstru_id;kls_prod_id';
    End
    Else
    Begin
      SQL.Add(Plan_Parus);
      SQL.Add('AND TIP_REAL_ID='+IntToStr(TipRealId));
      SQL.Add('AND ORG_KIND_ID='+IntToStr(OrgKindId));
      DeleteVariables;
      DeclareVariable('DATE_PLAN',otDate);
      DeclareVariable('ORGSTRU_ID',otInteger);
      DeclareVariable('PARUS_NOMEN_RN',otFloat);
      DeclareVariable('PARUS_MODIF_RN',otFloat);
      MasterFields:='date_plan;orgstru_id;parus_nomen_rn;parus_modif_rn';
    End;
  End;
End;

procedure TfrmMonthAll.acRequestConsumerLoadArhExecute(Sender: TObject);
begin
  inherited;
  with Tf_LoadPlanRequest.Create(Self) do
  Begin
    showmodal;
    Free;
    IsRefresh:=true;
    f_db.ReQuery(oraMonth_all,True);
    IsRefresh:=false;
    oraMonth_allAfterScroll(oraMonth_all);
  End;
end;

procedure TfrmMonthAll.BitBtn3Click(Sender: TObject);
begin
  inherited;
  acRequestConsumerFactExecute(Sender);
  rbTransitGDClick(Sender);
end;

procedure TfrmMonthAll.acRequestConsumerAddOtgrExecute(Sender: TObject);
begin
  inherited;
  if (rbTransitGD.Checked OR rbAgentGD.Checked) then
  with Tfrm_MonthNew.Create(Self) do
  Begin
    EditId:=oraMonth_all.FieldByName('ID').AsInteger;
    vIS_AGENT:=IS_AGENT;
    vSTATUS_ZAKAZ:=20;
    showmodal;
    if ModalResult=mrOk then
    Begin
      IsRefresh:=true;
      f_db.ReQuery(oraMonth_all,True);
      IsRefresh:=false;
      oraMonth_allAfterScroll(oraMonth_all);
    end;
    Free;
  End;
end;

procedure TfrmMonthAll.acRequestConsumerReAddressExecute(Sender: TObject);
begin
  inherited;
  if (rbTransitGD.Checked OR rbAgentGD.Checked) then
  with Tfrm_MonthNew.Create(Self) do
  Begin
    EditId:=oraMonth_all.FieldByName('ID').AsInteger;
    vIS_AGENT:=IS_AGENT;
    vSTATUS_ZAKAZ:=40;
    showmodal;
    if ModalResult=mrOk then
    Begin
      IsRefresh:=true;
      f_db.ReQuery(oraMonth_all,True);
      IsRefresh:=false;
      oraMonth_allAfterScroll(oraMonth_all);
    end;
    Free;
  End;
end;

procedure TfrmMonthAll.acRequestConsumerCancelExecute(Sender: TObject);
begin
  inherited;
  if (rbTransitGD.Checked OR rbAgentGD.Checked) then
  with Tfrm_MonthNew.Create(Self) do
  Begin
    EditId:=oraMonth_all.FieldByName('ID').AsInteger;
    vIS_AGENT:=IS_AGENT;
    vSTATUS_ZAKAZ:=50;
    showmodal;
    if ModalResult=mrOk then
    Begin
      IsRefresh:=true;
      f_db.ReQuery(oraMonth_all,True);
      IsRefresh:=false;
      oraMonth_allAfterScroll(oraMonth_all);
    end;
    Free;
  End;
end;

procedure TfrmMonthAll.acRequestConsumerHistoryExecute(Sender: TObject);
begin
  inherited;
  if oraMonth_all.State<>dsBrowse then oraMonth_all.Post;

  if (rbTransitGD.Checked OR rbAgentGD.Checked) then
  if not oraMonth_all.Eof then
  Begin
    Month_all_row.gMONTH_ALL_ID:=oraMonth_all.FieldByName('ID').AsInteger;
    Month_all_row.gDATE_PLAN:=oraMonth_all.FieldByName('DATE_PLAN').AsDateTime;
    with Tf_MonthAllRow.Create(Self) do
    Begin
      Showmodal;
      Free;
      IsRefresh:=true;
      f_db.ReQuery(oraMonth_all,True);
      IsRefresh:=false;
      oraMonth_allAfterScroll(oraMonth_all);
    End;
  end;
end;

procedure TfrmMonthAll.grMonthExit(Sender: TObject);
begin
  inherited;
  if oraMonth_All.State<>dsBrowse then oraMonth_All.Post;
end;

procedure TfrmMonthAll.acRequestWordExecute(Sender: TObject);
const
wdGoToBookmark=$FFFFFFFF;
var
MSWord   :Variant;
str      : string;
Src, Dst : String[255];
begin
  inherited;
  Src := 'u:\master\doc\request.doc' + #0;
  Dst := 'c:\tmp\request.doc' + #0;
  CopyFile(@Src[1], @Dst[1], False);
MSWord := createOleObject('Word.Application');
MSWord.application.documents.add(template := 'c:\tmp\request.doc');
MSWord.application.visible := true;
MSWord.application.activate;
MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='DateReq');
MSWord.application.Selection.TypeText(FormatDateTime('mmmm yyyy', oraMonth_all.FieldByName('date_plan').asDateTime));
MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='Agent');
MSWord.application.Selection.TypeText(oraMonth_all.FieldByName('Plat_full').AsString);
MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='Dogovor');
MSWord.application.Selection.TypeText(oraMonth_all.FieldByName('dog').AsString);
MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='UslOpl');
MSWord.application.Selection.TypeText(oraMonth_all.FieldByName('UslOpl').AsString);
MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='Npr');
MSWord.application.Selection.TypeText(oraMonth_all.FieldByName('Prod').AsString);
MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='Quantity');
MSWord.application.Selection.TypeText(oraMonth_all.FieldByName('request').AsString+' тонн/ '+oraMonth_all.FieldByName('kol').AsString+' цистерн');
MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='Quantity_speed');
MSWord.application.Selection.TypeText(oraMonth_all.FieldByName('speed_ves').AsString+' тонн/ '+oraMonth_all.FieldByName('speed_kol').AsString+' цистерн');
MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='VidOtgr');
MSWord.application.Selection.TypeText(oraMonth_all.FieldByName('Load').AsString);
MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='Stan');
MSWord.application.Selection.TypeText(oraMonth_all.FieldByName('Stan').AsString);
MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='kSt');
MSWord.application.Selection.TypeText(oraMonth_all.FieldByName('kSt').AsString);
MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='Poluch');
MSWord.application.Selection.TypeText(oraMonth_all.FieldByName('Potreb_Full').AsString);
MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='adr_Poluch');
MSWord.application.Selection.TypeText(oraMonth_all.FieldByName('ADDR_POTR').AsString);
MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='kPol');
MSWord.application.Selection.TypeText(oraMonth_all.FieldByName('GDKOD').AsString);
MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='OKPO');
MSWord.application.Selection.TypeText(oraMonth_all.FieldByName('okpo').AsString);
MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='prich');
MSWord.application.Selection.TypeText(oraMonth_all.FieldByName('prich').AsString);
MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='grafa4');
MSWord.application.Selection.TypeText(oraMonth_all.FieldByName('gr4').AsString);
MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='pospp');
MSWord.application.Selection.TypeText(oraMonth_all.FieldByName('PlanStruName').AsString);
MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='Client_Num');
MSWord.application.Selection.TypeText(oraMonth_all.FieldByName('input_number').AsString);
MSWord.application.Selection.GoTo(What:=wdGoToBookmark, Name:='Client_date');
MSWord.application.Selection.TypeText(oraMonth_all.FieldByName('input_date').AsString);
//str:='c:\tmp\'+oraMonth_all.FieldByName('input_number').AsString+'_'+trim(oraMonth_all.FieldByName('plat').AsString)+'_'+trim(oraMonth_all.FieldByName('id').AsString)+'.doc';
str:='c:\tmp\'+oraMonth_all.FieldByName('input_number').AsString+'_'+trim(oraMonth_all.FieldByName('id').AsString)+'.doc';
MSWord.application.ActiveDocument.SaveAs(str);
MSWord := unAssigned;
end;

end.
