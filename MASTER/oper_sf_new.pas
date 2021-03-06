unit oper_sf_new;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, StdCtrls, ComCtrls, Grids, DBGridEh,
  Buttons, Placemnt, RxLookup, ExtCtrls, PrnDbgeh, ActnList, ActnMan,
  ToolWin, ActnCtrls,ActnMenus, MdiForm, TB2Item, TB2Dock,
  TB2Toolbar, UCrpe32, UCrpeClasses, ImgList, XPStyleActnCtrls, TB2ExtItems,DateUtils,
  EhLibDOA,Menus, GridsEh;

type
  Tf_oper_sf = class(Tf_MDIForm)
    GroupBox1: TGroupBox;
    grSF: TDBGridEh;
    ora_Session: TOracleSession;
    q_oper_sf: TOracleDataSet;
    ds_oper_ree: TDataSource;
    FormStorage1: TFormStorage;
    rg_Type_Otgr: TRadioGroup;
    rg_Prod: TRadioGroup;
    lc_ProdGr: TRxDBLookupCombo;
    q_ProdGr: TOracleDataSet;
    q_ProdGrID_NPR: TStringField;
    q_ProdGrNAME_NPR: TStringField;
    ds_ProdGr: TDataSource;
    q_Prod: TOracleDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    ds_Prod: TDataSource;
    lc_Prod: TRxDBLookupCombo;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Date1: TDateTimePicker;
    Date2: TDateTimePicker;
    Label2: TLabel;
    lc_plat: TRxDBLookupCombo;
    Label3: TLabel;
    q_Plat: TOracleDataSet;
    ds_Plat: TDataSource;
    q_PlatID: TIntegerField;
    q_PlatSHORT_NAME: TStringField;
    q_Poluch: TOracleDataSet;
    IntegerField1: TIntegerField;
    StringField3: TStringField;
    ds_Poluch: TDataSource;
    Label4: TLabel;
    lc_Poluch: TRxDBLookupCombo;
    Label5: TLabel;
    e_Nom_zd: TEdit;
    Label6: TLabel;
    e_stan: TEdit;
    q_stan: TOracleDataSet;
    ds_stan: TDataSource;
    lc_stan: TRxDBLookupCombo;
    q_stanSTAN_KOD: TIntegerField;
    q_stanSTAN_NAME: TStringField;
    PrintDBGridEh1: TPrintDBGridEh;
    ActionManager1: TActionManager;
    acViewSFPrintTable: TAction;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem2: TTBItem;
    Crpe1: TCrpe;
    StatusBar1: TStatusBar;
    acViewSFRefresh: TAction;
    acViewSFNoFilter: TAction;
    TBItem6: TTBItem;
    acViewSFFilter: TAction;
    TBItem7: TTBItem;
    Panel2: TPanel;
    sbRefresh: TSpeedButton;
    ImageList1: TImageList;
    TBSubmenuItem1: TTBSubmenuItem;
    acViewSFPrint: TAction;
    sbNotPlat: TSpeedButton;
    sbNotPoluch: TSpeedButton;
    sbNotStan: TSpeedButton;
    btNotProd: TBitBtn;
    btNotProdGr: TBitBtn;
    acViewSFToXLS: TAction;
    SaveDialog1: TSaveDialog;
    TBItem5: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    acViewSFDocStream: TAction;
    acEditSF: TAction;
    TBItem1: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    acNewSF: TAction;
    TBItem3: TTBItem;
    TBPopupMenu1: TTBPopupMenu;
    TBItem9: TTBItem;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBItem14: TTBItem;
    Splitter1: TSplitter;
    GroupBox3: TGroupBox;
    q_sf_pos: TOracleDataSet;
    ds_sf_pos: TDataSource;
    DBGridEh2: TDBGridEh;
    Splitter2: TSplitter;
    DBGridEh3: TDBGridEh;
    q_sf_pos_opl: TOracleDataSet;
    ds_sf_pos_opl: TDataSource;
    Timer1: TTimer;
    TBDock2: TTBDock;
    TBToolbar2: TTBToolbar;
    acPayThisBill: TAction;
    TBItem4: TTBItem;
    oraFOR_BILLS: TOraclePackage;
    acPayOffThisBill: TAction;
    TBItem8: TTBItem;
    acDelSF: TAction;
    TBItem10: TTBItem;
    TBItem13: TTBItem;
    TBEditItem1: TTBEditItem;
    TBItem15: TTBItem;
    TBItem16: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBItem17: TTBItem;
    TBSeparatorItem5: TTBSeparatorItem;
    TBSubmenuItem2: TTBSubmenuItem;
    TBItem18: TTBItem;
    TBSeparatorItem6: TTBSeparatorItem;
    TBItem20: TTBItem;
    acSFLinkPayments: TAction;
    acSFLinkKvit: TAction;
    TBItem19: TTBItem;
    acSFLinkMonth: TAction;
    TBItem21: TTBItem;
    q_oper_sfNOM_SF: TIntegerField;
    q_oper_sfNOM_DOK: TFloatField;
    q_oper_sfDATE_VYP_SF: TDateTimeField;
    q_oper_sfVES: TFloatField;
    q_oper_sfVES_BRUTTO: TFloatField;
    q_oper_sfKOL: TFloatField;
    q_oper_sfDOG_NUMBER: TStringField;
    q_oper_sfSHORT_NAME: TStringField;
    q_oper_sfNAME_STAN: TStringField;
    q_oper_sfNAME_POLUCH: TStringField;
    q_oper_sfABBR_NPR: TStringField;
    q_oper_sfNOM_ZD: TStringField;
    q_oper_sfLOAD_TYPE_ID: TIntegerField;
    q_oper_sfSUMMA_DOK: TFloatField;
    q_oper_sfPROD_SUM: TFloatField;
    q_oper_sfID_NPR: TStringField;
    q_oper_sfID_GROUP_NPR: TStringField;
    q_oper_sfDOG_ID: TIntegerField;
    q_oper_sfPLAT_ID: TIntegerField;
    q_oper_sfPOLUCH_ID: TIntegerField;
    q_oper_sfSTAN_KOD: TIntegerField;
    q_oper_sfGROTP_ID: TIntegerField;
    q_oper_sfNPR_SOBSTV_ID: TIntegerField;
    q_oper_sfDATE_KVIT: TDateTimeField;
    q_oper_sfKOL_DN: TIntegerField;
    q_oper_sfDATE_PLAT: TDateTimeField;
    q_sf_posABBR_NPR: TStringField;
    q_sf_posLONG_NAME_NPR: TStringField;
    q_sf_posBILL_POS_ID: TIntegerField;
    q_sf_posVES: TFloatField;
    q_sf_posCENA: TFloatField;
    q_sf_posSUMMA: TFloatField;
    q_sf_posSUMMA_BN: TFloatField;
    q_sf_posSUMMA_NDS20: TFloatField;
    q_sf_posPAYED_SUMMA: TFloatField;
    q_sf_pos_oplID: TFloatField;
    q_sf_pos_oplBILL_POS_ID: TIntegerField;
    q_sf_pos_oplPAYMENTS_ID: TFloatField;
    q_sf_pos_oplSUMMA: TFloatField;
    q_sf_pos_oplDATE_REALIZ: TDateTimeField;
    q_sf_pos_oplSUMMA_NDS: TFloatField;
    q_sf_pos_oplSUMMA_AKCIZ: TFloatField;
    q_sf_pos_oplVES: TFloatField;
    q_sf_pos_oplNUM_PLAT: TStringField;
    q_sf_pos_oplDATE_PLAT: TDateTimeField;
    q_sf_pos_oplNAZN_PLAT: TStringField;
    q_sf_posNOM_DOK: TFloatField;
    q_sf_pos_oplNOM_DOK: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure q_oper_sfBeforeOpen(DataSet: TDataSet);
    procedure rg_ProdClick(Sender: TObject);
    procedure e_stanChange(Sender: TObject);
    procedure lc_stanChange(Sender: TObject);
    procedure acViewSFPrintTableExecute(Sender: TObject);
    procedure acViewSFRefreshExecute(Sender: TObject);
    procedure acViewSFFilterExecute(Sender: TObject);
    procedure acViewSFNoFilterExecute(Sender: TObject);
    procedure q_oper_sfAfterOpen(DataSet: TDataSet);
    procedure sbNotPlatClick(Sender: TObject);
    procedure sbNotPoluchClick(Sender: TObject);
    procedure sbNotStanClick(Sender: TObject);
    procedure btNotProdClick(Sender: TObject);
    procedure btNotProdGrClick(Sender: TObject);
    procedure acViewSFToXLSExecute(Sender: TObject);
    procedure acViewSFDocStreamExecute(Sender: TObject);
    procedure acEditSFExecute(Sender: TObject);
    procedure grSFDblClick(Sender: TObject);
    procedure acNewSFExecute(Sender: TObject);
    procedure q_sf_posBeforeOpen(DataSet: TDataSet);
    procedure q_oper_sfAfterScroll(DataSet: TDataSet);
    procedure q_sf_pos_oplBeforeOpen(DataSet: TDataSet);
    procedure q_sf_posAfterScroll(DataSet: TDataSet);
    procedure Timer1Timer(Sender: TObject);
    procedure acPayThisBillExecute(Sender: TObject);
    procedure acPayOffThisBillExecute(Sender: TObject);
    procedure q_sf_pos_oplAfterOpen(DataSet: TDataSet);
    procedure acDelSFExecute(Sender: TObject);
    procedure TBEditItem1AcceptText(Sender: TObject; var NewText: String;
      var Accept: Boolean);
    procedure TBItem15Click(Sender: TObject);
    procedure TBItem16Click(Sender: TObject);
    procedure q_oper_sfFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure TBItem17Click(Sender: TObject);
    procedure acSFLinkPaymentsExecute(Sender: TObject);
    procedure acSFLinkKvitExecute(Sender: TObject);
    procedure acSFLinkMonthExecute(Sender: TObject);
  private
    { Private declarations }
    Filter2SF: TStringList; // ������ ��� grSF
    ViewLinkMode:integer; // 1-����� �� ������
    ViewLinkFilter:string; // ������ ��� ���������� ������
    ViewSFFilter:string; // ������ ��� ������
    ViewSFPlatID:integer;
    JN:word;
    QueryBegin,QueryEnd:TDateTime;
  public
    { Public declarations }
  end;

var
  f_oper_sf: Tf_oper_sf;
  gLinkMode:integer; // ����� ���������: 1-�� ������ 0-����������� ��������
  gLinkFilter:string; // ������ ��� ������ �� ������
  gSFPlatID:integer;

implementation

uses ForDB,ComObj,ForReport, opreeflt,CommCtrl,RXHints,DBGridEhImpExp,RxShell,
  DocStream, main, Math, Payments, oper_ree, oper_zayav;

{$R *.dfm}

procedure Tf_oper_sf.FormCreate(Sender: TObject);
begin
  Filter2sf:=TStringList.Create;
  Filter2sf.Clear;
  SetHintStyle(hsEllipse,2,True,taLeftJustify);
  Date1.Date:=StartOfTheMonth(Date);
  Date2.Date:=Date+1;
  f_db.LogonMasterSession(Ora_session);
  f_db.SetUserGrants(ActionManager1);
  ViewLinkMode:=gLinkMode;
  ViewLinkFilter:=gLinkFilter;
  ViewSFPlatID:=gSFPlatID;
  gLinkMode:=0;
  gLinkFilter:='';
  gSFPlatID:=0;
end;

procedure Tf_oper_sf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    filter2SF.Clear;
  except
  end;
  q_sf_pos.Close;
  q_Oper_Sf.Close;
  q_ProdGr.Close;
  q_Prod.Close;
  q_Plat.Close;
  q_poluch.Close;
  q_stan.Close;
  Ora_session.LogOff;
  Action:=caFree;
end;

procedure Tf_oper_sf.FormShow(Sender: TObject);
var i:integer;
begin
  q_oper_Sf.Open;
  q_sf_pos.Open;
  q_ProdGr.Open;
  q_Prod.Open;
  q_Plat.Open;
  q_Poluch.Open;
  q_stan.Open;

  if filter2sf.Count=0 then
  for i:=1 to q_oper_sf.FieldCount do
  Begin
    Filter2sf.Add('');
  end;

  if not f_db.CheckGrant('acSFView') then
  Begin
    ShowMessage('�� �� ������ ����� �� �������� ������-������!');
    Close;
  end;
end;

procedure Tf_oper_sf.q_oper_sfBeforeOpen(DataSet: TDataSet);
begin
  QueryBegin:=Now;
  with q_oper_SF do
  begin
    // �� �������
    SQL[6]:='';
    If ViewLinkMode=1 Then
    Begin
      Date1.Date:=EncodeDateDay(2005,1);
      lc_plat.KeyValue:=ViewSFPlatID;

      If ViewLinkFilter<>'' Then
      begin
        SQL[6]:=SQL[6]+' AND '+ViewLinkFilter;
      end;
    end
    else
    begin
      SQL[4]:='AND date_vyp_sf>=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date1.Date)+''',''dd.mm.yyyy'')';
      SQL[5]:='AND date_vyp_sf<=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date2.Date)+''',''dd.mm.yyyy'')';

      //��� ���������������
      //�������� �� ��
      If rg_type_otgr.ItemIndex = 1 Then
       SQL[6]:=SQL[6]+' AND load_type_id=1';
      //����������
      If rg_type_otgr.ItemIndex = 2 Then
       SQL[6]:=SQL[6]+' AND load_type_id=6';
      If rg_type_otgr.ItemIndex = 3 Then
      // ���������
       SQL[6]:=SQL[6]+' AND load_type_id=2';
      // ���������
      If rg_type_otgr.ItemIndex = 4 Then
       SQL[6]:=SQL[6]+' AND load_type_id=5';

      // �������
      if rg_Prod.ItemIndex=1 then
         SQL[6]:=SQL[6]+' AND id_group_npr'+btNotProdGr.Caption+''''+lc_ProdGr.Value+'''';
      if rg_Prod.ItemIndex=2 then
         SQL[6]:=SQL[6]+' AND id_npr'+btNotProd.Caption+''''+lc_Prod.Value+'''';

      //�� ��� �����������
      If lc_plat.Value<>'0' Then
        SQL[6]:=SQL[6]+' AND plat_id'+sbNotPlat.Caption+lc_Plat.Value;
      // �� ��� ����������
      If lc_Poluch.Value<>'0' Then
         SQL[6]:=SQL[6]+' AND poluch_id'+sbNotPoluch.Caption+lc_Poluch.Value;
      // �� ��� ������
      If Trim(e_Nom_Zd.Text)<>'' Then
         SQL[6]:=SQL[6]+' AND nom_zd LIKE '''+Trim(e_nom_zd.Text)+'%''';
      // �� ��� �������
      If lc_Stan.Value<>'0' Then
         SQL[6]:=SQL[6]+' AND stan_kod'+sbNotStan.Caption+lc_Stan.Value;

    end;

  end;
//  q_oper_SF.SQL.SaveToFile('c:\tmp\1.sql');
end;

procedure Tf_oper_sf.rg_ProdClick(Sender: TObject);
begin
  if rg_Prod.ItemIndex=1 then
    lc_ProdGr.Enabled:=True
  else
    lc_ProdGr.Enabled:=False;

  if rg_Prod.ItemIndex=2 then
    lc_Prod.Enabled:=True
  else
    lc_Prod.Enabled:=False;
end;

procedure Tf_oper_sf.e_stanChange(Sender: TObject);
begin
  if e_stan.Focused then
    lc_stan.Value:=Trim(e_stan.Text);
end;

procedure Tf_oper_sf.lc_stanChange(Sender: TObject);
begin
  if lc_stan.Focused then
    e_stan.Text:=lc_Stan.Value
end;

procedure Tf_oper_sf.acViewSFPrintTableExecute(Sender: TObject);
begin
  PrintDBGridEh1.Preview;
end;


procedure Tf_oper_sf.acViewSFRefreshExecute(Sender: TObject);
begin
  inherited;
  f_db.ReQuery(q_Oper_SF,False);
end;

procedure Tf_oper_sf.acViewSFFilterExecute(Sender: TObject);
begin
  inherited;
  with TF_OperReeFilter.Create(Self) do
  Begin
    FilterText:=ViewSFFilter;
    FilterTable:='V_SF';
    If ShowModal=mrOk then
    Begin
      ViewSFFilter:=FilterText;
      acViewSFRefreshExecute(Sender);
      StatusBar1.Panels[2].Text:=ViewSFFilter;
    End;
    Free;
  End;
end;

procedure Tf_oper_sf.acViewSFNoFilterExecute(Sender: TObject);
begin
  inherited;
  ViewSFFilter:='';
  StatusBar1.Panels[2].Text:=ViewSFFilter;
  acViewSFRefreshExecute(Sender);
end;

procedure Tf_oper_sf.q_oper_sfAfterOpen(DataSet: TDataSet);
begin
  inherited;
  QueryEnd:=Now;
  StatusBar1.Panels[0].Text:='����� ���������� '+FormatDateTime('nn:ss.zzz',QueryEnd-QueryBegin)
end;

procedure Tf_oper_sf.sbNotPlatClick(Sender: TObject);
begin
  inherited;
  if sbNotPlat.Caption='<>' then sbNotPlat.Caption:='='
  else sbNotPlat.Caption:='<>';
end;

procedure Tf_oper_sf.sbNotPoluchClick(Sender: TObject);
begin
  inherited;
  if sbNotPoluch.Caption='<>' then sbNotPoluch.Caption:='='
  else sbNotPoluch.Caption:='<>';
end;

procedure Tf_oper_sf.sbNotStanClick(Sender: TObject);
begin
  inherited;
  if sbNotStan.Caption='<>' then sbNotStan.Caption:='='
  else sbNotStan.Caption:='<>';
end;

procedure Tf_oper_sf.btNotProdClick(Sender: TObject);
begin
  inherited;
  if btNotProd.Caption='<>' then btNotProd.Caption:='='
  else btNotProd.Caption:='<>';
  rg_Prod.ItemIndex:=2;
  lc_Prod.SetFocus;
end;

procedure Tf_oper_sf.btNotProdGrClick(Sender: TObject);
begin
  inherited;
  if btNotProdGr.Caption='<>' then btNotProdGr.Caption:='='
  else btNotProdGr.Caption:='<>';
  rg_Prod.ItemIndex:=1;
  lc_ProdGr.SetFocus;
end;

procedure Tf_oper_sf.acViewSFToXLSExecute(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
    if not FileExists(SaveDialog1.FileName) then
      begin
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,grSF,SaveDialog1.FileName,True);
        FileExecute(SaveDialog1.FileName,'','',esMaximized);
      end
    else
      if MessageDlg('���� ��� ����������! ����������?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,grSF,SaveDialog1.FileName,True);
          FileExecute(SaveDialog1.FileName,'','',esMaximized);
        end
end;

procedure Tf_oper_sf.acViewSFDocStreamExecute(Sender: TObject);
begin
  inherited;
  DocStream.StartStream:='OTGR';
  DocStream.StartStage:='BILLS';
  DocStream.StartCondition:='BILL_ID='''+q_oper_SF.FieldByName('NOM_DOK').AsString+'''';
  with tf_DocStream.Create(Self) do
    FormStyle:=fsMDIChild;
end;

procedure Tf_oper_sf.acEditSFExecute(Sender: TObject);
begin
  inherited;
  f_main.EditSFNo:=q_oper_sfNOM_SF.AsInteger;
  f_main.EditSFDate:=q_oper_sfDATE_VYP_SF.AsDateTime;
  f_main.acEditSF.Execute;
end;

procedure Tf_oper_sf.grSFDblClick(Sender: TObject);
begin
  inherited;
  acEditSF.Execute;
end;

procedure Tf_oper_sf.acNewSFExecute(Sender: TObject);
begin
  inherited;
  f_main.acNewSF.Execute;
end;

procedure Tf_oper_sf.q_sf_posBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  if not q_oper_sf.Eof then
    q_sf_pos.SQL[2]:='WHERE nom_dok='+q_oper_sf.fieldByName('NOM_DOK').AsString
  else
    q_sf_pos.SQL[2]:='WHERE nom_dok=0';
end;

procedure Tf_oper_sf.q_oper_sfAfterScroll(DataSet: TDataSet);
begin
  Timer1.Enabled:=False;
  Timer1.Enabled:=True;
end;

procedure Tf_oper_sf.q_sf_pos_oplBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  if not q_sf_pos.Eof then
    q_sf_pos_opl.SQL[2]:='WHERE nom_dok='+q_sf_pos.fieldByName('NOM_DOK').AsString+' and bill_pos_id='+q_sf_pos.fieldByName('BILL_POS_ID').AsString
  else
    q_sf_pos_opl.SQL[2]:='WHERE nom_dok=0';
end;

procedure Tf_oper_sf.q_sf_posAfterScroll(DataSet: TDataSet);
begin
  inherited;
  f_db.ReQuery(q_SF_Pos_opl,False);
end;

procedure Tf_oper_sf.Timer1Timer(Sender: TObject);
begin
  inherited;
  f_db.ReQuery(q_SF_Pos,False);
  If q_oper_sf.Eof then
    acPayThisBill.Enabled:=False
  else
    acPayThisBill.Enabled:=True;
  Timer1.Enabled:=False;
end;

procedure Tf_oper_sf.acPayThisBillExecute(Sender: TObject);
begin
  inherited;
  ShowMessage(oraFOR_BILLS.CallStringFunction('Place_Payments_on_Bills',[q_oper_sfDOG_ID.Value,q_oper_sfNOM_DOK.Value,0,'31.12.2010']));
  f_db.ReQuery(q_SF_Pos,True);
//  ShowMessage('� ����������');
end;

procedure Tf_oper_sf.acPayOffThisBillExecute(Sender: TObject);
begin
  inherited;
  oraFOR_BILLS.CallStringFunction('Del_Payments_from_Bill',[q_sf_pos_oplNOM_DOK.Value,q_sf_pos_oplPAYMENTS_ID.Value]);
  f_db.ReQuery(q_SF_Pos,False);
end;

procedure Tf_oper_sf.q_sf_pos_oplAfterOpen(DataSet: TDataSet);
begin
  inherited;
  If q_sf_pos_opl.Eof then
    acPayOffThisBill.Enabled:=False
  else
    acPayOffThisBill.Enabled:=True;
end;

procedure Tf_oper_sf.acDelSFExecute(Sender: TObject);
begin
  inherited;
  if MessageDlg('�� ������������� ������ ������� ����-�������?',mtConfirmation,[mbYes, mbNo],0)=mrYes then
    begin
      oraFOR_BILLS.CallFloatFunction('DEL_BILL',[q_oper_sfNOM_DOK.Value]);
      f_db.ReQuery(q_Oper_SF,False);
    end;
end;

procedure Tf_oper_sf.TBEditItem1AcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  inherited;
  //IsRefresh:=true;
  f_db.FilterAcceptText(grSF,filter2sf,NewText,Accept);
  //IsRefresh:=false;
  //q_PaymentsAfterScroll(q_Payments);
end;

procedure Tf_oper_sf.TBItem15Click(Sender: TObject);
begin
  inherited;
  //IsRefresh:=true;
  f_db.FilterCurrentValue(grSF,filter2sf);
  //IsRefresh:=false;
  //q_PaymentsAfterScroll(q_Payments);
end;

procedure Tf_oper_sf.TBItem16Click(Sender: TObject);
begin
  inherited;
  //IsRefresh:=true;
  f_db.FilterCLear(grSF,filter2sf);
  //IsRefresh:=false;
  //q_PaymentsAfterScroll(q_Payments);
end;

procedure Tf_oper_sf.q_oper_sfFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept:=f_db.AcceptFilterRecord(grSF,filter2sf);

end;

procedure Tf_oper_sf.TBItem17Click(Sender: TObject);
begin
  inherited;
  f_db.EditInMemo(grSF);
end;

procedure Tf_oper_sf.acSFLinkPaymentsExecute(Sender: TObject);
begin
  inherited;
  if not q_oper_sf.eof and (q_oper_sfNOM_DOK.AsString<>'') then
  Begin
    payments.gLinkMode:=1;
    payments.gLinkFilter:='(v_payments.id in (select payments_id from payments_on_bills where nom_dok='+q_oper_sfNOM_DOK.AsString+'))';
    with Tf_payments.Create(Self) do
      begin
        FormStyle:=fsMDIChild;
      end;
  end;
end;

procedure Tf_oper_sf.acSFLinkKvitExecute(Sender: TObject);
begin
  inherited;
  if not q_oper_sf.eof and (q_oper_sfNOM_DOK.AsString<>'') then
  Begin
    oper_ree.gLinkMode:=1;
    oper_ree.gLinkFilter:='(kvit.bill_id='+q_oper_sfNOM_DOK.AsString+')';
    with Tf_oper_ree.Create(Self) do
      begin
        FormStyle:=fsMDIChild;
      end;
  end;
end;

procedure Tf_oper_sf.acSFLinkMonthExecute(Sender: TObject);
begin
  inherited;
  if not q_oper_sf.eof and (q_oper_sfNOM_ZD.AsString<>'') then
  Begin
    oper_zayav.gLinkMode:=1;
    oper_zayav.gLinkFilter:='(month.nom_zd='''+q_oper_sfNOM_ZD.AsString+''')';
    with Tf_oper_zayav.Create(Self) do
      begin
        FormStyle:=fsMDIChild;
      end;
  end;
end;

end.
