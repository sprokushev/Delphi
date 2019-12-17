unit smn_ree;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, StdCtrls, ComCtrls, Grids, DBGridEh,
  Buttons, Placemnt, RxLookup, ExtCtrls, PrnDbgeh, ActnList, ActnMan,
  ToolWin, ActnCtrls,ActnMenus, MdiForm, TB2Item, TB2Dock,
  TB2Toolbar, UCrpe32, UCrpeClasses, ImgList, XPStyleActnCtrls, TB2ExtItems,
  Menus, Mask, ToolEdit, DBCtrls, DateUtils;

type
  Tf_smn_ree = class(Tf_MDIForm)
    ora_Session: TOracleSession;
    q_pod_rows: TOracleDataSet;
    ds_pod_rows: TDataSource;
    FormStorage1: TFormStorage;
    q_VagOwner: TOracleDataSet;
    ds_VagOwner: TDataSource;
    PrintDBGridEh1: TPrintDBGridEh;
    ActionManager1: TActionManager;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    StatusBar1: TStatusBar;
    acRefresh: TAction;
    acToXLS: TAction;
    SaveDialog1: TSaveDialog;
    TBPopupMenu1: TTBPopupMenu;
    TBItem14: TTBItem;
    Panel3: TPanel;
    gridRows: TDBGridEh;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    sbRefresh: TSpeedButton;
    Panel4: TPanel;
    Time2: TDateTimePicker;
    time1: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Date2: TDateTimePicker;
    Date1: TDateTimePicker;
    q_pod_rowsNUM_POS: TFloatField;
    q_pod_rowsNUM_KVIT: TFloatField;
    q_pod_rowsNUM_CIST: TStringField;
    q_pod_rowsVZLIV: TIntegerField;
    q_pod_rowsVES: TFloatField;
    q_pod_rowsCAPACITY: TStringField;
    q_pod_rowsAXES: TIntegerField;
    q_pod_rowsPLOMBA1: TStringField;
    q_pod_rowsPLOMBA2: TStringField;
    q_pod_rowsKALIBR_ID: TStringField;
    q_podacha: TOracleDataSet;
    ds_podacha: TDataSource;
    q_podachaPOD_DATE: TDateTimeField;
    q_podachaKOL: TIntegerField;
    q_podachaVES: TFloatField;
    q_podachaGOTOV_DATE: TDateTimeField;
    q_podachaNALIV_DATE: TDateTimeField;
    q_podachaLUKOMA_NUM: TIntegerField;
    q_podachaMPS_NUM: TIntegerField;
    Panel5: TPanel;
    gridTitle: TDBGridEh;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label9: TLabel;
    ed_pasp_num: TDBEdit;
    ed_pasp_date: TDBEdit;
    Label10: TLabel;
    ed_rez_num: TDBEdit;
    ed_pl: TDBEdit;
    Label11: TLabel;
    q_podachaPL: TFloatField;
    q_podachaTEMPER: TFloatField;
    Label12: TLabel;
    ed_temper: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    q_podachaPOD_NUM: TStringField;
    ed_pl15: TDBEdit;
    ed_pl20: TDBEdit;
    ed_water: TDBEdit;
    ed_salt: TDBEdit;
    ed_dirt: TDBEdit;
    ed_sulfur: TDBEdit;
    q_pod_rowsID: TFloatField;
    q_pod_rowsPODACHA_ID: TFloatField;
    q_pod_rowsVAGOWNER_ID: TFloatField;
    q_pod_rowsVES_CIST: TFloatField;
    q_VagOwnerID: TFloatField;
    q_VagOwnerVAGOWNER_NAME: TStringField;
    q_VagOwnerSHORT_NAME: TStringField;
    q_VagOwnerPREDPR_ID: TIntegerField;
    q_VagOwnerVAGOWN_MOS_ID: TFloatField;
    q_VagOwnerVAGOWN_TYP_ID: TFloatField;
    q_VagOwnerSOBSTV_ID: TFloatField;
    q_VagOwnerDISPLAY_NAME: TStringField;
    q_VagOwnerOWNER_ID: TFloatField;
    q_pod_rowsVAGOWNER_NAME: TStringField;
    acLoadReeSMN: TAction;
    TBItem1: TTBItem;
    q_podachaID: TFloatField;
    q_podachaLOAD_TYPE_ID: TIntegerField;
    q_podachaVETKA_OTP_ID: TFloatField;
    q_podachaMESTO_ID: TIntegerField;
    q_podachaPROD_ID_NPR: TStringField;
    q_podachaPL15: TFloatField;
    q_podachaPL20: TFloatField;
    q_podachaWATER: TFloatField;
    q_podachaSALT: TFloatField;
    q_podachaDIRT: TFloatField;
    q_podachaSULFUR: TFloatField;
    q_podachaDNP: TIntegerField;
    q_podachaPASP_NUM: TStringField;
    q_podachaPASP_DATE: TDateTimeField;
    q_podachaREZ_NUM: TStringField;
    acReeSMNToDbf: TAction;
    TBItem2: TTBItem;
    q_pod_rowsNOM_ZD: TStringField;
    q_pod_rowsZPU_TYPE1: TFloatField;
    q_pod_rowsZPU_TYPE2: TFloatField;
    q_pod_rowsROW_ID: TStringField;
    q_cmn: TOracleDataSet;
    acLoadReeSMN_2: TAction;
    TBItem3: TTBItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure q_pod_rowsBeforeOpen(DataSet: TDataSet);
    procedure gridRowsGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure gridRowsSortMarkingChanged(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure acToXLSExecute(Sender: TObject);
    procedure gridTitleGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure gridTitleSortMarkingChanged(Sender: TObject);
    procedure q_podachaAfterScroll(DataSet: TDataSet);
    procedure q_podachaBeforeOpen(DataSet: TDataSet);
    procedure acLoadReeSMNExecute(Sender: TObject);
    procedure acReeSMNToDbfExecute(Sender: TObject);
    procedure gridRowsColumns8EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure acLoadReeSMN_2Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_smn_ree: Tf_smn_ree;

implementation

uses ForDB,ComObj,ForReport,CommCtrl,RXHints,DBGridEhImpExp,RxShell,
  LoadReeSMN, OraToDbf, ForEnv, KlsMisc2, loadreesmn_2, main;

{$R *.dfm}

procedure Tf_smn_ree.FormCreate(Sender: TObject);
begin
  Time1.Time:=StrToTime('00:00');
  Time2.Time:=StrToTime('00:00');
  Date1.Date:=StartOfTheMonth(Date);
  Date2.Date:=Date+1;
  f_db.LogonMasterSession(ora_Session);
end;

procedure Tf_smn_ree.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if q_podacha.State=dsEdit then q_podacha.Post;
  if q_pod_rows.State=dsEdit then q_pod_rows.Post;
  Ora_session.LogOff;
  Action:=caFree;
end;

procedure Tf_smn_ree.FormShow(Sender: TObject);
begin
  q_VagOwner.Open;
  q_Podacha.Open;
  gridTitle.SetFocus;
end;

procedure Tf_smn_ree.q_pod_rowsBeforeOpen(DataSet: TDataSet);
begin
  with q_pod_rows do
  begin
    SQL[3]:='where podacha_id=0';
  end;
  if q_podacha.Active then
    if not q_podacha.Eof then
    with q_pod_rows do
    begin
      SQL[3]:='where podacha_id='+q_podacha.FieldByName('ID').asString;
    end;
end;

procedure Tf_smn_ree.gridRowsGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if q_pod_rows.RecNo mod 2=0 then
    Background:=clInfoBk;
  if gdSelected in State then
    Background:=clNavy;
end;

procedure Tf_smn_ree.gridRowsSortMarkingChanged(Sender: TObject);
begin
  f_db.SortInGrid(q_pod_rows,q_pod_rows.SQL.Count-1,gridRows);
end;

procedure Tf_smn_ree.acRefreshExecute(Sender: TObject);
begin
  inherited;
  if q_podacha.State=dsEdit then q_podacha.Post;
  if q_pod_rows.State=dsEdit then q_pod_rows.Post;
  f_db.ReQuery(q_podacha,true);
end;

procedure Tf_smn_ree.acToXLSExecute(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
    if not FileExists(SaveDialog1.FileName) then
      begin
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,gridRows,SaveDialog1.FileName,True);
        FileExecute(SaveDialog1.FileName,'','',esMaximized);
      end
    else
      if MessageDlg('‘айл уже существует! ѕереписать?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,gridRows,SaveDialog1.FileName,True);
          FileExecute(SaveDialog1.FileName,'','',esMaximized);
        end
end;

procedure Tf_smn_ree.gridTitleGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if q_podacha.RecNo mod 2=0 then
    Background:=clInfoBk;
  if gdSelected in State then
    Background:=clNavy;
end;

procedure Tf_smn_ree.gridTitleSortMarkingChanged(Sender: TObject);
begin
  inherited;
  f_db.SortInGrid(q_podacha,q_podacha.SQL.Count-1,gridTitle);
end;

procedure Tf_smn_ree.q_podachaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  f_db.ReQuery(q_pod_rows,true);
end;

procedure Tf_smn_ree.q_podachaBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  with q_Podacha do
  begin
    SQL[3]:='where pod_date>=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date1.Date)+' '+FormatDateTime('hh:mm',time1.Time)+''',''dd.mm.yyyy hh24:mi'')';
    SQL[4]:='and pod_date<=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date2.Date)+' '+FormatDateTime('hh:mm',time2.Time)+''',''dd.mm.yyyy hh24:mi'')';
  end;
end;

procedure Tf_smn_ree.acLoadReeSMNExecute(Sender: TObject);
begin
  inherited;
  with Tf_LoadReeSMN_1.Create(Self) do
  Begin
    showmodal;
    Free;
    f_db.ReQuery(q_Podacha,True);
  End;
end;

procedure Tf_smn_ree.acReeSMNToDbfExecute(Sender: TObject);
var DBFFile,FlagFile:string;
    IsOk:boolean;
begin
  inherited;
  // DBF-файл дл€ отправки реестра на Ёстакаду
  DBFFile := F_Env.GetEnv(APPLICATION_NAME,SCHEMA_NAME,'VARI','LOAD_REE_SMN_DBF',f_main.ora_Session);
  // ‘айл-флаг дл€ отправки реестра на Ёстакаду
  FlagFile := F_Env.GetEnv(APPLICATION_NAME,SCHEMA_NAME,'VARI','LOAD_REE_SMN_FLAG',f_main.ora_Session);

  // —оздать флаг
  IF NOT FileExists(FlagFile) Then
    try
      FileClose(FileCreate(FlagFile));
      IsOk:=true;
    except
      IsOk:=false;
    end;

  if not IsOk or FileExists(DBFFile) then
  Begin
    MessageDlg('»дет отправка предыдущего реестра! ƒождитесь окончани€ отправки!',mtWarning, [mbOk], 0);
    exit;
  end;

  if not q_podacha.Eof then
  with tf_ORAToDBF.Create(Self) do
    begin
      Title:='ќтправить на Ё—“ј јƒ” реестр N '+q_podacha.FieldByName('POD_NUM').AsString;
      DontAsk:=false;
      Param1:=q_podacha.FieldByName('ID').AsString;
      DBFtoORAid:='REE_SMN';
      ShowModal;
    end;
end;

procedure Tf_smn_ree.gridRowsColumns8EditButtonClick(Sender: TObject;
  var Handled: Boolean);
begin
  inherited;
  if q_pod_rows.Eof then exit;
  KlsMisc2.SetKLSParam('KLS_VAGOWNER','CHOOSE',fsNormal,q_pod_rowsVAGOWNER_ID.AsString);
  with tf_KlsMisc.Create(Self) do
  begin
    if ShowModal=mrOk then
    Begin
      f_db.ReQuery(q_pod_rows,true);
      if q_pod_rows.State=dsBrowse then q_pod_rows.Edit;
      q_pod_rowsVAGOWNER_ID.AsString:=KlsMisc2.vIdToSeek;
      q_pod_rows.Post;

      if MessageDlg('»зменить собственника у остальных вагонов на '+q_pod_rowsVAGOWNER_NAME.AsString+' ?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      with q_cmn do
      try
        Close;
        SQL.Clear;
        SQL.Add('BEGIN');
        SQL.Add('  UPDATE podacha_rows SET vagowner_id='+KlsMisc2.vIdToSeek+' WHERE podacha_id='+q_pod_rowsPODACHA_ID.AsString+';');
        SQL.Add('  COMMIT;');
        SQL.Add('END;');
        ExecSQL;
        f_db.ReQuery(q_pod_rows,true);
      except
      end
    End;
    Free;
  end;
end;

procedure Tf_smn_ree.acLoadReeSMN_2Execute(Sender: TObject);
begin
  inherited;
  if not q_pod_rows.eof then
  with Tf_LoadReeSMN_2.Create(Self) do
  Begin
    PodachaId:=q_pod_rowsPODACHA_ID.AsInteger;
    showmodal;
    Free;
    f_db.ReQuery(q_Pod_rows,True);
  End;
end;

end.
