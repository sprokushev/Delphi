unit ParusLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, StdCtrls, ComCtrls, Grids, DBGridEh,
  Buttons, Placemnt, RxLookup, ExtCtrls, PrnDbgeh, ActnList, ActnMan,
  ToolWin, ActnCtrls,ActnMenus, MdiForm, TB2Item, TB2Dock,
  TB2Toolbar, UCrpe32, UCrpeClasses, ImgList, XPStyleActnCtrls, TB2ExtItems,DateUtils,
  Menus;

type
  Tf_ParusLog = class(Tf_MDIForm)
    sesParus: TOracleSession;
    q_log: TOracleDataSet;
    ds_log: TDataSource;
    FormStorage1: TFormStorage;
    q_user: TOracleDataSet;
    ds_user: TDataSource;
    ActionManager1: TActionManager;
    StatusBar1: TStatusBar;
    acPodachaRefresh: TAction;
    ImageList1: TImageList;
    SaveDialog1: TSaveDialog;
    PopupMenu: TTBPopupMenu;
    TBItem9: TTBItem;
    acPodachaToXLS: TAction;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    lc_user: TRxDBLookupCombo;
    Date1: TDateTimePicker;
    Date2: TDateTimePicker;
    GridPod: TDBGridEh;
    Button1: TButton;
    ParusLogon: TOracleLogon;
    q_userAUTHID: TStringField;
    q_userNAME: TStringField;
    q_logRN: TFloatField;
    q_logNAME: TStringField;
    q_logMODIFDATE: TDateTimeField;
    q_logOPER: TStringField;
    q_logTABLENOTE: TStringField;
    q_logNOTE: TStringField;
    q_logOSUSER: TStringField;
    q_logMACHINE: TStringField;
    rbNow: TRadioButton;
    rbArh: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure q_logBeforeOpen(DataSet: TDataSet);
    procedure GridPodGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure GridPodSortMarkingChanged(Sender: TObject);
    procedure acPodachaRefreshExecute(Sender: TObject);
    procedure q_logAfterOpen(DataSet: TDataSet);
    procedure acPodachaToXLSExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    QueryBegin,QueryEnd:TDateTime;
  end;

var
  f_ParusLog: Tf_ParusLog;

implementation

uses ForDB,ComObj,CommCtrl,RXHints,DBGridEhImpExp,RxShell,
  main, Math, ForTemp, ForFiles;

{$R *.dfm}

procedure Tf_ParusLog.FormCreate(Sender: TObject);
begin
  Date1.Date:=Date-1;
  Date2.Date:=Date+1;
  if not ParusLogon.Execute then
  begin
    MessageDlg('Введите правильно имя пользователя ПАРУС и пароль!',mtError,[mbOk],0);
  end;
end;

procedure Tf_ParusLog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  q_log.Close;
  q_user.Close;
  sesParus.LogOff;
  Action:=caFree;
end;

procedure Tf_ParusLog.FormShow(Sender: TObject);
begin
  q_user.Open;
//  q_log.Open;
end;

procedure Tf_ParusLog.q_logBeforeOpen(DataSet: TDataSet);
begin
  QueryBegin:=Now;
  with q_log do
  begin
    if rbNow.Checked then
      SQL[15]:=' updatelist a '
    else
      SQL[15]:='   load_buffer.updatelist_arc@VEGA.WORLD a ';
    SetVariable('AUTHID',q_userAUTHID.Value);
    SetVariable('BEG_DATE',DateOf(Date1.Date));
    SetVariable('END_DATE',DateOf(Date2.Date));
  end;
end;

procedure Tf_ParusLog.GridPodGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if q_log.RecNo mod 2=0 then
    Background:=clInfoBk;
  if gdSelected in State then
    Background:=clNavy;
end;

procedure Tf_ParusLog.GridPodSortMarkingChanged(Sender: TObject);
begin
  f_db.SortInGrid(q_log,q_log.SQL.Count-1,GridPod);
end;

procedure Tf_ParusLog.acPodachaRefreshExecute(Sender: TObject);
begin
  inherited;
  if not q_user.Active then exit;
  if q_user.IsEmpty then exit;
  f_db.ReQuery(q_log,False);
end;

procedure Tf_ParusLog.q_logAfterOpen(DataSet: TDataSet);
begin
  inherited;
  QueryEnd:=Now;
  StatusBar1.Panels[0].Text:='Время выполнения '+FormatDateTime('nn:ss.zzz',QueryEnd-QueryBegin)
end;

procedure Tf_ParusLog.acPodachaToXLSExecute(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
    if not FileExists(SaveDialog1.FileName) then
      begin
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,GridPod,SaveDialog1.FileName,True);
        FileExecute(SaveDialog1.FileName,'','',esMaximized);
      end
    else
      if MessageDlg('Файл уже существует! Переписать?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,GridPod,SaveDialog1.FileName,True);
          FileExecute(SaveDialog1.FileName,'','',esMaximized);
        end
end;

end.
