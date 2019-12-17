unit Options;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ComCtrls, Buttons, FileCtrl, FileUtil;

type
  TfmOptions = class(TForm)
    bbCancel: TBitBtn;
    bbSave: TBitBtn;
    upInterval: TUpDown;
    meInterval: TMaskEdit;
    Label1: TLabel;
    gb: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edFoxPro: TEdit;
    edDoPrgApp: TEdit;
    sbFoxPro: TSpeedButton;
    sbDoPrgApp: TSpeedButton;
    odFileChoice: TOpenDialog;
    Label4: TLabel;
    edDoPrgVFP: TEdit;
    sbDoPrgVFP: TSpeedButton;
    Label5: TLabel;
    edPathEventsDBF: TEdit;
    sbPathEventsDBF: TSpeedButton;
    Label6: TLabel;
    mePing: TMaskEdit;
    upPing: TUpDown;
    meLoadTask: TMaskEdit;
    upLoadTask: TUpDown;
    Label7: TLabel;
    procedure bbSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure meIntervalExit(Sender: TObject);
    procedure sbFoxProClick(Sender: TObject);
    procedure sbDoPrgAppClick(Sender: TObject);
    procedure sbDoPrgVFPClick(Sender: TObject);
    procedure sbPathEventsDBFClick(Sender: TObject);
    procedure mePingExit(Sender: TObject);
    procedure meLoadTaskExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmOptions: TfmOptions;

implementation

uses Main, Data;

{$R *.DFM}

procedure TfmOptions.bbSaveClick(Sender: TObject);
begin

  If Trim(edFoxPro.Text)<>'' Then
  if not FileExists(edFoxPro.Text) then
  begin
    MessageDlg('Файл '+ edFoxPro.Text +' не найден !', mtError, [mbOk], 0);
    edFoxPro.SetFocus;
    exit;
  end;{if}

  If Trim(edDoPrgApp.Text)<>'' Then
  if not FileExists(edDoPrgApp.Text) then
  begin
    MessageDlg('Файл '+ edDoPrgApp.Text +' не найден !', mtError, [mbOk], 0);
    edDoPrgApp.SetFocus;
  end;{if}

  If Trim(edDoPrgVFP.Text)<>'' Then
  if not FileExists(edDoPrgVFP.Text) then
  begin
    MessageDlg('Файл '+ edDoPrgVFP.Text +' не найден !', mtError, [mbOk], 0);
    edDoPrgVFP.SetFocus;
    exit;
  end;{if}

  If Trim(edPathEventsDBF.Text)<>'' Then
  if not DirExists(edPathEventsDBF.Text) then
  begin
    MessageDlg('Путь '+ edPathEventsDBF.Text +' не найден !', mtError, [mbOk], 0);
    edPathEventsDBF.SetFocus;
    exit;
  end;{if}

  with fmMain do
  begin
    gInterval := StrToInt(Trim(meInterval.Text))*60000;
    gPingInterval := StrToInt(Trim(mePing.Text))*60000;
    gLoadTaskInterval := StrToInt(Trim(meLoadTask.Text))*60000;
    tmMain.Interval := gInterval;
    tmLoadTask.Interval := gLoadTaskInterval;
    tmPing.Interval := gPingInterval;
    fmMain.gFoxPro := edFoxPro.Text;
    fmMain.gVFP := edDoPrgVFP.Text;
    fmMain.gDoPrgApp := edDoPrgApp.Text;
    fmMain.gPathEventsDBF := edPathEventsDBF.Text;

    gIniFile.WriteInteger ('Manager','Interval(min)', Round(gInterval/60000));
    gIniFile.WriteInteger ('Manager','Ping-interval(min)', Round(gPingInterval/60000));
    gIniFile.WriteInteger ('Manager','LoadTask-interval(min)', Round(gLoadTaskInterval/60000));
    gIniFile.WriteString ('Location','FoxPro', gFoxPro);
    gIniFile.WriteString ('Location','Dispatcher VFP', gVFP);
    gIniFile.WriteString ('Location','Dispatcher DoPrg.app', gDoPrgApp);
    gIniFile.WriteString ('Location','Path to Events.DBF', gPathEventsDBF);
  end;
  ModalResult:=mrOk;
end;

procedure TfmOptions.FormCreate(Sender: TObject);
begin
  meInterval.Text := IntToStr(Round(fmMain.gInterval/60000));
  mePing.Text := IntToStr(Round(fmMain.gPingInterval/60000));
  meLoadTask.Text := IntToStr(Round(fmMain.gLoadTaskInterval/60000));
  upInterval.Position := Round(fmMain.gInterval/60000);
  upPing.Position := Round(fmMain.gPingInterval/60000);
  upLoadTask.Position := Round(fmMain.gLoadTaskInterval/60000);
  edFoxPro.Text := fmMain.gFoxPro;
  edDoPrgVFP.Text := fmMain.gVFP;
  edDoPrgApp.Text := fmMain.gDoPrgApp;
  edPathEventsDBF.Text := fmMain.gPathEventsDBF;
end;

procedure TfmOptions.meIntervalExit(Sender: TObject);
begin
  if (StrToInt(meInterval.Text) > 60)
    or (StrToInt(meInterval.Text) < 1)then
  begin
    ShowMessage('Интервал должен быть в диапазоне от 1 до 60');
    meInterval.Text := '1';
    meInterval.SetFocus;
  end; {if}
end;

procedure TfmOptions.sbFoxProClick(Sender: TObject);
begin
  odFileChoice.Filter := 'Загрузочные файлы FoxPro|*.EXE;*.COM|Все файлы|*.*';
  odFileChoice.FileName := edFoxPro.Text;
  if odFileChoice.Execute then
  begin
    edFoxPro.Text := odFileChoice.FileName;
  end;{if}
end;

procedure TfmOptions.sbDoPrgAppClick(Sender: TObject);
begin
  odFileChoice.Filter := 'Исполняемые файлы FoxPro|*.APP;*.FXP;*.PRG;*.SPX;*.SPR;*.EXE|Все файлы|*.*';
  odFileChoice.FileName := edDoPrgApp.Text;
  if odFileChoice.Execute then
  begin
    edDoPrgApp.Text := odFileChoice.FileName;
  end;{if}
end;

procedure TfmOptions.sbDoPrgVFPClick(Sender: TObject);
begin
  odFileChoice.Filter := 'Загрузочные файлы Visual FoxPro|*.EXE;*.COM|Все файлы|*.*';
  odFileChoice.FileName := edDoPrgVFP.Text;
  if odFileChoice.Execute then
  begin
    edDoPrgVFP.Text := odFileChoice.FileName;
  end;{if}
end;

procedure TfmOptions.sbPathEventsDBFClick(Sender: TObject);
var
  pDir: string;
begin
  with dmData do
  begin
    pDir := edPathEventsDBF.Text;
    if SelectDirectory(pDir, [sdAllowCreate, sdPerformCreate, sdPrompt],0) then
    begin
      edPathEventsDBF.Text := pDir;
    end;{if}
  end;
end;

procedure TfmOptions.mePingExit(Sender: TObject);
begin
  if (StrToInt(mePing.Text) > 60)
    or (StrToInt(mePing.Text) < 1)then
  begin
    ShowMessage('Интервал должен быть в диапазоне от 1 до 60');
    mePing.Text := '1';
    mePing.SetFocus;
  end; {if}

end;

procedure TfmOptions.meLoadTaskExit(Sender: TObject);
begin
  if (StrToInt(meLoadTask.Text) > 60)
    or (StrToInt(meLoadTask.Text) < 1)then
  begin
    ShowMessage('Интервал должен быть в диапазоне от 1 до 60');
    meLoadTask.Text := '1';
    meLoadTask.SetFocus;
  end; {if}
end;

end.
