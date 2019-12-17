Program Load;

{%File 'ModelSupport\usl17load\usl17load.txvpck'}
{%File 'ModelSupport\gd17load\gd17load.txvpck'}
{%File 'ModelSupport\zast\zast.txvpck'}
{%File 'ModelSupport\depordload\depordload.txvpck'}
{%File 'ModelSupport\voznload\voznload.txvpck'}
{%File 'ModelSupport\ttn_igma\ttn_igma.txvpck'}
{%File 'ModelSupport\what\what.txvpck'}
{%File 'ModelSupport\links\links.txvpck'}
{%File 'ModelSupport\pr17load\pr17load.txvpck'}
{%File 'ModelSupport\ttn_kos\ttn_kos.txvpck'}
{%File 'ModelSupport\ins17load\ins17load.txvpck'}
{%File 'ModelSupport\ttn17dload\ttn17dload.txvpck'}
{%File 'ModelSupport\mStoreOper\mStoreOper.txvpck'}
{%File 'ModelSupport\MAIN\MAIN.txvpck'}
{%File 'ModelSupport\ttnd_igma\ttnd_igma.txvpck'}
{%File 'ModelSupport\cordload\cordload.txvpck'}
{%File 'ModelSupport\ttn17load\ttn17load.txvpck'}
{%File 'ModelSupport\partyprice\partyprice.txvpck'}
{%File 'ModelSupport\payord\payord.txvpck'}
{%File 'ModelSupport\ttn17c_pech\ttn17c_pech.txvpck'}
{%File 'ModelSupport\cord_igma\cord_igma.txvpck'}
{%File 'ModelSupport\dord_igma\dord_igma.txvpck'}
{%File 'ModelSupport\ttnd_kos\ttnd_kos.txvpck'}
{%File 'ModelSupport\sr_igma\sr_igma.txvpck'}
{%File 'ModelSupport\default.txvpck'}

uses
  Forms,
  MAIN in 'MAIN.PAS' {frmMain},
  usl17load in '..\pr17\usl17load.pas' {frmUSL17},
  ZakazLoad in '..\zakaz\ZakazLoad.pas' {frmZakaz},
  depordload in '..\depord\depordload.pas' {frmDepord},
  ttn17load in '..\ttn17\ttn17load.pas' {frmTTN17},
  ttn17dload in '..\ttn17dept\ttn17dload.pas' {frmTTN17d},
  links in 'links.pas' {frmLinks},
  ins17load in '..\gd17\ins17load.pas' {frmINS17},
  what in 'what.pas' {frmWhat},
  partyprice in 'partyprice.pas' {frmPP},
  ttn17c_pech in '..\pech\ttn17c_pech.pas' {frmTTN17c},
  ttnd_igma in '..\igma\ttnd_igma.pas' {frmIgmaTTND},
  sr_igma in 'sr_igma.pas' {frmSRigma},
  payord in '..\igma\payord.pas' {frmPayOrd},
  dord_igma in '..\koslan\dord_igma.pas' {frmIgmaDord},
  ttn_igma in '..\igma\ttn_igma.pas' {frmTTNigma},
  ttn_kos in '..\koslan\ttn_kos.pas' {frmTTNKos},
  cord_igma in '..\igma\cord_igma.pas' {frmIgmaCord},
  ttnd_kos in '..\koslan\ttnd_kos.pas' {frmTTNdKos},
  voznload in '..\pr17\voznload.pas' {frmVZ17},
  zast in 'zast.pas' {frmInfo},
  gd17load in '..\gd17\gd17load.pas' {frmGD17},
  mStoreOper in 'mStoreOper.pas' {frmStoreOper},
  pr17load in '..\pr17\pr17load.pas' {frmPR17},
  DMunit in 'DMunit.pas' {DM: TDataModule},
  EventUnit in 'EventUnit.pas' {frmEvents},
  cordload in '..\consord\cordload.pas';

{$R *.RES}

Begin
  Application.Initialize;
  frmInfo:=TFrmInfo.Create(Application);
  frmInfo.Show; frmInfo.Update;
  Application.Title := 'Интерфейс загрузки в Парус';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDM, DM);
  frmInfo.Hide; frmInfo.Free;
  Application.Run;
End.

