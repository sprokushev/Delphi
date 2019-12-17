unit oper_sf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, StdCtrls, ComCtrls, Grids, DBGridEh,
  Buttons, Placemnt, RxLookup, ExtCtrls, PrnDbgeh, ActnList, ActnMan,
  ToolWin, ActnCtrls,ActnMenus, MdiForm, TB2Item, TB2Dock,
  TB2Toolbar, UCrpe32, UCrpeClasses, ImgList, XPStyleActnCtrls, TB2ExtItems,DateUtils,
  Menus;

type
  Tf_oper_sf = class(Tf_MDIForm)
    GroupBox1: TGroupBox;
    DBGridEh1: TDBGridEh;
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
    acViewSFToXLS: TAction;
    SaveDialog1: TSaveDialog;
    TBItem5: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    acViewSFDocStream: TAction;
    q_oper_sfNOM_SF: TIntegerField;
    q_oper_sfNOM_DOK: TIntegerField;
    q_oper_sfDATE_VYP_SF: TDateTimeField;
    q_oper_sfVES: TFloatField;
    q_oper_sfVES_BRUTTO: TFloatField;
    q_oper_sfKOL: TFloatField;
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
    q_oper_sfPLAT_ID: TIntegerField;
    q_oper_sfPOLUCH_ID: TIntegerField;
    q_oper_sfSTAN_KOD: TIntegerField;
    q_oper_sfGROTP_ID: TIntegerField;
    q_oper_sfNPR_SOBSTV_ID: TIntegerField;
    acEditSF: TAction;
    TBItem1: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    acNewSF: TAction;
    TBItem3: TTBItem;
    q_oper_sfDOG_NUMBER: TStringField;
    q_oper_sfDOG_ID: TIntegerField;
    TBPopupMenu1: TTBPopupMenu;
    TBItem9: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBItem14: TTBItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure q_oper_sfBeforeOpen(DataSet: TDataSet);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure DBGridEh1SortMarkingChanged(Sender: TObject);
    procedure rg_ProdClick(Sender: TObject);
    procedure e_stanChange(Sender: TObject);
    procedure lc_stanChange(Sender: TObject);
    procedure acViewSFPrintTableExecute(Sender: TObject);
    procedure acViewSFRefreshExecute(Sender: TObject);
    procedure acViewSFFilterExecute(Sender: TObject);
    procedure acViewSFNoFilterExecute(Sender: TObject);
    procedure q_oper_sfAfterOpen(DataSet: TDataSet);
    procedure sbNotPlatClick(Sender: TObject);
    procedure sbNotGrOtpClick(Sender: TObject);
    procedure sbNotPoluchClick(Sender: TObject);
    procedure sbNotSobstvClick(Sender: TObject);
    procedure sbNotStanClick(Sender: TObject);
    procedure btNotProdClick(Sender: TObject);
    procedure btNotProdGrClick(Sender: TObject);
    procedure acViewSFToXLSExecute(Sender: TObject);
    procedure acViewSFDocStreamExecute(Sender: TObject);
    procedure acEditSFExecute(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure acNewSFExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    JN:word;
    ViewSFFilter:string;
    QueryBegin,QueryEnd:TDateTime;
{    CrystalReport1: TCrystalReport;}
  end;

var
  f_oper_sf: Tf_oper_sf;

implementation

uses ForDB,ComObj,ForReport, opreeflt,CommCtrl,RXHints,DBGridEhImpExp,RxShell,
  DocStream, main;

{$R *.dfm}

procedure Tf_oper_sf.FormCreate(Sender: TObject);
begin
  SetHintStyle(hsEllipse,2,True,taLeftJustify);
  Date1.Date:=StartOfTheMonth(Date);
  Date2.Date:=Date+1;
  f_db.LogonMasterSession(Ora_session);
  f_db.SetUserGrants(ActionManager1);
end;

procedure Tf_oper_sf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  q_Oper_Sf.Close;
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

procedure Tf_oper_sf.FormShow(Sender: TObject);
begin
  q_oper_Sf.Open;
  q_ProdGr.Open;
  q_Prod.Open;
  q_Plat.Open;
  q_Poluch.Open;
  q_stan.Open;
  q_GrOtp.Open;
  q_Sobstv.Open;
end;

procedure Tf_oper_sf.q_oper_sfBeforeOpen(DataSet: TDataSet);
begin
  QueryBegin:=Now;
  with q_oper_SF do
    begin
      SQL[4]:='date_vyp_sf>=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date1.Date)+''',''dd.mm.yyyy'')';
      SQL[5]:='AND date_vyp_sf<=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date2.Date)+''',''dd.mm.yyyy'')';

      SQL[6]:='';
      //Тип транспортировки
      //Отгрузка по жд
      If rg_type_otgr.ItemIndex = 1 Then
       SQL[6]:=SQL[6]+' AND load_type_id=1';
      //Контейнеры
      If rg_type_otgr.ItemIndex = 2 Then
       SQL[6]:=SQL[6]+' AND load_type_id=6';
      If rg_type_otgr.ItemIndex = 3 Then
      // Самовывоз
       SQL[6]:=SQL[6]+' AND load_type_id=2';
      // Резервуар
      If rg_type_otgr.ItemIndex = 4 Then
       SQL[6]:=SQL[6]+' AND load_type_id=5';

      // продукт
      if rg_Prod.ItemIndex=1 then
         SQL[6]:=SQL[6]+' AND id_group_npr'+btNotProdGr.Caption+''''+lc_ProdGr.Value+'''';
      if rg_Prod.ItemIndex=2 then
         SQL[6]:=SQL[6]+' AND id_npr'+btNotProd.Caption+''''+lc_Prod.Value+'''';

      //Не все плательщики
      If lc_plat.Value<>'0' Then
        SQL[6]:=SQL[6]+' AND plat_id'+sbNotPlat.Caption+lc_Plat.Value;
      // Не все получатели
      If lc_Poluch.Value<>'0' Then
         SQL[6]:=SQL[6]+' AND poluch_id'+sbNotPoluch.Caption+lc_Poluch.Value;
      // Не все заявки
      If Trim(e_Nom_Zd.Text)<>'' Then
         SQL[6]:=SQL[6]+' AND nom_zd LIKE '''+Trim(e_nom_zd.Text)+'%''';
      // Не все станции
      If lc_Stan.Value<>'0' Then
         SQL[6]:=SQL[6]+' AND stan_kod'+sbNotStan.Caption+lc_Stan.Value;
      // Не все грузоотправители
      If lc_GrOtp.Value<>'0' Then
         SQL[6]:=SQL[6]+' AND grotp_id'+sbNotGrOtp.Caption+lc_GrOtp.Value;
      // Не все владельцы н/пр
      If lc_Sobstv.Value<>'0' Then
         SQL[6]:=SQL[6]+' AND npr_sobstv_id'+sbNotSobstv.Caption+lc_Sobstv.Value;

      // дополнительный фильтр
      If ViewSFFilter<>'' Then
        begin
          SQL[6]:=SQL[6]+' AND '+ViewSFFilter;
          acViewSFNoFilter.Enabled:=True;
        end
      else
        begin
          acViewSFNoFilter.Enabled:=False;
        end;
    end;
//  q_oper_SF.SQL.SaveToFile('c:\1.sql');
end;

procedure Tf_oper_sf.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if q_Oper_SF.RecNo mod 2=0 then
    Background:=clInfoBk;
  if gdSelected in State then
    Background:=clNavy;
end;

procedure Tf_oper_sf.DBGridEh1SortMarkingChanged(Sender: TObject);
begin
  f_db.SortInGrid(q_Oper_SF,7,DBGridEh1);
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
      StatusBar1.Panels[2].Text:='Фильтр - '+ViewSFFilter;
    End;
    Free;
  End;
end;

procedure Tf_oper_sf.acViewSFNoFilterExecute(Sender: TObject);
begin
  inherited;
  ViewSFFilter:='';
  StatusBar1.Panels[2].Text:='Фильтр - '+ViewSFFilter;
  acViewSFRefreshExecute(Sender);
end;

procedure Tf_oper_sf.q_oper_sfAfterOpen(DataSet: TDataSet);
begin
  inherited;
  QueryEnd:=Now;
  StatusBar1.Panels[0].Text:='Время выполнения '+FormatDateTime('nn:ss.zzz',QueryEnd-QueryBegin)
end;

procedure Tf_oper_sf.sbNotPlatClick(Sender: TObject);
begin
  inherited;
  if sbNotPlat.Caption='<>' then sbNotPlat.Caption:='='
  else sbNotPlat.Caption:='<>';
end;

procedure Tf_oper_sf.sbNotGrOtpClick(Sender: TObject);
begin
  inherited;
  if sbNotGrOtp.Caption='<>' then sbNotGrOtp.Caption:='='
  else sbNotGrOtp.Caption:='<>';
end;

procedure Tf_oper_sf.sbNotPoluchClick(Sender: TObject);
begin
  inherited;
  if sbNotPoluch.Caption='<>' then sbNotPoluch.Caption:='='
  else sbNotPoluch.Caption:='<>';
end;

procedure Tf_oper_sf.sbNotSobstvClick(Sender: TObject);
begin
  inherited;
  if sbNotSobstv.Caption='<>' then sbNotSobstv.Caption:='='
  else sbNotSobstv.Caption:='<>';
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

procedure Tf_oper_sf.acViewSFDocStreamExecute(Sender: TObject);
begin
  inherited;
  DocStream.StartStream:='OTGR';
  DocStream.StartStage:='MONTH';
  DocStream.StartCondition:='NOM_ZD='''+q_oper_SF.FieldByName('NOM_ZD').AsString+'''';
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

procedure Tf_oper_sf.DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
  acEditSF.Execute;
end;

procedure Tf_oper_sf.acNewSFExecute(Sender: TObject);
begin
  inherited;
  f_main.acNewSF.Execute;
end;

end.
