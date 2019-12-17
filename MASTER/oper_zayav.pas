unit oper_zayav;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, StdCtrls, ComCtrls, Grids, DBGridEh,
  Buttons, Placemnt, RxLookup, ExtCtrls, PrnDbgeh, ActnList, ActnMan,
  ToolWin, ActnCtrls,ActnMenus, MdiForm, TB2Item, TB2Dock,
  TB2Toolbar, UCrpe32, UCrpeClasses, ImgList, XPStyleActnCtrls, TB2ExtItems,DateUtils,
  Menus, GridsEh;

type
  Tf_oper_zayav = class(Tf_MDIForm)
    GroupBox1: TGroupBox;
    DBGridEh1: TDBGridEh;
    ora_Session: TOracleSession;
    q_oper_zayav: TOracleDataSet;
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
    acViewZDPrintTable: TAction;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem2: TTBItem;
    Crpe1: TCrpe;
    StatusBar1: TStatusBar;
    TBSeparatorItem1: TTBSeparatorItem;
    acViewZDRefresh: TAction;
    acViewZDNoFilter: TAction;
    TBItem6: TTBItem;
    acViewZDFilter: TAction;
    TBItem7: TTBItem;
    Panel2: TPanel;
    sbRefresh: TSpeedButton;
    ImageList1: TImageList;
    TBSubmenuItem1: TTBSubmenuItem;
    acViewZDPrint: TAction;
    lc_GrOtp: TRxDBLookupCombo;
    Label7: TLabel;
    lc_Sobstv: TRxDBLookupCombo;
    Label8: TLabel;
    q_GrOtp: TOracleDataSet;
    IntegerField2: TIntegerField;
    StringField4: TStringField;
    ds_GrOtp: TDataSource;
    q_Sobstv: TOracleDataSet;
    IntegerField3: TIntegerField;
    StringField5: TStringField;
    ds_Sobstv: TDataSource;
    sbNotPlat: TSpeedButton;
    sbNotGrOtp: TSpeedButton;
    sbNotPoluch: TSpeedButton;
    sbNotSobstv: TSpeedButton;
    sbNotStan: TSpeedButton;
    btNotProd: TBitBtn;
    btNotProdGr: TBitBtn;
    acViewZDToXLS: TAction;
    SaveDialog1: TSaveDialog;
    TBItem5: TTBItem;
    q_oper_zayavNOM_ZD: TStringField;
    q_oper_zayavDATE_PLAN: TDateTimeField;
    q_oper_zayavINPUT_DATE: TDateTimeField;
    q_oper_zayavPLAT_NAME: TStringField;
    q_oper_zayavDOG_NUMBER: TStringField;
    q_oper_zayavDOG_DATE: TDateTimeField;
    q_oper_zayavPOLUCH_NAME: TStringField;
    q_oper_zayavSTAN_NAME: TStringField;
    acViewZDRealProd: TAction;
    TBItem1: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    q_oper_zayavPLAT_ID: TIntegerField;
    q_oper_zayavDOG_ID: TIntegerField;
    q_oper_zayavPOLUCH_ID: TIntegerField;
    q_oper_zayavSTAN_KOD: TIntegerField;
    q_oper_zayavPROD_ID_NPR: TStringField;
    q_oper_zayavPLANSTRU_ID: TFloatField;
    q_oper_zayavPLANSTRU_NAME: TStringField;
    q_oper_zayavNAZN_OTG_ID: TIntegerField;
    q_oper_zayavNAZN_OTG_NAME: TStringField;
    q_oper_zayavPAYFORM_ID: TIntegerField;
    q_oper_zayavPAYFORM_NAME: TStringField;
    q_oper_zayavZAYAV_VES: TFloatField;
    q_oper_zayavZAYAV_SUM: TFloatField;
    q_oper_zayavGROTP_ID: TIntegerField;
    q_oper_zayavGROTP_NAME: TStringField;
    q_oper_zayavTEX_PD_NAME: TStringField;
    q_oper_zayavNAME_NPR: TStringField;
    q_oper_zayavLOAD_TYPE_ID: TIntegerField;
    q_oper_zayavLOAD_TYPE_NAME: TStringField;
    q_oper_zayavNPR_SOBSTV_ID: TIntegerField;
    q_oper_zayavCENA_OTP: TFloatField;
    q_oper_zayavFACT_VES: TFloatField;
    q_oper_zayavFACT_SUM: TFloatField;
    acViewZDDocStream: TAction;
    TBPopupMenu1: TTBPopupMenu;
    TBItem9: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBItem14: TTBItem;
    TBSubmenuItem2: TTBSubmenuItem;
    TBItem3: TTBItem;
    acViewZDLinkKvit: TAction;
    TBItem4: TTBItem;
    TBSeparatorItem5: TTBSeparatorItem;
    acViewZDLinkSF: TAction;
    TBItem8: TTBItem;
    acViewZDLinkZakazUNP: TAction;
    q_oper_zayavZAKAZ_ID: TFloatField;
    TBItem10: TTBItem;
    q_oper_zayavTEX_PD_ID: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure q_oper_zayavBeforeOpen(DataSet: TDataSet);
    procedure DBGridEh1SortMarkingChanged(Sender: TObject);
    procedure rg_ProdClick(Sender: TObject);
    procedure e_stanChange(Sender: TObject);
    procedure lc_stanChange(Sender: TObject);
    procedure acViewZDPrintTableExecute(Sender: TObject);
    procedure acViewZDRefreshExecute(Sender: TObject);
    procedure acViewZDFilterExecute(Sender: TObject);
    procedure acViewZDNoFilterExecute(Sender: TObject);
    procedure q_oper_zayavAfterOpen(DataSet: TDataSet);
    procedure sbNotPlatClick(Sender: TObject);
    procedure sbNotGrOtpClick(Sender: TObject);
    procedure sbNotPoluchClick(Sender: TObject);
    procedure sbNotSobstvClick(Sender: TObject);
    procedure sbNotStanClick(Sender: TObject);
    procedure btNotProdClick(Sender: TObject);
    procedure btNotProdGrClick(Sender: TObject);
    procedure acViewZDToXLSExecute(Sender: TObject);
    procedure acViewZDRealProdExecute(Sender: TObject);
    procedure acViewZDDocStreamExecute(Sender: TObject);
    procedure acViewZDLinkKvitExecute(Sender: TObject);
    procedure acViewZDLinkSFExecute(Sender: TObject);
    procedure acViewZDLinkZakazUNPExecute(Sender: TObject);
  private
    { Private declarations }
    Filter2mon: TStringList; // Фильтр для grSF
    ViewLinkMode:integer; // 1-отбор по связям
    ViewLinkFilter:string; // Фильтр для реализации связей
  public
    { Public declarations }
    JN:word;
    ViewZDFilter:string;
    QueryBegin,QueryEnd:TDateTime;
{    CrystalReport1: TCrystalReport;}
  end;

var
  f_oper_zayav: Tf_oper_zayav;
  gLinkMode:integer; // Режим просмтора: 1-по связям 0-стандартный просмотр
  gLinkFilter:string; // Строка для филтра по связям

implementation

uses ComObj,ForReport, opreeflt,CommCtrl,RXHints,DBGridEhImpExp,RxShell,
  DocStream, ForDB, oper_ree, main, oper_sf_new, zakaz;

{$R *.dfm}

procedure Tf_oper_zayav.FormCreate(Sender: TObject);
begin
  Filter2mon:=TStringList.Create;
  Filter2mon.Clear;
  SetHintStyle(hsEllipse,2,True,taLeftJustify);
  Date1.Date:=StartOfTheMonth(Date);
  Date2.Date:=Date+1;
  f_db.LogonMasterSession(Ora_session);
  f_db.SetUserGrants(ActionManager1);
  ViewLinkMode:=gLinkMode;
  ViewLinkFilter:=gLinkFilter;
  gLinkMode:=0;
  gLinkFilter:='';
end;

procedure Tf_oper_zayav.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    filter2mon.Clear;
  except
  end;
  q_Oper_Zayav.Close;
  q_ProdGr.Close;
  q_Prod.Close;
  q_Plat.Close;
  q_poluch.Close;
  q_stan.Close;
  q_GrOtp.Close;
  q_Sobstv.Close;
  Ora_session.LogOff;
  Action:=caFree;
end;

procedure Tf_oper_zayav.FormShow(Sender: TObject);
var i:integer;
begin
  q_oper_Zayav.Open;
  q_ProdGr.Open;
  q_Prod.Open;
  q_Plat.Open;
  q_Poluch.Open;
  q_stan.Open;
  q_GrOtp.Open;
  q_Sobstv.Open;

  if filter2mon.Count=0 then
  for i:=1 to q_oper_zayav.FieldCount do
  Begin
    Filter2mon.Add('');
  end;

  if not f_db.CheckGrant('acOper_Ree') then
  Begin
    ShowMessage('Вы не имеете права на просмотр отгрузки!');
    Close;
  end;
end;

procedure Tf_oper_zayav.q_oper_zayavBeforeOpen(DataSet: TDataSet);
begin
  QueryBegin:=Now;
  with q_oper_zayav do
  begin
    if acViewZDRealProd.Checked then
      begin
        SQL[7]:='NOM_ZD,PROD_ID_NPR,';
        SQL[11]:='GROUP BY nom_zd,prod_id_npr) kv';
        SQL[13]:='AND kv.prod_id_npr=KLS_PROD.id_npr (+)'
      end
    else
      begin
        SQL[7]:='NOM_ZD,';
        SQL[11]:='GROUP BY nom_zd) kv';
        SQL[13]:='AND month.prod_id_npr=KLS_PROD.id_npr (+)'
      end;

    SQL[16]:='';

    If ViewLinkMode=1 Then
    Begin
      Date1.Date:=EncodeDateDay(2005,1);
      If ViewLinkFilter<>'' Then
      begin
        SQL[16]:=SQL[16]+' AND '+ViewLinkFilter;
        SQL[10]:='WHERE 1=1';
        SQL[14]:='AND 1=1';
        SQL[15]:='AND 1=1';
      end;
    end
    else
    begin
      SQL[10]:='WHERE kvit.date_otgr>=TO_DATE('''+FormatDateTime('dd.mm.yyyy',StartOfTheMonth(Date1.Date))+''',''dd.mm.yyyy'')-15';
      SQL[14]:='AND month.date_plan>=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date1.Date)+''',''dd.mm.yyyy'')';
      SQL[15]:='AND month.date_plan<=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date2.Date)+''',''dd.mm.yyyy'')';

      //Тип транспортировки
      //Отгрузка по жд
      If rg_type_otgr.ItemIndex = 1 Then
       SQL[16]:=SQL[16]+' AND month.load_type_id=1';
      //Контейнеры
      If rg_type_otgr.ItemIndex = 2 Then
       SQL[16]:=SQL[16]+' AND month.load_type_id=6';
      If rg_type_otgr.ItemIndex = 3 Then
      // Самовывоз
       SQL[16]:=SQL[16]+' AND month.load_type_id=2';
      // Резервуар
      If rg_type_otgr.ItemIndex = 4 Then
       SQL[16]:=SQL[16]+' AND month.load_type_id=5';

      // продукт
      if rg_Prod.ItemIndex=1 then
         SQL[16]:=SQL[16]+' AND kls_prod.id_group_npr'+btNotProdGr.Caption+''''+lc_ProdGr.Value+'''';
      if rg_Prod.ItemIndex=2 then
         SQL[16]:=SQL[16]+' AND kls_prod.id_npr'+btNotProd.Caption+''''+lc_Prod.Value+'''';

      //Не все плательщики
      If lc_plat.Value<>'0' Then
        SQL[16]:=SQL[16]+' AND month.plat_id'+sbNotPlat.Caption+lc_Plat.Value;
      // Не все получатели
      If lc_Poluch.Value<>'0' Then
         SQL[16]:=SQL[16]+' AND month.poluch_id'+sbNotPoluch.Caption+lc_Poluch.Value;
      // Не все заявки
      If Trim(e_Nom_Zd.Text)<>'' Then
         SQL[16]:=SQL[16]+' AND month.nom_zd LIKE '''+Trim(e_nom_zd.Text)+'%''';
      // Не все станции
      If lc_Stan.Value<>'0' Then
         SQL[16]:=SQL[16]+' AND month.stan_kod'+sbNotStan.Caption+lc_Stan.Value;
      // Не все грузоотправители
      If lc_GrOtp.Value<>'0' Then
         SQL[16]:=SQL[16]+' AND month.grotp_id'+sbNotGrOtp.Caption+lc_GrOtp.Value;
      // Не все владельцы н/пр
      If lc_Sobstv.Value<>'0' Then
         SQL[16]:=SQL[16]+' AND month.npr_sobstv_id'+sbNotSobstv.Caption+lc_Sobstv.Value;

      // дополнительный фильтр
      If ViewZDFilter<>'' Then
        begin
          SQL[16]:=SQL[16]+' AND '+ViewZDFilter;
          acViewZDNoFilter.Enabled:=True;
        end
      else
        begin
          acViewZDNoFilter.Enabled:=False;
        end;
    end;
  end;
  //q_oper_zayav.SQL.SaveToFile('c:\tmp\1.sql');
end;

procedure Tf_oper_zayav.DBGridEh1SortMarkingChanged(Sender: TObject);
begin
  f_db.SortInGrid(q_Oper_Zayav,17,DBGridEh1);
end;

procedure Tf_oper_zayav.rg_ProdClick(Sender: TObject);
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

procedure Tf_oper_zayav.e_stanChange(Sender: TObject);
begin
  if e_stan.Focused then
    lc_stan.Value:=Trim(e_stan.Text);
end;

procedure Tf_oper_zayav.lc_stanChange(Sender: TObject);
begin
  if lc_stan.Focused then
    e_stan.Text:=lc_Stan.Value
end;

procedure Tf_oper_zayav.acViewZDPrintTableExecute(Sender: TObject);
begin
  PrintDBGridEh1.Preview;
end;


procedure Tf_oper_zayav.acViewZDRefreshExecute(Sender: TObject);
begin
  inherited;
  f_db.ReQuery(q_Oper_Zayav,False);
end;

procedure Tf_oper_zayav.acViewZDFilterExecute(Sender: TObject);
begin
  inherited;
  with TF_OperReeFilter.Create(Self) do
  Begin
    FilterText:=ViewZDFilter;
    FilterTable:='MONTH';
    If ShowModal=mrOk then
    Begin
      ViewZDFilter:=FilterText;
      acViewZDRefreshExecute(Sender);
      StatusBar1.Panels[2].Text:='Фильтр - '+ViewZDFilter;
    End;
    Free;
  End;
end;

procedure Tf_oper_zayav.acViewZDNoFilterExecute(Sender: TObject);
begin
  inherited;
  ViewZDFilter:='';
  StatusBar1.Panels[2].Text:='Фильтр - '+ViewZDFilter;
  acViewZDRefreshExecute(Sender);
end;

procedure Tf_oper_zayav.q_oper_zayavAfterOpen(DataSet: TDataSet);
begin
  inherited;
  QueryEnd:=Now;
  StatusBar1.Panels[0].Text:='Время выполнения '+FormatDateTime('nn:ss.zzz',QueryEnd-QueryBegin)
end;

procedure Tf_oper_zayav.sbNotPlatClick(Sender: TObject);
begin
  inherited;
  if sbNotPlat.Caption='<>' then sbNotPlat.Caption:='='
  else sbNotPlat.Caption:='<>';
end;

procedure Tf_oper_zayav.sbNotGrOtpClick(Sender: TObject);
begin
  inherited;
  if sbNotGrOtp.Caption='<>' then sbNotGrOtp.Caption:='='
  else sbNotGrOtp.Caption:='<>';
end;

procedure Tf_oper_zayav.sbNotPoluchClick(Sender: TObject);
begin
  inherited;
  if sbNotPoluch.Caption='<>' then sbNotPoluch.Caption:='='
  else sbNotPoluch.Caption:='<>';
end;

procedure Tf_oper_zayav.sbNotSobstvClick(Sender: TObject);
begin
  inherited;
  if sbNotSobstv.Caption='<>' then sbNotSobstv.Caption:='='
  else sbNotSobstv.Caption:='<>';
end;

procedure Tf_oper_zayav.sbNotStanClick(Sender: TObject);
begin
  inherited;
  if sbNotStan.Caption='<>' then sbNotStan.Caption:='='
  else sbNotStan.Caption:='<>';
end;

procedure Tf_oper_zayav.btNotProdClick(Sender: TObject);
begin
  inherited;
  if btNotProd.Caption='<>' then btNotProd.Caption:='='
  else btNotProd.Caption:='<>';
  rg_Prod.ItemIndex:=2;
  lc_Prod.SetFocus;
end;

procedure Tf_oper_zayav.btNotProdGrClick(Sender: TObject);
begin
  inherited;
  if btNotProdGr.Caption='<>' then btNotProdGr.Caption:='='
  else btNotProdGr.Caption:='<>';
  rg_Prod.ItemIndex:=1;
  lc_ProdGr.SetFocus;
end;

procedure Tf_oper_zayav.acViewZDToXLSExecute(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
    if not FileExists(SaveDialog1.FileName) then
      begin
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,DBGridEh1,SaveDialog1.FileName,True);
        FileExecute(SaveDialog1.FileName,'','',esMaximized);
      end
    else
      if MessageDlg('Файл уже существует! Переписать?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,DBGridEh1,SaveDialog1.FileName,True);
          FileExecute(SaveDialog1.FileName,'','',esMaximized);
        end
end;

procedure Tf_oper_zayav.acViewZDRealProdExecute(Sender: TObject);
begin
  inherited;
  acViewZDRealProd.Checked:=not acViewZDRealProd.Checked;
end;

procedure Tf_oper_zayav.acViewZDDocStreamExecute(Sender: TObject);
begin
  inherited;
  DocStream.StartStream:='OTGR';
  DocStream.StartStage:='MONTH';
  DocStream.StartCondition:='NOM_ZD='''+q_oper_zayav.FieldByName('NOM_ZD').AsString+'''';
  with tf_DocStream.Create(Self) do
    FormStyle:=fsMDIChild;

end;

procedure Tf_oper_zayav.acViewZDLinkKvitExecute(Sender: TObject);
begin
  inherited;
  if not q_oper_zayav.eof  and (q_oper_zayavNOM_ZD.AsString<>'') then
  Begin
    oper_ree.gLinkMode:=1;
    oper_ree.gLinkFilter:='(kvit.nom_zd='''+q_oper_zayavNOM_ZD.AsString+''')';
    with Tf_oper_ree.Create(Self) do
      begin
        FormStyle:=fsMDIChild;
      end;
  end;
end;

procedure Tf_oper_zayav.acViewZDLinkSFExecute(Sender: TObject);
begin
  inherited;
  if not q_oper_zayav.eof and (q_oper_zayavNOM_ZD.AsString<>'') then
  Begin
    oper_sf_new.gLinkMode:=1;
    oper_sf_new.gLinkFilter:='(v_sf.nom_zd='''+q_oper_zayavNOM_ZD.AsString+''')';
    with Tf_oper_sf.Create(Self) do
      begin
        FormStyle:=fsMDIChild;
      end;
  end;
end;

procedure Tf_oper_zayav.acViewZDLinkZakazUNPExecute(Sender: TObject);
begin
  inherited;
  if not q_oper_zayav.eof and (q_oper_zayavZAKAZ_ID.AsString<>'') then
  Begin
    zakaz.gAgentID:=8;
    zakaz.gLinkMode:=1;
    zakaz.gLinkFilter:='(mon.ID='+q_oper_zayavZAKAZ_ID.AsString+')';
    with Tf_Zakaz.Create(Self) do
      FormStyle:=fsMDIChild;
  end;
end;

end.
