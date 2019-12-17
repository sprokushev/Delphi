program MgrSR;

uses
  Forms,
  Windows,
  Messages,
  SysUtils,
  Main in 'Main.pas' {fmMain},
  Data in 'Data.pas' {dmData: TDataModule},
  LdTaskTh in 'LdTaskTh.pas',
  Options in 'Options.pas' {fmOptions},
  TimeTh in 'TimeTh.pas',
  PingList in 'PingList.pas' {fmPingList},
  TimeEvn in 'TimeEvn.pas' {fmTimeEvn},
  AnyForm in '..\Objects\AnyForm.pas' {fmAnyForm},
  Error in 'Error.pas' {fmError},
  Events in 'Events.pas' {fmEvents},
  LoadScreen in 'LoadScreen.pas' {fmLoadScreen},
  InfoSoft in 'InfoSoft.pas' {fmInfoSoft},
  About in 'About.pas' {fmAbout},
  Info in 'Info.pas' {fmInfo},
  LogTask in 'LogTask.pas' {fmLogTask},
  RaznView in 'RaznView.pas' {fmRaznView},
  Admin in 'Admin.pas' {fmAdmin},
  Help in 'Help.pas' {fmHelp},
  Packets in 'Packets.pas' {fmPackets},
  LoadTask in 'LoadTask.pas' {fmLoadTask},
  PingTh in 'PingTh.pas',
  LstFiles in 'LstFiles.pas' {fmListFiles},
  ScanTh in 'ScanTh.pas',
  RaznLog in 'RaznLog.pas' {fmRaznLog};

{$R *.RES}

type
  PHWND = ^HWND;

var
  OldHwnd: THandle;

function EnumWndProc (Hwnd: THandle;
  FoundWnd: PHWND): Bool; export; stdcall;
var
  ClassName, ModuleName, WinModuleName: string;
  WinInstance: THandle;
begin
  Result := True;
  SetLength (ClassName, 100);
  GetClassName (Hwnd, PChar (ClassName), Length (ClassName));
  ClassName := PChar (ClassName);
  if AnsiCompareText (ClassName, 'TfmMain') = 0 then
  begin
    SetLength (ModuleName, 200);
    SetLength (WinModuleName, 200);
    GetModuleFileName ( HInstance,
      PChar (ModuleName), Length (ModuleName));
    WinInstance := GetWindowLong (Hwnd, GWL_HINSTANCE);
    GetModuleFileName ( WinInstance,
      PChar (WinModuleName), Length (WinModuleName));
    if AnsiCompareText (ModuleName, WinModuleName) = 0 then
    begin
      FoundWnd^ := Hwnd;
      Result := False;
    end;
  end;
end;{function EnumWndProc}

begin
  OldHwnd := 0;
  EnumWindows (@EnumWndProc, Longint (@OldHwnd));
  if OldHwnd = 0 then
  begin
   fmLoadScreen := TfmLoadScreen.Create(Application);
   try
    fmLoadScreen.Show;
    fmLoadScreen.Update;
    Application.Initialize;
    Application.Title := 'Менеджер процессов';
    Application.CreateForm(TdmData, dmData);
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TfmPingList, fmPingList);
  Application.CreateForm(TfmTimeEvn, fmTimeEvn);
  Application.CreateForm(TfmAnyForm, fmAnyForm);
  Application.CreateForm(TfmError, fmError);
  Application.CreateForm(TfmEvents, fmEvents);
  Application.CreateForm(TfmInfoSoft, fmInfoSoft);
  Application.CreateForm(TfmAbout, fmAbout);
  Application.CreateForm(TfmInfo, fmInfo);
  Application.CreateForm(TfmLogTask, fmLogTask);
  Application.CreateForm(TfmRaznView, fmRaznView);
  Application.CreateForm(TfmAdmin, fmAdmin);
  Application.CreateForm(TfmHelp, fmHelp);
  Application.CreateForm(TfmPackets, fmPackets);
  Application.CreateForm(TfmLoadTask, fmLoadTask);
  Application.CreateForm(TfmListFiles, fmListFiles);
  Application.CreateForm(TfmRaznLog, fmRaznLog);
  fmLoadScreen.Hide;
   finally
    fmLoadScreen.Free;
   end;{try}
   Application.Run;
  end
  else
  begin
    if (not IsWindowVisible (OldHwnd)) then
      PostMessage (OldHwnd, wm_User, 0, 0);
    SetForegroundWindow (OldHwnd);
  end;{if}
end.
