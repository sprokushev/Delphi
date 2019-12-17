unit mon_vis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, StdCtrls, ComCtrls, Grids, DBGridEh,
  Buttons, Placemnt, RxLookup, ExtCtrls, PrnDbgeh, ActnList, ActnMan,
  ToolWin, ActnCtrls,ActnMenus, MdiForm, TB2Item, TB2Dock,
  TB2Toolbar, UCrpe32, UCrpeClasses, ImgList, ADODB, DBCtrls;

type
  Tf_month_visir = class(Tf_MDIForm)
    GroupBox1: TGroupBox;
    DBGridEh1: TDBGridEh;
    ora_Session: TOracleSession;
    q_Mon_Visir: TOracleDataSet;
    ds_Mon_Visir: TDataSource;
    FormStorage1: TFormStorage;
    rg_Type_Ree: TRadioGroup;
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
    acMonVisirRefresh: TAction;
    acOperReeNoFilter: TAction;
    TBItem6: TTBItem;
    acOperReeFilter: TAction;
    TBItem7: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    Panel2: TPanel;
    sbOperReeRefresh: TSpeedButton;
    ImageList1: TImageList;
    acOperReePrintPasp: TAction;
    TBSubmenuItem1: TTBSubmenuItem;
    acOperReePrint: TAction;
    TBItem4: TTBItem;
    ADO_Conn: TADOConnection;
    q_Tmpppppp: TADOTable;
    q_Tmppppppdate_ree: TDateField;
    q_Tmppppppdop_ree: TIntegerField;
    q_Tmppppppnom_zd: TStringField;
    q_Tmppppppves: TBCDField;
    q_Tmppppppis_denied: TBooleanField;
    q_Tmppppppprichin: TStringField;
    q_Tmppppppinp_date: TDateField;
    q_Tmppppppupd_date: TDateField;
    q_Tmppppppis_export: TStringField;
    q_Tmppppppnpr_sobstv: TStringField;
    q_Tmppppppstanotp_id: TBCDField;
    q_Tmppppppstanotp: TStringField;
    q_Tmppppppgrotp_id: TBCDField;
    q_Tmppppppgrotp_name: TStringField;
    q_Tmppppppstan_id: TBCDField;
    q_Tmppppppstan: TStringField;
    q_Tmppppppvetka: TStringField;
    q_Tmpppppppoluch_id: TBCDField;
    q_Tmpppppppoluch: TStringField;
    q_Tmpppppppol_addr: TStringField;
    q_Tmppppppload_name: TStringField;
    q_Tmppppppgroup_npr: TStringField;
    q_Tmppppppid_npr: TStringField;
    q_Tmppppppname_npr: TStringField;
    q_Tmppppppgdkod_npr: TStringField;
    q_Tmppppppgdname_npr: TStringField;
    q_Tmppppppcist: TIntegerField;
    q_Tmpppppptonn: TBCDField;
    q_Tmppppppforma_2: TBooleanField;
    q_Tmppppppdate_plan: TStringField;
    q_Tmppppppprim: TStringField;
    q_Tmppppppgr4: TStringField;
    q_Tmppppppk_tar: TStringField;
    Panel3: TPanel;
    Label8: TLabel;
    DBText2: TDBText;
    Label9: TLabel;
    DBText3: TDBText;
    Label10: TLabel;
    DBText4: TDBText;
    Label11: TLabel;
    DBText5: TDBText;
    Label12: TLabel;
    DBText6: TDBText;
    Label13: TLabel;
    DBText7: TDBText;
    Label14: TLabel;
    DBText8: TDBText;
    Label15: TLabel;
    DBText9: TDBText;
    Label16: TLabel;
    DBText10: TDBText;
    Label17: TLabel;
    DBText11: TDBText;
    Label18: TLabel;
    DBText12: TDBText;
    Label19: TLabel;
    DBText13: TDBText;
    Label20: TLabel;
    DBText14: TDBText;
    Label7: TLabel;
    DBText1: TDBText;
    q_cmn: TADOQuery;
    q_MasterVisir: TOracleDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure DBGridEh1SortMarkingChanged(Sender: TObject);
    procedure rg_ProdClick(Sender: TObject);
    procedure e_stanChange(Sender: TObject);
    procedure lc_stanChange(Sender: TObject);
    procedure acOperReePrintTableExecute(Sender: TObject);
    procedure acOperReePrintSvedExecute(Sender: TObject);
    procedure ora_SessionBeforeLogOn(Sender: TOracleSession);
    procedure q_Mon_VisirAfterScroll(DataSet: TDataSet);
    procedure acMonVisirRefreshExecute(Sender: TObject);
    procedure acOperReeFilterExecute(Sender: TObject);
    procedure acOperReeNoFilterExecute(Sender: TObject);
    procedure acOperReePrintPaspExecute(Sender: TObject);
    procedure q_Mon_VisirAfterOpen(DataSet: TDataSet);
    procedure q_TmppppppBeforeOpen(DataSet: TDataSet);
    procedure q_Mon_VisirBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    JN:word;
    MonVisirFilter:string;
    QueryBegin,QueryEnd:TDateTime;
{    CrystalReport1: TCrystalReport;}
  end;

var
  f_month_visir: Tf_month_visir;

implementation

uses main,ComObj,ForReport, {opreeflt,}CommCtrl,RXHints;

{$R *.dfm}

procedure Tf_month_visir.FormCreate(Sender: TObject);
begin
  Date1.Date:=Date;
  Date2.Date:=Date;
  ora_Session.LogonUsername:=f_main.ora_Session.LogonUsername;
  ora_Session.LogonPassword:=f_main.ora_Session.LogonPassword;
  ora_Session.LogonDatabase:=f_main.ora_Session.LogonDatabase;
  Ora_session.LogOn;
end;

procedure Tf_month_visir.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  q_Oper_ree.Close;
  q_ProdGr.Close;
  q_Prod.Close;
  q_Plat.Close;
  q_poluch.Close;
  q_stan.Close;
  Ora_session.LogOff;
  Action:=caFree;
end;

procedure Tf_month_visir.FormShow(Sender: TObject);
begin
  q_oper_ree.Open;
  q_ProdGr.Open;
  q_Prod.Open;
  q_Plat.Open;
  q_Poluch.Open;
  q_stan.Open;
end;

procedure Tf_month_visir.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if q_Oper_ree.RecNo mod 2=0 then
    Background:=clInfoBk;
  if gdSelected in State then
    Background:=clNavy;
end;

procedure Tf_month_visir.DBGridEh1SortMarkingChanged(Sender: TObject);
begin
  f_main.SortInGrid(q_Oper_ree,36,DBGridEh1);
end;

procedure Tf_month_visir.rg_ProdClick(Sender: TObject);
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

procedure Tf_month_visir.e_stanChange(Sender: TObject);
begin
  lc_stan.Value:=Trim(e_stan.Text);
end;

procedure Tf_month_visir.lc_stanChange(Sender: TObject);
begin
  e_stan.Text:=lc_Stan.Value
end;

procedure Tf_month_visir.acOperReePrintTableExecute(Sender: TObject);
begin
  PrintDBGridEh1.Preview;
end;

procedure Tf_month_visir.acOperReePrintSvedExecute(Sender: TObject);
begin
  with TF_ForReport.Create(f_main) do
    begin
      Caption:='Сведение №'+q_oper_reeSVED_NUM.AsString;
      if q_oper_reeLOAD_TYPE_ID.AsInteger=2 then
        Crpe.ReportName:=ExtractFilePath(ParamStr(0))+'Sved_sam.rpt'
      else
        Crpe.ReportName:=ExtractFilePath(ParamStr(0))+'Sved_gd.rpt';
//      Crpe.ParamFields.Retrieve;
      Crpe.ParamFields[0].CurrentValue := q_oper_reeSVED_NUM.AsString;
      Crpe.ParamFields[1].CurrentValue := q_oper_reeNOM_ZD.AsString;
      Crpe.ParamFields[2].CurrentValue := '';
      {Run the Report}
      Crpe.Execute;
    end;
end;

procedure Tf_month_visir.ora_SessionBeforeLogOn(Sender: TOracleSession);
begin
  ora_Session.LogonUsername:=f_main.ora_Session.LogonUsername;
  ora_Session.LogonPassword:=f_main.ora_Session.LogonPassword;
  ora_Session.LogonDatabase:=f_main.ora_Session.LogonDatabase;
end;

procedure Tf_month_visir.q_Mon_VisirAfterScroll(DataSet: TDataSet);
begin
  inherited;
  StatusBar1.Panels[1].Text:='Оформлено - '+FormatDateTime('dd.mm.yy hh:nn',q_oper_reeDATE_OFORML.AsDateTime);
end;

procedure Tf_month_visir.acMonVisirRefreshExecute(Sender: TObject);
begin
  inherited;
  f_main.ReQuery(q_Mon_ree,False);
end;

procedure Tf_month_visir.acOperReeFilterExecute(Sender: TObject);
begin
  inherited;
  with TF_OperReeFilter.Create(Self) do
  Begin
    FilterText:=OperReeFilter;
    If ShowModal=mrOk then
    Begin
      OperReeFilter:=FilterText;
      acOperReeRefreshExecute(Sender);
      StatusBar1.Panels[2].Text:='Фильтр - '+OperReeFilter;
    End;
    Free;
  End;
end;

procedure Tf_month_visir.acOperReeNoFilterExecute(Sender: TObject);
begin
  inherited;
  OperReeFilter:='';
  StatusBar1.Panels[2].Text:='Фильтр - '+OperReeFilter;
  acOperReeRefreshExecute(Sender);
end;

procedure Tf_month_visir.acOperReePrintPaspExecute(Sender: TObject);
begin
  inherited;
  with TF_ForReport.Create(f_main) do
    begin
      Caption:='Паспорт №'+q_oper_reePASP.AsString;
      Crpe.ReportName:=ExtractFilePath(ParamStr(0))+'pasp.rpt';
      Crpe.ParamFields[0].CurrentValue := q_oper_reePASP_ID.AsString;
      Crpe.ParamFields[1].CurrentValue := q_oper_reeMESTO_ID.AsString;
      Crpe.ParamFields[2].CurrentValue := '';
      {Run the Report}
      Crpe.Execute;
    end;
end;

procedure Tf_month_visir.q_Mon_VisirAfterOpen(DataSet: TDataSet);
begin
  inherited;
  QueryEnd:=Now;
  StatusBar1.Panels[0].Text:='Время выполнения '+FormatDateTime('nn:ss.zzz',QueryEnd-QueryBegin)
end;

procedure Tf_month_visir.q_TmppppppBeforeOpen(DataSet: TDataSet);
var s,f1,f2:String[255];
begin
  inherited;
end;

procedure Tf_month_visir.q_Mon_VisirBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  f1:=f_main.DBFPath+'visir.dbf'+#0;
  f2:=f_main.TempPath+'visir.dbf'+#0;
  COPYFILE(@f1[1],@f2[1],False);
  q_cmn.SQL.Clear;
  q_cmn.SQL.Add('DELETE FROM "'+f_main.TempPath+'visir.dbf"');
  q_cmn.ExecSQL;

  with q_tmp do
  Begin
    q_tmp.SQL.Clear;
    s:='SELECT MONTH_REE.DATE_REE, MONTH_REE.DOP_REE, MONTH_REE.NOM_ZD, MONTH_REE.VES, V_MONTH_GD.* '+
       'FROM MONTH_REE,V_MONTH_GD '+
       'WHERE MONTH_REE.NOM_ZD=V_MONTH_GD.NOM_ZD '+
       '  AND MONTH_REE.DATE
    q_tmp.SQL.Add()

    with q_cmn do
    try
      s:='INSERT INTO "'+f_main.TempPath+'from_to.dbf" (from_date,to_date,is_agent,param1) VALUES('+
          FormatDateTime('"{"mm"/"dd"/"yyyy"}"',Date1.Date)+','+
          FormatDateTime('"{"mm"/"dd"/"yyyy"}"',Date2.Date)+','+
          '0,'+
          ''''+q_reports.FieldByName('Param1').AsString+''')';
      q_cmn.Close;
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add(s);
      q_cmn.ExecSQL;
    except
    end;

  QueryBegin:=Now;
  with q_tmp do
    begin
      if acOperReeByCist.Checked then
        begin
          SQL[35]:=',num_cist';
          SQL[8]:='NUM_CIST as NUM_CIST,'
        end
      else
        begin
          SQL[35]:='';
          SQL[8]:='''сведение'' as NUM_CIST,'
        end;
      SQL[29]:='kvit.date_oforml>=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date1.Date)+' '+FormatDateTime('hh:mm',time1.Time)+''',''dd.mm.yyyy hh24:mi'') And';
      SQL[30]:='kvit.date_oforml<=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date2.Date)+' '+FormatDateTime('hh:mm',time2.Time)+''',''dd.mm.yyyy hh24:mi'')';
      SQL[31]:='';
      //Отгрузка по жд
      If rg_type_otgr.ItemIndex = 1 Then
       SQL[31]:=SQL[31]+' AND kls_vid_otgr.load_type_id=1';
      //Отгрузка Самовывозом
      If rg_type_otgr.ItemIndex = 2 Then
       SQL[31]:=SQL[31]+' AND kls_vid_otgr.load_type_id=2';
      if rg_Prod.ItemIndex=1 then
         SQL[31]:=SQL[31]+' AND kls_prod.id_group_npr='''+lc_ProdGr.Value+'''';
      if rg_Prod.ItemIndex=2 then
         SQL[31]:=SQL[31]+' AND kvit.prod_id_npr='''+lc_Prod.Value+'''';
      //Не все плательщики
      If lc_plat.Value<>'0' Then
         SQL[31]:=SQL[31]+' AND plat.id='+lc_Plat.Value;
      If lc_Poluch.Value<>'0' Then
         SQL[31]:=SQL[31]+' AND poluch.id='+lc_Poluch.Value;
      If Trim(e_Nom_Zd.Text)<>'' Then
         SQL[31]:=SQL[31]+' AND kvit.nom_zd LIKE '''+Trim(e_nom_zd.Text)+'%''';
      If lc_Stan.Value<>'0' Then
         SQL[31]:=SQL[31]+' AND kls_stan.stan_kod='+lc_Stan.Value;
      If OperReeFilter<>'' Then
        begin
          SQL[31]:=SQL[31]+' AND '+OperReeFilter;
          acOperReeNoFilter.Enabled:=True;
        end
      else
        begin
          acOperReeNoFilter.Enabled:=False;
        end;
    end;


end;

end.
