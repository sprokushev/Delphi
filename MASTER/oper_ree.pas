unit oper_ree;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, StdCtrls, ComCtrls, Grids, DBGridEh,
  Buttons, Placemnt, RxLookup, ExtCtrls, PrnDbgeh, ActnList, ActnMan,
  ToolWin, ActnCtrls,ActnMenus, MdiForm, TB2Item, TB2Dock, TB2Toolbar,
  UCrpe32, UCrpeClasses, ImgList, XPStyleActnCtrls, TB2ExtItems,
  Menus, Mask, ToolEdit, DateUtils, MemTableDataEh, DataDriverEh, MemTableEh,
  EhLibDOA,PropFilerEh, PropStorageEh, GridsEh, DBGridEhGrouping;

type
  Tf_oper_ree = class(Tf_MDIForm)
    ora_Session: TOracleSession;
    q_oper_ree: TOracleDataSet;
    ds_oper_ree: TDataSource;
    q_ProdGr: TOracleDataSet;
    q_ProdGrID_NPR: TStringField;
    q_ProdGrNAME_NPR: TStringField;
    ds_ProdGr: TDataSource;
    q_Prod: TOracleDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    ds_Prod: TDataSource;
    q_Plat: TOracleDataSet;
    ds_Plat: TDataSource;
    q_PlatID: TIntegerField;
    q_PlatSHORT_NAME: TStringField;
    q_Poluch: TOracleDataSet;
    IntegerField1: TIntegerField;
    StringField3: TStringField;
    ds_Poluch: TDataSource;
    q_stan: TOracleDataSet;
    ds_stan: TDataSource;
    q_stanSTAN_KOD: TIntegerField;
    q_stanSTAN_NAME: TStringField;
    PrintDBGridEh1: TPrintDBGridEh;
    ActionManager1: TActionManager;
    acOperReePrintTable: TAction;
    acOperReePrintSved: TAction;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    Crpe1: TCrpe;
    StatusBar1: TStatusBar;
    TBSeparatorItem1: TTBSeparatorItem;
    TBItem3: TTBItem;
    acOperReeByCist: TAction;
    q_oper_reeDATE_OFORML: TDateTimeField;
    q_oper_reeSHORT_NAME: TStringField;
    q_oper_reeEMAIL: TStringField;
    q_oper_reeNAME_STAN: TStringField;
    q_oper_reeNAME_POLUCH: TStringField;
    q_oper_reeABBR_NPR: TStringField;
    q_oper_reeNUM_CIST: TStringField;
    q_oper_reeNOM_ZD: TStringField;
    q_oper_reePASP_ID: TStringField;
    q_oper_reeVES_BRUTTO: TFloatField;
    q_oper_reeKOL: TFloatField;
    q_oper_reeVES_CIST: TFloatField;
    acOperReeRefresh: TAction;
    acOperReeNoFilter: TAction;
    TBItem6: TTBItem;
    q_oper_reePASP: TStringField;
    acOperReeFilter: TAction;
    TBItem7: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    q_oper_reeMESTO_ID: TIntegerField;
    ImageList1: TImageList;
    q_oper_reeLOAD_TYPE_ID: TIntegerField;
    acOperReePrintPasp: TAction;
    TBSubmenuItem1: TTBSubmenuItem;
    acOperReePrint: TAction;
    TBItem4: TTBItem;
    q_oper_reeNOM_SF: TIntegerField;
    q_oper_reeTARIF: TFloatField;
    q_GrOtp: TOracleDataSet;
    IntegerField2: TIntegerField;
    StringField4: TStringField;
    ds_GrOtp: TDataSource;
    q_Sobstv: TOracleDataSet;
    IntegerField3: TIntegerField;
    StringField5: TStringField;
    ds_Sobstv: TDataSource;
    acOperReeToXLS: TAction;
    SaveDialog1: TSaveDialog;
    TBItem5: TTBItem;
    q_oper_reeDOG_NUMBER: TStringField;
    q_oper_reeVAGOWNER_NAME: TStringField;
    acSNP: TAction;
    TBItem8: TTBItem;
    TBPopupMenu1: TTBPopupMenu;
    TBItem9: TTBItem;
    TBItem10: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBItem14: TTBItem;
    TBItem16: TTBItem;
    q_oper_reeDATE_OTGR: TDateTimeField;
    q_oper_reeCAPACITY: TFloatField;
    q_oper_reeKALIBR_ID: TStringField;
    t_ProdTree: TOracleDataSet;
    ds_ProdTree: TDataSource;
    t_ProdTreePREV: TFloatField;
    t_ProdTreeKOD: TFloatField;
    t_ProdTreeNAME: TStringField;
    Panel3: TPanel;
    grRee: TDBGridEh;
    GroupBox1: TGroupBox;
    rg_Type_Otgr: TRadioGroup;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    sbNotPlat: TSpeedButton;
    sbNotGrOtp: TSpeedButton;
    sbNotPoluch: TSpeedButton;
    sbNotSobstv: TSpeedButton;
    sbNotStan: TSpeedButton;
    lc_plat: TRxDBLookupCombo;
    lc_Poluch: TRxDBLookupCombo;
    e_Nom_zd: TEdit;
    e_stan: TEdit;
    lc_stan: TRxDBLookupCombo;
    lc_GrOtp: TRxDBLookupCombo;
    lc_Sobstv: TRxDBLookupCombo;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    sbOperReeRefresh: TSpeedButton;
    rg_Export: TRadioGroup;
    Panel4: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    btYesOrNot: TSpeedButton;
    rg_KindOfDate: TRadioGroup;
    Time2: TDateTimePicker;
    time1: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Date2: TDateTimePicker;
    Date1: TDateTimePicker;
    q_oper_reePLANSTRU_ID: TFloatField;
    q_oper_reePLANSTRU_NAME: TStringField;
    acOperReeStream: TAction;
    TBItem13: TTBItem;
    q_oper_reeSVED_ID: TStringField;
    q_oper_reeID: TFloatField;
    q_oper_reePOLUCH_NAME: TStringField;
    q_oper_reeCENA: TFloatField;
    q_oper_reeCENA_OTP: TFloatField;
    q_oper_reeREGION_NAME: TStringField;
    q_oper_reeNUM_EXP_MAR: TStringField;
    q_oper_reeSUM_PROD: TFloatField;
    q_oper_reeSUM_AKCIZ: TFloatField;
    q_oper_reeSUM_PROD_NDS: TFloatField;
    q_oper_reeSUM_VOZN: TFloatField;
    q_oper_reeSUM_VOZN_NDS: TFloatField;
    q_oper_reeSUM_STRAH: TFloatField;
    q_oper_reeNUM_KVIT: TFloatField;
    q_oper_reeDATE_KVIT: TDateTimeField;
    q_oper_reeVZLIV: TFloatField;
    q_oper_reeTEMPER: TFloatField;
    q_oper_reeFAKT_PL: TFloatField;
    q_oper_reeEXPED_NAME: TStringField;
    q_oper_reeGU12_NOM_Z: TStringField;
    q_oper_reeCLIENT_NUMBER: TStringField;
    q_oper_reeCLIENT_DATE: TDateTimeField;
    q_oper_reeINPUT_NUMBER: TStringField;
    q_oper_reeINPUT_DATE: TDateTimeField;
    q_oper_reeBEG_NALIV_TIME: TDateTimeField;
    q_oper_reeEND_NALIV_TIME: TDateTimeField;
    q_oper_reeDATE_CENA: TDateTimeField;
    q_oper_reeTEX_PD_NAME: TStringField;
    q_oper_reeKOL_ED: TFloatField;
    q_oper_reeVES_ED: TFloatField;
    q_oper_reeUPAK_NAME: TStringField;
    q_oper_reeUPAK_VES: TFloatField;
    q_oper_reeTARIF_NDS: TFloatField;
    q_oper_reeTARIF_GUARD: TFloatField;
    q_oper_reeTARIF_GUARD_NDS: TFloatField;
    q_oper_reeFULL_VAGOWNER_NAME: TStringField;
    Label9: TLabel;
    sbNotPlanStru: TSpeedButton;
    lc_PlanStru: TRxDBLookupCombo;
    cb_TreePlanStru: TCheckBox;
    q_PlanStru: TOracleDataSet;
    dsPlanStru: TDataSource;
    q_PlanStruNAME: TStringField;
    q_PlanStruID: TFloatField;
    TBItem15: TTBItem;
    TBEditItem1: TTBEditItem;
    TBItem17: TTBItem;
    TBItem18: TTBItem;
    mteProd: TMemTableEh;
    dsdProd: TDataSetDriverEh;
    mteProdPREV: TFloatField;
    mteProdKOD: TFloatField;
    mteProdNAME: TStringField;
    ehProd: TDBGridEh;
    Splitter1: TSplitter;
    TBSeparatorItem5: TTBSeparatorItem;
    TBSubmenuItem2: TTBSubmenuItem;
    acOperReeLinkSF: TAction;
    acOperReeLinkMon: TAction;
    TBItem19: TTBItem;
    TBItem20: TTBItem;
    TBSeparatorItem6: TTBSeparatorItem;
    TBItem21: TTBItem;
    TBSeparatorItem7: TTBSeparatorItem;
    q_oper_reeBILL_ID: TFloatField;
    q_oper_reePOTREB_NAME: TStringField;
    q_oper_reeKOL_DN: TIntegerField;
    PropStorageEh1: TPropStorageEh;
    acLastReis: TAction;
    TBItem22: TTBItem;
    q_oper_reeCENA_BN_OTP_SNP: TFloatField;
    q_oper_reeCENA_OTP_SNP: TFloatField;
    q_oper_reeNPO_SF: TStringField;
    q_oper_reeKOD_ISU: TStringField;
    q_oper_reeTEX_PD_ID: TFloatField;
    q_oper_reeSVED_NUM: TFloatField;
    procedure TBEditItem1AcceptText(Sender: TObject; var NewText: string;
      var Accept: Boolean);
    procedure q_oper_reeFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure TBItem18Click(Sender: TObject);
    procedure TBItem17Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure q_oper_reeBeforeOpen(DataSet: TDataSet);
    procedure e_stanChange(Sender: TObject);
    procedure lc_stanChange(Sender: TObject);
    procedure acOperReePrintTableExecute(Sender: TObject);
    procedure acOperReePrintSvedExecute(Sender: TObject);
    procedure q_oper_reeAfterScroll(DataSet: TDataSet);
    procedure acOperReeByCistExecute(Sender: TObject);
    procedure acOperReeRefreshExecute(Sender: TObject);
    procedure acOperReeFilterExecute(Sender: TObject);
    procedure acOperReeNoFilterExecute(Sender: TObject);
    procedure acOperReePrintPaspExecute(Sender: TObject);
    procedure q_oper_reeAfterOpen(DataSet: TDataSet);
    procedure sbNotPlatClick(Sender: TObject);
    procedure sbNotGrOtpClick(Sender: TObject);
    procedure sbNotPoluchClick(Sender: TObject);
    procedure sbNotSobstvClick(Sender: TObject);
    procedure sbNotStanClick(Sender: TObject);
    procedure acOperReeToXLSExecute(Sender: TObject);
    procedure acSNPExecute(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure tv_Prod11CreateNode(Sender: TObject; Node: TTreeNode;
      DataSet: TDataSet);
    procedure btYesOrNotClick(Sender: TObject);
    procedure rg_KindOfDateClick(Sender: TObject);
    procedure acOperReeStreamExecute(Sender: TObject);
    procedure sbNotPlanStruClick(Sender: TObject);
    procedure q_PlanStruBeforeOpen(DataSet: TDataSet);
    procedure ehProdColumns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure TBItem21Click(Sender: TObject);
    procedure acOperReeLinkSFExecute(Sender: TObject);
    procedure acOperReeLinkMonExecute(Sender: TObject);
    procedure acLastReisExecute(Sender: TObject);
  private
    { Private declarations }
    Filter2ree: TStringList; // ������ ��� grSF
    ViewLinkMode:integer; // 1-����� �� ������
    ViewLinkFilter:string; // ������ ��� ���������� ������
  public
    { Public declarations }
    JN:word;
    OperReeFilter:string;
    QueryBegin,QueryEnd:TDateTime;
{    CrystalReport1: TCrystalReport;}
  end;

var
  f_oper_ree: Tf_oper_ree;
  gLinkMode:integer; // ����� ���������: 1-�� ������ 0-����������� ��������
  gLinkFilter:string; // ������ ��� ������ �� ������

implementation

uses ComObj,ForReport, opreeflt,CommCtrl,RXHints,DBGridEhImpExp,RxShell,
  DocStream, ForDB, main, oper_sf_new, oper_zayav, ForFiles, MO_Find;

{$R *.dfm}

procedure Tf_oper_ree.FormCreate(Sender: TObject);
var i:integer;
begin
  Filter2ree:=TStringList.Create;
  Filter2ree.Clear;
  SetHintStyle(hsEllipse,2,True,taLeftJustify);
  Time1.Time:=StrToTime('00:00');
  Time2.Time:=StrToTime('00:00');
  Date1.Date:=Date-1;
  Date2.Date:=Date+1;
  f_db.LogonMasterSession(ora_Session);
  f_db.SetUserGrants(ActionManager1);
  ViewLinkMode:=gLinkMode;
  ViewLinkFilter:=gLinkFilter;
  gLinkMode:=0;
  gLinkFilter:='';
  if f_main.UserMNOS then
  Begin
    rg_Type_Otgr.ItemIndex:=1;
    rg_Type_Otgr.Enabled:=false;
    for i:=1 to grRee.Columns.Count do
    Begin
      with grRee.Columns[i-1] do
      Begin
        Visible:=((FieldName='ABBR_NPR') or (FieldName='SVED_NUM') or (FieldName='NUM_CIST') or (FieldName='FULL_VAGOWNER_NAME') or
                  (FieldName='KOL') or (FieldName='VES_BRUTTO') or (FieldName='VES_CIST') or (FieldName='KALIBR_ID') or
                  (FieldName='CAPACITY') or (FieldName='DATE_OTGR') or (FieldName='BEG_NALIV_TIME') or (FieldName='END_NALIV_TIME') or (FieldName='DATE_OFORML') or
                  (FieldName='ID') or (FieldName='NAME_STAN') or (FieldName='REGION_NAME') or (FieldName='POLUCH_NAME') or
                  (FieldName='EXPED_NAME')or (FieldName='VAGOWNER_NAME'));
      End;
    End;
  end;
end;

procedure Tf_oper_ree.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    filter2ree.Clear;
  except
  end;
  q_Oper_ree.Close;
  q_ProdGr.Close;
  q_Prod.Close;
  q_Plat.Close;
  q_poluch.Close;
  q_PlanStru.Close;
  q_stan.Close;
  q_GrOtp.Close;
  q_Sobstv.Close;
  t_ProdTree.Close;
  Ora_session.LogOff;
  Action:=caFree;
end;

procedure Tf_oper_ree.FormShow(Sender: TObject);
var i:integer;
begin
  q_ProdGr.Open;
  q_Prod.Open;
  q_Plat.Open;
  q_Poluch.Open;
  q_stan.Open;
  q_GrOtp.Open;
  q_Sobstv.Open;
  q_PlanStru.Open;
  t_ProdTree.Open;
{  mteProd.TreeList.Active := True;
  mteProd.TreeList.KeyFieldName := 'KOD';
  mteProd.TreeList.RefParentFieldName := 'PREV';}
  mteProd.Open;
  
  q_oper_ree.Open;
  if filter2ree.Count=0 then
  for i:=1 to q_oper_ree.FieldCount do
  Begin
    Filter2ree.Add('');
  end;
  if not f_db.CheckGrant('acOper_Ree') then
  Begin
    ShowMessage('�� �� ������ ����� �� �������� ��������!');
    Close;
  end;
end;

procedure Tf_oper_ree.q_oper_reeBeforeOpen(DataSet: TDataSet);
begin
  QueryBegin:=Now;
  with q_Oper_ree do
  begin
    SQL[32]:='';

    if f_main.UserSNP then
    Begin
      SQL[12]:=' MAX(NVL((select max(k2n.npo_sf) from KTU_2_NPO_SF k2n where k2n.NOM_DOK=kvit.bill_id),'''')) as npo_sf, '+
               ' MAX(NVL((select max(bp.cena_bn) from KTU_2_NPO_SF k2n, bills_parus b, bill_pos_parus bp where k2n.NOM_DOK=kvit.bill_id and k2n.NPO_SF=b.NPO_SF and b.NOM_DOK=bp.NOM_DOK and bp.bill_pos_parus_id=1 and bp.ves<>0),0)) as cena_bn_otp_snp, '+
               ' MAX(NVL((select max(bp.cena) from KTU_2_NPO_SF k2n, bills_parus b, bill_pos_parus bp where k2n.NOM_DOK=kvit.bill_id and k2n.NPO_SF=b.NPO_SF and b.NOM_DOK=bp.NOM_DOK and bp.bill_pos_parus_id=1 and bp.ves<>0),0)) as cena_otp_snp,';
    End
    else
    Begin
      SQL[12]:=' '''' as npo_sf, 0 as cena_bn_otp_snp, 0 as cena_otp_snp,';
    End;

    if acOperReeByCist.Checked then
      begin
        SQL[36]:=',kvit.num_cist,kvit.id';
        SQL[8]:='KVIT.NUM_CIST,';
        SQL[9]:='TO_NUMBER(KVIT.ID) as ID,'
      end
    else
      begin
        SQL[36]:='';
        SQL[8]:='''��������'' as NUM_CIST,';
        SQL[9]:='0 as ID,'
      end;
    if acSNP.Checked then
      begin
        if YearOf(Date1.Date)>=2005 then
          SQL[22]:=' (KLS_DOG.ID = Z2.DOG_ID) AND (KLS_DOG.PREDPR_ID<>2641) AND '
        else
          if YearOf(Date1.Date)*100+MonthOf(Date1.Date)>=200903 then
            SQL[22]:=' (KLS_DOG.ID = Z2.DOG_ID) AND (KLS_DOG.PREDPR_ID<>10) AND (KLS_DOG.PREDPR_ID<>2641) AND '
          else
            SQL[22]:=' (KLS_DOG.ID = MONTH.NPODOG_ID) AND ';
      end
    else
      begin
        SQL[22]:='  (KLS_DOG.ID (+) = MONTH.DOG_ID) AND'
      end;

    If ViewLinkMode=1 Then
    Begin
      Date1.Date:=EncodeDateDay(2005,1);
      If ViewLinkFilter<>'' Then
      begin
          SQL[30]:='1=1 And';
          SQL[31]:='1=1';
        SQL[32]:=SQL[32]+' AND '+ViewLinkFilter;
      end;
    end
    else
    begin
      if rg_KindOfDate.ItemIndex=0 then
        begin
          SQL[30]:='kvit.date_oforml>=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date1.Date)+' '+FormatDateTime('hh:mm',time1.Time)+''',''dd.mm.yyyy hh24:mi'') And';
          SQL[31]:='kvit.date_oforml<=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date2.Date)+' '+FormatDateTime('hh:mm',time2.Time)+''',''dd.mm.yyyy hh24:mi'')';
        end;
      if rg_KindOfDate.ItemIndex=1 then
        begin
          SQL[30]:='kvit.date_kvit>=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date1.Date)+''',''dd.mm.yyyy'') And';
          SQL[31]:='kvit.date_kvit<=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date2.Date)+''',''dd.mm.yyyy'')';
        end;
      if rg_KindOfDate.ItemIndex=2 then
        begin
          SQL[30]:='kvit.date_otgr>=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date1.Date)+''',''dd.mm.yyyy'') And';
          SQL[31]:='kvit.date_otgr<=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date2.Date)+''',''dd.mm.yyyy'')';
        end;
      SQL[32]:='';
      //�������� �� ��
      If rg_type_otgr.ItemIndex = 1 Then
       SQL[32]:=SQL[32]+' AND kls_vid_otgr.load_type_id=1';
      //��� ���������������
      If rg_type_otgr.ItemIndex = 2 Then
       SQL[32]:=SQL[32]+' AND kls_vid_otgr.load_type_id=6';
      If rg_type_otgr.ItemIndex = 3 Then
       SQL[32]:=SQL[32]+' AND kls_vid_otgr.load_type_id=2';
      If rg_type_otgr.ItemIndex = 4 Then
       SQL[32]:=SQL[32]+' AND kls_vid_otgr.load_type_id=5';
      // �������

      if mteProd.fieldbyname('kod').asinteger<>-1 then
        begin
          if (mteProd.fieldbyname('kod').asinteger>=100000000) and (mteProd.fieldbyname('kod').asinteger<=999999999) then
            SQL[32]:=SQL[32]+' AND kls_prod.id_group_npr'+btYesOrNot.Caption+''''+IntToStr(Round(mteProd.fieldbyname('kod').asinteger/10000))+'''';
          if (mteProd.fieldbyname('kod').asinteger>=1000000) and (mteProd.fieldbyname('kod').asinteger<=9999999) then
            SQL[32]:=SQL[32]+' AND kls_prod.PROD_PLAN_ID'+btYesOrNot.Caption+IntToStr(Round(mteProd.fieldbyname('kod').asinteger/100));
          if (mteProd.fieldbyname('kod').asinteger>=10000) and (mteProd.fieldbyname('kod').asinteger<=99999) then
            SQL[32]:=SQL[32]+' AND kls_prod.id_npr'+btYesOrNot.Caption+''''+IntToStr(Round(mteProd.fieldbyname('kod').asinteger))+'''';
        end;

{      if tv_Prod.Selected.Index<>-1 then
        begin
          if (tv_Prod.Selected.StateIndex>=100000000) and (tv_Prod.Selected.StateIndex<=999999999) then
            SQL[32]:=SQL[32]+' AND kls_prod.id_group_npr'+btYesOrNot.Caption+''''+IntToStr(Round(tv_Prod.Selected.StateIndex/10000))+'''';
          if (tv_Prod.Selected.StateIndex>=1000000) and (tv_Prod.Selected.StateIndex<=9999999) then
            SQL[32]:=SQL[32]+' AND kls_prod.PROD_PLAN_ID'+btYesOrNot.Caption+IntToStr(Round(tv_Prod.Selected.StateIndex/100));
          if (tv_Prod.Selected.StateIndex>=10000) and (tv_Prod.Selected.StateIndex<=99999) then
            SQL[32]:=SQL[32]+' AND kls_prod.id_npr'+btYesOrNot.Caption+''''+IntToStr(Round(tv_Prod.Selected.StateIndex))+'''';
        end; }
{      if rg_Prod.ItemIndex=1 then
         SQL[31]:=SQL[31]+' AND kls_prod.id_group_npr'+btNotProdGr.Caption+''''+lc_ProdGr.Value+'''';
      if rg_Prod.ItemIndex=2 then
         SQL[31]:=SQL[31]+' AND kvit.prod_id_npr'+btNotProd.Caption+''''+lc_Prod.Value+'''';
}
      //�� ��� �����������
      If lc_plat.Value<>'0' Then
        SQL[32]:=SQL[32]+' AND plat.id'+sbNotPlat.Caption+lc_Plat.Value;
      If lc_Poluch.Value<>'0' Then
         SQL[32]:=SQL[32]+' AND poluch.id'+sbNotPoluch.Caption+lc_Poluch.Value;
      If lc_PlanStru.Value<>'0' Then
      Begin
        if cb_TreePlanStru.Checked then
          if sbNotPlanStru.Caption='=' then
            SQL[32]:=SQL[32]+' AND month.planstru_id in (select id from kls_planstru start with id='+lc_PlanStru.Value+' connect by prior id=parent_id)'
          else
            SQL[32]:=SQL[32]+' AND month.planstru_id not in (select id from kls_planstru start with id='+lc_PlanStru.Value+' connect by prior id=parent_id)'
        else
          SQL[32]:=SQL[32]+' AND month.planstru_id'+sbNotPlanStru.Caption+lc_PlanStru.Value;
      end;
      If Trim(e_Nom_Zd.Text)<>'' Then
         SQL[32]:=SQL[32]+' AND kvit.nom_zd LIKE '''+Trim(e_nom_zd.Text)+'%''';
      If lc_Stan.Value<>'0' Then
         SQL[32]:=SQL[32]+' AND kls_stan.stan_kod'+sbNotStan.Caption+lc_Stan.Value;
      If lc_GrOtp.Value<>'0' Then
         SQL[32]:=SQL[32]+' AND month.grotp_id'+sbNotGrOtp.Caption+lc_GrOtp.Value;
      If lc_Sobstv.Value<>'0' Then
         SQL[32]:=SQL[32]+' AND month.npr_sobstv_id'+sbNotSobstv.Caption+lc_Sobstv.Value;
      If OperReeFilter<>'' Then
        begin
          SQL[32]:=SQL[32]+' AND '+OperReeFilter;
          acOperReeNoFilter.Enabled:=True;
        end
      else
        begin
          acOperReeNoFilter.Enabled:=False;
        end;
      // ������� / �� ������
      If rg_Export.ItemIndex=1 Then
         SQL[32]:=SQL[32]+' AND month.is_exp=0';
      If rg_Export.ItemIndex=2 Then
         SQL[32]:=SQL[32]+' AND month.is_exp=1';
    end;
  end;
  q_oper_ree.SQL.SaveToFile('c:\tmp\1.sql');
end;

procedure Tf_oper_ree.e_stanChange(Sender: TObject);
begin
  lc_stan.Value:=Trim(e_stan.Text);
end;

procedure Tf_oper_ree.lc_stanChange(Sender: TObject);
begin
  e_stan.Text:=lc_Stan.Value
end;

procedure Tf_oper_ree.acOperReePrintTableExecute(Sender: TObject);
begin
  PrintDBGridEh1.Preview;
end;

procedure Tf_oper_ree.acOperReePrintSvedExecute(Sender: TObject);
begin
  with TF_ForReport.Create(f_main) do
    begin
      Caption:='�������� �'+q_oper_reeSVED_NUM.AsString;
      if q_oper_reeLOAD_TYPE_ID.AsInteger=2 then
        Crpe.ReportName:=F_FileUtils.CheckReport('Sved_sam.rpt',f_main.TempNetPath)
      else
        Crpe.ReportName:=F_FileUtils.CheckReport('Sved_gd.rpt',f_main.TempNetPath);
//      Crpe.ParamFields.Retrieve;
      Crpe.ParamFields[0].CurrentValue := q_oper_reeSVED_NUM.AsString;
      Crpe.ParamFields[1].CurrentValue := q_oper_reeNOM_ZD.AsString;
      Crpe.ParamFields[2].CurrentValue := '';
      {Run the Report}
      Crpe.Execute;
    end;
end;

procedure Tf_oper_ree.q_oper_reeAfterScroll(DataSet: TDataSet);
begin
  inherited;
  StatusBar1.Panels[1].Text:='��������� - '+FormatDateTime('dd.mm.yy hh:nn',q_oper_reeDATE_OFORML.AsDateTime);
end;

procedure Tf_oper_ree.acOperReeByCistExecute(Sender: TObject);
begin
  inherited;
  acOperReeByCist.Checked:=not acOperReeByCist.Checked;
end;

procedure Tf_oper_ree.acOperReeRefreshExecute(Sender: TObject);
begin
  inherited;
  f_db.ReQuery(q_PlanStru,false);
  f_db.ReQuery(q_Oper_ree,False);
end;

procedure Tf_oper_ree.acOperReeFilterExecute(Sender: TObject);
begin
  inherited;
  with TF_OperReeFilter.Create(Self) do
  Begin
    FilterText:=OperReeFilter;
    FilterTable:='KVIT';
    If ShowModal=mrOk then
    Begin
      OperReeFilter:=FilterText;
      acOperReeRefreshExecute(Sender);
      StatusBar1.Panels[2].Text:='������ - '+OperReeFilter;
    End;
    Free;
  End;
end;

procedure Tf_oper_ree.acOperReeNoFilterExecute(Sender: TObject);
begin
  inherited;
  OperReeFilter:='';
  StatusBar1.Panels[2].Text:='������ - '+OperReeFilter;
  acOperReeRefreshExecute(Sender);
end;

procedure Tf_oper_ree.acOperReePrintPaspExecute(Sender: TObject);
begin
  inherited;
  with TF_ForReport.Create(f_main) do
    begin
      Caption:='������� �'+q_oper_reePASP.AsString;
      Crpe.ReportName:=F_FileUtils.CheckReport('pasp.rpt',f_main.TempNetPath);
      Crpe.ParamFields[0].CurrentValue := q_oper_reePASP_ID.AsString;
      Crpe.ParamFields[1].CurrentValue := q_oper_reeMESTO_ID.AsString;
      Crpe.ParamFields[2].CurrentValue := '';
      {Run the Report}
      Crpe.Execute;
    end;
end;

procedure Tf_oper_ree.q_oper_reeAfterOpen(DataSet: TDataSet);
begin
  inherited;
  QueryEnd:=Now;
  StatusBar1.Panels[0].Text:='����� ���������� '+FormatDateTime('nn:ss.zzz',QueryEnd-QueryBegin)
end;

procedure Tf_oper_ree.sbNotPlatClick(Sender: TObject);
begin
  inherited;
  if sbNotPlat.Caption='<>' then sbNotPlat.Caption:='='
  else sbNotPlat.Caption:='<>';
end;

procedure Tf_oper_ree.sbNotGrOtpClick(Sender: TObject);
begin
  inherited;
  if sbNotGrOtp.Caption='<>' then sbNotGrOtp.Caption:='='
  else sbNotGrOtp.Caption:='<>';
end;

procedure Tf_oper_ree.sbNotPoluchClick(Sender: TObject);
begin
  inherited;
  if sbNotPoluch.Caption='<>' then sbNotPoluch.Caption:='='
  else sbNotPoluch.Caption:='<>';
end;

procedure Tf_oper_ree.sbNotSobstvClick(Sender: TObject);
begin
  inherited;
  if sbNotSobstv.Caption='<>' then sbNotSobstv.Caption:='='
  else sbNotSobstv.Caption:='<>';
end;

procedure Tf_oper_ree.sbNotStanClick(Sender: TObject);
begin
  inherited;
  if sbNotStan.Caption='<>' then sbNotStan.Caption:='='
  else sbNotStan.Caption:='<>';
end;

procedure Tf_oper_ree.acOperReeToXLSExecute(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
    if not FileExists(SaveDialog1.FileName) then
      begin
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,grRee,SaveDialog1.FileName,True);
        FileExecute(SaveDialog1.FileName,'','',esMaximized);
      end
    else
      if MessageDlg('���� ��� ����������! ����������?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,grRee,SaveDialog1.FileName,True);
          FileExecute(SaveDialog1.FileName,'','',esMaximized);
        end
end;

procedure Tf_oper_ree.acSNPExecute(Sender: TObject);
begin
  inherited;
  acSNP.Checked:=not acSNP.Checked;
{  if acLUK_SNP.Checked then
    acLUK_SNP.Captioin:='�������� ������'�'
  else
    acLUK_SNP.Captioin:='�������� ������'�'}
end;

procedure Tf_oper_ree.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  ehProd.Width:=0;
end;

procedure Tf_oper_ree.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  ehProd.Width:=200;
end;

procedure Tf_oper_ree.tv_Prod11CreateNode(Sender: TObject; Node: TTreeNode;
  DataSet: TDataSet);
begin
  inherited;
  Node.StateIndex:=DataSet.FieldByName('KOD').AsInteger;
end;

procedure Tf_oper_ree.btYesOrNotClick(Sender: TObject);
begin
  inherited;
  if btYesOrNot.Caption='=' then
    btYesOrNot.Caption:='<>'
  else
    btYesOrNot.Caption:='='
end;

procedure Tf_oper_ree.rg_KindOfDateClick(Sender: TObject);
begin
  inherited;
  if rg_KindOfDate.ItemIndex=0 then
    begin
      Time1.Enabled:=True;
      Time2.Enabled:=True;
    end
  else
    begin
      Time1.Enabled:=False;
      Time2.Enabled:=False;
    end
end;

procedure Tf_oper_ree.acOperReeStreamExecute(Sender: TObject);
begin
  inherited;
  DocStream.StartStream:='OTGR';
  DocStream.StartStage:='KVIT';
  if acOperReeByCist.Checked then
    DocStream.StartCondition:='KVIT.ID='+q_oper_ree.FieldByName('ID').AsString
  else
    DocStream.StartCondition:='KVIT.SVED_ID='''+q_oper_ree.FieldByName('SVED_ID').AsString+'''';
  with tf_DocStream.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_oper_ree.sbNotPlanStruClick(Sender: TObject);
begin
  inherited;
  if sbNotPlanStru.Caption='<>' then sbNotPlanStru.Caption:='='
  else sbNotPlanStru.Caption:='<>';
end;

procedure Tf_oper_ree.q_PlanStruBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  with q_PlanStru do
  Begin
    if acSNP.Checked then
      SQL[2]:='WHERE IS_SNP=1'
    else
      SQL[2]:='WHERE 1=1';
    if rg_KindOfDate.ItemIndex=0 then
    begin
      SQL[3]:='AND BEGIN_DATE<=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date2.Date+1)+''',''dd.mm.yyyy'')';
      SQL[4]:='AND END_DATE>=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date1.Date-1)+''',''dd.mm.yyyy'')';
    end
    else
    begin
      SQL[3]:='AND BEGIN_DATE<=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date2.Date)+''',''dd.mm.yyyy'')';
      SQL[4]:='AND END_DATE>=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date1.Date)+''',''dd.mm.yyyy'')';
    end;
  end;
end;

procedure Tf_oper_ree.ehProdColumns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
  inherited;
 if mteProd.TreeNodeExpanded  then
   params.ImageIndex:=41
 else
  if mteProd.TreeNodeHasChildren then
   params.ImageIndex:=40
  else
   params.ImageIndex:=38;

end;

procedure Tf_oper_ree.TBItem17Click(Sender: TObject);
begin
  inherited;
  f_db.FilterCurrentValue(grRee,filter2ree);
end;

procedure Tf_oper_ree.TBItem18Click(Sender: TObject);
begin
  inherited;
  f_db.FilterCLear(grRee,filter2ree);
end;

procedure Tf_oper_ree.q_oper_reeFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept:=f_db.AcceptFilterRecord(grRee,filter2ree);
end;

procedure Tf_oper_ree.TBEditItem1AcceptText(Sender: TObject;
  var NewText: string; var Accept: Boolean);
begin
  inherited;
  f_db.FilterAcceptText(grRee,filter2ree,NewText,Accept);
end;

procedure Tf_oper_ree.TBItem21Click(Sender: TObject);
begin
  inherited;
  f_db.EditInMemo(grRee);
end;

procedure Tf_oper_ree.acOperReeLinkSFExecute(Sender: TObject);
begin
  inherited;
  if not q_oper_ree.eof and (q_oper_reeBILL_ID.AsString<>'') then
  Begin
    oper_sf_new.gLinkMode:=1;
    oper_sf_new.gLinkFilter:='(v_sf.nom_dok='+q_oper_reeBILL_ID.AsString+')';
    with Tf_oper_sf.Create(Self) do
      begin
        FormStyle:=fsMDIChild;
      end;
  end;
end;

procedure Tf_oper_ree.acOperReeLinkMonExecute(Sender: TObject);
begin
  inherited;
  if not q_oper_ree.eof and (q_oper_reeNOM_ZD.AsString<>'') then
  Begin
    oper_zayav.gLinkMode:=1;
    oper_zayav.gLinkFilter:='(month.nom_zd='''+q_oper_reeNOM_ZD.AsString+''')';
    with Tf_oper_zayav.Create(Self) do
      begin
        FormStyle:=fsMDIChild;
      end;
  end;
end;

procedure Tf_oper_ree.acLastReisExecute(Sender: TObject);
begin
  inherited;
  with tf_FindVagon.create(self) do
  Begin
//    DocTitleID:=0;
    q_Source.Session:=ora_Session;
    q_Structure.Session:=ora_Session;
    q_Structure.SetVariable(':STRUCTURE','FIND_LAST_REIS');
    acSelPosition.Enabled:=false;
    acSelPosition.Visible:=false;
    memo1.Lines:=q_oper_ree.SQL;
    cbSearchStr.text:=q_oper_reeNUM_CIST.AsString;
    ShowModal;
    Free;
  end;
end;

end.
