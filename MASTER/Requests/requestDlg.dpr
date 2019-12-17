program requestDlg;

uses
  Forms,
  plan_request in 'plan_request.pas' {f_LoadPlanRequest},
  selectSheet in 'selectSheet.pas' {f_selectSheet};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tf_LoadPlanRequest, f_LoadPlanRequest);
  Application.CreateForm(Tf_selectSheet, f_selectSheet);
  Application.Run;
end.
