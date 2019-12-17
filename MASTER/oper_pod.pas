unit oper_pod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, StdCtrls, ComCtrls, Grids, DBGridEh,
  Buttons, Placemnt, RxLookup, ExtCtrls, PrnDbgeh, ActnList, ActnMan,
  ToolWin, ActnCtrls,ActnMenus, MdiForm, TB2Item, TB2Dock,
  TB2Toolbar, UCrpe32, UCrpeClasses, ImgList, XPStyleActnCtrls, TB2ExtItems,DateUtils,
  Menus;

type
  Tf_oper_pod = class(Tf_MDIForm)
    ora_Session: TOracleSession;
    q_oper_pod: TOracleDataSet;
    ds_oper_pod: TDataSource;
    FormStorage1: TFormStorage;
    q_Track: TOracleDataSet;
    ds_Track: TDataSource;
    ActionManager1: TActionManager;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    StatusBar1: TStatusBar;
    acPodachaRefresh: TAction;
    ImageList1: TImageList;
    acPodRowsToXLS: TAction;
    SaveDialog1: TSaveDialog;
    PopupMenuPod: TTBPopupMenu;
    TBItem9: TTBItem;
    q_podrow: TOracleDataSet;
    ds_podrow: TDataSource;
    acPodachaToXLS: TAction;
    PopupMenuRows: TTBPopupMenu;
    TBItem13: TTBItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    sbNotTrack: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    lc_track: TRxDBLookupCombo;
    Date1: TDateTimePicker;
    Date2: TDateTimePicker;
    GridPod: TDBGridEh;
    Splitter1: TSplitter;
    TBDock2: TTBDock;
    TBToolbar2: TTBToolbar;
    GroupBox3: TGroupBox;
    GridRows: TDBGridEh;
    q_oper_podID: TFloatField;
    q_oper_podPOD_NUM: TStringField;
    q_oper_podPOD_DATE: TDateTimeField;
    q_oper_podLUKOMA_NUM: TIntegerField;
    q_oper_podGD_UVED_NUM: TIntegerField;
    q_oper_podVETKA_OTP_ID: TFloatField;
    q_oper_podVETKA_OTP_NAME: TStringField;
    q_oper_podUSER_ID: TFloatField;
    q_oper_podUSER_NAME: TStringField;
    q_oper_podGOTOV_DATE: TDateTimeField;
    q_oper_podNALIV_DATE: TDateTimeField;
    q_oper_podEND_NALIV_DATE: TDateTimeField;
    q_oper_podDATE_OFORML: TDateTimeField;
    q_oper_podPOD_KOL: TFloatField;
    q_oper_podPOD_VES: TFloatField;
    q_podrowID: TFloatField;
    q_podrowPODACHA_ID: TFloatField;
    q_podrowNUM_POS: TFloatField;
    q_podrowVAGONTYPE_NAME: TStringField;
    q_podrowNUM_CIST: TStringField;
    q_podrowVAG_STATUS_NAME: TStringField;
    q_podrowSVED_GOTOV_TIME: TDateTimeField;
    q_podrowSVED_NALIV_TIME: TDateTimeField;
    q_podrowSVED_END_NALIV_TIME: TDateTimeField;
    q_podrowDATE_OFORML: TDateTimeField;
    q_podrowVAGOWNER_NAME: TStringField;
    q_podrowNCISTDOP: TIntegerField;
    q_podrowKALIBR_ID: TStringField;
    q_podrowAXES: TIntegerField;
    q_podrowCAPACITY: TStringField;
    q_podrowVETKA_POD_NAME: TStringField;
    q_podrowDEFI_MASS_NAME: TStringField;
    q_podrowVES_BRUTTO: TFloatField;
    q_podrowVES_CIST: TFloatField;
    q_podrowVZLIV: TIntegerField;
    q_podrowVOLUME: TFloatField;
    q_podrowTEMPER: TFloatField;
    q_podrowPL20: TFloatField;
    q_podrowFACT_PL: TFloatField;
    q_podrowVES: TFloatField;
    q_podrowKOL_NET: TFloatField;
    q_podrowPLOMBA1: TStringField;
    q_podrowPLOMBA2: TStringField;
    q_podrowPASP_NUM: TStringField;
    q_podrowPASP_DATE: TDateTimeField;
    q_podrowREZ_NUM: TStringField;
    q_podrowNAME_NPR: TStringField;
    q_podrowNOM_ZD: TStringField;
    q_podrowSVED_NUM: TIntegerField;
    q_podrowSVED_DATE: TDateTimeField;
    q_TrackID: TFloatField;
    q_TrackVETKA_NAME: TStringField;
    q_podrowPOD_NUM: TStringField;
    q_podrowPOD_DATE: TDateTimeField;
    q_podrowVETKA_OTP_NAME: TStringField;
    q_podrowUSER_NAME: TStringField;
    TBItem1: TTBItem;
    Button1: TButton;
    acPrint: TAction;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure q_oper_podBeforeOpen(DataSet: TDataSet);
    procedure GridPodSortMarkingChanged(Sender: TObject);
    procedure acPodachaRefreshExecute(Sender: TObject);
    procedure q_oper_podAfterOpen(DataSet: TDataSet);
    procedure sbNotTrackClick(Sender: TObject);
    procedure acPodRowsToXLSExecute(Sender: TObject);
    procedure q_podrowBeforeOpen(DataSet: TDataSet);
    procedure q_oper_podAfterScroll(DataSet: TDataSet);
    procedure acPodachaToXLSExecute(Sender: TObject);
    procedure GridRowsSortMarkingChanged(Sender: TObject);
    procedure acPrintExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    QueryBegin,QueryEnd:TDateTime;
  end;

var
  f_oper_pod: Tf_oper_pod;

implementation

uses ForDB,ComObj,ForReport, opreeflt,CommCtrl,RXHints,DBGridEhImpExp,RxShell,
  DocStream, main, Math, ForTemp, ForFiles;

{$R *.dfm}

procedure Tf_oper_pod.FormCreate(Sender: TObject);
begin
  Date1.Date:=Date-1;
  Date2.Date:=Date+1;
  f_db.LogonMasterSession(Ora_session);
  f_db.SetUserGrants(ActionManager1);
end;

procedure Tf_oper_pod.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  q_podrow.Close;
  q_Oper_pod.Close;
  q_Track.Close;
  Ora_session.LogOff;
  Action:=caFree;
end;

procedure Tf_oper_pod.FormShow(Sender: TObject);
begin
  q_oper_pod.Open;
  q_podrow.Open;
  q_Track.Open;
end;

procedure Tf_oper_pod.q_oper_podBeforeOpen(DataSet: TDataSet);
begin
  QueryBegin:=Now;
  with q_oper_pod do
  begin
    SetVariable('BEGIN_DATE',DateOf(Date1.Date));
    SetVariable('END_DATE',DateOf(Date2.Date));
    SetVariable('VETKA_OTP_ID',lc_track.Value);
    if sbNotTrack.Caption='=' then
      SetVariable('IS_NOT',0)
    else
      SetVariable('IS_NOT',1);
  end;
end;

procedure Tf_oper_pod.GridPodSortMarkingChanged(Sender: TObject);
begin
  f_db.SortInGrid(q_Oper_pod,q_Oper_pod.SQL.Count-1,GridPod);
end;

procedure Tf_oper_pod.acPodachaRefreshExecute(Sender: TObject);
begin
  inherited;
  f_db.ReQuery(q_Oper_pod,False);
end;

procedure Tf_oper_pod.q_oper_podAfterOpen(DataSet: TDataSet);
begin
  inherited;
  QueryEnd:=Now;
  StatusBar1.Panels[0].Text:='Время выполнения '+FormatDateTime('nn:ss.zzz',QueryEnd-QueryBegin)
end;

procedure Tf_oper_pod.sbNotTrackClick(Sender: TObject);
begin
  inherited;
  if sbNotTrack.Caption='<>' then sbNotTrack.Caption:='='
  else sbNotTrack.Caption:='<>';
end;

procedure Tf_oper_pod.acPodRowsToXLSExecute(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
    if not FileExists(SaveDialog1.FileName) then
      begin
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,GridRows,SaveDialog1.FileName,True);
        FileExecute(SaveDialog1.FileName,'','',esMaximized);
      end
    else
      if MessageDlg('Файл уже существует! Переписать?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,GridRows,SaveDialog1.FileName,True);
          FileExecute(SaveDialog1.FileName,'','',esMaximized);
        end
end;

procedure Tf_oper_pod.q_podrowBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  if not q_oper_pod.Eof then
    q_podrow.SetVariable('PODACHA_ID',q_oper_pod.FieldByName('ID').AsInteger)
  else
    q_podrow.SetVariable('PODACHA_ID',0);
end;

procedure Tf_oper_pod.q_oper_podAfterScroll(DataSet: TDataSet);
begin
  with q_podrow do
  begin
    Close;
    Open;
  end;
end;

procedure Tf_oper_pod.acPodachaToXLSExecute(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
    if not FileExists(SaveDialog1.FileName) then
      begin
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,GridRows,SaveDialog1.FileName,True);
        FileExecute(SaveDialog1.FileName,'','',esMaximized);
      end
    else
      if MessageDlg('Файл уже существует! Переписать?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,GridRows,SaveDialog1.FileName,True);
          FileExecute(SaveDialog1.FileName,'','',esMaximized);
        end
end;

procedure Tf_oper_pod.GridRowsSortMarkingChanged(Sender: TObject);
begin
  inherited;
  f_db.SortInGrid(q_podrow,q_podrow.SQL.Count-1,GridRows);

end;

procedure Tf_oper_pod.acPrintExecute(Sender: TObject);
var RepFileName:string;
begin
  inherited;
  RepFileName:='MO_MNOS.XLS';

  with TempVari do
  begin
    SetVariNum('PODACHA_ID',q_oper_pod.FieldByName('ID').AsFloat,APPLICATION_NAME,RepFileName);
  end;

  F_FileUtils.CheckReport(RepFileName,f_main.TempNetPath+RepFileName);
  try
    F_FileUtils.ExecAndWait(f_main.TempNetPath+RepFileName,'',SW_SHOWMAXIMIZED,false);
  except
  end;
end;

end.
