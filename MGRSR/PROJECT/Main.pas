unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, ComCtrls, ScanTh, TimeTh, StdCtrls, ToolWin, Menus, Db,
  DBTables, IniFiles, Mask, DBCtrls, RXShell, AppEvent, RxMenus, RXCtrls,
  Buttons, Placemnt, ImgList, RxNotify, ICMP, PingTh, LdTaskTh, rxStrUtils;

type
  TfmMain = class(TForm)
    slMain: TStatusBar;
    tmMain: TTimer;
    tmWatch: TTimer;
    mmMain: TMainMenu;
    moFile: TMenuItem;
    moExit: TMenuItem;
    moParameters: TMenuItem;
    moOptions: TMenuItem;
    moGuid: TMenuItem;
    tbMain: TToolBar;
    moScan: TMenuItem;
    moTask: TMenuItem;
    moPackets: TMenuItem;
    moTimeEvn: TMenuItem;
    tmTimeEvent: TTimer;
    rxtiMain: TRxTrayIcon;
    AppEvents: TAppEvents;
    rxpmMain: TRxPopupMenu;
    mpScan: TMenuItem;
    N1: TMenuItem;
    mpPackets: TMenuItem;
    mpEvents: TMenuItem;
    N2: TMenuItem;
    mpExit: TMenuItem;
    moAdmin: TMenuItem;
    mpAdmin: TMenuItem;
    N6: TMenuItem;
    sbEvents: TSpeedButton;
    sbExit: TSpeedButton;
    ToolButton1: TToolButton;
    sbOptions: TSpeedButton;
    sbPackets: TSpeedButton;
    sbTimeEvn: TSpeedButton;
    N4: TMenuItem;
    moHelp: TMenuItem;
    moAbout: TMenuItem;
    N8: TMenuItem;
    SpeedButton1: TSpeedButton;
    ToolButton2: TToolButton;
    sbHelp: TSpeedButton;
    mpHelp: TMenuItem;
    N5: TMenuItem;
    moRaznarLog: TMenuItem;
    FormPlacement2: TFormPlacement;
    moEvents: TMenuItem;
    sbAdmin: TSpeedButton;
    moInfoSoft: TMenuItem;
    ToolButton3: TToolButton;
    sbRunNow: TToolButton;
    ImageList1: TImageList;
    moLstFiles: TMenuItem;
    sbLstFiles: TSpeedButton;
    PingICMP: Ticmp;
    moPingList: TMenuItem;
    tmPing: TTimer;
    sbPingList: TSpeedButton;
    moLoadTaskList: TMenuItem;
    tmLoadTask: TTimer;
    moTaskLog: TMenuItem;
    sbLoadTask: TSpeedButton;
    sbTaskLog: TSpeedButton;
    moTimeScan: TMenuItem;
    moPinging: TMenuItem;
    moLoadTask: TMenuItem;
    moLogs: TMenuItem;
    slPinging: TStatusBar;
    slLoadTask: TStatusBar;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    mpTimeScan: TMenuItem;
    mpPinging: TMenuItem;
    mpLoadTask: TMenuItem;
    procedure tmWatchTimer(Sender: TObject);
    procedure tmMainTimer(Sender: TObject);
    procedure moExitClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure moScanClick(Sender: TObject);
    procedure moOptionsClick(Sender: TObject);
    procedure tmTimeEventTimer(Sender: TObject);
    procedure AppEventsMinimize(Sender: TObject);
    procedure AppEventsRestore(Sender: TObject);
    procedure AppHint(Sender: TObject);
    procedure rxtiMainClick(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure moPacketsClick(Sender: TObject);
    procedure moTimeEvnClick(Sender: TObject);
    procedure moAdminClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure moAboutClick(Sender: TObject);
    procedure moHelpClick(Sender: TObject);
    procedure moRaznarLogClick(Sender: TObject);
    procedure moEventsClick(Sender: TObject);
    procedure moInfoSoftClick(Sender: TObject);
    procedure sbRunNowClick(Sender: TObject);
    procedure moLstFilesClick(Sender: TObject);
    procedure moPingListClick(Sender: TObject);
    procedure tmPingTimer(Sender: TObject);
    procedure moLoadTaskListClick(Sender: TObject);
    procedure tmLoadTaskTimer(Sender: TObject);
    procedure moTaskLogClick(Sender: TObject);
    procedure moTimeScanClick(Sender: TObject);
    procedure moPingingClick(Sender: TObject);
    procedure moLoadTaskClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure pScanThTerminated(Sender: TObject);
    procedure pPingThTerminated(Sender: TObject);
    procedure pTimeThTerminated(Sender: TObject);
    procedure pLoadTaskThTerminated(Sender: TObject);
  public
    { Public declarations }
    pScanThread : TScanThread;
    pPingThread : TPingThread;
    pTimeThread : TTimeThread;
    pLoadTaskThread : TLoadTaskThread;

    gHelpFile : String;
    gInfoFile : String;
    gStatusHint : String;
    gPingingHint : String;
    gLoadTaskHint : String;
    gTimeScanHint : String;
    gIniFile: TIniFile;
    gKodSession : String[12];
    gTimeStart, gDateStart : TDateTime;
    gLoadTask,gTimeScan,gPinging, gScan, gManager : Boolean;
    gInterval,gPingInterval,gLoadTaskInterval : Integer;
    gPathEventsDBF, gFoxPro, gVFP, gDoPrgApp : String;
    procedure WMUser (var msg: TMessage); message wm_User;
  end;

Const
  SCANRUN = 'Сканирование флагов не выполняется';
  SCANNOTRUN = '';
  TIMESCANRUN = 'Генерация событий не выполняется';
  PINGINGRUN = 'Опрос IP-адресов не выполняется';
  LOADTASKRUN = 'Закачка в ORACLE не выполняется';
var
  fmMain: TfmMain;
  gRecNoProtokol : TBookmark;

function ExecAndWait(const FileName, Params: ShortString; const WinState: Word;IsWait:boolean): boolean; export;

implementation

uses Data, Options, Packets, TimeEvn, Admin, About, Help, RaznLog, Events,
  InfoSoft, LstFiles, PingList, LoadTask, LogTask;    //VCLUtils

{$R *.DFM}

procedure TfmMain.WMUser (var msg: TMessage);
begin
  Application.Restore;
end;

procedure TfmMain.AppHint(Sender: TObject);
begin
  if fmEvents.Active then
    fmEvents.slEvents.Panels[0].Text := Application.Hint
  else if fmMain.Active then
    slMain.Panels[1].Text := Application.Hint;
end;

procedure TfmMain.tmWatchTimer(Sender: TObject);
begin
  fmMain.slMain.Panels[0].Text := TimeToStr(Time);
end;

procedure TfmMain.tmMainTimer(Sender: TObject);
begin
  if gScan and not Assigned(pScanThread) then
  begin
    fmMain.rxtiMain.Animated := True;
    pScanThread := TScanThread.Create(False);
    pScanThread.FreeOnTerminate := True;
    pScanThread.OnTerminate := pScanThTerminated;
    pScanThread.Resume;
  end; {if}
end;

procedure TfmMain.pScanThTerminated(Sender: TObject);
begin
  pScanThread := nil;
  fmMain.rxtiMain.Animated := False;
end;

procedure TfmMain.pPingThTerminated(Sender: TObject);
begin
  pPingThread := nil;
end;

procedure TfmMain.pLoadTaskThTerminated(Sender: TObject);
begin
  pLoadTaskThread := nil;
end;

procedure TfmMain.tmTimeEventTimer(Sender: TObject);
begin
  if gTimeScan and not Assigned(pTimeThread) then
  begin
    pTimeThread := TTimeThread.Create(False);
    pTimeThread.FreeOnTerminate := True;
    pTimeThread.OnTerminate := pTimeThTerminated;
    pTimeThread.Resume;
  end; {if}
end;

procedure TfmMain.pTimeThTerminated(Sender: TObject);
begin
  pTimeThread := nil;
end;

procedure TfmMain.moExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  gDateStart := Date;
  gTimeStart := Time;
  gHelpFile := ExtractFilePath(Application.ExeName) + 'Help.hlp';
  gInfoFile := ExtractFilePath(Application.ExeName) + 'MgrSr.hlp';
  if not FileExists(gHelpFile) then
  begin
    moHelp.Enabled := False;
    mpHelp.Enabled := False;
    sbHelp.Enabled := False;
  end;{if}
  if not FileExists(gInfoFile) then
    moInfoSoft.Enabled := False;

  gIniFile := TIniFile.Create('MgrSrUhta.ini');
  gManager := gIniFile.ReadBool('Manager','Active', False);
  if gManager then
  begin
    fmMain.Caption := 'Менеджер процессов/Старт '+DateToStr(gDateStart)+'  '+TimeToStr(gTimeStart);
    gScan  := gIniFile.ReadBool ('Manager','Scanning', False);
    gPinging := gIniFile.ReadBool ('Manager','Pinging', False);
    gLoadTask := gIniFile.ReadBool ('Manager','LoadTask', False);
    gTimeScan  := gIniFile.ReadBool ('Manager','TimeScan', False);
    gInterval := gIniFile.ReadInteger ('Manager','Interval(min)', 2) * 60000; // 1 мин - 60,000 мсек
    if gInterval = 0 then gInterval := 60000;
    gPingInterval := gIniFile.ReadInteger ('Manager','Ping-interval(min)', 2) * 60000; // 1 мин - 60,000 мсек
    if gPingInterval = 0 then gPingInterval := 60000;
    gLoadTaskInterval := gIniFile.ReadInteger ('Manager','LoadTask-interval(min)', 2) * 60000; // 1 мин - 60,000 мсек
    if gLoadTaskInterval = 0 then gLoadTaskInterval := 60000;
    gFoxPro := gIniFile.ReadString ('Location','FoxPro', 'C:\FPD26\foxprox.exe');
    gVFP := gIniFile.ReadString ('Location','Dispatcher VFP', 'C:\LUK\DBA\MP\DoPrgVFP.exe');
    gDoPrgApp := gIniFile.ReadString ('Location','Dispatcher DoPrg.app', 'C:\LUK\DBA\MP\doprg.app');
    gPathEventsDBF := gIniFile.ReadString ('Location','Path to Events.DBF', 'C:\LUK\DBA\MP\DBF');
  end
  else
    fmMain.Caption := 'Управление менеджером процессов';
  {if}
  (* В режиме пользователя, gManager = True, запрещаются все функции менеджера *)
  tmMain.Enabled := gManager;
  tmLoadTask.Enabled := gManager;
  tmPing.Enabled := gManager;
  tmTimeEvent.Enabled := gManager;
  moScan.Enabled := gManager;
  moTimeScan.Enabled := gManager;
  moLoadTask.Enabled := gManager;
  moPinging.Enabled := gManager;
  mpScan.Enabled := gManager;
  mpTimeScan.Enabled := gManager;
  mpLoadTask.Enabled := gManager;
  mpPinging.Enabled := gManager;
  moOptions.Enabled := gManager;
  sbOptions.Enabled := gManager;

  if gInterval = 0 then tmMain.Interval := 120000
  else tmMain.Interval := gInterval;

  if gLoadTaskInterval = 0 then tmLoadTask.Interval := 120000
  else tmLoadTask.Interval := gLoadTaskInterval;

  if gPingInterval = 0 then tmPing.Interval := 120000
  else tmPing.Interval := gPingInterval;

  moScan.Checked := gScan;
  mpScan.Checked := gScan;
  if not gScan then
    gStatusHint := SCANRUN
  else
    gStatusHint := SCANNOTRUN;
  slMain.Panels[1].Text := gStatusHint;
  rxtiMain.Hint := gStatusHint;

  moTimeScan.Checked := gTimeScan;
  mpTimeScan.Checked := gTimeScan;
  if not gTimeScan then
    gTimeScanHint := TIMESCANRUN
  else
    gTimeScanHint := SCANNOTRUN;
{  slTimeScan.Panels[0].Text := gTimeScanHint;}

  moPinging.Checked := gPinging;
  mpPinging.Checked := gPinging;
  if not gPinging then
    gPingingHint := PINGINGRUN
  else
    gPingingHint := SCANNOTRUN;
  slPinging.Panels[0].Text := gPingingHint;

  moLoadTask.Checked := gLoadTask;
  mpLoadTask.Checked := gLoadTask;
  if not gLoadTask then
    gLoadTaskHint := LOADTASKRUN
  else
    gLoadTaskHint := SCANNOTRUN;
  slLoadTask.Panels[0].Text := gLoadTaskHint;

  Str(Now*1e13:12:0,gKodSession);
  if gManager then
  with dmData do
  begin
    try
      taProtokol.Active := True;
      AddProtokol;
    except
      RestoreProtokol(False);
      taProtokol.Active := True;
      AddProtokol;
    end;
    taProtokol.Active := False;
  end; {with}
  Application.OnHint := AppHint;
end;

procedure TfmMain.FormDestroy(Sender: TObject);
begin

  if Assigned(pScanThread) then
  begin
    pScanThread.Terminate;
    pScanThread.Free;
    pScanThread := Nil;
  end; {if}
(*  if Assigned(pLoadTaskThread) then
  begin
    pLoadTaskThread.Terminate;
    pLoadTaskThread.Free;
    pLoadTaskThread := Nil;
  end; {if}
  if Assigned(pPingThread) then
  begin
    pPingThread.Terminate;
    pPingThread.Free;
    pPingThread := Nil;
  end; {if}
  if Assigned(pTimeThread) then
  begin
    pTimeThread.Terminate;
    pTimeThread.Free;
    pTimeThread := Nil;
  end; {if}*)

  if gManager then
  with dmData do
  begin
    try
      taProtokol.Active := True;
      UpdateProtokol;
    except
      RestoreProtokol(True);
      taProtokol.Active := True;
      UpdateProtokol;
    end;
    taProtokol.Active := False;
  end; {with}
  gIniFile.WriteBool ('Manager','Active', gManager);
  if gManager then
  begin
    gIniFile.WriteBool ('Manager','Scanning', gScan);
    gIniFile.WriteBool ('Manager','Pinging', gPinging);
    gIniFile.WriteBool ('Manager','LoadTask', gLoadTask);
    gIniFile.WriteBool ('Manager','TimeScan', gTimeScan);
    gIniFile.WriteInteger ('Manager','Interval(min)', Round(gInterval/60000));
    gIniFile.WriteInteger ('Manager','Ping-Interval(min)', Round(gPingInterval/60000));
    gIniFile.WriteInteger ('Manager','LoadTask-Interval(min)', Round(gLoadTaskInterval/60000));
    gIniFile.WriteString ('Location','FoxPro', gFoxPro);
    gIniFile.WriteString ('Location','Dispatcher VFP', gVFP);
    gIniFile.WriteString ('Location','Dispatcher DoPrg.app', gDoPrgApp);
    gIniFile.WriteString ('Location','Path to Events.DBF', gPathEventsDBF);
  end;{if}
  gIniFile.Destroy;
end;

procedure TfmMain.moScanClick(Sender: TObject);
begin
  if moScan.Checked then
  begin
    gScan := False;
    moScan.Checked := False;
    mpScan.Checked := False;
    gStatusHint := SCANRUN;
  end else
  begin
    gScan := True;
    moScan.Checked := True;
    mpScan.Checked := True;
    gStatusHint := SCANNOTRUN;
  end; {if}
  slMain.Panels[1].Text := gStatusHint;
  rxtiMain.Hint := gStatusHint;
end;

procedure TfmMain.moOptionsClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfmOptions, fmOptions);
    fmOptions.ShowModal;
  finally
    fmOptions.Free;
  end;
end;

procedure TfmMain.AppEventsMinimize(Sender: TObject);
begin
  ShowWindow(Application.Handle, SW_HIDE);
end;

procedure TfmMain.AppEventsRestore(Sender: TObject);
begin
  ShowWindow(Application.Handle, SW_SHOW);
end;

procedure TfmMain.rxtiMainClick(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Application.Restore;
  Application.BringToFront;
end;

procedure TfmMain.moPacketsClick(Sender: TObject);
begin
  with dmData do
  If NOT fmPackets.Visible Then
  begin
    taParamTipEvent.Open;
    taParamPackets.Open;
  end;
  fmPackets.Show;
end;

procedure TfmMain.moTimeEvnClick(Sender: TObject);
begin
  with dmData do
  If NOT fmTimeEvn.Visible Then
  begin
    taTEPackets.Open;
    taParamTimeEvn.Open;
  end;
  fmTimeEvn.Show;
end;

procedure TfmMain.moAdminClick(Sender: TObject);
begin
  with dmData do
  If NOT fmAdmin.Visible Then
  begin
    taAdminPackets.Open;
    try
      taAdminEvents.Open;
    except
      RestoreEvents;
      taAdminEvents.Open;
    end;
    try
      taAdminProtokol.Open;
    except
      RestoreProtokol(True);
      taAdminProtokol.Open;
    end;
    taAdminProtokol.Locate('ACTIVE',True,[loPartialKey]);
    fmAdmin.cbFilterChange(Sender);
    fmAdmin.cbMasterClick(Sender);
    taAdminEvents.Last;
  end;
  fmAdmin.Show;
end;

procedure TfmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
(*  if gManager then
  begin
    if MessageDlg('Завершить работу Менеджера процессов ?',
            mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      CanClose := True
    else
      CanClose := False;
  end
  else *)CanClose := True;{if}
end;

procedure TfmMain.moAboutClick(Sender: TObject);
begin
  Application.CreateForm(TfmAbout, fmAbout);
  try
    fmAbout.ShowModal;
  finally
    fmAbout.Free;
  end;{try}
end;

procedure TfmMain.moHelpClick(Sender: TObject);
begin
  fmHelp.Show;
end;

procedure TfmMain.moRaznarLogClick(Sender: TObject);
begin
  with dmData do
  If NOT fmRaznLog.Visible Then
  begin
    taRaznLog.Open;
    taRaznLog.Last;
  end;
  fmRaznLog.Show;
end;

procedure TfmMain.moEventsClick(Sender: TObject);
begin
  with dmData do
  If NOT fmEvents.Visible Then
  begin
    taViewPackets.Open;
    try
      taViewEvents.Open;
    except
      RestoreEvents;
      taViewEvents.Open;
    end;
    fmEvents.cbFilterChange(Sender);
    taViewEvents.Last;
  end;
  fmEvents.Show;
end;

procedure TfmMain.moInfoSoftClick(Sender: TObject);
begin
  fmInfoSoft.Show;
end;

procedure TfmMain.sbRunNowClick(Sender: TObject);
begin
  tmPing.OnTimer(Self);
  tmMain.OnTimer(Self);
  tmLoadTask.OnTimer(Self);
end;

procedure TfmMain.moLstFilesClick(Sender: TObject);
begin
  with dmData do
  If NOT fmListFiles.Visible Then
  begin
    taParamListFiles.Open;
  end;
  fmListFiles.Show;
end;

procedure TfmMain.moPingListClick(Sender: TObject);
begin
  with dmData do
  If NOT fmPingList.Visible Then
  begin
    taParamPingList.Open;
  end;
  fmPingList.Show;
end;

procedure TfmMain.tmPingTimer(Sender: TObject);
begin
  if gPinging and not Assigned(pPingThread) then
  begin
    fmMain.rxtiMain.Animated := True;
    pPingThread := TPingThread.Create(False);
    pPingThread.FreeOnTerminate := True;
    pPingThread.OnTerminate := pPingThTerminated;
    pPingThread.Resume;
  end; {if}
end;

procedure TfmMain.moLoadTaskListClick(Sender: TObject);
begin
  with dmData do
  If NOT fmLoadTask.Visible Then
  begin
    taParamLoadTask.Open;
  end;
  fmLoadTask.Show;
end;

procedure TfmMain.tmLoadTaskTimer(Sender: TObject);
begin
  if gLoadTask and not Assigned(pLoadTaskThread) then
  begin
    fmMain.rxtiMain.Animated := True;
    pLoadTaskThread := TLoadTaskThread.Create(False);
    pLoadTaskThread.FreeOnTerminate := True;
    pLoadTaskThread.OnTerminate := pLoadTaskThTerminated;
    pLoadTaskThread.Resume;
  end; {if}
end;

procedure TfmMain.moTaskLogClick(Sender: TObject);
begin
  with dmData do
  If NOT fmLogTask.Visible Then
  begin
    try
      qViewLogTask.Close;
      qViewLogTask.Open;
    except
    end;
    qViewLogTask.Last;
  end;
  fmLogTask.Show;
end;

procedure TfmMain.moTimeScanClick(Sender: TObject);
begin
  if moTimeScan.Checked then
  begin
    gTimeScan := False;
    moTimeScan.Checked := False;
    mpTimeScan.Checked := False;
    gTimeScanHint := TIMESCANRUN;
  end else
  begin
    gTimeScan := True;
    moTimeScan.Checked := True;
    mpTimeScan.Checked := True;
    gTimeScanHint := SCANNOTRUN;
  end; {if}
{  slTimeScan.Panels[0].Text := gTimeScanHint;}
end;

procedure TfmMain.moPingingClick(Sender: TObject);
begin
  if moPinging.Checked then
  begin
    gPinging := False;
    moPinging.Checked := False;
    mpPinging.Checked := False;
    gPingingHint := PINGINGRUN;
  end else
  begin
    gPinging := True;
    moPinging.Checked := True;
    mpPinging.Checked := True;
    gPingingHint := SCANNOTRUN;
  end; {if}
  slPinging.Panels[0].Text := gPingingHint;
end;

procedure TfmMain.moLoadTaskClick(Sender: TObject);
begin
  if moLoadTask.Checked then
  begin
    gLoadTask := False;
    moLoadTask.Checked := False;
    mpLoadTask.Checked := False;
    gLoadTaskHint := LOADTASKRUN;
  end else
  begin
    gLoadTask := True;
    moLoadTask.Checked := True;
    mpLoadTask.Checked := True;
    gLoadTaskHint := SCANNOTRUN;
  end; {if}
  slLoadTask.Panels[0].Text := gLoadTaskHint;
end;

function ExecAndWait(const FileName, Params: ShortString; const WinState: Word;IsWait:boolean): boolean; export;
var
  StartInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  CmdLine: ShortString;
begin
  { Помещаем имя файла между кавычками, с соблюдением всех пробелов в именах Win9x }
  CmdLine := '"' + Filename + '" ' + Params;
  FillChar(StartInfo, SizeOf(StartInfo), #0);
  with StartInfo do
  begin
    cb := SizeOf(StartInfo);
    dwFlags := STARTF_USESHOWWINDOW;
    wShowWindow := WinState;
  end;
  Result := CreateProcess(nil, PChar( String( CmdLine ) ), nil, nil, false,
                          CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil,
                          PChar(ExtractFilePath(Filename)),StartInfo,ProcInfo);
  { Ожидаем завершения приложения }
  if Result AND IsWait then
  begin
    WaitForSingleObject(ProcInfo.hProcess, INFINITE);
    { Free the Handles }
    CloseHandle(ProcInfo.hProcess);
    CloseHandle(ProcInfo.hThread);
  end;
end;


end.


