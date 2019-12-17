program mapView;

uses
  Forms,
  f_mapView in 'f_mapView.pas' {MainForm},
  text in 'text.pas',
  ObjectDraw in 'ObjectDraw.pas',
  PolyLine in 'PolyLine.pas',
  View in 'View.pas',
  Polygon in 'Polygon.pas',
  layer in 'layer.pas',
  MegaObject in 'MegaObject.pas',
  azs in 'azs.pas',
  Town in 'Town.pas',
  RailWay in 'RailWay.pas',
  splash in 'splash.pas' {splashDlg},
  global in 'global.pas',
  AzsInfoDlg in 'AzsInfoDlg.pas' {azsinfoF},
  azsEff in 'azsEff.pas' {azsEffDlg},
  WaitF in 'WaitF.pas' {WaitDlg},
  AlarmOptions in 'AlarmOptions.pas' {AlarmOptionsDlg},
  DatePeriod in 'DatePeriod.pas' {fDatePeriod},
  AZSQUERYDLG in 'AZSQUERYDLG.pas' {f_AzsQuery},
  remainsF in 'remainsF.pas' {RemainsDlg};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TazsinfoF, azsinfoF);
  Application.CreateForm(TazsEffDlg, azsEffDlg);
  Application.CreateForm(TWaitDlg, WaitDlg);
  Application.CreateForm(TAlarmOptionsDlg, AlarmOptionsDlg);
  Application.CreateForm(Tf_AzsQuery, f_AzsQuery);
  Application.CreateForm(TRemainsDlg, RemainsDlg);
  Application.Run;
end.
